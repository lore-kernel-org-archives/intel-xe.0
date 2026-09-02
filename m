Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33C9C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 13:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E0B10F1EA;
	Wed,  2 Sep 2026 13:37:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBD010F1F2;
 Wed,  2 Sep 2026 13:37:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3972716755249879454=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/panic=3A_Split_into_cor?=
 =?utf-8?q?e_and_helpers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 13:37:12 -0000
Message-ID: <178835623218.112572.5260315010949375127@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902121930.597222-1-tzimmermann@suse.de>
In-Reply-To: <20260902121930.597222-1-tzimmermann@suse.de>
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

--===============3972716755249879454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/panic: Split into core and helpers (rev3)
URL   : https://patchwork.freedesktop.org/series/172394/
State : success

== Summary ==

CI Bug Log - changes from xe-5673-69771454478b3dc773dee91f76cef9220ea1ce93_BAT -> xe-pw-172394v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 6)
------------------------------

  Missing    (6): bat-lnl-1 bat-ptl-1 bat-atsm-2 bat-bmg-2 bat-nvls-1 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5673-69771454478b3dc773dee91f76cef9220ea1ce93 -> xe-pw-172394v3

  IGT_9079: 9079
  xe-5673-69771454478b3dc773dee91f76cef9220ea1ce93: 69771454478b3dc773dee91f76cef9220ea1ce93
  xe-pw-172394v3: 172394v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172394v3/index.html

--===============3972716755249879454==
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
<tr><td><b>Series:</b></td><td>drm/panic: Split into core and helpers (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172394/">https://patchwork.freedesktop.org/series/172394/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172394v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172394v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5673-69771454478b3dc773dee91f76cef9220ea1ce93_BAT -&gt; xe-pw-172394v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 6)</h2>
<p>Missing    (6): bat-lnl-1 bat-ptl-1 bat-atsm-2 bat-bmg-2 bat-nvls-1 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5673-69771454478b3dc773dee91f76cef9220ea1ce93 -&gt; xe-pw-172394v3</li>
</ul>
<p>IGT_9079: 9079<br />
  xe-5673-69771454478b3dc773dee91f76cef9220ea1ce93: 69771454478b3dc773dee91f76cef9220ea1ce93<br />
  xe-pw-172394v3: 172394v3</p>

</body>
</html>

--===============3972716755249879454==--
