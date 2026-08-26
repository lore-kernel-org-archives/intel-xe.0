Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA50C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096B710EC98;
	Wed, 26 Aug 2026 10:22:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0F110EC98;
 Wed, 26 Aug 2026 10:22:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1156478787648576234=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv1?=
 =?utf-8?q?=2C1/1=5D_drm/xe/guc=3A_Fix_wake=5Fup_race_in_handle=5Fsched=5Fdo?=
 =?utf-8?q?ne?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Legowski" <jakub.legowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 10:22:30 -0000
Message-ID: <178773975056.85743.9956424070141208732@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826093325.3233742-1-jakub.legowski@intel.com>
In-Reply-To: <20260826093325.3233742-1-jakub.legowski@intel.com>
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

--===============1156478787648576234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v1,1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
URL   : https://patchwork.freedesktop.org/series/172773/
State : success

== Summary ==

CI Bug Log - changes from xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d_BAT -> xe-pw-172773v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d -> xe-pw-172773v1

  IGT_9075: 9075
  xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d: 67a170d6284099e2f259ff0bf9b5bf5b575a3d2d
  xe-pw-172773v1: 172773v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/index.html

--===============1156478787648576234==
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
<tr><td><b>Series:</b></td><td>series starting with [v1,1/1] drm/xe/guc: Fix wake_up race in handle_sched_done</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172773/">https://patchwork.freedesktop.org/series/172773/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d_BAT -&gt; xe-pw-172773v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d -&gt; xe-pw-172773v1</li>
</ul>
<p>IGT_9075: 9075<br />
  xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d: 67a170d6284099e2f259ff0bf9b5bf5b575a3d2d<br />
  xe-pw-172773v1: 172773v1</p>

</body>
</html>

--===============1156478787648576234==--
