Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CFDC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 02:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEF110E25A;
	Tue, 11 Jun 2024 02:31:03 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1AD10E24D;
 Tue, 11 Jun 2024 02:31:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5513696507332744346=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Improve_quality_an?=
 =?utf-8?q?d_robustness_of_GuC_log_dumping_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 02:31:01 -0000
Message-ID: <171807306189.66237.1390947828323261443@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
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

--===============5513696507332744346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Improve quality and robustness of GuC log dumping (rev2)
URL   : https://patchwork.freedesktop.org/series/134695/
State : failure

== Summary ==

CI Bug Log - changes from xe-1439-bf9d891af55d3785eb9438efb053c991bf2b4b10_BAT -> xe-pw-134695v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134695v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134695v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134695v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@shared-pde3-page:
    - bat-atsm-2:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1439-bf9d891af55d3785eb9438efb053c991bf2b4b10/bat-atsm-2/igt@xe_vm@shared-pde3-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134695v2/bat-atsm-2/igt@xe_vm@shared-pde3-page.html

  


Build changes
-------------

  * Linux: xe-1439-bf9d891af55d3785eb9438efb053c991bf2b4b10 -> xe-pw-134695v2

  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1439-bf9d891af55d3785eb9438efb053c991bf2b4b10: bf9d891af55d3785eb9438efb053c991bf2b4b10
  xe-pw-134695v2: 134695v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134695v2/index.html

--===============5513696507332744346==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Improve quality and robustness of GuC log dumping (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134695/">https://patchwork.freedesktop.org/series/134695/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134695v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134695v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1439-bf9d891af55d3785eb9438efb053c991bf2b4b10_BAT -&gt; xe-pw-134695v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134695v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134695v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134695v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@shared-pde3-page:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1439-bf9d891af55d3785eb9438efb053c991bf2b4b10/bat-atsm-2/igt@xe_vm@shared-pde3-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134695v2/bat-atsm-2/igt@xe_vm@shared-pde3-page.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1439-bf9d891af55d3785eb9438efb053c991bf2b4b10 -&gt; xe-pw-134695v2</li>
</ul>
<p>IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1439-bf9d891af55d3785eb9438efb053c991bf2b4b10: bf9d891af55d3785eb9438efb053c991bf2b4b10<br />
  xe-pw-134695v2: 134695v2</p>

</body>
</html>

--===============5513696507332744346==--
