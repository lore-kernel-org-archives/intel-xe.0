Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A6CC79FA1
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 00:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B17E10E183;
	Wed,  9 Sep 2026 00:14:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA4810E183;
 Wed,  9 Sep 2026 00:14:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4596023643270623577=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Some_error_handling_improve?=
 =?utf-8?q?ments_in_GuC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 00:14:52 -0000
Message-ID: <178891289251.137999.6386455596990248244@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
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

--===============4596023643270623577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Some error handling improvements in GuC
URL   : https://patchwork.freedesktop.org/series/173637/
State : success

== Summary ==

CI Bug Log - changes from xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_BAT -> xe-pw-173637v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 12)
------------------------------

  Missing    (2): bat-nvls-2 bat-lnl-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -> xe-pw-173637v1

  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada
  xe-pw-173637v1: 173637v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173637v1/index.html

--===============4596023643270623577==
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
<tr><td><b>Series:</b></td><td>Some error handling improvements in GuC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173637/">https://patchwork.freedesktop.org/series/173637/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173637v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173637v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_BAT -&gt; xe-pw-173637v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 12)</h2>
<p>Missing    (2): bat-nvls-2 bat-lnl-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -&gt; xe-pw-173637v1</li>
</ul>
<p>IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada<br />
  xe-pw-173637v1: 173637v1</p>

</body>
</html>

--===============4596023643270623577==--
