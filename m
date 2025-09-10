Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B68CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 18:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572C110E9B2;
	Wed, 10 Sep 2025 18:20:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE3210E9B2;
 Wed, 10 Sep 2025 18:20:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2304487688259940379=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/1?=
 =?utf-8?q?=5D_drm/xe/xe3=3A_Extend_Wa=5F18041344222_to_graphics_IP_30=2E00?=
 =?utf-8?q?=2C_30=2E01_and_30=2E03?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Sep 2025 18:20:34 -0000
Message-ID: <175752843449.322799.15912548626003945076@1538d3639d33>
X-Patchwork-Hint: ignore
References: <a14d4cb5cf1bee071cb93ea2067a337401be9297.1757523671.git.harish.chegondi@intel.com>
In-Reply-To: <a14d4cb5cf1bee071cb93ea2067a337401be9297.1757523671.git.harish.chegondi@intel.com>
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

--===============2304487688259940379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP 30.00, 30.01 and 30.03
URL   : https://patchwork.freedesktop.org/series/154337/
State : success

== Summary ==

CI Bug Log - changes from xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6_BAT -> xe-pw-154337v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-154337v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][1] ([Intel XE#5783]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154337v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6 -> xe-pw-154337v1

  IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6: 85cfc47b2b83d80db129438ad20d86008bb36ff6
  xe-pw-154337v1: 154337v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154337v1/index.html

--===============2304487688259940379==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP 30.00, 30.01 and 30.03</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154337/">https://patchwork.freedesktop.org/series/154337/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154337v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154337v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6_BAT -&gt; xe-pw-154337v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154337v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154337v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6 -&gt; xe-pw-154337v1</li>
</ul>
<p>IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3718-85cfc47b2b83d80db129438ad20d86008bb36ff6: 85cfc47b2b83d80db129438ad20d86008bb36ff6<br />
  xe-pw-154337v1: 154337v1</p>

</body>
</html>

--===============2304487688259940379==--
