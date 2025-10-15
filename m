Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2392CCD194
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 16:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60810E864;
	Wed, 15 Oct 2025 16:08:49 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1B510E864;
 Wed, 15 Oct 2025 16:08:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2328795358477196749=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/panic=3A_fix_panic?=
 =?utf-8?q?_structure_allocation_memory_leak_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 16:08:47 -0000
Message-ID: <176054452782.17708.13115947776623022195@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015095135.2183415-1-jani.nikula@intel.com>
In-Reply-To: <20251015095135.2183415-1-jani.nikula@intel.com>
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

--===============2328795358477196749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/panic: fix panic structure allocation memory leak (rev2)
URL   : https://patchwork.freedesktop.org/series/155330/
State : failure

== Summary ==

CI Bug Log - changes from xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a_BAT -> xe-pw-155330v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155330v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155330v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  Additional (1): bat-pvc-2 
  Missing    (1): bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155330v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/bat-pvc-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a -> xe-pw-155330v2

  IGT_8585: 8585
  xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a: 6a9cafb6723c47062cc4d593804d5bb69155d81a
  xe-pw-155330v2: 155330v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/index.html

--===============2328795358477196749==
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
<tr><td><b>Series:</b></td><td>drm/i915/panic: fix panic structure allocation memory leak (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155330/">https://patchwork.freedesktop.org/series/155330/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a_BAT -&gt; xe-pw-155330v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155330v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155330v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>Additional (1): bat-pvc-2 <br />
  Missing    (1): bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155330v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/bat-pvc-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a -&gt; xe-pw-155330v2</li>
</ul>
<p>IGT_8585: 8585<br />
  xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a: 6a9cafb6723c47062cc4d593804d5bb69155d81a<br />
  xe-pw-155330v2: 155330v2</p>

</body>
</html>

--===============2328795358477196749==--
