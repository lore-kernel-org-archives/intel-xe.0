Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B288C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 10:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA3010E040;
	Mon,  9 Jun 2025 10:48:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66A10E040;
 Mon,  9 Jun 2025 10:48:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8562263131353676076=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Support_for_mmap-?=
 =?utf-8?q?ing_mmio_regions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 10:48:32 -0000
Message-ID: <174946611244.59183.14199140570238293621@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609092047.7668-1-ilia.levi@intel.com>
In-Reply-To: <20250609092047.7668-1-ilia.levi@intel.com>
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

--===============8562263131353676076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Support for mmap-ing mmio regions
URL   : https://patchwork.freedesktop.org/series/149977/
State : failure

== Summary ==

CI Bug Log - changes from xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f_BAT -> xe-pw-149977v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149977v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149977v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-adlp-vf bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149977v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
Known issues
------------

  Here are the changes found in xe-pw-149977v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-bmg-2:          NOTRUN -> [FAIL][5] ([Intel XE#5080])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/bat-bmg-2/igt@runner@aborted.html
    - bat-bmg-1:          NOTRUN -> [FAIL][6] ([Intel XE#5080])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/bat-bmg-1/igt@runner@aborted.html

  
  [Intel XE#5080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080


Build changes
-------------

  * Linux: xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f -> xe-pw-149977v1

  IGT_8401: 8401
  xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f: b8f759deb9abbafcb01468baecf33aee93ace35f
  xe-pw-149977v1: 149977v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/index.html

--===============8562263131353676076==
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
<tr><td><b>Series:</b></td><td>drm/xe: Support for mmap-ing mmio regions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149977/">https://patchwork.freedesktop.org/series/149977/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f_BAT -&gt; xe-pw-149977v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149977v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149977v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-adlp-vf bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149977v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-on:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149977v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/bat-bmg-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080">Intel XE#5080</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149977v1/bat-bmg-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080">Intel XE#5080</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f -&gt; xe-pw-149977v1</li>
</ul>
<p>IGT_8401: 8401<br />
  xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f: b8f759deb9abbafcb01468baecf33aee93ace35f<br />
  xe-pw-149977v1: 149977v1</p>

</body>
</html>

--===============8562263131353676076==--
