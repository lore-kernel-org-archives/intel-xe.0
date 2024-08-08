Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78D3C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7330B10E7E6;
	Thu,  8 Aug 2024 18:59:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3BE10E7E6;
 Thu,  8 Aug 2024 18:59:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1181254309546354100=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Fix_xe=5Fhwmon?=
 =?utf-8?q?=5Fpcode=5Fwrite=5Fi1_param_from_u32_to_u16?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 18:59:28 -0000
Message-ID: <172314356837.550660.12313957269374046021@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808172734.2233594-1-karthik.poosa@intel.com>
In-Reply-To: <20240808172734.2233594-1-karthik.poosa@intel.com>
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

--===============1181254309546354100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32 to u16
URL   : https://patchwork.freedesktop.org/series/137054/
State : success

== Summary ==

CI Bug Log - changes from xe-1734-94ce1271fe45d064b69a05a1b265a4e8caa086ee_BAT -> xe-pw-137054v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1734-94ce1271fe45d064b69a05a1b265a4e8caa086ee -> xe-pw-137054v1

  IGT_7962: 7962
  xe-1734-94ce1271fe45d064b69a05a1b265a4e8caa086ee: 94ce1271fe45d064b69a05a1b265a4e8caa086ee
  xe-pw-137054v1: 137054v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137054v1/index.html

--===============1181254309546354100==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32 to u16</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137054/">https://patchwork.freedesktop.org/series/137054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137054v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137054v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1734-94ce1271fe45d064b69a05a1b265a4e8caa086ee_BAT -&gt; xe-pw-137054v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1734-94ce1271fe45d064b69a05a1b265a4e8caa086ee -&gt; xe-pw-137054v1</li>
</ul>
<p>IGT_7962: 7962<br />
  xe-1734-94ce1271fe45d064b69a05a1b265a4e8caa086ee: 94ce1271fe45d064b69a05a1b265a4e8caa086ee<br />
  xe-pw-137054v1: 137054v1</p>

</body>
</html>

--===============1181254309546354100==--
