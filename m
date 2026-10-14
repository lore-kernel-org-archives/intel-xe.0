Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A439CC6B24
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 22:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BD210EB38;
	Wed, 14 Oct 2026 22:19:36 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DE310EB37;
 Wed, 14 Oct 2026 22:19:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8766259725917896991=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/psr=3A_Send_a_fram?=
 =?utf-8?q?e_change_notification_for_async_flips?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vladyslav Yamkovyi via B4 Relay" <devnull+hex.aleph0.ai@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Oct 2026 22:19:35 -0000
Message-ID: <179201637541.26174.8601522527234346081@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai>
In-Reply-To: <20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai>
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

--===============8766259725917896991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Send a frame change notification for async flips
URL   : https://patchwork.freedesktop.org/series/176135/
State : success

== Summary ==

CI Bug Log - changes from xe-5948-e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e_BAT -> xe-pw-176135v1_BAT
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

  * Linux: xe-5948-e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e -> xe-pw-176135v1

  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5948-e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e: e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e
  xe-pw-176135v1: 176135v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176135v1/index.html

--===============8766259725917896991==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Send a frame change notification for async flips</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176135/">https://patchwork.freedesktop.org/series/176135/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176135v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176135v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5948-e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e_BAT -&gt; xe-pw-176135v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5948-e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e -&gt; xe-pw-176135v1</li>
</ul>
<p>IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5948-e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e: e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e<br />
  xe-pw-176135v1: 176135v1</p>

</body>
</html>

--===============8766259725917896991==--
