Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E350D16804
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 10:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F0D10E88F;
	Fri,  9 Jan 2026 10:34:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97A710E88E;
 Fri,  9 Jan 2026 10:34:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4807636714987532836=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Enable_THP_support_in_drm?=
 =?utf-8?q?=5Fpagemap_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Jan 2026 10:34:05 -0000
Message-ID: <176795484594.140285.18005318580909152024@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260109085605.443316-1-francois.dugast@intel.com>
In-Reply-To: <20260109085605.443316-1-francois.dugast@intel.com>
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

--===============4807636714987532836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable THP support in drm_pagemap (rev3)
URL   : https://patchwork.freedesktop.org/series/159119/
State : failure

== Summary ==

CI Bug Log - changes from xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335_BAT -> xe-pw-159119v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159119v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159119v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159119v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@engine:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335/bat-bmg-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v3/bat-bmg-2/igt@xe_waitfence@engine.html

  
Known issues
------------

  Here are the changes found in xe-pw-159119v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v3/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8692 -> IGT_8693
  * Linux: xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335 -> xe-pw-159119v3

  IGT_8692: 8692
  IGT_8693: 8693
  xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335: 9e5d93261e35cda4189383e8746fef35c7d0d335
  xe-pw-159119v3: 159119v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v3/index.html

--===============4807636714987532836==
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
<tr><td><b>Series:</b></td><td>Enable THP support in drm_pagemap (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159119/">https://patchwork.freedesktop.org/series/159119/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335_BAT -&gt; xe-pw-159119v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159119v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159119v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159119v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335/bat-bmg-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v3/bat-bmg-2/igt@xe_waitfence@engine.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159119v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v3/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8692 -&gt; IGT_8693</li>
<li>Linux: xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335 -&gt; xe-pw-159119v3</li>
</ul>
<p>IGT_8692: 8692<br />
  IGT_8693: 8693<br />
  xe-4354-9e5d93261e35cda4189383e8746fef35c7d0d335: 9e5d93261e35cda4189383e8746fef35c7d0d335<br />
  xe-pw-159119v3: 159119v3</p>

</body>
</html>

--===============4807636714987532836==--
