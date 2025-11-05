Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED51CCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 08:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9DC10E2B1;
	Wed,  5 Nov 2025 08:03:08 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C6810E2B1;
 Wed,  5 Nov 2025 08:03:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5258002363981691971=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Remove_never_used?=
 =?utf-8?q?_code_in_xe=5Fvm=5Fcreate=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 08:03:07 -0000
Message-ID: <176232978719.19585.14306764130422370273@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105011311.3177875-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20251105011311.3177875-1-gwan-gyeong.mun@intel.com>
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

--===============5258002363981691971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove never used code in xe_vm_create()
URL   : https://patchwork.freedesktop.org/series/157049/
State : success

== Summary ==

CI Bug Log - changes from xe-4045-957ab9ac657700dee50f42438ed79652dad939a0_BAT -> xe-pw-157049v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4045-957ab9ac657700dee50f42438ed79652dad939a0 -> xe-pw-157049v1

  IGT_8607: 8607
  xe-4045-957ab9ac657700dee50f42438ed79652dad939a0: 957ab9ac657700dee50f42438ed79652dad939a0
  xe-pw-157049v1: 157049v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157049v1/index.html

--===============5258002363981691971==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove never used code in xe_vm_create()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157049/">https://patchwork.freedesktop.org/series/157049/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157049v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157049v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4045-957ab9ac657700dee50f42438ed79652dad939a0_BAT -&gt; xe-pw-157049v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4045-957ab9ac657700dee50f42438ed79652dad939a0 -&gt; xe-pw-157049v1</li>
</ul>
<p>IGT_8607: 8607<br />
  xe-4045-957ab9ac657700dee50f42438ed79652dad939a0: 957ab9ac657700dee50f42438ed79652dad939a0<br />
  xe-pw-157049v1: 157049v1</p>

</body>
</html>

--===============5258002363981691971==--
