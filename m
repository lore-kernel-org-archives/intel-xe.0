Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D1BD3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 13:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B5F10E59C;
	Tue,  9 Dec 2025 13:36:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9394010E5A0;
 Tue,  9 Dec 2025 13:36:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5339905916932708136=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_DC3CO_s?=
 =?utf-8?q?upport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 13:36:41 -0000
Message-ID: <176528740159.68390.6248536719266120370@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209113332.2770263-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20251209113332.2770263-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============5339905916932708136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: DC3CO support
URL   : https://patchwork.freedesktop.org/series/158688/
State : failure

== Summary ==

CI Bug Log - changes from xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f_BAT -> xe-pw-158688v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158688v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158688v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158688v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +53 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_debugfs@info-read}:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/bat-adlp-7/igt@xe_debugfs@info-read.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/bat-adlp-7/igt@xe_debugfs@info-read.html

  
Known issues
------------

  Here are the changes found in xe-pw-158688v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#6520])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][7] ([Intel XE#6506]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f -> xe-pw-158688v1

  IGT_8659: 8659
  xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f: 48deab361d3b570e2210875fdc8ffb29627d054f
  xe-pw-158688v1: 158688v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/index.html

--===============5339905916932708136==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: DC3CO support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158688/">https://patchwork.freedesktop.org/series/158688/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f_BAT -&gt; xe-pw-158688v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158688v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158688v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158688v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">DMESG-WARN</a> +53 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_debugfs@info-read}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/bat-adlp-7/igt@xe_debugfs@info-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/bat-adlp-7/igt@xe_debugfs@info-read.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158688v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f -&gt; xe-pw-158688v1</li>
</ul>
<p>IGT_8659: 8659<br />
  xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f: 48deab361d3b570e2210875fdc8ffb29627d054f<br />
  xe-pw-158688v1: 158688v1</p>

</body>
</html>

--===============5339905916932708136==--
