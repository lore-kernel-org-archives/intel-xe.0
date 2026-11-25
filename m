Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCE7606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 01:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A6010E8DF;
	Wed, 25 Nov 2026 01:49:03 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5001610E8DF;
 Wed, 25 Nov 2026 01:49:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3759661384853177938=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/vf=3A_Support_PCIe_?=
 =?utf-8?q?FLR_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Nov 2026 01:49:02 -0000
Message-ID: <179557134232.81645.5930679875766049089@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124203604.467922-1-lukasz.laguna@intel.com>
In-Reply-To: <20261124203604.467922-1-lukasz.laguna@intel.com>
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

--===============3759661384853177938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Support PCIe FLR (rev2)
URL   : https://patchwork.freedesktop.org/series/179511/
State : failure

== Summary ==

CI Bug Log - changes from xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6_FULL -> xe-pw-179511v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-179511v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-179511v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-179511v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-bmg:          [PASS][2] -> [ABORT][3] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  
#### Warnings ####

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][4] ([Intel XE#6281] / [Intel XE#7426]) -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][6] ([Intel XE#9781]) -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html

  
Known issues
------------

  Here are the changes found in xe-pw-179511v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5855])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][9] ([Intel XE#7084] / [Intel XE#8150])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#9671])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#3304] / [Intel XE#7374])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#3098]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5812])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#7061])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#7304])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [PASS][20] -> [FAIL][21] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [PASS][22] -> [ABORT][23] ([Intel XE#9362]) +1 other test abort
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-ptl-8/igt@xe_pm@s4-basic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][24] -> [ABORT][25] ([Intel XE#9362]) +1 other test abort
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#9461]) +4 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][28] ([Intel XE#367]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [INCOMPLETE][30] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][32] ([Intel XE#1503]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          [FAIL][34] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-ptl-7/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [ABORT][36] ([Intel XE#9362]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-ptl-6/igt@xe_pm@s4-basic-exec.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][38] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][39] ([Intel XE#3544])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][40] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][41] ([Intel XE#2426] / [Intel XE#5848])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671
  [Intel XE#9781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9781


Build changes
-------------

  * Linux: xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6 -> xe-pw-179511v2

  IGT_9203: 9203
  xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6: cb6f07e3276d07538caeb25e6282c0b828d949e6
  xe-pw-179511v2: 179511v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/index.html

--===============3759661384853177938==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Support PCIe FLR (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179511/">https://patchwork.freedesktop.org/series/179511/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6_FULL -&gt; xe-pw-179511v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-179511v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-179511v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-179511v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9781">Intel XE#9781</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179511v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855">Intel XE#5855</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-ptl-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-6/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461">Intel XE#9461</a>) +4 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-ptl-7/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-ptl-6/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-ptl-5/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179511v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6 -&gt; xe-pw-179511v2</li>
</ul>
<p>IGT_9203: 9203<br />
  xe-6227-cb6f07e3276d07538caeb25e6282c0b828d949e6: cb6f07e3276d07538caeb25e6282c0b828d949e6<br />
  xe-pw-179511v2: 179511v2</p>

</body>
</html>

--===============3759661384853177938==--
