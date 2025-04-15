Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FA6C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 22:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BFD10E396;
	Tue, 15 Apr 2025 22:55:06 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6D410E396;
 Tue, 15 Apr 2025 22:55:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2318044295460900620=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe=5Fvm=3A_Implemen?=
 =?utf-8?q?t_xe=5Fvm=5Fget=5Fproperty=5Fioctl_=28rev20=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 22:55:04 -0000
Message-ID: <174475770495.8361.1781249178436594625@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415153823.102926-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250415153823.102926-1-jonathan.cavitt@intel.com>
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

--===============2318044295460900620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev20)
URL   : https://patchwork.freedesktop.org/series/145529/
State : failure

== Summary ==

CI Bug Log - changes from xe-2955-f031245c01c722de43e8a02c2358140de0685428_FULL -> xe-pw-145529v20_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145529v20_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145529v20_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145529v20_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@xe_oa@polling-small-buf:
    - shard-lnl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_oa@polling-small-buf.html

  
Known issues
------------

  Here are the changes found in xe-pw-145529v20_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - shard-lnl:          [PASS][4] -> [ABORT][5] ([Intel XE#4624])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-6/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@kms_addfb_basic@unused-offsets:
    - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#4173])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-8/igt@kms_addfb_basic@unused-offsets.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-8/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#3768])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#3225])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#787]) +153 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#787]) +14 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4502] / [Intel XE#4522])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#2907])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2907])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#306])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#373]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3278])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1188])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#308])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1424])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2291]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#309]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#309]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][41] -> [SKIP][42] ([Intel XE#309]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#309])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4354])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [PASS][45] -> [SKIP][46] ([Intel XE#4354])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2244])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2373])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1421])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][51] -> [FAIL][52] ([Intel XE#3321]) +3 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#301]) +3 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#310]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#310]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#310]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2316]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][63] -> [FAIL][64] ([Intel XE#3098])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-2/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-8/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#455]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#651]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#651]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#656]) +9 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4141]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#651]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#656]) +6 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2313]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#653]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#656]) +12 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][79] ([Intel XE#4658]) +3 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#870])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#870])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#836])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_pm_rpm@dpms-non-lpsp.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1489]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1489])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1489])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2234] / [Intel XE#2850])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#3414])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#3414] / [Intel XE#3904])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#455])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_vrr@negative-basic.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2905])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#2905]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_eudebug@basic-vm-bind.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2905]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-small-external:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#688])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#1392]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1392]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1392])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#288]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#288]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#4541])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-3/igt@xe_oa@buffer-size.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-5/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-lnl:          NOTRUN -> [FAIL][107] ([Intel XE#4541])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1337])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][110] -> [ABORT][111] ([Intel XE#1794])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#4733])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#944])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#944])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#944])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#944]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#2191]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][119] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][121] ([Intel XE#2291]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#309]) -> [PASS][124] +6 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][125] ([Intel XE#1475]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#4302]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#3009]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_dp_aux_dev.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#310]) -> [PASS][132] +6 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][133] ([Intel XE#2316]) -> [PASS][134] +3 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][135] ([Intel XE#301]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][137] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][139] ([Intel XE#3098]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-2/igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp2.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-8/igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-dp2:
    - shard-bmg:          [FAIL][141] ([Intel XE#2882]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-2/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-dp2.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-8/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#656]) -> [PASS][144] +13 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][145] ([Intel XE#4596]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#4596]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#836]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#455]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1392]) -> [PASS][154] +4 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-adlp:         [DMESG-WARN][155] ([Intel XE#4173]) -> [PASS][156] +3 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][157] ([Intel XE#1999]) -> [PASS][158] +2 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][159] ([Intel XE#1794]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][161] ([Intel XE#1794]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [FAIL][163] -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-7/igt@xe_pmu@gt-frequency.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-5/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][165] ([Intel XE#4543]) -> [DMESG-FAIL][166] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][168] ([Intel XE#787]) +15 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#787]) -> [SKIP][170] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4440]) -> [SKIP][174] ([Intel XE#4418])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][175] ([Intel XE#1178]) -> [SKIP][176] ([Intel XE#455]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#455]) -> [FAIL][178] ([Intel XE#1178])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_content_protection@srm.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][179] ([Intel XE#3321]) -> [SKIP][180] ([Intel XE#2316])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][181] ([Intel XE#2882] / [Intel XE#3098]) -> [FAIL][182] ([Intel XE#3098])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2312]) -> [SKIP][184] ([Intel XE#2311]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#4141]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#651]) -> [SKIP][188] ([Intel XE#656]) +14 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#656]) -> [SKIP][190] ([Intel XE#651]) +22 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][191] ([Intel XE#2311]) -> [SKIP][192] ([Intel XE#2312]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][193] ([Intel XE#2313]) -> [SKIP][194] ([Intel XE#2312]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#653]) -> [SKIP][196] ([Intel XE#656]) +11 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][197] ([Intel XE#2312]) -> [SKIP][198] ([Intel XE#2313]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#656]) -> [SKIP][200] ([Intel XE#653]) +23 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][201] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][202] ([Intel XE#3544])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][203] ([Intel XE#1729]) -> [SKIP][204] ([Intel XE#2426])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1500]) -> [SKIP][206] ([Intel XE#362])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2955-f031245c01c722de43e8a02c2358140de0685428 -> xe-pw-145529v20

  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2955-f031245c01c722de43e8a02c2358140de0685428: f031245c01c722de43e8a02c2358140de0685428
  xe-pw-145529v20: 145529v20

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/index.html

--===============2318044295460900620==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_vm: Implement xe_vm_get_property_i=
octl (rev20)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145529/">https://patchwork.freedesktop.org/series/145529/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-145529v20/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-145529v20/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2955-f031245c01c722de43e8a02c2358140de=
0685428_FULL -&gt; xe-pw-145529v20_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145529v20_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-145529v20_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1455=
29v20_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-modesetfrombusy.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_fro=
ntbuffer_tracking@psr-modesetfrombusy.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_oa@polling-small-buf.html=
">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145529v20_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-6/igt@intel_sy=
sfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@inte=
l_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-8/igt@kms_add=
fb_basic@unused-offsets.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-8/igt@kms_addfb_basic@unu=
sed-offsets.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_async_flips@invalid-asyn=
c-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_bi=
g_fb@linear-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@k=
ms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-=
rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/i=
gt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_ccs@crc-primary-rotatio=
n-180-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-=
y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#311=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212=
">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4502">Intel XE#4502</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-=
tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_chamelium_audio@dp-audio=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_chamelium_color@ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@kms_chamelium_color@ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_chamelium_frames@dp-crc=
-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_chamelium_hpd@common-h=
pd-after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_content_protection@lic-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_content_protection@srm=
@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@kms_content_protection@uev=
ent@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_cursor_crc@cursor-slidin=
g-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_curso=
r_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_cursor_legacy@2x-flip-v=
s-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-=
vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@=
kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_dp=
_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_dp_link_tr=
aining@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_dsc@dsc-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">=
Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_feature_discove=
ry@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-8/igt@km=
s_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-436/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning=
-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_flip@2x-flip-vs-pannin=
g-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/204=
9">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_fl=
ip@2x-modeset-vs-vblank-race.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_flip@2x-m=
odeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-4/igt@kms_fl=
ip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-2/igt@kms_flip=
@flip-vs-wf_vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-8/igt@kms_f=
lip@flip-vs-wf_vblank-interruptible@a-dp2.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32=
bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other=
 tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_flip_scaled_crc@flip-3=
2bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@d=
rrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg=
2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656=
">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@f=
bcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
psr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_plane_multiple@tiling-x@=
pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4658">Intel XE#4658</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_pm_backlight@fade-with=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/870">Intel XE#870</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_pm=
_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lps=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other =
test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_psr@psr-primary-page-f=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@kms_psr@psr2-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
50">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_vr=
r@negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@kms_vrr@negative-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_eudebug@basic-exec-queues=
-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_eudebug@basic-vm-bind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@xe_eudebug@basic-vm-bind.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_evict@evict-large-cm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_evict@evict-small-externa=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_exec_basic@multigpu-no-e=
xec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_exec_basic@multigpu-once-=
basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@xe_exec_fault_mode@many-ex=
ecqueues-bindexecqueue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-3/igt@xe_oa@bu=
ffer-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-145529v20/shard-lnl-5/igt@xe_oa@buffer-size.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel =
XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_oa@non-sampling-read-err=
or.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-2/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbin=
d-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@xe_pxp@regular-src-to-pxp-d=
est-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt@xe_query@multigpu-query-en=
gines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@xe_query@multigpu-query-gt-l=
ist.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_query@multigpu-query-topo=
logy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v20/shard-adlp-6/igt@xe_query@multigpu-query-top=
ology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20=
/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-436/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-=
bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529=
v20/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-at=
omic.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/sh=
ard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_di=
splay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463=
/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_dp_aux_dev.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms_=
flip@2x-dpms-vs-vblank-race.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bm=
g-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg=
2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1455=
29v20/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-2/igt@kms_flip=
@flip-vs-wf_vblank-interruptible@b-dp2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-b=
mg-8/igt@kms_flip@flip-vs-wf_vblank-interruptible@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-2/igt@kms_flip=
@flip-vs-wf_vblank-interruptible@c-dp2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-b=
mg-8/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529=
v20/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-on=
off.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-3/igt@kms_=
plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms=
_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_pm=
_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@k=
ms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-d=
g2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145529v20/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-defer-bind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-9/igt@xe_faul=
t_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/=
shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS<=
/a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-436/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shar=
d-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a=
> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-2/igt@xe_pm@s4=
-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-lnl-7/igt@xe_pm@s4-mult=
iple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-1/igt@xe_pm@s4-=
vm-bind-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-lnl-7/igt@xe_pmu@g=
t-frequency.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-145529v20/shard-lnl-5/igt@xe_pmu@gt-frequency.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-adlp-8/igt@kms_big=
_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-adlp-=
8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-145529v20/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5529v20/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pip=
e-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-436/igt@kms_=
ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel =
XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4440">Intel XE#4440</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-463=
/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_co=
ntent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-464/igt=
@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_co=
ntent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-dg2-434/igt@kms_conte=
nt_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard=
-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel=
 XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-2/igt@kms_flip=
@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20=
/shard-bmg-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel X=
E#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1455=
29v20/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pr=
i-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145529v20/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cu=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5529v20/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145=
529v20/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pg=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145=
529v20/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145529v20/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145529v20/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-1/=
igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/shard-bmg-2/igt@k=
ms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2955-f031245c01c722de43e8a02c2358140de0685428/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v20/=
shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
62">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2955-f031245c01c722de43e8a02c2358140de0685428 -&gt; xe-pw-145=
529v20</li>
</ul>
<p>IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2955-f031245c01c722de43e8a02c2358140de0685428: f031245c01c722de43e8a02=
c2358140de0685428<br />
  xe-pw-145529v20: 145529v20</p>

</body>
</html>

--===============2318044295460900620==--
