Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2457C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 15:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9058310EC27;
	Thu, 21 Mar 2024 15:24:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DD810EC20;
 Thu, 21 Mar 2024 15:24:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6257074279235806815=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5Bv3=2C1/2?=
 =?utf-8?q?=5D_drm/xe/query=3A_Define_and_use_a_constant_for_the_number_of_m?=
 =?utf-8?q?asks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 15:24:25 -0000
Message-ID: <171103466547.941104.4375343116670677092@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321142154.7-1-francois.dugast@intel.com>
In-Reply-To: <20240321142154.7-1-francois.dugast@intel.com>
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

--===============6257074279235806815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] drm/xe/query: Define and use a constant for the number of masks
URL   : https://patchwork.freedesktop.org/series/131426/
State : failure

== Summary ==

CI Bug Log - changes from xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2_BAT -> xe-pw-131426v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131426v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131426v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131426v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_query@query-topology:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2/bat-dg2-oem2/igt@xe_query@query-topology.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/bat-dg2-oem2/igt@xe_query@query-topology.html
    - bat-adlp-7:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2/bat-adlp-7/igt@xe_query@query-topology.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/bat-adlp-7/igt@xe_query@query-topology.html
    - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2/bat-atsm-2/igt@xe_query@query-topology.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/bat-atsm-2/igt@xe_query@query-topology.html

  
Known issues
------------

  Here are the changes found in xe-pw-131426v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [TIMEOUT][7] ([Intel XE#1167]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167


Build changes
-------------

  * Linux: xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2 -> xe-pw-131426v1

  IGT_7773: 7773
  xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2: 9ae91289c9ed219b53a3fbd25be9f414651ce4f2
  xe-pw-131426v1: 131426v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/index.html

--===============6257074279235806815==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] drm/xe/query: Define and use a constant for the number of masks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131426/">https://patchwork.freedesktop.org/series/131426/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2_BAT -&gt; xe-pw-131426v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131426v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131426v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131426v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_query@query-topology:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2/bat-dg2-oem2/igt@xe_query@query-topology.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/bat-dg2-oem2/igt@xe_query@query-topology.html">INCOMPLETE</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2/bat-adlp-7/igt@xe_query@query-topology.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/bat-adlp-7/igt@xe_query@query-topology.html">INCOMPLETE</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2/bat-atsm-2/igt@xe_query@query-topology.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/bat-atsm-2/igt@xe_query@query-topology.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131426v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131426v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2 -&gt; xe-pw-131426v1</li>
</ul>
<p>IGT_7773: 7773<br />
  xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2: 9ae91289c9ed219b53a3fbd25be9f414651ce4f2<br />
  xe-pw-131426v1: 131426v1</p>

</body>
</html>

--===============6257074279235806815==--
