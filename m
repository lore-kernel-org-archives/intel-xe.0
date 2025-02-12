Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2FAC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 16:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AE010E90C;
	Wed, 12 Feb 2025 16:12:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1342410E8FF;
 Wed, 12 Feb 2025 16:12:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8366802322356957060=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Improve_type-safety_on_POWE?=
 =?utf-8?q?R=5FDOMAIN=5F*=28=29_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 16:12:40 -0000
Message-ID: <173937676007.1347988.12791820742293922574@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212132658.323640-1-gustavo.sousa@intel.com>
In-Reply-To: <20250212132658.323640-1-gustavo.sousa@intel.com>
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

--===============8366802322356957060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve type-safety on POWER_DOMAIN_*() macros
URL   : https://patchwork.freedesktop.org/series/144727/
State : failure

== Summary ==

CI Bug Log - changes from xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906_BAT -> xe-pw-144727v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144727v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144727v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144727v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@info:
    - bat-bmg-1:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-1/igt@fbdev@info.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-1/igt@fbdev@info.html

  
#### Warnings ####

  * igt@fbdev@info:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#2134]) -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-dg2-oem2/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-dg2-oem2/igt@fbdev@info.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#4257]) -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-dg2-oem2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-144727v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-lnl-1:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1727]) +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-lnl-1/igt@fbdev@eof.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-lnl-1/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-lnl-1:          [PASS][9] -> [TIMEOUT][10] ([Intel XE#1727]) +1 other test timeout
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-lnl-1/igt@fbdev@info.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-lnl-1/igt@fbdev@info.html

  * igt@fbdev@write:
    - bat-bmg-1:          [PASS][11] -> [DMESG-WARN][12] ([Intel XE#1727]) +4 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-1/igt@fbdev@write.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-1/igt@fbdev@write.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1727]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - bat-adlp-vf:        [PASS][19] -> [DMESG-WARN][20] ([Intel XE#3970])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-one-partial.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Warnings ####

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#2134]) -> [DMESG-WARN][22] ([Intel XE#1727]) +2 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-dg2-oem2/igt@fbdev@nullptr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][23] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][24] ([Intel XE#1192])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4257
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906 -> xe-pw-144727v1

  IGT_8228: 8228
  xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906: a05c910166dda7fc8b510e5c9771c3bed3fbb906
  xe-pw-144727v1: 144727v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/index.html

--===============8366802322356957060==
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
<tr><td><b>Series:</b></td><td>Improve type-safety on POWER_DOMAIN_*() macros</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144727/">https://patchwork.freedesktop.org/series/144727/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906_BAT -&gt; xe-pw-144727v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144727v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144727v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144727v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@fbdev@info:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-1/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-1/igt@fbdev@info.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-dg2-oem2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-dg2-oem2/igt@fbdev@info.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4257">Intel XE#4257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-dg2-oem2/igt@xe_module_load@load.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144727v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-lnl-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-lnl-1/igt@fbdev@eof.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-lnl-1/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-lnl-1/igt@fbdev@info.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-1/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-1/igt@fbdev@write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-one-partial.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-dg2-oem2/igt@fbdev@nullptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906 -&gt; xe-pw-144727v1</li>
</ul>
<p>IGT_8228: 8228<br />
  xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906: a05c910166dda7fc8b510e5c9771c3bed3fbb906<br />
  xe-pw-144727v1: 144727v1</p>

</body>
</html>

--===============8366802322356957060==--
