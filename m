Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05BFC3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 01:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7C310E0E8;
	Sat, 17 Aug 2024 01:50:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A4F10E02D;
 Sat, 17 Aug 2024 01:50:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1577898960975504591=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B01/12?=
 =?utf-8?q?=5D_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 17 Aug 2024 01:50:44 -0000
Message-ID: <172385944428.659138.6884044322070412158@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
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

--===============1577898960975504591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk
URL   : https://patchwork.freedesktop.org/series/137398/
State : failure

== Summary ==

CI Bug Log - changes from xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425_full -> xe-pw-137398v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137398v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137398v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137398v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [PASS][1] -> [ABORT][2] +33 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@runner@aborted:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-433/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-466/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-466/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-463/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-434/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-432/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-433/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-435/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-434/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-463/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-466/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-463/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-433/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-435/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-432/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-432/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-435/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-433/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-463/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-466/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-432/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-463/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-434/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-435/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-435/igt@runner@aborted.html
    - shard-lnl:          NOTRUN -> ([FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-1/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-1/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-6/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-3/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-5/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-6/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-4/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-5/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-1/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-8/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-7/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-4/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-6/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-2/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-8/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-7/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-8/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-3/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-6/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-2/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-4/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-5/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-7/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-3/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-2/igt@runner@aborted.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-adlp:         [PASS][53] -> [FAIL][54] +8 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-adlp:         [PASS][55] -> [DMESG-WARN][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-adlp:         [SKIP][57] ([Intel XE#1201] / [Intel XE#455]) -> [ABORT][58] +1 other test abort
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-6/igt@kms_content_protection@uevent.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-8/igt@kms_content_protection@uevent.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][59] ([Intel XE#771] / [Intel XE#899]) -> [ABORT][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {shard-bmg}:        NOTRUN -> ([FAIL][61], [FAIL][62], [FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84], [FAIL][85])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-3/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-7/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-5/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-4/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-5/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-2/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-6/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-1/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-4/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-3/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-6/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-1/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-5/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-7/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-3/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-4/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-8/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-6/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-8/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-2/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-8/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-6/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-137398v1_full that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][86] ([Intel XE#899]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][88] ([Intel XE#1231]) -> [DMESG-FAIL][89] ([Intel XE#324])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899


Build changes
-------------

  * Linux: xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425 -> xe-pw-137398v1

  IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425: cfdb0d68f7d07eecfafb5fda99e6dc313359d425
  xe-pw-137398v1: 137398v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/index.html

--===============1577898960975504591==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [01/12] drm/xe: Removed=
 unused xe_ggtt_printk</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/137398/">https://patchwork.freedesktop.org/series/137398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-137398v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137398v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313=
359d425_full -&gt; xe-pw-137398v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137398v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-137398v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1373=
98v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-6/igt@kms_cur=
sor_crc@cursor-offscreen-128x42.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-9/igt@kms_cursor_c=
rc@cursor-offscreen-128x42.html">ABORT</a> +33 other tests abort</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137398v1/shard-dg2-433/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/sh=
ard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-466/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7398v1/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-434/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137398v1/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-433/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-137398v1/shard-dg2-435/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg=
2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-463/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1=
/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-463/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137398v1/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-435/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-137398v1/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-432/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137398v1/shard-dg2-435/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard=
-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-463/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13739=
8v1/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-432/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137398v1/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-434/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137398v1/shard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-dg2-4=
35/igt@runner@aborted.html">FAIL</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137398v1/shard-lnl-1/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shar=
d-lnl-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-6/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1=
/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-5/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
398v1/shard-lnl-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137398v1/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-1/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137398v1/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-7/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-137398v1/shard-lnl-4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-6/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-137398v1/shard-lnl-2/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl=
-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137398v1/shard-lnl-7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shar=
d-lnl-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-3/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1=
/shard-lnl-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
398v1/shard-lnl-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-5/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137398v1/shard-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-lnl-3/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137398v1/shard-lnl-2/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-4/igt@sriov_b=
asic@enable-vfs-autoprobe-off@numvfs-all.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-2/igt@sri=
ov_basic@enable-vfs-autoprobe-off@numvfs-all.html">FAIL</a> +8 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-8/igt@sriov_b=
asic@enable-vfs-bind-unbind-each-numvfs-all.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-8/igt@=
sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-6/igt@kms_con=
tent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adlp-8=
/igt@kms_content_protection@uevent.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-4/igt@kms_uni=
versal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-adl=
p-6/igt@kms_universal_plane@cursor-fb-leak.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@runner@aborted:<ul>
<li>{shard-bmg}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137398v1/shard-bmg-3/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shar=
d-bmg-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-5/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1=
/shard-bmg-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-5/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
398v1/shard-bmg-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-6/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137398v1/shard-bmg-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-4/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137398v1/shard-bmg-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-6/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-137398v1/shard-bmg-1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-5/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-137398v1/shard-bmg-7/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg=
-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137398v1/shard-bmg-4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shar=
d-bmg-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-1/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1=
/shard-bmg-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
398v1/shard-bmg-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137398v1/shard-bmg-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard-bmg-8/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137398v1/shard-bmg-6/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137398v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-4/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/shard=
-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#12=
31</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7398v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-a=
sync-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425 -&gt; xe-pw-137=
398v1</li>
</ul>
<p>IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425: cfdb0d68f7d07eecfafb5fd=
a99e6dc313359d425<br />
  xe-pw-137398v1: 137398v1</p>

</body>
</html>

--===============1577898960975504591==--
