Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47A6C021A0
	for <intel-xe@archiver.kernel.org>; Sat, 15 Feb 2025 21:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6C310E0BE;
	Sat, 15 Feb 2025 21:00:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F9D10E0BE;
 Sat, 15 Feb 2025 21:00:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4014395908871882361=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe=5Fdrm=5Fclient?=
 =?utf-8?q?=3A_Add_per_drm_client_reset_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Feb 2025 21:00:40 -0000
Message-ID: <173965324015.2743284.15615551659793906927@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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

--===============4014395908871882361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_drm_client: Add per drm client reset stats
URL   : https://patchwork.freedesktop.org/series/144903/
State : failure

== Summary ==

CI Bug Log - changes from xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36_full -> xe-pw-144903v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144903v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144903v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144903v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3] +47 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@xe_evict@evict-large-external-cm.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-imm:
    - shard-lnl:          [PASS][4] -> [ABORT][5] +15 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-5/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-lnl-6/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-dg2-set2:     [PASS][6] -> [ABORT][7] +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@xe_exec_reset@cm-gt-reset.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][8] -> [ABORT][9] +16 other tests abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_reset@virtual-gt-reset:
    - shard-adlp:         [PASS][10] -> [ABORT][11] +2 other tests abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@xe_exec_reset@virtual-gt-reset.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-4/igt@xe_exec_reset@virtual-gt-reset.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:
    - shard-lnl:          [PASS][12] -> [DMESG-WARN][13] +39 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-lnl-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-adlp:         [SKIP][14] ([Intel XE#455]) -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][16] ([Intel XE#3868]) -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@xe_exec_reset@cat-error.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][18] ([Intel XE#3868]) -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - shard-bmg:          [DMESG-WARN][20] ([Intel XE#4172]) -> [DMESG-WARN][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-144903v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1033]) +1 other test dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#4172]) +2 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +14 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2907])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4010])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1178])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#309])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#4302])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#4173])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2373])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#310]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][44] -> [SKIP][45] ([Intel XE#310])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#1033]) +2 other tests dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2316]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2049])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@dpms-off-confusion.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-466/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@dpms-off-confusion@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#2049])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-466/igt@kms_flip@dpms-off-confusion@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#301]) +4 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][55] -> [DMESG-WARN][56] ([Intel XE#2953]) +1 other test dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][59] -> [DMESG-FAIL][60] ([Intel XE#1033]) +1 other test dmesg-fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][61] -> [FAIL][62] ([Intel XE#1874])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#656]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#656]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#653])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#836])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1489])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_vblank@wait-idle@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][71] ([Intel XE#1033]) +1 other test dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_vblank@wait-idle@pipe-d-hdmi-a-6.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2905])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#288]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [PASS][74] -> [DMESG-WARN][75] ([Intel XE#3876])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#1192])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@xe_live_ktest@xe_bo.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@xe_live_ktest@xe_bo.html

  
#### Possible fixes ####

  * igt@kms_atomic@test-only:
    - shard-bmg:          [DMESG-WARN][78] ([Intel XE#4172]) -> [PASS][79] +2 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_atomic@test-only.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_atomic@test-only.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][80] ([Intel XE#3908]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-bmg:          [DMESG-WARN][82] ([Intel XE#877]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_color@legacy-gamma-reset.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][84] ([Intel XE#2291]) -> [PASS][85] +2 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#4302]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-busy-flip:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#310]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-busy-flip.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][90] ([Intel XE#2316]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][92] ([Intel XE#2882]) -> [PASS][93] +2 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][94] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][96] ([Intel XE#301]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-adlp:         [DMESG-WARN][98] -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#656]) -> [PASS][101] +3 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#309]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][104] ([Intel XE#718]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#455]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][108] ([Intel XE#2142]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - shard-dg2-set2:     [DMESG-WARN][110] ([Intel XE#1033]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@xe_intel_bb@intel-bb-blit-x.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@xe_intel_bb@intel-bb-blit-x.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-adlp:         [DMESG-WARN][112] ([Intel XE#2953]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@xe_pm@d3hot-mmap-system.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][114] ([Intel XE#4173]) -> [PASS][115] +4 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html

  
#### Warnings ####

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][117] ([Intel XE#787]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#787]) -> [SKIP][119] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][120] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [INCOMPLETE][121] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4010])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][122] ([Intel XE#1178]) -> [SKIP][123] ([Intel XE#455]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#455]) -> [FAIL][125] ([Intel XE#1178])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_content_protection@srm.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [DMESG-WARN][126] ([Intel XE#4172]) -> [SKIP][127] ([Intel XE#2291])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][128] ([Intel XE#2311]) -> [SKIP][129] ([Intel XE#2312]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][130] ([Intel XE#2312]) -> [SKIP][131] ([Intel XE#2311]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][132] ([Intel XE#4141]) -> [SKIP][133] ([Intel XE#2312]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][134] ([Intel XE#2312]) -> [SKIP][135] ([Intel XE#4141])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#651]) -> [SKIP][137] ([Intel XE#656]) +8 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#656]) -> [SKIP][139] ([Intel XE#651]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#656]) -> [SKIP][141] ([Intel XE#653]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][142] ([Intel XE#2312]) -> [SKIP][143] ([Intel XE#2313]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#653]) -> [SKIP][145] ([Intel XE#656]) +8 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][146] ([Intel XE#2313]) -> [SKIP][147] ([Intel XE#2312]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [ABORT][148] ([Intel XE#1033] / [Intel XE#2625] / [Intel XE#4080]) -> [DMESG-WARN][149] ([Intel XE#1033])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][150] ([Intel XE#1033] / [Intel XE#2625]) -> [DMESG-WARN][151] ([Intel XE#1033])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1500]) -> [SKIP][153] ([Intel XE#362])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4080
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 -> xe-pw-144903v1

  IGT_8230: 8230
  xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36: 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36
  xe-pw-144903v1: 144903v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/index.html

--===============4014395908871882361==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_drm_client: Add per drm client reset stats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144903/">https://patchwork.freedesktop.org/series/144903/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36_full -&gt; xe-pw-144903v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144903v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144903v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144903v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@xe_evict@evict-large-external-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@xe_evict@evict-large-external-cm.html">DMESG-WARN</a> +47 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-5/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-lnl-6/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html">ABORT</a> +15 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@xe_exec_reset@cm-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@xe_exec_reset@cm-gt-reset.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html">ABORT</a> +16 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@xe_exec_reset@virtual-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-4/igt@xe_exec_reset@virtual-gt-reset.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-lnl-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate-race.html">DMESG-WARN</a> +39 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144903v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@dpms-off-confusion.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-466/igt@kms_flip@dpms-off-confusion.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-466/igt@kms_flip@dpms-off-confusion@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_vblank@wait-idle@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_atomic@test-only.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_atomic@test-only.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_color@legacy-gamma-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_color@legacy-gamma-reset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_flip@2x-busy-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@xe_intel_bb@intel-bb-blit-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-8/igt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@xe_pm@d3hot-mmap-system.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-433/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4080">Intel XE#4080</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144903v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 -&gt; xe-pw-144903v1</li>
</ul>
<p>IGT_8230: 8230<br />
  xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36: 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36<br />
  xe-pw-144903v1: 144903v1</p>

</body>
</html>

--===============4014395908871882361==--
