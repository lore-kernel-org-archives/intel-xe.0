Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87075C021A0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 09:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A25310E2D8;
	Mon, 17 Feb 2025 09:14:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C5310E262;
 Mon, 17 Feb 2025 09:14:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2418619563819659978=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Introduce_drm_sharpness_pro?=
 =?utf-8?q?perty_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Feb 2025 09:14:03 -0000
Message-ID: <173978364359.3212067.16109864650201853754@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214151132.1811682-1-nemesa.garg@intel.com>
In-Reply-To: <20250214151132.1811682-1-nemesa.garg@intel.com>
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

--===============2418619563819659978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce drm sharpness property (rev7)
URL   : https://patchwork.freedesktop.org/series/139954/
State : failure

== Summary ==

CI Bug Log - changes from xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934_BAT -> xe-pw-139954v7_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139954v7_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139954v7_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139954v7_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] +63 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:
    - bat-bmg-1:          [PASS][11] -> [FAIL][12] +63 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][13] -> [SKIP][14] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
Known issues
------------

  Here are the changes found in xe-pw-139954v7_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [SKIP][17] ([Intel XE#1192]) -> [SKIP][18] ([Intel XE#4322]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322


Build changes
-------------

  * IGT: IGT_8231 -> IGT_8232
  * Linux: xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934 -> xe-pw-139954v7

  IGT_8231: 8231
  IGT_8232: 8232
  xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934: 6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934
  xe-pw-139954v7: 139954v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/index.html

--===============2418619563819659978==
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
<tr><td><b>Series:</b></td><td>Introduce drm sharpness property (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139954/">https://patchwork.freedesktop.org/series/139954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934_BAT -&gt; xe-pw-139954v7_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139954v7_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139954v7_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139954v7_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">FAIL</a> +63 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html">FAIL</a> +63 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139954v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v7/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8231 -&gt; IGT_8232</li>
<li>Linux: xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934 -&gt; xe-pw-139954v7</li>
</ul>
<p>IGT_8231: 8231<br />
  IGT_8232: 8232<br />
  xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934: 6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934<br />
  xe-pw-139954v7: 139954v7</p>

</body>
</html>

--===============2418619563819659978==--
