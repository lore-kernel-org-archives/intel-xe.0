Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E257AC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 15:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C7010E868;
	Thu,  3 Jul 2025 15:01:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B3B10E868;
 Thu,  3 Jul 2025 15:01:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1651027348452804530=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_LMTT_invalidation_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Jul 2025 15:01:48 -0000
Message-ID: <175155490875.131399.5930060709519288551@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250702223041.1700-1-michal.wajdeczko@intel.com>
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

--===============1651027348452804530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: LMTT invalidation (rev3)
URL   : https://patchwork.freedesktop.org/series/151092/
State : failure

== Summary ==

CI Bug Log - changes from xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407_BAT -> xe-pw-151092v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151092v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151092v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151092v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407/bat-adlp-7/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151092v3/bat-adlp-7/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  


Build changes
-------------

  * IGT: IGT_8434 -> IGT_8436
  * Linux: xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407 -> xe-pw-151092v3

  IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8436: 3b7595f0e7f95de6d79e7ae6bb72e86b0a08a08c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407: d04a54cd3b99001adbc4cd3305b44f9f3e658407
  xe-pw-151092v3: 151092v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151092v3/index.html

--===============1651027348452804530==
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
<tr><td><b>Series:</b></td><td>LMTT invalidation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151092/">https://patchwork.freedesktop.org/series/151092/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151092v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151092v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407_BAT -&gt; xe-pw-151092v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151092v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151092v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151092v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407/bat-adlp-7/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151092v3/bat-adlp-7/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8434 -&gt; IGT_8436</li>
<li>Linux: xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407 -&gt; xe-pw-151092v3</li>
</ul>
<p>IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8436: 3b7595f0e7f95de6d79e7ae6bb72e86b0a08a08c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407: d04a54cd3b99001adbc4cd3305b44f9f3e658407<br />
  xe-pw-151092v3: 151092v3</p>

</body>
</html>

--===============1651027348452804530==--
