Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A885C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 19:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E039510E356;
	Thu, 11 Jan 2024 19:13:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128F110E356;
 Thu, 11 Jan 2024 19:13:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6217926468839097767=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Allow_to_exclude_part_?=
 =?utf-8?q?of_GGTT_from_allocations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 11 Jan 2024 19:13:18 -0000
Message-ID: <170500039807.290000.12393143665221931404@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111182559.629-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240111182559.629-1-michal.wajdeczko@intel.com>
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

--===============6217926468839097767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Allow to exclude part of GGTT from allocations
URL   : https://patchwork.freedesktop.org/series/128686/
State : failure

== Summary ==

CI Bug Log - changes from xe-618-79184e72263e91528195db01783148435c7e4fad_BAT -> xe-pw-128686v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-128686v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128686v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-128686v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-128686v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#288]) +6 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  
#### Possible fixes ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-atsm-2:         [FAIL][6] ([Intel XE#1099]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-atsm-2:         [INCOMPLETE][8] ([Intel XE#506]) -> [SKIP][9] ([Intel XE#288])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
  [Intel XE#1099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/506


Build changes
-------------

  * IGT: IGT_7669 -> IGT_7670
  * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-pw-128686v1

  IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
  xe-pw-128686v1: 128686v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/index.html

--===============6217926468839097767==
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
<tr><td><b>Series:</b></td><td>drm/xe: Allow to exclude part of GGTT from allocations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128686/">https://patchwork.freedesktop.org/series/128686/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-618-79184e72263e91528195db01783148435c7e4fad_BAT -&gt; xe-pw-128686v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-128686v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-128686v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-128686v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128686v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099">Intel XE#1099</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/506">Intel XE#506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7669 -&gt; IGT_7670</li>
<li>Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -&gt; xe-pw-128686v1</li>
</ul>
<p>IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad<br />
  xe-pw-128686v1: 128686v1</p>

</body>
</html>

--===============6217926468839097767==--
