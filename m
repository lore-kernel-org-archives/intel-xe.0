Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE2FC369C2
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 10:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA1F10E08B;
	Wed, 16 Apr 2025 10:42:03 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB3A10E08B;
 Wed, 16 Apr 2025 10:42:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8728574937354213909=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/psr=3A_Do_not_read?=
 =?utf-8?q?_PSR2=5FSU=5FSTATUS_on_AlderLake_and_onwards?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Apr 2025 10:42:01 -0000
Message-ID: <174480012189.9796.8972093416841924849@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250416093535.3231914-1-jouni.hogander@intel.com>
In-Reply-To: <20250416093535.3231914-1-jouni.hogander@intel.com>
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

--===============8728574937354213909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards
URL   : https://patchwork.freedesktop.org/series/147814/
State : success

== Summary ==

CI Bug Log - changes from xe-2958-b2d6822c6bcc4a76641008d73fdffad35a81ff0f_BAT -> xe-pw-147814v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8320 -> IGT_8321
  * Linux: xe-2958-b2d6822c6bcc4a76641008d73fdffad35a81ff0f -> xe-pw-147814v1

  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8321: 8321
  xe-2958-b2d6822c6bcc4a76641008d73fdffad35a81ff0f: b2d6822c6bcc4a76641008d73fdffad35a81ff0f
  xe-pw-147814v1: 147814v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147814v1/index.html

--===============8728574937354213909==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147814/">https://patchwork.freedesktop.org/series/147814/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147814v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147814v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2958-b2d6822c6bcc4a76641008d73fdffad35a81ff0f_BAT -&gt; xe-pw-147814v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8320 -&gt; IGT_8321</li>
<li>Linux: xe-2958-b2d6822c6bcc4a76641008d73fdffad35a81ff0f -&gt; xe-pw-147814v1</li>
</ul>
<p>IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8321: 8321<br />
  xe-2958-b2d6822c6bcc4a76641008d73fdffad35a81ff0f: b2d6822c6bcc4a76641008d73fdffad35a81ff0f<br />
  xe-pw-147814v1: 147814v1</p>

</body>
</html>

--===============8728574937354213909==--
