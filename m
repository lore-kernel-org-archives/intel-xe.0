Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DC2CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 23:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23BD10E227;
	Fri, 24 Oct 2025 23:15:12 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134BC10E227;
 Fri, 24 Oct 2025 23:15:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6744575608948808346=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fix_serialization_on_burst_?=
 =?utf-8?q?of_unbinds_-_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 23:15:11 -0000
Message-ID: <176134771106.54039.16098349395809571764@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024222047.1481039-1-matthew.brost@intel.com>
In-Reply-To: <20251024222047.1481039-1-matthew.brost@intel.com>
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

--===============6744575608948808346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix serialization on burst of unbinds - v2
URL   : https://patchwork.freedesktop.org/series/156517/
State : failure

== Summary ==

CI Bug Log - changes from xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07_BAT -> xe-pw-156517v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156517v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156517v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156517v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@abstime:
    - bat-bmg-1:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-bmg-1/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-bmg-1/igt@xe_waitfence@abstime.html
    - bat-atsm-2:         [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-atsm-2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-atsm-2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-dg2-oem2/igt@xe_waitfence@engine.html
    - bat-bmg-2:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-bmg-2/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-bmg-2/igt@xe_waitfence@engine.html
    - bat-bmg-1:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-bmg-1/igt@xe_waitfence@engine.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-bmg-1/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-atsm-2:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-atsm-2/igt@xe_waitfence@reltime.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-atsm-2/igt@xe_waitfence@reltime.html

  


Build changes
-------------

  * Linux: xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07 -> xe-pw-156517v1

  IGT_8596: 8596
  xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07: d65117641c3f3fb403fc83e553bcb899bc1c9a07
  xe-pw-156517v1: 156517v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/index.html

--===============6744575608948808346==
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
<tr><td><b>Series:</b></td><td>Fix serialization on burst of unbinds - v2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156517/">https://patchwork.freedesktop.org/series/156517/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07_BAT -&gt; xe-pw-156517v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156517v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156517v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156517v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-bmg-1/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-bmg-1/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-atsm-2/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-bmg-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-bmg-2/igt@xe_waitfence@engine.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-bmg-1/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-bmg-1/igt@xe_waitfence@engine.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07/bat-atsm-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156517v1/bat-atsm-2/igt@xe_waitfence@reltime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07 -&gt; xe-pw-156517v1</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3985-d65117641c3f3fb403fc83e553bcb899bc1c9a07: d65117641c3f3fb403fc83e553bcb899bc1c9a07<br />
  xe-pw-156517v1: 156517v1</p>

</body>
</html>

--===============6744575608948808346==--
