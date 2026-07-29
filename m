Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8787EC53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 18:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDA710E075;
	Wed, 29 Jul 2026 18:07:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2971910E075;
 Wed, 29 Jul 2026 18:07:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0117871710750559620=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Increase_timeout_?=
 =?utf-8?q?for_hwmon_power_limit_mailbox_operations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jul 2026 18:07:53 -0000
Message-ID: <178534847316.2666.10015050961266843682@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
In-Reply-To: <20260729171546.3368457-1-karthik.poosa@intel.com>
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

--===============0117871710750559620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Increase timeout for hwmon power limit mailbox operations
URL   : https://patchwork.freedesktop.org/series/171303/
State : success

== Summary ==

CI Bug Log - changes from xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7_BAT -> xe-pw-171303v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-1 bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7 -> xe-pw-171303v1

  IGT_9032: 9032
  xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7: c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7
  xe-pw-171303v1: 171303v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/index.html

--===============0117871710750559620==
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
<tr><td><b>Series:</b></td><td>drm/xe: Increase timeout for hwmon power limit mailbox operations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171303/">https://patchwork.freedesktop.org/series/171303/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7_BAT -&gt; xe-pw-171303v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-1 bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7 -&gt; xe-pw-171303v1</li>
</ul>
<p>IGT_9032: 9032<br />
  xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7: c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7<br />
  xe-pw-171303v1: 171303v1</p>

</body>
</html>

--===============0117871710750559620==--
