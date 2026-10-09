Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC89CA601D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 16:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AB610E04E;
	Fri,  9 Oct 2026 16:27:39 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7B210E04E;
 Fri,  9 Oct 2026 16:27:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2766481196422193932=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fix_kernel_crash_during_dri?=
 =?utf-8?q?ver_teardown_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 16:27:37 -0000
Message-ID: <179156325777.4094.13402253120084121524@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009145906.886719-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261009145906.886719-5-satyanarayana.k.v.p@intel.com>
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

--===============2766481196422193932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix kernel crash during driver teardown (rev4)
URL   : https://patchwork.freedesktop.org/series/175766/
State : failure

== Summary ==

CI Bug Log - changes from xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa_BAT -> xe-pw-175766v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-175766v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-175766v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-175766v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_gt_freq@freq_range_idle:
    - bat-ptl-2:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa/bat-ptl-2/igt@xe_gt_freq@freq_range_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/bat-ptl-2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-ptl-2:          [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa/bat-ptl-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/bat-ptl-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-175766v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][5] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069


Build changes
-------------

  * Linux: xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa -> xe-pw-175766v4

  IGT_9138: 9138
  xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa: a9079e63263acdef3db9b768ef47cfaf779a97aa
  xe-pw-175766v4: 175766v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/index.html

--===============2766481196422193932==
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
<tr><td><b>Series:</b></td><td>Fix kernel crash during driver teardown (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175766/">https://patchwork.freedesktop.org/series/175766/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa_BAT -&gt; xe-pw-175766v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-175766v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-175766v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-175766v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa/bat-ptl-2/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/bat-ptl-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa/bat-ptl-2/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/bat-ptl-2/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175766v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v4/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa -&gt; xe-pw-175766v4</li>
</ul>
<p>IGT_9138: 9138<br />
  xe-5918-a9079e63263acdef3db9b768ef47cfaf779a97aa: a9079e63263acdef3db9b768ef47cfaf779a97aa<br />
  xe-pw-175766v4: 175766v4</p>

</body>
</html>

--===============2766481196422193932==--
