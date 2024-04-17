Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B6CC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 06:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92A01131DF;
	Wed, 17 Apr 2024 06:44:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283D71131DF;
 Wed, 17 Apr 2024 06:44:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4073241918930275061=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/lnl=3A_Apply_GuC_Wa=5F130?=
 =?utf-8?q?11645652_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 06:44:35 -0000
Message-ID: <171333627516.1464005.2889583468143921658@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417054802.1766359-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240417054802.1766359-1-vinay.belgaumkar@intel.com>
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

--===============4073241918930275061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/lnl: Apply GuC Wa_13011645652 (rev3)
URL   : https://patchwork.freedesktop.org/series/132334/
State : success

== Summary ==

CI Bug Log - changes from xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a_BAT -> xe-pw-132334v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a -> xe-pw-132334v3

  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a: 6eb009a883a7ae925b3b0f0363b64a026bb4333a
  xe-pw-132334v3: 132334v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v3/index.html

--===============4073241918930275061==
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
<tr><td><b>Series:</b></td><td>drm/xe/lnl: Apply GuC Wa_13011645652 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132334/">https://patchwork.freedesktop.org/series/132334/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132334v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a_BAT -&gt; xe-pw-132334v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a -&gt; xe-pw-132334v3</li>
</ul>
<p>IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1103-6eb009a883a7ae925b3b0f0363b64a026bb4333a: 6eb009a883a7ae925b3b0f0363b64a026bb4333a<br />
  xe-pw-132334v3: 132334v3</p>

</body>
</html>

--===============4073241918930275061==--
