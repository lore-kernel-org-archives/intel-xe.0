Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E11C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 11:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D7210EAC9;
	Fri,  7 Feb 2025 11:15:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC310EAC9;
 Fri,  7 Feb 2025 11:15:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1407156227233500273=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_fault_injection_f?=
 =?utf-8?q?or_guc_CTB_=26_mmio_send/recv=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 11:15:03 -0000
Message-ID: <173892690364.2604639.15901885201744401529@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207093916.20509-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250207093916.20509-1-satyanarayana.k.v.p@intel.com>
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

--===============1407156227233500273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce fault injection for guc CTB & mmio send/recv.
URL   : https://patchwork.freedesktop.org/series/144484/
State : success

== Summary ==

CI Bug Log - changes from xe-2613-f2401c718ce075408a723b147cac70aad2a8246f_BAT -> xe-pw-144484v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-144484v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [SKIP][2] ([Intel XE#1192]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@shared-pde2-page:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][6] ([Intel XE#1192])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2613-f2401c718ce075408a723b147cac70aad2a8246f -> xe-pw-144484v1

  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2613-f2401c718ce075408a723b147cac70aad2a8246f: f2401c718ce075408a723b147cac70aad2a8246f
  xe-pw-144484v1: 144484v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/index.html

--===============1407156227233500273==
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
<tr><td><b>Series:</b></td><td>Introduce fault injection for guc CTB &amp; mmio send/recv.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144484/">https://patchwork.freedesktop.org/series/144484/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2613-f2401c718ce075408a723b147cac70aad2a8246f_BAT -&gt; xe-pw-144484v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144484v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde2-page:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144484v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2613-f2401c718ce075408a723b147cac70aad2a8246f -&gt; xe-pw-144484v1</li>
</ul>
<p>IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2613-f2401c718ce075408a723b147cac70aad2a8246f: f2401c718ce075408a723b147cac70aad2a8246f<br />
  xe-pw-144484v1: 144484v1</p>

</body>
</html>

--===============1407156227233500273==--
