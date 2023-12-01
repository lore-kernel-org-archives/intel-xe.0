Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DBEC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 21:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA60210E971;
	Fri,  1 Dec 2023 21:51:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A42910E971;
 Fri,  1 Dec 2023 21:51:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ED8ACAADF1;
 Fri,  1 Dec 2023 21:51:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4141587399175480298=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Fri, 01 Dec 2023 21:51:48 -0000
Message-ID: <170146750893.19690.11806404365725639844@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231201203344.1981431-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231201203344.1981431-1-vinay.belgaumkar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Check_skip=5Fguc=5Fpc_before_disabling_gucrc?=
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

--===============4141587399175480298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Check skip_guc_pc before disabling gucrc
URL   : https://patchwork.freedesktop.org/series/127210/
State : success

== Summary ==

CI Bug Log - changes from xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4_BAT -> xe-pw-127210v1_BAT
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

  Here are the changes found in xe-pw-127210v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#480]) -> [PASS][2] +2 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127210v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * Linux: xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4 -> xe-pw-127210v1

  IGT_7614: c7298ec108dc1c861c9a2593e973648ad9b420b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4: 38dc2e0d8c28a817f2c727402e2638f3ea2accb4
  xe-pw-127210v1: 127210v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127210v1/index.html

--===============4141587399175480298==
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
<tr><td><b>Series:</b></td><td>drm/xe: Check skip_guc_pc before disabling gucrc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127210/">https://patchwork.freedesktop.org/series/127210/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127210v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127210v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4_BAT -&gt; xe-pw-127210v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127210v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127210v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4 -&gt; xe-pw-127210v1</li>
</ul>
<p>IGT_7614: c7298ec108dc1c861c9a2593e973648ad9b420b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4: 38dc2e0d8c28a817f2c727402e2638f3ea2accb4<br />
  xe-pw-127210v1: 127210v1</p>

</body>
</html>

--===============4141587399175480298==--
