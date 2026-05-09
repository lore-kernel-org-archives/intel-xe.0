Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30B9CD343F
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 05:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32B410E0FD;
	Sat,  9 May 2026 05:40:28 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692AE10E03A;
 Sat,  9 May 2026 05:40:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4491501807467943392=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C1/2=5D_gpu/buddy=3A_replace_dual-tree/force=5Fmerge_with_decou?=
 =?utf-8?q?pled_clear_tracker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 May 2026 05:40:28 -0000
Message-ID: <177830522842.54442.13038873359625813066@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508162310.57080-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260508162310.57080-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============4491501807467943392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
URL   : https://patchwork.freedesktop.org/series/166232/
State : failure

== Summary ==

CI Bug Log - changes from xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd_FULL -> xe-pw-166232v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166232v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166232v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166232v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-bmg:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-10/igt@xe_vm@bind-array-enobufs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-1/igt@xe_vm@bind-array-enobufs.html

  
Known issues
------------

  Here are the changes found in xe-pw-166232v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2320])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#2291])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#2316])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#7865]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#7905]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2313])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#1503])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#7922]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-9/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#1503] / [Intel XE#7915])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_hdr@static-swap.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#7915]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][23] -> [INCOMPLETE][24] ([Intel XE#6321])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6874])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][26] ([Intel XE#2291]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][28] ([Intel XE#2291] / [Intel XE#7343]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-bmg:          [DMESG-WARN][30] ([Intel XE#5354]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][32] ([Intel XE#2316]) -> [PASS][33] +2 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][34] ([Intel XE#7865]) -> [PASS][35] +5 other tests pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][36] ([Intel XE#7905]) -> [PASS][37] +2 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][38] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][39] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][40] ([Intel XE#2312] / [Intel XE#7905]) -> [SKIP][41] ([Intel XE#2311]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][42] ([Intel XE#2311]) -> [SKIP][43] ([Intel XE#2312] / [Intel XE#7905]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][44] ([Intel XE#2311]) -> [SKIP][45] ([Intel XE#7905]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][46] ([Intel XE#7905]) -> [SKIP][47] ([Intel XE#2311]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][48] ([Intel XE#2312] / [Intel XE#7905]) -> [SKIP][49] ([Intel XE#4141])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][50] ([Intel XE#4141]) -> [SKIP][51] ([Intel XE#2312] / [Intel XE#7905]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][52] ([Intel XE#2313]) -> [SKIP][53] ([Intel XE#2312] / [Intel XE#7905]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:
    - shard-bmg:          [SKIP][54] ([Intel XE#7905]) -> [SKIP][55] ([Intel XE#2313]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][56] ([Intel XE#2312] / [Intel XE#7905]) -> [SKIP][57] ([Intel XE#2313]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][58] ([Intel XE#2313]) -> [SKIP][59] ([Intel XE#7905]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          [SKIP][60] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][61] ([Intel XE#3904] / [Intel XE#7342])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-270.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][62] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][63] ([Intel XE#2426] / [Intel XE#5848])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935


Build changes
-------------

  * Linux: xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd -> xe-pw-166232v1

  IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd: 77eab7037c06504f1d405c099a263cfe1ff84dcd
  xe-pw-166232v1: 166232v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/index.html

--===============4491501807467943392==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166232/">https://patchwork.freedesktop.org/series/166232/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd_FULL -&gt; xe-pw-166232v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166232v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166232v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166232v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-10/igt@xe_vm@bind-array-enobufs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-1/igt@xe_vm@bind-array-enobufs.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166232v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-9/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166232v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd -&gt; xe-pw-166232v1</li>
</ul>
<p>IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd: 77eab7037c06504f1d405c099a263cfe1ff84dcd<br />
  xe-pw-166232v1: 166232v1</p>

</body>
</html>

--===============4491501807467943392==--
