Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F39FCCF9E3
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 02:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229D910E233;
	Sat,  8 Nov 2025 02:31:49 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E43110E233;
 Sat,  8 Nov 2025 02:31:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7119224605621605116=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_Add_ini?=
 =?utf-8?q?tial_support_for_Xe3p=5FLPD_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Nov 2025 02:31:47 -0000
Message-ID: <176256910731.31057.3657912157967859800@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107-xe3p_lpd-basic-enabling-v4-0-ab3367f65f15@intel.com>
In-Reply-To: <20251107-xe3p_lpd-basic-enabling-v4-0-ab3367f65f15@intel.com>
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

--===============7119224605621605116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Add initial support for Xe3p_LPD (rev4)
URL   : https://patchwork.freedesktop.org/series/155951/
State : failure

== Summary ==

CI Bug Log - changes from xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745_BAT -> xe-pw-155951v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155951v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155951v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155951v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745/bat-bmg-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745/bat-bmg-3/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745/bat-bmg-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/bat-bmg-1/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-155951v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#4543]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745 -> xe-pw-155951v4

  IGT_8614: 8614
  xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745: 2bc418aa7efaae562e49d84e8b28f799cf624745
  xe-pw-155951v4: 155951v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/index.html

--===============7119224605621605116==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Add initial support for Xe3p_LPD (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155951/">https://patchwork.freedesktop.org/series/155951/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745_BAT -&gt; xe-pw-155951v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155951v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155951v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155951v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/bat-bmg-3/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155951v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155951v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745 -&gt; xe-pw-155951v4</li>
</ul>
<p>IGT_8614: 8614<br />
  xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745: 2bc418aa7efaae562e49d84e8b28f799cf624745<br />
  xe-pw-155951v4: 155951v4</p>

</body>
</html>

--===============7119224605621605116==--
