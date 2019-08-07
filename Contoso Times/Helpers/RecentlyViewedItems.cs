using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    [Serializable]
    public class RecentlyViewedItems
    {
        int _count = 0;
        int[] _items = new int[3] { 0, 0, 0 };
        DateTime[] _times = new DateTime[3];

        public void AddItem(int id, DateTime time)
        {
            //
            // If the item is already recorded, move it to the head of the
            // list and update the time stamp.
            //
            for (int i = 0; i < _count; i++)
            {
                if (_items[i] == id)
                {
                    for (int j = i; j > 0; j--)
                    {
                        _items[j] = _items[j - 1];
                        _times[j] = _times[j - 1];
                    }

                    _items[0] = id;
                    _times[0] = time;
                    return;
                }
            }

            //
            // If the item isn't already recorded, add it.
            //
            for (int i = Math.Min(_count, 2); i > 0; i--)
            {
                _items[i] = _items[i - 1];
                _times[i] = _times[i - 1];
            }

            _items[0] = id;
            _times[0] = time;

            _count = Math.Min(_count + 1, 3);
        }

        public NewsItem[] GetRecentlyViewedItems()
        {
            NewsItem[] items = new NewsItem[_count];

            for (int i = 0; i < _count; i++)
                items[i] = new NewsItem(_items[i], _times[i]);

            return items;
        }
    }

    public struct NewsItem
    {
        int _ItemID;
        string _Title;
        string _TeaserText;
        DateTime _DateAndTime;

        public int ItemID
        {
            get { return _ItemID; }
            set { _ItemID = value; }
        }

        public string Title
        {
            get { return _Title; }
            set { _Title = value; }
        }

        public string TeaserText
        {
            get { return _TeaserText; }
            set { _TeaserText = value; }
        }

        public DateTime DateAndTime
        {
            get { return _DateAndTime; }
            set { _DateAndTime = value; }
        }

        public NewsItem(int id, DateTime time)
        {
            _ItemID = id;
            _DateAndTime = time;

            string text;
            News.GetNewsItemTitleAndBodyText(id, out _Title, out text);
            _TeaserText = NewsItem.GetTeaserText(text);
        }

        public static string GetTeaserText(string input)
        {
            int i = input.IndexOf("<p>");
            int j = input.IndexOf("</p>");

            if (i != -1 && j != -1 && j > i)
                return input.Substring(i + 3, j - i - 3);
            else
                return input;
        }
    }     
