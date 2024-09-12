Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D378EEE250
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 19:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051AF10EC1B;
	Thu, 12 Sep 2024 19:58:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656F410EC1B;
 Thu, 12 Sep 2024 19:58:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6123995941830283669=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Fix_xe=5Fforce=5Fwake=5Fget=28?=
 =?utf-8?q?=29_failure_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 19:58:47 -0000
Message-ID: <172617112740.993544.7976970192899759071@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

--===============6123995941830283669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix xe_force_wake_get() failure handling (rev2)
URL   : https://patchwork.freedesktop.org/series/137982/
State : failure

== Summary ==

CI Bug Log - changes from xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc_BAT -> xe-pw-137982v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137982v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137982v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137982v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@gt:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-lnl-2/igt@xe_debugfs@gt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-lnl-2/igt@xe_debugfs@gt.html
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-dg2-oem2/igt@xe_debugfs@gt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-dg2-oem2/igt@xe_debugfs@gt.html
    - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-atsm-2/igt@xe_debugfs@gt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-atsm-2/igt@xe_debugfs@gt.html
    - bat-lnl-1:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-lnl-1/igt@xe_debugfs@gt.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-lnl-1/igt@xe_debugfs@gt.html
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-bmg-1/igt@xe_debugfs@gt.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-bmg-1/igt@xe_debugfs@gt.html
    - bat-adlp-7:         [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-adlp-7/igt@xe_debugfs@gt.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-adlp-7/igt@xe_debugfs@gt.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][13] -> [SKIP][14] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_debugfs@gt:
    - {bat-bmg-2}:        [PASS][15] -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-bmg-2/igt@xe_debugfs@gt.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-bmg-2/igt@xe_debugfs@gt.html

  * igt@xe_live_ktest@xe_dma_buf:
    - {bat-bmg-2}:        [PASS][17] -> [SKIP][18] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  
Known issues
------------

  Here are the changes found in xe-pw-137982v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][19] -> [FAIL][20] ([Intel XE#1861])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][21] -> [SKIP][22] ([Intel XE#1192]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][23] -> [SKIP][24] ([Intel XE#1192]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-2:          [PASS][25] -> [SKIP][26] ([Intel XE#1192]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][27] -> [SKIP][28] ([Intel XE#1192]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][29] -> [SKIP][30] ([Intel XE#1192]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861


Build changes
-------------

  * Linux: xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc -> xe-pw-137982v2

  IGT_8015: 8015
  xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc: 9fd27ed0883cff53777b8db0b7c6db327132dcdc
  xe-pw-137982v2: 137982v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/index.html

--===============6123995941830283669==
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
<tr><td><b>Series:</b></td><td>Fix xe_force_wake_get() failure handling (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137982/">https://patchwork.freedesktop.org/series/137982/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc_BAT -&gt; xe-pw-137982v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137982v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137982v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137982v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_debugfs@gt:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-lnl-2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-lnl-2/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-dg2-oem2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-dg2-oem2/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-atsm-2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-atsm-2/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-lnl-1/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-lnl-1/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-bmg-1/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-bmg-1/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-adlp-7/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-adlp-7/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_debugfs@gt:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-bmg-2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-bmg-2/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137982v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc -&gt; xe-pw-137982v2</li>
</ul>
<p>IGT_8015: 8015<br />
  xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc: 9fd27ed0883cff53777b8db0b7c6db327132dcdc<br />
  xe-pw-137982v2: 137982v2</p>

</body>
</html>

--===============6123995941830283669==--
