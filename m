Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B3CCFA13
	for <intel-xe@archiver.kernel.org>; Sun,  9 Nov 2025 01:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3FE10E05F;
	Sun,  9 Nov 2025 01:24:27 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A98610E05F;
 Sun,  9 Nov 2025 01:24:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7596108520649038780=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/dp=5Fmst=3A_Disab?=
 =?utf-8?q?le_Panel_Replay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 09 Nov 2025 01:24:26 -0000
Message-ID: <176265146623.33229.14392217448285890815@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107124141.911895-1-imre.deak@intel.com>
In-Reply-To: <20251107124141.911895-1-imre.deak@intel.com>
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

--===============7596108520649038780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Disable Panel Replay
URL   : https://patchwork.freedesktop.org/series/157224/
State : failure

== Summary ==

CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_FULL -> xe-pw-157224v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157224v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157224v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157224v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [ABORT][1] +5 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][2] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-4/igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@xe_evict@evict-small-external:
    - shard-dg2-set2:     [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-436/igt@xe_evict@evict-small-external.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-436/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:
    - shard-bmg:          NOTRUN -> [ABORT][6] +2 other tests abort
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after:
    - shard-bmg:          [PASS][7] -> [ABORT][8] +2 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html

  * igt@xe_module_load@reload-no-display:
    - shard-lnl:          [PASS][9] -> [ABORT][10] +2 other tests abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-1/igt@xe_module_load@reload-no-display.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-lnl-5/igt@xe_module_load@reload-no-display.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         [SKIP][11] ([Intel XE#316]) -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][13] ([Intel XE#455] / [Intel XE#787]) -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][15] ([Intel XE#787]) -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][17] ([Intel XE#2312]) -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-adlp:         [SKIP][19] ([Intel XE#653]) -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:
    - shard-adlp:         [SKIP][21] ([Intel XE#4915]) -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-8/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-6/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-157224v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#373])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#651])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#688])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_system_allocator@many-stride-mmap-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#4915]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-4/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#3573])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_vm@out-of-memory:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#5745])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_vm@out-of-memory.html

  
#### Possible fixes ####

  * igt@xe_vm@compact-64k-pages:
    - shard-adlp:         [ABORT][29] -> [PASS][30] +4 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-9/igt@xe_vm@compact-64k-pages.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_vm@compact-64k-pages.html

  * igt@xe_vm@mixed-userptr-binds-3145728:
    - shard-bmg:          [ABORT][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-1/igt@xe_vm@mixed-userptr-binds-3145728.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-8/igt@xe_vm@mixed-userptr-binds-3145728.html

  * igt@xe_vm@unbind-all-2-vmas:
    - shard-dg2-set2:     [ABORT][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-466/igt@xe_vm@unbind-all-2-vmas.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-435/igt@xe_vm@unbind-all-2-vmas.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-adlp:         [ABORT][35] -> [SKIP][36] ([Intel XE#455] / [Intel XE#787])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         [ABORT][37] -> [SKIP][38] ([Intel XE#787])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1.html

  
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -> xe-pw-157224v1

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160
  xe-pw-157224v1: 157224v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/index.html

--===============7596108520649038780==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Disable Panel Replay</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157224/">https://patchwork.freedesktop.org/series/157224/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_FULL -&gt; xe-pw-157224v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157224v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157224v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157224v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">ABORT</a> +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-4/igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-436/igt@xe_evict@evict-small-external.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-436/igt@xe_evict@evict-small-external.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-1/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-lnl-5/igt@xe_module_load@reload-no-display.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-90.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-slowdraw.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-8/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-6/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157224v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-4/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_vm@out-of-memory.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">Intel XE#5745</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_vm@compact-64k-pages:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-9/igt@xe_vm@compact-64k-pages.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-3/igt@xe_vm@compact-64k-pages.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-binds-3145728:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-1/igt@xe_vm@mixed-userptr-binds-3145728.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-bmg-8/igt@xe_vm@mixed-userptr-binds-3145728.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@unbind-all-2-vmas:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-466/igt@xe_vm@unbind-all-2-vmas.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-dg2-435/igt@xe_vm@unbind-all-2-vmas.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157224v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -&gt; xe-pw-157224v1</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160<br />
  xe-pw-157224v1: 157224v1</p>

</body>
</html>

--===============7596108520649038780==--
