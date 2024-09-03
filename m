Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85129CD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5453810E521;
	Tue,  3 Sep 2024 12:06:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589E10E521;
 Tue,  3 Sep 2024 12:06:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8779326501272307891=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Use_xe=5Fpm=5Fruntime?=
 =?utf-8?q?=5Fget_in_xe=5Fbo=5Fmove=28=29_if_reclaim-safe=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 12:06:13 -0000
Message-ID: <172536517346.912224.8141954656608709943@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903094232.166342-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240903094232.166342-1-thomas.hellstrom@linux.intel.com>
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

--===============8779326501272307891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
URL   : https://patchwork.freedesktop.org/series/138131/
State : failure

== Summary ==

CI Bug Log - changes from xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0_full -> xe-pw-138131v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138131v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138131v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138131v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_atomic_interruptible@legacy-cursor.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_atomic_interruptible@legacy-cursor.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@srm:
    - {shard-bmg}:        [FAIL][3] ([Intel XE#1178]) -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-3/igt@kms_content_protection@srm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-4/igt@kms_content_protection@srm.html

  
Known issues
------------

  Here are the changes found in xe-pw-138131v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#2317])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#827]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#324])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#1426]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#1659])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][17] ([Intel XE#877])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#316])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@srm:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][27] ([Intel XE#1178]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#2577]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-4/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#309])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#310])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#886]) +3 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#656]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-3:
    - shard-lnl:          [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#324])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#324]) +2 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][43] -> [FAIL][44] ([Intel XE#361])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#1430])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#929])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-render.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#929])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1127] / [Intel XE#1201])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][51] -> [TIMEOUT][52] ([Intel XE#1473]) +1 other test timeout
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#1000])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#261])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#1069])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1195])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-433/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-adlp:         [PASS][62] -> [FAIL][63] ([Intel XE#1069])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@xe_exec_compute_mode@twice-basic.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-rebind.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [PASS][66] -> [DMESG-FAIL][67] ([Intel XE#1962])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][69] ([Intel XE#2514])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][71] -> [ABORT][72] ([Intel XE#1358] / [Intel XE#1607])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@xe_pm@s4-basic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][73] -> [ABORT][74] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][75] -> [ABORT][76] ([Intel XE#1794]) +1 other test abort
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][77] ([Intel XE#1033]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][79] ([Intel XE#1426]) -> [PASS][80] +3 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][81] ([Intel XE#1659]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][83] ([Intel XE#877]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_cursor_legacy@single-move.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_cursor_legacy@single-move.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - {shard-bmg}:        [INCOMPLETE][85] ([Intel XE#2635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][89] ([Intel XE#324]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][91] ([Intel XE#324]) -> [PASS][92] +2 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-4/igt@kms_plane@plane-position-hole.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][93] ([Intel XE#1430]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][95] ([Intel XE#899]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][97] ([Intel XE#899]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [ABORT][99] ([Intel XE#1034] / [Intel XE#2625]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [ABORT][101] ([Intel XE#1034]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][103] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][105] ([Intel XE#1000]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][107] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-dg2-set2:     [TIMEOUT][109] ([Intel XE#1473]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - {shard-bmg}:        [DMESG-WARN][111] ([Intel XE#877]) -> [PASS][112] +6 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-3/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          [DMESG-WARN][113] ([Intel XE#1616]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-7/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][115] ([Intel XE#958]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-adlp:         [FAIL][117] -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#873]) -> [SKIP][120] ([Intel XE#873])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#316]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][124] ([Intel XE#316]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][125] ([Intel XE#324]) -> [FAIL][126] ([Intel XE#1231])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#607]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#607])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][130] ([Intel XE#1124]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#610]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#610])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1124]) -> [SKIP][134] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#346]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#346])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][138] ([Intel XE#2191])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#2191]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#2191]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][142] ([Intel XE#367]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#367]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][146] ([Intel XE#1252])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#787]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][150] ([Intel XE#787]) +62 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1252]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#1252])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][156] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][158] ([Intel XE#314])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#314]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1152]) -> [SKIP][162] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#373]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#306]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#306])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][168] ([Intel XE#373]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][170] ([Intel XE#307]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#307]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#307])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][174] ([Intel XE#308]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#308]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#308])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#323]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#323])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][180] ([Intel XE#1137])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#455]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#455]) +19 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][184] ([Intel XE#455]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][186] ([Intel XE#651]) +18 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#651]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#651]) +29 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][190] ([Intel XE#653]) +18 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#653]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#653]) +29 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-WARN][193] ([Intel XE#324]) -> [DMESG-FAIL][194] ([Intel XE#324])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_plane@plane-position-covered.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#498]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][200] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][202] ([Intel XE#2318]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#870]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#870])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#908]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#908])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1489]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][210] ([Intel XE#1489]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1122]) -> [SKIP][212] ([Intel XE#1122] / [Intel XE#1201])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][214] ([Intel XE#929]) +8 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_psr@pr-basic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#929]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1149]) -> [SKIP][218] ([Intel XE#1149] / [Intel XE#1201])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][220] ([Intel XE#327]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#327]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#327])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#1500])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2168]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#2168])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_vrr@lobf.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#756]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#756])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][230] ([Intel XE#756])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1123]) -> [SKIP][234] ([Intel XE#1123] / [Intel XE#1201])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][236] ([Intel XE#1126]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [FAIL][237] ([Intel XE#1000]) -> [TIMEOUT][238] ([Intel XE#1473])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - shard-adlp:         [DMESG-WARN][239] ([Intel XE#1638] / [Intel XE#358]) -> [TIMEOUT][240] ([Intel XE#2662])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@xe_exec_balancer@twice-parallel-basic.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#288]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][244] ([Intel XE#288]) +15 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][246] ([Intel XE#2360])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#560]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#560])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_media_fill@media-fill.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#512]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#512])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_mmap@small-bar.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#378]) -> [SKIP][252] ([Intel XE#1201] / [Intel XE#378])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_module_load@force-load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_module_load@force-load.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][254] ([Intel XE#2541]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_oa@rc6-disable.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2541]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#977]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#977])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][262] ([Intel XE#944]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#944]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][266] ([Intel XE#1130])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_wedged@basic-wedged.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2662]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2662
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0 -> xe-pw-138131v1

  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0: dd987a9431a336ddbfc6bfe9720f4783a6bc94b0
  xe-pw-138131v1: 138131v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/index.html

--===============8779326501272307891==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138131/">https://patchwork.freedesktop.org/series/138131/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0_full -&gt; xe-pw-138131v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138131v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138131v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138131v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_atomic_interruptible@legacy-cursor:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_atomic_interruptible@legacy-cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_atomic_interruptible@legacy-cursor.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_content_protection@srm:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-3/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-4/igt@kms_content_protection@srm.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138131v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-4/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-433/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_exec_compute_mode@twice-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_cursor_legacy@single-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-3/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-7/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-lnl-3/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-adlp-1/igt@xe_exec_balancer@twice-parallel-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-adlp-2/igt@xe_exec_balancer@twice-parallel-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2662">Intel XE#2662</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0/shard-dg2-433/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0 -&gt; xe-pw-138131v1</li>
</ul>
<p>IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0: dd987a9431a336ddbfc6bfe9720f4783a6bc94b0<br />
  xe-pw-138131v1: 138131v1</p>

</body>
</html>

--===============8779326501272307891==--
