Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DBBC48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 14:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5CF10FEFA;
	Mon,  5 Feb 2024 14:58:10 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C07910FA71;
 Mon,  5 Feb 2024 14:58:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7077910773408021626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/ttm=3A_Introduce_TTM_lru_lis?=
 =?utf-8?q?t_links_of_different_types?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 14:58:09 -0000
Message-ID: <170714508931.1024443.14729409522733407449@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240205135158.100766-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240205135158.100766-1-thomas.hellstrom@linux.intel.com>
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

--===============7077910773408021626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Introduce TTM lru list links of different types
URL   : https://patchwork.freedesktop.org/series/129542/
State : success

== Summary ==

CI Bug Log - changes from xe-727-89404d6657779870d0d97f80a267f75a36c6744b_BAT -> xe-pw-129542v1_BAT
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

  * Linux: xe-727-89404d6657779870d0d97f80a267f75a36c6744b -> xe-pw-129542v1

  IGT_7703: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-727-89404d6657779870d0d97f80a267f75a36c6744b: 89404d6657779870d0d97f80a267f75a36c6744b
  xe-pw-129542v1: 129542v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129542v1/index.html

--===============7077910773408021626==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Introduce TTM lru list links of different types</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129542/">https://patchwork.freedesktop.org/series/129542/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129542v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129542v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-727-89404d6657779870d0d97f80a267f75a36c6744b_BAT -&gt; xe-pw-129542v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-727-89404d6657779870d0d97f80a267f75a36c6744b -&gt; xe-pw-129542v1</li>
</ul>
<p>IGT_7703: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-727-89404d6657779870d0d97f80a267f75a36c6744b: 89404d6657779870d0d97f80a267f75a36c6744b<br />
  xe-pw-129542v1: 129542v1</p>

</body>
</html>

--===============7077910773408021626==--
