Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD73EDE98C
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 07:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CCE10E261;
	Thu, 14 Sep 2023 07:31:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CC0D10E261;
 Thu, 14 Sep 2023 07:31:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9D3DAAA01E;
 Thu, 14 Sep 2023 07:31:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6444824099140530275=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Date: Thu, 14 Sep 2023 07:31:16 -0000
Message-ID: <169467667660.29164.2201278940789768966@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914061317.1024579-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230914061317.1024579-1-aravind.iddamsetty@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/pm?=
 =?utf-8?q?u=3A_Enable_PMU_interface_=28rev7=29?=
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

--===============6444824099140530275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pmu: Enable PMU interface (rev7)
URL   : https://patchwork.freedesktop.org/series/119504/
State : success

== Summary ==

CI Bug Log - changes from xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b_BAT -> xe-pw-119504v7_BAT
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

  Here are the changes found in xe-pw-119504v7_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v7/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][3] ([Intel XE#524]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v7/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7486 -> IGT_7487
  * Linux: xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b -> xe-pw-119504v7

  IGT_7486: afd9a940c8247291baadd1977fe881d4f2edf0c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7487: 77e606dea60110c869ad9f9cc88994a0048845c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b: baea10eb27d49a2b8a526d87a70532ab201d140b
  xe-pw-119504v7: 119504v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v7/index.html

--===============6444824099140530275==
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
<tr><td><b>Series:</b></td><td>drm/xe/pmu: Enable PMU interface (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119504/">https://patchwork.freedesktop.org/series/119504/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b_BAT -&gt; xe-pw-119504v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-119504v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v7/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v7/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7486 -&gt; IGT_7487</li>
<li>Linux: xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b -&gt; xe-pw-119504v7</li>
</ul>
<p>IGT_7486: afd9a940c8247291baadd1977fe881d4f2edf0c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7487: 77e606dea60110c869ad9f9cc88994a0048845c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b: baea10eb27d49a2b8a526d87a70532ab201d140b<br />
  xe-pw-119504v7: 119504v7</p>

</body>
</html>

--===============6444824099140530275==--
