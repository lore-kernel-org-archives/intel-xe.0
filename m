Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638E1C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 22:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D70210E09F;
	Mon,  2 Jun 2025 22:58:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3153510E09F;
 Mon,  2 Jun 2025 22:58:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0147689272370443572=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/bmg=3A_Fix_NULL-ptr_?=
 =?utf-8?q?deref_during_probe_on_SKUs_with_no_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 22:58:24 -0000
Message-ID: <174890510418.42140.11173922774737346389@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602221118.306395-1-vivek.kasireddy@intel.com>
In-Reply-To: <20250602221118.306395-1-vivek.kasireddy@intel.com>
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

--===============0147689272370443572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with no display
URL   : https://patchwork.freedesktop.org/series/149746/
State : success

== Summary ==

CI Bug Log - changes from xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062_BAT -> xe-pw-149746v1_BAT
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

  * Linux: xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062 -> xe-pw-149746v1

  IGT_8390: 8390
  xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062: 744ae62da6c761bb36669b38e24b5c5062c78062
  xe-pw-149746v1: 149746v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149746v1/index.html

--===============0147689272370443572==
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
<tr><td><b>Series:</b></td><td>drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with no display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149746/">https://patchwork.freedesktop.org/series/149746/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149746v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149746v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062_BAT -&gt; xe-pw-149746v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062 -&gt; xe-pw-149746v1</li>
</ul>
<p>IGT_8390: 8390<br />
  xe-3180-744ae62da6c761bb36669b38e24b5c5062c78062: 744ae62da6c761bb36669b38e24b5c5062c78062<br />
  xe-pw-149746v1: 149746v1</p>

</body>
</html>

--===============0147689272370443572==--
