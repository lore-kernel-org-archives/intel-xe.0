Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72ABC61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 09:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4F310E7C3;
	Fri, 24 Nov 2023 09:48:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D33F210E7C3;
 Fri, 24 Nov 2023 09:48:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CB481AADD7;
 Fri, 24 Nov 2023 09:48:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8105917792507168358=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 24 Nov 2023 09:48:21 -0000
Message-ID: <170081930179.13025.12221277443240979364@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Assorted_memory-management_fixes_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============8105917792507168358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Assorted memory-management fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/126753/
State : success

== Summary ==

CI Bug Log - changes from xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992_BAT -> xe-pw-126753v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-126753v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [FAIL][3] ([i915#2346]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp3:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#557]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@c-dp3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@c-dp3.html

  * igt@kms_flip@basic-flip-vs-modeset@d-dp3:
    - bat-dg2-oem2:       [FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@d-dp3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@d-dp3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/557
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7600 -> IGT_7601
  * Linux: xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992 -> xe-pw-126753v2

  IGT_7600: b889fd01780dc79f6fcc8545346c81f5c79f5efb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7601: 9c6e7f255724e327627be7c8ed30e23742e97386 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992: 1832821c7e4c5bd24353183f060f1435b2eb7992
  xe-pw-126753v2: 126753v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/index.html

--===============8105917792507168358==
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
<tr><td><b>Series:</b></td><td>drm/xe: Assorted memory-management fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126753/">https://patchwork.freedesktop.org/series/126753/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992_BAT -&gt; xe-pw-126753v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126753v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/557">Intel XE#557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@c-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@d-dp3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@d-dp3.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7600 -&gt; IGT_7601</li>
<li>Linux: xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992 -&gt; xe-pw-126753v2</li>
</ul>
<p>IGT_7600: b889fd01780dc79f6fcc8545346c81f5c79f5efb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7601: 9c6e7f255724e327627be7c8ed30e23742e97386 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992: 1832821c7e4c5bd24353183f060f1435b2eb7992<br />
  xe-pw-126753v2: 126753v2</p>

</body>
</html>

--===============8105917792507168358==--
