Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE38CD37BE
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 01:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADE810E957;
	Tue, 12 May 2026 01:05:02 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8395310E957;
 Tue, 12 May 2026 01:05:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7740197077297672337=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_gpu/buddy=3A_Per-order_free?=
 =?utf-8?q?_and_used_block_scoreboards_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 01:05:00 -0000
Message-ID: <177854790053.58917.11671886231681330321@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511164217.150237-1-francois.dugast@intel.com>
In-Reply-To: <20260511164217.150237-1-francois.dugast@intel.com>
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

--===============7740197077297672337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: Per-order free and used block scoreboards (rev2)
URL   : https://patchwork.freedesktop.org/series/165914/
State : failure

== Summary ==

CI Bug Log - changes from xe-5042-311a7de0a4e360124ba1abb933df42b021ef8b9d_BAT -> xe-pw-165914v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165914v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165914v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165914v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@reltime:
    - bat-ptl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5042-311a7de0a4e360124ba1abb933df42b021ef8b9d/bat-ptl-1/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v2/bat-ptl-1/igt@xe_waitfence@reltime.html

  


Build changes
-------------

  * Linux: xe-5042-311a7de0a4e360124ba1abb933df42b021ef8b9d -> xe-pw-165914v2

  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5042-311a7de0a4e360124ba1abb933df42b021ef8b9d: 311a7de0a4e360124ba1abb933df42b021ef8b9d
  xe-pw-165914v2: 165914v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v2/index.html

--===============7740197077297672337==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: Per-order free and used block scoreboards (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165914/">https://patchwork.freedesktop.org/series/165914/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5042-311a7de0a4e360124ba1abb933df42b021ef8b9d_BAT -&gt; xe-pw-165914v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165914v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165914v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165914v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5042-311a7de0a4e360124ba1abb933df42b021ef8b9d/bat-ptl-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v2/bat-ptl-1/igt@xe_waitfence@reltime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5042-311a7de0a4e360124ba1abb933df42b021ef8b9d -&gt; xe-pw-165914v2</li>
</ul>
<p>IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5042-311a7de0a4e360124ba1abb933df42b021ef8b9d: 311a7de0a4e360124ba1abb933df42b021ef8b9d<br />
  xe-pw-165914v2: 165914v2</p>

</body>
</html>

--===============7740197077297672337==--
