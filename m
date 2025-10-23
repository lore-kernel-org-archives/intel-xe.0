Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD64CCD1AB
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 01:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738ED10E1D2;
	Thu, 23 Oct 2025 01:43:45 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8FB10E1D2;
 Thu, 23 Oct 2025 01:43:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6658067682986953471=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Limit_number_of_j?=
 =?utf-8?q?obs_per_exec_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Oct 2025 01:43:44 -0000
Message-ID: <176118382418.44373.16376581323318069234@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
In-Reply-To: <20251022181036.2868787-2-shuicheng.lin@intel.com>
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

--===============6658067682986953471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Limit number of jobs per exec queue
URL   : https://patchwork.freedesktop.org/series/156371/
State : failure

== Summary ==

CI Bug Log - changes from xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd_BAT -> xe-pw-156371v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156371v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156371v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156371v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@many-basic:
    - bat-pvc-2:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd/bat-pvc-2/igt@xe_exec_fault_mode@many-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/bat-pvc-2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_threads@threads-basic:
    - bat-atsm-2:         [PASS][3] -> [TIMEOUT][4] +1 other test timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd/bat-atsm-2/igt@xe_exec_threads@threads-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/bat-atsm-2/igt@xe_exec_threads@threads-basic.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-lnl-2:          [PASS][5] -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-156371v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#4543]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8594 -> IGT_8595
  * Linux: xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd -> xe-pw-156371v1

  IGT_8594: 8594
  IGT_8595: 8595
  xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd: 71929a54e8bb5da291d41a931d80c6c9160073dd
  xe-pw-156371v1: 156371v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/index.html

--===============6658067682986953471==
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
<tr><td><b>Series:</b></td><td>drm/xe: Limit number of jobs per exec queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156371/">https://patchwork.freedesktop.org/series/156371/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd_BAT -&gt; xe-pw-156371v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156371v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156371v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156371v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd/bat-pvc-2/igt@xe_exec_fault_mode@many-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/bat-pvc-2/igt@xe_exec_fault_mode@many-basic.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd/bat-atsm-2/igt@xe_exec_threads@threads-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/bat-atsm-2/igt@xe_exec_threads@threads-basic.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156371v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156371v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8594 -&gt; IGT_8595</li>
<li>Linux: xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd -&gt; xe-pw-156371v1</li>
</ul>
<p>IGT_8594: 8594<br />
  IGT_8595: 8595<br />
  xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd: 71929a54e8bb5da291d41a931d80c6c9160073dd<br />
  xe-pw-156371v1: 156371v1</p>

</body>
</html>

--===============6658067682986953471==--
