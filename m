Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF880C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 08:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7077210E008;
	Mon,  5 Aug 2024 08:44:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC2910E008;
 Mon,  5 Aug 2024 08:44:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0335947733159748934=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/observation=3A_Drop_empt?=
 =?utf-8?q?y_sysctl_table_entry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 08:44:10 -0000
Message-ID: <172284745036.539969.2563401255811471831@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
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

--===============0335947733159748934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/observation: Drop empty sysctl table entry
URL   : https://patchwork.freedesktop.org/series/136874/
State : failure

== Summary ==

CI Bug Log - changes from xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71_full -> xe-pw-136874v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136874v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136874v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136874v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@core_getversion@all-cards.html
    - shard-lnl:          [PASS][3] -> [FAIL][4] +4 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@core_getversion@all-cards.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@core_getversion@all-cards.html
    - shard-adlp:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@core_getversion@all-cards.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@core_getversion@all-cards.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-adlp:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@core_setmaster@master-drop-set-root.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
    - shard-lnl:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@info:
    - shard-lnl:          [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@fbdev@info.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-lnl:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@fbdev@read.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [PASS][13] -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html

  
#### Warnings ####

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          [SKIP][15] ([Intel XE#1439]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          [FAIL][17] ([Intel XE#2028]) -> [INCOMPLETE][18] +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         [FAIL][19] ([Intel XE#1999]) -> [FAIL][20] +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [PASS][21] -> [DMESG-WARN][22] +4 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][23] +13 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - {shard-bmg}:        [SKIP][24] ([Intel XE#2252]) -> [SKIP][25] +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@dp-mst-type-1:
    - {shard-bmg}:        [SKIP][26] ([Intel XE#2390]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - {shard-bmg}:        NOTRUN -> [FAIL][28] +3 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - {shard-bmg}:        [FAIL][29] -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_content_protection@uevent.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - {shard-bmg}:        [SKIP][31] ([Intel XE#2320]) -> [SKIP][32] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_feature_discovery@psr1:
    - {shard-bmg}:        [SKIP][33] ([Intel XE#2374]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_lease@possible-crtcs-filtering:
    - {shard-bmg}:        [PASS][35] -> [SKIP][36] +68 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_lease@possible-crtcs-filtering.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - {shard-bmg}:        [SKIP][37] ([Intel XE#498]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - {shard-bmg}:        [SKIP][39] ([Intel XE#2318]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - {shard-bmg}:        [SKIP][41] ([Intel XE#2329]) -> [SKIP][42] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - {shard-bmg}:        [SKIP][43] ([Intel XE#1435]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@max-min:
    - {shard-bmg}:        [SKIP][45] ([Intel XE#1499]) -> [SKIP][46] +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_vrr@max-min.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - {shard-bmg}:        [SKIP][47] ([Intel XE#756]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_writeback@writeback-check-output.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_writeback@writeback-check-output.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [INCOMPLETE][49] -> [TIMEOUT][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [PASS][51] -> [TIMEOUT][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@xe_evict@evict-cm-threads-large.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        NOTRUN -> [TIMEOUT][53]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - {shard-bmg}:        [TIMEOUT][54] -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-7/igt@xe_evict@evict-threads-large.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - {shard-bmg}:        [SKIP][56] ([Intel XE#2322]) -> [SKIP][57] +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - {shard-bmg}:        NOTRUN -> [SKIP][58] +21 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - {shard-bmg}:        [PASS][59] -> [FAIL][60] +5 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - {shard-bmg}:        [SKIP][61] ([Intel XE#2419]) -> [SKIP][62] +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-7/igt@xe_oa@non-privileged-map-oa-buffer.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-regs-whitelisted:
    - {shard-bmg}:        [SKIP][63] ([Intel XE#2419]) -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@xe_oa@oa-regs-whitelisted.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s2idle-basic-exec:
    - {shard-bmg}:        [PASS][65] -> [INCOMPLETE][66] +6 other tests incomplete
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@xe_pm@s2idle-basic-exec.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_query@multigpu-query-topology:
    - {shard-bmg}:        [SKIP][67] ([Intel XE#944]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@xe_query@multigpu-query-topology.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_query@multigpu-query-topology.html

  
Known issues
------------

  Here are the changes found in xe-pw-136874v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         NOTRUN -> [ABORT][69] ([Intel XE#2418])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@core_hotunplug@hotrebind.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#1201] / [Intel XE#2134])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@fbdev@info.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#2134])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@fbdev@read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#623])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][74] ([Intel XE#1727] / [Intel XE#2226])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#1426]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#1659])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][81] -> [SKIP][82] ([Intel XE#2351]) +21 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1407]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][85] ([Intel XE#1725])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#316])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-adlp:         [PASS][87] -> [FAIL][88] ([Intel XE#1874])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][89] -> [FAIL][90] ([Intel XE#1231])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#607])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1477])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][93] ([Intel XE#1204])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][95] ([Intel XE#1231]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1124]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1124]) +8 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#2191]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#367])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#367])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1399]) +11 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#1252])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#1252])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#787]) +13 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [PASS][112] -> [SKIP][113] ([Intel XE#1201] / [Intel XE#2231]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_cdclk@mode-transition.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#314])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#314])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#314])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#373]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#306])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [i915#2575]) +10 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#373]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1468])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1413]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#308])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#308])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1424]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +21 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#309]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1201] / [Intel XE#323])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#2423]) +9 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#323])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#323])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#323])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#776])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1421]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [PASS][142] -> [SKIP][143] ([Intel XE#2423]) +41 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#2231])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#455]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1401]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#455]) +18 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-dg2-set2:     [PASS][150] -> [SKIP][151] ([i915#2575]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_force_connector_basic@force-connector-state.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1201] / [Intel XE#651]) +24 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#656]) +30 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#651]) +7 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [FAIL][156] ([Intel XE#1861])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1201] / [Intel XE#2231]) +10 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1201] / [Intel XE#656]) +26 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#658])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1469])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#651]) +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#2351]) +19 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#1201] / [Intel XE#653]) +25 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1201] / [Intel XE#658])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#653]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#1201] / [Intel XE#2351])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [PASS][168] -> [SKIP][169] ([Intel XE#1201] / [i915#2575]) +19 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][170] ([Intel XE#1035] / [Intel XE#1195])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][171] ([Intel XE#2078]) +3 other tests warn
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][172] -> [DMESG-WARN][173] ([Intel XE#324]) +6 other tests dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - shard-lnl:          [PASS][174] -> [DMESG-FAIL][175] ([Intel XE#324])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-adlp:         [PASS][176] -> [SKIP][177] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#599]) +10 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][179] ([Intel XE#1874]) +4 other tests fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][180] -> [FAIL][181] ([Intel XE#361])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#498]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2318]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][188] -> [INCOMPLETE][189] ([Intel XE#1195]) +2 other tests incomplete
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a-hdmi-a-6.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#2318]) +17 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#1201] / [Intel XE#870])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#1201] / [Intel XE#870])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][194] ([Intel XE#1201] / [Intel XE#836])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#1439])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][196] -> [SKIP][197] ([Intel XE#1201]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#1201] / [Intel XE#2446]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html
    - shard-lnl:          [PASS][199] -> [SKIP][200] ([Intel XE#2446]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#1406]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#929]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#1201]) +17 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][207] ([Intel XE#1201] / [Intel XE#327])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +14 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#1435])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#1201] / [Intel XE#362])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#362])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#1201] / [Intel XE#330])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][213] -> [FAIL][214] ([Intel XE#771] / [Intel XE#899])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][215] -> [FAIL][216] ([Intel XE#899]) +1 other test fail
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][217] ([Intel XE#1551]) +1 other test dmesg-warn
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#1201] / [Intel XE#2168])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#1499] / [Intel XE#599])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][220] ([Intel XE#1201] / [Intel XE#756])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#1091])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][223] -> [FAIL][224] ([Intel XE#2028]) +5 other tests fail
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#1201] / [Intel XE#1447])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][226] ([Intel XE#1050])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#1447])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#1123] / [Intel XE#1201])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#688]) +9 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][230] -> [TIMEOUT][231] ([Intel XE#1473] / [Intel XE#402])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][232] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][233] ([Intel XE#1473] / [Intel XE#392])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][234] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#1130] / [Intel XE#1201]) +28 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@many-bindexecqueue-userptr:
    - shard-adlp:         [PASS][237] -> [DMESG-WARN][238] ([Intel XE#2226]) +2 other tests dmesg-warn
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_exec_basic@many-bindexecqueue-userptr.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_basic@many-bindexecqueue-userptr.html

  * igt@xe_exec_basic@many-execqueues-null:
    - shard-adlp:         [PASS][239] -> [SKIP][240] ([Intel XE#1201]) +94 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][241] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#1392]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#1201]) +51 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@twice-null:
    - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#1130]) +21 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_exec_basic@twice-null.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][245] ([Intel XE#288]) +5 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][246] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][247] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#1130] / [Intel XE#1201]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][249] ([Intel XE#1962])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][250] -> [SKIP][251] ([Intel XE#1130]) +94 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][252] -> [SKIP][253] ([Intel XE#1192] / [Intel XE#1201])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][254] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][255] ([Intel XE#1201] / [Intel XE#2229])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][256] ([Intel XE#1201] / [Intel XE#2229])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][257] ([Intel XE#1999]) +2 other tests fail
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-adlp:         NOTRUN -> [FAIL][258] ([Intel XE#1204] / [Intel XE#2136])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][259] ([Intel XE#1204] / [Intel XE#2136])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_module_load@reload-no-display.html
    - shard-lnl:          NOTRUN -> [FAIL][260] ([Intel XE#2136])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#1201] / [Intel XE#2207]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@non-zero-reason:
    - shard-adlp:         NOTRUN -> [SKIP][262] ([Intel XE#1201] / [Intel XE#2207]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_oa@non-zero-reason.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][263] ([Intel XE#2207]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_oa@non-zero-reason.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][264] ([Intel XE#2259])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][265] ([Intel XE#1201] / [Intel XE#979])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][266] ([Intel XE#1195] / [Intel XE#1358])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][267] -> [SKIP][268] ([Intel XE#1130] / [Intel XE#1201]) +75 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-mocs:
    - shard-lnl:          [PASS][269] -> [FAIL][270] ([Intel XE#1924] / [Intel XE#2028])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@xe_pm@s2idle-mocs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][271] ([Intel XE#1551] / [Intel XE#569]) +1 other test dmesg-warn
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][272] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][273] ([Intel XE#2284] / [Intel XE#366])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][274] ([Intel XE#2284] / [Intel XE#366])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][275] -> [ABORT][276] ([Intel XE#1794])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_pm@s4-mocs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][278] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][279] ([Intel XE#944])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][280] ([Intel XE#944]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_vm@large-userptr-binds-4194304:
    - shard-adlp:         [PASS][281] -> [SKIP][282] ([Intel XE#1130] / [Intel XE#1201]) +36 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@xe_vm@large-userptr-binds-4194304.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_vm@large-userptr-binds-4194304.html

  * igt@xe_vm@scratch:
    - shard-dg2-set2:     [PASS][283] -> [SKIP][284] ([Intel XE#1130]) +4 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_vm@scratch.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_vm@scratch.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-adlp:         [FAIL][285] -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@core_getversion@basic.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@core_getversion@basic.html
    - {shard-bmg}:        [FAIL][287] -> [PASS][288] +4 other tests pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@core_getversion@basic.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@core_getversion@basic.html
    - shard-dg2-set2:     [FAIL][289] -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@core_getversion@basic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@core_getversion@basic.html

  * igt@kms_addfb_basic@small-bo:
    - shard-adlp:         [DMESG-WARN][291] ([Intel XE#2226]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_addfb_basic@small-bo.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_addfb_basic@small-bo.html

  * igt@kms_addfb_basic@too-wide:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][294] +12 other tests pass
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_addfb_basic@too-wide.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_addfb_basic@too-wide.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - {shard-bmg}:        [DMESG-WARN][295] -> [PASS][296] +3 other tests pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][297] ([Intel XE#1033]) -> [PASS][298] +1 other test pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-lnl:          [FAIL][299] ([Intel XE#1659]) -> [PASS][300] +1 other test pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201] / [Intel XE#2351]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - {shard-bmg}:        [INCOMPLETE][303] -> [PASS][304] +3 other tests pass
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - {shard-bmg}:        [SKIP][305] ([Intel XE#2231]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][307] ([Intel XE#1874]) -> [PASS][308] +1 other test pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][309] ([Intel XE#2351]) -> [PASS][310] +14 other tests pass
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1201]) -> [PASS][312] +7 other tests pass
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_lease@lease-unleased-crtc:
    - shard-lnl:          [SKIP][313] ([Intel XE#2423]) -> [PASS][314] +16 other tests pass
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@kms_lease@lease-unleased-crtc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [FAIL][315] ([Intel XE#2028]) -> [PASS][316] +8 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [i915#2575]) -> [PASS][318] +7 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_plane@pixel-format-source-clamping.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2-set2:     [INCOMPLETE][319] -> [PASS][320] +1 other test pass
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - {shard-bmg}:        [SKIP][321] ([Intel XE#2444]) -> [PASS][322] +2 other tests pass
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
    - shard-adlp:         [INCOMPLETE][323] ([Intel XE#1195]) -> [PASS][324] +1 other test pass
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [FAIL][325] ([Intel XE#1649]) -> [PASS][326] +1 other test pass
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         [FAIL][327] ([Intel XE#1174]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_sysfs_edid_timing.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][329] ([Intel XE#899]) -> [PASS][330] +1 other test pass
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][331] ([Intel XE#1523]) -> [PASS][332] +1 other test pass
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][333] ([Intel XE#2443]) -> [PASS][334] +1 other test pass
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_vrr@flipline.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][335] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][336] +1 other test pass
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr:
    - shard-dg2-set2:     [TIMEOUT][337] -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_exec_balancer@many-cm-virtual-userptr.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_exec_balancer@many-cm-virtual-userptr.html

  * igt@xe_exec_basic@many-execqueues-basic:
    - shard-adlp:         [SKIP][339] ([Intel XE#1201]) -> [PASS][340] +39 other tests pass
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_exec_basic@many-execqueues-basic.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_basic@many-execqueues-basic.html

  * igt@xe_exec_compute_mode@many-rebind:
    - shard-lnl:          [SKIP][341] ([Intel XE#1130]) -> [PASS][342] +46 other tests pass
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_exec_compute_mode@many-rebind.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@xe_exec_compute_mode@many-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - {shard-bmg}:        [SKIP][343] -> [PASS][344] +30 other tests pass
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][345] ([Intel XE#1191] / [Intel XE#2226]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-lnl:          [SKIP][349] ([Intel XE#2419]) -> [PASS][350] +17 other tests pass
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - {shard-bmg}:        [SKIP][351] ([Intel XE#2419]) -> [PASS][352] +21 other tests pass
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-5/igt@xe_oa@privileged-forked-access-vaddr.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-7/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@sysctl-defaults:
    - shard-adlp:         [SKIP][353] ([Intel XE#1201] / [Intel XE#2419]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_oa@sysctl-defaults.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_oa@sysctl-defaults.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-lnl:          [FAIL][355] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][356] +1 other test pass
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][357] ([Intel XE#1358]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@xe_pm@s4-basic.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_pm@s4-basic.html
    - shard-lnl:          [ABORT][359] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@xe_pm@s4-basic.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][361] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-dg2-set2:     [DMESG-WARN][363] ([Intel XE#2019]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_pm@s4-exec-after.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-lnl:          [FAIL][365] -> [PASS][366] +1 other test pass
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][367] ([Intel XE#958]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@query-invalid-uc-fw-version-mbz:
    - shard-adlp:         [SKIP][369] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][370] +12 other tests pass
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_query@query-invalid-uc-fw-version-mbz.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@xe_query@query-invalid-uc-fw-version-mbz.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [FAIL][371] ([Intel XE#1081]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_vm@large-binds-2147483648:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][374] +39 other tests pass
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_vm@large-binds-2147483648.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@xe_vm@large-binds-2147483648.html

  * igt@xe_vm@munmap-style-unbind-end:
    - {shard-bmg}:        [SKIP][375] ([Intel XE#1130]) -> [PASS][376] +6 other tests pass
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@xe_vm@munmap-style-unbind-end.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-4/igt@xe_vm@munmap-style-unbind-end.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][378] ([Intel XE#801]) +23 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          [SKIP][379] ([Intel XE#664]) -> [SKIP][380] ([Intel XE#2423])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_async_flips@test-cursor.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][382] ([Intel XE#455])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          [SKIP][383] ([Intel XE#1407]) -> [SKIP][384] ([Intel XE#2351]) +3 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][386] ([Intel XE#316]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][387] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][388] ([Intel XE#1201]) +9 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][390] ([Intel XE#1201] / [Intel XE#2351])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         [SKIP][391] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][392] ([Intel XE#1201])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#316]) -> [SKIP][394] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-adlp:         [SKIP][395] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][396] ([Intel XE#1201]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-adlp:         [SKIP][397] ([Intel XE#1201]) -> [SKIP][398] ([Intel XE#1201] / [Intel XE#316])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#1201]) -> [SKIP][400] ([Intel XE#1201] / [Intel XE#316])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-lnl:          [SKIP][401] ([Intel XE#2351]) -> [SKIP][402] ([Intel XE#1407])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][403] ([Intel XE#1201]) -> [FAIL][404] ([Intel XE#1874])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][405] ([Intel XE#324]) -> [FAIL][406] ([Intel XE#1231]) +1 other test fail
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][408] ([Intel XE#1124]) +5 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][409] ([Intel XE#2351]) -> [SKIP][410] ([Intel XE#1124]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][412] ([Intel XE#1124] / [Intel XE#1201])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][413] ([Intel XE#1231]) -> [SKIP][414] ([Intel XE#1201])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][416] ([Intel XE#1201] / [Intel XE#2351])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][417] ([Intel XE#1231]) -> [DMESG-FAIL][418] ([Intel XE#324])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1124]) -> [SKIP][420] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         [SKIP][421] ([Intel XE#1201]) -> [SKIP][422] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1124]) -> [SKIP][424] ([Intel XE#1201])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          [SKIP][425] ([Intel XE#1124]) -> [SKIP][426] ([Intel XE#2351]) +5 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1201]) -> [SKIP][428] ([Intel XE#1124] / [Intel XE#1201])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1124]) -> [SKIP][430] ([Intel XE#1201] / [Intel XE#2231])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][432] ([Intel XE#1201] / [Intel XE#2231]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][434] ([Intel XE#1201]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][436] ([Intel XE#346])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         [SKIP][437] ([Intel XE#1201]) -> [SKIP][438] ([Intel XE#1201] / [Intel XE#367])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1201] / [i915#2575]) -> [SKIP][440] ([Intel XE#1201] / [Intel XE#367])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][442] ([Intel XE#367]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          [SKIP][443] ([Intel XE#2191]) -> [SKIP][444] ([Intel XE#2423])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2191]) -> [SKIP][446] ([Intel XE#1201] / [Intel XE#2191])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         [SKIP][447] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][448] ([Intel XE#1201])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#367]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#367])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][452] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         [SKIP][453] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][454] ([Intel XE#1201]) +10 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][456] ([Intel XE#2231])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][458] ([Intel XE#1201] / [Intel XE#2231]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#1201]) -> [SKIP][460] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][462] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][464] ([Intel XE#1201]) +2 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][465] ([Intel XE#1399]) -> [SKIP][466] ([Intel XE#2351]) +10 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#787]) -> [SKIP][468] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][470] ([Intel XE#1201] / [Intel XE#2231])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         [SKIP][471] ([Intel XE#1201]) -> [SKIP][472] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-lnl:          [SKIP][473] ([Intel XE#2351]) -> [SKIP][474] ([Intel XE#1399]) +2 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][476] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][478] ([Intel XE#787]) +48 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][479] ([Intel XE#314] / [Intel XE#599]) -> [SKIP][480] ([Intel XE#2351])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_cdclk@mode-transition.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_cdclk@mode-transition.html
    - shard-adlp:         [SKIP][481] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) -> [SKIP][482] ([Intel XE#1201])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_cdclk@mode-transition.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][484] ([Intel XE#306])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         [SKIP][485] ([Intel XE#1201]) -> [SKIP][486] ([Intel XE#1201] / [Intel XE#306])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_chamelium_color@ctm-red-to-blue.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][488] ([Intel XE#1201] / [Intel XE#306])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-lnl:          [SKIP][489] ([Intel XE#2423]) -> [SKIP][490] ([Intel XE#306])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_chamelium_color@ctm-red-to-blue.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         [SKIP][491] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][492] ([Intel XE#1201]) +9 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#373]) -> [SKIP][494] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1201] / [i915#2575]) -> [SKIP][496] ([Intel XE#373])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         [SKIP][497] ([Intel XE#1201]) -> [SKIP][498] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_chamelium_frames@dp-crc-single.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][500] ([Intel XE#373])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-single.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-lnl:          [SKIP][501] ([Intel XE#2423]) -> [SKIP][502] ([Intel XE#373]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_chamelium_frames@dp-crc-single.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#373]) -> [SKIP][504] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][506] ([Intel XE#373]) +2 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          [SKIP][507] ([Intel XE#373]) -> [SKIP][508] ([Intel XE#2423]) +9 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][510] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +3 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][512] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         [SKIP][513] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][514] ([Intel XE#1201])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_content_protection@dp-mst-type-1.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][516] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html
    - shard-lnl:          [SKIP][517] ([Intel XE#307]) -> [SKIP][518] ([Intel XE#2423])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         [SKIP][519] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][520] ([Intel XE#1201]) +10 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_content_protection@legacy.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][521] ([Intel XE#599]) -> [SKIP][522] ([Intel XE#2423]) +3 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_content_protection@uevent.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][524] ([Intel XE#308])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][526] ([Intel XE#1201] / [i915#2575])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-lnl:          [SKIP][527] ([Intel XE#1413]) -> [SKIP][528] ([Intel XE#2423]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][529] ([Intel XE#1424]) -> [SKIP][530] ([Intel XE#2423]) +2 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         [SKIP][531] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][532] ([Intel XE#1201]) +1 other test skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][534] ([i915#2575])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-adlp:         [SKIP][535] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][536] ([Intel XE#1201]) +3 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-lnl:          [SKIP][537] ([Intel XE#309]) -> [SKIP][538] ([Intel XE#2423]) +2 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][540] ([Intel XE#323])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][542] ([Intel XE#455]) +6 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][544] ([Intel XE#1201])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats.html
    - shard-lnl:          [SKIP][545] ([Intel XE#599]) -> [SKIP][546] ([Intel XE#2351])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#455]) -> [SKIP][548] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][549] ([Intel XE#2028]) -> [SKIP][550] ([Intel XE#2351])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][552] ([Intel XE#1201] / [i915#2575])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          [SKIP][553] ([Intel XE#701]) -> [SKIP][554] ([Intel XE#2423])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@kms_feature_discovery@chamelium.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         [SKIP][555] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][556] ([Intel XE#1201])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_feature_discovery@chamelium.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][558] ([Intel XE#1137])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         [SKIP][559] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][560] ([Intel XE#1201])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_feature_discovery@psr1.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         [SKIP][561] ([Intel XE#1201]) -> [SKIP][562] ([Intel XE#1135] / [Intel XE#1201])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_feature_discovery@psr2.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][564] ([Intel XE#1135] / [Intel XE#1201])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_feature_discovery@psr2.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         [SKIP][565] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][566] ([Intel XE#1201]) +5 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-lnl:          [SKIP][567] ([Intel XE#1421]) -> [SKIP][568] ([Intel XE#2423]) +5 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          [SKIP][569] ([Intel XE#2423]) -> [SKIP][570] ([Intel XE#1421]) +3 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_flip@2x-flip-vs-modeset.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][571] ([Intel XE#2019]) -> [INCOMPLETE][572] ([Intel XE#1195] / [Intel XE#2019])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         [SKIP][573] ([Intel XE#1201]) -> [SKIP][574] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][575] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [SKIP][576] ([Intel XE#1201] / [i915#2575])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][577] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][578] ([Intel XE#2351]) +1 other test skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][580] ([Intel XE#2231])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][582] ([Intel XE#1201] / [Intel XE#2351])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-lnl:          [SKIP][583] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][584] ([Intel XE#2351]) +2 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-adlp:         [DMESG-FAIL][585] ([Intel XE#324]) -> [SKIP][586] ([Intel XE#1201])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#1201]) -> [SKIP][588] ([Intel XE#1201] / [Intel XE#455])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          [SKIP][589] ([Intel XE#2351]) -> [SKIP][590] ([Intel XE#1401] / [Intel XE#1745])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#1201] / [i915#5274]) -> [SKIP][592] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-lnl:          [SKIP][593] ([Intel XE#352]) -> [SKIP][594] ([Intel XE#2423]) +1 other test skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][596] ([Intel XE#1201] / [Intel XE#2351]) +3 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][597] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][598] ([Intel XE#1201]) +11 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#651]) -> [SKIP][600] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][601] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][602] ([Intel XE#1201]) +26 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][604] ([Intel XE#651]) +13 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][606] ([Intel XE#1201] / [Intel XE#651])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#651]) -> [SKIP][608] ([Intel XE#1201])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][609] ([Intel XE#1201]) -> [SKIP][610] ([Intel XE#1201] / [Intel XE#656]) +10 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#1201]) -> [SKIP][612] ([Intel XE#651])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-lnl:          [SKIP][613] ([Intel XE#2351]) -> [SKIP][614] ([Intel XE#651]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][616] ([Intel XE#1201] / [Intel XE#2231]) +7 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
    - shard-lnl:          [SKIP][617] ([Intel XE#651]) -> [SKIP][618] ([Intel XE#2351]) +10 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][619] ([Intel XE#1201]) -> [FAIL][620] ([Intel XE#1861])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][621] ([Intel XE#2351]) -> [SKIP][622] ([Intel XE#656]) +9 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#651]) -> [SKIP][624] ([Intel XE#1201] / [Intel XE#2351])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][626] ([Intel XE#2231])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][628] ([Intel XE#651])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#651]) -> [SKIP][630] ([Intel XE#1201] / [Intel XE#2231])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][632] ([Intel XE#1201]) +7 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#1201]) -> [SKIP][634] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         [SKIP][635] ([Intel XE#1201]) -> [SKIP][636] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#1201]) -> [SKIP][638] ([Intel XE#1201] / [Intel XE#2231]) +2 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][640] ([Intel XE#1201] / [Intel XE#2231]) +6 other tests skip
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
    - shard-lnl:          [SKIP][641] ([Intel XE#656]) -> [SKIP][642] ([Intel XE#2351]) +20 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][644] ([Intel XE#1201]) +2 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#653]) -> [SKIP][646] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         [SKIP][647] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][648] ([Intel XE#1201]) +6 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         [SKIP][649] ([Intel XE#1201]) -> [SKIP][650] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][652] ([Intel XE#1201] / [Intel XE#653])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][654] ([Intel XE#653]) +16 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-adlp:         [FAIL][655] -> [SKIP][656] ([Intel XE#1201] / [Intel XE#653])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#1201]) -> [SKIP][658] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#653]) -> [SKIP][660] ([Intel XE#1201])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-rte.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#1201]) -> [SKIP][662] ([Intel XE#653])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         [SKIP][663] ([Intel XE#1201] / [Intel XE#1341]) -> [SKIP][664] ([Intel XE#1201])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][666] ([Intel XE#1201] / [i915#2575])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          [SKIP][667] ([Intel XE#605]) -> [SKIP][668] ([Intel XE#2423])
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_getfb@getfb-reject-ccs.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][669] ([Intel XE#1201] / [i915#2575]) -> [SKIP][670] ([Intel XE#1201] / [Intel XE#417])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html
    - shard-lnl:          [SKIP][671] ([Intel XE#2423]) -> [SKIP][672] ([Intel XE#1470])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html
    - shard-adlp:         [SKIP][673] ([Intel XE#1201]) -> [SKIP][674] ([Intel XE#1201] / [Intel XE#417])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#1201] / [i915#2575]) -> [SKIP][676] ([Intel XE#1201] / [Intel XE#455])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_panel_fitting@atomic-fastset.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [SKIP][677] ([Intel XE#1201]) -> [INCOMPLETE][678] ([Intel XE#1035] / [Intel XE#1195])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-WARN][679] ([Intel XE#324]) -> [DMESG-FAIL][680] ([Intel XE#324])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][681] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][682] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          [SKIP][683] ([Intel XE#2423]) -> [SKIP][684] ([Intel XE#599])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         [SKIP][685] ([Intel XE#1201]) -> [SKIP][686] ([Intel XE#1201] / [Intel XE#309])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-lnl:          [SKIP][687] ([Intel XE#2423]) -> [SKIP][688] ([Intel XE#309])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         [SKIP][689] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][690] ([Intel XE#1201])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-dg2-set2:     [SKIP][691] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][692] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-lnl:          [SKIP][693] ([Intel XE#498]) -> [SKIP][694] ([Intel XE#2423]) +1 other test skip
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][696] ([Intel XE#2318]) +2 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][697] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][698] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-lnl:          [SKIP][699] ([Intel XE#2423]) -> [SKIP][700] ([Intel XE#2318]) +1 other test skip
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          [SKIP][701] ([Intel XE#2318]) -> [SKIP][702] ([Intel XE#2423]) +1 other test skip
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-adlp:         [SKIP][703] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][704] ([Intel XE#1201])
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][705] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][706] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][707] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][708] ([Intel XE#1129])
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][710] ([Intel XE#1201] / [Intel XE#908])
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
    - shard-lnl:          [SKIP][711] ([Intel XE#2351]) -> [FAIL][712] ([Intel XE#1430])
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         [SKIP][713] ([Intel XE#1201]) -> [FAIL][714] ([Intel XE#718])
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         [SKIP][715] ([Intel XE#1201] / [Intel XE#836]) -> [SKIP][716] ([Intel XE#1201])
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][717] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][718] ([Intel XE#1489])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][719] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][720] ([Intel XE#1201] / [Intel XE#2231])
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][721] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][722] ([Intel XE#1201]) +1 other test skip
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][724] ([Intel XE#1489])
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][725] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][726] ([Intel XE#2231])
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][727] ([Intel XE#1128]) -> [SKIP][728] ([Intel XE#2351])
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-adlp:         [SKIP][729] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][730] ([Intel XE#1201])
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     [SKIP][731] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][732] ([Intel XE#1201])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][733] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][734] ([Intel XE#1122])
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][735] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][736] ([Intel XE#1201]) +1 other test skip
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         [SKIP][737] ([Intel XE#1201]) -> [SKIP][738] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          [SKIP][739] ([Intel XE#2351]) -> [SKIP][740] ([Intel XE#1406]) +1 other test skip
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-adlp:         [SKIP][741] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][742] ([Intel XE#1201]) +3 other tests skip
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-render.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-render.html
    - shard-lnl:          [SKIP][743] ([Intel XE#1406]) -> [SKIP][744] ([Intel XE#2351])
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-render.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][745] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][746] ([Intel XE#1201] / [Intel XE#2231]) +3 other tests skip
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][747] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][748] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][749] ([Intel XE#1201]) -> [SKIP][750] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][751] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][752] ([Intel XE#929]) +9 other tests skip
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][753] ([Intel XE#929]) -> [SKIP][754] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][755] ([Intel XE#1149]) -> [SKIP][756] ([Intel XE#1149] / [Intel XE#1201])
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [FAIL][757] ([Intel XE#1874]) -> [SKIP][758] ([Intel XE#1201]) +2 other tests skip
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][759] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][760] ([Intel XE#1201] / [i915#2575])
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-lnl:          [SKIP][761] ([Intel XE#1127]) -> [SKIP][762] ([Intel XE#2423])
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][763] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][764] ([Intel XE#1127])
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][765] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][766] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +2 other tests skip
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-lnl:          [SKIP][767] ([Intel XE#1437]) -> [SKIP][768] ([Intel XE#2423]) +2 other tests skip
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][769] ([Intel XE#1127]) -> [SKIP][770] ([Intel XE#1127] / [Intel XE#1201])
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][771] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][772] ([Intel XE#327])
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         [SKIP][773] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][774] ([Intel XE#1201]) +2 other tests skip
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          [SKIP][775] ([Intel XE#374] / [Intel XE#599]) -> [SKIP][776] ([Intel XE#2423])
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-none.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          [SKIP][777] ([Intel XE#1435]) -> [SKIP][778] ([Intel XE#2423])
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_setmode@basic-clone-single-crtc.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][779] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][780] ([Intel XE#1500])
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][781] ([Intel XE#2443]) -> [SKIP][782] ([Intel XE#2423]) +1 other test skip
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_vrr@flip-basic.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][783] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][784] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_vrr@flip-dpms.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-dg2-set2:     [SKIP][785] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][786] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +2 other tests skip
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_vrr@max-min.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         [SKIP][787] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][788] ([Intel XE#1201]) +1 other test skip
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_writeback@writeback-check-output.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_writeback@writeback-check-output.html
    - shard-dg2-set2:     [SKIP][789] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][790] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][791] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][792] ([Intel XE#1201] / [i915#2575])
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          [SKIP][793] ([Intel XE#756]) -> [SKIP][794] ([Intel XE#2423]) +1 other test skip
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_writeback@writeback-fb-id.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         [SKIP][795] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][796] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_ccs@block-multicopy-compressed.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         [SKIP][797] ([Intel XE#1201]) -> [SKIP][798] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_compute_preempt@compute-preempt-many.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][799] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][800] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][801] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][802] ([Intel XE#1473] / [Intel XE#392])
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - shard-lnl:          [SKIP][803] ([Intel XE#688]) -> [SKIP][804] ([Intel XE#1130]) +4 other tests skip
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-adlp:         [SKIP][805] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][806] ([Intel XE#1201]) +4 other tests skip
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_evict@evict-beng-large-multi-vm.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][807] ([Intel XE#1195] / [Intel XE#1473]) -> [TIMEOUT][808] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         [SKIP][809] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][810] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - shard-lnl:          [SKIP][811] ([Intel XE#1130]) -> [SKIP][812] ([Intel XE#688]) +1 other test skip
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][813] ([Intel XE#1600]) -> [SKIP][814] ([Intel XE#1130] / [Intel XE#1201])
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-small-external:
    - shard-adlp:         [SKIP][815] ([Intel XE#1201]) -> [SKIP][816] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_evict@evict-small-external.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         [SKIP][817] ([Intel XE#1201]) -> [SKIP][818] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          [SKIP][819] ([Intel XE#1130]) -> [SKIP][820] ([Intel XE#1392]) +1 other test skip
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         [SKIP][821] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][822] ([Intel XE#1201]) +6 other tests skip
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          [SKIP][823] ([Intel XE#1392]) -> [SKIP][824] ([Intel XE#1130]) +5 other tests skip
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
    - shard-adlp:         [SKIP][825] ([Intel XE#1201]) -> [SKIP][826] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
    - shard-dg2-set2:     [SKIP][827] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][828] ([Intel XE#288]) +1 other test skip
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         [SKIP][829] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][830] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
    - shard-dg2-set2:     [SKIP][831] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][832] ([Intel XE#1130] / [Intel XE#1201]) +12 other tests skip
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         [SKIP][833] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][834] ([Intel XE#1201]) +12 other tests skip
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][835] ([Intel XE#288]) -> [SKIP][836] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][837] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][838] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-adlp:         [SKIP][839] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][840] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][841] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][842] ([Intel XE#288]) +13 other tests skip
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][843] ([Intel XE#288]) -> [SKIP][844] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][845] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][846] ([Intel XE#2360])
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][847] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][848] ([Intel XE#560])
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-adlp:         [SKIP][849] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][850] ([Intel XE#1201]) +3 other tests skip
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_oa@invalid-oa-format-id.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][851] ([Intel XE#2419]) -> [SKIP][852] ([Intel XE#1201] / [Intel XE#2207]) +1 other test skip
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_oa@mi-rpc.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][853] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][854] ([Intel XE#2207]) +2 other tests skip
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@xe_oa@missing-sample-flags.html
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][855] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][856] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html
    - shard-lnl:          [SKIP][857] ([Intel XE#2419]) -> [SKIP][858] ([Intel XE#1130]) +2 other tests skip
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@xe_oa@non-privileged-map-oa-buffer.html
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [SKIP][859] ([Intel XE#2419]) -> [FAIL][860] ([Intel XE#2259])
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted.html
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][861] ([Intel XE#2419]) -> [SKIP][862] ([Intel XE#2207])
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html
    - shard-lnl:          [SKIP][863] ([Intel XE#2419]) -> [SKIP][864] ([Intel XE#2248])
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][865] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][866] ([Intel XE#1201] / [Intel XE#2207]) +12 other tests skip
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         [SKIP][867] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][868] ([Intel XE#1201] / [Intel XE#2207]) +18 other tests skip
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_oa@privileged-forked-access-vaddr.html
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@stress-open-close:
    - shard-dg2-set2:     [SKIP][869] ([Intel XE#2419]) -> [SKIP][870] ([Intel XE#1130] / [Intel XE#1201])
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_oa@stress-open-close.html
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_oa@stress-open-close.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][871] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][872] ([Intel XE#1130] / [Intel XE#1201])
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][873] ([Intel XE#977]) -> [SKIP][874] ([Intel XE#1201] / [Intel XE#977])
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][875] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][876] ([Intel XE#979])
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][877] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][878] ([Intel XE#2284] / [Intel XE#366])
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][879] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][880] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
    - shard-lnl:          [SKIP][881] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][882] ([Intel XE#1130]) +1 other test skip
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@xe_pm@d3cold-mmap-vram.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         [SKIP][883] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][884] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [SKIP][885] ([Intel XE#1130]) -> [FAIL][886] ([Intel XE#1924] / [Intel XE#2028])
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_pm@s2idle-multiple-execs.html
   [886]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          [SKIP][887] ([Intel XE#1130]) -> [SKIP][888] ([Intel XE#584])
   [887]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@xe_pm@s3-exec-after.html
   [888]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][889] ([Intel XE#1794]) -> [SKIP][890] ([Intel XE#1130] / [Intel XE#1201])
   [889]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [890]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         [SKIP][891] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][892] ([Intel XE#1201] / [Intel XE#944])
   [891]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_query@multigpu-query-config.html
   [892]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_query@multigpu-query-config.html
    - shard-dg2-set2:     [SKIP][893] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][894] ([Intel XE#944])
   [893]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_query@multigpu-query-config.html
   [894]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_query@multigpu-query-config.html
    - shard-lnl:          [SKIP][895] ([Intel XE#1130]) -> [SKIP][896] ([Intel XE#944])
   [895]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@xe_query@multigpu-query-config.html
   [896]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     [SKIP][897] ([Intel XE#944]) -> [SKIP][898] ([Intel XE#1201] / [Intel XE#944])
   [897]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html
   [898]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][899] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][900] ([Intel XE#944]) +1 other test skip
   [899]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html
   [900]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][901] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][902] ([Intel XE#1130] / [Intel XE#1201])
   [901]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [902]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_query@multigpu-query-topology.html
    - shard-lnl:          [SKIP][903] ([Intel XE#944]) -> [SKIP][904] ([Intel XE#1130])
   [903]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_query@multigpu-query-topology.html
   [904]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_query@multigpu-query-topology.html
    - shard-adlp:         [SKIP][905] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][906] ([Intel XE#1130] / [Intel XE#1201])
   [905]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_query@multigpu-query-topology.html
   [906]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_query@multigpu-query-topology.html

  * igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:
    - shard-adlp:         [SKIP][907] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][908] ([Intel XE#2226]) +1 other test dmesg-warn
   [907]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html
   [908]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2259
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2362
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2429
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2444
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7954 -> IGT_7955
  * Linux: xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 -> xe-pw-136874v1

  IGT_7954: a22f1dab2c2604f9678e4b27ba40bee7dcce9dfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7955: e12a8eebdc4bc7e073f2bfad88dc627006ac5771 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71: 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71
  xe-pw-136874v1: 136874v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/index.html

--===============0335947733159748934==
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
<tr><td><b>Series:</b></td><td>drm/xe/observation: Drop empty sysctl table entry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136874/">https://patchwork.freedesktop.org/series/136874/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71_full -&gt; xe-pw-136874v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136874v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136874v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136874v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@core_getversion@all-cards.html">FAIL</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@core_getversion@all-cards.html">FAIL</a> +4 other tests fail</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@core_getversion@all-cards.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@core_setmaster@master-drop-set-root.html">FAIL</a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html">FAIL</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@core_setmaster@master-drop-set-root.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@fbdev@info.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@fbdev@read.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">DMESG-WARN</a> +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_content_protection@uevent.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_feature_discovery@psr1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_lease@possible-crtcs-filtering.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html">SKIP</a> +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@kms_writeback@writeback-check-output.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-7/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@xe_evict@evict-threads-large.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-7/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-6/igt@xe_query@multigpu-query-topology.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136874v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_addfb_basic@legacy-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_cdclk@mode-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +3 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_evict@evict-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_evict@evict-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_exec_basic@many-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_basic@many-bindexecqueue-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_exec_basic@twice-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2259">Intel XE#2259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_pm@s2idle-mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-4194304:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@xe_vm@large-userptr-binds-4194304.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_vm@large-userptr-binds-4194304.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@scratch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_vm@scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_vm@scratch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@core_getversion@basic.html">PASS</a></li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-2/igt@core_getversion@basic.html">PASS</a> +4 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_addfb_basic@small-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_addfb_basic@small-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_addfb_basic@too-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_addfb_basic@too-wide.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@kms_lease@lease-unleased-crtc.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2444">Intel XE#2444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-50:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_exec_balancer@many-cm-virtual-userptr.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_exec_balancer@many-cm-virtual-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_exec_basic@many-execqueues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_basic@many-execqueues-basic.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_exec_compute_mode@many-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@xe_exec_compute_mode@many-rebind.html">PASS</a> +46 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-5/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-7/igt@xe_oa@privileged-forked-access-vaddr.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@sysctl-defaults:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_oa@sysctl-defaults.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_oa@sysctl-defaults.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_pm@s4-basic.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_query@query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@xe_query@query-invalid-uc-fw-version-mbz.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-2147483648:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_vm@large-binds-2147483648.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@xe_vm@large-binds-2147483648.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-2/igt@xe_vm@munmap-style-unbind-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-bmg-4/igt@xe_vm@munmap-style-unbind-end.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +7 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +6 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-433/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-3/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_evict@evict-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-2/igt@xe_evict@evict-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-466/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2259">Intel XE#2259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-1/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_oa@stress-open-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_oa@stress-open-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-9/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_pm@s2idle-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-2/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-8/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-dg2-463/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-lnl-8/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-2/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-1/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136874v1/shard-adlp-6/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7954 -&gt; IGT_7955</li>
<li>Linux: xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 -&gt; xe-pw-136874v1</li>
</ul>
<p>IGT_7954: a22f1dab2c2604f9678e4b27ba40bee7dcce9dfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7955: e12a8eebdc4bc7e073f2bfad88dc627006ac5771 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71: 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71<br />
  xe-pw-136874v1: 136874v1</p>

</body>
</html>

--===============0335947733159748934==--
