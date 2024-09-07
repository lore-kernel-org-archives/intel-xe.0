Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9420EB64C8
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 15:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF3810E230;
	Sat,  7 Sep 2024 15:34:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE3310E22F;
 Sat,  7 Sep 2024 15:34:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2376754411267108645=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Suppress_missing_oute?=
 =?utf-8?q?r_rpm_protection_warning_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Sep 2024 15:34:29 -0000
Message-ID: <172572326949.955480.12112926317046793050@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905140215.56404-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240905140215.56404-1-rodrigo.vivi@intel.com>
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

--===============2376754411267108645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Suppress missing outer rpm protection warning (rev2)
URL   : https://patchwork.freedesktop.org/series/138220/
State : failure

== Summary ==

CI Bug Log - changes from xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581_full -> xe-pw-138220v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138220v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138220v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138220v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_ccs@suspend-resume:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-3/igt@xe_ccs@suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-3/igt@xe_ccs@suspend-resume.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - {shard-bmg}:        [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - {shard-bmg}:        [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - {shard-bmg}:        [PASS][7] -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-2/igt@xe_exec_reset@close-execqueues-close-fd.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-5/igt@xe_exec_reset@close-execqueues-close-fd.html

  
Known issues
------------

  Here are the changes found in xe-pw-138220v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][9] -> [FAIL][10] ([Intel XE#1426]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#1659])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1407]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][15] ([Intel XE#1874])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1399]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#309]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1508] / [Intel XE#599])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1421])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#310])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#886]) +3 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#1874]) +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#651]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#656]) +9 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#656]) +9 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1470])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
    - shard-lnl:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#324]) +1 other test dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - shard-lnl:          [PASS][43] -> [DMESG-FAIL][44] ([Intel XE#324])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1406])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_psr@pr-cursor-render.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][47] ([Intel XE#1174])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#2168])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][49] ([Intel XE#2443]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][51] -> [TIMEOUT][52] ([Intel XE#1473]) +1 other test timeout
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#688]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#261])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#1392])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1392])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#2711])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1416])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_mmap@vram.html
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1008] / [Intel XE#1201])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_mmap@vram.html

  * igt@xe_oa@mi-rpc:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#2541])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_oa@mi-rpc.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][64] -> [ABORT][65] ([Intel XE#1358] / [Intel XE#1607])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][66] -> [ABORT][67] ([Intel XE#1794])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-6/igt@xe_pm@s4-mocs.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#944])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#944])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - {shard-bmg}:        [FAIL][70] ([Intel XE#827]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][72] ([Intel XE#324]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][74] ([Intel XE#1426]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][76] ([Intel XE#1426]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][78] ([Intel XE#2436]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][80] ([Intel XE#1874]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][82] ([Intel XE#324]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][84] ([Intel XE#616]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - {shard-bmg}:        [INCOMPLETE][86] ([Intel XE#1760]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-3/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][88] ([Intel XE#771] / [Intel XE#899]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][90] ([Intel XE#899]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [FAIL][92] ([Intel XE#2443]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][94] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][96] ([Intel XE#1000]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][98] ([Intel XE#1473]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue:
    - {shard-bmg}:        [DMESG-WARN][100] ([Intel XE#877]) -> [PASS][101] +2 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_intel_bb@destroy-bb:
    - shard-dg2-set2:     [DMESG-WARN][102] -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-433/igt@xe_intel_bb@destroy-bb.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-466/igt@xe_intel_bb@destroy-bb.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][104] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][106] ([Intel XE#1794]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-lnl:          [ABORT][108] ([Intel XE#1794]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][110] ([Intel XE#958]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [FAIL][112] ([Intel XE#958]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][114] ([Intel XE#1033]) -> [DMESG-WARN][115] ([Intel XE#324])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][116] ([Intel XE#324]) -> [DMESG-WARN][117] ([Intel XE#1033] / [Intel XE#324])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][119] ([Intel XE#316]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#316]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][122] ([Intel XE#1231]) -> [DMESG-FAIL][123] ([Intel XE#324])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1124]) -> [SKIP][125] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][127] ([Intel XE#1124]) +10 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#619]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#619])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][131] ([Intel XE#367]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#367]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#2191]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#2191])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][137] ([Intel XE#2191])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][139] ([Intel XE#1252]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#787]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1252]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#1252])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][147] ([Intel XE#787]) +55 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][149] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1152]) -> [SKIP][151] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][153] ([Intel XE#373]) +10 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#306]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#306])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_chamelium_color@degamma.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][157] ([Intel XE#306])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#373]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#308]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][163] ([Intel XE#308]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#455]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#455]) +16 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#323]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][168] ([i915#3804]) -> [SKIP][169] ([Intel XE#1201] / [i915#3804])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][171] ([Intel XE#455]) +17 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][173] ([Intel XE#776]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][175] ([Intel XE#1138])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1135]) -> [SKIP][177] ([Intel XE#1135] / [Intel XE#1201])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_feature_discovery@psr1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [INCOMPLETE][179] ([Intel XE#2049] / [Intel XE#2597])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][180] ([Intel XE#1195] / [Intel XE#2049]) -> [INCOMPLETE][181] ([Intel XE#2049])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [i915#5274]) -> [SKIP][183] ([i915#5274])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#651]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][187] ([Intel XE#651]) +25 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#653]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][191] ([Intel XE#653]) +25 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#498]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][197] ([Intel XE#2318] / [Intel XE#455]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][199] ([Intel XE#2318]) +8 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#870]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#870])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_pm_backlight@fade.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1122]) -> [SKIP][203] ([Intel XE#1122] / [Intel XE#1201])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][205] ([Intel XE#908])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1489]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][209] ([Intel XE#1489]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][211] ([Intel XE#929]) +13 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#929]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1149]) -> [SKIP][215] ([Intel XE#1149] / [Intel XE#1201])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][217] ([Intel XE#327])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][219] ([Intel XE#1729])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#756]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#756])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][223] ([Intel XE#1091])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1123]) -> [SKIP][227] ([Intel XE#1123] / [Intel XE#1201])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][229] ([Intel XE#1123])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][231] ([Intel XE#1126]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#288]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][235] ([Intel XE#288]) +20 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2360]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#2360]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][239] ([Intel XE#2229])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][241] ([Intel XE#2541]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2541]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_oa@polling-small-buf.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][245] ([Intel XE#977])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@xe_pat@pat-index-xe2.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][247] ([Intel XE#979]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][249] ([Intel XE#2284])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [INCOMPLETE][252] ([Intel XE#1195] / [Intel XE#1694]) -> [INCOMPLETE][253] ([Intel XE#1195])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][255] ([Intel XE#944])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_query@multigpu-query-config.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#944]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2711]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2711
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581 -> xe-pw-138220v2

  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581: 883d811c2bfc8544bc5b00bbee84e6b83e20a581
  xe-pw-138220v2: 138220v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/index.html

--===============2376754411267108645==
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
<tr><td><b>Series:</b></td><td>drm/xe: Suppress missing outer rpm protection warning (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138220/">https://patchwork.freedesktop.org/series/138220/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581_full -&gt; xe-pw-138220v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138220v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138220v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138220v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_ccs@suspend-resume:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-3/igt@xe_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-3/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-2/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-5/igt@xe_exec_reset@close-execqueues-close-fd.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138220v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_vrr@lobf@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2711">Intel XE#2711</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-6/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-3/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-6/igt@kms_vrr@flip-basic-fastset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@destroy-bb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-433/igt@xe_intel_bb@destroy-bb.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-466/igt@xe_intel_bb@destroy-bb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-435/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-434/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v2/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581 -&gt; xe-pw-138220v2</li>
</ul>
<p>IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581: 883d811c2bfc8544bc5b00bbee84e6b83e20a581<br />
  xe-pw-138220v2: 138220v2</p>

</body>
</html>

--===============2376754411267108645==--
