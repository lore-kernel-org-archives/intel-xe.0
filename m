Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86048C48285
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 05:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAF01138F7;
	Wed, 31 Jan 2024 05:00:10 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE2F1138F7;
 Wed, 31 Jan 2024 05:00:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0888965790751459979=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Expose_number_of_dss_p?=
 =?utf-8?q?er_group_and_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Wed, 31 Jan 2024 05:00:08 -0000
Message-ID: <170667720891.860255.7355883426870911555@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130212208.235448-1-zhanjun.dong@intel.com>
In-Reply-To: <20240130212208.235448-1-zhanjun.dong@intel.com>
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

--===============0888965790751459979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Expose number of dss per group and helpers
URL   : https://patchwork.freedesktop.org/series/129340/
State : success

== Summary ==

CI Bug Log - changes from xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101_BAT -> xe-pw-129340v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101 -> xe-pw-129340v1

  IGT_7699: 7699
  xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101: 3d244fce99b65e012c4409d8a22bb9168c41f101
  xe-pw-129340v1: 129340v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129340v1/index.html

--===============0888965790751459979==
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
<tr><td><b>Series:</b></td><td>drm/xe: Expose number of dss per group and helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129340/">https://patchwork.freedesktop.org/series/129340/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129340v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129340v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101_BAT -&gt; xe-pw-129340v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101 -&gt; xe-pw-129340v1</li>
</ul>
<p>IGT_7699: 7699<br />
  xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101: 3d244fce99b65e012c4409d8a22bb9168c41f101<br />
  xe-pw-129340v1: 129340v1</p>

</body>
</html>

--===============0888965790751459979==--
