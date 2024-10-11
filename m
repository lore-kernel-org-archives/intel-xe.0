Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC4D0EE3F
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 21:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1F310E068;
	Fri, 11 Oct 2024 21:41:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AAD10E038;
 Fri, 11 Oct 2024 21:41:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1474625440766301924=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/ptl=3A_Define_HuC_FW_vers?=
 =?utf-8?q?ion_for_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 21:41:23 -0000
Message-ID: <172868288338.1242210.16208994932649167265@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011163612.6558-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241011163612.6558-1-matthew.s.atwood@intel.com>
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

--===============1474625440766301924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Define HuC FW version for PTL
URL   : https://patchwork.freedesktop.org/series/139905/
State : success

== Summary ==

CI Bug Log - changes from xe-2051-04bb73440015e221297eed8aa260e6e75442b4e6_BAT -> xe-pw-139905v1_BAT
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

  * IGT: IGT_8066 -> IGT_8067
  * Linux: xe-2051-04bb73440015e221297eed8aa260e6e75442b4e6 -> xe-pw-139905v1

  IGT_8066: 6eb0694325c565c6eb4c437f6e5c0650c2b5fd4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8067: e4d91caf2d87b4a93c7e3e3fd24521ead677895b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2051-04bb73440015e221297eed8aa260e6e75442b4e6: 04bb73440015e221297eed8aa260e6e75442b4e6
  xe-pw-139905v1: 139905v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139905v1/index.html

--===============1474625440766301924==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Define HuC FW version for PTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139905/">https://patchwork.freedesktop.org/series/139905/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139905v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139905v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2051-04bb73440015e221297eed8aa260e6e75442b4e6_BAT -&gt; xe-pw-139905v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8066 -&gt; IGT_8067</li>
<li>Linux: xe-2051-04bb73440015e221297eed8aa260e6e75442b4e6 -&gt; xe-pw-139905v1</li>
</ul>
<p>IGT_8066: 6eb0694325c565c6eb4c437f6e5c0650c2b5fd4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8067: e4d91caf2d87b4a93c7e3e3fd24521ead677895b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2051-04bb73440015e221297eed8aa260e6e75442b4e6: 04bb73440015e221297eed8aa260e6e75442b4e6<br />
  xe-pw-139905v1: 139905v1</p>

</body>
</html>

--===============1474625440766301924==--
