Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EE0C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 20:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD9710E314;
	Tue, 11 Feb 2025 20:59:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622CC10E314;
 Tue, 11 Feb 2025 20:59:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8517457847474304646=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe/guc=5Fpc=3A_Do_not_stop_probe_or_resume_if_GuC_PC_fail?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Feb 2025 20:59:06 -0000
Message-ID: <173930754639.1056208.14272577243500782502@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250211200911.199213-1-rodrigo.vivi@intel.com>
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

--===============8517457847474304646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails
URL   : https://patchwork.freedesktop.org/series/144681/
State : success

== Summary ==

CI Bug Log - changes from xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee_BAT -> xe-pw-144681v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee -> xe-pw-144681v1

  IGT_8228: 8228
  xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee: e1c145994c41ed6dd5265bc0a7a276fe1834f3ee
  xe-pw-144681v1: 144681v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144681v1/index.html

--===============8517457847474304646==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144681/">https://patchwork.freedesktop.org/series/144681/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144681v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144681v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee_BAT -&gt; xe-pw-144681v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee -&gt; xe-pw-144681v1</li>
</ul>
<p>IGT_8228: 8228<br />
  xe-2641-e1c145994c41ed6dd5265bc0a7a276fe1834f3ee: e1c145994c41ed6dd5265bc0a7a276fe1834f3ee<br />
  xe-pw-144681v1: 144681v1</p>

</body>
</html>

--===============8517457847474304646==--
