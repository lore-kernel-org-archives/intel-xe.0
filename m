Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E2AC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 00:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7535110E7F1;
	Thu,  1 Aug 2024 00:56:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC2F10E7F1;
 Thu,  1 Aug 2024 00:56:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0849377095121090334=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe/guc=3A_Pick_GuC_from_CI_?=
 =?utf-8?q?folder_for_LNL=2C_BMG=2C_PVC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 00:56:43 -0000
Message-ID: <172247380395.479728.5279524626019563233@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730184309.2939144-1-julia.filipchuk@intel.com>
In-Reply-To: <20240730184309.2939144-1-julia.filipchuk@intel.com>
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

--===============0849377095121090334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC (rev2)
URL   : https://patchwork.freedesktop.org/series/136692/
State : success

== Summary ==

CI Bug Log - changes from xe-1698-caaefe49619299337b0fdc73a2379043d8684825_full -> xe-pw-136692v2_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136692v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][1] -> [FAIL][2] ([Intel XE#1426]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#1426]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#1426]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#2191])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] ([Intel XE#1195]) +3 other tests incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-6.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1901] / [Intel XE#2028]) +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12] ([Intel XE#1195])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#651])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1162])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-3:
    - shard-lnl:          [PASS][16] -> [DMESG-FAIL][17] ([Intel XE#324])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [PASS][18] -> [DMESG-WARN][19] ([Intel XE#324])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][20] -> [FAIL][21] ([Intel XE#361])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_psr@psr-suspend@edp-1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#2028]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_psr@psr-suspend@edp-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][24] -> [FAIL][25] ([Intel XE#771] / [Intel XE#899])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][26] -> [FAIL][27] ([Intel XE#899])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1050])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][29] -> [TIMEOUT][30] ([Intel XE#1473])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][31] -> [TIMEOUT][32] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-435/igt@xe_evict@evict-threads-large.html

  * igt@xe_gt_freq@freq_range_idle:
    - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#2203]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_gt_freq@freq_range_idle.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-6/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1620])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-lnl:          [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1358] / [Intel XE#1616])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-7/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#1924] / [Intel XE#2028]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][41] -> [ABORT][42] ([Intel XE#1794])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [FAIL][43] ([Intel XE#1701]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][45] ([Intel XE#1426]) -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][47] ([Intel XE#2019]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][49] ([Intel XE#324]) -> [PASS][50] +1 other test pass
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [FAIL][51] ([Intel XE#2028]) -> [PASS][52] +2 other tests pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_psr@psr2-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-3/igt@kms_psr@psr2-suspend.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [FAIL][53] ([Intel XE#1000]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-dg2-set2:     [FAIL][55] ([Intel XE#2203]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_gt_freq@freq_range_exec.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][57] ([Intel XE#873]) -> [SKIP][58] ([Intel XE#1201] / [Intel XE#873])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#316]) -> [SKIP][60] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][62] ([Intel XE#316]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][63] ([Intel XE#324]) -> [FAIL][64] ([Intel XE#1231]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][65] ([Intel XE#1242]) -> [FAIL][66] ([Intel XE#1231])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][67] ([Intel XE#324]) -> [DMESG-WARN][68] ([Intel XE#1033] / [Intel XE#324])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][70] ([Intel XE#1124]) +7 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][72] ([Intel XE#619])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][74] ([Intel XE#607])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#1124]) -> [SKIP][76] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][78] ([Intel XE#346])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][80] ([Intel XE#367]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][82] ([Intel XE#2191])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#2191]) -> [SKIP][84] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][88] ([Intel XE#787]) +62 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#787]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1252]) -> [SKIP][92] ([Intel XE#1201] / [Intel XE#1252])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][94] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#306]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][98] ([Intel XE#306]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#373]) -> [SKIP][100] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][102] ([Intel XE#373]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][104] ([Intel XE#307]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#308]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#308])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][108] ([Intel XE#308]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#323]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#323])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][112] ([Intel XE#323])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#651]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][116] ([Intel XE#651]) +26 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#653]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][120] ([Intel XE#653]) +23 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1158]) -> [SKIP][122] ([Intel XE#1158] / [Intel XE#1201])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][124] ([Intel XE#908]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1489]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][128] ([Intel XE#1489]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1122]) -> [SKIP][130] ([Intel XE#1122] / [Intel XE#1201])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#929]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][134] ([Intel XE#929]) +11 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][136] ([Intel XE#1127])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][138] ([Intel XE#327]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#455]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][142] ([Intel XE#455]) +18 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_vrr@flipline.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][144] ([Intel XE#1091])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][146] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][148] ([Intel XE#1123]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][150] ([Intel XE#288]) +23 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#288]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][154] ([Intel XE#2360])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][156] ([Intel XE#560])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_media_fill@media-fill.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#378]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#378])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_module_load@force-load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@xe_module_load@force-load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][160] ([Intel XE#2419]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2419]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#2419]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_oa@polling-small-buf.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][164] ([Intel XE#1337])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#979]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#979])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2284]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#2284])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][170] ([Intel XE#2284] / [Intel XE#366])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#944]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][174] ([Intel XE#944])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1698-caaefe49619299337b0fdc73a2379043d8684825 -> xe-pw-136692v2

  IGT_7948: 7948
  xe-1698-caaefe49619299337b0fdc73a2379043d8684825: caaefe49619299337b0fdc73a2379043d8684825
  xe-pw-136692v2: 136692v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/index.html

--===============0849377095121090334==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136692/">https://patchwork.freedesktop.org/series/136692/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1698-caaefe49619299337b0fdc73a2379043d8684825_full -&gt; xe-pw-136692v2_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136692v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_psr@psr-suspend@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-435/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-6/igt@xe_gt_freq@freq_range_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203">Intel XE#2203</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-7/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_psr@psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-lnl-3/igt@kms_psr@psr2-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_gt_freq@freq_range_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203">Intel XE#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v2/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1698-caaefe49619299337b0fdc73a2379043d8684825 -&gt; xe-pw-136692v2</li>
</ul>
<p>IGT_7948: 7948<br />
  xe-1698-caaefe49619299337b0fdc73a2379043d8684825: caaefe49619299337b0fdc73a2379043d8684825<br />
  xe-pw-136692v2: 136692v2</p>

</body>
</html>

--===============0849377095121090334==--
