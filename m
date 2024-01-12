Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9DBC47422
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 10:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8438210E086;
	Fri, 12 Jan 2024 10:42:15 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087CD10E086;
 Fri, 12 Jan 2024 10:42:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4386242420785917174=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_ensure_fbc_cfb_size_to?=
 =?utf-8?q?_be_page_size_aligned?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Fri, 12 Jan 2024 10:42:15 -0000
Message-ID: <170505613503.332504.17439682451058420884@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112092803.61664-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240112092803.61664-1-vinod.govindapillai@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============4386242420785917174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: ensure fbc cfb size to be page size aligned
URL   : https://patchwork.freedesktop.org/series/128709/
State : success

== Summary ==

CI Bug Log - changes from xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b_BAT -> xe-pw-128709v1_BAT
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

  * Linux: xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b -> xe-pw-128709v1

  IGT_7671: 7671
  xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b: 10923212b018be3edb1c21b75f432c6cf3f50c6b
  xe-pw-128709v1: 128709v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128709v1/index.html

--===============4386242420785917174==
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
<tr><td><b>Series:</b></td><td>drm/xe: ensure fbc cfb size to be page size aligned</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128709/">https://patchwork.freedesktop.org/series/128709/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128709v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128709v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b_BAT -&gt; xe-pw-128709v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b -&gt; xe-pw-128709v1</li>
</ul>
<p>IGT_7671: 7671<br />
  xe-622-10923212b018be3edb1c21b75f432c6cf3f50c6b: 10923212b018be3edb1c21b75f432c6cf3f50c6b<br />
  xe-pw-128709v1: 128709v1</p>

</body>
</html>

--===============4386242420785917174==--
