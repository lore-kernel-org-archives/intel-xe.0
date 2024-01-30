Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE1CC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 14:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA4E11311C;
	Tue, 30 Jan 2024 14:04:45 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98EE11311C;
 Tue, 30 Jan 2024 14:04:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7862080391673170388=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_function_to_emit_P?=
 =?utf-8?q?IPE=5FCONTROL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 30 Jan 2024 14:04:44 -0000
Message-ID: <170662348482.824484.8110799763372305247@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130132249.8615-1-jose.souza@intel.com>
In-Reply-To: <20240130132249.8615-1-jose.souza@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============7862080391673170388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use function to emit PIPE_CONTROL (rev2)
URL   : https://patchwork.freedesktop.org/series/129281/
State : success

== Summary ==

CI Bug Log - changes from xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457_BAT -> xe-pw-129281v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 

Known issues
------------

  Here are the changes found in xe-pw-129281v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#1033])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * {igt@xe_exec_atomic@basic-inc-all}:
    - bat-pvc-2:          [SKIP][3] ([Intel XE#1172]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457/bat-pvc-2/igt@xe_exec_atomic@basic-inc-all.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/bat-pvc-2/igt@xe_exec_atomic@basic-inc-all.html
    - bat-atsm-2:         [SKIP][5] ([Intel XE#1172]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1172


Build changes
-------------

  * IGT: IGT_7698 -> IGT_7699
  * Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -> xe-pw-129281v2

  IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7699: 7699
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457
  xe-pw-129281v2: 129281v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/index.html

--===============7862080391673170388==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use function to emit PIPE_CONTROL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129281/">https://patchwork.freedesktop.org/series/129281/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457_BAT -&gt; xe-pw-129281v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129281v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_exec_atomic@basic-inc-all}:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457/bat-pvc-2/igt@xe_exec_atomic@basic-inc-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1172">Intel XE#1172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/bat-pvc-2/igt@xe_exec_atomic@basic-inc-all.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1172">Intel XE#1172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129281v2/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7698 -&gt; IGT_7699</li>
<li>Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -&gt; xe-pw-129281v2</li>
</ul>
<p>IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7699: 7699<br />
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457<br />
  xe-pw-129281v2: 129281v2</p>

</body>
</html>

--===============7862080391673170388==--
