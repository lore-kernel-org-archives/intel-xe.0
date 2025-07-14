Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD59C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 09:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE4810E445;
	Mon, 14 Jul 2025 09:55:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE08210E444;
 Mon, 14 Jul 2025 09:55:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0187423436950182684=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/uapi=3A_Add_DRM=5FXE?=
 =?utf-8?q?=5FQUERY=5FCONFIG=5FFLAG=5FHAS=5FDISABLE=5FNULL=5FQUERY_and_exec_?=
 =?utf-8?q?queue_control?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Jul 2025 09:55:06 -0000
Message-ID: <175248690676.158350.6714754544907137662@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714085436.1295787-1-nitin.r.gote@intel.com>
In-Reply-To: <20250714085436.1295787-1-nitin.r.gote@intel.com>
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

--===============0187423436950182684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY and exec queue control
URL   : https://patchwork.freedesktop.org/series/151560/
State : failure

== Summary ==

CI Bug Log - changes from xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822_BAT -> xe-pw-151560v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151560v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151560v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151560v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/bat-lnl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/bat-bmg-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/bat-bmg-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/bat-bmg-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/bat-lnl-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/bat-lnl-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_8454 -> IGT_8455
  * Linux: xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822 -> xe-pw-151560v1

  IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8455: 8455
  xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822: 4990310f0d4505f8a92f01012eaf433c35da7822
  xe-pw-151560v1: 151560v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/index.html

--===============0187423436950182684==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY and exec queue control</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151560/">https://patchwork.freedesktop.org/series/151560/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822_BAT -&gt; xe-pw-151560v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151560v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151560v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151560v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8454 -&gt; IGT_8455</li>
<li>Linux: xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822 -&gt; xe-pw-151560v1</li>
</ul>
<p>IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8455: 8455<br />
  xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822: 4990310f0d4505f8a92f01012eaf433c35da7822<br />
  xe-pw-151560v1: 151560v1</p>

</body>
</html>

--===============0187423436950182684==--
