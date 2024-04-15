Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8939C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 08:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9DE10FC44;
	Mon, 15 Apr 2024 08:28:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55A510F5F0;
 Mon, 15 Apr 2024 08:28:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8420408664843352027=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Modify_minimum_of_vari?=
 =?utf-8?q?ous_scheduler_timeout_to_0=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 08:28:33 -0000
Message-ID: <171316971380.1404405.12389114005644195581@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
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

--===============8420408664843352027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Modify minimum of various scheduler timeout to 0. (rev3)
URL   : https://patchwork.freedesktop.org/series/130913/
State : failure

== Summary ==

CI Bug Log - changes from xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff_BAT -> xe-pw-130913v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-130913v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-130913v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-130913v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sysfs_defaults@engine-defaults:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff/bat-pvc-2/igt@xe_sysfs_defaults@engine-defaults.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/bat-pvc-2/igt@xe_sysfs_defaults@engine-defaults.html
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults.html

  * igt@xe_sysfs_defaults@engine-defaults@bcs:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] +4 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff/bat-adlp-7/igt@xe_sysfs_defaults@engine-defaults@bcs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/bat-adlp-7/igt@xe_sysfs_defaults@engine-defaults@bcs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_sysfs_defaults@engine-defaults@rcs:
    - {bat-lnl-1}:        [PASS][7] -> [FAIL][8] +5 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff/bat-lnl-1/igt@xe_sysfs_defaults@engine-defaults@rcs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/bat-lnl-1/igt@xe_sysfs_defaults@engine-defaults@rcs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff -> xe-pw-130913v3

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff: d9073a139e9edfd27d830c9c4af9683651044aff
  xe-pw-130913v3: 130913v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/index.html

--===============8420408664843352027==
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
<tr><td><b>Series:</b></td><td>drm/xe: Modify minimum of various scheduler timeout to 0. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130913/">https://patchwork.freedesktop.org/series/130913/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff_BAT -&gt; xe-pw-130913v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-130913v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-130913v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-130913v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_sysfs_defaults@engine-defaults:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff/bat-pvc-2/igt@xe_sysfs_defaults@engine-defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/bat-pvc-2/igt@xe_sysfs_defaults@engine-defaults.html">FAIL</a> +2 other tests fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_defaults@engine-defaults@bcs:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff/bat-adlp-7/igt@xe_sysfs_defaults@engine-defaults@bcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/bat-adlp-7/igt@xe_sysfs_defaults@engine-defaults@bcs.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_sysfs_defaults@engine-defaults@rcs:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff/bat-lnl-1/igt@xe_sysfs_defaults@engine-defaults@rcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v3/bat-lnl-1/igt@xe_sysfs_defaults@engine-defaults@rcs.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff -&gt; xe-pw-130913v3</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1082-d9073a139e9edfd27d830c9c4af9683651044aff: d9073a139e9edfd27d830c9c4af9683651044aff<br />
  xe-pw-130913v3: 130913v3</p>

</body>
</html>

--===============8420408664843352027==--
