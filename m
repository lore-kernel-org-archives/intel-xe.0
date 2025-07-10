Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69617C83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 09:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E7610E04A;
	Thu, 10 Jul 2025 09:33:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286B410E04A;
 Thu, 10 Jul 2025 09:33:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8536252055190043006=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/uapi=3A_Add_DRM=5FXE?=
 =?utf-8?q?=5FQUERY=5FCONFIG=5FFLAG=5FHAS=5FDISABLE=5FNULL=5FQUERY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 09:33:47 -0000
Message-ID: <175214002715.150203.5461574566324644774@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710075435.407068-1-nitin.r.gote@intel.com>
In-Reply-To: <20250710075435.407068-1-nitin.r.gote@intel.com>
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

--===============8536252055190043006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
URL   : https://patchwork.freedesktop.org/series/151431/
State : failure

== Summary ==

CI Bug Log - changes from xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0_BAT -> xe-pw-151431v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151431v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151431v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151431v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-atsm-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-atsm-2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-lnl-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-pvc-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-pvc-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-pvc-2/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-bmg-2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-bmg-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-bmg-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-adlp-7/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-lnl-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-lnl-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_8447 -> IGT_8449
  * Linux: xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0 -> xe-pw-151431v1

  IGT_8447: 8447
  IGT_8449: bfa2e7bb44a2e0fe43d2ae474db0dff766080b24 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0: 7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0
  xe-pw-151431v1: 151431v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/index.html

--===============8536252055190043006==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151431/">https://patchwork.freedesktop.org/series/151431/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0_BAT -&gt; xe-pw-151431v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151431v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151431v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151431v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-atsm-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-pvc-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-pvc-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151431v1/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8447 -&gt; IGT_8449</li>
<li>Linux: xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0 -&gt; xe-pw-151431v1</li>
</ul>
<p>IGT_8447: 8447<br />
  IGT_8449: bfa2e7bb44a2e0fe43d2ae474db0dff766080b24 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0: 7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0<br />
  xe-pw-151431v1: 151431v1</p>

</body>
</html>

--===============8536252055190043006==--
