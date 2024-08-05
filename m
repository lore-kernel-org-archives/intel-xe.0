Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9813C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 07:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E1E10E129;
	Mon,  5 Aug 2024 07:04:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130C910E129;
 Mon,  5 Aug 2024 07:04:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6821288652539672656=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/observation=3A_Drop_empty?=
 =?utf-8?q?_sysctl_table_entry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 07:04:47 -0000
Message-ID: <172284148707.539817.12110817264174169013@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
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

--===============6821288652539672656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/observation: Drop empty sysctl table entry
URL   : https://patchwork.freedesktop.org/series/136874/
State : success

== Summary ==

CI Bug Log - changes from xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71_BAT -> xe-pw-136874v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7954 -> IGT_7955
  * Linux: xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 -> xe-pw-136874v1

  IGT_7954: a22f1dab2c2604f9678e4b27ba40bee7dcce9dfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7955: e12a8eebdc4bc7e073f2bfad88dc627006ac5771 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71: 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71
  xe-pw-136874v1: 136874v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/index.html

--===============6821288652539672656==
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
<tr><td><b>Series:</b></td><td>drm/xe/observation: Drop empty sysctl table entry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136874/">https://patchwork.freedesktop.org/series/136874/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71_BAT -&gt; xe-pw-136874v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7954 -&gt; IGT_7955</li>
<li>Linux: xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 -&gt; xe-pw-136874v1</li>
</ul>
<p>IGT_7954: a22f1dab2c2604f9678e4b27ba40bee7dcce9dfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7955: e12a8eebdc4bc7e073f2bfad88dc627006ac5771 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71: 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71<br />
  xe-pw-136874v1: 136874v1</p>

</body>
</html>

--===============6821288652539672656==--
