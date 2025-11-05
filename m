Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D158CCF9E3
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 00:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3006E10E083;
	Wed,  5 Nov 2025 00:14:21 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9D410E083;
 Wed,  5 Nov 2025 00:14:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5976106917078406961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Multi_Queue_featu?=
 =?utf-8?q?re_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 00:14:19 -0000
Message-ID: <176230165967.17802.12741701673081443319@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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

--===============5976106917078406961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Multi Queue feature support (rev2)
URL   : https://patchwork.freedesktop.org/series/156865/
State : failure

== Summary ==

CI Bug Log - changes from xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d_BAT -> xe-pw-156865v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156865v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156865v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156865v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_queue_property@invalid-property:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-vm:        [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
    - bat-ptl-1:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-1:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-2:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-7:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-1:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-2:          [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html

  
Known issues
------------

  Here are the changes found in xe-pw-156865v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-7:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#4543]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][23] ([Intel XE#4543]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d -> xe-pw-156865v2

  IGT_8607: 8607
  xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d: 5fc5af47c48c461ff910c39f88694b966fcebc5d
  xe-pw-156865v2: 156865v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/index.html

--===============5976106917078406961==
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
<tr><td><b>Series:</b></td><td>drm/xe: Multi Queue feature support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156865/">https://patchwork.freedesktop.org/series/156865/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d_BAT -&gt; xe-pw-156865v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156865v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156865v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156865v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_queue_property@invalid-property:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156865v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d -&gt; xe-pw-156865v2</li>
</ul>
<p>IGT_8607: 8607<br />
  xe-4043-5fc5af47c48c461ff910c39f88694b966fcebc5d: 5fc5af47c48c461ff910c39f88694b966fcebc5d<br />
  xe-pw-156865v2: 156865v2</p>

</body>
</html>

--===============5976106917078406961==--
