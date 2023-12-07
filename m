Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524A0C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 20:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1DC10E972;
	Thu,  7 Dec 2023 20:32:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9423110E972;
 Thu,  7 Dec 2023 20:32:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8CEC5A47DF;
 Thu,  7 Dec 2023 20:32:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2901024311100069717=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Adjust_to_DRM_GPUVM_ch?=
 =?utf-8?q?anges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 07 Dec 2023 20:32:18 -0000
Message-ID: <170198113854.28722.511484036625798084@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============2901024311100069717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Adjust to DRM GPUVM changes
URL   : https://patchwork.freedesktop.org/series/127496/
State : success

== Summary ==

CI Bug Log - changes from xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78_BAT -> xe-pw-127496v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-127496v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127496v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127496v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * Linux: xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78 -> xe-pw-127496v1

  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78: 1e3a512be7213903196b0e372d2ca5cd2c273c78
  xe-pw-127496v1: 127496v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127496v1/index.html

--===============2901024311100069717==
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
<tr><td><b>Series:</b></td><td>drm/xe: Adjust to DRM GPUVM changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127496/">https://patchwork.freedesktop.org/series/127496/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127496v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127496v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78_BAT -&gt; xe-pw-127496v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127496v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127496v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127496v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78 -&gt; xe-pw-127496v1</li>
</ul>
<p>IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-559-1e3a512be7213903196b0e372d2ca5cd2c273c78: 1e3a512be7213903196b0e372d2ca5cd2c273c78<br />
  xe-pw-127496v1: 127496v1</p>

</body>
</html>

--===============2901024311100069717==--
