Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A64C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 20:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE59110E192;
	Thu, 22 May 2025 20:46:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E85910E192;
 Thu, 22 May 2025 20:46:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4549692256744142720=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/vrr=3A_Set_vrr=2E?=
 =?utf-8?q?vmin_to_min_Vtotal_to_re-enable_LRR_for_PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 20:46:19 -0000
Message-ID: <174794677929.15807.14378087749456885516@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250509031107.958280-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250509031107.958280-1-ankit.k.nautiyal@intel.com>
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

--===============4549692256744142720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=3D=3D Series Details =3D=3D

Series: drm/i915/vrr: Set vrr.vmin to min Vtotal to re-enable LRR for PTL (=
rev2)
URL   : https://patchwork.freedesktop.org/series/148787/
State : failure

=3D=3D Summary =3D=3D

CI Bug Log - changes from xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b_=
FULL -> xe-pw-148787v2_FULL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148787v2_FULL absolutely need t=
o be
  verified manually.
 =20
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148787v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in C=
I.

 =20

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-14878=
7v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     ([PASS][1], [PASS][2]) -> [DMESG-WARN][3]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclos=
e.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclos=
e.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-=
435/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp=
-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-adlp:         ([PASS][5], [PASS][6]) -> [SKIP][7] +3 other test=
s skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_pipe_crc_basic@nonblocking-crc=
-frame-sequence.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_pipe_crc_basic@nonblocking-crc=
-frame-sequence.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp=
-3/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@invalid-get-prop:
    - shard-adlp:         [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_prop_blob@invalid-get-prop.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp=
-3/igt@kms_prop_blob@invalid-get-prop.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-dg2-set2:     ([PASS][10], [PASS][11]) -> [INCOMPLETE][12] +1 o=
ther test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_properties@connector-propert=
ies-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_properties@connector-propert=
ies-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-433/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          ([PASS][13], [PASS][14]) -> [ABORT][15] +3 other =
tests abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_vrr@flip-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@kms_vrr@flip-dpms.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-3/igt@kms_vrr@flip-dpms.html

 =20
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-adlp:         [SKIP][16] ([Intel XE#651]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-=
primscrn-spr-indfb-move.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         ([SKIP][18], [SKIP][19]) ([Intel XE#651]) -> [SKI=
P][20]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-=
1p-offscren-pri-indfb-draw-mmap-wc.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-=
1p-offscren-pri-indfb-draw-mmap-wc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc=
.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         ([SKIP][21], [SKIP][22]) ([Intel XE#656]) -> [SKI=
P][23] +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-scndscrn-indfb-pgflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-scndscrn-indfb-pgflip-blt.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][24] ([Intel XE#656]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-shrfb-draw-render.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.h=
tml

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         ([SKIP][26], [SKIP][27]) ([Intel XE#653]) -> [SKI=
P][28] +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb101010-draw-blt.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb101010-draw-blt.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         ([SKIP][29], [SKIP][30]) ([Intel XE#3012]) -> [SK=
IP][31]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         ([SKIP][32], [SKIP][33]) ([Intel XE#836]) -> [SKI=
P][34]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         ([SKIP][35], [SKIP][36]) ([Intel XE#1489]) -> [SK=
IP][37] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area-big-fb.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area-big-fb.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-adlp:         ([SKIP][38], [SKIP][39]) ([Intel XE#2850] / [Inte=
l XE#929]) -> [SKIP][40]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_psr@fbc-psr-cursor-blt.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         [SKIP][41] ([Intel XE#3414]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_rotation_crc@primary-rotation=
-270.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_rotation_crc@primary-rotation-270.html

 =20
Known issues
------------

  Here are the changes found in xe-pw-148787v2_FULL that come from known is=
sues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         ([PASS][43], [PASS][44]) -> [SKIP][45] ([Intel XE=
#4963])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclos=
e.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclos=
e.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-=
1:
    - shard-lnl:          ([PASS][46], [PASS][47]) -> [FAIL][48] ([Intel XE=
#911]) +3 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear@pipe-c-edp-1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear@pipe-c-edp-1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         ([PASS][49], [PASS][50]) -> [DMESG-WARN][51] ([In=
tel XE#4543]) +1 other test dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_async_flips@invalid-async-fli=
p-atomic@pipe-c-hdmi-a-1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_async_flips@invalid-async-fli=
p-atomic@pipe-c-hdmi-a-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-6/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1124]) +2 other t=
ests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#316])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         ([PASS][54], [PASS][55]) -> [SKIP][56] ([Intel XE=
#4996]) +10 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-=
32bpp-rotate-0-hflip.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-=
32bpp-rotate-0-hflip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][57] ([Intel XE#4543])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.=
html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1124]) +2 other t=
ests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#607])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#607])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         ([PASS][61], [PASS][62]) -> [DMESG-FAIL][63] ([In=
tel XE#4543]) +12 other tests dmesg-fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-=
32bpp-rotate-180-async-flip.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-=
32bpp-rotate-180-async-flip.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1124]) +2 other t=
ests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1124]) +7 other t=
ests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#610])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          ([PASS][67], [PASS][68]) -> [SKIP][69] ([Intel XE=
#2314] / [Intel XE#2894])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-d=
isplays-2160x1440p.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-d=
isplays-2160x1440p.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#2191]) +1 other t=
est skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2314] / [Intel XE=
#2894]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2191]) +1 other t=
est skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2191])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#367])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#455] / [Intel XE#=
787]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2887]) +4 other t=
ests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2887]) +3 other t=
ests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#787]) +76 other t=
ests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#787]) +11 other t=
ests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#3442])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#3432]) +1 other t=
est skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#3432])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          ([PASS][83], [PASS][84]) -> [DMESG-WARN][85] ([In=
tel XE#3428]) +1 other test dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-=
tiled-bmg-ccs.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-=
tiled-bmg-ccs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#455] / [Intel XE#=
787]) +19 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][87] ([Intel XE#4212])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     ([PASS][88], [PASS][89]) -> [INCOMPLETE][90] ([In=
tel XE#1727] / [Intel XE#3113])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-a-dp-4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-a-dp-4.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][91] -> [INCOMPLETE][92] ([Intel XE#1727] /=
 [Intel XE#3113] / [Intel XE#3124])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#373]) +6 other te=
sts skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#373]) +1 other te=
st skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-5/igt@kms_chamelium_edid@vga-edid-read.html
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2252])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-8/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#4950] / [Intel XE=
#4996]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#373]) +1 other te=
st skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#1178]) +1 other t=
est fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-434/igt@kms_content_protection@atomic-dpms.html
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#3278])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-7/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2341])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#308])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-4/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2321]) +1 other =
test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2321])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1424])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2320])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#308]) +2 other t=
ests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-adlp:         ([PASS][107], [PASS][108]) -> [SKIP][109] ([Intel=
 XE#4950] / [Intel XE#4996]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#309])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#309]) +1 other t=
est skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          ([PASS][112], [PASS][113]) -> [SKIP][114] ([Intel=
 XE#2291]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4210])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1508])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          ([PASS][117], [PASS][118]) -> [SKIP][119] ([Intel=
 XE#3009])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_dp_aux_dev.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_dp_aux_dev.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_dp_aux_dev.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4422])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#4945] / [Intel X=
E#4996])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          ([PASS][122], [PASS][123]) -> [SKIP][124] ([Intel=
 XE#2373])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_feature_discovery@display-2x.=
html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_feature_discovery@display-2x.=
html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#310])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2316])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1421]) +1 other =
test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][128] ([Intel XE#301]) +7 other t=
ests fail
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          ([PASS][129], [PASS][130]) -> [SKIP][131] ([Intel=
 XE#2316]) +10 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          ([PASS][132], [PASS][133]) -> [FAIL][134] ([Intel=
 XE#2882] / [Intel XE#3098])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          ([PASS][135], [PASS][136]) -> [FAIL][137] ([Intel=
 XE#3098])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible@ab-dp2-hdmi-a3.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible@ab-dp2-hdmi-a3.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          ([PASS][138], [PASS][139]) -> [FAIL][140] ([Intel=
 XE#2882]) +1 other test fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible@ad-dp2-hdmi-a3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible@ad-dp2-hdmi-a3.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          ([PASS][141], [PASS][142]) -> [FAIL][143] ([Intel=
 XE#3321]) +1 other test fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a=
-dp2.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a=
-dp2.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][144] ([Intel XE#301] / [Intel XE=
#3321]) +1 other test fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     ([PASS][145], [PASS][146]) -> [INCOMPLETE][147] (=
[Intel XE#2049] / [Intel XE#2597])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interr=
uptible.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interr=
uptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][148] -> [INCOMPLETE][149] ([Intel XE#2049]=
 / [Intel XE#2597])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interr=
uptible@d-dp4.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         ([PASS][150], [PASS][151]) -> [DMESG-WARN][152] (=
[Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-=
a1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-=
a1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:
    - shard-adlp:         ([PASS][153], [PASS][154]) -> [FAIL][155] ([Intel=
 XE#2882]) +3 other tests fail
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-=
interruptible@c-hdmi-a1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_flip@plain-flip-fb-recreate-=
interruptible@c-hdmi-a1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscalin=
g@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2293]) +2 other =
tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscalin=
g@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1401] / [Intel X=
E#1745])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.=
html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@=
pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#1401])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@=
pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-adlp:         [PASS][159] -> [SKIP][160] ([Intel XE#2351])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-16bpp-linear-upscaling.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.ht=
ml

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][161] ([Intel XE#4683]) +1 other =
test fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2293] / [Intel X=
E#2380]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pip=
e-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#455]) +13 other =
tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@p=
ipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][164] -> [DMESG-FAIL][165] ([Intel XE#4543]=
) +3 other tests dmesg-fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_flip_tiling@flip-change-tili=
ng@pipe-b-hdmi-a-1-y-to-y.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#651]) +2 other t=
ests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#656]) +6 other t=
ests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#651]) +19 other =
tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#4141])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#656]) +9 other t=
ests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#651]) +5 other t=
ests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2311]) +6 other =
tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#1151])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2312]) +6 other =
tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#653]) +14 other =
tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render=
.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#4996])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#653])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2313]) +2 other =
tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2927])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     ([PASS][180], [PASS][181]) -> [FAIL][182] ([Intel=
 XE#616]) +3 other tests fail
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a=
-hdmi-a-6-size-64.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a=
-hdmi-a-6-size-64.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#599]) +1 other t=
est skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#2393])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#455]) +4 other t=
ests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2763] / [Intel X=
E#455]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.h=
tml

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pip=
e-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#2763]) +5 other =
tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@p=
ipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         NOTRUN -> [SKIP][188] ([Intel XE#2763] / [Intel X=
E#455]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#2763]) +4 other =
tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#2763]) +7 other =
tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.=
html
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#2763]) +2 other =
tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a=
.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:
    - shard-adlp:         ([PASS][192], [PASS][193]) -> [DMESG-WARN][194] (=
[Intel XE#4173]) +3 other tests dmesg-warn
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-20x20@pipe-a.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-20x20@pipe-a.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a=
.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#908])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#1439] / [Intel X=
E#836])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#2893] / [Intel X=
E#4608])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#1489])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#1489])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-=
1:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#4608]) +2 other =
tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-=
1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#1489]) +5 other =
tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#1122])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#2387])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#1122])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#1128])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#1406]) +2 other =
tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#4609])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#2234] / [Intel X=
E#2850]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#2850] / [Intel X=
E#929]) +7 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-433/igt@kms_psr@psr2-sprite-plane-move.html
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#2850] / [Intel X=
E#929]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          ([PASS][211], [PASS][212]) -> [SKIP][213] ([Intel=
 XE#4692])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-adlp:         [PASS][214] -> [SKIP][215] ([Intel XE#4996]) +1 o=
ther test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_rmfb@rmfb-ioctl.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#1127])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-lnl:          NOTRUN -> [SKIP][217] ([Intel XE#1127])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          ([PASS][218], [PASS][219]) -> [FAIL][220] ([Intel=
 XE#2883]) +2 other tests fail
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.ht=
ml
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.ht=
ml
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#2426])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#362])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          ([PASS][223], [PASS][224]) -> [ABORT][225] ([Inte=
l XE#1727]) +5 other tests abort
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_vrr@flip-basic.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][226] -> [ABORT][227] ([Intel XE#1727]) +1 =
other test abort
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@kms_vrr@max-min.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-6/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][228] ([Intel XE#756])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][229] ([Intel XE#756]) +1 other t=
est skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_writeback@writeback-pixel-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#756])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#756])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@runner@aborted:
    - shard-bmg:          NOTRUN -> ([FAIL][232], [FAIL][233], [FAIL][234],=
 [FAIL][235], [FAIL][236], [FAIL][237]) ([Intel XE#5080])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@runner@aborted.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][238] ([Intel XE#1062])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@xe_create@create-big-vram.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#4497]) +1 other =
test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#4497])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@discovery-empty:
    - shard-lnl:          NOTRUN -> [SKIP][241] ([Intel XE#4837]) +3 other =
tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#4837]) +1 other =
test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@xe_eudebug_online@set-breakpoint.html
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#4837]) +2 other =
tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-1/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#4837]) +5 other =
tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-433/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][245] ([Intel XE#261] / [Intel XE=
#688])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_evict@evict-beng-small-cm.html
    - shard-lnl:          NOTRUN -> [SKIP][246] ([Intel XE#688])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
    - shard-adlp:         ([PASS][247], [PASS][248]) -> [SKIP][249] ([Intel=
 XE#4945]) +23 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exec_balancer@many-execqueues=
-cm-parallel-rebind.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_exec_balancer@many-execqueues=
-cm-parallel-rebind.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#2322]) +1 other =
test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     ([PASS][251], [PASS][252]) -> [SKIP][253] ([Intel=
 XE#1392])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-bind.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-bind.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][254] ([Intel XE#1392]) +1 other =
test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][255] ([Intel XE#1392]) +1 other =
test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [PASS][256] -> [SKIP][257] ([Intel XE#1392])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@xe_exec_basic@multigpu-once-nul=
l-defer-mmap.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-adlp:         NOTRUN -> [SKIP][258] ([Intel XE#288]) +4 other t=
ests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-8/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][259] ([Intel XE#288]) +16 other =
tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][260] ([Intel XE#2360])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#2360])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][262] ([Intel XE#4943]) +8 other =
tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.h=
tml

  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][263] ([Intel XE#4943]) +9 other =
tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][264] ([Intel XE#4915]) +58 other=
 tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nom=
emset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][265] ([Intel XE#4915]) +153 othe=
r tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-n=
omemset.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][266] ([Intel XE#4945])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][267] ([Intel XE#584])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][268] ([Intel XE#2541] / [Intel X=
E#3573]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-adlp:         NOTRUN -> [SKIP][269] ([Intel XE#2541] / [Intel X=
E#3573] / [Intel XE#4501])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-8/igt@xe_oa@syncs-syncobj-wait.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][270] ([Intel XE#2541] / [Intel X=
E#3573] / [Intel XE#4501])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-433/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#2284] / [Intel X=
E#366]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-433/igt@xe_pm@d3cold-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][272] ([Intel XE#2284] / [Intel X=
E#366])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-3/igt@xe_pm@d3cold-mmap-vram.html
    - shard-adlp:         NOTRUN -> [SKIP][273] ([Intel XE#2284] / [Intel X=
E#366])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][274] -> [ABORT][275] ([Intel XE#1794])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][276] ([Intel XE#579])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][277] ([Intel XE#4733]) +1 other =
test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-6/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][278] ([Intel XE#4733])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][279] ([Intel XE#944]) +1 other t=
est skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-adlp:         NOTRUN -> [SKIP][280] ([Intel XE#944])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-bmg:          NOTRUN -> [SKIP][281] ([Intel XE#944])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][282] ([Intel XE#4814])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#4273])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-2/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_vm@large-split-misaligned-binds-134217728:
    - shard-adlp:         ([PASS][284], [PASS][285]) -> [SKIP][286] ([Intel=
 XE#4945] / [Intel XE#4996]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_vm@large-split-misaligned-bin=
ds-134217728.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@xe_vm@large-split-misaligned-bin=
ds-134217728.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_vm@large-split-misaligned-binds-134217728.html

  * igt@xe_vm@large-userptr-split-binds-16777216:
    - shard-adlp:         [PASS][287] -> [SKIP][288] ([Intel XE#4945]) +6 o=
ther tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_vm@large-userptr-split-binds-=
16777216.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_vm@large-userptr-split-binds-16777216.html

 =20
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     ([SKIP][289], [SKIP][290]) ([Intel XE#4208]) -> [=
PASS][291] +9 other tests pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@core_hotunplug@unbind-rebind.ht=
ml
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@core_hotunplug@unbind-rebind.ht=
ml
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-433/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-=
a-1-y:
    - shard-adlp:         [DMESG-WARN][292] ([Intel XE#4543]) -> [PASS][293=
] +3 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_async_flips@async-flip-with-=
page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi=
-a-1-y.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         ([DMESG-FAIL][294], [DMESG-FAIL][295]) ([Intel XE=
#4543]) -> [PASS][296] +4 other tests pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-1=
80.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-1=
80.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         ([DMESG-FAIL][297], [PASS][298]) ([Intel XE#4543]=
) -> [PASS][299]
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-async-flip.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-async-flip.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][300] ([Intel XE#4543]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-180-hflip-async-flip.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][302] ([Intel XE#1727] / [Intel XE#31=
13] / [Intel XE#3124]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     ([PASS][304], [INCOMPLETE][305]) ([Intel XE#3124]=
) -> [PASS][306]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-b-dp-4.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-b-dp-4.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     ([DMESG-WARN][307], [PASS][308]) ([Intel XE#1727]=
 / [Intel XE#3113]) -> [PASS][309]
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-dg2-set2:     ([SKIP][310], [SKIP][311]) ([Intel XE#4208] / [i9=
15#2575]) -> [PASS][312] +5 other tests pass
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-mov=
ement-256x85.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-mov=
ement-256x85.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          ([SKIP][313], [PASS][314]) ([Intel XE#2291]) -> [=
PASS][315] +3 other tests pass
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flip=
b-atomic-transitions-varying-size.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flip=
b-atomic-transitions-varying-size.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.=
html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][316] ([Intel XE#2291]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flip=
b-toggle.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     ([FAIL][318], [FAIL][319]) ([Intel XE#301] / [Int=
el XE#3321]) -> [PASS][320]
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@bd-hdmi-a6-dp4.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@bd-hdmi-a6-dp4.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.h=
tml

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     ([FAIL][321], [PASS][322]) ([Intel XE#301]) -> [P=
ASS][323]
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@cd-hdmi-a6-dp4.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@cd-hdmi-a6-dp4.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.h=
tml

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          ([SKIP][324], [PASS][325]) ([Intel XE#2316]) -> [=
PASS][326] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:
    - shard-dg2-set2:     ([PASS][327], [FAIL][328]) ([Intel XE#3549]) -> [=
PASS][329] +4 other tests pass
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vb=
lank-interruptible@d-dp4.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vb=
lank-interruptible@d-dp4.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         ([DMESG-WARN][330], [DMESG-WARN][331]) ([Intel XE=
#2953] / [Intel XE#4173]) -> [PASS][332] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interru=
ptible.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interru=
ptible.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         ([DMESG-WARN][333], [PASS][334]) ([Intel XE#2953]=
 / [Intel XE#4173]) -> [PASS][335] +1 other test pass
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interru=
ptible@d-hdmi-a1.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interru=
ptible@d-hdmi-a1.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][336] ([Intel XE#886]) -> [PASS][337] +1 ot=
her test pass
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp=
1.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          ([SKIP][338], [PASS][339]) ([Intel XE#1503]) -> [=
PASS][340]
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@static-swap.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_hdr@static-swap.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_hdr@static-swap.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          ([PASS][341], [SKIP][342]) ([Intel XE#4596]) -> [=
PASS][343]
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none=
.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none=
.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_properties@get_properties-sanity-atomic:
    - shard-bmg:          ([FAIL][344], [FAIL][345]) ([Intel XE#5017]) -> [=
PASS][346]
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_properties@get_properties-san=
ity-atomic.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_properties@get_properties-san=
ity-atomic.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-3/igt@kms_properties@get_properties-sanity-atomic.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-adlp:         ([FAIL][347], [FAIL][348]) ([Intel XE#5017]) -> [=
PASS][349] +1 other test pass
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_properties@get_properties-sa=
nity-non-atomic.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_properties@get_properties-sa=
nity-non-atomic.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-2/igt@kms_properties@get_properties-sanity-non-atomic.html
    - shard-dg2-set2:     ([FAIL][350], [FAIL][351]) ([Intel XE#5017]) -> [=
PASS][352] +1 other test pass
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_properties@get_properties-s=
anity-non-atomic.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_properties@get_properties-s=
anity-non-atomic.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_properties@get_properties-sanity-non-atomic.html
    - shard-lnl:          ([FAIL][353], [FAIL][354]) ([Intel XE#5017]) -> [=
PASS][355] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_properties@get_properties-san=
ity-non-atomic.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@kms_properties@get_properties-san=
ity-non-atomic.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_psr@psr2-primary-render:
    - shard-lnl:          ([FAIL][356], [FAIL][357]) ([Intel XE#3924]) -> [=
PASS][358] +1 other test pass
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_psr@psr2-primary-render.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@kms_psr@psr2-primary-render.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@kms_psr@psr2-primary-render.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     ([SKIP][359], [PASS][360]) ([Intel XE#1392]) -> [=
PASS][361] +12 other tests pass
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-mmap.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-mmap.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][362], [PASS][363], [PASS][364], [PASS][36=
5], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS]=
[371], [SKIP][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PA=
SS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], =
[PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388=
], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][=
394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PAS=
S][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [=
PASS][406], [PASS][407], [PASS][408], [PASS][409]) ([Intel XE#378]) -> ([PA=
SS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415], =
[PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421=
], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][=
427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PAS=
S][433], [PASS][434])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-6/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-7/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-8/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-8/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-6/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-2/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-6/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-3/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-8/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-8/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-4/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-2/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-3/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-3/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-2/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-7/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-7/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-5/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-1/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          ([PASS][435], [ABORT][436]) ([Intel XE#5087]) -> =
[PASS][437]
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@reload-no-display.=
html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@reload-no-display.=
html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          ([ABORT][438], [PASS][439]) ([Intel XE#1794]) -> =
[PASS][440]
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-6/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         ([PASS][441], [ABORT][442]) ([Intel XE#1794]) -> =
[PASS][443]
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_pm@s4-vm-bind-userptr.html

 =20
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-adlp:         ([SKIP][444], [SKIP][445]) ([Intel XE#1124]) -> [=
SKIP][446] ([Intel XE#4947] / [Intel XE#4996])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         ([SKIP][447], [SKIP][448]) ([Intel XE#1124]) -> [=
SKIP][449] ([Intel XE#4996])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-adlp:         ([SKIP][450], [SKIP][451]) ([Intel XE#316]) -> [S=
KIP][452] ([Intel XE#4996])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         ([DMESG-WARN][453], [PASS][454]) ([Intel XE#4173]=
) -> [DMESG-FAIL][455] ([Intel XE#4543])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         [SKIP][456] ([Intel XE#316]) -> [SKIP][457] ([Int=
el XE#2351] / [Intel XE#4996])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-=
270.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     ([SKIP][458], [SKIP][459]) ([Intel XE#2351] / [In=
tel XE#4208]) -> [SKIP][460] ([Intel XE#1124])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotat=
e-0.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotat=
e-0.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-adlp:         ([SKIP][461], [SKIP][462]) ([Intel XE#1124]) -> [=
SKIP][463] ([Intel XE#2351] / [Intel XE#4996])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         [SKIP][464] ([Intel XE#2191]) -> [SKIP][465] ([In=
tel XE#4996])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2=
-displays-1920x1080p.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         ([SKIP][466], [SKIP][467]) ([Intel XE#367]) -> [S=
KIP][468] ([Intel XE#4996])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-=
3840x2160p.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-=
3840x2160p.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][469] ([Intel XE#455] / [Intel XE#787]) -> =
[SKIP][470] ([Intel XE#4996]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-rc-ccs.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     ([SKIP][471], [SKIP][472]) ([Intel XE#2351] / [In=
tel XE#4208]) -> [SKIP][473] ([Intel XE#455] / [Intel XE#787])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tile=
d-gen12-rc-ccs.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tile=
d-gen12-rc-ccs.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         ([SKIP][474], [SKIP][475]) ([Intel XE#455] / [Int=
el XE#787]) -> [SKIP][476] ([Intel XE#4996]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tile=
d-mtl-rc-ccs.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-4-tile=
d-mtl-rc-ccs.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     ([SKIP][477], [SKIP][478]) ([Intel XE#4208]) -> [=
SKIP][479] ([Intel XE#455] / [Intel XE#787])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-t=
iled-mtl-mc-ccs.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-t=
iled-mtl-mc-ccs.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     ([INCOMPLETE][480], [PASS][481]) ([Intel XE#1727]=
 / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][482=
] ([Intel XE#2705] / [Intel XE#4212])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-mc-ccs.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-mc-ccs.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     ([PASS][483], [INCOMPLETE][484]) ([Intel XE#1727]=
 / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][485=
] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     ([INCOMPLETE][486], [INCOMPLETE][487]) ([Intel XE=
#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#42=
12]) -> [INCOMPLETE][488] ([Intel XE#1727] / [Intel XE#3113])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         ([SKIP][489], [SKIP][490]) ([Intel XE#4417] / [In=
tel XE#455]) -> [SKIP][491] ([Intel XE#4996])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_cdclk@mode-transition.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cdclk@mode-transition.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         ([SKIP][492], [SKIP][493]) ([Intel XE#306]) -> [S=
KIP][494] ([Intel XE#4996])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_chamelium_color@ctm-negative=
.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_chamelium_color@ctm-negative=
.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-adlp:         ([SKIP][495], [SKIP][496]) ([Intel XE#373]) -> [S=
KIP][497] ([Intel XE#4996])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-after-=
suspend.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-after-=
suspend.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         ([SKIP][498], [SKIP][499]) ([Intel XE#455]) -> [S=
KIP][500] ([Intel XE#4996]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_content_protection@atomic.ht=
ml
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_content_protection@atomic.ht=
ml
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          ([FAIL][501], [FAIL][502]) ([Intel XE#1188]) -> [=
SKIP][503] ([Intel XE#2341])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_content_protection@uevent.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_content_protection@uevent.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         ([SKIP][504], [SKIP][505]) ([Intel XE#309]) -> [S=
KIP][506] ([Intel XE#4996])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          ([SKIP][507], [PASS][508]) ([Intel XE#2291]) -> [=
SKIP][509] ([Intel XE#2291]) +3 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flip=
b-atomic-transitions-varying-size.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flip=
b-atomic-transitions-varying-size.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.=
html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     ([SKIP][510], [SKIP][511]) ([Intel XE#2351] / [In=
tel XE#4208]) -> [SKIP][512] ([Intel XE#455])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.h=
tml
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.h=
tml
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          ([PASS][513], [SKIP][514]) ([Intel XE#4302]) -> [=
SKIP][515] ([Intel XE#4302])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_display_modes@extended-mode-b=
asic.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_display_modes@extended-mode-b=
asic.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     ([SKIP][516], [SKIP][517]) ([Intel XE#4208] / [i9=
15#2575]) -> [FAIL][518] ([Intel XE#301])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vbl=
ank.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vbl=
ank.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          ([FAIL][519], [FAIL][520]) ([Intel XE#3321]) -> [=
SKIP][521] ([Intel XE#2316])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     ([PASS][522], [FAIL][523]) ([Intel XE#301]) -> [F=
AIL][524] ([Intel XE#301]) +1 other test fail
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@ad-hdmi-a6-dp4.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@ad-hdmi-a6-dp4.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.h=
tml

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         ([SKIP][525], [SKIP][526]) ([Intel XE#310]) -> [S=
KIP][527] ([Intel XE#4996])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_flip@2x-flip-vs-panning.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          ([SKIP][528], [PASS][529]) ([Intel XE#2316]) -> [=
SKIP][530] ([Intel XE#2316]) +3 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_flip@2x-plain-flip.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     ([SKIP][531], [SKIP][532]) ([Intel XE#2351] / [In=
tel XE#4208]) -> [SKIP][533] ([Intel XE#651])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-shrfb-pgflip-blt.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-shrfb-pgflip-blt.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         ([SKIP][534], [SKIP][535]) ([Intel XE#656]) -> [S=
KIP][536] ([Intel XE#4947])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-indfb-pgflip-blt.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-indfb-pgflip-blt.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][537], [SKIP][538]) ([Intel XE#2311]) -> [=
SKIP][539] ([Intel XE#2312]) +21 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-pri-indfb-draw-mmap-wc.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-pri-indfb-draw-mmap-wc.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.ht=
ml

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][540] ([Intel XE#2312]) -> [SKIP][541] ([In=
tel XE#4141]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-onoff.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         ([SKIP][542], [SKIP][543]) ([Intel XE#656]) -> [S=
KIP][544] ([Intel XE#4996])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-shrfb-pgflip-blt.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-shrfb-pgflip-blt.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][545] ([Intel XE#4141]) -> [SKIP][546] ([In=
tel XE#2312])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-shrfb-plflip-blt.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          ([SKIP][547], [SKIP][548]) ([Intel XE#4141]) -> [=
SKIP][549] ([Intel XE#2312]) +6 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-cur-indfb-draw-render.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-cur-indfb-draw-render.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][550], [SKIP][551]) ([Intel XE#2312] / [In=
tel XE#4141]) -> [SKIP][552] ([Intel XE#4141])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-pri-shrfb-draw-mmap-wc.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-pri-shrfb-draw-mmap-wc.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          ([SKIP][553], [SKIP][554]) ([Intel XE#2312] / [In=
tel XE#4141]) -> [SKIP][555] ([Intel XE#2312]) +4 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-spr-indfb-draw-render.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-spr-indfb-draw-render.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][556] ([Intel XE#651]) -> [SKIP][557] ([Int=
el XE#2351])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-pri-shrfb-draw-blt.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.ht=
ml

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          ([SKIP][558], [SKIP][559]) ([Intel XE#2311] / [In=
tel XE#2312]) -> [SKIP][560] ([Intel XE#2311]) +4 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-primscrn-indfb-pgflip-blt.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-primscrn-indfb-pgflip-blt.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          ([SKIP][561], [SKIP][562]) ([Intel XE#2311] / [In=
tel XE#2312]) -> [SKIP][563] ([Intel XE#2312]) +6 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-primscrn-pri-indfb-draw-blt.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-primscrn-pri-indfb-draw-blt.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][564] ([Intel XE#656]) -> [SKIP][565] ([Int=
el XE#4947])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-shrfb-pgflip-blt.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][566] ([Intel XE#2311]) -> [SKIP][567] ([In=
tel XE#2312])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-scndscrn-spr-indfb-draw-blt.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-dg2-set2:     ([SKIP][568], [SKIP][569]) ([Intel XE#4208]) -> [=
SKIP][570] ([Intel XE#651])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb565-draw-blt.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb565-draw-blt.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     ([SKIP][571], [SKIP][572]) ([Intel XE#2351] / [In=
tel XE#4208]) -> [SKIP][573] ([Intel XE#658])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrr=
s-tiling-y.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrr=
s-tiling-y.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     ([SKIP][574], [SKIP][575]) ([Intel XE#4208]) -> [=
SKIP][576] ([Intel XE#653])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-pri-shrfb-draw-render.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-pri-shrfb-draw-render.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render=
.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][577] ([Intel XE#2313]) -> [SKIP][578] ([In=
tel XE#2312]) +2 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-spr-indfb-draw-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          ([SKIP][579], [SKIP][580]) ([Intel XE#2313]) -> [=
SKIP][581] ([Intel XE#2312]) +23 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-shrfb-plflip-blt.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-shrfb-plflip-blt.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         ([SKIP][582], [SKIP][583]) ([Intel XE#653]) -> [S=
KIP][584] ([Intel XE#4996])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-=
offscren-pri-shrfb-draw-blt.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-=
offscren-pri-shrfb-draw-blt.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][585] ([Intel XE#2312]) -> [SKIP][586] ([In=
tel XE#2313]) +2 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-mmap-wc.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          ([SKIP][587], [SKIP][588]) ([Intel XE#2312] / [In=
tel XE#2313]) -> [SKIP][589] ([Intel XE#2313]) +4 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-blt.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-blt.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          ([SKIP][590], [SKIP][591]) ([Intel XE#2312] / [In=
tel XE#2313]) -> [SKIP][592] ([Intel XE#2312]) +6 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-msflip-blt.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-msflip-blt.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     ([PASS][593], [SKIP][594]) ([Intel XE#455]) -> [S=
KIP][595] ([Intel XE#455])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          ([SKIP][596], [PASS][597]) ([Intel XE#1503]) -> [=
SKIP][598] ([Intel XE#1503])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     ([SKIP][599], [SKIP][600]) ([Intel XE#4208] / [i9=
15#2575]) -> [SKIP][601] ([Intel XE#455]) +1 other test skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_plane_lowres@tiling-y.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          ([SKIP][602], [PASS][603]) ([Intel XE#2571]) -> [=
SKIP][604] ([Intel XE#2571])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi=
-pipe.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi=
-pipe.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         ([SKIP][605], [SKIP][606]) ([Intel XE#2850] / [In=
tel XE#929]) -> [SKIP][607] ([Intel XE#4996])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_psr@fbc-psr2-basic.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_psr@fbc-psr2-basic.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-adlp:         ([SKIP][608], [SKIP][609]) ([Intel XE#2850] / [In=
tel XE#929]) -> [SKIP][610] ([Intel XE#2351]) +1 other test skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_psr@psr-cursor-plane-move.ht=
ml
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_psr@psr-cursor-plane-move.ht=
ml
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     ([SKIP][611], [SKIP][612]) ([Intel XE#2351] / [In=
tel XE#4208]) -> [SKIP][613] ([Intel XE#2850] / [Intel XE#929]) +1 other te=
st skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_psr@psr-sprite-blt.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     ([SKIP][614], [SKIP][615]) ([Intel XE#4208] / [i9=
15#2575]) -> [FAIL][616] ([Intel XE#1729])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_tiled_display@basic-test-pa=
ttern.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_tiled_display@basic-test-pa=
ttern.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     ([SKIP][617], [SKIP][618]) ([Intel XE#1500] / [In=
tel XE#362]) -> [SKIP][619] ([Intel XE#1500])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_tiled_display@basic-test-pa=
ttern-with-chamelium.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@kms_tiled_display@basic-test-pa=
ttern-with-chamelium.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          ([PASS][620], [SKIP][621]) ([Intel XE#1499]) -> [=
SKIP][622] ([Intel XE#1499])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@kms_vrr@negative-basic.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-adlp:         ([SKIP][623], [SKIP][624]) ([Intel XE#4837]) -> [=
SKIP][625] ([Intel XE#4945])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     ([SKIP][626], [SKIP][627]) ([Intel XE#4208]) -> [=
SKIP][628] ([Intel XE#4837])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_eudebug@discovery-empty.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_eudebug@discovery-empty.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-435/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@vma-ufence:
    - shard-adlp:         [SKIP][629] ([Intel XE#4837]) -> [SKIP][630] ([In=
tel XE#4945]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@xe_eudebug@vma-ufence.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_eudebug@vma-ufence.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-adlp:         [SKIP][631] ([Intel XE#261] / [Intel XE#688]) -> =
[SKIP][632] ([Intel XE#4945])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_evict@evict-beng-large-multi-=
vm.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         ([SKIP][633], [SKIP][634]) ([Intel XE#261] / [Int=
el XE#688]) -> [SKIP][635] ([Intel XE#4945])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_evict@evict-small-external-cm=
.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_evict@evict-small-external-cm=
.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         ([SKIP][636], [SKIP][637]) ([Intel XE#1392]) -> [=
SKIP][638] ([Intel XE#4945])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-bind.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-bind.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-adlp:         [SKIP][639] ([Intel XE#1392]) -> [SKIP][640] ([In=
tel XE#4945])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null=
-defer-mmap.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:
    - shard-adlp:         [SKIP][641] ([Intel XE#288]) -> [SKIP][642] ([Int=
el XE#4945]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexec=
queue-userptr-rebind-imm.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - shard-adlp:         ([SKIP][643], [SKIP][644]) ([Intel XE#288]) -> [S=
KIP][645] ([Intel XE#4945]) +4 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexe=
cqueue-userptr-prefetch.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exec_fault_mode@twice-bindexe=
cqueue-userptr-prefetch.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge:
    - shard-dg2-set2:     ([SKIP][646], [SKIP][647]) ([Intel XE#4208]) -> [=
SKIP][648] ([Intel XE#4915]) +17 other tests skip
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_exec_system_allocator@many-e=
xecqueues-mmap-huge.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_exec_system_allocator@many-e=
xecqueues-mmap-huge.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@many-large-free-race-nomemset:
    - shard-adlp:         [SKIP][649] ([Intel XE#4915]) -> [SKIP][650] ([In=
tel XE#4945] / [Intel XE#4996]) +11 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_exec_system_allocator@many-la=
rge-free-race-nomemset.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_exec_system_allocator@many-large-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-free:
    - shard-adlp:         ([SKIP][651], [SKIP][652]) ([Intel XE#4915]) -> [=
SKIP][653] ([Intel XE#4945] / [Intel XE#4996]) +48 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_exec_system_allocator@threads=
-many-large-free.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exec_system_allocator@threads=
-many-large-free.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_exec_system_allocator@threads-many-large-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-no=
memset:
    - shard-lnl:          ([FAIL][654], [PASS][655]) ([Intel XE#5018]) -> [=
FAIL][656] ([Intel XE#5018])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_exec_system_allocator@threads-=
shared-vm-many-large-new-bo-map-nomemset.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_exec_system_allocator@threads-=
shared-vm-many-large-new-bo-map-nomemset.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ln=
l-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-no=
memset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-adlp:         ([TIMEOUT][657], [INCOMPLETE][658]) ([Intel XE#49=
11]) -> [TIMEOUT][659] ([Intel XE#4911])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_mmio_send_recv.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_mmio_send_recv.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][660], [PASS][661], [PASS][662], [PASS][66=
3], [PASS][664], [PASS][665], [PASS][666], [PASS][667], [PASS][668], [PASS]=
[669], [PASS][670], [PASS][671], [PASS][672], [PASS][673], [PASS][674], [PA=
SS][675], [PASS][676], [PASS][677], [PASS][678], [PASS][679], [PASS][680], =
[PASS][681], [PASS][682], [SKIP][683], [PASS][684], [PASS][685], [PASS][686=
], [PASS][687], [PASS][688], [PASS][689], [PASS][690], [PASS][691], [PASS][=
692], [PASS][693], [PASS][694], [PASS][695], [PASS][696], [PASS][697], [PAS=
S][698], [PASS][699], [PASS][700], [PASS][701], [SKIP][702], [PASS][703], [=
PASS][704], [PASS][705], [PASS][706], [PASS][707]) ([Intel XE#2457]) -> ([P=
ASS][708], [PASS][709], [PASS][710], [PASS][711], [PASS][712], [PASS][713],=
 [PASS][714], [PASS][715], [PASS][716], [PASS][717], [PASS][718], [PASS][71=
9], [PASS][720], [PASS][721], [PASS][722], [PASS][723], [PASS][724], [PASS]=
[725], [PASS][726], [PASS][727], [PASS][728], [PASS][729], [DMESG-WARN][730=
], [PASS][731]) ([Intel XE#3428])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@xe_module_load@load.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@xe_module_load@load.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-7/igt@xe_module_load@load.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@xe_module_load@load.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@xe_module_load@load.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@xe_module_load@load.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@xe_module_load@load.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-1/igt@xe_module_load@load.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@xe_module_load@load.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@xe_module_load@load.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@xe_module_load@load.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@xe_module_load@load.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@xe_module_load@load.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-4/igt@xe_module_load@load.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@xe_module_load@load.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-2/igt@xe_module_load@load.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-3/igt@xe_module_load@load.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-3/igt@xe_module_load@load.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-6/igt@xe_module_load@load.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-6/igt@xe_module_load@load.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@xe_module_load@load.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-5/igt@xe_module_load@load.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-6/igt@xe_module_load@load.html
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bm=
g-8/igt@xe_module_load@load.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     ([SKIP][732], [SKIP][733]) ([Intel XE#4208]) -> [=
SKIP][734] ([Intel XE#2541] / [Intel XE#3573])
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_oa@invalid-oa-exponent.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_oa@invalid-oa-exponent.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@polling:
    - shard-adlp:         ([SKIP][735], [SKIP][736]) ([Intel XE#2541] / [In=
tel XE#3573]) -> [SKIP][737] ([Intel XE#4945]) +1 other test skip
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_oa@polling.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_oa@polling.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_oa@polling.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         ([SKIP][738], [SKIP][739]) ([Intel XE#1337]) -> [=
SKIP][740] ([Intel XE#4945])
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_pat@display-vs-wb-transient.h=
tml
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_pat@display-vs-wb-transient.h=
tml
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         ([PASS][741], [ABORT][742]) ([Intel XE#1794]) -> =
[ABORT][743] ([Intel XE#1794])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     ([SKIP][744], [SKIP][745]) ([Intel XE#4208]) -> [=
SKIP][746] ([Intel XE#4733])
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_pxp@pxp-src-to-pxp-dest-rend=
ercopy.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rend=
ercopy.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     ([SKIP][747], [SKIP][748]) ([Intel XE#4208]) -> [=
SKIP][749] ([Intel XE#4273])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_sriov_flr@flr-twice.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_sriov_flr@flr-twice.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-436/igt@xe_sriov_flr@flr-twice.html

 =20
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3549]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3549
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8371 -> IGT_8373
  * Linux: xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b -> xe-pw-148787=
v2

  IGT_8371: 8371
  IGT_8373: 8373
  xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b: 3695d568b260d85e65f9331=
ca1180a9dd2b5560b
  xe-pw-148787v2: 148787v2

=3D=3D Logs =3D=3D

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14878=
7v2/index.html

--===============4549692256744142720==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/i915/vrr: Set vrr.vmin to min Vtotal to =
re-enable LRR for PTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148787/">https://patchwork.freedesktop.org/series/148787/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148787v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3119-3695d568b260d85e65f9331ca1180a9dd=
2b5560b_FULL -&gt; xe-pw-148787v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148787v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148787v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1487=
87v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@core_=
hotunplug@hotreplug-lateclose.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sh=
ard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2=
-435/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_pi=
pe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180=
a9dd2b5560b/shard-adlp-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-seque=
nce.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_pipe_crc_basic@nonblocking-crc-fram=
e-sequence.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-get-prop:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_pro=
p_blob@invalid-get-prop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_prop_blob@invali=
d-get-prop.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_p=
roperties@connector-properties-legacy.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b=
5560b/shard-dg2-463/igt@kms_properties@connector-properties-legacy.html">PA=
SS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8787v2/shard-dg2-433/igt@kms_properties@connector-properties-legacy.html">I=
NCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_vrr=
@flip-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@kms_v=
rr@flip-dpms.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148787v2/shard-lnl-3/igt@kms_vrr@flip-dpms.html">ABORT</=
a> +3 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787=
v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-mov=
e.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b26=
0d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-w=
c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms=
_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel X=
E#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148787v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_fr=
ontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_frontbuffer_tracking@=
fbcpsr-rgb101010-draw-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_jo=
iner@invalid-modeset-force-big-joiner.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b=
5560b/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301=
2">Intel XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_joiner@invalid-modeset-force-big-=
joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_pm=
_rpm@dpms-non-lpsp.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/=
igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@km=
s_pm_rpm@dpms-non-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_ps=
r2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-adlp-1/igt@kms_psr2_sf@psr2-primary-plane-update-=
sf-dmg-area-big-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_psr2_s=
f@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_ps=
r@fbc-psr-cursor-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-=
4/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/s=
hard-adlp-3/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_rot=
ation_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/i=
gt@kms_rotation_crc@primary-rotation-270.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148787v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@core_h=
otunplug@hotreplug-lateclose.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-=
3/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b26=
0d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-linear@pipe-c-edp-1.html">PASS</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-6/igt@kms_=
async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">I=
ntel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_as=
ync_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-adlp-6/igt@kms_async_flips@invalid-async-flip-ato=
mic@pipe-c-hdmi-a-1.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@kms_async_flips@invalid=
-async-flip-atomic@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca=
1180a9dd2b5560b/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rot=
ate-0-hflip.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65=
f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-180-async-flip.html">PASS</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@kms_big_fb@y-tile=
d-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) +12 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_bw@=
connected-linear-tiling-2-displays-2160x1440p.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca11=
80a9dd2b5560b/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-216=
0x1440p.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-dis=
plays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_bw@connected-linear-tili=
ng-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/igt@kms_bw@connected-linear-tilin=
g-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@kms_bw@connected-linear-til=
ing-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-433/igt@kms_bw@linear-tiling-2-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_ccs@bad-aux-stride-y-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation=
-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.ht=
ml">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148787v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-cc=
s.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3428">Intel XE#3428</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-=
y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs-cc@pipe-a-dp-4.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_ccs@random-ccs-d=
ata-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-=
change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-5/igt@kms_chamelium_edid@vga-edid-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_chamelium_edid@vga-edid-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_chamelium_frames@hdmi-fr=
ame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4950">Intel XE#4950</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-af=
ter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_content_protection@atom=
ic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-7/igt@kms_content_protection@atomic=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3278">Intel XE#3278</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_content_protection@atomic=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-4/igt@kms_cursor_crc@cursor-random=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-8/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid=
-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cu=
rsor_crc@cursor-sliding-256x85.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/s=
hard-adlp-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-a=
dlp-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Inte=
l XE#4996</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs=
-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-atomic.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b556=
0b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2=
/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_dp_=
aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_dp_a=
ux_dev.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148787v2/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#300=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fea=
ture_discovery@display-2x.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-=
bmg-8/igt@kms_feature_discovery@display-2x.html">PASS</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@k=
ms_feature_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-4/igt@kms_flip@2x-blocking-absolut=
e-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/310">Intel XE#310</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_flip@2x-blocking-absolute=
-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired=
-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fli=
p@2x-nonexisting-fb.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/=
igt@kms_flip@2x-nonexisting-fb.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_flip@2x-n=
onexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2=
b5560b/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">=
PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148787v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2882">Intel XE#2882</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible@ab-dp2-hdmi-a3.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-inter=
ruptible@ab-dp2-hdmi-a3.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_flip@2x-plain-fl=
ip-ts-check-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible@ad-dp2-hdmi-a3.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-inter=
ruptible@ad-dp2-hdmi-a3.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_flip@2x-plain-fl=
ip-ts-check-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fli=
p@flip-vs-expired-vblank@a-dp2.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/s=
hard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-b=
mg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vb=
lank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_f=
lip@flip-vs-suspend-interruptible.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560=
b/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/s=
hard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Int=
el XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@kms_=
flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Inte=
l XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_fl=
ip@flip-vs-suspend@d-hdmi-a1.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-=
4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fl=
ip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-adlp-4/igt@kms_flip@plain-flip-fb-recreate-interr=
uptible@c-hdmi-a1.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148787v2/shard-adlp-2/igt@kms_flip@plain-flip-fb-re=
create-interruptible@c-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shar=
d-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscalin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr=
-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_joiner@basic-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_p=
lane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180=
a9dd2b5560b/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size=
-64.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a=
-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/599">Intel XE#599</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-7/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-4/igt@kms_plane_lowres@tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-1/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1=
 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-2/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-6/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other=
 tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-1/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260=
d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-20x20@pipe-a.html">PASS</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-4/igt@kms_p=
lane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/417=
3">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-433/igt@kms_psr@psr2-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@kms_psr@psr2-sprite-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_psr=
_stress_test@flip-primary-invalidate-overlay.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-ov=
erlay.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148787v2/shard-lnl-8/igt@kms_psr_stress_test@flip-primary-inval=
idate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_rmf=
b@rmfb-ioctl.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_rmfb@rmfb-ioctl.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">I=
ntel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@kms_set=
mode@basic@pipe-b-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-ln=
l-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-8/igt@kms_s=
etmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-7/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@kms_vrr=
@flip-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_=
vrr@flip-basic.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@kms_vrr@flip-basic.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a>) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@kms_vrr@=
max-min.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148787v2/shard-lnl-6/igt@kms_vrr@max-min.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_writeback@writeback-pix=
el-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-5/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-8/igt@kms_writeback@writeback-pixe=
l-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148787v2/shard-bmg-5/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shar=
d-bmg-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-5/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2=
/shard-bmg-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-5/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
787v2/shard-bmg-5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5080">Intel XE#5080</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@xe_eu_stall@blocking-re-ena=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4497">Intel XE#4497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_eu_stall@invalid-sampling=
-rate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-2/igt@xe_eudebug_online@set-breakpo=
int.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-1/igt@xe_eudebug_online@set-breakp=
oint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-433/igt@xe_eudebug_online@writes-ca=
ching-vram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_evict@evict-beng-small-cm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/igt@xe_evict@evict-beng-small-cm.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exe=
c_balancer@many-execqueues-cm-parallel-rebind.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca11=
80a9dd2b5560b/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-parallel=
-rebind.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_exec_balancer@many-execqueues-cm=
-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@xe_ex=
ec_basic@multigpu-no-exec-basic-defer-bind.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a=
9dd2b5560b/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bin=
d.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148787v2/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-def=
er-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-once-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@xe_ex=
ec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-8/igt@xe_exec_fault_mode@invalid-v=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-433/igt@xe_exec_fault_mode@once-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@xe_exec_system_allocator@many=
-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-2/igt@xe_exec_system_allocator@many=
-large-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@xe_exec_system_allocator@pro=
cess-many-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +58 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nome=
mset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) =
+153 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_exec_threads@threads-mixe=
d-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/igt@xe_gt_freq@freq_suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
84">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@xe_oa@oa-regs-whitelisted.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148787v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-6/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</=
li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@xe_pxp@pxp-termination-key-=
update-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@xe_query@multigpu-query-uc-=
fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@xe_query@multigpu-query-uc-f=
w-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@xe_render_copy@render-stres=
s-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148787v2/shard-lnl-2/igt@xe_sriov_flr@flr-twice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
73">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-134217728:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_vm@=
large-split-misaligned-binds-134217728.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2=
b5560b/shard-adlp-2/igt@xe_vm@large-split-misaligned-binds-134217728.html">=
PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148787v2/shard-adlp-3/igt@xe_vm@large-split-misaligned-binds-134217728.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4945">Intel XE#4945</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4996">Intel XE#4996</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-16777216:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_vm@l=
arge-userptr-split-binds-16777216.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_vm@larg=
e-userptr-split-binds-16777216.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +6 other tests =
skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@core_=
hotunplug@unbind-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg=
2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-d=
g2-433/igt@core_hotunplug@unbind-rebind.html">PASS</a> +9 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a=
-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-p=
age-flip-events-tiled@pipe-b-hdmi-a-1-y.html">PASS</a> +3 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_bi=
g_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b556=
0b/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148787v2/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PA=
SS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-async-flip.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-8/igt@k=
ms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148787v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-r=
c-ccs@pipe-b-dp-4.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_=
ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d=
85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/sh=
ard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_c=
ursor_crc@cursor-rapid-movement-256x85.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2=
b5560b/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@kms_cursor_crc@curso=
r-rapid-movement-256x85.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d=
85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-fl=
ipb-atomic-transitions-varying-size.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-=
8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.ht=
ml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_f=
lip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/=
shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-=
a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_f=
lip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@cd-hdmi-a6-dp4.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fli=
p@2x-modeset-vs-vblank-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shar=
d-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2=
/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_f=
lip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-i=
nterruptible@d-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3549">Intel XE#3549</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_flip@=
flip-vs-absolute-wf_vblank-interruptible@d-dp4.html">PASS</a> +4 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2=
b5560b/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-=
WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@kms_flip@flip-vs-susp=
end-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fl=
ip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331c=
a1180a9dd2b5560b/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-=
hdmi-a1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@kms_fl=
ip@wf_vblank-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr=
@static-swap.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms=
_hdr@static-swap.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@kms_hdr@stati=
c-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_pla=
ne_multiple@2x-tiling-none.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard=
-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/s=
hard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_pro=
perties@get_properties-sanity-atomic.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-bmg-3/igt@kms_properties@get_properties-sanity-atomic.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017"=
>Intel XE#5017</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148787v2/shard-bmg-3/igt@kms_properties@get_properties-sanity-ato=
mic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_pr=
operties@get_properties-sanity-non-atomic.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9=
dd2b5560b/shard-adlp-2/igt@kms_properties@get_properties-sanity-non-atomic.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5017">Intel XE#5017</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148787v2/shard-adlp-2/igt@kms_properties@get_properties=
-sanity-non-atomic.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_p=
roperties@get_properties-sanity-non-atomic.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a=
9dd2b5560b/shard-dg2-463/igt@kms_properties@get_properties-sanity-non-atomi=
c.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5017">Intel XE#5017</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_properties@get_propert=
ies-sanity-non-atomic.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_pro=
perties@get_properties-sanity-non-atomic.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-lnl-7/igt@kms_properties@get_properties-sanity-non-atomic.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5017">Intel XE#5017</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148787v2/shard-lnl-5/igt@kms_properties@get_properties-sa=
nity-non-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@kms_psr=
@psr2-primary-render.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-6=
/igt@kms_psr@psr2-primary-render.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3924">Intel XE#3924</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/i=
gt@kms_psr@psr2-primary-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@xe_ex=
ec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a=
9dd2b5560b/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@xe_exec_basic@multigpu-no-=
exec-basic-defer-mmap.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331c=
a1180a9dd2b5560b/shard-lnl-2/igt@xe_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260=
d85e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568=
b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695=
d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-=
3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560=
b/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b=
5560b/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9=
dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca11=
80a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d=
85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b=
260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d=
568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3=
695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-31=
19-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331c=
a1180a9dd2b5560b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
787v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148787v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
787v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148787v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
787v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148787v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
787v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148787v2/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
787v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148787v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_modu=
le_load@reload-no-display.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-=
bmg-3/igt@xe_module_load@reload-no-display.html">ABORT</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/sh=
ard-bmg-2/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_pm@s=
4-exec-after.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe=
_pm@s4-exec-after.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-lnl-6/igt@xe_pm@s4-exe=
c-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_pm@=
s4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/=
igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/i=
gt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_bi=
g_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1487=
87v2/shard-adlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_big_fb@=
4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sh=
ard-adlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787=
v2/shard-adlp-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#=
4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_big=
_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms=
_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_b=
ig_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sh=
ard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bp=
p-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_big_fb=
@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Inte=
l XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_bw@=
connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/s=
hard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
96">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_bw=
@linear-tiling-4-displays-3840x2160p.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148787v2/shard-adlp-3/igt@kms_bw@linear-tiling-4-displays-3840x2160=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_ccs=
@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/sh=
ard-adlp-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE=
#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_c=
cs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_ccs@bad-pixe=
l-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_cc=
s@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2=
b5560b/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo=
-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_c=
cs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9=
dd2b5560b/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148787v2/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180=
a9dd2b5560b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-=
dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Inte=
l XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b=
5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">IN=
COMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-=
dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1=
180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs=
-cc.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#312=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212=
">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-r=
c-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_cd=
clk@mode-transition.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6=
/igt@kms_cdclk@mode-transition.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/sha=
rd-adlp-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_ch=
amelium_color@ctm-negative.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard=
-adlp-9/igt@kms_chamelium_color@ctm-negative.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/sha=
rd-adlp-3/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_ch=
amelium_hpd@vga-hpd-after-suspend.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560=
b/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel =
XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148787v2/shard-adlp-3/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/499=
6">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_co=
ntent_protection@atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-ad=
lp-4/igt@kms_content_protection@atomic.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_con=
tent_protection@uevent.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg=
-2/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg=
-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cu=
rsor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">=
Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148787v2/shard-adlp-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cur=
sor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d=
85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-atomic-transitions-varying-size.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-=
1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_d=
irtyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-d=
g2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148787v2/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_dis=
play_modes@extended-mode-basic.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/s=
hard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#43=
02</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8787v2/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Inte=
l XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_f=
lip@2x-flip-vs-expired-vblank.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sh=
ard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fli=
p@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9=
dd2b5560b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_f=
lip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301=
">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_fl=
ip@2x-flip-vs-panning.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp=
-8/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/=
igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fli=
p@2x-plain-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@=
kms_flip@2x-plain-flip.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_fli=
p@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-pr=
imscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
1">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scnd=
scrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_front=
buffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85=
e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v=
2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_frontbu=
ffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1487=
87v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-6/igt@km=
s_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/sh=
ard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-=
wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shar=
d-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48787v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65=
f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-=
primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-=
bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
787v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148787v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_f=
rontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180=
a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-=
blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@kms_frontbuffer_tracking=
@fbcdrrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_f=
rontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148787v2/shard-dg2-433/igt@kms_frontbuffer_tracking=
@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_f=
rontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260=
d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg=
2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48787v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-sc=
ndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-6/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_fr=
ontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offs=
cren-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#499=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148787v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_fro=
ntbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-=
2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscr=
n-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-4/i=
gt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_h=
dr@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt=
@kms_hdr@invalid-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-434/igt@kms_hdr@i=
nvalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr=
@static-toggle-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/=
igt@kms_hdr@static-toggle-dpms.html">PASS</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-4/ig=
t@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_p=
lane_lowres@tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-4=
33/igt@kms_plane_lowres@tiling-y.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2=
/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_pla=
ne_scaling@2x-scaler-multi-pipe.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/=
shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#=
2571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148787v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">I=
ntel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_ps=
r@fbc-psr2-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/ig=
t@kms_psr@fbc-psr2-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@kms_ps=
r@psr-cursor-plane-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-ad=
lp-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1487=
87v2/shard-adlp-3/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_p=
sr@psr-sprite-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/=
igt@kms_psr@psr-sprite-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard=
-dg2-466/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_t=
iled_display@basic-test-pattern.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/=
shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/shard-dg2-433/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_t=
iled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1=
180a9dd2b5560b/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-=
chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_vrr=
@negative-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@=
kms_vrr@negative-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@kms_vrr=
@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b55=
60b/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">I=
ntel XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148787v2/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_eu=
debug@discovery-empty.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-=
433/igt@xe_eudebug@discovery-empty.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-4=
35/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@xe_eude=
bug@vma-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_eudebug@vma-=
ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_evic=
t@evict-beng-large-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adl=
p-3/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_evi=
ct@evict-small-external-cm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard=
-adlp-4/igt@xe_evict@evict-small-external-cm.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE=
#688</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148787v2/shard-adlp-3/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9=
dd2b5560b/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@xe_exec=
_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp=
-3/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_exec=
_fault_mode@once-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787=
v2/shard-adlp-3/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-im=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exec_fault_mode@twice-bindexecqueue=
-userptr-prefetch.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_exec_fault=
_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_ex=
ec_system_allocator@many-execqueues-mmap-huge.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca11=
80a9dd2b5560b/shard-dg2-434/igt@xe_exec_system_allocator@many-execqueues-mm=
ap-huge.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@xe_exec_system_alloc=
ator@many-execqueues-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-race-nomemset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_exec=
_system_allocator@many-large-free-race-nomemset.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2=
/shard-adlp-3/igt@xe_exec_system_allocator@many-large-free-race-nomemset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4996">Intel XE#4996</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_exe=
c_system_allocator@threads-many-large-free.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a=
9dd2b5560b/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-large-fre=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_exec_system_allocator@th=
reads-many-large-free.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +48 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d5=
68b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_exec_system_allocator=
@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1487=
87v2/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">TIMEOUT</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_=
guc_mmio_send_recv.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_f=
ault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4=
911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331c=
a1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260=
d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568=
b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695=
d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-=
3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-=
bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560=
b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b=
5560b/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9=
dd2b5560b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca11=
80a9dd2b5560b/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d=
85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b=
260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d=
568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3=
695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-31=
19-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331c=
a1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#24=
57</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48787v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48787v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48787v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48787v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48787v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148787v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/s=
hard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_oa=
@invalid-oa-exponent.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-4=
34/igt@xe_oa@invalid-oa-exponent.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-434=
/igt@xe_oa@invalid-oa-exponent.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_oa@=
polling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_oa@p=
olling.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-3/igt@xe_oa@po=
lling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-a=
dlp-1/igt@xe_pat@display-vs-wb-transient.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard=
-adlp-3/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_pm@=
s4-basic-exec.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@x=
e_pm@s4-basic-exec.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-adlp-9/igt@xe_pm@s4-=
basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_px=
p@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b=
/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148787v2/shard-dg2-466/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733=
">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_sr=
iov_flr@flr-twice.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/=
igt@xe_sriov_flr@flr-twice.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148787v2/shard-dg2-436/igt@x=
e_sriov_flr@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8371 -&gt; IGT_8373</li>
<li>Linux: xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b -&gt; xe-pw-148=
787v2</li>
</ul>
<p>IGT_8371: 8371<br />
  IGT_8373: 8373<br />
  xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b: 3695d568b260d85e65f9331=
ca1180a9dd2b5560b<br />
  xe-pw-148787v2: 148787v2</p>

</body>
</html>

--===============4549692256744142720==--
