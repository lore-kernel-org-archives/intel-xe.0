Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E313CC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D61511280F;
	Mon,  8 Apr 2024 16:50:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A3311280F;
 Mon,  8 Apr 2024 16:50:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3607259594133415107=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv6=2C1/3?=
 =?utf-8?q?=5D_drm/xe=3A_Store_xe=5Fhe=5Fengine_in_xe=5Fhw=5Fengine=5Fsnapsh?=
 =?utf-8?q?ot_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 16:50:18 -0000
Message-ID: <171259501880.1286010.11323856459201960129@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405182326.72157-1-jose.souza@intel.com>
In-Reply-To: <20240405182326.72157-1-jose.souza@intel.com>
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

--===============3607259594133415107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v6,1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot (rev2)
URL   : https://patchwork.freedesktop.org/series/132095/
State : success

== Summary ==

CI Bug Log - changes from xe-1053-3f6d14414476985621a86e8aee7d3d9bb2070cd1_BAT -> xe-pw-132095v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132095v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-basic:
    - {bat-lnl-1}:        [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1053-3f6d14414476985621a86e8aee7d3d9bb2070cd1/bat-lnl-1/igt@xe_exec_threads@threads-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132095v2/bat-lnl-1/igt@xe_exec_threads@threads-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1053-3f6d14414476985621a86e8aee7d3d9bb2070cd1 -> xe-pw-132095v2

  IGT_7801: 7801
  xe-1053-3f6d14414476985621a86e8aee7d3d9bb2070cd1: 3f6d14414476985621a86e8aee7d3d9bb2070cd1
  xe-pw-132095v2: 132095v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132095v2/index.html

--===============3607259594133415107==
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
<tr><td><b>Series:</b></td><td>series starting with [v6,1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132095/">https://patchwork.freedesktop.org/series/132095/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132095v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132095v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1053-3f6d14414476985621a86e8aee7d3d9bb2070cd1_BAT -&gt; xe-pw-132095v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132095v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-basic:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1053-3f6d14414476985621a86e8aee7d3d9bb2070cd1/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132095v2/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1053-3f6d14414476985621a86e8aee7d3d9bb2070cd1 -&gt; xe-pw-132095v2</li>
</ul>
<p>IGT_7801: 7801<br />
  xe-1053-3f6d14414476985621a86e8aee7d3d9bb2070cd1: 3f6d14414476985621a86e8aee7d3d9bb2070cd1<br />
  xe-pw-132095v2: 132095v2</p>

</body>
</html>

--===============3607259594133415107==--
