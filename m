Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47323C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 20:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B691120B0;
	Thu, 21 Mar 2024 20:14:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6988F10F9F1;
 Thu, 21 Mar 2024 20:14:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0076977861089103750=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_move_dmc=5Ff?=
 =?utf-8?q?irmware=5Fpath_to_display_params?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 20:14:28 -0000
Message-ID: <171105206843.941104.6012057489266388013@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321161856.3517856-1-jani.nikula@intel.com>
In-Reply-To: <20240321161856.3517856-1-jani.nikula@intel.com>
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

--===============0076977861089103750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: move dmc_firmware_path to display params
URL   : https://patchwork.freedesktop.org/series/131442/
State : success

== Summary ==

CI Bug Log - changes from xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31_BAT -> xe-pw-131442v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-131442v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#1259])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131442v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259


Build changes
-------------

  * IGT: IGT_7774 -> IGT_7775
  * Linux: xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31 -> xe-pw-131442v1

  IGT_7774: 7774
  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31
  xe-pw-131442v1: 131442v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131442v1/index.html

--===============0076977861089103750==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: move dmc_firmware_path to display params</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131442/">https://patchwork.freedesktop.org/series/131442/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131442v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131442v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31_BAT -&gt; xe-pw-131442v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131442v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131442v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7774 -&gt; IGT_7775</li>
<li>Linux: xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31 -&gt; xe-pw-131442v1</li>
</ul>
<p>IGT_7774: 7774<br />
  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31<br />
  xe-pw-131442v1: 131442v1</p>

</body>
</html>

--===============0076977861089103750==--
