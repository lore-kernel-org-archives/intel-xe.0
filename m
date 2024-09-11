Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54BEEE57D7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F3910EAA4;
	Wed, 11 Sep 2024 20:41:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EE810EAA7;
 Wed, 11 Sep 2024 20:41:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3192900323867661581=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/3=5D_d?=
 =?utf-8?q?rm/xe=3A_Fix_build_by_setting_the_correct_parameter_to_intel=5Fdm?=
 =?utf-8?q?c=5Fsuspend=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Sep 2024 20:41:52 -0000
Message-ID: <172608731215.988693.11035347125777429374@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911200218.130219-1-jose.souza@intel.com>
In-Reply-To: <20240911200218.130219-1-jose.souza@intel.com>
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

--===============3192900323867661581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe: Fix build by setting the correct parameter to intel_dmc_suspend()
URL   : https://patchwork.freedesktop.org/series/138542/
State : success

== Summary ==

CI Bug Log - changes from xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d_BAT -> xe-pw-138542v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-138542v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#1069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#877]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html

  * igt@xe_exec_queue_property@invalid-property:
    - bat-lnl-2:          [DMESG-WARN][5] ([Intel XE#2687]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html

  
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d -> xe-pw-138542v1

  IGT_8012: 8012
  xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d: 2c6794afc551f7ae5af783b69975fe639aed383d
  xe-pw-138542v1: 138542v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/index.html

--===============3192900323867661581==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe: Fix build by setting the correct parameter to intel_dmc_suspend()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138542/">https://patchwork.freedesktop.org/series/138542/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d_BAT -&gt; xe-pw-138542v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138542v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138542v1/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d -&gt; xe-pw-138542v1</li>
</ul>
<p>IGT_8012: 8012<br />
  xe-1925-2c6794afc551f7ae5af783b69975fe639aed383d: 2c6794afc551f7ae5af783b69975fe639aed383d<br />
  xe-pw-138542v1: 138542v1</p>

</body>
</html>

--===============3192900323867661581==--
