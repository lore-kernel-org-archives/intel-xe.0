Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9AFC3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 07:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C9F10E14A;
	Tue,  6 May 2025 07:56:17 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9F310E14A;
 Tue,  6 May 2025 07:56:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6493902728056903830=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/hwmon=3A_Add_mailbox?=
 =?utf-8?q?_power_limits=2C_PL2=2C_read_energy_from_PMT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 07:56:16 -0000
Message-ID: <174651817649.50252.6281196445942660071@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250430203607.926585-1-karthik.poosa@intel.com>
In-Reply-To: <20250430203607.926585-1-karthik.poosa@intel.com>
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

--===============6493902728056903830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT
URL   : https://patchwork.freedesktop.org/series/148506/
State : failure

== Summary ==

CI Bug Log - changes from xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318_BAT -> xe-pw-148506v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148506v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148506v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148506v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4] +9 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_module_load@load:
    - bat-bmg-2:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318/bat-bmg-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/bat-bmg-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_8349 -> IGT_8350
  * Linux: xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318 -> xe-pw-148506v1

  IGT_8349: be0b7853bb2ded0b183e87bdaeab4318a7e2cd52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8350: 641cb40b6e0075eedc1bc2c11efd246a2957b1ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318: 48801f872be1ca3cc4f9faf1818b5ea44d1df318
  xe-pw-148506v1: 148506v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/index.html

--===============6493902728056903830==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148506/">https://patchwork.freedesktop.org/series/148506/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318_BAT -&gt; xe-pw-148506v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148506v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148506v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148506v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148506v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8349 -&gt; IGT_8350</li>
<li>Linux: xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318 -&gt; xe-pw-148506v1</li>
</ul>
<p>IGT_8349: be0b7853bb2ded0b183e87bdaeab4318a7e2cd52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8350: 641cb40b6e0075eedc1bc2c11efd246a2957b1ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3014-48801f872be1ca3cc4f9faf1818b5ea44d1df318: 48801f872be1ca3cc4f9faf1818b5ea44d1df318<br />
  xe-pw-148506v1: 148506v1</p>

</body>
</html>

--===============6493902728056903830==--
