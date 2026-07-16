Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0F6C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 22:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FA310F411;
	Thu, 16 Jul 2026 22:36:34 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7260A10F408;
 Thu, 16 Jul 2026 22:36:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7743051760565688844=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/multi=5Fqueue=3A_Rej?=
 =?utf-8?q?ect_PXP_usage_on_multi-queue_exec_queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jul 2026 22:36:32 -0000
Message-ID: <178424139246.199042.1547325240587229152@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <4d369249d52384bc93663055a3757a50614ebbfd.1784238312.git.jagmeet.randhawa@intel.com>
In-Reply-To: <4d369249d52384bc93663055a3757a50614ebbfd.1784238312.git.jagmeet.randhawa@intel.com>
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

--===============7743051760565688844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/multi_queue: Reject PXP usage on multi-queue exec queues
URL   : https://patchwork.freedesktop.org/series/170604/
State : success

== Summary ==

CI Bug Log - changes from xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319_BAT -> xe-pw-170604v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319 -> xe-pw-170604v1

  IGT_9010: 17413fe8bc1c3c9418d3d2359fc16531927ab42e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319: 0fcee361fa4cf13207af78b95e71bbbaeb046319
  xe-pw-170604v1: 170604v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170604v1/index.html

--===============7743051760565688844==
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
<tr><td><b>Series:</b></td><td>drm/xe/multi_queue: Reject PXP usage on multi-queue exec queues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170604/">https://patchwork.freedesktop.org/series/170604/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170604v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170604v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319_BAT -&gt; xe-pw-170604v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319 -&gt; xe-pw-170604v1</li>
</ul>
<p>IGT_9010: 17413fe8bc1c3c9418d3d2359fc16531927ab42e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319: 0fcee361fa4cf13207af78b95e71bbbaeb046319<br />
  xe-pw-170604v1: 170604v1</p>

</body>
</html>

--===============7743051760565688844==--
