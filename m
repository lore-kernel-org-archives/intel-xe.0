Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40DCCCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 21:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DC410E858;
	Wed, 22 Oct 2025 21:36:06 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A827C10E854;
 Wed, 22 Oct 2025 21:36:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4022187785237053558=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Take_in?=
 =?utf-8?q?to_account_AS_SDP_in_intel=5Fdp=5Fsdp=5Fmin=5Fguardband?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 21:36:05 -0000
Message-ID: <176116896566.44198.7896900642294806122@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251022122552.890090-1-jouni.hogander@intel.com>
In-Reply-To: <20251022122552.890090-1-jouni.hogander@intel.com>
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

--===============4022187785237053558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Take into account AS SDP in intel_dp_sdp_min_guardband
URL   : https://patchwork.freedesktop.org/series/156340/
State : success

== Summary ==

CI Bug Log - changes from xe-3968-74d9293d414f6967091764ccb2d2237d319558b5_BAT -> xe-pw-156340v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in xe-pw-156340v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-pvc-2:          NOTRUN -> [SKIP][1] ([Intel XE#2134]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@fbdev@eof.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][2] ([i915#6077]) +30 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#1024] / [Intel XE#784])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#540]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#1024] / [Intel XE#783])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#829]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#780])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-pvc-2:          NOTRUN -> [SKIP][10] ([Intel XE#1024] / [Intel XE#1406]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-pvc-2:          NOTRUN -> [SKIP][11] ([Intel XE#2849]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#1021]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#255])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#532])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-pvc-2:          NOTRUN -> [SKIP][15] ([Intel XE#2229]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#977]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][17] ([Intel XE#4578])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#979])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][19] ([Intel XE#531])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-pvc-2:          NOTRUN -> [SKIP][20] ([Intel XE#3342])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#4578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-3968-74d9293d414f6967091764ccb2d2237d319558b5 -> xe-pw-156340v1

  IGT_8594: 8594
  xe-3968-74d9293d414f6967091764ccb2d2237d319558b5: 74d9293d414f6967091764ccb2d2237d319558b5
  xe-pw-156340v1: 156340v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/index.html

--===============4022187785237053558==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Take into account AS SDP in intel_dp_sdp_min_guardband</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156340/">https://patchwork.freedesktop.org/series/156340/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3968-74d9293d414f6967091764ccb2d2237d319558b5_BAT -&gt; xe-pw-156340v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156340v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578">Intel XE#4578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156340v1/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3968-74d9293d414f6967091764ccb2d2237d319558b5 -&gt; xe-pw-156340v1</li>
</ul>
<p>IGT_8594: 8594<br />
  xe-3968-74d9293d414f6967091764ccb2d2237d319558b5: 74d9293d414f6967091764ccb2d2237d319558b5<br />
  xe-pw-156340v1: 156340v1</p>

</body>
</html>

--===============4022187785237053558==--
