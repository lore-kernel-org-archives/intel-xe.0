Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FC2CD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 21:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFBD112C24;
	Fri,  5 Jun 2026 21:26:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C146112C24;
 Fri,  5 Jun 2026 21:26:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3149627119822132860=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/rtp=3A_Fix_build_er?=
 =?utf-8?q?ror_with_clang_=3C_21_and_non-const_initializers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jun 2026 21:26:17 -0000
Message-ID: <178069477730.49962.7712714097215480572@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605093305.110598-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260605093305.110598-1-thomas.hellstrom@linux.intel.com>
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

--===============3149627119822132860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/rtp: Fix build error with clang < 21 and non-const initializers
URL   : https://patchwork.freedesktop.org/series/167940/
State : success

== Summary ==

CI Bug Log - changes from xe-5208-e3821511385af9b3b404fe878418937eec48de9f_FULL -> xe-pw-167940v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-167940v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301] / [Intel XE#3149])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#1503])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#7922]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#7915]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-10/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#7850])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-3/igt@xe_exec_reset@long-spin-reuse-many-preempt.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#7334]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-lnl-3/igt@xe_oa@non-zero-reason-all.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-lnl-7/igt@xe_oa@non-zero-reason-all.html

  
#### Possible fixes ####

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][17] ([Intel XE#7850]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-3/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][19] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][21] ([Intel XE#301]) -> [FAIL][22] ([Intel XE#301] / [Intel XE#3149])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][23] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][24] ([Intel XE#1729] / [Intel XE#7424])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150


Build changes
-------------

  * Linux: xe-5208-e3821511385af9b3b404fe878418937eec48de9f -> xe-pw-167940v1

  IGT_8949: 8949
  xe-5208-e3821511385af9b3b404fe878418937eec48de9f: e3821511385af9b3b404fe878418937eec48de9f
  xe-pw-167940v1: 167940v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/index.html

--===============3149627119822132860==
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
<tr><td><b>Series:</b></td><td>drm/xe/rtp: Fix build error with clang &lt; 21 and non-const initializers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167940/">https://patchwork.freedesktop.org/series/167940/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5208-e3821511385af9b3b404fe878418937eec48de9f_FULL -&gt; xe-pw-167940v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167940v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-10/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-3/igt@xe_exec_reset@long-spin-reuse-many-preempt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-lnl-3/igt@xe_oa@non-zero-reason-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-lnl-7/igt@xe_oa@non-zero-reason-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#7334</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-3/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5208-e3821511385af9b3b404fe878418937eec48de9f/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167940v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5208-e3821511385af9b3b404fe878418937eec48de9f -&gt; xe-pw-167940v1</li>
</ul>
<p>IGT_8949: 8949<br />
  xe-5208-e3821511385af9b3b404fe878418937eec48de9f: e3821511385af9b3b404fe878418937eec48de9f<br />
  xe-pw-167940v1: 167940v1</p>

</body>
</html>

--===============3149627119822132860==--
