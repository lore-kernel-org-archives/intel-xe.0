Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FE3CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 16:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E0710FE2F;
	Tue,  2 Apr 2024 16:06:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3AD10FE2E;
 Tue,  2 Apr 2024 16:06:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2187355399976572159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm=3A_ensure_drm_headers_are_se?=
 =?utf-8?q?lf-contained_and_pass_kernel-doc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Apr 2024 16:06:41 -0000
Message-ID: <171207400169.1154935.3166965276181526586@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402140136.1722533-1-jani.nikula@intel.com>
In-Reply-To: <20240402140136.1722533-1-jani.nikula@intel.com>
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

--===============2187355399976572159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: ensure drm headers are self-contained and pass kernel-doc
URL   : https://patchwork.freedesktop.org/series/131943/
State : success

== Summary ==

CI Bug Log - changes from xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09_BAT -> xe-pw-131943v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-131943v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1458])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#1177]) +54 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][5] -> [SKIP][6] ([Intel XE#1457]) +131 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_module_load@load:
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] ([Intel XE#378])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][9] ([Intel XE#455]) -> [SKIP][10] ([Intel XE#1177])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#616]) -> [SKIP][12] ([Intel XE#1177])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][13] ([Intel XE#688]) -> [SKIP][14] ([Intel XE#1457]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][15] ([Intel XE#1008]) -> [SKIP][16] ([Intel XE#1457])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_mmap@vram.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         [SKIP][17] ([Intel XE#977]) -> [SKIP][18] ([Intel XE#1457])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         [SKIP][19] ([Intel XE#979]) -> [SKIP][20] ([Intel XE#1457]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
  [Intel XE#1457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457
  [Intel XE#1458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1458
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09 -> xe-pw-131943v1

  IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09: 5100fcc57dc5d45b246a0aeb068f4f8062d29b09
  xe-pw-131943v1: 131943v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/index.html

--===============2187355399976572159==
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
<tr><td><b>Series:</b></td><td>drm: ensure drm headers are self-contained and pass kernel-doc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131943/">https://patchwork.freedesktop.org/series/131943/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09_BAT -&gt; xe-pw-131943v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131943v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1458">Intel XE#1458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) +131 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131943v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09 -&gt; xe-pw-131943v1</li>
</ul>
<p>IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09: 5100fcc57dc5d45b246a0aeb068f4f8062d29b09<br />
  xe-pw-131943v1: 131943v1</p>

</body>
</html>

--===============2187355399976572159==--
