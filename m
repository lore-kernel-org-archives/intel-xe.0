Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0CBC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 13:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136C510E8A1;
	Wed, 12 Feb 2025 13:34:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3012410E276;
 Wed, 12 Feb 2025 13:34:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0083405168106222370=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Fix_fbdev?=
 =?utf-8?q?_GGTT_mapping_handling=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 13:34:42 -0000
Message-ID: <173936728218.1309158.8463208409004181034@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212113509.14972-1-dev@lankhorst.se>
In-Reply-To: <20250212113509.14972-1-dev@lankhorst.se>
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

--===============0083405168106222370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Fix fbdev GGTT mapping handling. (rev3)
URL   : https://patchwork.freedesktop.org/series/144602/
State : success

== Summary ==

CI Bug Log - changes from xe-2646-8c008f1eeec8418aa5be00ece4b8ce7317d1be4c_BAT -> xe-pw-144602v3_BAT
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

  * Linux: xe-2646-8c008f1eeec8418aa5be00ece4b8ce7317d1be4c -> xe-pw-144602v3

  IGT_8228: 8228
  xe-2646-8c008f1eeec8418aa5be00ece4b8ce7317d1be4c: 8c008f1eeec8418aa5be00ece4b8ce7317d1be4c
  xe-pw-144602v3: 144602v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v3/index.html

--===============0083405168106222370==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Fix fbdev GGTT mapping handling. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144602/">https://patchwork.freedesktop.org/series/144602/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2646-8c008f1eeec8418aa5be00ece4b8ce7317d1be4c_BAT -&gt; xe-pw-144602v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2646-8c008f1eeec8418aa5be00ece4b8ce7317d1be4c -&gt; xe-pw-144602v3</li>
</ul>
<p>IGT_8228: 8228<br />
  xe-2646-8c008f1eeec8418aa5be00ece4b8ce7317d1be4c: 8c008f1eeec8418aa5be00ece4b8ce7317d1be4c<br />
  xe-pw-144602v3: 144602v3</p>

</body>
</html>

--===============0083405168106222370==--
