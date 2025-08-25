Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E141CA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 12:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFED10E255;
	Mon, 25 Aug 2025 12:02:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BAA10E255;
 Mon, 25 Aug 2025 12:02:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1210376063852947559=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_Add_no?=
 =?utf-8?q?=5Fpsr=5Freason_to_PSR_debugfs_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Aug 2025 12:02:39 -0000
Message-ID: <175612335915.265707.7209215033831265620@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825103332.885420-1-michal.grzelak@intel.com>
In-Reply-To: <20250825103332.885420-1-michal.grzelak@intel.com>
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

--===============1210376063852947559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Add no_psr_reason to PSR debugfs (rev10)
URL   : https://patchwork.freedesktop.org/series/148957/
State : failure

== Summary ==

CI Bug Log - changes from xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695_BAT -> xe-pw-148957v10_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148957v10_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148957v10_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148957v10_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@psr-cursor-plane-move:
    - {bat-ptl-2}:        [PASS][5] -> [FAIL][6] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-ptl-2/igt@kms_psr@psr-cursor-plane-move.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-ptl-2/igt@kms_psr@psr-cursor-plane-move.html

  
Known issues
------------

  Here are the changes found in xe-pw-148957v10_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#4543]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][9] ([Intel XE#5783]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
    - {bat-ptl-vm}:       [FAIL][11] ([Intel XE#5783]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695 -> xe-pw-148957v10

  IGT_8505: 8505
  xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695: 5481954bd63bd4d34a5acb2b89fb2caf55bb0695
  xe-pw-148957v10: 148957v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/index.html

--===============1210376063852947559==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Add no_psr_reason to PSR debugfs (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148957/">https://patchwork.freedesktop.org/series/148957/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695_BAT -&gt; xe-pw-148957v10_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148957v10_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148957v10_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148957v10_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_psr@psr-cursor-plane-move:<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-ptl-2/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-ptl-2/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148957v10_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v10/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695 -&gt; xe-pw-148957v10</li>
</ul>
<p>IGT_8505: 8505<br />
  xe-3609-5481954bd63bd4d34a5acb2b89fb2caf55bb0695: 5481954bd63bd4d34a5acb2b89fb2caf55bb0695<br />
  xe-pw-148957v10: 148957v10</p>

</body>
</html>

--===============1210376063852947559==--
