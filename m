Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B2C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 13:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A708112036;
	Thu, 25 Apr 2024 13:53:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82EE112036;
 Thu, 25 Apr 2024 13:53:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1613212946202247141=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_engine_name_to_the?=
 =?utf-8?q?_engine_reset_and_cat-err_log?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 13:53:06 -0000
Message-ID: <171405318681.1650662.2440826862027845731@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425121856.4500-1-nirmoy.das@intel.com>
In-Reply-To: <20240425121856.4500-1-nirmoy.das@intel.com>
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

--===============1613212946202247141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add engine name to the engine reset and cat-err log
URL   : https://patchwork.freedesktop.org/series/132907/
State : success

== Summary ==

CI Bug Log - changes from xe-1177-972738688dc48cf04e4aec9a39ef4703c78aa17b_BAT -> xe-pw-132907v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1177-972738688dc48cf04e4aec9a39ef4703c78aa17b -> xe-pw-132907v1

  IGT_7824: 7824
  xe-1177-972738688dc48cf04e4aec9a39ef4703c78aa17b: 972738688dc48cf04e4aec9a39ef4703c78aa17b
  xe-pw-132907v1: 132907v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132907v1/index.html

--===============1613212946202247141==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add engine name to the engine reset and cat-err log</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132907/">https://patchwork.freedesktop.org/series/132907/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132907v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132907v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1177-972738688dc48cf04e4aec9a39ef4703c78aa17b_BAT -&gt; xe-pw-132907v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1177-972738688dc48cf04e4aec9a39ef4703c78aa17b -&gt; xe-pw-132907v1</li>
</ul>
<p>IGT_7824: 7824<br />
  xe-1177-972738688dc48cf04e4aec9a39ef4703c78aa17b: 972738688dc48cf04e4aec9a39ef4703c78aa17b<br />
  xe-pw-132907v1: 132907v1</p>

</body>
</html>

--===============1613212946202247141==--
