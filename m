Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B553C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 03:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486E811A43D;
	Thu, 30 May 2024 03:35:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EF211367D;
 Thu, 30 May 2024 03:35:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0594075928667619936=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe=3A_Remove_unwanted_mutex?=
 =?utf-8?q?_locking_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 03:35:29 -0000
Message-ID: <171704012962.2236840.12034361436777516847@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529221639.23117-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240529221639.23117-1-niranjana.vishwanathapura@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0594075928667619936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove unwanted mutex locking (rev4)
URL   : https://patchwork.freedesktop.org/series/134199/
State : success

== Summary ==

CI Bug Log - changes from xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1_full -> xe-pw-134199v4_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134199v4_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_balancer@many-cm-parallel-userptr:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][1] +2 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-4/igt@xe_exec_balancer@many-cm-parallel-userptr.html

  
New tests
---------

  New tests have been introduced between xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1_full and xe-pw-134199v4_full:

### New IGT tests (74) ###

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - Statuses : 1 pass(s)
    - Exec time: [5.53] s

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.08] s

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - Statuses : 3 skip(s)
    - Exec time: [0.04, 0.07] s

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - Statuses : 2 pass(s)
    - Exec time: [9.01, 14.57] s

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - Statuses : 1 pass(s)
    - Exec time: [9.02] s

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.09] s

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.08] s

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [17.80, 27.27] s

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - Statuses : 1 pass(s)
    - Exec time: [18.00] s

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.09] s

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - Statuses : 3 skip(s)
    - Exec time: [0.03, 0.08] s

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - Statuses : 1 pass(s)
    - Exec time: [4.09] s

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - Statuses : 2 pass(s)
    - Exec time: [4.0, 4.78] s

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.14] s

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - Statuses : 3 skip(s)
    - Exec time: [0.03, 0.08] s

  * igt@kms_big_fb@linear-addfb:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - Statuses : 2 pass(s)
    - Exec time: [5.46, 7.23] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - Statuses : 2 pass(s)
    - Exec time: [6.76, 7.61] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - Statuses : 3 skip(s)
    - Exec time: [0.04, 0.08] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.08] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - Statuses : 3 pass(s)
    - Exec time: [8.89, 14.12] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - Statuses : 2 pass(s)
    - Exec time: [8.98, 13.90] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - Statuses : 1 pass(s)
    - Exec time: [17.82] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [22.81, 26.34] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.09] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [3.27, 3.89] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - Statuses : 3 pass(s)
    - Exec time: [3.80, 4.58] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.08] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.14] s

  * igt@kms_big_fb@x-tiled-addfb:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.13] s

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.50] s

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.51] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 12.56] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 24.04] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 22.69] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 3.21] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 3.25] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-addfb:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-134199v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][2] ([Intel XE#1033] / [Intel XE#1214]) +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270 (NEW):
    - shard-dg2-set2:     [SKIP][4] ([Intel XE#316]) -> [SKIP][5] ([Intel XE#1201] / [Intel XE#316])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90 (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][6] ([Intel XE#1407]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90 (NEW):
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270 (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#316])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90 (NEW):
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][10] ([Intel XE#316])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270 (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][11] ([Intel XE#1124]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0 (NEW):
    - shard-dg2-set2:     [SKIP][12] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90 (NEW):
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#1124]) -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][16] ([Intel XE#1477])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#787]) +38 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#373])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#307])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#308])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][30] ([Intel XE#282]) +5 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
    - shard-dg2-set2:     [PASS][32] -> [DMESG-WARN][33] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#307])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#702])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1135] / [Intel XE#1201])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][38] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1195]) +5 other tests incomplete
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#656]) +37 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][42] ([Intel XE#1861])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#651]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#653])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][47] ([Intel XE#361]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#305]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][50] ([Intel XE#718])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1129] / [Intel XE#1201])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#734])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1122] / [Intel XE#1201])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1122])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#929]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1149] / [Intel XE#1201]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][60] ([Intel XE#1874]) +6 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1127] / [Intel XE#1201])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         NOTRUN -> [FAIL][64] ([Intel XE#771] / [Intel XE#899])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][65] ([Intel XE#899])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#455]) +25 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_vrr@flip-suspend.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][69] -> [TIMEOUT][70] ([Intel XE#1473] / [Intel XE#392])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][73] -> [TIMEOUT][74] ([Intel XE#1473])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-dg2-set2:     [PASS][76] -> [DMESG-WARN][77] ([Intel XE#1214])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-464/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#1392]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#288]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_module_load@load:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#378])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1337])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1061] / [Intel XE#1201])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][84] ([Intel XE#1191] / [Intel XE#1214])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][85] ([Intel XE#1214] / [Intel XE#1608]) +3 other tests dmesg-warn
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [PASS][86] -> [INCOMPLETE][87] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][88] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1941])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][90] ([Intel XE#1214] / [Intel XE#1760])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][92] +3 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][93] ([Intel XE#282]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#480] / [Intel XE#886]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][97] ([Intel XE#886]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - {shard-lnl}:        [INCOMPLETE][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-lnl-1/igt@kms_psr@fbc-psr-primary-page-flip.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][101] ([Intel XE#771] / [Intel XE#899]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][103] ([Intel XE#899]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - {shard-lnl}:        [FAIL][105] ([Intel XE#899]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#1195]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][109] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - {shard-lnl}:        [ABORT][111] ([Intel XE#1761]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][113] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-2/igt@xe_pm@s3-basic.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-2/igt@xe_pm@s3-basic.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#316]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#316])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1124]) -> [SKIP][118] ([Intel XE#1124] / [Intel XE#1201])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][120] ([Intel XE#1124]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][122] ([Intel XE#367]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#367]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][126] ([Intel XE#787]) +20 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][128] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1252]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#1252])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#787]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-dp-4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][136] ([Intel XE#1252])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][138] ([Intel XE#306])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#306]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][142] ([Intel XE#373]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#373]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][146] ([Intel XE#307])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][147] ([Intel XE#1188]) -> [INCOMPLETE][148] ([Intel XE#1195]) +1 other test incomplete
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-434/igt@kms_content_protection@uevent.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-433/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-dpms:
    - shard-dg2-set2:     [DMESG-WARN][149] ([Intel XE#282]) -> [DMESG-WARN][150] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_cursor_crc@cursor-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][152] ([Intel XE#308])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [INCOMPLETE][153] ([Intel XE#1195]) -> [INCOMPLETE][154] ([Intel XE#1195] / [Intel XE#927])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][155] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][156] ([Intel XE#282])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][158] ([Intel XE#323])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][160] ([Intel XE#1138])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][162] ([Intel XE#1137])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][164] ([Intel XE#1135])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][166] ([Intel XE#455]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [i915#5274]) -> [SKIP][168] ([i915#5274])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#651]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][172] ([Intel XE#651]) +15 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][174] ([Intel XE#653]) +21 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#653]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#653]) +14 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#605]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#605])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#455]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#498]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][186] ([Intel XE#305] / [Intel XE#455]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][188] ([Intel XE#305]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#929]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][192] ([Intel XE#929]) +9 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_psr@pr-cursor-plane-onoff.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][194] ([Intel XE#327]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][196] ([Intel XE#330])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][198] ([Intel XE#756])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#756]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#756])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][202] ([Intel XE#1091])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][204] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1123]) -> [SKIP][206] ([Intel XE#1123] / [Intel XE#1201])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][208] ([Intel XE#1126])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][209] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][210] ([Intel XE#1195] / [Intel XE#1473])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#288]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][214] ([Intel XE#288]) +14 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [DMESG-WARN][215] ([Intel XE#1214] / [Intel XE#1638]) -> [DMESG-WARN][216] ([Intel XE#1638])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][217] -> [SKIP][218] ([Intel XE#1192] / [Intel XE#1201])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][220] ([Intel XE#378])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_module_load@force-load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#979]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#979])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][224] ([Intel XE#366]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [DMESG-WARN][225] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][226] ([Intel XE#1195] / [Intel XE#1694])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-userptr.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][227] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][228] ([Intel XE#1162])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [DMESG-WARN][229] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][230] ([Intel XE#1195] / [Intel XE#1358])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-2/igt@xe_pm@s3-exec-after.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_pm@s3-exec-after.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#944]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][234] ([Intel XE#944]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][235] ([Intel XE#1760]) -> [DMESG-WARN][236] ([Intel XE#1214] / [Intel XE#1760])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_wedged@basic-wedged.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1 -> xe-pw-134199v4

  IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1: 55d6179b96e0390025f2ba101c03b94b50cab7a1
  xe-pw-134199v4: 134199v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/index.html

--===============0594075928667619936==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe: Remove unwanted mutex locking (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134199/">https://patchwork.freedesktop.org/series/134199/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1_full -&gt; xe-pw-134199v4_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134199v4_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_balancer@many-cm-parallel-userptr:<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-4/igt@xe_exec_balancer@many-cm-parallel-userptr.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1_full and xe-pw-134199v4_full:</p>
<h3>New IGT tests (74)</h3>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.01, 14.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [17.80, 27.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.03, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.0, 4.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.03, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-addfb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.46, 7.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.76, 7.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [8.89, 14.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.98, 13.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [22.81, 26.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [3.27, 3.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.80, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 12.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 24.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 22.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134199v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270 (NEW):</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90 (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90 (NEW):</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270 (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90 (NEW):</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270 (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0 (NEW):</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90 (NEW):</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-464/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-lnl-1/igt@kms_psr@fbc-psr-primary-page-flip.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-7/igt@kms_psr@fbc-psr-primary-page-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761">Intel XE#1761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-2/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-2/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-433/igt@kms_content_protection@uevent.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_cursor_crc@cursor-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-adlp-2/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-adlp-1/igt@xe_pm@s3-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1/shard-dg2-432/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134199v4/shard-dg2-434/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1 -&gt; xe-pw-134199v4</li>
</ul>
<p>IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1: 55d6179b96e0390025f2ba101c03b94b50cab7a1<br />
  xe-pw-134199v4: 134199v4</p>

</body>
</html>

--===============0594075928667619936==--
