Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BDDC19F32
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 01:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42F410E896;
	Thu,  6 Mar 2025 01:49:08 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAF310E896;
 Thu,  6 Mar 2025 01:49:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1181045958040858997=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_GuC_opt-in_features_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 01:49:07 -0000
Message-ID: <174122574737.64967.14881963799641433964@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
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

--===============1181045958040858997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable GuC opt-in features (rev2)
URL   : https://patchwork.freedesktop.org/series/145532/
State : success

== Summary ==

CI Bug Log - changes from xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c_BAT -> xe-pw-145532v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-145532v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8261 -> IGT_8262
  * Linux: xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c -> xe-pw-145532v2

  IGT_8261: 8261
  IGT_8262: 8262
  xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c
  xe-pw-145532v2: 145532v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v2/index.html

--===============1181045958040858997==
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
<tr><td><b>Series:</b></td><td>Enable GuC opt-in features (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145532/">https://patchwork.freedesktop.org/series/145532/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c_BAT -&gt; xe-pw-145532v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145532v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-x:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8261 -&gt; IGT_8262</li>
<li>Linux: xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c -&gt; xe-pw-145532v2</li>
</ul>
<p>IGT_8261: 8261<br />
  IGT_8262: 8262<br />
  xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c<br />
  xe-pw-145532v2: 145532v2</p>

</body>
</html>

--===============1181045958040858997==--
