Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C83C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 14:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36AB12B0BB;
	Thu, 30 May 2024 14:52:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F25712B0BB;
 Thu, 30 May 2024 14:52:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4943348946098178859=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_VF=3A_Setup_VRAM_based_on_receiv?=
 =?utf-8?q?ed_config_data_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 14:52:18 -0000
Message-ID: <171708073851.2238782.4152721578999792438@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240530133527.1328-1-michal.wajdeczko@intel.com>
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

--===============4943348946098178859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF: Setup VRAM based on received config data (rev2)
URL   : https://patchwork.freedesktop.org/series/134097/
State : success

== Summary ==

CI Bug Log - changes from xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468_BAT -> xe-pw-134097v2_BAT
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

  * Linux: xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468 -> xe-pw-134097v2

  IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468: 2673d3bec539b78f4368d00e0bf66d1449d77468
  xe-pw-134097v2: 134097v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/index.html

--===============4943348946098178859==
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
<tr><td><b>Series:</b></td><td>VF: Setup VRAM based on received config data (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134097/">https://patchwork.freedesktop.org/series/134097/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468_BAT -&gt; xe-pw-134097v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468 -&gt; xe-pw-134097v2</li>
</ul>
<p>IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468: 2673d3bec539b78f4368d00e0bf66d1449d77468<br />
  xe-pw-134097v2: 134097v2</p>

</body>
</html>

--===============4943348946098178859==--
