Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6911CA0EEB
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 00:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B97710E02C;
	Wed, 20 Aug 2025 00:22:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EDF10E02C;
 Wed, 20 Aug 2025 00:22:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4447603950477669649=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Use_trans_push_mechanism_t?=
 =?utf-8?q?o_generate_frame_change_event_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Aug 2025 00:22:44 -0000
Message-ID: <175564936414.250192.10581302762726064431@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819070353.3062341-1-jouni.hogander@intel.com>
In-Reply-To: <20250819070353.3062341-1-jouni.hogander@intel.com>
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

--===============4447603950477669649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use trans push mechanism to generate frame change event (rev7)
URL   : https://patchwork.freedesktop.org/series/139831/
State : failure

== Summary ==

CI Bug Log - changes from xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee_FULL -> xe-pw-139831v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139831v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139831v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139831v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@xe_exec_system_allocator@once-large-mmap-new-race:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +3 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@xe_exec_system_allocator@once-large-mmap-new-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-1/igt@xe_exec_system_allocator@once-large-mmap-new-race.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@xe_pmu@all-fn-engine-activity-load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-1/igt@xe_pmu@all-fn-engine-activity-load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-race}:
    - shard-bmg:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-race.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-139831v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#623])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#316]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#610])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#4543]) +2 other tests dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#607]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2191])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +160 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2907])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#3124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][29] ([Intel XE#1727] / [Intel XE#3113])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#4416]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2325]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#306]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#307])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#3304])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#1178])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1188]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_content_protection@uevent.html
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2341])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2320])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#308])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2321])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2291])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#5299])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1508])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1340]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4354])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#2953] / [Intel XE#4173]) +9 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2373])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#703])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1138])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][56] -> [INCOMPLETE][57] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2316]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2316]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@dpms-off-confusion@c-hdmi-a1:
    - shard-adlp:         [PASS][61] -> [DMESG-WARN][62] ([Intel XE#4543]) +4 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-2/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#301]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#4543] / [Intel XE#5208])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][69] -> [DMESG-WARN][70] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2293] / [Intel XE#2380])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][73] -> [FAIL][74] ([Intel XE#1874])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2311]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#651]) +12 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#656])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#5390]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#651]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2312]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#653]) +12 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2313]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#1503])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_hdr@static-swap.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#3012])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_mmap_write_crc@main:
    - shard-lnl:          [PASS][87] -> [ABORT][88] ([Intel XE#5902]) +1 other test abort
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-2/igt@kms_mmap_write_crc@main.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-5/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#455]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#5021])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2763]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#870])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1489] / [Intel XE#5899])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1489] / [Intel XE#5899]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1122] / [Intel XE#5899])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#5899]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_psr@pr-dpms.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#3414]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#3414] / [Intel XE#3904])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#1499])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1126]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4837]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4837]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [PASS][106] -> [INCOMPLETE][107] ([Intel XE#4842])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2322]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#1392]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@once-userptr:
    - shard-bmg:          [PASS][111] -> [DMESG-FAIL][112] ([Intel XE#3876])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@xe_exec_basic@once-userptr.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-1/igt@xe_exec_basic@once-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#288]) +8 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4943]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4943])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-1/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4915]) +97 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][117] -> [DMESG-WARN][118] ([Intel XE#5893])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#586])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][120] -> [DMESG-WARN][121] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5244])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@xe_module_load@many-reload.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#3573]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#979])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2284] / [Intel XE#366])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2284]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][126] -> [INCOMPLETE][127] ([Intel XE#569])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@xe_pm@s3-mocs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@xe_pm@s3-mocs.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][128] ([Intel XE#3876])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#4733])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#4733]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#944])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4351])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][133] ([Intel XE#4543]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][135] ([Intel XE#3862]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][137] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][139] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][141] ([Intel XE#2291]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][143] ([Intel XE#2316]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@dpms-off-confusion@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][145] ([Intel XE#4543]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@kms_flip@dpms-off-confusion@b-hdmi-a1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-2/igt@kms_flip@dpms-off-confusion@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][147] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][149] ([Intel XE#301]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-adlp:         [DMESG-WARN][151] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][153] ([Intel XE#1503]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][155] ([Intel XE#4692] / [Intel XE#5899]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [FAIL][157] ([Intel XE#2883]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-7/igt@kms_setmode@basic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-2/igt@kms_setmode@basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1392]) -> [PASS][160] +3 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@once-userptr:
    - shard-adlp:         [DMESG-FAIL][161] ([Intel XE#3876]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_exec_basic@once-userptr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@xe_exec_basic@once-userptr.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
    - shard-bmg:          [FAIL][163] -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [FAIL][165] -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset:
    - shard-lnl:          [FAIL][167] -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-4/igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-8/igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][169] ([Intel XE#3876]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][171] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_decode0:
    - shard-adlp:         [TIMEOUT][173] ([Intel XE#3876]) -> [PASS][174] +2 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_decode0.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][175] ([Intel XE#5166]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@xe_pmu@gt-frequency.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-adlp:         [SKIP][177] -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][180] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][181] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][182] ([Intel XE#2705] / [Intel XE#4212])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][183] ([Intel XE#1178]) -> [SKIP][184] ([Intel XE#2341])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_content_protection@legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#2311]) +9 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][187] ([Intel XE#2311]) -> [SKIP][188] ([Intel XE#2312]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][189] ([Intel XE#5390]) -> [SKIP][190] ([Intel XE#2312]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][191] ([Intel XE#2312]) -> [SKIP][192] ([Intel XE#5390]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][193] ([Intel XE#2312]) -> [SKIP][194] ([Intel XE#2313]) +9 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][195] ([Intel XE#2313]) -> [SKIP][196] ([Intel XE#2312]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][197] ([Intel XE#3544]) -> [SKIP][198] ([Intel XE#3374] / [Intel XE#3544])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][199] ([Intel XE#4596]) -> [SKIP][200] ([Intel XE#5021])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][201] ([Intel XE#2509]) -> [SKIP][202] ([Intel XE#2426])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         [DMESG-FAIL][203] ([Intel XE#3876]) -> [SKIP][204] ([Intel XE#1392] / [Intel XE#5575])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][205] ([Intel XE#1173]) -> [SKIP][206] ([Intel XE#1061])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-433/igt@xe_peer2peer@write.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5244
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
  [Intel XE#5902]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5902
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee -> xe-pw-139831v7

  IGT_8496: acea60af09e5f4b3cb0cd6838c23ef1e92c17323 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee: 25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee
  xe-pw-139831v7: 139831v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/index.html

--===============4447603950477669649==
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
<tr><td><b>Series:</b></td><td>Use trans push mechanism to generate frame c=
hange event (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/139831/">https://patchwork.freedesktop.org/series/139831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139831v7/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139831v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949d=
fafe9ee_FULL -&gt; xe-pw-139831v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139831v7_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-139831v7_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1398=
31v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-433/igt@kms_hd=
r@static-toggle-suspend@pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-436/igt@kms_hdr=
@static-toggle-suspend@pipe-a-dp-4.html">INCOMPLETE</a> +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@xe_exec_=
system_allocator@once-large-mmap-new-race.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-1/igt@xe_=
exec_system_allocator@once-large-mmap-new-race.html">FAIL</a> +3 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@xe_pmu@a=
ll-fn-engine-activity-load.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-1/igt@xe_pmu@all-fn-engi=
ne-activity-load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-race}:=
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-many-large-malloc-prefetch-race.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shar=
d-bmg-1/igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-rac=
e.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139831v7_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/s=
hard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-=
tiled-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#312=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-=
tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@kms_content_protection@srm@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_cursor_crc@cursor-random-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid=
-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-3/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1340">Intel XE#1340</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@kms_fbc=
on_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139831v7/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +9 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-8/=
igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049=
">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_flip@2x-plain-flip-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@kms_fli=
p@dpms-off-confusion@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-2/igt@kms_flip@dpms=
-off-confusion@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-3/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139831v7/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139831v7/shard-dg2-464/igt@kms_flip@flip-vs-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Inte=
l XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-8/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-2/igt@kms_mmap=
_write_crc@main.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-lnl-5/igt@kms_mmap_write_crc@main.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5902">Intel XE#5902</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_plane_lowres@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_plane_multiple@2x-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5899">Intel XE#5899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@kms_psr@pr-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5899">Intel XE#5899</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_rotation_crc@primary-ro=
tation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-8/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_copy_basic@mem-set-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@xe_eudebug_online@breakpoint-=
many-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-464/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Int=
el XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@xe_exec_=
basic@once-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139831v7/shard-bmg-1/igt@xe_exec_basic@once-userptr=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@xe_exec_system_allocator@many=
-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-lnl-1/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-435/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-4=
64/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-2/igt@xe_module_load@many-relo=
ad.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5244">Intel XE#5244</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@xe_oa@invalid-remove-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-435/igt@xe_pm@d3cold-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@xe_pm@s3=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139831v7/shard-bmg-4/igt@xe_pm@s3-mocs.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#5=
69</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_pxp@display-pxp-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-bmg-2/igt@xe_pxp@regular-src-to-pxp-des=
t-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_query@multigpu-query-inv=
alid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@xe_sriov_scheduling@equal-t=
hroughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139831v7/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-464/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel =
XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139831v7/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-cc=
s@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-463/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/i=
gt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg=
-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@kms_fli=
p@dpms-off-confusion@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp=
-2/igt@kms_flip@dpms-off-confusion@b-hdmi-a1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1398=
31v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39831v7/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-7/igt@kms_hdr@invalid-hdr=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-1/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel X=
E#5899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139831v7/shard-lnl-4/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-7/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-2/igt@kms_setmode@basic.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg=
2-466/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">PASS</a> +3 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_exec=
_basic@once-userptr.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@xe_e=
xec_basic@once-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@xe_exec_=
compute_mode@many-bindexecqueue-rebind.html">FAIL</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@xe_exe=
c_compute_mode@many-bindexecqueue-rebind.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidat=
e:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_exec=
_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">FAIL</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v=
7/shard-adlp-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userp=
tr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-lnl-4/igt@xe_exec_=
system_allocator@many-malloc-bo-unmap-nomemset.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-lnl-8/ig=
t@xe_exec_system_allocator@many-malloc-bo-unmap-nomemset.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-432/igt@xe_exe=
c_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/=
shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-3/igt@xe_pm@s=
2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE=
#4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139831v7/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_=
decode0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_pmu@=
all-fn-engine-activity-load@engine-drm_xe_engine_class_video_decode0.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3876">Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@xe_pmu@all-fn-engine-activity-loa=
d@engine-drm_xe_engine_class_video_decode0.html">PASS</a> +2 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-432/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5166">Intel XE#5166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-466/igt@xe_pmu@gt-frequ=
ency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets.html">SKIP</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-adlp-8/igt@xe_sri=
ov_scheduling@nonpreempt-engine-resets.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-4=
33/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/270=
5">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139831v7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
831v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39831v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v=
7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39831v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1398=
31v7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-3/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v7/sha=
rd-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-adlp-8/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">=
Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-139831v7/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-m=
any-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee/shard-dg2-433/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139831v7/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee -&gt; xe-pw-139=
831v7</li>
</ul>
<p>IGT_8496: acea60af09e5f4b3cb0cd6838c23ef1e92c17323 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee: 25c75d2d7cac2a2e7dc32df=
5a7a0f949dfafe9ee<br />
  xe-pw-139831v7: 139831v7</p>

</body>
</html>

--===============4447603950477669649==--
