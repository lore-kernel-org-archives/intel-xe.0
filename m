Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095DFC07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 23:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCB810E503;
	Tue, 24 Oct 2023 23:34:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 89A0210E503;
 Tue, 24 Oct 2023 23:34:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 82A1BAADE0;
 Tue, 24 Oct 2023 23:34:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3605480870120576113=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 24 Oct 2023 23:34:50 -0000
Message-ID: <169819049050.18361.8580013784898114101@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
In-Reply-To: <20231024220739.224251-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_st?=
 =?utf-8?q?arting_with_=5Bv2=2C1/3=5D_drm/xe/xe2=3A_Add_initial_workaround?=
 =?utf-8?q?s?=
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

--===============3605480870120576113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/3] drm/xe/xe2: Add initial workarounds
URL   : https://patchwork.freedesktop.org/series/125531/
State : success

== Summary ==

CI Bug Log - changes from xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7_BAT -> xe-pw-125531v1_BAT
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

  Here are the changes found in xe-pw-125531v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#524]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_waitfence@abstime.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/bat-atsm-2/igt@xe_waitfence@abstime.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * Linux: xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7 -> xe-pw-125531v1

  IGT_7552: 557856802dfee103802f1157f97c65bb476d5468 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7: 4354e27efb78582ee567ba6264c79d0872a3a4e7
  xe-pw-125531v1: 125531v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/index.html

--===============3605480870120576113==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/3] drm/xe/xe2: Add initial workarounds</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125531/">https://patchwork.freedesktop.org/series/125531/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7_BAT -&gt; xe-pw-125531v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125531v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7/bat-atsm-2/igt@xe_waitfence@abstime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125531v1/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7 -&gt; xe-pw-125531v1</li>
</ul>
<p>IGT_7552: 557856802dfee103802f1157f97c65bb476d5468 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-444-4354e27efb78582ee567ba6264c79d0872a3a4e7: 4354e27efb78582ee567ba6264c79d0872a3a4e7<br />
  xe-pw-125531v1: 125531v1</p>

</body>
</html>

--===============3605480870120576113==--
