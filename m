Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC27C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 05:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB6710E591;
	Fri, 16 Aug 2024 05:45:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ED810E590;
 Fri, 16 Aug 2024 05:45:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1041001699596216592=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_series_starting_with_=5BCI=2C1/?=
 =?utf-8?q?3=5D_drm/xe/uc=3A_Use_managed_bo_for_HuC_and_GSC_objects?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 05:45:50 -0000
Message-ID: <172378715019.653293.1838234168078140747@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240815230541.3828206-1-lucas.demarchi@intel.com>
In-Reply-To: <20240815230541.3828206-1-lucas.demarchi@intel.com>
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

--===============1041001699596216592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/3] drm/xe/uc: Use managed bo for HuC and GSC objects
URL   : https://patchwork.freedesktop.org/series/137362/
State : success

== Summary ==

CI Bug Log - changes from xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167_full -> xe-pw-137362v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137362v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-bmg}:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  
Known issues
------------

  Here are the changes found in xe-pw-137362v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#827]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#1659]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1399])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#886]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#651]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#2028]) +3 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#656]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#616])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#2028] / [Intel XE#2533]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#2533])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-2:
    - shard-lnl:          [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#324])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#1874])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#899]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][26] -> [FAIL][27] ([Intel XE#899])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#1523]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_vblank@accuracy-idle.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#2019]) +1 other test dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][32] -> [TIMEOUT][33] ([Intel XE#1473])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#688])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][35] -> [FAIL][36] ([Intel XE#1600])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1392]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-434/igt@xe_exec_compute_mode@lr-mode-workload.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#2046])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#1620])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#378])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][45] ([Intel XE#2514])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1061])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@xe_peer2peer@write.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - {shard-bmg}:        [FAIL][47] ([Intel XE#827]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][49] ([Intel XE#1033]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][51] ([Intel XE#1659]) -> [PASS][52] +1 other test pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:
    - {shard-bmg}:        [FAIL][53] ([Intel XE#2436]) -> [PASS][54] +2 other tests pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [FAIL][55] ([Intel XE#2028]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-lnl:          [DMESG-WARN][57] ([Intel XE#877]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-1/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][59] ([Intel XE#877]) -> [PASS][60] +5 other tests pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][61] ([Intel XE#1874]) -> [PASS][62] +5 other tests pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [DMESG-FAIL][63] ([Intel XE#324]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-WARN][65] ([Intel XE#324]) -> [PASS][66] +2 other tests pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_plane@plane-position-hole.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][67] ([Intel XE#899]) -> [PASS][68] +3 other tests pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-lnl:          [INCOMPLETE][69] -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - {shard-bmg}:        [FAIL][71] ([Intel XE#2364]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][73] ([Intel XE#1473]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [FAIL][75] ([Intel XE#1000]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-execqueues-rebind:
    - shard-lnl:          [FAIL][77] -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-3/igt@xe_exec_basic@many-execqueues-rebind.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-8/igt@xe_exec_basic@many-execqueues-rebind.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][79] ([Intel XE#358]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-4/igt@xe_exec_reset@cat-error.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][81] ([Intel XE#958]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#623]) -> [SKIP][84] ([Intel XE#1201] / [Intel XE#623])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#316]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][88] ([Intel XE#316]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][89] ([Intel XE#1231]) -> [FAIL][90] ([Intel XE#1242])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][92] ([Intel XE#1124]) +9 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][94] ([Intel XE#607])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#1124]) -> [SKIP][96] ([Intel XE#1124] / [Intel XE#1201]) +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#346]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#346])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][100] ([Intel XE#2191])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][102] ([Intel XE#367]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#367]) -> [SKIP][104] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1252]) -> [SKIP][108] ([Intel XE#1201] / [Intel XE#1252])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][110] ([Intel XE#787]) +83 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][112] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][114] ([Intel XE#1252])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#787]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#787]) +90 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][118] ([Intel XE#314]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1152]) -> [SKIP][120] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][122] ([Intel XE#306])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#306]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][126] ([Intel XE#373]) +8 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#373]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#307]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#307])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][132] ([Intel XE#307])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][134] ([Intel XE#308])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#308]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#308])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#323]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][140] ([Intel XE#323]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][142] ([Intel XE#455]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][144] ([Intel XE#1137])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#455]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#651]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#651]) +28 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][150] ([Intel XE#651]) +29 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#658]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#658])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1158]) -> [SKIP][154] ([Intel XE#1158] / [Intel XE#1201])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][156] ([Intel XE#653]) +30 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#653]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#653]) +28 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#605]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#605])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#417]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#417])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][164] ([Intel XE#2318]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][166] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2318]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#870]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#870])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][174] ([Intel XE#870])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][176] ([Intel XE#1129])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#908]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#908])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1129]) -> [SKIP][180] ([Intel XE#1129] / [Intel XE#1201])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1489]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][184] ([Intel XE#1489]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][186] ([Intel XE#929]) +13 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#929]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1149]) -> [SKIP][190] ([Intel XE#1149] / [Intel XE#1201])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#327]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][194] ([Intel XE#1127])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][196] ([Intel XE#327]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][198] ([Intel XE#756])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][200] ([Intel XE#1091])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][202] ([Intel XE#1123])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1123]) -> [SKIP][204] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][205] ([Intel XE#1473] / [Intel XE#402]) -> [INCOMPLETE][206] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][207] ([Intel XE#1473]) -> [INCOMPLETE][208] ([Intel XE#1195] / [Intel XE#1473])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][209] ([Intel XE#1195] / [Intel XE#1473]) -> [FAIL][210] ([Intel XE#1000])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][212] ([Intel XE#288]) +25 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#288]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][216] ([Intel XE#255])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][218] ([Intel XE#512])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_mmap@small-bar.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][220] ([Intel XE#378]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_module_load@force-load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2541]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][224] ([Intel XE#2541]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][226] ([Intel XE#977])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#979]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#979])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][232] ([Intel XE#2284] / [Intel XE#366])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#944]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#944])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][236] ([Intel XE#944]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167 -> xe-pw-137362v1

  IGT_7971: 54f99657bd69295e49e1ab376fde82d3135bba7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167: f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167
  xe-pw-137362v1: 137362v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/index.html

--===============1041001699596216592==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/3] drm/xe/uc: Use managed bo for HuC and GSC objects</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137362/">https://patchwork.freedesktop.org/series/137362/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167_full -&gt; xe-pw-137362v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137362v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137362v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533">Intel XE#2533</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533">Intel XE#2533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-434/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_exec_compute_mode@lr-mode-workload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046">Intel XE#2046</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-1/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-1/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_plane@plane-position-hole.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-3/igt@xe_exec_basic@many-execqueues-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-8/igt@xe_exec_basic@many-execqueues-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-4/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-433/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137362v1/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167 -&gt; xe-pw-137362v1</li>
</ul>
<p>IGT_7971: 54f99657bd69295e49e1ab376fde82d3135bba7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167: f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167<br />
  xe-pw-137362v1: 137362v1</p>

</body>
</html>

--===============1041001699596216592==--
