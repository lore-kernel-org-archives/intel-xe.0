Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE70CCFA18
	for <intel-xe@archiver.kernel.org>; Sun,  9 Nov 2025 01:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4DF10E219;
	Sun,  9 Nov 2025 01:09:39 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147F310E219;
 Sun,  9 Nov 2025 01:09:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4543782567241522447=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_add_VM=5FBIND_DE?=
 =?utf-8?q?COMPRESS_support_and_on=E2=80=91demand_decompression_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 09 Nov 2025 01:09:38 -0000
Message-ID: <176265057807.31057.17046573683611385071@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107114757.561671-5-nitin.r.gote@intel.com>
In-Reply-To: <20251107114757.561671-5-nitin.r.gote@intel.com>
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

--===============4543782567241522447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Series Details ==

Series: drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev5)
URL   : https://patchwork.freedesktop.org/series/154714/
State : failure

== Summary ==

CI Bug Log - changes from xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4_FULL -> xe-pw-154714v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154714v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154714v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154714v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-adlp:         [PASS][1] -> [ABORT][2] +24 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          [PASS][3] -> [ABORT][4] +24 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@kms_flip@blocking-absolute-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@kms_flip@blocking-absolute-wf_vblank@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@kms_flip@blocking-absolute-wf_vblank@b-edp1.html

  * igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] +6 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-bmg-1/igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-7/igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a3.html

  * igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] +8 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-1/igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [PASS][11] -> [ABORT][12] +25 other tests abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-436/igt@kms_hdr@static-toggle-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][13] +5 other tests abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] +40 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4.html

  * igt@xe_intel_bb@intel-bb-blit-none:
    - shard-bmg:          [PASS][16] -> [ABORT][17] +17 other tests abort
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-bmg-2/igt@xe_intel_bb@intel-bb-blit-none.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-7/igt@xe_intel_bb@intel-bb-blit-none.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][18] ([Intel XE#4543]) -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#367]) -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-bmg:          [SKIP][22] ([Intel XE#367]) -> [ABORT][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][24] ([Intel XE#651]) -> [ABORT][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-adlp:         [SKIP][26] ([Intel XE#653]) -> [ABORT][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-lnl:          [SKIP][28] ([Intel XE#4837]) -> [ABORT][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_eudebug@multiple-sessions.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_exec_system_allocator@threads-many-large-malloc-busy:
    - shard-adlp:         [SKIP][30] ([Intel XE#4915]) -> [ABORT][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-large-malloc-busy.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-malloc-busy.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     [SKIP][32] ([Intel XE#5694]) -> [ABORT][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-463/igt@xe_pm@d3cold-i2c.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@xe_pm@d3cold-i2c.html
    - shard-adlp:         [SKIP][34] ([Intel XE#5694]) -> [ABORT][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/igt@xe_pm@d3cold-i2c.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_pm@d3cold-i2c.html

  
Known issues
------------

  Here are the changes found in xe-pw-154714v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2252])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [PASS][37] -> [ABORT][38] ([Intel XE#5175])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-4.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [SKIP][62], [PASS][63], [PASS][64]) ([Intel XE#378]) -> ([PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-5/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-7/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-7/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-1/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-5/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-8/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-8/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-2/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-5/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-2/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-7/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-7/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-8/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-1/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-5/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-5/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-2/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-1/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-2/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-2/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-2/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-3/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-3/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-3/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-1/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-7/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-7/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-7/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-5/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-5/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-5/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-2/igt@xe_module_load@load.html
    - shard-adlp:         ([SKIP][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-9/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-9/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-4/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-2/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-8/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-9/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-8/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-8/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-8/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-2/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-2/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-1/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-1/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-1/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-4/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-4/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-4/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-4/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-4/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-9/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-9/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-9/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-2/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-2/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-6/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-6/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-8/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-8/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-1/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-1/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-8/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-6/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-6/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [SKIP][166]) ([Intel XE#378]) -> ([PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-433/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-464/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-435/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-436/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-435/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-432/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-432/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-434/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-434/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-434/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-434/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-433/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-464/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-463/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-463/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-436/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-436/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-463/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-463/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-435/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-464/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-432/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-463/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-463/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-463/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-435/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-435/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-435/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-436/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-436/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-432/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-436/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-432/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-432/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-464/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-464/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-464/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-434/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-434/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-434/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][192] ([Intel XE#5390]) -> [SKIP][193] ([Intel XE#2312])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653


Build changes
-------------

  * Linux: xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4 -> xe-pw-154714v5

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4: 1f25afd37c14352cd24ada205fe16ff022784bd4
  xe-pw-154714v5: 154714v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/index.html

--===============4543782567241522447==
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
<tr><td><b>Series:</b></td><td>drm/xe: add VM_BIND DECOMPRESS support and o=
n=E2=80=91demand decompression (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154714/">https://patchwork.freedesktop.org/series/154714/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154714v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154714v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4067-1f25afd37c14352cd24ada205fe16ff02=
2784bd4_FULL -&gt; xe-pw-154714v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154714v5_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154714v5_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1547=
14v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@kms_big=
_fb@y-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-1/igt@kms_big_fb@y-tile=
d-16bpp-rotate-0.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@kms_flip=
@blocking-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@kms_flip@blockin=
g-absolute-wf_vblank.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@kms_flip=
@blocking-absolute-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@kms_flip@=
blocking-absolute-wf_vblank@b-edp1.html">DMESG-WARN</a> +1 other test dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-bmg-1/igt@kms_flip=
@blocking-absolute-wf_vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-7/igt@kms_fl=
ip@blocking-absolute-wf_vblank@c-hdmi-a3.html">DMESG-WARN</a> +6 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-1/igt@kms_fli=
p@nonexisting-fb-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@kms=
_flip@nonexisting-fb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> +8 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-436/igt@kms_hd=
r@static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@kms_hdr@static-toggle-=
dpms.html">ABORT</a> +25 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154714v5/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pi=
pe-a-dp-2.html">ABORT</a> +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-435/igt@kms_pl=
ane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg=
2-433/igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4.html">=
DMESG-WARN</a> +40 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-bmg-2/igt@xe_intel=
_bb@intel-bb-blit-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-7/igt@xe_intel_bb@intel-bb-b=
lit-none.html">ABORT</a> +17 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v=
5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">=
ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-436/igt@kms_bw=
@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-46=
3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">ABORT</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-bmg-4/igt@kms_bw@l=
inear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-bmg-1/ig=
t@kms_bw@linear-tiling-3-displays-2160x1440p.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154714v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-in=
dfb-draw-render.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-2/igt@k=
ms_frontbuffer_tracking@psr-slowdraw.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_eudeb=
ug@multiple-sessions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_eudebug=
@multiple-sessions.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-busy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/igt@xe_exec=
_system_allocator@threads-many-large-malloc-busy.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v=
5/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-malloc-busy.=
html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-463/igt@xe_pm@=
d3cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@xe_pm@d3cold-i2c.h=
tml">ABORT</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/igt@xe_pm@d=
3cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_pm@d3cold-i2c.htm=
l">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154714v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154714v5/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-435/igt@kms_pl=
ane_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@kms_plane_multiple=
@2x-tiling-4.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5175">Intel XE#5175</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff02278=
4bd4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff0=
22784bd4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe1=
6ff022784bd4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada20=
5fe16ff022784bd4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24a=
da205fe16ff022784bd4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352c=
d24ada205fe16ff022784bd4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14=
352cd24ada205fe16ff022784bd4/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd3=
7c14352cd24ada205fe16ff022784bd4/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25=
afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-=
1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-=
lnl-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd=
4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
714v5/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154714v5/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
714v5/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
714v5/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154714v5/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
714v5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154714v5/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
714v5/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154714v5/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd=
4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022=
784bd4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16=
ff022784bd4/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada20=
5fe16ff022784bd4/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24=
ada205fe16ff022784bd4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c1435=
2cd24ada205fe16ff022784bd4/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37=
c14352cd24ada205fe16ff022784bd4/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25=
afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067=
-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd=
4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022=
784bd4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16=
ff022784bd4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada20=
5fe16ff022784bd4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24=
ada205fe16ff022784bd4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c1435=
2cd24ada205fe16ff022784bd4/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154714v5/shard-adlp-4/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v=
5/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-154714v5/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-9/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
4714v5/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard=
-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-3/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154714v5/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-2/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154714v5/shard-adlp-2/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/=
shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-6/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-154714v5/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1547=
14v5/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-154714v5/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-a=
dlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-adlp-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154714v5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-433/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022=
784bd4/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe1=
6ff022784bd4/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ad=
a205fe16ff022784bd4/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352=
cd24ada205fe16ff022784bd4/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37=
c14352cd24ada205fe16ff022784bd4/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f2=
5afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-434/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-40=
67-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-d=
g2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff02278=
4bd4/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16f=
f022784bd4/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada20=
5fe16ff022784bd4/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd2=
4ada205fe16ff022784bd4/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14=
352cd24ada205fe16ff022784bd4/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25af=
d37c14352cd24ada205fe16ff022784bd4/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-=
1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-464/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-dg2-466/igt@xe_m=
odule_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-154714v5/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
4714v5/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154714v5/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-154714v5/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
54714v5/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-436/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-154714v5/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-154714v5/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-=
433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154714v5/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-154714v5/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/=
shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5=
/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4 -&gt; xe-pw-154=
714v5</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4: 1f25afd37c14352cd24ada2=
05fe16ff022784bd4<br />
  xe-pw-154714v5: 154714v5</p>

</body>
</html>

--===============4543782567241522447==--
