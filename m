Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4989EC54754
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6983810E295;
	Mon, 19 May 2025 23:54:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE1610E295;
 Mon, 19 May 2025 23:54:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1653130164547356408=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/vf=3A_Fail_migration?=
 =?utf-8?q?_recovery_if_fixups_needed_but_platform_not_supported_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 23:54:32 -0000
Message-ID: <174769887269.2496.1120592032283552265@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519230035.3143966-1-tomasz.lis@intel.com>
In-Reply-To: <20250519230035.3143966-1-tomasz.lis@intel.com>
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

--===============1653130164547356408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Fail migration recovery if fixups needed but platform not supported (rev5)
URL   : https://patchwork.freedesktop.org/series/148914/
State : failure

== Summary ==

CI Bug Log - changes from xe-3112-956a742459cff150a14f1d2f44b6294e646f208a_BAT -> xe-pw-148914v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148914v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148914v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148914v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3112-956a742459cff150a14f1d2f44b6294e646f208a/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v5/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
Known issues
------------

  Here are the changes found in xe-pw-148914v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-lnl-2:          [PASS][3] -> [ABORT][4] ([Intel XE#5003])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3112-956a742459cff150a14f1d2f44b6294e646f208a/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v5/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  
  [Intel XE#5003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003


Build changes
-------------

  * Linux: xe-3112-956a742459cff150a14f1d2f44b6294e646f208a -> xe-pw-148914v5

  IGT_8368: 8368
  xe-3112-956a742459cff150a14f1d2f44b6294e646f208a: 956a742459cff150a14f1d2f44b6294e646f208a
  xe-pw-148914v5: 148914v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v5/index.html

--===============1653130164547356408==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Fail migration recovery if fixups needed but platform not supported (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148914/">https://patchwork.freedesktop.org/series/148914/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3112-956a742459cff150a14f1d2f44b6294e646f208a_BAT -&gt; xe-pw-148914v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148914v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148914v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148914v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3112-956a742459cff150a14f1d2f44b6294e646f208a/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v5/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148914v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-4-tiled:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3112-956a742459cff150a14f1d2f44b6294e646f208a/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v5/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003">Intel XE#5003</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3112-956a742459cff150a14f1d2f44b6294e646f208a -&gt; xe-pw-148914v5</li>
</ul>
<p>IGT_8368: 8368<br />
  xe-3112-956a742459cff150a14f1d2f44b6294e646f208a: 956a742459cff150a14f1d2f44b6294e646f208a<br />
  xe-pw-148914v5: 148914v5</p>

</body>
</html>

--===============1653130164547356408==--
