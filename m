Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5698AFC9ECD
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 04:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162F810E077;
	Sat,  7 Mar 2026 04:44:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33B010E077;
 Sat,  7 Mar 2026 04:44:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0720484852614955733=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Extra_enabling_patches_for_?=
 =?utf-8?q?NVL-P_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Mar 2026 04:44:39 -0000
Message-ID: <177285867963.329328.3860846525135783569@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
In-Reply-To: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
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

--===============0720484852614955733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extra enabling patches for NVL-P (rev2)
URL   : https://patchwork.freedesktop.org/series/162666/
State : success

== Summary ==

CI Bug Log - changes from xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_BAT -> xe-pw-162666v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (3): bat-wcl-1 bat-dg2-oem2 bat-atsm-2 
  Missing    (2): bat-bmg-2 bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-162666v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([Intel XE#2134]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@fbdev@info.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-wcl-1:          NOTRUN -> [SKIP][2] ([Intel XE#7245])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#623])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([i915#6077]) +30 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#1024] / [Intel XE#782] / [Intel XE#947]) +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#2244] / [Intel XE#455])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([Intel XE#1024] / [Intel XE#784] / [Intel XE#947])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-wcl-1:          NOTRUN -> [SKIP][8] ([Intel XE#7244])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#1024] / [Intel XE#783] / [Intel XE#947])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         NOTRUN -> [SKIP][10] ([Intel XE#540]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#829] / [i915#1836]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][12] ([Intel XE#780])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         NOTRUN -> [SKIP][14] ([Intel XE#1024] / [Intel XE#947]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][15] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-wcl-1:          NOTRUN -> [SKIP][16] ([Intel XE#7238]) +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-wcl-1:          NOTRUN -> [SKIP][17] ([Intel XE#7482]) +17 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][18] ([Intel XE#288]) +32 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][19] ([Intel XE#288]) +32 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][20] ([Intel XE#255])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         NOTRUN -> [SKIP][21] ([Intel XE#255])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][22] ([Intel XE#2229])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-atsm-2:         NOTRUN -> [SKIP][23] ([Intel XE#2229])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-wcl-1:          NOTRUN -> [SKIP][24] ([Intel XE#7239]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-wcl-1:          NOTRUN -> [SKIP][25] ([Intel XE#7243])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         NOTRUN -> [SKIP][26] ([Intel XE#977])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][27] ([Intel XE#977])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-wcl-1:          NOTRUN -> [SKIP][28] ([Intel XE#7247])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][29] ([Intel XE#2838] / [Intel XE#979])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][30] ([Intel XE#2838] / [Intel XE#979])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-wcl-1:          NOTRUN -> [SKIP][31] ([Intel XE#7242])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-wcl-1:          NOTRUN -> [SKIP][32] ([Intel XE#7248])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][33] ([Intel XE#979])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         NOTRUN -> [SKIP][34] ([Intel XE#979])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][35] ([Intel XE#3342])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       NOTRUN -> [TIMEOUT][36] ([Intel XE#6506])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][37] ([Intel XE#6520])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238
  [Intel XE#7239]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243
  [Intel XE#7244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7244
  [Intel XE#7245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245
  [Intel XE#7247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247
  [Intel XE#7248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_8783 -> IGT_8784
  * Linux: xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a -> xe-pw-162666v2

  IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8784: c7d12b3499ef1698373f246748e68c05ada0579e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a: fce8d7fb2107068c269b868d51aba5f9cf85998a
  xe-pw-162666v2: 162666v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/index.html

--===============0720484852614955733==
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
<tr><td><b>Series:</b></td><td>Extra enabling patches for NVL-P (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162666/">https://patchwork.freedesktop.org/series/162666/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_BAT -&gt; xe-pw-162666v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (3): bat-wcl-1 bat-dg2-oem2 bat-atsm-2 <br />
  Missing    (2): bat-bmg-2 bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162666v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7244">Intel XE#7244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8783 -&gt; IGT_8784</li>
<li>Linux: xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a -&gt; xe-pw-162666v2</li>
</ul>
<p>IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8784: c7d12b3499ef1698373f246748e68c05ada0579e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a: fce8d7fb2107068c269b868d51aba5f9cf85998a<br />
  xe-pw-162666v2: 162666v2</p>

</body>
</html>

--===============0720484852614955733==--
