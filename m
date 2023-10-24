Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144F8C00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 15:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE8310E0D8;
	Tue, 24 Oct 2023 15:21:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 30E1110E0D8;
 Tue, 24 Oct 2023 15:21:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2BF5BAA916;
 Tue, 24 Oct 2023 15:21:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0987101975083401745=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Date: Tue, 24 Oct 2023 15:21:28 -0000
Message-ID: <169816088814.18360.150311159384404795@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231024-xe-ups-driver_flr-v3-1-5b7d63b92fde@intel.com>
In-Reply-To: <20231024-xe-ups-driver_flr-v3-1-5b7d63b92fde@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_implement_driver_initiated_function-reset_=28rev2=29?=
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

--===============0987101975083401745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: implement driver initiated function-reset (rev2)
URL   : https://patchwork.freedesktop.org/series/124976/
State : success

== Summary ==

CI Bug Log - changes from xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7_BAT -> xe-pw-124976v2_BAT
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

  Here are the changes found in xe-pw-124976v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_waitfence@abstime.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/bat-atsm-2/igt@xe_waitfence@abstime.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * Linux: xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7 -> xe-pw-124976v2

  IGT_7552: 557856802dfee103802f1157f97c65bb476d5468 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7: 4354e27efb78582ee567ba6264c79d0872a3a4e7
  xe-pw-124976v2: 124976v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/index.html

--===============0987101975083401745==
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
<tr><td><b>Series:</b></td><td>drm/xe: implement driver initiated function-reset (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124976/">https://patchwork.freedesktop.org/series/124976/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7_BAT -&gt; xe-pw-124976v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124976v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_waitfence@abstime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124976v2/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7 -&gt; xe-pw-124976v2</li>
</ul>
<p>IGT_7552: 557856802dfee103802f1157f97c65bb476d5468 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7: 4354e27efb78582ee567ba6264c79d0872a3a4e7<br />
  xe-pw-124976v2: 124976v2</p>

</body>
</html>

--===============0987101975083401745==--
