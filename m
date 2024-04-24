Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1357C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 11:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEB210F7F4;
	Wed, 24 Apr 2024 11:50:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C1210F47A;
 Wed, 24 Apr 2024 11:49:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3198358382065053520=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_PF=3A_Expose_GT-level_SR-IOV_det?=
 =?utf-8?q?ails_over_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 11:49:59 -0000
Message-ID: <171395939929.1630367.9073807472341415764@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423131244.2045-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240423131244.2045-1-michal.wajdeczko@intel.com>
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

--===============3198358382065053520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Expose GT-level SR-IOV details over debugfs
URL   : https://patchwork.freedesktop.org/series/132777/
State : success

== Summary ==

CI Bug Log - changes from xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf_BAT -> xe-pw-132777v1_BAT
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

  Here are the changes found in xe-pw-132777v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][2] ([Intel XE#288]) +22 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#1008])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#977])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#979]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-adlp-7:         [INCOMPLETE][6] ([Intel XE#925]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/925
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7818 -> IGT_7819
  * Linux: xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf -> xe-pw-132777v1

  IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf
  xe-pw-132777v1: 132777v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/index.html

--===============3198358382065053520==
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
<tr><td><b>Series:</b></td><td>PF: Expose GT-level SR-IOV details over debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132777/">https://patchwork.freedesktop.org/series/132777/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf_BAT -&gt; xe-pw-132777v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132777v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/925">Intel XE#925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7818 -&gt; IGT_7819</li>
<li>Linux: xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf -&gt; xe-pw-132777v1</li>
</ul>
<p>IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf<br />
  xe-pw-132777v1: 132777v1</p>

</body>
</html>

--===============3198358382065053520==--
