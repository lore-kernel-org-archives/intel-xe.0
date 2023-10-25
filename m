Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DEBC25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 07:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE9410E57D;
	Wed, 25 Oct 2023 07:50:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6344A10E57D;
 Wed, 25 Oct 2023 07:50:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5CE69AADF8;
 Wed, 25 Oct 2023 07:50:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3672742950083804440=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 25 Oct 2023 07:50:56 -0000
Message-ID: <169822025637.20487.15080233833261631508@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231020100352.1974990-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231020100352.1974990-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Count_and_report_low_level_driver_errors_=28rev2=29?=
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

--===============3672742950083804440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Count and report low level driver errors (rev2)
URL   : https://patchwork.freedesktop.org/series/125388/
State : success

== Summary ==

CI Bug Log - changes from xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7_BAT -> xe-pw-125388v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-125388v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][3] ([Intel XE#524]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [FAIL][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_waitfence@abstime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/bat-atsm-2/igt@xe_waitfence@abstime.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#750]) -> [DMESG-FAIL][8] ([Intel XE#282])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750


Build changes
-------------

  * IGT: IGT_7552 -> IGT_7553
  * Linux: xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7 -> xe-pw-125388v2

  IGT_7552: 557856802dfee103802f1157f97c65bb476d5468 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7553: 03ded26cd2697ce3b4d7ceb0d7d2706460f87ca1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7: 4354e27efb78582ee567ba6264c79d0872a3a4e7
  xe-pw-125388v2: 125388v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/index.html

--===============3672742950083804440==
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
<tr><td><b>Series:</b></td><td>drm/xe: Count and report low level driver errors (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125388/">https://patchwork.freedesktop.org/series/125388/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7_BAT -&gt; xe-pw-125388v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125388v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_waitfence@abstime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125388v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7552 -&gt; IGT_7553</li>
<li>Linux: xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7 -&gt; xe-pw-125388v2</li>
</ul>
<p>IGT_7552: 557856802dfee103802f1157f97c65bb476d5468 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7553: 03ded26cd2697ce3b4d7ceb0d7d2706460f87ca1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7: 4354e27efb78582ee567ba6264c79d0872a3a4e7<br />
  xe-pw-125388v2: 125388v2</p>

</body>
</html>

--===============3672742950083804440==--
