Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85DDD10C03
	for <intel-xe@archiver.kernel.org>; Sat, 26 Oct 2024 19:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACE610E033;
	Sat, 26 Oct 2024 19:57:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB85710E033;
 Sat, 26 Oct 2024 19:57:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4582899442671206045=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Introduce_DRM_device_wedged_eve?=
 =?utf-8?q?nt_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 26 Oct 2024 19:57:45 -0000
Message-ID: <172997266588.1335517.13358300725084862939@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025084817.144621-1-raag.jadav@intel.com>
In-Reply-To: <20241025084817.144621-1-raag.jadav@intel.com>
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

--===============4582899442671206045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce DRM device wedged event (rev6)
URL   : https://patchwork.freedesktop.org/series/138070/
State : failure

== Summary ==

CI Bug Log - changes from xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107_full -> xe-pw-138070v6_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138070v6_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138070v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138070v6_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_legacy@torture-bo@pipe-b:
    - shard-dg2-set2:     [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-b.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-463/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-436/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-bmg:          [PASS][6] -> [DMESG-WARN][7] +1 other test dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-1/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9] +2 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-8/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-2/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - shard-lnl:          [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-5/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] +4 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-3/igt@xe_exec_threads@threads-cm-userptr.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-3/igt@xe_exec_threads@threads-cm-userptr.html

  
New tests
---------

  New tests have been introduced between xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107_full and xe-pw-138070v6_full:

### New IGT tests (2) ###

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-138070v6_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][14] ([Intel XE#911]) +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         [PASS][15] -> [FAIL][16] ([Intel XE#1874]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-2/igt@kms_async_flips@crc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-8/igt@kms_async_flips@crc.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#316])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][18] ([Intel XE#3162])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#1874])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1512])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#787]) +27 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1195] / [Intel XE#1727])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1195])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1195] / [Intel XE#2692])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1195] / [Intel XE#3113])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][39] ([Intel XE#1195] / [Intel XE#3113])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#314])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1152]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#306]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1424]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#323])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [PASS][47] -> [DMESG-WARN][48] ([Intel XE#3184])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1508])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#2958])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#301]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1421]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#886]) +5 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][57] -> [FAIL][58] ([Intel XE#301])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#886])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-463/igt@kms_flip@plain-flip-ts-check.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-436/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2957]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1397] / [Intel XE#1745])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1397])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1401]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#656]) +14 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#2333]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#651]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#651]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#653]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1470] / [Intel XE#2853])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1503])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#346])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#455]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][76] ([Intel XE#3177]) +4 other tests dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2763]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][78] -> [FAIL][79] ([Intel XE#718])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#2029])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2893])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1489])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1406])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1127])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#327])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][88] -> [FAIL][89] ([Intel XE#771] / [Intel XE#899])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#899])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][92] -> [FAIL][93] ([Intel XE#899])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          NOTRUN -> [FAIL][94] ([Intel XE#2443]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1091] / [Intel XE#2849])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          NOTRUN -> [FAIL][96] ([Intel XE#2667])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2905]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@resume-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2905]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][99] -> [FAIL][100] ([Intel XE#1600])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#688]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2322])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1392]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#288]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - shard-dg2-set2:     [PASS][105] -> [DMESG-WARN][106] ([Intel XE#3230])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-464/igt@xe_exec_threads@threads-mixed-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-466/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [PASS][107] -> [SKIP][108] ([Intel XE#1192])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2541])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2284] / [Intel XE#366])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][111] -> [ABORT][112] ([Intel XE#1358] / [Intel XE#1607])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][113] -> [ABORT][114] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][115] -> [ABORT][116] ([Intel XE#1794])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-3/igt@xe_pm@s4-vm-bind-userptr.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          NOTRUN -> [FAIL][117] ([Intel XE#958])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#944]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#944]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][120] ([Intel XE#827]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][122] ([Intel XE#1701]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [FAIL][124] ([Intel XE#1426]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][126] ([Intel XE#1426]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#877]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][130] ([Intel XE#3113]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1195]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][134] ([Intel XE#301]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][136] ([Intel XE#2955]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][138] -> [PASS][139] +6 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][140] ([Intel XE#301]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][142] ([Intel XE#2882]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-5/igt@kms_flip@plain-flip-ts-check.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html
    - shard-adlp:         [FAIL][144] ([Intel XE#886]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@kms_flip@plain-flip-ts-check.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][146] ([Intel XE#886]) -> [PASS][147] +7 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-WARN][148] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:
    - shard-lnl:          [FAIL][150] ([Intel XE#1491]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][152] ([Intel XE#1874]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][154] ([Intel XE#1503]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][156] ([Intel XE#2042]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-lnl:          [DMESG-WARN][158] ([Intel XE#3184]) -> [PASS][159] +2 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [FAIL][160] ([Intel XE#3245]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          [FAIL][162] ([Intel XE#2948]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][164] -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-5/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][166] ([Intel XE#1473]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-adlp:         [DMESG-WARN][168] -> [PASS][169] +3 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-2/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-lnl:          [DMESG-WARN][170] -> [PASS][171] +5 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-4/igt@xe_exec_fault_mode@many-invalid-fault.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-dg2-set2:     [DMESG-WARN][172] -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-adlp:         [DMESG-WARN][174] ([Intel XE#358]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-4/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][176] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [DMESG-FAIL][178] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][179] ([Intel XE#1861])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][180] -> [FAIL][181] ([Intel XE#2333])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#2957]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
  [Intel XE#3177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#3245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3245
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107 -> xe-pw-138070v6

  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107: 8fb857e3bba9a5e5fa43d99cf5863608cde9c107
  xe-pw-138070v6: 138070v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/index.html

--===============4582899442671206045==
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
<tr><td><b>Series:</b></td><td>Introduce DRM device wedged event (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138070/">https://patchwork.freedesktop.org/series/138070/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107_full -&gt; xe-pw-138070v6_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138070v6_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138070v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138070v6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_content_protection@legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-b.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-463/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-436/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-1/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-8/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-2/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-5/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-3/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-3/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107_full and xe-pw-138070v6_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138070v6_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-2/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-8/igt@kms_async_flips@crc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162">Intel XE#3162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-463/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-436/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957">Intel XE#2957</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-464/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-466/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-5/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3245">Intel XE#3245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-5/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-2/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-4/igt@xe_exec_fault_mode@many-invalid-fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-1/igt@xe_exec_threads@threads-hang-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-4/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107 -&gt; xe-pw-138070v6</li>
</ul>
<p>IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107: 8fb857e3bba9a5e5fa43d99cf5863608cde9c107<br />
  xe-pw-138070v6: 138070v6</p>

</body>
</html>

--===============4582899442671206045==--
