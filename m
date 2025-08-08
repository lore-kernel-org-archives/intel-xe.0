Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A160AC87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 12:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4977D10E1AF;
	Fri,  8 Aug 2025 12:20:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC78710E1AF;
 Fri,  8 Aug 2025 12:20:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6305951238120474358=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_rework_PDE_PAT_in?=
 =?utf-8?q?dex_selection_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Aug 2025 12:20:55 -0000
Message-ID: <175465565569.222611.16855929768258010218@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808103455.462424-2-matthew.auld@intel.com>
In-Reply-To: <20250808103455.462424-2-matthew.auld@intel.com>
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

--===============6305951238120474358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: rework PDE PAT index selection (rev2)
URL   : https://patchwork.freedesktop.org/series/152432/
State : success

== Summary ==

CI Bug Log - changes from xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba_BAT -> xe-pw-152432v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-152432v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-bmg-1:          [SKIP][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/bat-bmg-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/bat-bmg-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@xe_exec_compute_mode@twice-rebind:
    - bat-bmg-1:          [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/bat-bmg-1/igt@xe_exec_compute_mode@twice-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/bat-bmg-1/igt@xe_exec_compute_mode@twice-rebind.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][5] ([Intel XE#5783]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba -> xe-pw-152432v2

  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba: 0a8f74a5dde6c5327dac9522cf1441003f2ebcba
  xe-pw-152432v2: 152432v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/index.html

--===============6305951238120474358==
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
<tr><td><b>Series:</b></td><td>drm/xe: rework PDE PAT index selection (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152432/">https://patchwork.freedesktop.org/series/152432/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba_BAT -&gt; xe-pw-152432v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152432v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/bat-bmg-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/bat-bmg-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/bat-bmg-1/igt@xe_exec_compute_mode@twice-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/bat-bmg-1/igt@xe_exec_compute_mode@twice-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152432v2/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba -&gt; xe-pw-152432v2</li>
</ul>
<p>IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba: 0a8f74a5dde6c5327dac9522cf1441003f2ebcba<br />
  xe-pw-152432v2: 152432v2</p>

</body>
</html>

--===============6305951238120474358==--
