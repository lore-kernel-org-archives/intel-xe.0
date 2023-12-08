Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119B2C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 23:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65C910EB61;
	Fri,  8 Dec 2023 23:42:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E148010EB57;
 Fri,  8 Dec 2023 23:42:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D9760AA3D8;
 Fri,  8 Dec 2023 23:42:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1122013409586886562=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B01/13=5D?=
 =?utf-8?q?_drm/sched=3A_Rename_drm=5Fsched=5Fget=5Fcleanup=5Fjob_to_be_more?=
 =?utf-8?q?_descriptive?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Dec 2023 23:42:35 -0000
Message-ID: <170207895586.7325.9479442864742719162@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
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

--===============1122013409586886562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [01/13] drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
URL   : https://patchwork.freedesktop.org/series/127581/
State : failure

== Summary ==

CI Bug Log - changes from xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9_BAT -> xe-pw-127581v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127581v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127581v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127581v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-pvc-2:          [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] +296 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde:
    - bat-pvc-2:          [PASS][7] -> [DMESG-WARN][8] +1404 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde.html

  * igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde:
    - bat-dg2-oem2:       [PASS][9] -> [DMESG-WARN][10] +783 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde.html

  * igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde:
    - bat-atsm-2:         [PASS][11] -> [DMESG-WARN][12] +725 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-atsm-2/igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-atsm-2/igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#480]) -> [DMESG-WARN][14] +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][15] ([Intel XE#1007]) -> [DMESG-FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][17] ([Intel XE#400] / [Intel XE#616]) -> [DMESG-FAIL][18] +2 other tests dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1:
    - bat-adlp-7:         [FAIL][19] ([Intel XE#1006]) -> [DMESG-FAIL][20] +4 other tests dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][21] ([Intel XE#524]) -> [DMESG-FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][23] ([Intel XE#524]) -> [DMESG-FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][25] ([Intel XE#1000]) -> [DMESG-FAIL][26] +3 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1006
  [Intel XE#1007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1007
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * IGT: IGT_7629 -> IGT_7630
  * Linux: xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9 -> xe-pw-127581v1

  IGT_7629: 1dd73105a01e092da7954f9552ec0c67ed8a9f4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7630: 9ea2b15cc16155e347d7d89e3f3b0f5b5c301439 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9: 1fc141d1f445b8e5ab4ff14645b0482dd98460b9
  xe-pw-127581v1: 127581v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/index.html

--===============1122013409586886562==
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
<tr><td><b>Series:</b></td><td>series starting with [01/13] drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127581/">https://patchwork.freedesktop.org/series/127581/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9_BAT -&gt; xe-pw-127581v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127581v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127581v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127581v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_create@create-execqueues-leak:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html">DMESG-WARN</a> +296 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde.html">DMESG-WARN</a> +1404 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde.html">DMESG-WARN</a> +783 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-atsm-2/igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-atsm-2/igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde.html">DMESG-WARN</a> +725 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1007">Intel XE#1007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1006">Intel XE#1006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1.html">DMESG-FAIL</a> +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">DMESG-FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">DMESG-FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127581v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7629 -&gt; IGT_7630</li>
<li>Linux: xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9 -&gt; xe-pw-127581v1</li>
</ul>
<p>IGT_7629: 1dd73105a01e092da7954f9552ec0c67ed8a9f4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7630: 9ea2b15cc16155e347d7d89e3f3b0f5b5c301439 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9: 1fc141d1f445b8e5ab4ff14645b0482dd98460b9<br />
  xe-pw-127581v1: 127581v1</p>

</body>
</html>

--===============1122013409586886562==--
