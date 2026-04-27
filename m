Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161DDFF886D
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB5E10E8F5;
	Mon, 27 Apr 2026 19:59:59 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9C710E8F5;
 Mon, 27 Apr 2026 19:59:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7665353976905029961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E65=2E0_for_BMG=2C_LNL=2C_PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Apr 2026 19:59:58 -0000
Message-ID: <177731999856.15921.48707958198640094@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424203007.2370832-2-julia.filipchuk@intel.com>
In-Reply-To: <20260424203007.2370832-2-julia.filipchuk@intel.com>
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

--===============7665353976905029961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.65.0 for BMG, LNL, PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/165457/
State : success

== Summary ==

CI Bug Log - changes from xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf_BAT -> xe-pw-165457v2_BAT
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

  * IGT: IGT_8873 -> IGT_8874
  * Linux: xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf -> xe-pw-165457v2

  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf: b6f6b69b2dffa9ad1c43b2149786b4630d41acbf
  xe-pw-165457v2: 165457v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v2/index.html

--===============7665353976905029961==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Test GuC v70.65.0 for BMG, LNL, PTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165457/">https://patchwork.freedesktop.org/series/165457/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf_BAT -&gt; xe-pw-165457v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8873 -&gt; IGT_8874</li>
<li>Linux: xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf -&gt; xe-pw-165457v2</li>
</ul>
<p>IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf: b6f6b69b2dffa9ad1c43b2149786b4630d41acbf<br />
  xe-pw-165457v2: 165457v2</p>

</body>
</html>

--===============7665353976905029961==--
