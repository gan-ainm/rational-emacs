
;;; custom-calendar-config.el --- Regional calendar dates  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Gan Ainm

;; Author: Gan Ainm <gan.ainm.riomhphost@gmail.com>
;; Keywords: calendar

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Regional calendar dates

;;; Code:

(setq solar-n-hemi-seasons '("Frühlingsanfang"
                             "Sommeranfang"
                             "Herbstanfang"
                             "Winteranfang")
      holiday-general-holidays '((holiday-fixed 1 1 "Neujahr")
                                 (holiday-fixed 5 1 "1. Mai")
                                 (holiday-fixed 10 3 "Tag der deutschen Einheit"))
      holiday-christian-holidays '((holiday-float 12 0 -4 "1. Advent" 24)
                                   (holiday-float 12 0 -3 "2. Advent" 24)
                                   (holiday-float 12 0 -2 "3. Advent" 24)
                                   (holiday-float 12 0 -1 "4. Advent" 24)
                                   (holiday-fixed 12 25 "1. Weihnachtstag")
                                   (holiday-fixed 12 26 "2. Weihnachtstag")
                                   (holiday-fixed 1 6 "Heilige Drei Könige")
                                   (holiday-easter-etc -48 "Rosenmontag")
                                   (holiday-easter-etc -2 "Karfreitag")
                                   (holiday-easter-etc 0 "Ostersonntag")
                                   (holiday-easter-etc +1 "Ostermontag")
                                   (holiday-easter-etc +39 "Christi Himmelfahrt")
                                   (holiday-easter-etc +49 "Pfingstsonntag")
                                   (holiday-easter-etc +50 "Pfingstmontag")
                                   (holiday-easter-etc +60 "Fronleichnam")
                                   (holiday-fixed 11 1 "Allerheiligen")
                                   (holiday-float 11 0 1 "Totensonntag"))
      holiday-bahai-holidays nil
      holiday-hebrew-holidays nil
      calendar-week-start-day 1)



(provide 'custom-calendar-config)
;;; custom-calendar-config.el ends here
