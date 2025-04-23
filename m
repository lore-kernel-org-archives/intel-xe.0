Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD455C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 11:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7260610E0B0;
	Wed, 23 Apr 2025 11:32:14 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352CE10E0B0;
 Wed, 23 Apr 2025 11:32:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0081352073615229838=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_SVM_atomics_in_Xe_/_?=
 =?utf-8?q?GPU_SVM_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Apr 2025 11:32:13 -0000
Message-ID: <174540793322.207.12039452802583016959@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250422165723.584286-1-matthew.brost@intel.com>
In-Reply-To: <20250422165723.584286-1-matthew.brost@intel.com>
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

--===============0081352073615229838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable SVM atomics in Xe / GPU SVM (rev3)
URL   : https://patchwork.freedesktop.org/series/147846/
State : success

== Summary ==

CI Bug Log - changes from xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191_BAT -> xe-pw-147846v3_BAT
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

  * Linux: xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191 -> xe-pw-147846v3

  IGT_8330: 3ce68222e02fcfb1e12827e49e774bc58f69c9ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191: 97cf1c266145ae8b2bb3f78168d795930a3f5191
  xe-pw-147846v3: 147846v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v3/index.html

--===============0081352073615229838==
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
<tr><td><b>Series:</b></td><td>Enable SVM atomics in Xe / GPU SVM (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147846/">https://patchwork.freedesktop.org/series/147846/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191_BAT -&gt; xe-pw-147846v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191 -&gt; xe-pw-147846v3</li>
</ul>
<p>IGT_8330: 3ce68222e02fcfb1e12827e49e774bc58f69c9ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191: 97cf1c266145ae8b2bb3f78168d795930a3f5191<br />
  xe-pw-147846v3: 147846v3</p>

</body>
</html>

--===============0081352073615229838==--
