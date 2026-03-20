Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0CE109319C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 09:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0395410E1C7;
	Fri, 20 Mar 2026 09:17:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD8310E1C7;
 Fri, 20 Mar 2026 09:17:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0727656227829089536=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/psr=3A_Ignore_devi?=
 =?utf-8?q?ce_ID_for_Dell_XPS_14_DA14260?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Mar 2026 09:17:34 -0000
Message-ID: <177399825448.379016.13088877227798333970@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320075108.1395951-1-jouni.hogander@intel.com>
In-Reply-To: <20260320075108.1395951-1-jouni.hogander@intel.com>
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

--===============0727656227829089536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Ignore device ID for Dell XPS 14 DA14260
URL   : https://patchwork.freedesktop.org/series/163564/
State : failure

== Summary ==

CI Bug Log - changes from xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a_BAT -> xe-pw-163564v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163564v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163564v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163564v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-wcl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-wcl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-wcl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-163564v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#7483])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] ([Intel XE#6506])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] ([Intel XE#6519])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][9] ([Intel XE#7483]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * IGT: IGT_8811 -> IGT_8813
  * Linux: xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a -> xe-pw-163564v1

  IGT_8811: cc3169e72592a56b806ce54a87060519151ad5fe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8813: 89e32100ca0e4ca343dd32408dacf1e879e8ed02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a
  xe-pw-163564v1: 163564v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/index.html

--===============0727656227829089536==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Ignore device ID for Dell XPS 14 DA14260</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163564/">https://patchwork.freedesktop.org/series/163564/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a_BAT -&gt; xe-pw-163564v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163564v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163564v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163564v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-wcl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-wcl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163564v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163564v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8811 -&gt; IGT_8813</li>
<li>Linux: xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a -&gt; xe-pw-163564v1</li>
</ul>
<p>IGT_8811: cc3169e72592a56b806ce54a87060519151ad5fe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8813: 89e32100ca0e4ca343dd32408dacf1e879e8ed02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a<br />
  xe-pw-163564v1: 163564v1</p>

</body>
</html>

--===============0727656227829089536==--
