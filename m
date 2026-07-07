Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835FAC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 14:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E59910E4DD;
	Tue,  7 Jul 2026 14:53:32 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551510E4D3;
 Tue,  7 Jul 2026 14:53:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2461950089444531451=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/dp=5Flink=3A_Unif?=
 =?utf-8?q?y_modeset/fallback_config_selection_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jul 2026 14:53:30 -0000
Message-ID: <178343601086.160769.11774395801861268370@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701153204.4124150-1-imre.deak@intel.com>
In-Reply-To: <20260701153204.4124150-1-imre.deak@intel.com>
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

--===============2461950089444531451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_link: Unify modeset/fallback config selection (rev5)
URL   : https://patchwork.freedesktop.org/series/169636/
State : failure

== Summary ==

CI Bug Log - changes from xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165_FULL -> xe-pw-169636v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169636v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169636v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169636v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html

  
New tests
---------

  New tests have been introduced between xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165_FULL and xe-pw-169636v5_FULL:

### New IGT tests (77) ###

  * igt@kms_flip@absolute-wf_vblank@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_flip@absolute-wf_vblank@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.15] s

  * igt@kms_flip@absolute-wf_vblank@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.15] s

  * igt@kms_flip@blocking-wf_vblank@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.43] s

  * igt@kms_flip@blocking-wf_vblank@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.44] s

  * igt@kms_flip@dpms-off-confusion@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.15] s

  * igt@kms_flip@dpms-off-confusion@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_flip@dpms-off-confusion@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.09] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.51] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.44] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.49] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.43] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.43] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.15] s

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.09] s

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.07] s

  * igt@kms_flip@flip-vs-panning@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.17] s

  * igt@kms_flip@flip-vs-panning@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.09] s

  * igt@kms_flip@flip-vs-panning@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.07] s

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_flip@nonexisting-fb-interruptible@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_flip@nonexisting-fb-interruptible@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_flip@nonexisting-fb-interruptible@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_flip@nonexisting-fb@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_flip@nonexisting-fb@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_flip@nonexisting-fb@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.34] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  * igt@kms_flip@plain-flip-fb-recreate@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.44] s

  * igt@kms_flip@plain-flip-fb-recreate@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.36] s

  * igt@kms_flip@plain-flip-fb-recreate@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.37] s

  * igt@kms_flip@plain-flip-ts-check@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.43] s

  * igt@kms_flip@plain-flip-ts-check@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@plain-flip-ts-check@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@xe_oa@blocking:
    - Statuses : 2 pass(s)
    - Exec time: [1.05, 1.06] s

  * igt@xe_oa@buffer-fill:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@xe_oa@create-destroy-userspace-config:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_oa@enable-disable:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@xe_oa@invalid-create-userspace-config:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@invalid-map-oa-buffer:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_oa@invalid-oa-exponent:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_oa@invalid-oa-format-id:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_oa@invalid-oa-metric-set-id:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_oa@invalid-remove-userspace-config:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_oa@map-oa-buffer:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.14] s

  * igt@xe_oa@mi-rpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@xe_oa@missing-sample-flags:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_oa@mmio-triggered-reports:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.34] s

  * igt@xe_oa@non-privileged-access-vaddr:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_oa@non-sampling-read-error:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_oa@non-system-wide-paranoid:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_oa@non-zero-reason:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@xe_oa@oa-exponents:
    - Statuses : 2 pass(s)
    - Exec time: [3.46, 3.52] s

  * igt@xe_oa@oa-formats:
    - Statuses : 2 pass(s)
    - Exec time: [0.21] s

  * igt@xe_oa@oa-regs-whitelisted:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_oa@oa-tlb-invalidate:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - Statuses : 2 pass(s)
    - Exec time: [1.03, 1.05] s

  * igt@xe_oa@polling:
    - Statuses : 2 pass(s)
    - Exec time: [1.06] s

  * igt@xe_oa@polling-small-buf:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_oa@privileged-forked-access-vaddr:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_oa@rc6-disable:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.23] s

  * igt@xe_oa@short-reads:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@xe_oa@stress-open-close:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.23] s

  * igt@xe_oa@sysctl-defaults:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.16] s

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in xe-pw-169636v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-lnl:          NOTRUN -> [ABORT][5] ([Intel XE#8007])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2252]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][7] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][8] -> [ABORT][9] ([Intel XE#1727])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2:
    - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] ([Intel XE#8398])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2286] / [Intel XE#6035])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#6266]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#3321]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7178] / [Intel XE#7351])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061] / [Intel XE#7356])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2311]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2313]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7283]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8374]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-imm.html

  * igt@xe_exec_multi_queue@max-queues-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#8364]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-close-fd-smem.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [PASS][26] -> [ABORT][27] ([Intel XE#8007])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6964])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][29] ([Intel XE#7695])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_pat@pat-sw-hw-compare.html

  
#### Possible fixes ####

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [INCOMPLETE][30] -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][32] ([Intel XE#8568]) -> [PASS][33] +2 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          [ABORT][34] ([Intel XE#8007]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][36] ([Intel XE#8007]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][38] ([Intel XE#3544]) -> [SKIP][39] ([Intel XE#3374] / [Intel XE#3544])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][40] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][41] ([Intel XE#1729] / [Intel XE#7424])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][42] ([Intel XE#6281] / [Intel XE#7426]) -> [ABORT][43] ([Intel XE#8007])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8398]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8398
  [Intel XE#8568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8568


Build changes
-------------

  * Linux: xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165 -> xe-pw-169636v5

  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165: 96e9ac36699d58791b67aea5e1d258074ea63165
  xe-pw-169636v5: 169636v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/index.html

--===============2461950089444531451==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_link: Unify modeset/fallback config selection (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169636/">https://patchwork.freedesktop.org/series/169636/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165_FULL -&gt; xe-pw-169636v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169636v5_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169636v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169636v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165_FULL and xe-pw-169636v5_FULL:</p>
<h3>New IGT tests (77)</h3>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.05, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.46, 3.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.03, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@sysctl-defaults:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169636v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8398">Intel XE#8398</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8568">Intel XE#8568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169636v5/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165 -&gt; xe-pw-169636v5</li>
</ul>
<p>IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165: 96e9ac36699d58791b67aea5e1d258074ea63165<br />
  xe-pw-169636v5: 169636v5</p>

</body>
</html>

--===============2461950089444531451==--
