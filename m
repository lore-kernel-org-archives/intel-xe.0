Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAF2CCF9E9
	for <intel-xe@archiver.kernel.org>; Sun, 26 Oct 2025 18:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF2D10E0D1;
	Sun, 26 Oct 2025 18:43:50 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF2010E0D1;
 Sun, 26 Oct 2025 18:43:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8795492356146781152=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/fb-helper=3A_Allocate_a?=
 =?utf-8?q?nd_release_fb=5Finfo_in_single_place?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 26 Oct 2025 18:43:49 -0000
Message-ID: <176150422900.55853.261192444682501392@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251026173944.219373-1-tzimmermann@suse.de>
In-Reply-To: <20251026173944.219373-1-tzimmermann@suse.de>
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

--===============8795492356146781152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/fb-helper: Allocate and release fb_info in single place
URL   : https://patchwork.freedesktop.org/series/156543/
State : success

== Summary ==

CI Bug Log - changes from xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5_BAT -> xe-pw-156543v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156543v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#2134]) -> [PASS][2] +4 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@fbdev@nullptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#2351]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [SKIP][9] -> [PASS][10] +205 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][11] -> [SKIP][12] ([Intel XE#623])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#2351]) -> [SKIP][14] ([Intel XE#455])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#1406] / [Intel XE#2351]) -> [SKIP][16] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][17] -> [SKIP][18] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][19] -> [SKIP][20] ([Intel XE#288]) +32 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][21] -> [SKIP][22] ([Intel XE#255])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][23] -> [SKIP][24] ([Intel XE#977])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][25] -> [SKIP][26] ([Intel XE#2838] / [Intel XE#979])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-dg2-oem2:       [SKIP][27] -> [SKIP][28] ([Intel XE#979])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-dg2-oem2:       [SKIP][29] -> [SKIP][30] ([Intel XE#3342])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5 -> xe-pw-156543v1

  IGT_8596: 8596
  xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5: 8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5
  xe-pw-156543v1: 156543v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/index.html

--===============8795492356146781152==
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
<tr><td><b>Series:</b></td><td>drm/fb-helper: Allocate and release fb_info in single place</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156543/">https://patchwork.freedesktop.org/series/156543/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5_BAT -&gt; xe-pw-156543v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156543v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> +205 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156543v1/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5 -&gt; xe-pw-156543v1</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3987-8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5: 8073f707a19ca8d5ecfff60ce8db8a70bc1eeba5<br />
  xe-pw-156543v1: 156543v1</p>

</body>
</html>

--===============8795492356146781152==--
