Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BBBC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 12:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D2310E06F;
	Mon, 25 Mar 2024 12:24:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767FB10E06F;
 Mon, 25 Mar 2024 12:24:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1609479708516180411=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv5=2C1/2?=
 =?utf-8?q?=5D_drm/xe/query=3A_Define_and_use_a_constant_for_the_number_of_m?=
 =?utf-8?q?asks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 12:24:47 -0000
Message-ID: <171136948748.1035674.8618697512825854127@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325111439.7-1-francois.dugast@intel.com>
In-Reply-To: <20240325111439.7-1-francois.dugast@intel.com>
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

--===============1609479708516180411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v5,1/2] drm/xe/query: Define and use a constant for the number of masks
URL   : https://patchwork.freedesktop.org/series/131573/
State : success

== Summary ==

CI Bug Log - changes from xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e_BAT -> xe-pw-131573v1_BAT
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

  Here are the changes found in xe-pw-131573v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][1] ([Intel XE#804])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131573v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * Linux: xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e -> xe-pw-131573v1

  IGT_7780: 93a5298ac980333738cf75da6b66fa6f3769205f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e: fc736bbab7abcae683f52604591fe16cf2a85b3e
  xe-pw-131573v1: 131573v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131573v1/index.html

--===============1609479708516180411==
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
<tr><td><b>Series:</b></td><td>series starting with [v5,1/2] drm/xe/query: Define and use a constant for the number of masks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131573/">https://patchwork.freedesktop.org/series/131573/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131573v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131573v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e_BAT -&gt; xe-pw-131573v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131573v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-mixed-threads-small:<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131573v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e -&gt; xe-pw-131573v1</li>
</ul>
<p>IGT_7780: 93a5298ac980333738cf75da6b66fa6f3769205f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e: fc736bbab7abcae683f52604591fe16cf2a85b3e<br />
  xe-pw-131573v1: 131573v1</p>

</body>
</html>

--===============1609479708516180411==--
