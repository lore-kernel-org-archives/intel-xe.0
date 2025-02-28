Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F97C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 08:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1453410E26A;
	Fri, 28 Feb 2025 08:10:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E5710E26A;
 Fri, 28 Feb 2025 08:10:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5723153922592755852=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_the_hotunplug?=
 =?utf-8?q?_NULL_ptr_dereference?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 08:10:21 -0000
Message-ID: <174073022148.3122267.7639897489752610453@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250228065224.320811-1-aradhya.bhatia@intel.com>
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

--===============5723153922592755852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix the hotunplug NULL ptr dereference
URL   : https://patchwork.freedesktop.org/series/145615/
State : success

== Summary ==

CI Bug Log - changes from xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0_BAT -> xe-pw-145615v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0 -> xe-pw-145615v1

  IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0: 873b1a50bb4394e95332cfa611aa6463de6b7cb0
  xe-pw-145615v1: 145615v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145615v1/index.html

--===============5723153922592755852==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix the hotunplug NULL ptr dereference</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145615/">https://patchwork.freedesktop.org/series/145615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145615v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145615v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0_BAT -&gt; xe-pw-145615v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0 -&gt; xe-pw-145615v1</li>
</ul>
<p>IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2730-873b1a50bb4394e95332cfa611aa6463de6b7cb0: 873b1a50bb4394e95332cfa611aa6463de6b7cb0<br />
  xe-pw-145615v1: 145615v1</p>

</body>
</html>

--===============5723153922592755852==--
