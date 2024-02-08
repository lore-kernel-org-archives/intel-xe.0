Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164DDC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 09:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B100810E21C;
	Thu,  8 Feb 2024 09:39:58 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4C910E21C;
 Thu,  8 Feb 2024 09:39:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1681915970752895295=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/xe=5Fgt=5Fidle=3A_Drop_re?=
 =?utf-8?q?dundant_newline_in_name_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 09:39:57 -0000
Message-ID: <170738519732.1106275.1081758872500906187@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206192731.3533608-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240206192731.3533608-1-ashutosh.dixit@intel.com>
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

--===============1681915970752895295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_gt_idle: Drop redundant newline in name (rev4)
URL   : https://patchwork.freedesktop.org/series/129495/
State : failure

== Summary ==

CI Bug Log - changes from xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507_BAT -> xe-pw-129495v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129495v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129495v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129495v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
Known issues
------------

  Here are the changes found in xe-pw-129495v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([Intel XE#417])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#804])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#850]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804
  [Intel XE#850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/850


Build changes
-------------

  * Linux: xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507 -> xe-pw-129495v4

  IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507: a942be9b4f39a05326a5fc3fd774fb143b4d9507
  xe-pw-129495v4: 129495v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/index.html

--===============1681915970752895295==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_gt_idle: Drop redundant newline in name (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129495/">https://patchwork.freedesktop.org/series/129495/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507_BAT -&gt; xe-pw-129495v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129495v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129495v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129495v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129495v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129495v4/bat-dg2-oem2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/850">Intel XE#850</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507 -&gt; xe-pw-129495v4</li>
</ul>
<p>IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-747-a942be9b4f39a05326a5fc3fd774fb143b4d9507: a942be9b4f39a05326a5fc3fd774fb143b4d9507<br />
  xe-pw-129495v4: 129495v4</p>

</body>
</html>

--===============1681915970752895295==--
