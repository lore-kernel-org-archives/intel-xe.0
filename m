Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAD4C83F27
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 08:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53E710E0A5;
	Sat, 19 Jul 2025 08:46:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1AA10E021;
 Sat, 19 Jul 2025 08:46:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5088525880849465171=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Post-migration?=
 =?utf-8?q?_recovery_of_queues_and_jobs_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Jul 2025 08:46:50 -0000
Message-ID: <175291481030.174784.3592869766036357501@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250719073745.74251-1-tomasz.lis@intel.com>
In-Reply-To: <20250719073745.74251-1-tomasz.lis@intel.com>
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

--===============5088525880849465171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Post-migration recovery of queues and jobs (rev8)
URL   : https://patchwork.freedesktop.org/series/148982/
State : success

== Summary ==

CI Bug Log - changes from xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2_BAT -> xe-pw-148982v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-148982v8_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][1] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][2] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#688]) -> [SKIP][4] ([Intel XE#5563] / [Intel XE#688])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][5] ([Intel XE#288]) -> [SKIP][6] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * Linux: xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2 -> xe-pw-148982v8

  IGT_8468: 8468
  xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2: 17cc1a17481ab5481b6cd9f01eb073a254b7a3b2
  xe-pw-148982v8: 148982v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/index.html

--===============5088525880849465171==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Post-migration recovery of queues and jobs (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148982/">https://patchwork.freedesktop.org/series/148982/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2_BAT -&gt; xe-pw-148982v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148982v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2 -&gt; xe-pw-148982v8</li>
</ul>
<p>IGT_8468: 8468<br />
  xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2: 17cc1a17481ab5481b6cd9f01eb073a254b7a3b2<br />
  xe-pw-148982v8: 148982v8</p>

</body>
</html>

--===============5088525880849465171==--
