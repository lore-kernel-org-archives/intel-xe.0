Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B4EC4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 19:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D6E10E1D6;
	Wed,  7 Feb 2024 19:04:01 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2E310E1D6;
 Wed,  7 Feb 2024 19:04:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5331325758368129723=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Add_uAPI_to_query_GuC_firmware_submission_version?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Feb 2024 19:04:00 -0000
Message-ID: <170733264069.1087558.12555957793192178159@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240207181412.96548-1-jose.souza@intel.com>
In-Reply-To: <20240207181412.96548-1-jose.souza@intel.com>
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

--===============5331325758368129723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Add uAPI to query GuC firmware submission version
URL   : https://patchwork.freedesktop.org/series/129640/
State : success

== Summary ==

CI Bug Log - changes from xe-745-473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6_BAT -> xe-pw-129640v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-745-473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6 -> xe-pw-129640v1

  IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-745-473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6: 473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6
  xe-pw-129640v1: 129640v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129640v1/index.html

--===============5331325758368129723==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Add uAPI to query GuC firmware submission version</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129640/">https://patchwork.freedesktop.org/series/129640/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129640v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129640v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-745-473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6_BAT -&gt; xe-pw-129640v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-745-473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6 -&gt; xe-pw-129640v1</li>
</ul>
<p>IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-745-473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6: 473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6<br />
  xe-pw-129640v1: 129640v1</p>

</body>
</html>

--===============5331325758368129723==--
