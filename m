Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA87EA7944
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 20:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598010E374;
	Wed,  4 Feb 2026 20:33:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8975C10E1BE;
 Wed,  4 Feb 2026 20:33:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1996837746300656306=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_CMTG_enablement_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Feb 2026 20:33:09 -0000
Message-ID: <177023718953.225523.2686742316583364273@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203134407.2823406-1-animesh.manna@intel.com>
In-Reply-To: <20260203134407.2823406-1-animesh.manna@intel.com>
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

--===============1996837746300656306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CMTG enablement (rev3)
URL   : https://patchwork.freedesktop.org/series/157663/
State : failure

== Summary ==

CI Bug Log - changes from xe-4497-241994730989320c926da9f2d0a5ec80b48f993d_BAT -> xe-pw-157663v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157663v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157663v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157663v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4497-241994730989320c926da9f2d0a5ec80b48f993d/bat-ptl-2/igt@kms_flip@basic-flip-vs-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v3/bat-ptl-2/igt@kms_flip@basic-flip-vs-modeset.html

  
Known issues
------------

  Here are the changes found in xe-pw-157663v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-lnl-1:          [PASS][3] -> [ABORT][4] ([Intel XE#1727] / [Intel XE#2705]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4497-241994730989320c926da9f2d0a5ec80b48f993d/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705


Build changes
-------------

  * IGT: IGT_8735 -> IGT_8736
  * Linux: xe-4497-241994730989320c926da9f2d0a5ec80b48f993d -> xe-pw-157663v3

  IGT_8735: 8735
  IGT_8736: 8736
  xe-4497-241994730989320c926da9f2d0a5ec80b48f993d: 241994730989320c926da9f2d0a5ec80b48f993d
  xe-pw-157663v3: 157663v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v3/index.html

--===============1996837746300656306==
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
<tr><td><b>Series:</b></td><td>CMTG enablement (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157663/">https://patchwork.freedesktop.org/series/157663/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4497-241994730989320c926da9f2d0a5ec80b48f993d_BAT -&gt; xe-pw-157663v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157663v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157663v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157663v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4497-241994730989320c926da9f2d0a5ec80b48f993d/bat-ptl-2/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v3/bat-ptl-2/igt@kms_flip@basic-flip-vs-modeset.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157663v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4497-241994730989320c926da9f2d0a5ec80b48f993d/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8735 -&gt; IGT_8736</li>
<li>Linux: xe-4497-241994730989320c926da9f2d0a5ec80b48f993d -&gt; xe-pw-157663v3</li>
</ul>
<p>IGT_8735: 8735<br />
  IGT_8736: 8736<br />
  xe-4497-241994730989320c926da9f2d0a5ec80b48f993d: 241994730989320c926da9f2d0a5ec80b48f993d<br />
  xe-pw-157663v3: 157663v3</p>

</body>
</html>

--===============1996837746300656306==--
