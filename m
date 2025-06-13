Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C4C61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 04:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AE610E3C1;
	Fri, 13 Jun 2025 04:07:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDDD10E42B;
 Fri, 13 Jun 2025 04:07:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3550769306122797976=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Use_TLB_innvalida?=
 =?utf-8?q?tion_context_for_invalidations_issued_from_bind_queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 04:07:57 -0000
Message-ID: <174978767720.74658.13569392780951967760@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612214041.235258-1-matthew.brost@intel.com>
In-Reply-To: <20250612214041.235258-1-matthew.brost@intel.com>
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

--===============3550769306122797976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use TLB innvalidation context for invalidations issued from bind queues
URL   : https://patchwork.freedesktop.org/series/150188/
State : success

== Summary ==

CI Bug Log - changes from xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6_BAT -> xe-pw-150188v1_BAT
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

  * IGT: IGT_8409 -> IGT_8410
  * Linux: xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6 -> xe-pw-150188v1

  IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8410: 5826cdbf1cb8f5ec8a42bae33deb6b2b63e59e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6
  xe-pw-150188v1: 150188v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150188v1/index.html

--===============3550769306122797976==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use TLB innvalidation context for invalidations issued from bind queues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150188/">https://patchwork.freedesktop.org/series/150188/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150188v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150188v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6_BAT -&gt; xe-pw-150188v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8409 -&gt; IGT_8410</li>
<li>Linux: xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6 -&gt; xe-pw-150188v1</li>
</ul>
<p>IGT_8409: 47d092f112d138977837666b161c97032c3446cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8410: 5826cdbf1cb8f5ec8a42bae33deb6b2b63e59e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6<br />
  xe-pw-150188v1: 150188v1</p>

</body>
</html>

--===============3550769306122797976==--
