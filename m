Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A23FC3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 15:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C47D10E901;
	Thu, 27 Mar 2025 15:18:02 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3B910E901;
 Thu, 27 Mar 2025 15:18:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9157446031912443225=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/xe2hpg=3A_Add_Wa=5F1?=
 =?utf-8?q?6025250150_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 15:18:01 -0000
Message-ID: <174308868111.11729.17850280422515808425@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325134421.1489416-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250325134421.1489416-1-aradhya.bhatia@intel.com>
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

--===============9157446031912443225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2hpg: Add Wa_16025250150 (rev2)
URL   : https://patchwork.freedesktop.org/series/146709/
State : failure

== Summary ==

CI Bug Log - changes from xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def_BAT -> xe-pw-146709v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-146709v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146709v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146709v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  
Known issues
------------

  Here are the changes found in xe-pw-146709v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#2464]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_intel_bb@render:
    - bat-adlp-vf:        NOTRUN -> [ABORT][3] ([Intel XE#3970])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_intel_bb@render.html

  * igt@xe_intel_bb@render@render-ymajor-256:
    - bat-adlp-vf:        NOTRUN -> [DMESG-WARN][4] ([Intel XE#3970])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [ABORT][5] ([Intel XE#3970]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          [SKIP][7] ([Intel XE#4578]) -> [SKIP][8] ([Intel XE#976])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976


Build changes
-------------

  * IGT: IGT_8289 -> IGT_8283
  * Linux: xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def -> xe-pw-146709v2

  IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8289: 8289
  xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def: 1e750490a76bbb8bcb8ea8d5fba2a68bf0845def
  xe-pw-146709v2: 146709v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/index.html

--===============9157446031912443225==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2hpg: Add Wa_16025250150 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146709/">https://patchwork.freedesktop.org/series/146709/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def_BAT -&gt; xe-pw-146709v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-146709v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-146709v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-146709v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_intel_bb@render@render-xmajor-256:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146709v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_intel_bb@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-ymajor-256:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pat@pat-index-xehpc@render:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578">Intel XE#4578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8289 -&gt; IGT_8283</li>
<li>Linux: xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def -&gt; xe-pw-146709v2</li>
</ul>
<p>IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8289: 8289<br />
  xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def: 1e750490a76bbb8bcb8ea8d5fba2a68bf0845def<br />
  xe-pw-146709v2: 146709v2</p>

</body>
</html>

--===============9157446031912443225==--
