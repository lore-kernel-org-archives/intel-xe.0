Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAF2CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 11:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F267510E4AD;
	Thu, 12 Oct 2023 11:21:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E61E10E4AD;
 Thu, 12 Oct 2023 11:21:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 16BCDA0093;
 Thu, 12 Oct 2023 11:21:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0564570054482327383=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Date: Thu, 12 Oct 2023 11:21:45 -0000
Message-ID: <169710970505.25006.5860049422177072891@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231012102622.810974-1-suraj.kandpal@intel.com>
In-Reply-To: <20231012102622.810974-1-suraj.kandpal@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Remove_St?=
 =?utf-8?q?ubs_in_HDCP_code_=28rev4=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0564570054482327383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove Stubs in HDCP code (rev4)
URL   : https://patchwork.freedesktop.org/series/124093/
State : success

== Summary ==

CI Bug Log - changes from xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e_BAT -> xe-pw-124093v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 1)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7532 -> IGT_7533
  * Linux: xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e -> xe-pw-124093v4

  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7533: 7533
  xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e: 6c0d1e36f310682297a5b07336b0883afc77f66e
  xe-pw-124093v4: 124093v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124093v4/index.html

--===============0564570054482327383==
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
<tr><td><b>Series:</b></td><td>Remove Stubs in HDCP code (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124093/">https://patchwork.freedesktop.org/series/124093/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124093v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124093v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e_BAT -&gt; xe-pw-124093v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 1)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7532 -&gt; IGT_7533</li>
<li>Linux: xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e -&gt; xe-pw-124093v4</li>
</ul>
<p>IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7533: 7533<br />
  xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e: 6c0d1e36f310682297a5b07336b0883afc77f66e<br />
  xe-pw-124093v4: 124093v4</p>

</body>
</html>

--===============0564570054482327383==--
