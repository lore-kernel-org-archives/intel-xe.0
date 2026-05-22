Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9DECD5BAB
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 00:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E4410F497;
	Fri, 22 May 2026 00:30:55 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4686210F497;
 Fri, 22 May 2026 00:30:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0084832101464554516=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pxp=3A_PXP_no_longer?=
 =?utf-8?q?_requires_HuC_from_media_35_onwards?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 May 2026 00:30:54 -0000
Message-ID: <177940985428.98930.16365561097330477346@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260521233132.883021-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260521233132.883021-2-daniele.ceraolospurio@intel.com>
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

--===============0084832101464554516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pxp: PXP no longer requires HuC from media 35 onwards
URL   : https://patchwork.freedesktop.org/series/167053/
State : success

== Summary ==

CI Bug Log - changes from xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49_BAT -> xe-pw-167053v1_BAT
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

  * IGT: IGT_8931 -> IGT_8933
  * Linux: xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49 -> xe-pw-167053v1

  IGT_8931: 73eddd089afd99e93ff688dfcad56b1c54d30a70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8933: 8933
  xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49: f103db97c610a41177720b08aa4a2a05f9b42d49
  xe-pw-167053v1: 167053v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167053v1/index.html

--===============0084832101464554516==
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
<tr><td><b>Series:</b></td><td>drm/xe/pxp: PXP no longer requires HuC from media 35 onwards</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167053/">https://patchwork.freedesktop.org/series/167053/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167053v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167053v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49_BAT -&gt; xe-pw-167053v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8931 -&gt; IGT_8933</li>
<li>Linux: xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49 -&gt; xe-pw-167053v1</li>
</ul>
<p>IGT_8931: 73eddd089afd99e93ff688dfcad56b1c54d30a70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8933: 8933<br />
  xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49: f103db97c610a41177720b08aa4a2a05f9b42d49<br />
  xe-pw-167053v1: 167053v1</p>

</body>
</html>

--===============0084832101464554516==--
