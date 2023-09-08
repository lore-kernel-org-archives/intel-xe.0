Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8BFEEB56E
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 21:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3869810E95D;
	Fri,  8 Sep 2023 21:19:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3294A10E95D;
 Fri,  8 Sep 2023 21:19:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 336BBA66C9;
 Fri,  8 Sep 2023 21:19:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6812812649623143041=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Sep 2023 21:19:04 -0000
Message-ID: <169420794417.14897.7511949886120624147@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230908203302.449041-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Some_uapi?=
 =?utf-8?q?_alignment_in_response_to_the_uapi_review?=
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

--===============6812812649623143041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Some uapi alignment in response to the uapi review
URL   : https://patchwork.freedesktop.org/series/123463/
State : failure

== Summary ==

CI Bug Log - changes from xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459_BAT -> xe-pw-123463v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123463v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123463v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123463v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-7:         NOTRUN -> [FAIL][1] +13 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@kms_psr@primary_page_flip.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-dg2-oem2:       [PASS][2] -> [FAIL][3] +20 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - bat-atsm-2:         [PASS][4] -> [FAIL][5] +17 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][6] -> [FAIL][7] +7 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_intel_bb@create-in-region:
    - bat-adlp-7:         [PASS][8] -> [FAIL][9] +156 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][10] ([Intel XE#609]) -> [FAIL][11] +2 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][12] ([Intel XE#609]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][14] ([Intel XE#480]) -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][16] ([Intel XE#608]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [INCOMPLETE][18] ([Intel XE#632]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][20] ([Intel XE#400]) -> [FAIL][21] +2 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][22] ([Intel XE#389]) -> [FAIL][23] +3 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
    - bat-adlp-7:         [SKIP][24] ([Intel XE#261]) -> [FAIL][25] +15 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][26] ([Intel XE#482]) -> [FAIL][27] +3 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][28] ([Intel XE#288]) -> [FAIL][29] +17 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][30] ([Intel XE#263]) -> [FAIL][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_mmap@vram.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_mmap@vram.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:
    - bat-adlp-7:         [SKIP][32] ([Intel XE#288]) -> [FAIL][33] +14 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][34] -> [FAIL][35] +13 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
Known issues
------------

  Here are the changes found in xe-pw-123463v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-atsm-2:         NOTRUN -> [SKIP][36] ([i915#6077])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-atsm-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [SKIP][37] ([Intel XE#483]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-dg2-oem2:       [FAIL][38] ([i915#2346]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][40] ([Intel XE#524]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7476 -> IGT_7477
  * Linux: xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459 -> xe-pw-123463v1

  IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7477: 7477
  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68020896bdbe0cab459
  xe-pw-123463v1: 123463v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/index.html

--===============6812812649623143041==
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
<tr><td><b>Series:</b></td><td>Some uapi alignment in response to the uapi review</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123463/">https://patchwork.freedesktop.org/series/123463/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459_BAT -&gt; xe-pw-123463v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123463v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123463v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123463v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@kms_psr@primary_page_flip.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +156 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +15 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123463v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-atsm-2/igt@kms_addfb_basic@addfb25-4-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-adlp-7/igt@xe_live_ktest@migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123463v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7476 -&gt; IGT_7477</li>
<li>Linux: xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459 -&gt; xe-pw-123463v1</li>
</ul>
<p>IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7477: 7477<br />
  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68020896bdbe0cab459<br />
  xe-pw-123463v1: 123463v1</p>

</body>
</html>

--===============6812812649623143041==--
