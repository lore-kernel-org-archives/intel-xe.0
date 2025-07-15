Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E562C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 11:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA42A10E1F4;
	Tue, 15 Jul 2025 11:05:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B515310E1F4;
 Tue, 15 Jul 2025 11:05:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3012550183736368973=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_debugfs_node_to_expose_?=
 =?utf-8?q?G-state_and_pcie_link_state_residency_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Jul 2025 11:05:45 -0000
Message-ID: <175257754573.162639.11941673883878362545@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250715095422.2901899-1-soham.purkait@intel.com>
In-Reply-To: <20250715095422.2901899-1-soham.purkait@intel.com>
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

--===============3012550183736368973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add debugfs node to expose G-state and pcie link state residency (rev10)
URL   : https://patchwork.freedesktop.org/series/149793/
State : failure

== Summary ==

CI Bug Log - changes from xe-3412-b012f04b5be909a307ff629b297387e0ed55195a_BAT -> xe-pw-149793v10_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149793v10_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149793v10_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149793v10_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/bat-bmg-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v10/bat-bmg-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/bat-bmg-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v10/bat-bmg-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  


Build changes
-------------

  * IGT: IGT_8457 -> IGT_8459
  * Linux: xe-3412-b012f04b5be909a307ff629b297387e0ed55195a -> xe-pw-149793v10

  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8459: 8459
  xe-3412-b012f04b5be909a307ff629b297387e0ed55195a: b012f04b5be909a307ff629b297387e0ed55195a
  xe-pw-149793v10: 149793v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v10/index.html

--===============3012550183736368973==
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
<tr><td><b>Series:</b></td><td>Add debugfs node to expose G-state and pcie link state residency (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149793/">https://patchwork.freedesktop.org/series/149793/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v10/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3412-b012f04b5be909a307ff629b297387e0ed55195a_BAT -&gt; xe-pw-149793v10_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149793v10_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149793v10_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149793v10_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/bat-bmg-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v10/bat-bmg-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/bat-bmg-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v10/bat-bmg-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8457 -&gt; IGT_8459</li>
<li>Linux: xe-3412-b012f04b5be909a307ff629b297387e0ed55195a -&gt; xe-pw-149793v10</li>
</ul>
<p>IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8459: 8459<br />
  xe-3412-b012f04b5be909a307ff629b297387e0ed55195a: b012f04b5be909a307ff629b297387e0ed55195a<br />
  xe-pw-149793v10: 149793v10</p>

</body>
</html>

--===============3012550183736368973==--
