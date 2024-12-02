Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04688E69E94
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 20:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D2A10E084;
	Mon,  2 Dec 2024 20:57:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CFA10E084;
 Mon,  2 Dec 2024 20:57:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1339316269716285606=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fsync=3A_Add_deb?=
 =?utf-8?q?ug_printing_to_check=5Fufence?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Dec 2024 20:57:43 -0000
Message-ID: <173317306381.1756612.5949794512568465221@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202194631.106940-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241202194631.106940-1-jonathan.cavitt@intel.com>
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

--===============1339316269716285606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_sync: Add debug printing to check_ufence
URL   : https://patchwork.freedesktop.org/series/142002/
State : success

== Summary ==

CI Bug Log - changes from xe-2304-e3a2a984e96718e036e66185ab8c7ed2a2d7201f_BAT -> xe-pw-142002v1_BAT
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

  * Linux: xe-2304-e3a2a984e96718e036e66185ab8c7ed2a2d7201f -> xe-pw-142002v1

  IGT_8133: 16f2bfe294cc103df8ebb208aa2e64415262f534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2304-e3a2a984e96718e036e66185ab8c7ed2a2d7201f: e3a2a984e96718e036e66185ab8c7ed2a2d7201f
  xe-pw-142002v1: 142002v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142002v1/index.html

--===============1339316269716285606==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_sync: Add debug printing to check_ufence</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142002/">https://patchwork.freedesktop.org/series/142002/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142002v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142002v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2304-e3a2a984e96718e036e66185ab8c7ed2a2d7201f_BAT -&gt; xe-pw-142002v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2304-e3a2a984e96718e036e66185ab8c7ed2a2d7201f -&gt; xe-pw-142002v1</li>
</ul>
<p>IGT_8133: 16f2bfe294cc103df8ebb208aa2e64415262f534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2304-e3a2a984e96718e036e66185ab8c7ed2a2d7201f: e3a2a984e96718e036e66185ab8c7ed2a2d7201f<br />
  xe-pw-142002v1: 142002v1</p>

</body>
</html>

--===============1339316269716285606==--
