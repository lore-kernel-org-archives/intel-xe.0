Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F4606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 14:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A1711232B;
	Thu, 29 Oct 2026 14:12:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2865B112310;
 Thu, 29 Oct 2026 14:12:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3549096070856856464=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/cper=3A_Software_=28?=
 =?utf-8?q?driver-detected=29_CPER_error_reporting_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 14:12:53 -0000
Message-ID: <179328317315.89088.13229909510784040986@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
In-Reply-To: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3549096070856856464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/cper: Software (driver-detected) CPER error reporting (rev2)
URL   : https://patchwork.freedesktop.org/series/176576/
State : failure

== Summary ==

CI Bug Log - changes from xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355_BAT -> xe-pw-176576v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176576v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176576v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176576v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-ptl-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-nvls-1:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-nvls-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-nvls-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
    - bat-wcl-1:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-wcl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-wcl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
    - bat-lnl-1:          [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
    - bat-adlp-7:         [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-lnl-2:          [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html
    - bat-nvls-2:         [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html
    - bat-ptl-1:          [PASS][15] -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-ptl-vm:         [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html
    - bat-wcl-2:          [PASS][19] -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-wcl-2/igt@xe_exec_fault_mode@invalid-va.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-wcl-2/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][21] -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-atsm-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-atsm-2/igt@xe_module_load@load.html
    - bat-bmg-vm:         [PASS][23] -> [DMESG-WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-bmg-vm/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-bmg-vm/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][25] -> [DMESG-WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-bmg-3/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][27] -> [DMESG-WARN][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-bmg-2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][29] -> [DMESG-WARN][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-bmg-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-bmg-1/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 -> xe-pw-176576v2

  IGT_9170: 9170
  xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355
  xe-pw-176576v2: 176576v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/index.html

--===============3549096070856856464==
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
<tr><td><b>Series:</b></td><td>drm/xe/cper: Software (driver-detected) CPER error reporting (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176576/">https://patchwork.freedesktop.org/series/176576/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355_BAT -&gt; xe-pw-176576v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176576v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-176576v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-176576v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-nvls-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-nvls-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-wcl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-wcl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-wcl-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-wcl-2/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-bmg-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-bmg-vm/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176576v2/bat-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 -&gt; xe-pw-176576v2</li>
</ul>
<p>IGT_9170: 9170<br />
  xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355<br />
  xe-pw-176576v2: 176576v2</p>

</body>
</html>

--===============3549096070856856464==--
