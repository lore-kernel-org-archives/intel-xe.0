Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1B9C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 11:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A4010E7D0;
	Mon, 25 Mar 2024 11:36:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A0F10E7D0;
 Mon, 25 Mar 2024 11:36:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4924632775123418437=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/i915=3A_limit_eDP_MSO_pipe_o?=
 =?utf-8?q?nly_for_display_version_20_and_below?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 11:36:50 -0000
Message-ID: <171136661016.1035680.10250727085652610671@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325103713.1814043-1-luciano.coelho@intel.com>
In-Reply-To: <20240325103713.1814043-1-luciano.coelho@intel.com>
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

--===============4924632775123418437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: limit eDP MSO pipe only for display version 20 and below
URL   : https://patchwork.freedesktop.org/series/131570/
State : failure

== Summary ==

CI Bug Log - changes from xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8_BAT -> xe-pw-131570v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131570v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131570v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131570v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  
Known issues
------------

  Here are the changes found in xe-pw-131570v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#1259]) -> [TIMEOUT][4] ([Intel XE#1088])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [TIMEOUT][5] ([Intel XE#1088]) -> [INCOMPLETE][6] ([Intel XE#804])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * Linux: xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8 -> xe-pw-131570v1

  IGT_7780: 93a5298ac980333738cf75da6b66fa6f3769205f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8: f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8
  xe-pw-131570v1: 131570v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/index.html

--===============4924632775123418437==
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
<tr><td><b>Series:</b></td><td>drm/i915: limit eDP MSO pipe only for display version 20 and below</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131570/">https://patchwork.freedesktop.org/series/131570/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8_BAT -&gt; xe-pw-131570v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131570v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131570v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131570v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-beng-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131570v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131570v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8 -&gt; xe-pw-131570v1</li>
</ul>
<p>IGT_7780: 93a5298ac980333738cf75da6b66fa6f3769205f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-986-f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8: f568a6988d6cd9ac9bb8b02f896e1f7997aa05d8<br />
  xe-pw-131570v1: 131570v1</p>

</body>
</html>

--===============4924632775123418437==--
