Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA705C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 16:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91EE10E3A8;
	Mon, 22 Jan 2024 16:45:26 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91D710ECA1;
 Mon, 22 Jan 2024 16:45:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6566554708988028047=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_GuC_CT_tweaks_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 22 Jan 2024 16:45:25 -0000
Message-ID: <170594192569.664419.6668228936137554148@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122161716.1503064-1-matthew.brost@intel.com>
In-Reply-To: <20240122161716.1503064-1-matthew.brost@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============6566554708988028047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: GuC CT tweaks (rev4)
URL   : https://patchwork.freedesktop.org/series/128062/
State : failure

== Summary ==

CI Bug Log - changes from xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f_BAT -> xe-pw-128062v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-128062v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128062v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-128062v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - bat-pvc-2:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/bat-pvc-2/igt@runner@aborted.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f/bat-dg2-oem2/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f/bat-atsm-2/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/bat-atsm-2/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f/bat-adlp-7/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/bat-adlp-7/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_7683 -> IGT_7684
  * Linux: xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f -> xe-pw-128062v4

  IGT_7683: 7683
  IGT_7684: 7684
  xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f: aa09aa0293f752644c8c5d040e4a7af4e463627f
  xe-pw-128062v4: 128062v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/index.html

--===============6566554708988028047==
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
<tr><td><b>Series:</b></td><td>GuC CT tweaks (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128062/">https://patchwork.freedesktop.org/series/128062/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f_BAT -&gt; xe-pw-128062v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-128062v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-128062v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-128062v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/bat-pvc-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/bat-atsm-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128062v4/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7683 -&gt; IGT_7684</li>
<li>Linux: xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f -&gt; xe-pw-128062v4</li>
</ul>
<p>IGT_7683: 7683<br />
  IGT_7684: 7684<br />
  xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f: aa09aa0293f752644c8c5d040e4a7af4e463627f<br />
  xe-pw-128062v4: 128062v4</p>

</body>
</html>

--===============6566554708988028047==--
