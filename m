Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AF5C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 07:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BECC10E0C0;
	Mon,  4 Dec 2023 07:39:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 115A910E0C0;
 Mon,  4 Dec 2023 07:39:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F02ADAADDD;
 Mon,  4 Dec 2023 07:39:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4099884711604943863=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Mon, 04 Dec 2023 07:39:39 -0000
Message-ID: <170167557995.20593.10562430113066231590@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Enable_fixed_CCS_mode_=28rev2=29?=
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

--===============4099884711604943863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable fixed CCS mode (rev2)
URL   : https://patchwork.freedesktop.org/series/127018/
State : success

== Summary ==

CI Bug Log - changes from xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4_BAT -> xe-pw-127018v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127018v2_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr}:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-127018v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#282] / [i915#2017]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4 -> xe-pw-127018v2

  IGT_7614: c7298ec108dc1c861c9a2593e973648ad9b420b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4: 38dc2e0d8c28a817f2c727402e2638f3ea2accb4
  xe-pw-127018v2: 127018v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/index.html

--===============4099884711604943863==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable fixed CCS mode (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127018/">https://patchwork.freedesktop.org/series/127018/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4_BAT -&gt; xe-pw-127018v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127018v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127018v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127018v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4 -&gt; xe-pw-127018v2</li>
</ul>
<p>IGT_7614: c7298ec108dc1c861c9a2593e973648ad9b420b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-545-38dc2e0d8c28a817f2c727402e2638f3ea2accb4: 38dc2e0d8c28a817f2c727402e2638f3ea2accb4<br />
  xe-pw-127018v2: 127018v2</p>

</body>
</html>

--===============4099884711604943863==--
