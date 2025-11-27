Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A530DD11183
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 08:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C6110E7B3;
	Thu, 27 Nov 2025 08:54:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1963D10E7B3;
 Thu, 27 Nov 2025 08:54:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6798853767049595882=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Move_VRAM_MM_debu?=
 =?utf-8?q?gfs_creation_to_tile_level_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 08:54:17 -0000
Message-ID: <176423365709.33971.13939370040667325150@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127073643.144379-1-piotr.piorkowski@intel.com>
In-Reply-To: <20251127073643.144379-1-piotr.piorkowski@intel.com>
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

--===============6798853767049595882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Move VRAM MM debugfs creation to tile level (rev2)
URL   : https://patchwork.freedesktop.org/series/157089/
State : success

== Summary ==

CI Bug Log - changes from xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_BAT -> xe-pw-157089v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157089v2_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_debugfs@root-dir}:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-2/igt@xe_debugfs@root-dir.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-bmg-2/igt@xe_debugfs@root-dir.html
    - bat-bmg-1:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-1/igt@xe_debugfs@root-dir.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-bmg-1/igt@xe_debugfs@root-dir.html
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-dg2-oem2/igt@xe_debugfs@root-dir.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-dg2-oem2/igt@xe_debugfs@root-dir.html
    - bat-atsm-2:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-atsm-2/igt@xe_debugfs@root-dir.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-atsm-2/igt@xe_debugfs@root-dir.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884 -> xe-pw-157089v2

  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91c2a68cba8b06fe884
  xe-pw-157089v2: 157089v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/index.html

--===============6798853767049595882==
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
<tr><td><b>Series:</b></td><td>drm/xe: Move VRAM MM debugfs creation to tile level (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157089/">https://patchwork.freedesktop.org/series/157089/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_BAT -&gt; xe-pw-157089v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157089v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_debugfs@root-dir}:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-2/igt@xe_debugfs@root-dir.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-bmg-2/igt@xe_debugfs@root-dir.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-1/igt@xe_debugfs@root-dir.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-bmg-1/igt@xe_debugfs@root-dir.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-dg2-oem2/igt@xe_debugfs@root-dir.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-dg2-oem2/igt@xe_debugfs@root-dir.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-atsm-2/igt@xe_debugfs@root-dir.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-atsm-2/igt@xe_debugfs@root-dir.html">FAIL</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884 -&gt; xe-pw-157089v2</li>
</ul>
<p>IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91c2a68cba8b06fe884<br />
  xe-pw-157089v2: 157089v2</p>

</body>
</html>

--===============6798853767049595882==--
