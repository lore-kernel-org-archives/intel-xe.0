Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AF2CA5FBA
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 04:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB16210E0CE;
	Wed, 21 Jan 2026 04:52:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA14C10E0CE;
 Wed, 21 Jan 2026 04:52:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1241547527947355379=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Account_for_DSC_bubble_over?=
 =?utf-8?q?head_for_horizontal_slices_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 04:52:18 -0000
Message-ID: <176897113876.174471.10312727718770500059@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121035330.2793386-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260121035330.2793386-1-ankit.k.nautiyal@intel.com>
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

--===============1241547527947355379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Account for DSC bubble overhead for horizontal slices (rev3)
URL   : https://patchwork.freedesktop.org/series/152803/
State : failure

== Summary ==

CI Bug Log - changes from xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e_BAT -> xe-pw-152803v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152803v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152803v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152803v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] +13 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-lnl-1:          [PASS][3] -> [SKIP][4] +12 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          [SKIP][5] ([Intel XE#2244]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][7] ([Intel XE#455]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-152803v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-lnl-1:          [PASS][9] -> [SKIP][10] ([Intel XE#2134]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@fbdev@eof.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@fbdev@eof.html

  * igt@fbdev@write:
    - bat-adlp-7:         [PASS][11] -> [SKIP][12] ([Intel XE#2134]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@fbdev@write.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@fbdev@write.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][13] -> [SKIP][14] ([Intel XE#4882]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][15] -> [SKIP][16] ([Intel XE#2482]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-1:          [PASS][17] -> [SKIP][18] ([Intel XE#2548])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_frontbuffer_tracking@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][19] -> [SKIP][20] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-lnl-1:          [PASS][21] -> [SKIP][22] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e -> xe-pw-152803v3

  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e: e1d337ba2d56f16062ced77fc4763660eb239e3e
  xe-pw-152803v3: 152803v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/index.html

--===============1241547527947355379==
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
<tr><td><b>Series:</b></td><td>Account for DSC bubble overhead for horizontal slices (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152803/">https://patchwork.freedesktop.org/series/152803/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e_BAT -&gt; xe-pw-152803v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152803v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152803v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152803v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152803v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882">Intel XE#4882</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e -&gt; xe-pw-152803v3</li>
</ul>
<p>IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e: e1d337ba2d56f16062ced77fc4763660eb239e3e<br />
  xe-pw-152803v3: 152803v3</p>

</body>
</html>

--===============1241547527947355379==--
