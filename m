Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF8D606A31A
	for <intel-xe@archiver.kernel.org>; Sat, 31 Oct 2026 16:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4557410E316;
	Sat, 31 Oct 2026 16:26:29 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D0210E316;
 Sat, 31 Oct 2026 16:26:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8751784967092139498=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/vrr=3A_HDMI_2=2E1?=
 =?utf-8?q?_VRR_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Stead" <alan.stead@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 31 Oct 2026 16:26:28 -0000
Message-ID: <179346398841.97721.5163111521240148380@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030203314.1085262-1-alan.stead@intel.com>
In-Reply-To: <20261030203314.1085262-1-alan.stead@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8751784967092139498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: HDMI 2.1 VRR support
URL   : https://patchwork.freedesktop.org/series/177287/
State : failure

== Summary ==

CI Bug Log - changes from xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6_FULL -> xe-pw-177287v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-177287v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177287v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177287v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:
    - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-7/igt@xe_pm@s4-exec-after.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-3/igt@xe_pm@s4-exec-after.html

  
Known issues
------------

  Here are the changes found in xe-pw-177287v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-with-load:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#8749])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@core_hotunplug@hotreplug-with-load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@core_hotunplug@hotreplug-with-load.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#8098] / [Intel XE#9561]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1231])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2652]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#6707] / [Intel XE#7439])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html

  * igt@xe_exec_system_allocator@many-mmap-race-nomemset:
    - shard-bmg:          [PASS][16] -> [DMESG-WARN][17] ([Intel XE#7774])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_system_allocator@many-mmap-race-nomemset.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_system_allocator@many-mmap-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#8589]) +60 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [PASS][20] -> [ABORT][21] ([Intel XE#9362]) +1 other test abort
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-5/igt@xe_pm@s4-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][22] -> [ABORT][23] ([Intel XE#9362]) +2 other tests abort
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][24] -> [FAIL][25] ([Intel XE#9254])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8589]) +27 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][27] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [FAIL][29] ([Intel XE#1231]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][31] ([Intel XE#301]) -> [PASS][32] +1 other test pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [FAIL][33] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][34] +1 other test pass
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-4/igt@kms_vrr@flip-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-3/igt@kms_vrr@flip-basic.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-lnl:          [FAIL][35] ([Intel XE#7850]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-4/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][37] ([Intel XE#9254]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][39] ([Intel XE#2327]) -> [SKIP][40] ([Intel XE#8589])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          [SKIP][41] ([Intel XE#1124]) -> [SKIP][42] ([Intel XE#8589]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][43] ([Intel XE#2887]) -> [SKIP][44] ([Intel XE#8589])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          [SKIP][45] ([Intel XE#7358]) -> [SKIP][46] ([Intel XE#8589])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][47] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][48] ([Intel XE#8589])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_content_protection@legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][49] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][50] ([Intel XE#8589])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][51] ([Intel XE#4141]) -> [SKIP][52] ([Intel XE#8589]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][53] ([Intel XE#2311]) -> [SKIP][54] ([Intel XE#8589]) +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][55] ([Intel XE#2313]) -> [SKIP][56] ([Intel XE#8589]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][57] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][58] ([Intel XE#8589])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][59] ([Intel XE#7283]) -> [SKIP][60] ([Intel XE#8589])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][61] ([Intel XE#1489]) -> [SKIP][62] ([Intel XE#8589])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][63] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][64] ([Intel XE#1729] / [Intel XE#7424])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][65] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][66] ([Intel XE#2426] / [Intel XE#5848])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          [SKIP][67] ([Intel XE#8370]) -> [SKIP][68] ([Intel XE#8589])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_evict@evict-threads-small-multi-queue.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-bmg:          [SKIP][69] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][70] ([Intel XE#8589])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_multi_queue@few-execs-userptr:
    - shard-bmg:          [SKIP][71] ([Intel XE#8364]) -> [SKIP][72] ([Intel XE#8589]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-userptr.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-basic:
    - shard-bmg:          [SKIP][73] ([Intel XE#8378]) -> [SKIP][74] ([Intel XE#8589]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-basic.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-basic.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          [SKIP][75] ([Intel XE#7793]) -> [SKIP][76] ([Intel XE#8589])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_page_reclaim@boundary-split.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [DMESG-WARN][77] ([Intel XE#7727]) -> [ABORT][78] ([Intel XE#9362])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-1/igt@xe_pm@s4-mocs.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [ABORT][79] ([Intel XE#9368]) -> [ABORT][80] ([Intel XE#9362])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-4/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][81] ([Intel XE#9365]) -> [SKIP][82] ([Intel XE#8589])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_survivability@runtime-survivability.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9368
  [Intel XE#9561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561


Build changes
-------------

  * Linux: xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6 -> xe-pw-177287v1

  IGT_9173: 9173
  xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6: 238c1e3e984e2b7f948cb24165314b8d719a23d6
  xe-pw-177287v1: 177287v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/index.html

--===============8751784967092139498==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: HDMI 2.1 VRR support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177287/">https://patchwork.freedesktop.org/series/177287/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6_FULL -&gt; xe-pw-177287v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-177287v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-177287v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-177287v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-7/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-3/igt@xe_pm@s4-exec-after.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177287v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@core_hotunplug@hotreplug-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@core_hotunplug@hotreplug-with-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098">Intel XE#8098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561">Intel XE#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_system_allocator@many-mmap-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_system_allocator@many-mmap-race-nomemset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-5/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-7/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +27 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-4/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-3/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-lnl-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-lnl-4/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-1/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-ptl-8/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9368">Intel XE#9368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-ptl-4/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177287v1/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6 -&gt; xe-pw-177287v1</li>
</ul>
<p>IGT_9173: 9173<br />
  xe-6036-238c1e3e984e2b7f948cb24165314b8d719a23d6: 238c1e3e984e2b7f948cb24165314b8d719a23d6<br />
  xe-pw-177287v1: 177287v1</p>

</body>
</html>

--===============8751784967092139498==--
