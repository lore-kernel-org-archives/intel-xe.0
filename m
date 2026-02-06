Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196D2EE6B68
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 23:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86BE10E1BB;
	Fri,  6 Feb 2026 23:15:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828A10E1BB;
 Fri,  6 Feb 2026 23:15:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7382664592403411672=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/wa=3A_Steer_RMW_of_M?=
 =?utf-8?q?CR_registers_while_building_default_LRC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Feb 2026 23:15:16 -0000
Message-ID: <177041971619.235359.15714116294103961937@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206223058.387014-2-matthew.d.roper@intel.com>
In-Reply-To: <20260206223058.387014-2-matthew.d.roper@intel.com>
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

--===============7382664592403411672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/wa: Steer RMW of MCR registers while building default LRC
URL   : https://patchwork.freedesktop.org/series/161300/
State : failure

== Summary ==

CI Bug Log - changes from xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5_BAT -> xe-pw-161300v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161300v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161300v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161300v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-bmg-1:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
    - bat-atsm-2:         [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  


Build changes
-------------

  * Linux: xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5 -> xe-pw-161300v1

  IGT_8742: 8742
  xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5: ab5b6da7d4879640bce3197597e0bc707bd60ab5
  xe-pw-161300v1: 161300v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/index.html

--===============7382664592403411672==
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
<tr><td><b>Series:</b></td><td>drm/xe/wa: Steer RMW of MCR registers while building default LRC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161300/">https://patchwork.freedesktop.org/series/161300/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5_BAT -&gt; xe-pw-161300v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161300v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161300v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161300v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5 -&gt; xe-pw-161300v1</li>
</ul>
<p>IGT_8742: 8742<br />
  xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5: ab5b6da7d4879640bce3197597e0bc707bd60ab5<br />
  xe-pw-161300v1: 161300v1</p>

</body>
</html>

--===============7382664592403411672==--
