Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE781606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 00:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF6A10E098;
	Mon, 23 Nov 2026 00:09:32 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4410E098;
 Mon, 23 Nov 2026 00:09:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6764528794014432816=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/ttm=3A_Don=27t_warn_on?=
 =?utf-8?q?_oversized_page_directory_allocations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Nov 2026 00:09:30 -0000
Message-ID: <179539257085.67046.15015205862124155318@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261121095703.1571697-2-shuicheng.lin@intel.com>
In-Reply-To: <20261121095703.1571697-2-shuicheng.lin@intel.com>
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

--===============6764528794014432816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Don't warn on oversized page directory allocations (rev2)
URL   : https://patchwork.freedesktop.org/series/179273/
State : failure

== Summary ==

CI Bug Log - changes from xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0_FULL -> xe-pw-179273v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-179273v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-179273v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-179273v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-ptl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-179273v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5808])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#367]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5822])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#6969]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-6/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5832] / [Intel XE#6974])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#9539])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#2316])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5812]) +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#1503])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#7283])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@xe_exec_balancer@no-exec-virtual-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#7482]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@xe_exec_balancer@no-exec-virtual-userptr.html

  * igt@xe_exec_multi_queue@many-execs-dyn-priority-smem:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#8364])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@xe_exec_multi_queue@many-execs-dyn-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#8378])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#6964])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:
    - shard-ptl:          [FAIL][22] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][23] +1 other test pass
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][24] ([Intel XE#8399]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [SKIP][26] -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [FAIL][28] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][30] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][32] ([Intel XE#8589]) -> [PASS][33] +101 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise:
    - shard-bmg:          [DMESG-FAIL][34] ([Intel XE#7774]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - shard-bmg:          [FAIL][36] ([Intel XE#9824]) -> [PASS][37] +3 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [ABORT][38] ([Intel XE#9362]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-4/igt@xe_pm@s4-basic.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][40] ([Intel XE#9254]) -> [PASS][41] +1 other test pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][42] ([Intel XE#8589]) -> [SKIP][43] ([Intel XE#1124]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][44] ([Intel XE#8589]) -> [SKIP][45] ([Intel XE#2887]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          [SKIP][46] ([Intel XE#8589]) -> [SKIP][47] ([Intel XE#2252]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][48] ([Intel XE#8589]) -> [SKIP][49] ([Intel XE#7358])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          [SKIP][50] ([Intel XE#8589]) -> [SKIP][51] ([Intel XE#6974])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][52] ([Intel XE#8589]) -> [SKIP][53] ([Intel XE#2320])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][54] ([Intel XE#8589]) -> [SKIP][55] ([Intel XE#7061] / [Intel XE#7356])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][56] ([Intel XE#8589]) -> [SKIP][57] ([Intel XE#2311]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          [SKIP][58] ([Intel XE#8589]) -> [SKIP][59] ([Intel XE#7399])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][60] ([Intel XE#8589]) -> [SKIP][61] ([Intel XE#2313]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][62] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][63] ([Intel XE#3544])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-bmg:          [SKIP][64] ([Intel XE#8589]) -> [SKIP][65] ([Intel XE#7283])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][66] ([Intel XE#8589]) -> [SKIP][67] ([Intel XE#2234] / [Intel XE#2850])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_psr@pr-sprite-render.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_psr@pr-sprite-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][68] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][69] ([Intel XE#2426] / [Intel XE#5848])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][70] ([Intel XE#8589]) -> [SKIP][71] ([Intel XE#2450] / [Intel XE#5857])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          [SKIP][72] ([Intel XE#8589]) -> [SKIP][73] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem:
    - shard-bmg:          [SKIP][74] ([Intel XE#8589]) -> [SKIP][75] ([Intel XE#8364]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          [SKIP][76] ([Intel XE#8589]) -> [SKIP][77] ([Intel XE#8378]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          [SKIP][78] ([Intel XE#8589]) -> [SKIP][79] ([Intel XE#7793])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][80] ([Intel XE#8589]) -> [SKIP][81] ([Intel XE#2284] / [Intel XE#7370])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][82] ([Intel XE#9762]) -> [DMESG-WARN][83] ([Intel XE#9365])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-3/igt@xe_survivability@runtime-survivability.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
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
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9539
  [Intel XE#9762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762
  [Intel XE#9824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9824


Build changes
-------------

  * Linux: xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 -> xe-pw-179273v2

  IGT_9201: 9201
  xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0
  xe-pw-179273v2: 179273v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/index.html

--===============6764528794014432816==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Don&#x27;t warn on oversized page directory allocations (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179273/">https://patchwork.freedesktop.org/series/179273/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0_FULL -&gt; xe-pw-179273v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-179273v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-179273v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-179273v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane@plane-panning-bottom-right-suspend:<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179273v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-6/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9539">Intel XE#9539</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@xe_exec_balancer@no-exec-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-dyn-priority-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@xe_exec_multi_queue@many-execs-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-7/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">PASS</a> +101 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9824">Intel XE#9824</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-ptl-4/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-ptl-2/igt@xe_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0/shard-bmg-3/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762">Intel XE#9762</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179273v2/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 -&gt; xe-pw-179273v2</li>
</ul>
<p>IGT_9201: 9201<br />
  xe-6199-3efe9c6d5f3764dd50e91b1721c06d707f5afbf0: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0<br />
  xe-pw-179273v2: 179273v2</p>

</body>
</html>

--===============6764528794014432816==--
