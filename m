Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39042C83F34
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 15:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257910E9E5;
	Fri, 18 Jul 2025 15:15:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDB210E9E3;
 Fri, 18 Jul 2025 15:15:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3627619135469577578=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Updates_for_drm/xe/configfs?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Jul 2025 15:15:53 -0000
Message-ID: <175285175312.173499.3240709361902357801@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250717184825.851-1-michal.wajdeczko@intel.com>
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

--===============3627619135469577578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Updates for drm/xe/configfs (rev3)
URL   : https://patchwork.freedesktop.org/series/151773/
State : success

== Summary ==

CI Bug Log - changes from xe-3440-338efc39ef3f17f6759817c857a95054334eae09_BAT -> xe-pw-151773v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8466 -> IGT_8467
  * Linux: xe-3440-338efc39ef3f17f6759817c857a95054334eae09 -> xe-pw-151773v3

  IGT_8466: 8d119c2b43d4d3660bef3bd68864be94a60bc0c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8467: 8467
  xe-3440-338efc39ef3f17f6759817c857a95054334eae09: 338efc39ef3f17f6759817c857a95054334eae09
  xe-pw-151773v3: 151773v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v3/index.html

--===============3627619135469577578==
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
<tr><td><b>Series:</b></td><td>Updates for drm/xe/configfs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151773/">https://patchwork.freedesktop.org/series/151773/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3440-338efc39ef3f17f6759817c857a95054334eae09_BAT -&gt; xe-pw-151773v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8466 -&gt; IGT_8467</li>
<li>Linux: xe-3440-338efc39ef3f17f6759817c857a95054334eae09 -&gt; xe-pw-151773v3</li>
</ul>
<p>IGT_8466: 8d119c2b43d4d3660bef3bd68864be94a60bc0c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8467: 8467<br />
  xe-3440-338efc39ef3f17f6759817c857a95054334eae09: 338efc39ef3f17f6759817c857a95054334eae09<br />
  xe-pw-151773v3: 151773v3</p>

</body>
</html>

--===============3627619135469577578==--
