Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377BDC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E801310E63F;
	Tue,  5 Dec 2023 21:37:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3B4A10E63F;
 Tue,  5 Dec 2023 21:37:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9BC19AADD5;
 Tue,  5 Dec 2023 21:37:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5793649711928709293=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 05 Dec 2023 21:37:17 -0000
Message-ID: <170181223763.24284.13876431153625269501@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205155820.2133813-1-lucas.demarchi@intel.com>
In-Reply-To: <20231205155820.2133813-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Expand_XE=5FREG=5FOPTION=5FMASKED_documentation?=
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

--===============5793649711928709293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Expand XE_REG_OPTION_MASKED documentation
URL   : https://patchwork.freedesktop.org/series/127370/
State : success

== Summary ==

CI Bug Log - changes from xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b_BAT -> xe-pw-127370v1_BAT
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

  Here are the changes found in xe-pw-127370v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#480])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#480]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7620 -> IGT_7622
  * Linux: xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b -> xe-pw-127370v1

  IGT_7620: 6714b814e7f82743abf45c33361fbe057a22880a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b
  xe-pw-127370v1: 127370v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/index.html

--===============5793649711928709293==
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
<tr><td><b>Series:</b></td><td>drm/xe: Expand XE_REG_OPTION_MASKED documentation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127370/">https://patchwork.freedesktop.org/series/127370/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b_BAT -&gt; xe-pw-127370v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127370v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127370v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7620 -&gt; IGT_7622</li>
<li>Linux: xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b -&gt; xe-pw-127370v1</li>
</ul>
<p>IGT_7620: 6714b814e7f82743abf45c33361fbe057a22880a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b<br />
  xe-pw-127370v1: 127370v1</p>

</body>
</html>

--===============5793649711928709293==--
