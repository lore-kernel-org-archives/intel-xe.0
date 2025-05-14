Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBB0C3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 12:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D920010E622;
	Wed, 14 May 2025 12:02:16 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2337A10E622;
 Wed, 14 May 2025 12:02:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5711291235751191883=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/hwmon=3A_Add_mailbox?=
 =?utf-8?q?_power_limits=2C_PL2=2C_read_energy_from_PMT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 12:02:15 -0000
Message-ID: <174722413513.78050.9692190638990771496@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513044728.630455-1-karthik.poosa@intel.com>
In-Reply-To: <20250513044728.630455-1-karthik.poosa@intel.com>
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

--===============5711291235751191883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT (rev2)
URL   : https://patchwork.freedesktop.org/series/148926/
State : failure

== Summary ==

CI Bug Log - changes from xe-3086-2e72fd09b4fb0823282977f0717159e47328a533_BAT -> xe-pw-148926v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148926v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148926v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148926v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [DMESG-WARN][2] +7 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3086-2e72fd09b4fb0823282977f0717159e47328a533/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_module_load@load:
    - bat-bmg-2:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3086-2e72fd09b4fb0823282977f0717159e47328a533/bat-bmg-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/bat-bmg-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-148926v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [PASS][5] -> [ABORT][6] ([Intel XE#3970])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3086-2e72fd09b4fb0823282977f0717159e47328a533/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-3086-2e72fd09b4fb0823282977f0717159e47328a533 -> xe-pw-148926v2

  IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3086-2e72fd09b4fb0823282977f0717159e47328a533: 2e72fd09b4fb0823282977f0717159e47328a533
  xe-pw-148926v2: 148926v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/index.html

--===============5711291235751191883==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148926/">https://patchwork.freedesktop.org/series/148926/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3086-2e72fd09b4fb0823282977f0717159e47328a533_BAT -&gt; xe-pw-148926v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148926v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148926v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148926v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3086-2e72fd09b4fb0823282977f0717159e47328a533/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3086-2e72fd09b4fb0823282977f0717159e47328a533/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148926v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-x:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3086-2e72fd09b4fb0823282977f0717159e47328a533/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148926v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3086-2e72fd09b4fb0823282977f0717159e47328a533 -&gt; xe-pw-148926v2</li>
</ul>
<p>IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3086-2e72fd09b4fb0823282977f0717159e47328a533: 2e72fd09b4fb0823282977f0717159e47328a533<br />
  xe-pw-148926v2: 148926v2</p>

</body>
</html>

--===============5711291235751191883==--
