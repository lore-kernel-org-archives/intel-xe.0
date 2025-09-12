Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B098BCA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFE710EC7F;
	Fri, 12 Sep 2025 14:39:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B6B10EC7D;
 Fri, 12 Sep 2025 14:39:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4465271244229610477=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_Defeature_DRRS_?=
 =?utf-8?q?on_LNL+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Sep 2025 14:39:39 -0000
Message-ID: <175768797971.330263.8241644822080982770@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250912135926.18910-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250912135926.18910-1-ville.syrjala@linux.intel.com>
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

--===============4465271244229610477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Defeature DRRS on LNL+
URL   : https://patchwork.freedesktop.org/series/154463/
State : success

== Summary ==

CI Bug Log - changes from xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a_BAT -> xe-pw-154463v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-154463v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077]) +30 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#1024] / [Intel XE#784])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#1024] / [Intel XE#783])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#540]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([i915#1836]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#780])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#1024] / [Intel XE#1406]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][10] ([Intel XE#288]) +32 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#255])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         NOTRUN -> [SKIP][12] ([Intel XE#2229])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         NOTRUN -> [SKIP][13] ([Intel XE#977])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-atsm-2:         NOTRUN -> [SKIP][14] ([Intel XE#2838] / [Intel XE#979])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-atsm-2:         NOTRUN -> [SKIP][15] ([Intel XE#979])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * {igt@core_debugfs@read-all-entries}:
    - bat-atsm-2:         [ABORT][16] ([Intel XE#6122]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a/bat-atsm-2/igt@core_debugfs@read-all-entries.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@core_debugfs@read-all-entries.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][18] ([Intel XE#5783]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
#### Warnings ####

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][20] ([Intel XE#5563] / [Intel XE#688]) -> [SKIP][21] ([Intel XE#688])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
    - bat-adlp-vm:        [SKIP][22] ([Intel XE#5563] / [Intel XE#688]) -> [SKIP][23] ([Intel XE#688])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783
  [Intel XE#6122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6122
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_8537 -> IGT_8538
  * Linux: xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a -> xe-pw-154463v1

  IGT_8537: 8537
  IGT_8538: 8538
  xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a: 1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a
  xe-pw-154463v1: 154463v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/index.html

--===============4465271244229610477==
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
<tr><td><b>Series:</b></td><td>drm/i915: Defeature DRRS on LNL+</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154463/">https://patchwork.freedesktop.org/series/154463/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a_BAT -&gt; xe-pw-154463v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154463v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_debugfs@read-all-entries}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a/bat-atsm-2/igt@core_debugfs@read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6122">Intel XE#6122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-atsm-2/igt@core_debugfs@read-all-entries.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-simple:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154463v1/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8537 -&gt; IGT_8538</li>
<li>Linux: xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a -&gt; xe-pw-154463v1</li>
</ul>
<p>IGT_8537: 8537<br />
  IGT_8538: 8538<br />
  xe-3734-1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a: 1d4af05c0899ee6a00ba2bfdfb4c07aeef704f2a<br />
  xe-pw-154463v1: 154463v1</p>

</body>
</html>

--===============4465271244229610477==--
