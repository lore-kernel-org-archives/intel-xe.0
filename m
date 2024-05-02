Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9D5C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 22:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F381126DE;
	Thu,  2 May 2024 22:24:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5C1126DE;
 Thu,  2 May 2024 22:24:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4961656136636424058=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Add_GuC_based_regi?=
 =?utf-8?q?ster_capture_for_error_capture_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 22:24:08 -0000
Message-ID: <171468864814.1848696.3161789196534012986@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502205738.863369-1-zhanjun.dong@intel.com>
In-Reply-To: <20240502205738.863369-1-zhanjun.dong@intel.com>
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

--===============4961656136636424058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add GuC based register capture for error capture (rev7)
URL   : https://patchwork.freedesktop.org/series/128077/
State : failure

== Summary ==

CI Bug Log - changes from xe-1225-9bc56b5d5f4e38bd455b3bc78932b73af09a9b72_BAT -> xe-pw-128077v7_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-128077v7_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128077v7_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-128077v7_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1225-9bc56b5d5f4e38bd455b3bc78932b73af09a9b72 -> xe-pw-128077v7

  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1225-9bc56b5d5f4e38bd455b3bc78932b73af09a9b72: 9bc56b5d5f4e38bd455b3bc78932b73af09a9b72
  xe-pw-128077v7: 128077v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v7/index.html

--===============4961656136636424058==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add GuC based register capture for error capture (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128077/">https://patchwork.freedesktop.org/series/128077/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1225-9bc56b5d5f4e38bd455b3bc78932b73af09a9b72_BAT -&gt; xe-pw-128077v7_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-128077v7_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-128077v7_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-128077v7_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1225-9bc56b5d5f4e38bd455b3bc78932b73af09a9b72 -&gt; xe-pw-128077v7</li>
</ul>
<p>IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1225-9bc56b5d5f4e38bd455b3bc78932b73af09a9b72: 9bc56b5d5f4e38bd455b3bc78932b73af09a9b72<br />
  xe-pw-128077v7: 128077v7</p>

</body>
</html>

--===============4961656136636424058==--
