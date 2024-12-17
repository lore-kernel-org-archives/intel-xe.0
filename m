Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0180E7716A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 05:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E83110E85C;
	Tue, 17 Dec 2024 05:38:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFD410E85C;
 Tue, 17 Dec 2024 05:38:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6942011129999923518=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/slpc=3A_Remove_unnecessar?=
 =?utf-8?q?y_force_wakes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 05:38:00 -0000
Message-ID: <173441388090.3620127.875237199049496711@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216194119.3017792-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241216194119.3017792-1-vinay.belgaumkar@intel.com>
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

--===============6942011129999923518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/slpc: Remove unnecessary force wakes
URL   : https://patchwork.freedesktop.org/series/142674/
State : success

== Summary ==

CI Bug Log - changes from xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd_BAT -> xe-pw-142674v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 8)
------------------------------

  Missing    (2): bat-adlp-vm bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd -> xe-pw-142674v1

  IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd: 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd
  xe-pw-142674v1: 142674v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142674v1/index.html

--===============6942011129999923518==
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
<tr><td><b>Series:</b></td><td>drm/xe/slpc: Remove unnecessary force wakes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142674/">https://patchwork.freedesktop.org/series/142674/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142674v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142674v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd_BAT -&gt; xe-pw-142674v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): bat-adlp-vm bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd -&gt; xe-pw-142674v1</li>
</ul>
<p>IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd: 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd<br />
  xe-pw-142674v1: 142674v1</p>

</body>
</html>

--===============6942011129999923518==--
