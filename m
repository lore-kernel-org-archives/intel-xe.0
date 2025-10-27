Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A62CCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 10:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5BF10E438;
	Mon, 27 Oct 2025 10:47:13 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE9910E069;
 Mon, 27 Oct 2025 10:47:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8964471863985502142=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Testing_PREEMPT=5FRT_with_d?=
 =?utf-8?q?isabling_interrupts_in_the_most_critical_section=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 10:47:12 -0000
Message-ID: <176156203225.57205.8126272397215806064@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251023085601.90831-1-dev@lankhorst.se>
In-Reply-To: <20251023085601.90831-1-dev@lankhorst.se>
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

--===============8964471863985502142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Testing PREEMPT_RT with disabling interrupts in the most critical section. (rev3)
URL   : https://patchwork.freedesktop.org/series/156134/
State : failure

== Summary ==

CI Bug Log - changes from xe-3988-c03916cb446b6eefe91538599775bb54bf98238c_BAT -> xe-pw-156134v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156134v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156134v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156134v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3988-c03916cb446b6eefe91538599775bb54bf98238c/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-ptl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3988-c03916cb446b6eefe91538599775bb54bf98238c/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3988-c03916cb446b6eefe91538599775bb54bf98238c/bat-ptl-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/bat-ptl-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-3988-c03916cb446b6eefe91538599775bb54bf98238c -> xe-pw-156134v3

  IGT_8596: 8596
  xe-3988-c03916cb446b6eefe91538599775bb54bf98238c: c03916cb446b6eefe91538599775bb54bf98238c
  xe-pw-156134v3: 156134v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/index.html

--===============8964471863985502142==
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
<tr><td><b>Series:</b></td><td>Testing PREEMPT_RT with disabling interrupts in the most critical section. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156134/">https://patchwork.freedesktop.org/series/156134/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3988-c03916cb446b6eefe91538599775bb54bf98238c_BAT -&gt; xe-pw-156134v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156134v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156134v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156134v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3988-c03916cb446b6eefe91538599775bb54bf98238c/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3988-c03916cb446b6eefe91538599775bb54bf98238c/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3988-c03916cb446b6eefe91538599775bb54bf98238c/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156134v3/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3988-c03916cb446b6eefe91538599775bb54bf98238c -&gt; xe-pw-156134v3</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3988-c03916cb446b6eefe91538599775bb54bf98238c: c03916cb446b6eefe91538599775bb54bf98238c<br />
  xe-pw-156134v3: 156134v3</p>

</body>
</html>

--===============8964471863985502142==--
