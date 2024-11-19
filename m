Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA45CD6C287
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 19:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFD410E2C2;
	Tue, 19 Nov 2024 19:35:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076BB10E2C2;
 Tue, 19 Nov 2024 19:35:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7081884807760378130=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5BCI=2C1/3?=
 =?utf-8?q?=5D_drm/i915/display=3A_Move_shutdown_sequences_under_display_dri?=
 =?utf-8?q?ver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 19:35:37 -0000
Message-ID: <173204493704.428480.9667754313054332283@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119184414.336105-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241119184414.336105-1-rodrigo.vivi@intel.com>
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

--===============7081884807760378130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/3] drm/i915/display: Move shutdown sequences under display driver
URL   : https://patchwork.freedesktop.org/series/141565/
State : failure

== Summary ==

CI Bug Log - changes from xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de_BAT -> xe-pw-141565v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141565v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141565v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141565v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-141565v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3517])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][5] -> [SKIP][6] ([Intel XE#3443] / [Intel XE#455]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#1033]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@many-basic:
    - bat-lnl-2:          [INCOMPLETE][9] ([Intel XE#3466]) -> [DMESG-FAIL][10] ([Intel XE#3466])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-lnl-2:          [DMESG-FAIL][11] ([Intel XE#3466]) -> [DMESG-WARN][12] ([Intel XE#3466])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de -> xe-pw-141565v1

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de: c2bd638d71d621e6887e15ae2e7bf1571b9599de
  xe-pw-141565v1: 141565v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/index.html

--===============7081884807760378130==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/3] drm/i915/display: Move shutdown sequences under display driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141565/">https://patchwork.freedesktop.org/series/141565/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de_BAT -&gt; xe-pw-141565v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141565v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141565v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141565v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_psr@psr-primary-page-flip@edp-1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141565v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141565v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de -&gt; xe-pw-141565v1</li>
</ul>
<p>IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2253-c2bd638d71d621e6887e15ae2e7bf1571b9599de: c2bd638d71d621e6887e15ae2e7bf1571b9599de<br />
  xe-pw-141565v1: 141565v1</p>

</body>
</html>

--===============7081884807760378130==--
