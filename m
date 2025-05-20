Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9EDC3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 17:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4BB10E51E;
	Tue, 20 May 2025 17:00:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCBD10E51E;
 Tue, 20 May 2025 17:00:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6340581273140694292=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_CCS_save_restore_for_IGPU_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 17:00:56 -0000
Message-ID: <174776045695.6209.6949094461595368944@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520150946.4034-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250520150946.4034-1-satyanarayana.k.v.p@intel.com>
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

--===============6340581273140694292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CCS save restore for IGPU (rev3)
URL   : https://patchwork.freedesktop.org/series/149108/
State : failure

== Summary ==

CI Bug Log - changes from xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320_BAT -> xe-pw-149108v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149108v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149108v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149108v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-base:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320/bat-atsm-2/igt@intel_sysfs_debugfs@xe-base.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/bat-atsm-2/igt@intel_sysfs_debugfs@xe-base.html
    - bat-pvc-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320/bat-pvc-2/igt@intel_sysfs_debugfs@xe-base.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/bat-pvc-2/igt@intel_sysfs_debugfs@xe-base.html

  
Known issues
------------

  Here are the changes found in xe-pw-149108v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-lnl-1:          [PASS][5] -> [ABORT][6] ([Intel XE#5003])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-lnl-2:          [PASS][7] -> [ABORT][8] ([Intel XE#5003])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  
  [Intel XE#5003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003


Build changes
-------------

  * IGT: IGT_8370 -> IGT_8371
  * Linux: xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320 -> xe-pw-149108v3

  IGT_8370: 8370
  IGT_8371: 8371
  xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320: 45c2c8c74ab88c8fb741ea8349b051f5aec87320
  xe-pw-149108v3: 149108v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/index.html

--===============6340581273140694292==
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
<tr><td><b>Series:</b></td><td>CCS save restore for IGPU (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149108/">https://patchwork.freedesktop.org/series/149108/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320_BAT -&gt; xe-pw-149108v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149108v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149108v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149108v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-base:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320/bat-atsm-2/igt@intel_sysfs_debugfs@xe-base.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/bat-atsm-2/igt@intel_sysfs_debugfs@xe-base.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320/bat-pvc-2/igt@intel_sysfs_debugfs@xe-base.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/bat-pvc-2/igt@intel_sysfs_debugfs@xe-base.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149108v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-4-tiled:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003">Intel XE#5003</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v3/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003">Intel XE#5003</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8370 -&gt; IGT_8371</li>
<li>Linux: xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320 -&gt; xe-pw-149108v3</li>
</ul>
<p>IGT_8370: 8370<br />
  IGT_8371: 8371<br />
  xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320: 45c2c8c74ab88c8fb741ea8349b051f5aec87320<br />
  xe-pw-149108v3: 149108v3</p>

</body>
</html>

--===============6340581273140694292==--
