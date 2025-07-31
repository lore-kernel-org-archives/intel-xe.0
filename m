Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E452AC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 11:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2D010E394;
	Thu, 31 Jul 2025 11:53:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4163810E394;
 Thu, 31 Jul 2025 11:53:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6196696848517074847=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Some_more_xe=5Fmigrate=5Fac?=
 =?utf-8?q?cess=5Fmemory_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 11:53:45 -0000
Message-ID: <175396282526.201961.17384674054307873536@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731093807.207572-5-matthew.auld@intel.com>
In-Reply-To: <20250731093807.207572-5-matthew.auld@intel.com>
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

--===============6196696848517074847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Some more xe_migrate_access_memory fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/152297/
State : success

== Summary ==

CI Bug Log - changes from xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8_BAT -> xe-pw-152297v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8479 -> IGT_8481
  * Linux: xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8 -> xe-pw-152297v2

  IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8481: 8481
  xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8: 7f74ca5c75dd28bc57d5ea1be165919bc70609d8
  xe-pw-152297v2: 152297v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152297v2/index.html

--===============6196696848517074847==
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
<tr><td><b>Series:</b></td><td>Some more xe_migrate_access_memory fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152297/">https://patchwork.freedesktop.org/series/152297/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152297v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152297v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8_BAT -&gt; xe-pw-152297v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8479 -&gt; IGT_8481</li>
<li>Linux: xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8 -&gt; xe-pw-152297v2</li>
</ul>
<p>IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8481: 8481<br />
  xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8: 7f74ca5c75dd28bc57d5ea1be165919bc70609d8<br />
  xe-pw-152297v2: 152297v2</p>

</body>
</html>

--===============6196696848517074847==--
