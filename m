Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C14EFDEE4D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 23:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FCF10E17C;
	Thu, 23 Apr 2026 23:44:36 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD97A10E17C;
 Thu, 23 Apr 2026 23:44:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2795212459858681506=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Engine_initialization_clean?=
 =?utf-8?q?up?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Apr 2026 23:44:34 -0000
Message-ID: <177698787476.4863.15679641695132130713@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
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

--===============2795212459858681506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Engine initialization cleanup
URL   : https://patchwork.freedesktop.org/series/165392/
State : failure

== Summary ==

CI Bug Log - changes from xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4_BAT -> xe-pw-165392v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165392v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165392v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165392v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@render@render-linear-256:
    - bat-adlp-vm:        [PASS][1] -> [FAIL][2] +6 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-vm/igt@xe_intel_bb@render@render-linear-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-vm/igt@xe_intel_bb@render@render-linear-256.html

  * igt@xe_pat@pat-index-xelp:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] +11 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-7/igt@xe_pat@pat-index-xelp.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-7/igt@xe_pat@pat-index-xelp.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][5] ([Intel XE#7483]) -> [FAIL][6] +6 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
Known issues
------------

  Here are the changes found in xe-pw-165392v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] ([Intel XE#3149]) +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_waitfence@reltime:
    - bat-ptl-1:          [PASS][9] -> [FAIL][10] ([Intel XE#6520])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-ptl-1/igt@xe_waitfence@reltime.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-ptl-1/igt@xe_waitfence@reltime.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][11] ([Intel XE#7483]) -> [FAIL][12] ([Intel XE#3149]) +4 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * Linux: xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4 -> xe-pw-165392v1

  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4
  xe-pw-165392v1: 165392v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/index.html

--===============2795212459858681506==
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
<tr><td><b>Series:</b></td><td>Engine initialization cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165392/">https://patchwork.freedesktop.org/series/165392/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4_BAT -&gt; xe-pw-165392v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165392v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165392v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165392v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_intel_bb@render@render-linear-256:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-vm/igt@xe_intel_bb@render@render-linear-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-vm/igt@xe_intel_bb@render@render-linear-256.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165392v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-ptl-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-ptl-1/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +4 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4 -&gt; xe-pw-165392v1</li>
</ul>
<p>IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4<br />
  xe-pw-165392v1: 165392v1</p>

</body>
</html>

--===============2795212459858681506==--
