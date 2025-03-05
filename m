Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE83C19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 13:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D5510E76F;
	Wed,  5 Mar 2025 13:36:08 +0000 (UTC)
Received: from db0ebb060c04 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DAF10E2A8;
 Wed,  5 Mar 2025 13:36:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6669914768493152553=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_The_xe_bo_shrinke?=
 =?utf-8?q?r_series_for_testing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 13:36:06 -0000
Message-ID: <174118176684.104792.14950894590349355930@db0ebb060c04>
X-Patchwork-Hint: ignore
References: <20250305101023.251956-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250305101023.251956-1-thomas.hellstrom@linux.intel.com>
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

--===============6669914768493152553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: The xe bo shrinker series for testing
URL   : https://patchwork.freedesktop.org/series/145816/
State : failure

== Summary ==

CI Bug Log - changes from xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033_BAT -> xe-pw-145816v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145816v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145816v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145816v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  * igt@xe_intel_bb@render@render-ymajor-256:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html

  
Known issues
------------

  Here are the changes found in xe-pw-145816v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render:
    - bat-adlp-vf:        [PASS][5] -> [ABORT][6] ([Intel XE#4491])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@xe_intel_bb@render.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033 -> xe-pw-145816v1

  IGT_8261: 8261
  xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033: 9391bc304a5cea9a9b63bff8e2d3b38f8d44d033
  xe-pw-145816v1: 145816v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/index.html

--===============6669914768493152553==
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
<tr><td><b>Series:</b></td><td>drm/xe: The xe bo shrinker series for testing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145816/">https://patchwork.freedesktop.org/series/145816/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033_BAT -&gt; xe-pw-145816v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145816v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-145816v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-145816v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_intel_bb@render@render-xmajor-256:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-ymajor-256:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145816v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@xe_intel_bb@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033 -&gt; xe-pw-145816v1</li>
</ul>
<p>IGT_8261: 8261<br />
  xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033: 9391bc304a5cea9a9b63bff8e2d3b38f8d44d033<br />
  xe-pw-145816v1: 145816v1</p>

</body>
</html>

--===============6669914768493152553==--
