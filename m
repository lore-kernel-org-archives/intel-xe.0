Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2554C07E8E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 12:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE231113B09;
	Wed, 24 Apr 2024 12:42:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C546113B04;
 Wed, 24 Apr 2024 12:42:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3051187822618985655=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B1/4=5D_?=
 =?utf-8?q?drm/xe=3A_Introduce_a_simple_wedged_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 12:42:07 -0000
Message-ID: <171396252715.1630367.9655602616619299422@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
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

--===============3051187822618985655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/4] drm/xe: Introduce a simple wedged state
URL   : https://patchwork.freedesktop.org/series/132797/
State : failure

== Summary ==

CI Bug Log - changes from xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf_full -> xe-pw-132797v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-132797v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132797v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132797v1_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         [FAIL][1] ([Intel XE#616]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][3] ([Intel XE#1201] / [i915#2575]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - {shard-lnl}:        [SKIP][5] ([Intel XE#1466]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - {shard-lnl}:        [SKIP][8] ([Intel XE#1124]) -> [SKIP][9] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - {shard-lnl}:        [SKIP][10] ([Intel XE#1399]) -> [SKIP][11] +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - {shard-lnl}:        [SKIP][12] ([Intel XE#373]) -> [SKIP][13] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@uevent:
    - {shard-lnl}:        [SKIP][14] ([Intel XE#1446]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_content_protection@uevent.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - {shard-lnl}:        [SKIP][16] ([Intel XE#309]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_feature_discovery@dp-mst:
    - {shard-lnl}:        [SKIP][18] ([Intel XE#1137]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_feature_discovery@dp-mst.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - {shard-lnl}:        [SKIP][20] ([Intel XE#1421]) -> [SKIP][21] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_flip@2x-wf_vblank-ts-check.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - {shard-lnl}:        [SKIP][22] ([Intel XE#1401]) -> [SKIP][23] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - {shard-lnl}:        [SKIP][24] ([Intel XE#352]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - {shard-lnl}:        [SKIP][26] ([Intel XE#651]) -> [SKIP][27] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - {shard-lnl}:        [SKIP][28] ([Intel XE#656]) -> [SKIP][29] +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - {shard-lnl}:        [DMESG-WARN][30] ([Intel XE#1603]) -> [INCOMPLETE][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-7efc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-4/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1:
    - {shard-lnl}:        [PASS][32] -> [INCOMPLETE][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-4/igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - {shard-lnl}:        [PASS][34] -> [FAIL][35] +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-cursor-render:
    - {shard-lnl}:        [SKIP][36] ([Intel XE#1406]) -> [SKIP][37] +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_psr@pr-cursor-render.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_psr@pr-cursor-render.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - {shard-lnl}:        [SKIP][38] ([Intel XE#1435]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - {shard-lnl}:        [SKIP][40] ([Intel XE#1091]) -> [SKIP][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - {shard-lnl}:        NOTRUN -> [SKIP][42] +18 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - {shard-lnl}:        [SKIP][43] ([Intel XE#1392]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-lnl}:        [PASS][45] -> [DMESG-WARN][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@xe_exec_reset@gt-reset-stress.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-fd-userptr:
    - {shard-lnl}:        [PASS][47] -> [SKIP][48] +32 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_threads@threads-fd-userptr.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_exec_threads@threads-fd-userptr.html

  * igt@xe_query@multigpu-query-gt-list:
    - {shard-lnl}:        [SKIP][49] ([Intel XE#944]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html

  
New tests
---------

  New tests have been introduced between xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf_full and xe-pw-132797v1_full:

### New IGT tests (1) ###

  * igt@kms_plane_lowres:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-132797v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-get-prop:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#1201] / [i915#6077])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_addfb_basic@invalid-get-prop.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_addfb_basic@invalid-get-prop.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [PASS][53] -> [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) +2 other tests dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#801]) +15 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#650]) +23 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#316])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][58] -> [DMESG-FAIL][59] ([Intel XE#324])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][60] ([Intel XE#1231])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][61] ([Intel XE#1204])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][62] -> [FAIL][63] ([Intel XE#1204])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][64] ([Intel XE#1242])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][65] ([Intel XE#324])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#619])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#367])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#787]) +160 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][72] ([Intel XE#1195]) +1 other test incomplete
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#787]) +50 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#307])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#308])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][79] -> [DMESG-WARN][80] ([Intel XE#1214]) +2 other tests dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][81] ([Intel XE#1162])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-adlp:         [PASS][82] -> [FAIL][83] ([Intel XE#581])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#323])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][85] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2-set2:     [PASS][86] -> [DMESG-WARN][87] ([Intel XE#1214] / [Intel XE#282])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#309]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1201])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [i915#3804])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1135] / [Intel XE#1201])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][94] -> [INCOMPLETE][95] ([Intel XE#1195]) +1 other test incomplete
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][96] ([Intel XE#1214]) +2 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [FAIL][97] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#1201]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][101] -> [FAIL][102] ([Intel XE#616]) +4 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [PASS][103] -> [DMESG-WARN][104] ([Intel XE#1088] / [Intel XE#1214])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#656]) +33 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [PASS][108] -> [SKIP][109] ([Intel XE#1201] / [Intel XE#417])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][110] ([Intel XE#616]) +2 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-adlp:         [PASS][111] -> [SKIP][112] ([Intel XE#1201] / [Intel XE#829])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][113] ([Intel XE#616]) +6 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][116] ([Intel XE#904] / [Intel XE#909])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-adlp:         [PASS][117] -> [SKIP][118] ([Intel XE#1201]) +10 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1129] / [Intel XE#1201])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-adlp:         [PASS][124] -> [SKIP][125] ([Intel XE#1201] / [Intel XE#1211])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#836]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201]) +14 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1127] / [Intel XE#1201])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][132] ([Intel XE#1174])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1201] / [Intel XE#330])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][134] -> [FAIL][135] ([Intel XE#899])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][136] -> [DMESG-WARN][137] ([Intel XE#1214] / [Intel XE#1608])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][138] -> [SKIP][139] ([Intel XE#1201] / [Intel XE#1234])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_vrr@negative-basic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [FAIL][141] ([Intel XE#1317])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1126] / [Intel XE#1201])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][145] -> [INCOMPLETE][146] ([Intel XE#1195] / [Intel XE#1473])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1201] / [Intel XE#261]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#688])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#1392]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_threads@threads-fd-userptr:
    - shard-adlp:         [PASS][152] -> [INCOMPLETE][153] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1330])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@xe_exec_threads@threads-fd-userptr.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@xe_exec_threads@threads-fd-userptr.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1201] / [Intel XE#979])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][155] ([Intel XE#1173]) +1 other test fail
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][156] -> [DMESG-WARN][157] ([Intel XE#1162] / [Intel XE#1214])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [PASS][158] -> [INCOMPLETE][159] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_vm@large-misaligned-binds-268435456:
    - shard-adlp:         [PASS][161] -> [DMESG-FAIL][162] ([Intel XE#1088] / [Intel XE#1330])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@xe_vm@large-misaligned-binds-268435456.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_vm@large-misaligned-binds-268435456.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][163] -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@core_getversion@basic.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@core_getversion@basic.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [i915#2575]) -> [PASS][166] +143 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic@test-only:
    - shard-adlp:         [DMESG-WARN][167] ([Intel XE#1214]) -> [PASS][168] +3 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_atomic@test-only.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_atomic@test-only.html

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1:
    - {shard-lnl}:        [DMESG-WARN][169] ([Intel XE#324]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-3/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#1388]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_color@ctm-0-25@pipe-d:
    - shard-adlp:         [INCOMPLETE][173] ([Intel XE#1195]) -> [PASS][174] +3 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_color@ctm-0-25@pipe-d.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_color@ctm-0-25@pipe-d.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-adlp:         [FAIL][175] ([Intel XE#581]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-left-edge.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][177] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][178] +2 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1:
    - {shard-lnl}:        [DMESG-WARN][179] ([Intel XE#1330]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-5/igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@basic-plain-flip:
    - {shard-lnl}:        [DMESG-WARN][181] ([Intel XE#1330] / [Intel XE#1537]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_flip@basic-plain-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-8/igt@kms_flip@basic-plain-flip.html
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_flip@basic-plain-flip.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-adlp:         [SKIP][185] ([Intel XE#1201]) -> [PASS][186] +5 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201]) -> [PASS][188] +337 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [DMESG-FAIL][189] ([Intel XE#1619]) -> [PASS][190] +3 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - {shard-lnl}:        [INCOMPLETE][191] -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:
    - {shard-lnl}:        [FAIL][195] ([Intel XE#1471]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [SKIP][197] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_pm_rpm@drm-resources-equal.html
    - {shard-lnl}:        [SKIP][199] ([Intel XE#1211]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_pm_rpm@drm-resources-equal.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][203] ([Intel XE#899]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed:
    - shard-adlp:         [SKIP][205] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_universal_plane@universal-plane-pageflip-windowed.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_universal_plane@universal-plane-pageflip-windowed.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][207] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][209] ([Intel XE#1214]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1:
    - {shard-lnl}:        [SKIP][211] ([Intel XE#1207]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-edp-1:
    - {shard-lnl}:        [SKIP][213] ([Intel XE#1707]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-edp-1.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1:
    - shard-adlp:         [SKIP][215] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][217] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-adlp:         [ABORT][219] ([Intel XE#1304]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - {shard-lnl}:        [INCOMPLETE][221] ([Intel XE#1602]) -> [PASS][222] +2 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_fault_mode@many-invalid-fault.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - {shard-lnl}:        [DMESG-FAIL][223] ([Intel XE#1537]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_exec_fault_mode@twice-basic-prefetch.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:
    - {shard-lnl}:        [DMESG-FAIL][225] ([Intel XE#1069] / [Intel XE#1619]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
    - shard-adlp:         [DMESG-FAIL][227] ([Intel XE#1069] / [Intel XE#1619]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-adlp:         [FAIL][229] ([Intel XE#1204]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_gt_freq@freq_low_max.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][231] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [SKIP][233] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.html
    - {shard-lnl}:        [SKIP][235] ([Intel XE#1647]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-5/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [INCOMPLETE][237] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_module_load@many-reload.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][239] ([Intel XE#1204]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_module_load@reload-no-display.html

  * igt@xe_pat@pat-index-all:
    - {shard-lnl}:        [DMESG-WARN][241] ([Intel XE#1602]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_pat@pat-index-all.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_pat@pat-index-all.html

  * igt@xe_vm@large-misaligned-binds-134217728:
    - {shard-lnl}:        [DMESG-FAIL][243] ([Intel XE#1619]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_vm@large-misaligned-binds-134217728.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@xe_vm@large-misaligned-binds-134217728.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-2097152:
    - {shard-lnl}:        [DMESG-WARN][245] ([Intel XE#1537]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-5/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [ABORT][247] ([Intel XE#1538] / [Intel XE#1689]) -> [INCOMPLETE][248] ([Intel XE#1195])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@core_hotunplug@hotreplug.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][249] -> [DMESG-WARN][250] ([Intel XE#1214])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][252] ([Intel XE#1201] / [i915#6077])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][253] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358]) -> [DMESG-WARN][254] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [i915#2575]) -> [FAIL][256] ([Intel XE#650])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [SKIP][257] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#316]) +7 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][263] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][265] ([Intel XE#1231]) -> [DMESG-FAIL][266] ([Intel XE#324])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#619])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][271] ([Intel XE#616]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#829])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201]) -> [SKIP][274] ([Intel XE#1124] / [Intel XE#1201]) +20 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#607])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#610])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#346])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][282] ([Intel XE#1201])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [i915#2575]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][285] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#829])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201]) -> [FAIL][288] ([Intel XE#650]) +1 other test fail
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1201]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201]) -> [INCOMPLETE][292] ([Intel XE#1195])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][293] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#829])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#829]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][297] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][298] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201]) -> [SKIP][300] ([Intel XE#1201] / [Intel XE#1252])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][302] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [i915#2575]) -> [SKIP][304] ([Intel XE#1201] / [Intel XE#306])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         [SKIP][305] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][306] ([Intel XE#1201])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         [SKIP][307] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][308] ([Intel XE#1201]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][310] ([Intel XE#1201])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-adlp:         [SKIP][311] ([Intel XE#1201]) -> [SKIP][312] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201] / [i915#2575]) -> [SKIP][314] ([Intel XE#1201] / [Intel XE#373]) +23 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#1201] / [i915#2575]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#307])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [i915#2575]) -> [SKIP][318] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_content_protection@lic-type-1.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-alpha-opaque:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1201] / [i915#2575]) -> [SKIP][320] ([Intel XE#1201]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_crc@cursor-alpha-opaque.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_crc@cursor-alpha-opaque.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [i915#2575]) -> [SKIP][322] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][324] ([Intel XE#1201] / [Intel XE#1234])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201] / [i915#2575]) -> [DMESG-FAIL][326] ([Intel XE#1162])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html
    - shard-adlp:         [DMESG-WARN][327] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][328] ([Intel XE#1195] / [Intel XE#927])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][329] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][330] ([Intel XE#1195])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201] / [i915#2575]) -> [FAIL][332] ([Intel XE#581])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][333] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][334] ([Intel XE#1214] / [Intel XE#282])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][335] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][336] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [i915#2575]) -> [SKIP][338] ([Intel XE#1201] / [Intel XE#323]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][340] ([Intel XE#1214] / [Intel XE#282]) +9 other tests dmesg-warn
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-adlp:         [SKIP][341] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][342] ([Intel XE#1201]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1201] / [i915#2575]) -> [SKIP][344] ([Intel XE#1201] / [Intel XE#1234])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][346] ([Intel XE#1201]) +3 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201]) -> [SKIP][348] ([Intel XE#1201] / [Intel XE#776])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1201] / [i915#2575]) -> [SKIP][350] ([Intel XE#1201] / [Intel XE#703])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [i915#2575]) -> [SKIP][352] ([Intel XE#1137] / [Intel XE#1201])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][354] ([Intel XE#1214])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1201] / [i915#2575]) -> [INCOMPLETE][356] ([Intel XE#1195])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-adlp:         [SKIP][357] ([Intel XE#1201]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#455])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1201]) -> [SKIP][360] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][361] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][362] ([Intel XE#1201]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1201]) -> [FAIL][364] ([Intel XE#616])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201]) -> [SKIP][366] ([Intel XE#1201] / [Intel XE#651]) +58 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][368] ([Intel XE#1201]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][369] ([Intel XE#1201]) -> [SKIP][370] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201]) -> [SKIP][372] ([Intel XE#1201] / [Intel XE#653]) +54 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][374] ([Intel XE#1201]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][375] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][376] ([Intel XE#1201]) +5 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201]) -> [SKIP][378] ([Intel XE#1158] / [Intel XE#1201])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [SKIP][379] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][380] ([Intel XE#1201]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1201] / [i915#2575]) -> [SKIP][382] ([Intel XE#1201] / [Intel XE#417])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [i915#2575]) -> [FAIL][384] ([Intel XE#616])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_hdr@static-toggle-suspend.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#1201] / [i915#2575]) -> [SKIP][386] ([Intel XE#1201] / [Intel XE#829])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pipe_crc_basic@hang-read-crc.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [DMESG-WARN][387] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][388] ([Intel XE#1195] / [Intel XE#927])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][389] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][390] ([Intel XE#1195])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [INCOMPLETE][391] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927]) -> [SKIP][392] ([Intel XE#1201] / [Intel XE#829])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-dg2-set2:     [FAIL][393] ([Intel XE#616]) -> [SKIP][394] ([Intel XE#1201] / [Intel XE#829])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-adlp:         [FAIL][395] ([Intel XE#361]) -> [SKIP][396] ([Intel XE#1201] / [Intel XE#455])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2-set2:     [FAIL][397] ([Intel XE#361]) -> [SKIP][398] ([Intel XE#1201] / [Intel XE#455])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#1201] / [i915#2575]) -> [SKIP][400] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][401] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][402] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][403] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][404] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1201] / [i915#2575]) -> [TIMEOUT][406] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1201] / [i915#2575]) -> [SKIP][408] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1201]) -> [SKIP][410] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1201]) -> [SKIP][412] ([Intel XE#1122] / [Intel XE#1201])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1201]) -> [SKIP][414] ([Intel XE#1201] / [Intel XE#908])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][416] ([Intel XE#1201]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1201]) -> [SKIP][418] ([Intel XE#1201] / [Intel XE#1235])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1201]) -> [SKIP][420] ([Intel XE#1201] / [Intel XE#929]) +33 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_psr@psr-dpms.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         [SKIP][421] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][422] ([Intel XE#1201]) +2 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_psr@psr2-suspend.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201] / [i915#2575]) -> [SKIP][424] ([Intel XE#1127] / [Intel XE#1201])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][426] ([Intel XE#1201] / [Intel XE#829])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1201] / [i915#2575]) -> [SKIP][428] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-adlp:         [SKIP][429] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][430] ([Intel XE#1201] / [Intel XE#578])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_setmode@basic-clone-single-crtc.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][431] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][432] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][434] ([Intel XE#1162] / [Intel XE#1214])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-adlp:         [SKIP][435] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][436] ([Intel XE#1201]) +3 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_vrr@negative-basic.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1201] / [i915#2575]) -> [SKIP][438] ([Intel XE#1201] / [Intel XE#756]) +2 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1201] / [i915#2575]) -> [SKIP][440] ([Intel XE#1091] / [Intel XE#1201]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201]) -> [FAIL][442] ([Intel XE#1050])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute@ccs-mode-compute-kernel.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1201]) -> [FAIL][444] ([Intel XE#1317])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1201]) -> [SKIP][446] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1201]) -> [SKIP][448] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201]) -> [SKIP][450] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1201]) -> [INCOMPLETE][452] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201]) -> [ABORT][454] ([Intel XE#1304])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1201]) -> [SKIP][456] ([Intel XE#1201] / [Intel XE#288]) +35 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][457] ([Intel XE#1214] / [Intel XE#358]) -> [DMESG-WARN][458] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330] / [Intel XE#358])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@xe_exec_reset@cat-error.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#1201]) -> [DMESG-WARN][460] ([Intel XE#1214])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.html
    - shard-adlp:         [DMESG-WARN][461] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330]) -> [DMESG-WARN][462] ([Intel XE#1214])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201]) -> [SKIP][464] ([Intel XE#1201] / [Intel XE#977])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1061] / [Intel XE#1201]) -> [FAIL][466] ([Intel XE#1173]) +1 other test fail
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_peer2peer@read.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3-mmap-system:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#1201]) -> [FAIL][468] ([Intel XE#1221])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@d3-mmap-system.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [FAIL][469] ([Intel XE#1257]) -> [DMESG-WARN][470] ([Intel XE#1191] / [Intel XE#1214])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_pm@s3-basic.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#1201]) -> [SKIP][472] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1201]) -> [DMESG-WARN][474] ([Intel XE#1162] / [Intel XE#1214])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1201]) -> [FAIL][476] ([Intel XE#1043] / [Intel XE#845]) +2 other tests fail
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@s4-basic-exec.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1201]) -> [SKIP][478] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_query@multigpu-query-config.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@xe_query@multigpu-query-config.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1207
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1317
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
  [Intel XE#1647]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1647
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
  [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
  [Intel XE#1707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1707
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
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/578
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7818 -> IGT_7819
  * Linux: xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf -> xe-pw-132797v1

  IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf
  xe-pw-132797v1: 132797v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/index.html

--===============3051187822618985655==
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
<tr><td><b>Series:</b></td><td>series starting with [1/4] drm/xe: Introduce a simple wedged state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132797/">https://patchwork.freedesktop.org/series/132797/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf_full -&gt; xe-pw-132797v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-132797v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132797v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132797v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446">Intel XE#1446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_content_protection@uevent.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-7efc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603">Intel XE#1603</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-4/igt@kms_plane_alpha_blend@alpha-7efc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-4/igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_psr@pr-cursor-render.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_threads@threads-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_exec_threads@threads-fd-userptr.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf_full and xe-pw-132797v1_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_plane_lowres:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132797v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_addfb_basic@invalid-get-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_addfb_basic@invalid-get-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +23 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1317">Intel XE#1317</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@xe_exec_threads@threads-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@xe_exec_threads@threads-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-268435456:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@xe_vm@large-misaligned-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_vm@large-misaligned-binds-268435456.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> +143 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_atomic@test-only.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_atomic@test-only.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-3/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388">Intel XE#1388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_color@ctm-0-25@pipe-d.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@kms_color@ctm-0-25@pipe-d.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-left-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_cursor_edge_walk@128x128-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-5/igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-8/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_flip@dpms-off-confusion-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +337 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_universal_plane@universal-plane-pageflip-windowed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_universal_plane@universal-plane-pageflip-windowed.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1207">Intel XE#1207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1707">Intel XE#1707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_fault_mode@many-invalid-fault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_exec_fault_mode@twice-basic-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-basic-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@xe_gt_freq@freq_low_max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1647">Intel XE#1647</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-5/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_module_load@many-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_pat@pat-index-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-2/igt@xe_pat@pat-index-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-134217728:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_vm@large-misaligned-binds-134217728.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-6/igt@xe_vm@large-misaligned-binds-134217728.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-2097152:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-lnl-5/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_crc@cursor-alpha-opaque.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_crc@cursor-alpha-opaque.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/578">Intel XE#578</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1317">Intel XE#1317</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-1/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@d3-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_pm@s3-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257">Intel XE#1257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-adlp-4/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@s4-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-436/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132797v1/shard-dg2-466/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7818 -&gt; IGT_7819</li>
<li>Linux: xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf -&gt; xe-pw-132797v1</li>
</ul>
<p>IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf<br />
  xe-pw-132797v1: 132797v1</p>

</body>
</html>

--===============3051187822618985655==--
