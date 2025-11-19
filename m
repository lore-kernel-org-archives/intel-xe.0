Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9B0CF31AE
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 12:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F254410E23B;
	Wed, 19 Nov 2025 12:03:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAE210E23B;
 Wed, 19 Nov 2025 12:03:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4008620713753969222=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_add_VM=5FBIND_DEC?=
 =?utf-8?q?OMPRESS_support_and_on=E2=80=91demand_decompression_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 12:03:42 -0000
Message-ID: <176355382295.8710.11069389260635879847@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251119101904.2456979-5-nitin.r.gote@intel.com>
In-Reply-To: <20251119101904.2456979-5-nitin.r.gote@intel.com>
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

--===============4008620713753969222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Series Details ==

Series: drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev6)
URL   : https://patchwork.freedesktop.org/series/154714/
State : success

== Summary ==

CI Bug Log - changes from xe-4126-80939f90d3e68b92b868017ea450e6695f756666_BAT -> xe-pw-154714v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-154714v6_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-pvc-2:          [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-pvc-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v6/bat-pvc-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4126-80939f90d3e68b92b868017ea450e6695f756666 -> xe-pw-154714v6

  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4126-80939f90d3e68b92b868017ea450e6695f756666: 80939f90d3e68b92b868017ea450e6695f756666
  xe-pw-154714v6: 154714v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v6/index.html

--===============4008620713753969222==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


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
<tr><td><b>Series:</b></td><td>drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154714/">https://patchwork.freedesktop.org/series/154714/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4126-80939f90d3e68b92b868017ea450e6695f756666_BAT -&gt; xe-pw-154714v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154714v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-pvc-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v6/bat-pvc-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4126-80939f90d3e68b92b868017ea450e6695f756666 -&gt; xe-pw-154714v6</li>
</ul>
<p>IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4126-80939f90d3e68b92b868017ea450e6695f756666: 80939f90d3e68b92b868017ea450e6695f756666<br />
  xe-pw-154714v6: 154714v6</p>

</body>
</html>

--===============4008620713753969222==--
