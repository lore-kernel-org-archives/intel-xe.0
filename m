Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F368C44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 09:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC1E10E456;
	Fri, 17 Jul 2026 09:41:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4AB10E456;
 Fri, 17 Jul 2026 09:41:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8472132413285086440=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/sysctrl=3A_Detect_ov?=
 =?utf-8?q?ersized_sysctrl_mailbox_responses?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jul 2026 09:41:05 -0000
Message-ID: <178428126589.200519.7215732834798688965@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260717082657.2466495-2-anoop.c.vijay@intel.com>
In-Reply-To: <20260717082657.2466495-2-anoop.c.vijay@intel.com>
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

--===============8472132413285086440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Detect oversized sysctrl mailbox responses
URL   : https://patchwork.freedesktop.org/series/170623/
State : success

== Summary ==

CI Bug Log - changes from xe-5424-22852552aa1b7198931842ddf824af4dd09e2814_BAT -> xe-pw-170623v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9011 -> IGT_9012
  * Linux: xe-5424-22852552aa1b7198931842ddf824af4dd09e2814 -> xe-pw-170623v1

  IGT_9011: 9011
  IGT_9012: d94a55886c7eec82a791728d3cc1c4a6aa945281 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5424-22852552aa1b7198931842ddf824af4dd09e2814: 22852552aa1b7198931842ddf824af4dd09e2814
  xe-pw-170623v1: 170623v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170623v1/index.html

--===============8472132413285086440==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Detect oversized sysctrl mailbox responses</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170623/">https://patchwork.freedesktop.org/series/170623/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170623v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170623v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5424-22852552aa1b7198931842ddf824af4dd09e2814_BAT -&gt; xe-pw-170623v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9011 -&gt; IGT_9012</li>
<li>Linux: xe-5424-22852552aa1b7198931842ddf824af4dd09e2814 -&gt; xe-pw-170623v1</li>
</ul>
<p>IGT_9011: 9011<br />
  IGT_9012: d94a55886c7eec82a791728d3cc1c4a6aa945281 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5424-22852552aa1b7198931842ddf824af4dd09e2814: 22852552aa1b7198931842ddf824af4dd09e2814<br />
  xe-pw-170623v1: 170623v1</p>

</body>
</html>

--===============8472132413285086440==--
