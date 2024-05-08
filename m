Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD15C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 04:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AE71130C8;
	Wed,  8 May 2024 04:29:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530F31130E3;
 Wed,  8 May 2024 04:29:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4538093381498623136=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Change_pcode_timeout_t?=
 =?utf-8?q?o_50msec_while_polling_again_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 04:29:57 -0000
Message-ID: <171514259733.2015199.12551653526119401658@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
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

--===============4538093381498623136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Change pcode timeout to 50msec while polling again (rev2)
URL   : https://patchwork.freedesktop.org/series/133295/
State : success

== Summary ==

CI Bug Log - changes from xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c_BAT -> xe-pw-133295v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c -> xe-pw-133295v2

  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c: 703bc96550be8cd9f4995bfa5126ca8a2e98c58c
  xe-pw-133295v2: 133295v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/index.html

--===============4538093381498623136==
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
<tr><td><b>Series:</b></td><td>drm/xe: Change pcode timeout to 50msec while polling again (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133295/">https://patchwork.freedesktop.org/series/133295/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c_BAT -&gt; xe-pw-133295v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c -&gt; xe-pw-133295v2</li>
</ul>
<p>IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c: 703bc96550be8cd9f4995bfa5126ca8a2e98c58c<br />
  xe-pw-133295v2: 133295v2</p>

</body>
</html>

--===============4538093381498623136==--
