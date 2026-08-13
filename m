Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463F9C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 21:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A34810E058;
	Thu, 13 Aug 2026 21:32:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D536910E058;
 Thu, 13 Aug 2026 21:32:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4173901579858410581=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Fix_race_arou?=
 =?utf-8?q?nd_q-=3Eguc-=3Esuspend=5Fpending_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 21:32:01 -0000
Message-ID: <178665672186.49493.3881667018751002595@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813201847.201867-2-jagmeet.randhawa@intel.com>
In-Reply-To: <20260813201847.201867-2-jagmeet.randhawa@intel.com>
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

--===============4173901579858410581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Fix race around q->guc->suspend_pending access
URL   : https://patchwork.freedesktop.org/series/172176/
State : success

== Summary ==

CI Bug Log - changes from xe-5593-12a74df2314c42325731297e95b9aafd9329a20d_BAT -> xe-pw-172176v1_BAT
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

  * IGT: IGT_9054 -> IGT_9055
  * Linux: xe-5593-12a74df2314c42325731297e95b9aafd9329a20d -> xe-pw-172176v1

  IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9055: 8484e14a094150b500aeeb9bfb0db2ee0de862ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5593-12a74df2314c42325731297e95b9aafd9329a20d: 12a74df2314c42325731297e95b9aafd9329a20d
  xe-pw-172176v1: 172176v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172176v1/index.html

--===============4173901579858410581==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Fix race around q-&gt;guc-&gt;suspend_pending access</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172176/">https://patchwork.freedesktop.org/series/172176/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172176v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172176v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5593-12a74df2314c42325731297e95b9aafd9329a20d_BAT -&gt; xe-pw-172176v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9054 -&gt; IGT_9055</li>
<li>Linux: xe-5593-12a74df2314c42325731297e95b9aafd9329a20d -&gt; xe-pw-172176v1</li>
</ul>
<p>IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9055: 8484e14a094150b500aeeb9bfb0db2ee0de862ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5593-12a74df2314c42325731297e95b9aafd9329a20d: 12a74df2314c42325731297e95b9aafd9329a20d<br />
  xe-pw-172176v1: 172176v1</p>

</body>
</html>

--===============4173901579858410581==--
