Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4E5CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 00:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6E410EC2A;
	Thu, 11 Jun 2026 00:22:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B202910E648;
 Thu, 11 Jun 2026 00:22:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6006479862421413549=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_fix_refcount_lea?=
 =?utf-8?q?k_in_xe=5Frange=5Ffence=5Finsert=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 00:22:03 -0000
Message-ID: <178113732371.66769.8230763847808277785@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610172705.3450560-1-matthew.brost@intel.com>
In-Reply-To: <20260610172705.3450560-1-matthew.brost@intel.com>
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

--===============6006479862421413549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fix refcount leak in xe_range_fence_insert() (rev2)
URL   : https://patchwork.freedesktop.org/series/168085/
State : success

== Summary ==

CI Bug Log - changes from xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92_FULL -> xe-pw-168085v2_FULL
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

  Here are the changes found in xe-pw-168085v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#7809])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3321]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301] / [Intel XE#3149])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#7915]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-7/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#7340])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] ([Intel XE#6321])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][15] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [FAIL][17] ([Intel XE#6078]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][19] ([Intel XE#301]) -> [PASS][20] +2 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][21] ([Intel XE#1503]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][23] ([Intel XE#7922]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][25] ([Intel XE#7915]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-10/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][27] ([Intel XE#2142]) -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][29] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-5/igt@xe_survivability@runtime-survivability.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-9/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][31] ([Intel XE#301]) -> [FAIL][32] ([Intel XE#301] / [Intel XE#3149])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][33] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][34] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][35] ([Intel XE#7916]) -> [SKIP][36] ([Intel XE#7915]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150


Build changes
-------------

  * Linux: xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92 -> xe-pw-168085v2

  IGT_8956: 8956
  xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92: 2bfaac2290b880c462bf89fae4fdb1559567af92
  xe-pw-168085v2: 168085v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/index.html

--===============6006479862421413549==
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
<tr><td><b>Series:</b></td><td>drm/xe: fix refcount leak in xe_range_fence_insert() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168085/">https://patchwork.freedesktop.org/series/168085/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92_FULL -&gt; xe-pw-168085v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168085v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-7/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-10/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-9/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92/shard-bmg-9/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92 -&gt; xe-pw-168085v2</li>
</ul>
<p>IGT_8956: 8956<br />
  xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92: 2bfaac2290b880c462bf89fae4fdb1559567af92<br />
  xe-pw-168085v2: 168085v2</p>

</body>
</html>

--===============6006479862421413549==--
