Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244D1C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 20:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D359710E3BB;
	Wed, 29 May 2024 20:10:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1056D10E36C;
 Wed, 29 May 2024 20:10:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3351557581386622325=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Convert_multiple_bind_ops_to_1_j?=
 =?utf-8?q?ob_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 20:10:19 -0000
Message-ID: <171701341906.2234143.13504212990191620291@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529183148.1713695-1-matthew.brost@intel.com>
In-Reply-To: <20240529183148.1713695-1-matthew.brost@intel.com>
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

--===============3351557581386622325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert multiple bind ops to 1 job (rev3)
URL   : https://patchwork.freedesktop.org/series/133034/
State : failure

== Summary ==

CI Bug Log - changes from xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1_BAT -> xe-pw-133034v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133034v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133034v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-atsm-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133034v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +61 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@xe_module_load@load:
    - bat-atsm-2:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/bat-atsm-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-133034v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#1130]) +192 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130


Build changes
-------------

  * Linux: xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1 -> xe-pw-133034v3

  IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1: 55d6179b96e0390025f2ba101c03b94b50cab7a1
  xe-pw-133034v3: 133034v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/index.html

--===============3351557581386622325==
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
<tr><td><b>Series:</b></td><td>Convert multiple bind ops to 1 job (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133034/">https://patchwork.freedesktop.org/series/133034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1_BAT -&gt; xe-pw-133034v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133034v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133034v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-atsm-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133034v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/bat-atsm-2/igt@xe_module_load@load.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133034v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v3/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +192 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1 -&gt; xe-pw-133034v3</li>
</ul>
<p>IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1: 55d6179b96e0390025f2ba101c03b94b50cab7a1<br />
  xe-pw-133034v3: 133034v3</p>

</body>
</html>

--===============3351557581386622325==--
