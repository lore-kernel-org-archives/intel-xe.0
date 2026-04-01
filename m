Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B529710F9314
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 01:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638AB10E31C;
	Wed,  1 Apr 2026 01:03:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08D310EB7B;
 Wed,  1 Apr 2026 01:03:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0868346667242693978=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Enable_Wa=5F1402?=
 =?utf-8?q?5515070=2C_Enable_indirect_ring_state_for_XE2+_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Apr 2026 01:03:15 -0000
Message-ID: <177500539583.420767.14332193738964909394@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304003431.758201-3-julia.filipchuk@intel.com>
In-Reply-To: <20260304003431.758201-3-julia.filipchuk@intel.com>
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

--===============0868346667242693978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable Wa_14025515070, Enable indirect ring state for XE2+ (rev10)
URL   : https://patchwork.freedesktop.org/series/160812/
State : failure

== Summary ==

CI Bug Log - changes from xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c_FULL -> xe-pw-160812v10_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160812v10_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160812v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160812v10_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-lnl:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  
Known issues
------------

  Here are the changes found in xe-pw-160812v10_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-7/igt@kms_vrr@flipline.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/shard-lnl-5/igt@kms_vrr@flipline.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397


Build changes
-------------

  * Linux: xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c -> xe-pw-160812v10

  IGT_8839: 8839
  xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c: 779129c7868f4c7205901d6e57b25de52b411d1c
  xe-pw-160812v10: 160812v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/index.html

--===============0868346667242693978==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable Wa_14025515070, Enable indirect ring state for XE2+ (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160812/">https://patchwork.freedesktop.org/series/160812/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c_FULL -&gt; xe-pw-160812v10_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160812v10_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160812v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160812v10_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160812v10_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-7/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v10/shard-lnl-5/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c -&gt; xe-pw-160812v10</li>
</ul>
<p>IGT_8839: 8839<br />
  xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c: 779129c7868f4c7205901d6e57b25de52b411d1c<br />
  xe-pw-160812v10: 160812v10</p>

</body>
</html>

--===============0868346667242693978==--
