Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA91D65C6F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 11:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B78A10E7EA;
	Thu, 14 Nov 2024 11:01:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6722110E7F0;
 Thu, 14 Nov 2024 11:01:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3454824990611463533=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Introduce_drm_sharpness_property?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 11:01:58 -0000
Message-ID: <173158211841.4035500.17581611912816086981@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114101825.3413688-1-nemesa.garg@intel.com>
In-Reply-To: <20241114101825.3413688-1-nemesa.garg@intel.com>
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

--===============3454824990611463533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce drm sharpness property (rev3)
URL   : https://patchwork.freedesktop.org/series/139954/
State : success

== Summary ==

CI Bug Log - changes from xe-2225-db9b7fa434daee4c587135f8b05da417b9097a42_BAT -> xe-pw-139954v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8108 -> IGT_8109
  * Linux: xe-2225-db9b7fa434daee4c587135f8b05da417b9097a42 -> xe-pw-139954v3

  IGT_8108: 35f458a276912f4da92d61b33b4f62f046ec9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8109: 8109
  xe-2225-db9b7fa434daee4c587135f8b05da417b9097a42: db9b7fa434daee4c587135f8b05da417b9097a42
  xe-pw-139954v3: 139954v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v3/index.html

--===============3454824990611463533==
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
<tr><td><b>Series:</b></td><td>Introduce drm sharpness property (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139954/">https://patchwork.freedesktop.org/series/139954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2225-db9b7fa434daee4c587135f8b05da417b9097a42_BAT -&gt; xe-pw-139954v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8108 -&gt; IGT_8109</li>
<li>Linux: xe-2225-db9b7fa434daee4c587135f8b05da417b9097a42 -&gt; xe-pw-139954v3</li>
</ul>
<p>IGT_8108: 35f458a276912f4da92d61b33b4f62f046ec9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8109: 8109<br />
  xe-2225-db9b7fa434daee4c587135f8b05da417b9097a42: db9b7fa434daee4c587135f8b05da417b9097a42<br />
  xe-pw-139954v3: 139954v3</p>

</body>
</html>

--===============3454824990611463533==--
