Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA43C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 17:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AACA112CBA;
	Thu, 30 May 2024 17:16:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42531129CA;
 Thu, 30 May 2024 17:16:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1548754004051570556=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Tracing_cleanup_and_add_mmio_tra?=
 =?utf-8?q?cing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 17:16:38 -0000
Message-ID: <171708939873.2238782.13263844153155525877@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
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

--===============1548754004051570556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Tracing cleanup and add mmio tracing
URL   : https://patchwork.freedesktop.org/series/134258/
State : success

== Summary ==

CI Bug Log - changes from xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b_BAT -> xe-pw-134258v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 3)
------------------------------

  Missing    (2): bat-lnl-1 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7873 -> IGT_7874
  * Linux: xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b -> xe-pw-134258v1

  IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b: bdab4dd15a635eedc4b4d95be9d4155be46e5e4b
  xe-pw-134258v1: 134258v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134258v1/index.html

--===============1548754004051570556==
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
<tr><td><b>Series:</b></td><td>Tracing cleanup and add mmio tracing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134258/">https://patchwork.freedesktop.org/series/134258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134258v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134258v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b_BAT -&gt; xe-pw-134258v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 3)</h2>
<p>Missing    (2): bat-lnl-1 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7873 -&gt; IGT_7874</li>
<li>Linux: xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b -&gt; xe-pw-134258v1</li>
</ul>
<p>IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b: bdab4dd15a635eedc4b4d95be9d4155be46e5e4b<br />
  xe-pw-134258v1: 134258v1</p>

</body>
</html>

--===============1548754004051570556==--
