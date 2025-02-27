Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06FC19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 05:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A5A10EA4A;
	Thu, 27 Feb 2025 05:52:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B5F10EA49;
 Thu, 27 Feb 2025 05:52:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6699034520622361297=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Test_out_GuC_v70=2E40=2E2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 05:52:01 -0000
Message-ID: <174063552108.2592981.13436376273345971478@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226224248.450750-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250226224248.450750-1-John.C.Harrison@Intel.com>
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

--===============6699034520622361297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test out GuC v70.40.2
URL   : https://patchwork.freedesktop.org/series/145528/
State : success

== Summary ==

CI Bug Log - changes from xe-2717-59b653d829a07f1ccb21fee898efc32bcb3589ff_BAT -> xe-pw-145528v1_BAT
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

  * IGT: IGT_8248 -> IGT_8249
  * Linux: xe-2717-59b653d829a07f1ccb21fee898efc32bcb3589ff -> xe-pw-145528v1

  IGT_8248: 8248
  IGT_8249: 8cb34f260a285ff7eaa3d79cf71f0a4960e4c890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2717-59b653d829a07f1ccb21fee898efc32bcb3589ff: 59b653d829a07f1ccb21fee898efc32bcb3589ff
  xe-pw-145528v1: 145528v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145528v1/index.html

--===============6699034520622361297==
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
<tr><td><b>Series:</b></td><td>Test out GuC v70.40.2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145528/">https://patchwork.freedesktop.org/series/145528/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145528v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145528v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2717-59b653d829a07f1ccb21fee898efc32bcb3589ff_BAT -&gt; xe-pw-145528v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8248 -&gt; IGT_8249</li>
<li>Linux: xe-2717-59b653d829a07f1ccb21fee898efc32bcb3589ff -&gt; xe-pw-145528v1</li>
</ul>
<p>IGT_8248: 8248<br />
  IGT_8249: 8cb34f260a285ff7eaa3d79cf71f0a4960e4c890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2717-59b653d829a07f1ccb21fee898efc32bcb3589ff: 59b653d829a07f1ccb21fee898efc32bcb3589ff<br />
  xe-pw-145528v1: 145528v1</p>

</body>
</html>

--===============6699034520622361297==--
