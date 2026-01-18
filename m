Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC7DC9832F
	for <intel-xe@archiver.kernel.org>; Sun, 18 Jan 2026 14:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5CF10E2CA;
	Sun, 18 Jan 2026 14:06:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627FD10E2C9;
 Sun, 18 Jan 2026 14:06:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6148514523947815891=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_dma-buf=3A_document_revoke?=
 =?utf-8?q?_mechanism_to_invalidate_shared_buffers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Leon Romanovsky" <leon@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 18 Jan 2026 14:06:36 -0000
Message-ID: <176874519639.165069.12905870683985450745@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
In-Reply-To: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
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

--===============6148514523947815891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: dma-buf: document revoke mechanism to invalidate shared buffers
URL   : https://patchwork.freedesktop.org/series/160246/
State : failure

== Summary ==

CI Bug Log - changes from xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef_FULL -> xe-pw-160246v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160246v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160246v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160246v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  
Known issues
------------

  Here are the changes found in xe-pw-160246v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#6766]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][5] -> [ABORT][6] ([Intel XE#3970])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#1874])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0:
    - shard-lnl:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#7063])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-2/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-5/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][11] ([Intel XE#6054]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][13] ([Intel XE#301]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [FAIL][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-bmg:          [SKIP][17] ([Intel XE#6703]) -> [PASS][18] +20 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@xe_evict@evict-threads-large-multi-vm.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-bmg:          [DMESG-FAIL][19] ([Intel XE#5545] / [Intel XE#6652]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1:
    - shard-lnl:          [DMESG-WARN][21] ([Intel XE#7063]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-2/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-5/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [DMESG-WARN][23] ([Intel XE#7024]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-3/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][25] ([Intel XE#6703]) -> [SKIP][26] ([Intel XE#2313])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][27] ([Intel XE#2426]) -> [SKIP][28] ([Intel XE#2509])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][29] ([Intel XE#6703]) -> [SKIP][30] ([Intel XE#1499])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@kms_vrr@max-min.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@kms_vrr@max-min.html

  * igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][31] ([Intel XE#6703]) -> [SKIP][32] ([Intel XE#4943])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset.html

  
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766
  [Intel XE#7024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063


Build changes
-------------

  * Linux: xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef -> xe-pw-160246v1

  IGT_8704: 8704
  xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef: 1956fa9bd80d606f7eb92e877680de38a4f6e8ef
  xe-pw-160246v1: 160246v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/index.html

--===============6148514523947815891==
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
<tr><td><b>Series:</b></td><td>dma-buf: document revoke mechanism to invalidate shared buffers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160246/">https://patchwork.freedesktop.org/series/160246/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef_FULL -&gt; xe-pw-160246v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160246v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160246v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160246v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@x-tiled-64bpp-rotate-0:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160246v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766">Intel XE#6766</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-2/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-5/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@xe_evict@evict-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@xe_evict@evict-threads-large-multi-vm.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-2/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-5/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-lnl-5/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024">Intel XE#7024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160246v1/shard-bmg-10/igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef -&gt; xe-pw-160246v1</li>
</ul>
<p>IGT_8704: 8704<br />
  xe-4400-1956fa9bd80d606f7eb92e877680de38a4f6e8ef: 1956fa9bd80d606f7eb92e877680de38a4f6e8ef<br />
  xe-pw-160246v1: 160246v1</p>

</body>
</html>

--===============6148514523947815891==--
