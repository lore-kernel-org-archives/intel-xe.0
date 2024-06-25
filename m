Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BEDC3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 13:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A6710E637;
	Tue, 25 Jun 2024 13:30:54 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFDC10E2E7;
 Tue, 25 Jun 2024 13:30:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0261794905628321845=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Support_PMT_features_in_Xe_=28re?=
 =?utf-8?q?v3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 13:30:52 -0000
Message-ID: <171932225263.154922.12080144242551052212@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
In-Reply-To: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
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

--===============0261794905628321845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Support PMT features in Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/133472/
State : success

== Summary ==

CI Bug Log - changes from xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3_BAT -> xe-pw-133472v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-133472v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_intel_bb@bb-with-allocator:
    - bat-atsm-2:         [DMESG-WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/bat-atsm-2/igt@xe_intel_bb@bb-with-allocator.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v3/bat-atsm-2/igt@xe_intel_bb@bb-with-allocator.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-atsm-2:         [SKIP][3] ([Intel XE#2109]) -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v3/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109


Build changes
-------------

  * Linux: xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3 -> xe-pw-133472v3

  IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3: 61dfb30a52fac9b1bb455a250799611682334cc3
  xe-pw-133472v3: 133472v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v3/index.html

--===============0261794905628321845==
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
<tr><td><b>Series:</b></td><td>Support PMT features in Xe (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133472/">https://patchwork.freedesktop.org/series/133472/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3_BAT -&gt; xe-pw-133472v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133472v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_intel_bb@bb-with-allocator:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/bat-atsm-2/igt@xe_intel_bb@bb-with-allocator.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v3/bat-atsm-2/igt@xe_intel_bb@bb-with-allocator.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v3/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3 -&gt; xe-pw-133472v3</li>
</ul>
<p>IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3: 61dfb30a52fac9b1bb455a250799611682334cc3<br />
  xe-pw-133472v3: 133472v3</p>

</body>
</html>

--===============0261794905628321845==--
