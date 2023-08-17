Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE22C27C7A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 12:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B956E10E460;
	Thu, 17 Aug 2023 12:12:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F06DE10E45E;
 Thu, 17 Aug 2023 12:12:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E90A3AADEB;
 Thu, 17 Aug 2023 12:12:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7869744255607923343=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Thu, 17 Aug 2023 12:12:58 -0000
Message-ID: <169227437891.12434.5283880971845368287@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/pv?=
 =?utf-8?q?c=3A_Add_Wa=5F16017236439_=28rev2=29?=
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

--===============7869744255607923343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pvc: Add Wa_16017236439 (rev2)
URL   : https://patchwork.freedesktop.org/series/121028/
State : success

== Summary ==

CI Bug Log - changes from xe-325-c605cfb9a29a5425541053b45efddbe9751cbad3_BAT -> xe-pw-121028v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  Additional (1): bat-atsm-2 
  Missing    (1): bat-dg2-oem2 

Known issues
------------

  Here are the changes found in xe-pw-121028v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077]) +24 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#274]) +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#275]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#277]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([i915#1836]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#273])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([i915#1072]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_psr@sprite_plane_onoff.html

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#288]) +17 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][10] ([Intel XE#255])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@dmabuf:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#483]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@xe_live_ktest@dmabuf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/252
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/273
  [Intel XE#274]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/274
  [Intel XE#275]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/275
  [Intel XE#277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/277
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7441 -> IGT_7442
  * Linux: xe-325-c605cfb9a29a5425541053b45efddbe9751cbad3 -> xe-pw-121028v2

  IGT_7441: 152bb04fd1297075b5d0b1c4487dac8e9a70d070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7442: f6eea5a02525d62d10596408d1175c83d6f4038e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-325-c605cfb9a29a5425541053b45efddbe9751cbad3: c605cfb9a29a5425541053b45efddbe9751cbad3
  xe-pw-121028v2: 121028v2



--===============7869744255607923343==
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
<tr><td><b>Series:</b></td><td>drm/xe/pvc: Add Wa_16017236439 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121028/">https://patchwork.freedesktop.org/series/121028/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

</table>


    <h1>CI Bug Log - changes from xe-325-c605cfb9a29a5425541053b45efddbe9751cbad3_BAT -&gt; xe-pw-121028v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>Additional (1): bat-atsm-2 <br />
  Missing    (1): bat-dg2-oem2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-121028v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/274">Intel XE#274</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/275">Intel XE#275</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/273">Intel XE#273</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/252">Intel XE#252</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@dmabuf:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121028v2/bat-atsm-2/igt@xe_live_ktest@dmabuf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7441 -&gt; IGT_7442</li>
<li>Linux: xe-325-c605cfb9a29a5425541053b45efddbe9751cbad3 -&gt; xe-pw-121028v2</li>
</ul>
<p>IGT_7441: 152bb04fd1297075b5d0b1c4487dac8e9a70d070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7442: f6eea5a02525d62d10596408d1175c83d6f4038e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-325-c605cfb9a29a5425541053b45efddbe9751cbad3: c605cfb9a29a5425541053b45efddbe9751cbad3<br />
  xe-pw-121028v2: 121028v2</p>

</body>
</html>

--===============7869744255607923343==--
