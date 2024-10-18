Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7754CD3000F
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 14:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F7510E934;
	Fri, 18 Oct 2024 14:16:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB2010E934;
 Fri, 18 Oct 2024 14:16:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6218135538754996863=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/ufence=3A_Signal_ufence_i?=
 =?utf-8?q?mmediately_when_possible?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 14:16:43 -0000
Message-ID: <172926100331.1282343.12236064569701612836@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018124710.1536948-1-nirmoy.das@intel.com>
In-Reply-To: <20241018124710.1536948-1-nirmoy.das@intel.com>
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

--===============6218135538754996863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ufence: Signal ufence immediately when possible
URL   : https://patchwork.freedesktop.org/series/140169/
State : failure

== Summary ==

CI Bug Log - changes from xe-2091-c1837d4e9af4e9df3109960341105c035b441667_BAT -> xe-pw-140169v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140169v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140169v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140169v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - bat-adlp-vf:        [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-basic.html
    - bat-pvc-2:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html
    - bat-bmg-1:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-bmg-1/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-bmg-1/igt@xe_exec_balancer@twice-cm-virtual-basic.html

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-lnl-2:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-lnl-2/igt@xe_exec_compute_mode@twice-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-lnl-2/igt@xe_exec_compute_mode@twice-basic.html
    - bat-lnl-1:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-lnl-1/igt@xe_exec_compute_mode@twice-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_compute_mode@twice-userptr-rebind:
    - bat-dg2-oem2:       [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-userptr-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-userptr-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - {bat-bmg-2}:        [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_8078 -> IGT_8080
  * Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -> xe-pw-140169v1

  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667
  xe-pw-140169v1: 140169v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/index.html

--===============6218135538754996863==
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
<tr><td><b>Series:</b></td><td>drm/xe/ufence: Signal ufence immediately when possible</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140169/">https://patchwork.freedesktop.org/series/140169/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2091-c1837d4e9af4e9df3109960341105c035b441667_BAT -&gt; xe-pw-140169v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140169v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140169v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140169v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-basic.html">INCOMPLETE</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">INCOMPLETE</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-bmg-1/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-bmg-1/igt@xe_exec_balancer@twice-cm-virtual-basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-lnl-2/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-lnl-2/igt@xe_exec_compute_mode@twice-basic.html">INCOMPLETE</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-lnl-1/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-userptr-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_balancer@twice-cm-virtual-basic:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/bat-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8078 -&gt; IGT_8080</li>
<li>Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -&gt; xe-pw-140169v1</li>
</ul>
<p>IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667<br />
  xe-pw-140169v1: 140169v1</p>

</body>
</html>

--===============6218135538754996863==--
