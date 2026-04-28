Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA54FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 21:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF3B10EDCE;
	Tue, 28 Apr 2026 21:11:18 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B40110EDD5;
 Tue, 28 Apr 2026 21:11:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3503539599870692318=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Fix_EAGAIN_sig?=
 =?utf-8?q?n_in_pf=5Fmigration=5Fconsume=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 21:11:17 -0000
Message-ID: <177741067704.22699.13482729878800154361@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428201448.3999428-1-shuicheng.lin@intel.com>
In-Reply-To: <20260428201448.3999428-1-shuicheng.lin@intel.com>
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

--===============3503539599870692318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Fix EAGAIN sign in pf_migration_consume() (rev2)
URL   : https://patchwork.freedesktop.org/series/165664/
State : success

== Summary ==

CI Bug Log - changes from xe-4946-e066eb26712bca7174e694a358351c50a38661d6_BAT -> xe-pw-165664v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8874 -> IGT_8875
  * Linux: xe-4946-e066eb26712bca7174e694a358351c50a38661d6 -> xe-pw-165664v2

  IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8875: 5f5503b3bd1939fa733df60df7a6bf2b2101ee5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4946-e066eb26712bca7174e694a358351c50a38661d6: e066eb26712bca7174e694a358351c50a38661d6
  xe-pw-165664v2: 165664v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165664v2/index.html

--===============3503539599870692318==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Fix EAGAIN sign in pf_migration_consume() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165664/">https://patchwork.freedesktop.org/series/165664/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165664v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165664v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4946-e066eb26712bca7174e694a358351c50a38661d6_BAT -&gt; xe-pw-165664v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8874 -&gt; IGT_8875</li>
<li>Linux: xe-4946-e066eb26712bca7174e694a358351c50a38661d6 -&gt; xe-pw-165664v2</li>
</ul>
<p>IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8875: 5f5503b3bd1939fa733df60df7a6bf2b2101ee5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4946-e066eb26712bca7174e694a358351c50a38661d6: e066eb26712bca7174e694a358351c50a38661d6<br />
  xe-pw-165664v2: 165664v2</p>

</body>
</html>

--===============3503539599870692318==--
