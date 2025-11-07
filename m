Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73381CCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 15:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A6610EAF8;
	Fri,  7 Nov 2025 15:46:20 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E5410EAF8;
 Fri,  7 Nov 2025 15:46:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1716770319332618912=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_VF_double_migration_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 15:46:19 -0000
Message-ID: <176253037907.28862.1642184373597130599@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
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

--===============1716770319332618912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF double migration (rev3)
URL   : https://patchwork.freedesktop.org/series/156339/
State : failure

== Summary ==

CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_BAT -> xe-pw-156339v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156339v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156339v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156339v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@multigpu-once-basic:
    - bat-bmg-3:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-156339v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-ptl-vm:         NOTRUN -> [ABORT][2] ([Intel XE#6541])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html

  
#### Possible fixes ####

  * igt@xe_compute@compute-square:
    - bat-ptl-vm:         [ABORT][3] ([Intel XE#6541]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/bat-ptl-vm/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/bat-ptl-vm/igt@xe_compute@compute-square.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          [ABORT][5] ([Intel XE#6541]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  
  [Intel XE#6541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541


Build changes
-------------

  * Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -> xe-pw-156339v3

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160
  xe-pw-156339v3: 156339v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/index.html

--===============1716770319332618912==
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
<tr><td><b>Series:</b></td><td>VF double migration (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156339/">https://patchwork.freedesktop.org/series/156339/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_BAT -&gt; xe-pw-156339v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156339v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156339v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156339v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@multigpu-once-basic:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156339v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/bat-ptl-vm/igt@xe_compute@compute-square.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/bat-ptl-vm/igt@xe_compute@compute-square.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -&gt; xe-pw-156339v3</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160<br />
  xe-pw-156339v3: 156339v3</p>

</body>
</html>

--===============1716770319332618912==--
