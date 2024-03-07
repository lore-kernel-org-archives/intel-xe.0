Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B705C48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 14:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F1D10EAB5;
	Thu,  7 Mar 2024 14:45:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C6B10EAB5;
 Thu,  7 Mar 2024 14:45:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2361506681254999310=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv2=2C1/3?=
 =?utf-8?q?=5D_drm/xe=3A_Make_devcoredump_VM_error_state_print_consistent?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 14:45:00 -0000
Message-ID: <170982270016.580282.13755148779668357887@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240307135229.41973-1-jose.souza@intel.com>
In-Reply-To: <20240307135229.41973-1-jose.souza@intel.com>
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

--===============2361506681254999310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/3] drm/xe: Make devcoredump VM error state print consistent
URL   : https://patchwork.freedesktop.org/series/130866/
State : success

== Summary ==

CI Bug Log - changes from xe-913-52039ea425493b1ee6e3362f46f6d0b179d380b5_BAT -> xe-pw-130866v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-913-52039ea425493b1ee6e3362f46f6d0b179d380b5 -> xe-pw-130866v1

  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-913-52039ea425493b1ee6e3362f46f6d0b179d380b5: 52039ea425493b1ee6e3362f46f6d0b179d380b5
  xe-pw-130866v1: 130866v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130866v1/index.html

--===============2361506681254999310==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/3] drm/xe: Make devcoredump VM error state print consistent</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130866/">https://patchwork.freedesktop.org/series/130866/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130866v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130866v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-913-52039ea425493b1ee6e3362f46f6d0b179d380b5_BAT -&gt; xe-pw-130866v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-913-52039ea425493b1ee6e3362f46f6d0b179d380b5 -&gt; xe-pw-130866v1</li>
</ul>
<p>IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-913-52039ea425493b1ee6e3362f46f6d0b179d380b5: 52039ea425493b1ee6e3362f46f6d0b179d380b5<br />
  xe-pw-130866v1: 130866v1</p>

</body>
</html>

--===============2361506681254999310==--
