Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066E4CD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 21:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C3510E66C;
	Mon, 15 Jun 2026 21:27:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32910E62A;
 Mon, 15 Jun 2026 21:27:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1462929029010810357=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_All_pat?=
 =?utf-8?q?ches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jun 2026 21:27:52 -0000
Message-ID: <178155887296.81567.11484105207602082580@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260615201846.307297-1-dev@lankhorst.se>
In-Reply-To: <20260615201846.307297-1-dev@lankhorst.se>
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

--===============1462929029010810357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev16)
URL   : https://patchwork.freedesktop.org/series/159034/
State : failure

== Summary ==

CI Bug Log - changes from xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360_BAT -> xe-pw-159034v16_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159034v16_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159034v16_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): bat-ptl-1 bat-ptl-2 bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159034v16_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - bat-lnl-1:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/bat-lnl-1/igt@runner@aborted.html
    - bat-wcl-2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/bat-wcl-2/igt@runner@aborted.html
    - bat-lnl-2:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/bat-lnl-2/igt@runner@aborted.html
    - bat-wcl-1:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/bat-wcl-1/igt@runner@aborted.html

  


Build changes
-------------

  * IGT: IGT_8963 -> IGT_8964
  * Linux: xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360 -> xe-pw-159034v16

  IGT_8963: b19a1c7c50adbf0e090be48d9cbc90596a3434bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8964: 8964
  xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360: 0984dfdee2a4f9e1922fe919a6b469e115e23360
  xe-pw-159034v16: 159034v16

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/index.html

--===============1462929029010810357==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev16)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159034/">https://patchwork.freedesktop.org/series/159034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360_BAT -&gt; xe-pw-159034v16_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159034v16_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159034v16_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): bat-ptl-1 bat-ptl-2 bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159034v16_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/bat-lnl-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/bat-wcl-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/bat-lnl-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/bat-wcl-1/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8963 -&gt; IGT_8964</li>
<li>Linux: xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360 -&gt; xe-pw-159034v16</li>
</ul>
<p>IGT_8963: b19a1c7c50adbf0e090be48d9cbc90596a3434bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8964: 8964<br />
  xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360: 0984dfdee2a4f9e1922fe919a6b469e115e23360<br />
  xe-pw-159034v16: 159034v16</p>

</body>
</html>

--===============1462929029010810357==--
