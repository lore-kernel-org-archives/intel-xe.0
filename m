Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE618C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 12:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839E210E07F;
	Fri, 23 Aug 2024 12:05:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C157410E07F;
 Fri, 23 Aug 2024 12:05:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9212910605599632559=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_handle_HPD_polling_on_display_pm?=
 =?utf-8?q?_runtime_s/r_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 12:05:37 -0000
Message-ID: <172441473778.746160.13953813960488358576@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823112148.327015-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240823112148.327015-1-vinod.govindapillai@intel.com>
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

--===============9212910605599632559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: handle HPD polling on display pm runtime s/r (rev2)
URL   : https://patchwork.freedesktop.org/series/137527/
State : success

== Summary ==

CI Bug Log - changes from xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597_BAT -> xe-pw-137527v2_BAT
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

  Here are the changes found in xe-pw-137527v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137527v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_intel_bb@offset-control:
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#877]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597/bat-bmg-1/igt@xe_intel_bb@offset-control.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137527v2/bat-bmg-1/igt@xe_intel_bb@offset-control.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597 -> xe-pw-137527v2

  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597: bb53a030e951749b4e919a5a8b17e6d8bedc5597
  xe-pw-137527v2: 137527v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137527v2/index.html

--===============9212910605599632559==
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
<tr><td><b>Series:</b></td><td>handle HPD polling on display pm runtime s/r (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137527/">https://patchwork.freedesktop.org/series/137527/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137527v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137527v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597_BAT -&gt; xe-pw-137527v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137527v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137527v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597/bat-bmg-1/igt@xe_intel_bb@offset-control.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137527v2/bat-bmg-1/igt@xe_intel_bb@offset-control.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597 -&gt; xe-pw-137527v2</li>
</ul>
<p>IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1818-bb53a030e951749b4e919a5a8b17e6d8bedc5597: bb53a030e951749b4e919a5a8b17e6d8bedc5597<br />
  xe-pw-137527v2: 137527v2</p>

</body>
</html>

--===============9212910605599632559==--
