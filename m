Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EECC072A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 03:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4161110E03B;
	Sat, 18 Nov 2023 03:12:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F3F010E03B;
 Sat, 18 Nov 2023 03:12:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1949CA0093;
 Sat, 18 Nov 2023 03:12:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1700943703393704606=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Sat, 18 Nov 2023 03:12:48 -0000
Message-ID: <170027716806.12896.16055984361323529902@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Adding_ne?=
 =?utf-8?q?w_frequency_sysfs_attributes?=
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

--===============1700943703393704606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Adding new frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/126534/
State : failure

== Summary ==

CI Bug Log - changes from xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT -> xe-pw-126534v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126534v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126534v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126534v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-atsm-2:         [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
    - bat-dg2-oem2:       [PASS][11] -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-126534v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [PASS][13] -> [INCOMPLETE][14] ([Intel XE#764])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][15] ([Intel XE#524]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764


Build changes
-------------

  * Linux: xe-504-cb9b702d436952ddec33b020d549c7998cace9e2 -> xe-pw-126534v1

  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-504-cb9b702d436952ddec33b020d549c7998cace9e2: cb9b702d436952ddec33b020d549c7998cace9e2
  xe-pw-126534v1: 126534v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/index.html

--===============1700943703393704606==
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
<tr><td><b>Series:</b></td><td>Adding new frequency sysfs attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126534/">https://patchwork.freedesktop.org/series/126534/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT -&gt; xe-pw-126534v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126534v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126534v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126534v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126534v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-leak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126534v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-504-cb9b702d436952ddec33b020d549c7998cace9e2 -&gt; xe-pw-126534v1</li>
</ul>
<p>IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-504-cb9b702d436952ddec33b020d549c7998cace9e2: cb9b702d436952ddec33b020d549c7998cace9e2<br />
  xe-pw-126534v1: 126534v1</p>

</body>
</html>

--===============1700943703393704606==--
