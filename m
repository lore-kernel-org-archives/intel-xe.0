Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69376CD6E75
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 18:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9EF112934;
	Thu,  4 Jun 2026 18:11:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B301112933;
 Thu,  4 Jun 2026 18:11:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5683234896910640909=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_CPU_binds_and_ULLS_on_migra?=
 =?utf-8?q?tion_queue_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jun 2026 18:11:21 -0000
Message-ID: <178059668149.44886.9080529487845195887@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604171502.84047-1-dev@lankhorst.se>
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
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

--===============5683234896910640909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CPU binds and ULLS on migration queue (rev5)
URL   : https://patchwork.freedesktop.org/series/149888/
State : success

== Summary ==

CI Bug Log - changes from xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3_BAT -> xe-pw-149888v5_BAT
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

  Here are the changes found in xe-pw-149888v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#7893])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3/bat-bmg-2/igt@xe_exec_fault_mode@twice-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/bat-bmg-2/igt@xe_exec_fault_mode@twice-rebind-imm.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4] ([Intel XE#7893])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - bat-bmg-3:          [PASS][5] -> [ABORT][6] ([Intel XE#7893])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893


Build changes
-------------

  * Linux: xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3 -> xe-pw-149888v5

  IGT_8948: 8948
  xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3: 406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3
  xe-pw-149888v5: 149888v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/index.html

--===============5683234896910640909==
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
<tr><td><b>Series:</b></td><td>CPU binds and ULLS on migration queue (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149888/">https://patchwork.freedesktop.org/series/149888/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3_BAT -&gt; xe-pw-149888v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149888v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3/bat-bmg-2/igt@xe_exec_fault_mode@twice-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/bat-bmg-2/igt@xe_exec_fault_mode@twice-rebind-imm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3 -&gt; xe-pw-149888v5</li>
</ul>
<p>IGT_8948: 8948<br />
  xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3: 406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3<br />
  xe-pw-149888v5: 149888v5</p>

</body>
</html>

--===============5683234896910640909==--
