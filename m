Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA17BD0EE04
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 16:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6979110E444;
	Tue, 25 Nov 2025 16:02:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F361510E43F;
 Tue, 25 Nov 2025 16:02:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7779774354315078057=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_fixeup!_drm/xe/xe=5Fpagefau?=
 =?utf-8?q?lt=3A_Fix_potential_uninitialized_fence_usage_in_xe=5Fpagefault?=
 =?utf-8?q?=5Fhandle=5Fvma?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Nov 2025 16:02:01 -0000
Message-ID: <176408652199.26073.13514256468067835978@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251125102428.2325859-2-naresh.kumar.g@intel.com>
In-Reply-To: <20251125102428.2325859-2-naresh.kumar.g@intel.com>
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

--===============7779774354315078057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fixeup! drm/xe/xe_pagefault: Fix potential uninitialized fence usage in xe_pagefault_handle_vma
URL   : https://patchwork.freedesktop.org/series/158022/
State : success

== Summary ==

CI Bug Log - changes from xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8_BAT -> xe-pw-158022v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-158022v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158022v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158022v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8 -> xe-pw-158022v1

  IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8: c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8
  xe-pw-158022v1: 158022v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158022v1/index.html

--===============7779774354315078057==
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
<tr><td><b>Series:</b></td><td>fixeup! drm/xe/xe_pagefault: Fix potential uninitialized fence usage in xe_pagefault_handle_vma</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158022/">https://patchwork.freedesktop.org/series/158022/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158022v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158022v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8_BAT -&gt; xe-pw-158022v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158022v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158022v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158022v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8 -&gt; xe-pw-158022v1</li>
</ul>
<p>IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8: c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8<br />
  xe-pw-158022v1: 158022v1</p>

</body>
</html>

--===============7779774354315078057==--
