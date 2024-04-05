Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AFBCD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 07:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B5D1139C3;
	Fri,  5 Apr 2024 07:05:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675BC1139C1;
 Fri,  5 Apr 2024 07:05:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2982907735491997725=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_fix_multicast_support_?=
 =?utf-8?q?for_Xe=5FLP_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 07:05:16 -0000
Message-ID: <171230071642.1226868.16345588293575073456@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405-mcr_adlp-v2-1-2fd1e4325ef2@intel.com>
In-Reply-To: <20240405-mcr_adlp-v2-1-2fd1e4325ef2@intel.com>
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

--===============2982907735491997725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fix multicast support for Xe_LP platforms
URL   : https://patchwork.freedesktop.org/series/132060/
State : success

== Summary ==

CI Bug Log - changes from xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e_BAT -> xe-pw-132060v1_BAT
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

  * IGT: IGT_7799 -> IGT_7800
  * Linux: xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e -> xe-pw-132060v1

  IGT_7799: 7799
  IGT_7800: 7800
  xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e: 9619b05620f06aaf89a5c603c2ba55c1419ee78e
  xe-pw-132060v1: 132060v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132060v1/index.html

--===============2982907735491997725==
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
<tr><td><b>Series:</b></td><td>drm/xe: fix multicast support for Xe_LP platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132060/">https://patchwork.freedesktop.org/series/132060/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132060v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132060v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e_BAT -&gt; xe-pw-132060v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7799 -&gt; IGT_7800</li>
<li>Linux: xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e -&gt; xe-pw-132060v1</li>
</ul>
<p>IGT_7799: 7799<br />
  IGT_7800: 7800<br />
  xe-1043-9619b05620f06aaf89a5c603c2ba55c1419ee78e: 9619b05620f06aaf89a5c603c2ba55c1419ee78e<br />
  xe-pw-132060v1: 132060v1</p>

</body>
</html>

--===============2982907735491997725==--
