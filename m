Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F168EC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 07:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5914A930;
	Fri, 31 May 2024 07:22:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E50F14A930;
 Fri, 31 May 2024 07:22:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7940836588335106101=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Add_member_supported=5Fdomains_to_xe=5Fforce=5Fwake?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 07:22:23 -0000
Message-ID: <171714014351.2240145.16682833784977741894@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
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

--===============7940836588335106101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Add member supported_domains to xe_force_wake
URL   : https://patchwork.freedesktop.org/series/134277/
State : success

== Summary ==

CI Bug Log - changes from xe-1385-f71136b6df9b8981605aecb08c55ee2f325636df_BAT -> xe-pw-134277v1_BAT
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

  Here are the changes found in xe-pw-134277v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1972])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1385-f71136b6df9b8981605aecb08c55ee2f325636df/bat-atsm-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134277v1/bat-atsm-2/igt@xe_module_load@load.html

  
  [Intel XE#1972]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1972


Build changes
-------------

  * Linux: xe-1385-f71136b6df9b8981605aecb08c55ee2f325636df -> xe-pw-134277v1

  IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1385-f71136b6df9b8981605aecb08c55ee2f325636df: f71136b6df9b8981605aecb08c55ee2f325636df
  xe-pw-134277v1: 134277v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134277v1/index.html

--===============7940836588335106101==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Add member supported_domains to xe_force_wake</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134277/">https://patchwork.freedesktop.org/series/134277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134277v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134277v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1385-f71136b6df9b8981605aecb08c55ee2f325636df_BAT -&gt; xe-pw-134277v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134277v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1385-f71136b6df9b8981605aecb08c55ee2f325636df/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134277v1/bat-atsm-2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1972">Intel XE#1972</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1385-f71136b6df9b8981605aecb08c55ee2f325636df -&gt; xe-pw-134277v1</li>
</ul>
<p>IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1385-f71136b6df9b8981605aecb08c55ee2f325636df: f71136b6df9b8981605aecb08c55ee2f325636df<br />
  xe-pw-134277v1: 134277v1</p>

</body>
</html>

--===============7940836588335106101==--
