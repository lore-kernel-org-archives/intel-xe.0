Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9B2D1CA36
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 06:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C8610E524;
	Tue,  5 Nov 2024 06:25:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531BA10E524;
 Tue,  5 Nov 2024 06:25:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3191764684035910173=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/i915/display=3A_convert_dis?=
 =?utf-8?q?play_feature_helpers_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 06:25:45 -0000
Message-ID: <173078794533.1410369.11750488027288482278@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730740629.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730740629.git.jani.nikula@intel.com>
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

--===============3191764684035910173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: convert display feature helpers to struct intel_display
URL   : https://patchwork.freedesktop.org/series/140887/
State : success

== Summary ==

CI Bug Log - changes from xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f_full -> xe-pw-140887v1_full
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

  * IGT: IGT_8093 -> IGT_8094
  * Linux: xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f -> xe-pw-140887v1

  IGT_8093: 8093
  IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f
  xe-pw-140887v1: 140887v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v1/index.html

--===============3191764684035910173==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: convert display feature helpers to struct intel_display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140887/">https://patchwork.freedesktop.org/series/140887/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f_full -&gt; xe-pw-140887v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8093 -&gt; IGT_8094</li>
<li>Linux: xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f -&gt; xe-pw-140887v1</li>
</ul>
<p>IGT_8093: 8093<br />
  IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f<br />
  xe-pw-140887v1: 140887v1</p>

</body>
</html>

--===============3191764684035910173==--
