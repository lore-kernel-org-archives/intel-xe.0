Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DF5C3ABD8
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 01:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E48A10E096;
	Thu, 15 May 2025 01:52:35 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D86F10E096;
 Thu, 15 May 2025 01:52:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2901838548685770732=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/hwmon=3A_Add_mailbox?=
 =?utf-8?q?_power_limits=2C_PL2=2C_read_energy_from_PMT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 01:52:33 -0000
Message-ID: <174727395357.82427.270434057575549625@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250514180455.1622625-1-karthik.poosa@intel.com>
In-Reply-To: <20250514180455.1622625-1-karthik.poosa@intel.com>
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

--===============2901838548685770732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT
URL   : https://patchwork.freedesktop.org/series/149026/
State : failure

== Summary ==

CI Bug Log - changes from xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1_BAT -> xe-pw-149026v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149026v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149026v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149026v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_module_load@load:
    - bat-bmg-2:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-bmg-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/bat-bmg-2/igt@xe_module_load@load.html

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid@vecs:
    - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6] +13 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-invalid@vecs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-invalid@vecs.html

  
Known issues
------------

  Here are the changes found in xe-pw-149026v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][7] -> [ABORT][8] ([Intel XE#3970])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1 -> xe-pw-149026v1

  IGT_8364: 8364
  xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1: 3d6670fab64cb00b5e6ed80d2517147db533faf1
  xe-pw-149026v1: 149026v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/index.html

--===============2901838548685770732==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149026/">https://patchwork.freedesktop.org/series/149026/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1_BAT -&gt; xe-pw-149026v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149026v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149026v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149026v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid@vecs:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-invalid@vecs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-invalid@vecs.html">DMESG-WARN</a> +13 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149026v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149026v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1 -&gt; xe-pw-149026v1</li>
</ul>
<p>IGT_8364: 8364<br />
  xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1: 3d6670fab64cb00b5e6ed80d2517147db533faf1<br />
  xe-pw-149026v1: 149026v1</p>

</body>
</html>

--===============2901838548685770732==--
