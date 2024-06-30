Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D510DC27C4F
	for <intel-xe@archiver.kernel.org>; Sun, 30 Jun 2024 20:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71910E07A;
	Sun, 30 Jun 2024 20:12:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CE210E033;
 Sun, 30 Jun 2024 20:12:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1762325261334322387=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_lean_exhaustive_evict?=
 =?utf-8?q?ion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 30 Jun 2024 20:12:19 -0000
Message-ID: <171977833958.409.13525991034399914098@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240630184727.3417-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240630184727.3417-1-thomas.hellstrom@linux.intel.com>
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

--===============1762325261334322387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: lean exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/135570/
State : failure

== Summary ==

CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_full -> xe-pw-135570v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135570v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135570v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135570v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][1] +4 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][2] -> [ABORT][3] +26 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-adlp:         NOTRUN -> [ABORT][4] +3 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - shard-adlp:         [PASS][5] -> [ABORT][6] +21 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@xe_vm@munmap-style-unbind-one-partial.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-8/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0}:
    - {shard-lnl}:        [PASS][7] -> [ABORT][8] +17 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
    - shard-adlp:         [WARN][9] ([Intel XE#2078]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-1:
    - {shard-lnl}:        NOTRUN -> [ABORT][11] +10 other tests abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-135570v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#787]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#310])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-2/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#653])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#1392])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][20] -> [ABORT][21] ([Intel XE#1358])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
    - shard-adlp:         [PASS][22] -> [ABORT][23] ([Intel XE#1358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@xe_pm@s3-basic-exec.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-2/igt@xe_pm@s3-basic-exec.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [DMESG-WARN][24] ([Intel XE#1214]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_vblank@query-idle@pipe-d-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][26] ([Intel XE#1195]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_vblank@query-idle@pipe-d-hdmi-a-1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-6/igt@kms_vblank@query-idle@pipe-d-hdmi-a-1.html

  
#### Warnings ####

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][28] ([Intel XE#1035] / [Intel XE#1195]) -> [ABORT][29] ([Intel XE#1035])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#1760]) -> [ABORT][31] ([Intel XE#1760])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@xe_wedged@basic-wedged.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_7907 -> IGT_7908
  * Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -> xe-pw-135570v1

  IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7908: 7908
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299
  xe-pw-135570v1: 135570v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/index.html

--===============1762325261334322387==
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
<tr><td><b>Series:</b></td><td>drm/xe: lean exhaustive eviction</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135570/">https://patchwork.freedesktop.org/series/135570/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_full -&gt; xe-pw-135570v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135570v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135570v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135570v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">ABORT</a> +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html">ABORT</a> +26 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-8/igt@xe_vm@munmap-style-unbind-one-partial.html">ABORT</a> +21 other tests abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">ABORT</a> +17 other tests abort</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-1.html">ABORT</a> +10 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135570v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-2/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-2/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_vblank@query-idle@pipe-d-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-6/igt@kms_vblank@query-idle@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/shard-adlp-4/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7907 -&gt; IGT_7908</li>
<li>Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -&gt; xe-pw-135570v1</li>
</ul>
<p>IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7908: 7908<br />
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299<br />
  xe-pw-135570v1: 135570v1</p>

</body>
</html>

--===============1762325261334322387==--
