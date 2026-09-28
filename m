Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BAFCA5FAB
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 23:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D03710E22B;
	Mon, 28 Sep 2026 23:34:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E094710E18C;
 Mon, 28 Sep 2026 23:34:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2214356347074009233=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Implement_print_v?=
 =?utf-8?q?func_for_page_fault_info_logging_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Sep 2026 23:34:07 -0000
Message-ID: <179063844791.215488.9412669056930755067@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260928222241.3815153-2-brian3.nguyen@intel.com>
In-Reply-To: <20260928222241.3815153-2-brian3.nguyen@intel.com>
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

--===============2214356347074009233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Implement print vfunc for page fault info logging (rev3)
URL   : https://patchwork.freedesktop.org/series/175024/
State : success

== Summary ==

CI Bug Log - changes from xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a_BAT -> xe-pw-175024v3_BAT
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

  * IGT: IGT_9113 -> IGT_9114
  * Linux: xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a -> xe-pw-175024v3

  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a: 972eeb850a4ca07aba05ccb805db28a33eab2c9a
  xe-pw-175024v3: 175024v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175024v3/index.html

--===============2214356347074009233==
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
<tr><td><b>Series:</b></td><td>drm/xe: Implement print vfunc for page fault info logging (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175024/">https://patchwork.freedesktop.org/series/175024/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175024v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175024v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a_BAT -&gt; xe-pw-175024v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9113 -&gt; IGT_9114</li>
<li>Linux: xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a -&gt; xe-pw-175024v3</li>
</ul>
<p>IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a: 972eeb850a4ca07aba05ccb805db28a33eab2c9a<br />
  xe-pw-175024v3: 175024v3</p>

</body>
</html>

--===============2214356347074009233==--
