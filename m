Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55105FAD3E6
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 01:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFBB10E0C3;
	Thu, 23 Apr 2026 01:05:24 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F9110EABF;
 Thu, 23 Apr 2026 01:05:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3818901923567747540=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E64=2E0_for_BMG=2C_LNL=2C_PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Apr 2026 01:05:23 -0000
Message-ID: <177690632335.62.6821210803213708239@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260422212304.2250771-2-julia.filipchuk@intel.com>
In-Reply-To: <20260422212304.2250771-2-julia.filipchuk@intel.com>
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

--===============3818901923567747540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.64.0 for BMG, LNL, PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/165316/
State : failure

== Summary ==

CI Bug Log - changes from xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165_BAT -> xe-pw-165316v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165316v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165316v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165316v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +4 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html

  * igt@xe_live_ktest@xe_bo:
    - bat-bmg-2:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165/bat-bmg-2/igt@xe_live_ktest@xe_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/bat-bmg-2/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in xe-pw-165316v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - bat-bmg-1:          [PASS][5] -> [ABORT][6] ([Intel XE#6652]) +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652


Build changes
-------------

  * Linux: xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165 -> xe-pw-165316v2

  IGT_8870: 1aba4b364b6dbdf7926cc78501e7281d5176b029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165: 9917a06970fd6775b7b4259be6cca21cb4e2b165
  xe-pw-165316v2: 165316v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/index.html

--===============3818901923567747540==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Test GuC v70.64.0 for BMG, LNL, PTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165316/">https://patchwork.freedesktop.org/series/165316/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165_BAT -&gt; xe-pw-165316v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165316v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165316v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165316v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165/bat-bmg-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/bat-bmg-2/igt@xe_live_ktest@xe_bo.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165316v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165316v2/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165 -&gt; xe-pw-165316v2</li>
</ul>
<p>IGT_8870: 1aba4b364b6dbdf7926cc78501e7281d5176b029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4927-9917a06970fd6775b7b4259be6cca21cb4e2b165: 9917a06970fd6775b7b4259be6cca21cb4e2b165<br />
  xe-pw-165316v2: 165316v2</p>

</body>
</html>

--===============3818901923567747540==--
