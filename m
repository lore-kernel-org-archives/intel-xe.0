Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBF60A2614
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 15:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A0510E949;
	Tue, 10 Nov 2026 15:35:17 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B11F10E949;
 Tue, 10 Nov 2026 15:35:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1999375166739688915=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/dp=3A_Use_the_VBT?=
 =?utf-8?q?_eDP_fast_link_training_params?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lee Shawn C" <shawn.c.lee@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Nov 2026 15:35:16 -0000
Message-ID: <179432491649.3975.10490887133522610627@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
In-Reply-To: <20261110115432.894616-1-shawn.c.lee@intel.com>
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

--===============1999375166739688915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Use the VBT eDP fast link training params
URL   : https://patchwork.freedesktop.org/series/178196/
State : success

== Summary ==

CI Bug Log - changes from xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b_FULL -> xe-pw-178196v1_FULL
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

  Here are the changes found in xe-pw-178196v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:
    - shard-ptl:          [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#1727]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-ptl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4:
    - shard-ptl:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1727])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-ptl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#5822])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_content_protection@atomic@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#3304])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#6707] / [Intel XE#7439])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5907])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [PASS][14] -> [FAIL][15] ([Intel XE#3098])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-7/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#3098])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#3098]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-lnl-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-3/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#5812])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#1503])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#9271]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-4/igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5764])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#7482])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#8364])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_reset@gt-stress-reset-bo-invalidation:
    - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#8652])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-10/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-7/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [PASS][28] -> [ABORT][29] ([Intel XE#9362])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-ptl-1/igt@xe_pm@s4-basic-exec.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#7727])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][32] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][34] ([Intel XE#8618]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-7/igt@kms_setmode@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_setmode@basic.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [FAIL][36] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][37] +1 other test pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][38] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][39] ([Intel XE#309] / [Intel XE#7343])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][40] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][41] ([Intel XE#3544])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362


Build changes
-------------

  * Linux: xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b -> xe-pw-178196v1

  IGT_9182: 9182
  xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b: 77735854d8c336ccfd33eebc2ff03a3c5e13523b
  xe-pw-178196v1: 178196v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/index.html

--===============1999375166739688915==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Use the VBT eDP fast link training params</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178196/">https://patchwork.freedesktop.org/series/178196/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b_FULL -&gt; xe-pw-178196v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178196v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-ptl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-ptl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-7/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-lnl-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-3/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-4/igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-bo-invalidation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-10/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-7/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-ptl-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-3/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-9/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178196v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b -&gt; xe-pw-178196v1</li>
</ul>
<p>IGT_9182: 9182<br />
  xe-6101-77735854d8c336ccfd33eebc2ff03a3c5e13523b: 77735854d8c336ccfd33eebc2ff03a3c5e13523b<br />
  xe-pw-178196v1: 178196v1</p>

</body>
</html>

--===============1999375166739688915==--
