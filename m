Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C651C47077
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 01:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E1F10E9DF;
	Fri, 12 Jan 2024 01:11:02 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FC210E9DF;
 Fri, 12 Jan 2024 01:11:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5615621669905080073=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/migrate=3A_Cap_PTEs_writt?=
 =?utf-8?q?en_by_MI=5FSTORE=5FDATA=5FIMM_to_510?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 12 Jan 2024 01:11:00 -0000
Message-ID: <170502186082.331655.5925542117137965340@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111220238.1467572-2-matthew.d.roper@intel.com>
In-Reply-To: <20240111220238.1467572-2-matthew.d.roper@intel.com>
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

--===============5615621669905080073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510
URL   : https://patchwork.freedesktop.org/series/128694/
State : success

== Summary ==

CI Bug Log - changes from xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052_BAT -> xe-pw-128694v1_BAT
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

  * Linux: xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052 -> xe-pw-128694v1

  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052
  xe-pw-128694v1: 128694v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128694v1/index.html

--===============5615621669905080073==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128694/">https://patchwork.freedesktop.org/series/128694/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128694v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128694v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052_BAT -&gt; xe-pw-128694v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052 -&gt; xe-pw-128694v1</li>
</ul>
<p>IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052<br />
  xe-pw-128694v1: 128694v1</p>

</body>
</html>

--===============5615621669905080073==--
