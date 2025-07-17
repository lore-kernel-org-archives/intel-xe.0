Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF68C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A5010E883;
	Thu, 17 Jul 2025 19:00:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C34010E883;
 Thu, 17 Jul 2025 19:00:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5781868039153879083=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915=3A_Precompute_plan?=
 =?utf-8?q?e_SURF_address/etc=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Jul 2025 19:00:28 -0000
Message-ID: <175277882842.170497.9893093575481869573@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717171353.23090-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250717171353.23090-1-ville.syrjala@linux.intel.com>
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

--===============5781868039153879083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Precompute plane SURF address/etc. (rev3)
URL   : https://patchwork.freedesktop.org/series/147096/
State : failure

== Summary ==

CI Bug Log - changes from xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee_BAT -> xe-pw-147096v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147096v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147096v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147096v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] +13 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/bat-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/bat-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-imm:
    - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6] +5 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html

  
Known issues
------------

  Here are the changes found in xe-pw-147096v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][7] -> [DMESG-WARN][8] ([Intel XE#4543]) +25 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee -> xe-pw-147096v3

  IGT_8465: dce322d513ea2c1793520e98658ffd28e94874fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee: b1223560f49403d45494aad75bd3633ab63ab4ee
  xe-pw-147096v3: 147096v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/index.html

--===============5781868039153879083==
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
<tr><td><b>Series:</b></td><td>drm/i915: Precompute plane SURF address/etc. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147096/">https://patchwork.freedesktop.org/series/147096/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee_BAT -&gt; xe-pw-147096v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147096v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-147096v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-147096v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/bat-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/bat-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html">DMESG-WARN</a> +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-imm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147096v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_fd_dup:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +25 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee -&gt; xe-pw-147096v3</li>
</ul>
<p>IGT_8465: dce322d513ea2c1793520e98658ffd28e94874fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee: b1223560f49403d45494aad75bd3633ab63ab4ee<br />
  xe-pw-147096v3: 147096v3</p>

</body>
</html>

--===============5781868039153879083==--
