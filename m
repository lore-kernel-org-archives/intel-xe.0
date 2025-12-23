Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9CFE6F088
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 12:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BE110E0E2;
	Tue, 23 Dec 2025 12:19:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C7B10E0E2;
 Tue, 23 Dec 2025 12:19:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6111519348064931314=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Use_trans_push_mechanism_to?=
 =?utf-8?q?_generate_frame_change_event_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Dec 2025 12:19:00 -0000
Message-ID: <176649234010.114188.413611730237359646@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251223105120.21505-1-jouni.hogander@intel.com>
In-Reply-To: <20251223105120.21505-1-jouni.hogander@intel.com>
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

--===============6111519348064931314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use trans push mechanism to generate frame change event (rev9)
URL   : https://patchwork.freedesktop.org/series/139831/
State : success

== Summary ==

CI Bug Log - changes from xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da_BAT -> xe-pw-139831v9_BAT
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

  * Linux: xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da -> xe-pw-139831v9

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da: cab246648fd89efbe8d20ed4c86e7fcebd7606da
  xe-pw-139831v9: 139831v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v9/index.html

--===============6111519348064931314==
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
<tr><td><b>Series:</b></td><td>Use trans push mechanism to generate frame change event (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139831/">https://patchwork.freedesktop.org/series/139831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da_BAT -&gt; xe-pw-139831v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da -&gt; xe-pw-139831v9</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da: cab246648fd89efbe8d20ed4c86e7fcebd7606da<br />
  xe-pw-139831v9: 139831v9</p>

</body>
</html>

--===============6111519348064931314==--
