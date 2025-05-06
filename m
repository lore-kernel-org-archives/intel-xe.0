Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BEEC3ABB6
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 00:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E2510E14B;
	Tue,  6 May 2025 00:09:12 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF09A10E12B;
 Tue,  6 May 2025 00:09:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1003537237308784227=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Support_active_context_util?=
 =?utf-8?q?ization_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 00:09:10 -0000
Message-ID: <174649015077.49740.6203793500643244684@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
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

--===============1003537237308784227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Support active context utilization (rev2)
URL   : https://patchwork.freedesktop.org/series/148302/
State : failure

== Summary ==

CI Bug Log - changes from xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179_BAT -> xe-pw-148302v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148302v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148302v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148302v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-adlp-vf/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-adlp-vf/igt@xe_create@create-execqueues-noleak.html
    - bat-lnl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-lnl-1/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-lnl-1/igt@xe_create@create-execqueues-noleak.html
    - bat-bmg-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
    - bat-bmg-1:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-bmg-1/igt@xe_create@create-execqueues-noleak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-bmg-1/igt@xe_create@create-execqueues-noleak.html
    - bat-lnl-2:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html

  


Build changes
-------------

  * Linux: xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179 -> xe-pw-148302v2

  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179: 47bf2b0a07ce766d4e893762e02be4a2646e0179
  xe-pw-148302v2: 148302v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/index.html

--===============1003537237308784227==
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
<tr><td><b>Series:</b></td><td>Support active context utilization (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148302/">https://patchwork.freedesktop.org/series/148302/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179_BAT -&gt; xe-pw-148302v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148302v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148302v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148302v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-adlp-vf/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-adlp-vf/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-lnl-1/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-lnl-1/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-bmg-1/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-bmg-1/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179 -&gt; xe-pw-148302v2</li>
</ul>
<p>IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179: 47bf2b0a07ce766d4e893762e02be4a2646e0179<br />
  xe-pw-148302v2: 148302v2</p>

</body>
</html>

--===============1003537237308784227==--
