Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6397D63930
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 12:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF5A10E733;
	Wed, 20 Nov 2024 12:19:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3178810E727;
 Wed, 20 Nov 2024 12:19:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7417580562634899181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_intel=5Fdisplay_conv?=
 =?utf-8?q?ersions=2C_cleanups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 12:19:41 -0000
Message-ID: <173210518122.702055.9625711230485974909@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732102179.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732102179.git.jani.nikula@intel.com>
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

--===============7417580562634899181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: intel_display conversions, cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/141175/
State : success

== Summary ==

CI Bug Log - changes from xe-2254-ccf64319402f90f68549e2047a7f985a46436e41_BAT -> xe-pw-141175v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141175v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#3517]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#3443] / [Intel XE#455]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html

  
#### Warnings ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-lnl-1:          [DMESG-FAIL][5] ([Intel XE#3466]) -> [DMESG-WARN][6] ([Intel XE#3466])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2254-ccf64319402f90f68549e2047a7f985a46436e41 -> xe-pw-141175v2

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41
  xe-pw-141175v2: 141175v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/index.html

--===============7417580562634899181==
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
<tr><td><b>Series:</b></td><td>drm/i915: intel_display conversions, cleanups (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141175/">https://patchwork.freedesktop.org/series/141175/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2254-ccf64319402f90f68549e2047a7f985a46436e41_BAT -&gt; xe-pw-141175v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141175v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2254-ccf64319402f90f68549e2047a7f985a46436e41 -&gt; xe-pw-141175v2</li>
</ul>
<p>IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41<br />
  xe-pw-141175v2: 141175v2</p>

</body>
</html>

--===============7417580562634899181==--
