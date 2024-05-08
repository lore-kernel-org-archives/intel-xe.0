Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D27C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 12:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E8C1122DB;
	Wed,  8 May 2024 12:46:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229851122DB;
 Wed,  8 May 2024 12:46:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9140346634982153842=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Cursor_Fault_Fix_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 12:46:33 -0000
Message-ID: <171517239313.2017562.3277774721714810121@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508073904.1661848-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240508073904.1661848-1-chaitanya.kumar.borah@intel.com>
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

--===============9140346634982153842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cursor Fault Fix (rev2)
URL   : https://patchwork.freedesktop.org/series/133310/
State : success

== Summary ==

CI Bug Log - changes from xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803_BAT -> xe-pw-133310v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7838 -> IGT_7840
  * Linux: xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803 -> xe-pw-133310v2

  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7840: 5d7b61b7ceefedfde2683ff72cd98179c99ab746 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803: a86eda4223247cae54c66577e8f0a6816e02e803
  xe-pw-133310v2: 133310v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/index.html

--===============9140346634982153842==
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
<tr><td><b>Series:</b></td><td>Cursor Fault Fix (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133310/">https://patchwork.freedesktop.org/series/133310/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133310v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803_BAT -&gt; xe-pw-133310v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7838 -&gt; IGT_7840</li>
<li>Linux: xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803 -&gt; xe-pw-133310v2</li>
</ul>
<p>IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7840: 5d7b61b7ceefedfde2683ff72cd98179c99ab746 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1254-a86eda4223247cae54c66577e8f0a6816e02e803: a86eda4223247cae54c66577e8f0a6816e02e803<br />
  xe-pw-133310v2: 133310v2</p>

</body>
</html>

--===============9140346634982153842==--
