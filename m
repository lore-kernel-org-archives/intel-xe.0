Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F7C606A31A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 20:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B713610E0D4;
	Sun, 22 Nov 2026 20:25:03 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CCF10E0D4;
 Sun, 22 Nov 2026 20:25:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6545507270230941698=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Cleanup_OA_stream_on_PCI_u?=
 =?utf-8?q?nbind/remove_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 22 Nov 2026 20:25:02 -0000
Message-ID: <179537910246.66856.8706135091076253329@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
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

--===============6545507270230941698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleanup OA stream on PCI unbind/remove (rev9)
URL   : https://patchwork.freedesktop.org/series/177300/
State : success

== Summary ==

CI Bug Log - changes from xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0_FULL -> xe-pw-177300v9_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-177300v9_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#367])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5822])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#6969]) +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][5] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5832] / [Intel XE#6974])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#301])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5812]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#1503])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#7283])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@xe_exec_balancer@no-exec-virtual-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#7482])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@xe_exec_balancer@no-exec-virtual-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - shard-bmg:          [PASS][16] -> [ABORT][17] ([Intel XE#9463])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:
    - shard-ptl:          [FAIL][18] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][20] ([Intel XE#8399]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [SKIP][22] -> [PASS][23] +1 other test pass
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [FAIL][24] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][26] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][28] ([Intel XE#8589]) -> [PASS][29] +101 other tests pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise:
    - shard-bmg:          [DMESG-FAIL][30] ([Intel XE#7774]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - shard-bmg:          [FAIL][32] -> [PASS][33] +3 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [ABORT][34] ([Intel XE#9362]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-4/igt@xe_pm@s4-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][36] ([Intel XE#8589]) -> [SKIP][37] ([Intel XE#1124]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][38] ([Intel XE#8589]) -> [SKIP][39] ([Intel XE#2887]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          [SKIP][40] ([Intel XE#8589]) -> [SKIP][41] ([Intel XE#2252]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][42] ([Intel XE#8589]) -> [SKIP][43] ([Intel XE#7358])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          [SKIP][44] ([Intel XE#8589]) -> [SKIP][45] ([Intel XE#6974])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][46] ([Intel XE#8589]) -> [SKIP][47] ([Intel XE#2320])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][48] ([Intel XE#8589]) -> [SKIP][49] ([Intel XE#7061] / [Intel XE#7356])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][50] ([Intel XE#8589]) -> [SKIP][51] ([Intel XE#2311]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          [SKIP][52] ([Intel XE#8589]) -> [SKIP][53] ([Intel XE#7399])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][54] ([Intel XE#8589]) -> [SKIP][55] ([Intel XE#2313]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][56] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][57] ([Intel XE#3544])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-bmg:          [SKIP][58] ([Intel XE#8589]) -> [SKIP][59] ([Intel XE#7283])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][60] ([Intel XE#8589]) -> [SKIP][61] ([Intel XE#2234] / [Intel XE#2850])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_psr@pr-sprite-render.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_psr@pr-sprite-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][62] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][63] ([Intel XE#2426] / [Intel XE#5848])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][64] ([Intel XE#8589]) -> [SKIP][65] ([Intel XE#2450] / [Intel XE#5857])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          [SKIP][66] ([Intel XE#8589]) -> [SKIP][67] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem:
    - shard-bmg:          [SKIP][68] ([Intel XE#8589]) -> [SKIP][69] ([Intel XE#8364]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          [SKIP][70] ([Intel XE#8589]) -> [SKIP][71] ([Intel XE#8378]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          [SKIP][72] ([Intel XE#8589]) -> [SKIP][73] ([Intel XE#7793])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][74] ([Intel XE#8589]) -> [SKIP][75] ([Intel XE#2284] / [Intel XE#7370])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][76] ([Intel XE#9762]) -> [DMESG-WARN][77] ([Intel XE#9365])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-3/igt@xe_survivability@runtime-survivability.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-5/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762


Build changes
-------------

  * Linux: xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 -> xe-pw-177300v9

  IGT_9201: 9201
  xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0
  xe-pw-177300v9: 177300v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/index.html

--===============6545507270230941698==
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
<tr><td><b>Series:</b></td><td>Cleanup OA stream on PCI unbind/remove (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177300/">https://patchwork.freedesktop.org/series/177300/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0_FULL -&gt; xe-pw-177300v9_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177300v9_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@xe_exec_balancer@no-exec-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">PASS</a> +101 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-4/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-ptl-6/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-10/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-3/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762">Intel XE#9762</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v9/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 -&gt; xe-pw-177300v9</li>
</ul>
<p>IGT_9201: 9201<br />
  xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0<br />
  xe-pw-177300v9: 177300v9</p>

</body>
</html>

--===============6545507270230941698==--
