Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FE5CE7A88
	for <intel-xe@archiver.kernel.org>; Sun, 24 Sep 2023 15:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9316110E1B2;
	Sun, 24 Sep 2023 15:43:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF2E810E13E;
 Sun, 24 Sep 2023 15:43:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 296A0A03D2;
 Sun, 24 Sep 2023 15:43:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5979067874639716760=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Date: Sun, 24 Sep 2023 15:43:12 -0000
Message-ID: <169557019213.29781.6536514071114782175@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
In-Reply-To: <20230924144751.446446-1-arun.r.murthy@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_st?=
 =?utf-8?q?arting_with_=5B1/2=5D_drm/xe=3A_Add_module_parameter_=27fastboo?=
 =?utf-8?q?t=27?=
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

--===============5979067874639716760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Add module parameter 'fastboot'
URL   : https://patchwork.freedesktop.org/series/124163/
State : success

== Summary ==

CI Bug Log - changes from xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625_BAT -> xe-pw-124163v1_BAT
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

  Here are the changes found in xe-pw-124163v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][1] ([Intel XE#524]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124163v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * Linux: xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625 -> xe-pw-124163v1

  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625: 16e2c940ef53f81b2c68e16ec39cf5772894a625
  xe-pw-124163v1: 124163v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124163v1/index.html

--===============5979067874639716760==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Add module parameter &#39;fastboot&#39;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124163/">https://patchwork.freedesktop.org/series/124163/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124163v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124163v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625_BAT -&gt; xe-pw-124163v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124163v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124163v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625 -&gt; xe-pw-124163v1</li>
</ul>
<p>IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625: 16e2c940ef53f81b2c68e16ec39cf5772894a625<br />
  xe-pw-124163v1: 124163v1</p>

</body>
</html>

--===============5979067874639716760==--
