Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E53BCDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 05:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E058910E101;
	Thu, 12 Oct 2023 05:52:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D245710E101;
 Thu, 12 Oct 2023 05:52:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CCFBDAADD7;
 Thu, 12 Oct 2023 05:52:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0204297568910672877=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Date: Thu, 12 Oct 2023 05:52:16 -0000
Message-ID: <169708993683.25005.11458236211120669612@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Fix_compa?=
 =?utf-8?q?tibility_issue_for_intel=5Fdmc_=28rev2=29?=
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

--===============0204297568910672877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix compatibility issue for intel_dmc (rev2)
URL   : https://patchwork.freedesktop.org/series/124969/
State : success

== Summary ==

CI Bug Log - changes from xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e_BAT -> xe-pw-124969v2_BAT
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

  Here are the changes found in xe-pw-124969v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124969v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#524]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124969v2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * Linux: xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e -> xe-pw-124969v2

  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e: 6c0d1e36f310682297a5b07336b0883afc77f66e
  xe-pw-124969v2: 124969v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124969v2/index.html

--===============0204297568910672877==
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
<tr><td><b>Series:</b></td><td>Fix compatibility issue for intel_dmc (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124969/">https://patchwork.freedesktop.org/series/124969/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124969v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124969v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e_BAT -&gt; xe-pw-124969v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124969v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124969v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124969v2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e -&gt; xe-pw-124969v2</li>
</ul>
<p>IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e: 6c0d1e36f310682297a5b07336b0883afc77f66e<br />
  xe-pw-124969v2: 124969v2</p>

</body>
</html>

--===============0204297568910672877==--
