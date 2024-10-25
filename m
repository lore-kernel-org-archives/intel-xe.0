Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB30D11701
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 06:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC8810E9FE;
	Fri, 25 Oct 2024 06:27:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5429B10E9FB;
 Fri, 25 Oct 2024 06:27:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4556224648774210685=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_series_starting_with_=5Bv1=2C1/?=
 =?utf-8?q?1=5D_drm/xe/guc=3A_Fix_missing_init_value_and_add_register_order_?=
 =?utf-8?q?check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 06:27:17 -0000
Message-ID: <172983763733.1330837.9210477676456070385@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
In-Reply-To: <20241023192307.746525-1-zhanjun.dong@intel.com>
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

--===============4556224648774210685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v1,1/1] drm/xe/guc: Fix missing init value and add register order check
URL   : https://patchwork.freedesktop.org/series/140392/
State : success

== Summary ==

CI Bug Log - changes from xe-2110-4456dc1cd52e3e6db4513bacc85e6982ac9e101d_full -> xe-pw-140392v1_full
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

  * Linux: xe-2110-4456dc1cd52e3e6db4513bacc85e6982ac9e101d -> xe-pw-140392v1

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2110-4456dc1cd52e3e6db4513bacc85e6982ac9e101d: 4456dc1cd52e3e6db4513bacc85e6982ac9e101d
  xe-pw-140392v1: 140392v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v1/index.html

--===============4556224648774210685==
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
<tr><td><b>Series:</b></td><td>series starting with [v1,1/1] drm/xe/guc: Fix missing init value and add register order check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140392/">https://patchwork.freedesktop.org/series/140392/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2110-4456dc1cd52e3e6db4513bacc85e6982ac9e101d_full -&gt; xe-pw-140392v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2110-4456dc1cd52e3e6db4513bacc85e6982ac9e101d -&gt; xe-pw-140392v1</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2110-4456dc1cd52e3e6db4513bacc85e6982ac9e101d: 4456dc1cd52e3e6db4513bacc85e6982ac9e101d<br />
  xe-pw-140392v1: 140392v1</p>

</body>
</html>

--===============4556224648774210685==--
