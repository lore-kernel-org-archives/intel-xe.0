Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A3AD6ED13
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 12:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCE510E3F3;
	Thu, 21 Nov 2024 12:17:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64C210E3F3;
 Thu, 21 Nov 2024 12:17:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7625016251836252868=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_test=3A_check_if_increasing?=
 =?utf-8?q?_dmc_wakelock_timeout_helps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 12:17:10 -0000
Message-ID: <173219143089.1116962.8793829892405422757@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121104416.883314-1-luciano.coelho@intel.com>
In-Reply-To: <20241121104416.883314-1-luciano.coelho@intel.com>
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

--===============7625016251836252868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test: check if increasing dmc wakelock timeout helps
URL   : https://patchwork.freedesktop.org/series/141644/
State : success

== Summary ==

CI Bug Log - changes from xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380_BAT -> xe-pw-141644v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141644v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3517]) +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#455]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][5] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][6] ([Intel XE#977])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-vf:        [SKIP][7] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][8] ([Intel XE#977])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][9] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][10] ([Intel XE#977])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][12] ([Intel XE#977])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][13] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][14] ([Intel XE#2245])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][15] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][16] ([Intel XE#2245])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][17] ([Intel XE#2237] / [Intel XE#977]) -> [SKIP][18] ([Intel XE#977])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380 -> xe-pw-141644v1

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380
  xe-pw-141644v1: 141644v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/index.html

--===============7625016251836252868==
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
<tr><td><b>Series:</b></td><td>test: check if increasing dmc wakelock timeout helps</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141644/">https://patchwork.freedesktop.org/series/141644/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380_BAT -&gt; xe-pw-141644v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141644v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141644v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380 -&gt; xe-pw-141644v1</li>
</ul>
<p>IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380<br />
  xe-pw-141644v1: 141644v1</p>

</body>
</html>

--===============7625016251836252868==--
