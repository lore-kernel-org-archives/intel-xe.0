Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034BD0EE1C
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 00:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13310EB53;
	Sat, 12 Oct 2024 00:34:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4043C10EB52;
 Sat, 12 Oct 2024 00:34:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7832460096508325568=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Fix_dereference_b?=
 =?utf-8?q?efore_NULL_check_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 12 Oct 2024 00:34:32 -0000
Message-ID: <172869327224.1242705.14920781080685074367@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009184951.4991-1-everestkc@everestkc.com.np>
In-Reply-To: <20241009184951.4991-1-everestkc@everestkc.com.np>
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

--===============7832460096508325568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Fix dereference before NULL check (rev4)
URL   : https://patchwork.freedesktop.org/series/139890/
State : failure

== Summary ==

CI Bug Log - changes from xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07_full -> xe-pw-139890v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139890v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139890v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139890v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][4] -> [FAIL][5] +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-lnl:          [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@xe_oa@invalid-create-userspace-config.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@xe_pm@s3-mocs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@s3-mocs.html

  * igt@xe_tlb@basic-tlb:
    - shard-adlp:         [PASS][10] -> [CRASH][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@xe_tlb@basic-tlb.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@xe_tlb@basic-tlb.html
    - shard-lnl:          [PASS][12] -> [CRASH][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@xe_tlb@basic-tlb.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@xe_tlb@basic-tlb.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-suspend-resume:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][14] +4 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - {shard-bmg}:        [PASS][15] -> [SKIP][16] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@xe_tlb@basic-tlb:
    - {shard-bmg}:        [PASS][19] -> [CRASH][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-3/igt@xe_tlb@basic-tlb.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-5/igt@xe_tlb@basic-tlb.html

  
Known issues
------------

  Here are the changes found in xe-pw-139890v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1465])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@kms_3d.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][22] -> [DMESG-WARN][23] ([Intel XE#324]) +1 other test dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#1701]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [FAIL][26] ([Intel XE#1659])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#1659])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#316]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#1874]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][32] ([Intel XE#1874])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124]) +8 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][34] -> [FAIL][35] ([Intel XE#1204]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#1231])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#367]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2191])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1512])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#787]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][46] ([Intel XE#1195])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#787]) +48 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#306])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +7 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#373]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#307])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#308]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#2577])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#1475])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [PASS][59] -> [FAIL][60] ([Intel XE#1475])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#323])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     [PASS][62] -> [DMESG-WARN][63] ([Intel XE#1620]) +1 other test dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#776])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1195]) +3 other tests incomplete
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a6-dp4.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#301]) +4 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#1204])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#310])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-9/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1421])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#886]) +6 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401] / [Intel XE#1745])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1401])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][75] -> [DMESG-FAIL][76] ([Intel XE#324]) +4 other tests dmesg-fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455]) +18 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-linear:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#1491]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-linear.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-linear.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#651]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#651])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#651]) +25 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#653])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#656]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#653]) +28 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#656]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#455]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#346])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-3:
    - shard-lnl:          [PASS][89] -> [DMESG-FAIL][90] ([Intel XE#324]) +2 other tests dmesg-fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          [PASS][91] -> [DMESG-WARN][92] ([Intel XE#324]) +1 other test dmesg-warn
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2763]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2763]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2763]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1129])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2893]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1489]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1489])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1406]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#2948]) +3 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-onoff.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2939])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1127])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#327])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2168])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#2443]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_vrr@flip-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#756])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1091] / [Intel XE#2849])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#1050])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1123])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#944])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2905]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_online@single-step:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2905]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][120] -> [TIMEOUT][121] ([Intel XE#1473] / [Intel XE#402])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#688])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][123] -> [TIMEOUT][124] ([Intel XE#1473]) +1 other test timeout
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1392]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#288])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#288]) +20 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#2360])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][130] ([Intel XE#2105])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#2905]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2931])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2541]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#979])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1061])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#2284] / [Intel XE#366])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2284])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2284] / [Intel XE#366])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-lnl:          [PASS][139] -> [DMESG-FAIL][140] ([Intel XE#1620])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@xe_pm@d3hot-mmap-system.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-5/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][141] -> [ABORT][142] ([Intel XE#1694])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][143] -> [ABORT][144] ([Intel XE#1358] / [Intel XE#1794])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [PASS][145] -> [ABORT][146] ([Intel XE#1358])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_pm@s4-basic.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][147] -> [ABORT][148] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#579])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#944])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#944]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [PASS][152] -> [FAIL][153] ([Intel XE#1081])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc:
    - {shard-bmg}:        [DMESG-FAIL][154] ([Intel XE#1033]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-2/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-c-dp-2:
    - {shard-bmg}:        [FAIL][156] ([Intel XE#1656]) -> [PASS][157] +2 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [FAIL][158] ([Intel XE#1288]) -> [PASS][159] +3 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][160] ([Intel XE#1426]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - {shard-bmg}:        [SKIP][162] ([Intel XE#2231]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][164] ([Intel XE#1659]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - {shard-bmg}:        [FAIL][166] ([Intel XE#1659]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - {shard-bmg}:        [INCOMPLETE][168] -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [FAIL][170] ([Intel XE#1874]) -> [PASS][171] +3 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][172] ([Intel XE#1231]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [TIMEOUT][174] ([Intel XE#1033] / [Intel XE#402]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - {shard-bmg}:        [SKIP][176] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#1195]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][180] -> [PASS][181] +2 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][182] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#2423] / [i915#2575]) -> [PASS][185] +9 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][186] ([Intel XE#301]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][188] ([Intel XE#886]) -> [PASS][189] +4 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][190] -> [PASS][191] +2 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#2351]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][194] ([Intel XE#1861]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
    - shard-lnl:          [DMESG-WARN][196] ([Intel XE#324]) -> [PASS][197] +6 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html

  * igt@kms_plane_cursor@overlay:
    - shard-lnl:          [FAIL][198] ([Intel XE#1471]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane_cursor@overlay.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:
    - shard-lnl:          [FAIL][200] ([Intel XE#1874]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][202] ([Intel XE#616]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - {shard-bmg}:        [SKIP][204] -> [PASS][205] +10 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][206] ([Intel XE#2029]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@cursor:
    - shard-lnl:          [DMESG-FAIL][208] ([Intel XE#1620]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_pm_rpm@cursor.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2446]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][212] ([Intel XE#899]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][214] ([Intel XE#2159]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [ABORT][216] ([Intel XE#2625]) -> [PASS][217] +1 other test pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [FAIL][218] ([Intel XE#1000]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_sip@invalidinstr-walker-enabled:
    - shard-lnl:          [FAIL][220] ([Intel XE#2977]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@xe_exec_sip@invalidinstr-walker-enabled.html

  * igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0:
    - shard-lnl:          [FAIL][222] -> [PASS][223] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0.html

  * igt@xe_exec_threads@threads-cm-fd-userptr:
    - shard-adlp:         [TIMEOUT][224] ([Intel XE#1033]) -> [PASS][225] +4 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_exec_threads@threads-cm-fd-userptr.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-6/igt@xe_exec_threads@threads-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - shard-lnl:          [FAIL][226] ([Intel XE#3001]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [DMESG-FAIL][228] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_pm@s2idle-mocs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [ABORT][230] ([Intel XE#1358]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - {shard-bmg}:        [SKIP][232] ([Intel XE#1130]) -> [PASS][233] +22 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-adlp:         [DMESG-WARN][234] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_vm@bind-array-enobufs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@xe_vm@bind-array-enobufs.html

  * igt@xe_vm@large-misaligned-binds-536870912:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1130]) -> [PASS][237] +14 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_vm@large-misaligned-binds-536870912.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@xe_vm@large-misaligned-binds-536870912.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][238] ([Intel XE#1231]) -> [DMESG-FAIL][239] ([Intel XE#324])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#2351]) -> [SKIP][241] ([Intel XE#619])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][242] ([Intel XE#324]) -> [FAIL][243] ([Intel XE#1231]) +1 other test fail
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][244] -> [SKIP][245] ([Intel XE#2907])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][246] ([Intel XE#1178]) -> [INCOMPLETE][247] ([Intel XE#1195] / [Intel XE#2715])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][248] ([Intel XE#1178]) -> [INCOMPLETE][249] ([Intel XE#1195])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2423] / [i915#2575]) -> [SKIP][251] ([Intel XE#455]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x32.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom:
    - shard-lnl:          [DMESG-WARN][252] ([Intel XE#2055]) -> [FAIL][253] ([Intel XE#2577])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-adlp:         [TIMEOUT][254] ([Intel XE#1033]) -> [SKIP][255] ([Intel XE#310])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_flip@2x-flip-vs-rmfb.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [TIMEOUT][256] ([Intel XE#1033]) -> [FAIL][257] ([Intel XE#1861]) +1 other test fail
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][258] -> [SKIP][259] ([Intel XE#651])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2890]) -> [SKIP][261] ([Intel XE#653])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#2351]) -> [SKIP][263] ([Intel XE#653])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][264] ([Intel XE#1035] / [Intel XE#1195]) -> [INCOMPLETE][265] ([Intel XE#1035])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][266] -> [SKIP][267] ([Intel XE#2938])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][268] -> [SKIP][269] ([Intel XE#1489]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1130]) -> [FAIL][271] ([Intel XE#1050])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_compute@ccs-mode-basic.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1130]) -> [SKIP][273] ([Intel XE#2905]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-discovery.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-adlp:         [TIMEOUT][274] ([Intel XE#1033]) -> [SKIP][275] ([Intel XE#1392])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1130]) -> [SKIP][277] ([Intel XE#288]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][278] ([Intel XE#2961]) -> [INCOMPLETE][279] ([Intel XE#1195]) +1 other test incomplete
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1130]) -> [SKIP][281] ([Intel XE#2541])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [FAIL][282] -> [SKIP][283] ([Intel XE#2284] / [Intel XE#366])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1130]) -> [SKIP][285] ([Intel XE#944])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977
  [Intel XE#3001]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3001
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8065 -> IGT_8066
  * Linux: xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07 -> xe-pw-139890v4

  IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8066: 6eb0694325c565c6eb4c437f6e5c0650c2b5fd4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07: d2577be8b969257afb5f76964afc16ae4f6f7c07
  xe-pw-139890v4: 139890v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/index.html

--===============7832460096508325568==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Fix dereference before NULL check (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139890/">https://patchwork.freedesktop.org/series/139890/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07_full -&gt; xe-pw-139890v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139890v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139890v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139890v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a6-dp4.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@xe_oa@invalid-create-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@xe_tlb@basic-tlb.html">CRASH</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@xe_tlb@basic-tlb.html">CRASH</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-3/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-5/igt@xe_tlb@basic-tlb.html">CRASH</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139890v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-9/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-4/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@xe_evict@evict-beng-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@xe_evict@evict-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931">Intel XE#2931</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@xe_pm@d3hot-mmap-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-5/igt@xe_pm@d3hot-mmap-system.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-2/igt@kms_async_flips@crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656">Intel XE#1656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288">Intel XE#1288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_plane_cursor@overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_pm_rpm@cursor.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-3/igt@kms_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977">Intel XE#2977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@xe_exec_sip@invalidinstr-walker-enabled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-1/igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_exec_threads@threads-cm-fd-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-6/igt@xe_exec_threads@threads-cm-fd-userptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3001">Intel XE#3001</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_pm@s2idle-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@xe_pm@s2idle-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_vm@bind-array-enobufs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@xe_vm@bind-array-enobufs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_vm@large-misaligned-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@xe_vm@large-misaligned-binds-536870912.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_flip@2x-flip-vs-rmfb.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v4/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8065 -&gt; IGT_8066</li>
<li>Linux: xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07 -&gt; xe-pw-139890v4</li>
</ul>
<p>IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8066: 6eb0694325c565c6eb4c437f6e5c0650c2b5fd4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07: d2577be8b969257afb5f76964afc16ae4f6f7c07<br />
  xe-pw-139890v4: 139890v4</p>

</body>
</html>

--===============7832460096508325568==--
