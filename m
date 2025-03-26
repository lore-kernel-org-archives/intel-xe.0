Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEACC28B30
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 05:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04F610E0E2;
	Wed, 26 Mar 2025 05:06:21 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A4C10E0E2;
 Wed, 26 Mar 2025 05:06:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5822319603125607121=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_VRR_Register_Read/Write_Upd?=
 =?utf-8?q?ates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 05:06:20 -0000
Message-ID: <174296558045.4057.2500150325713408315@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326040538.504861-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250326040538.504861-1-ankit.k.nautiyal@intel.com>
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

--===============5822319603125607121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VRR Register Read/Write Updates
URL   : https://patchwork.freedesktop.org/series/146777/
State : failure

== Summary ==

CI Bug Log - changes from xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7_BAT -> xe-pw-146777v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-146777v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146777v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146777v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          [SKIP][1] ([Intel XE#976]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  
Known issues
------------

  Here are the changes found in xe-pw-146777v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#261] / [Intel XE#688]) +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_fault_mode@twice-rebind:
    - bat-adlp-vf:        NOTRUN -> [SKIP][4] ([Intel XE#288]) +32 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        NOTRUN -> [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][6] ([Intel XE#2229])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#977])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2838] / [Intel XE#979])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#979])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [ABORT][10] ([Intel XE#3970]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8283 -> IGT_8284
  * Linux: xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 -> xe-pw-146777v1

  IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8284: 8284
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7
  xe-pw-146777v1: 146777v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/index.html

--===============5822319603125607121==
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
<tr><td><b>Series:</b></td><td>VRR Register Read/Write Updates</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146777/">https://patchwork.freedesktop.org/series/146777/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7_BAT -&gt; xe-pw-146777v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-146777v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-146777v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-146777v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pat@pat-index-xehpc@render:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146777v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146777v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8283 -&gt; IGT_8284</li>
<li>Linux: xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 -&gt; xe-pw-146777v1</li>
</ul>
<p>IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8284: 8284<br />
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7<br />
  xe-pw-146777v1: 146777v1</p>

</body>
</html>

--===============5822319603125607121==--
