Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941AFC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 08:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5241A10E717;
	Mon, 10 Aug 2026 08:06:53 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5510E708;
 Mon, 10 Aug 2026 08:06:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6114006833922828906=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/pagemap=3A_Prevent_doub?=
 =?utf-8?q?le_migration_of_device_pages_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Aug 2026 08:06:52 -0000
Message-ID: <178634921200.33188.155367470904298087@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810070240.2721317-1-arvind.yadav@intel.com>
In-Reply-To: <20260810070240.2721317-1-arvind.yadav@intel.com>
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

--===============6114006833922828906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/pagemap: Prevent double migration of device pages (rev6)
URL   : https://patchwork.freedesktop.org/series/171495/
State : success

== Summary ==

CI Bug Log - changes from xe-5568-9c14709d79cf144f0990551a124af7615bdd97be_BAT -> xe-pw-171495v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5568-9c14709d79cf144f0990551a124af7615bdd97be -> xe-pw-171495v6

  IGT_9047: 9047
  xe-5568-9c14709d79cf144f0990551a124af7615bdd97be: 9c14709d79cf144f0990551a124af7615bdd97be
  xe-pw-171495v6: 171495v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171495v6/index.html

--===============6114006833922828906==
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
<tr><td><b>Series:</b></td><td>drm/pagemap: Prevent double migration of device pages (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171495/">https://patchwork.freedesktop.org/series/171495/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171495v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171495v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5568-9c14709d79cf144f0990551a124af7615bdd97be_BAT -&gt; xe-pw-171495v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5568-9c14709d79cf144f0990551a124af7615bdd97be -&gt; xe-pw-171495v6</li>
</ul>
<p>IGT_9047: 9047<br />
  xe-5568-9c14709d79cf144f0990551a124af7615bdd97be: 9c14709d79cf144f0990551a124af7615bdd97be<br />
  xe-pw-171495v6: 171495v6</p>

</body>
</html>

--===============6114006833922828906==--
