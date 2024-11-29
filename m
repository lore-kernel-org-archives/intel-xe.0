Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D45D6EC04
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 12:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E91610E4B7;
	Fri, 29 Nov 2024 12:47:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF2F10E17E;
 Fri, 29 Nov 2024 12:47:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5523229597436759730=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_unlock_object_in?=
 =?utf-8?q?_an_error_condition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 12:47:55 -0000
Message-ID: <173288447596.282554.17223086125305736805@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128213408.1821171-1-oak.zeng@intel.com>
In-Reply-To: <20241128213408.1821171-1-oak.zeng@intel.com>
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

--===============5523229597436759730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: unlock object in an error condition
URL   : https://patchwork.freedesktop.org/series/141902/
State : failure

== Summary ==

CI Bug Log - changes from xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee_full -> xe-pw-141902v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141902v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141902v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141902v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][1] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-7/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp5:
    - shard-dg2-set2:     NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp5.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +34 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html

  * igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][5] -> [ABORT][6] +30 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-2/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-4/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html

  * igt@xe_exec_sip@invalidinstr-walker-enabled:
    - shard-lnl:          [PASS][7] -> [ABORT][8] +36 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-lnl-7/igt@xe_exec_sip@invalidinstr-walker-enabled.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-lnl-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html

  * igt@xe_oa@oa-exponents@rcs-0:
    - shard-lnl:          NOTRUN -> [ABORT][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-lnl-8/igt@xe_oa@oa-exponents@rcs-0.html

  * igt@xe_vm@bind-array-conflict:
    - shard-adlp:         [PASS][10] -> [ABORT][11] +2 other tests abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-1/igt@xe_vm@bind-array-conflict.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-1/igt@xe_vm@bind-array-conflict.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][12] ([Intel XE#1231]) -> [DMESG-FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][14] ([Intel XE#367]) -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
    - shard-dg2-set2:     [SKIP][16] ([Intel XE#367]) -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#307]) -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [FAIL][20] ([Intel XE#1695]) -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][22] ([Intel XE#2312]) -> [ABORT][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][24] ([Intel XE#2333]) -> [ABORT][25] +2 other tests abort
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [FAIL][26] ([Intel XE#3605]) -> [INCOMPLETE][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html

  
Known issues
------------

  Here are the changes found in xe-pw-141902v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][28] -> [DMESG-WARN][29] ([Intel XE#324]) +3 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][30] -> [DMESG-WARN][31] ([Intel XE#2953] / [Intel XE#3086]) +3 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#3086]) +5 other tests dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][34] -> [ABORT][35] ([Intel XE#1794])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#958])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-adlp:         [DMESG-WARN][38] ([Intel XE#3086]) -> [PASS][39] +3 other tests pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-3/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-1/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3605
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee -> xe-pw-141902v1

  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee: 709349e154b56980b3957b3f72af3f67cfdd7aee
  xe-pw-141902v1: 141902v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/index.html

--===============5523229597436759730==
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
<tr><td><b>Series:</b></td><td>drm/xe: unlock object in an error condition</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141902/">https://patchwork.freedesktop.org/series/141902/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee_full -&gt; xe-pw-141902v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141902v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141902v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141902v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-7/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp5.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html">ABORT</a> +34 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-2/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-4/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">ABORT</a> +30 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-lnl-7/igt@xe_exec_sip@invalidinstr-walker-enabled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-lnl-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html">ABORT</a> +36 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-lnl-8/igt@xe_oa@oa-exponents@rcs-0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-conflict:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-1/igt@xe_vm@bind-array-conflict.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-1/igt@xe_vm@bind-array-conflict.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3605">Intel XE#3605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141902v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee/shard-adlp-3/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141902v1/shard-adlp-1/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee -&gt; xe-pw-141902v1</li>
</ul>
<p>IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee: 709349e154b56980b3957b3f72af3f67cfdd7aee<br />
  xe-pw-141902v1: 141902v1</p>

</body>
</html>

--===============5523229597436759730==--
