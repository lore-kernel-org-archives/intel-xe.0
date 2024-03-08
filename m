Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D803AC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 16:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FC410EF9F;
	Fri,  8 Mar 2024 16:16:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4110EF9F;
 Fri,  8 Mar 2024 16:16:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3647419307551296355=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hdcp=3A_Fix_condition_for?=
 =?utf-8?q?_hdcp_gsc_cs_requirement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 16:16:50 -0000
Message-ID: <170991461015.621641.4060717983342103972@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308134817.1940638-2-suraj.kandpal@intel.com>
In-Reply-To: <20240308134817.1940638-2-suraj.kandpal@intel.com>
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

--===============3647419307551296355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
URL   : https://patchwork.freedesktop.org/series/130920/
State : success

== Summary ==

CI Bug Log - changes from xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38_BAT -> xe-pw-130920v1_BAT
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

  Here are the changes found in xe-pw-130920v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#1167]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130920v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167


Build changes
-------------

  * IGT: IGT_7749 -> IGT_7750
  * Linux: xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38 -> xe-pw-130920v1

  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7750: 856773abcf75b3beba8a0ae1561b07a5f00b3337 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38: 024301d28b0b2cf492ffdb3ce688044cd9923f38
  xe-pw-130920v1: 130920v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130920v1/index.html

--===============3647419307551296355==
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
<tr><td><b>Series:</b></td><td>drm/xe/hdcp: Fix condition for hdcp gsc cs requirement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130920/">https://patchwork.freedesktop.org/series/130920/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130920v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130920v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38_BAT -&gt; xe-pw-130920v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130920v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130920v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7749 -&gt; IGT_7750</li>
<li>Linux: xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38 -&gt; xe-pw-130920v1</li>
</ul>
<p>IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7750: 856773abcf75b3beba8a0ae1561b07a5f00b3337 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38: 024301d28b0b2cf492ffdb3ce688044cd9923f38<br />
  xe-pw-130920v1: 130920v1</p>

</body>
</html>

--===============3647419307551296355==--
