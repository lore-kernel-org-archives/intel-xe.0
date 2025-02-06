Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6E6C02192
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 02:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7555110E0A4;
	Thu,  6 Feb 2025 02:04:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CA510E0A4;
 Thu,  6 Feb 2025 02:04:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7572910235656563123=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/dp=5Fmst=3A_Fix_ge?=
 =?utf-8?q?tting_display_pointer_in_intel=5Fdp=5Fmst=5Fcompute=5Fmin=5Fhblan?=
 =?utf-8?q?k=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 02:04:39 -0000
Message-ID: <173880747927.1734269.7503179786919698660@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205232855.3017421-1-imre.deak@intel.com>
In-Reply-To: <20250205232855.3017421-1-imre.deak@intel.com>
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

--===============7572910235656563123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Fix getting display pointer in intel_dp_mst_compute_min_hblank()
URL   : https://patchwork.freedesktop.org/series/144388/
State : failure

== Summary ==

CI Bug Log - changes from xe-2607-7a632b6798b6a05b63725249e3209afea13ea499_BAT -> xe-pw-144388v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144388v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144388v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144388v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144388v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  


Build changes
-------------

  * Linux: xe-2607-7a632b6798b6a05b63725249e3209afea13ea499 -> xe-pw-144388v1

  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2607-7a632b6798b6a05b63725249e3209afea13ea499: 7a632b6798b6a05b63725249e3209afea13ea499
  xe-pw-144388v1: 144388v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144388v1/index.html

--===============7572910235656563123==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Fix getting display pointer in intel_dp_mst_compute_min_hblank()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144388/">https://patchwork.freedesktop.org/series/144388/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144388v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144388v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2607-7a632b6798b6a05b63725249e3209afea13ea499_BAT -&gt; xe-pw-144388v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144388v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144388v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144388v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2607-7a632b6798b6a05b63725249e3209afea13ea499/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144388v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2607-7a632b6798b6a05b63725249e3209afea13ea499 -&gt; xe-pw-144388v1</li>
</ul>
<p>IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2607-7a632b6798b6a05b63725249e3209afea13ea499: 7a632b6798b6a05b63725249e3209afea13ea499<br />
  xe-pw-144388v1: 144388v1</p>

</body>
</html>

--===============7572910235656563123==--
