Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6221C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 05:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135C310E331;
	Thu,  9 May 2024 05:50:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0871410E302;
 Thu,  9 May 2024 05:49:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2083780671589695852=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Move_xe=5Fgpu=5Fcomma?=
 =?utf-8?q?nds=2Eh_file_to_instructions/?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 May 2024 05:49:58 -0000
Message-ID: <171523379898.2037202.17555157416032215968@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508174856.1908-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240508174856.1908-1-michal.wajdeczko@intel.com>
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

--===============2083780671589695852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Move xe_gpu_commands.h file to instructions/
URL   : https://patchwork.freedesktop.org/series/133336/
State : failure

== Summary ==

CI Bug Log - changes from xe-1257-34d52122a69076639d526b035c8edd5b43201f84_full -> xe-pw-133336v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-133336v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133336v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133336v1_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][1] ([Intel XE#1201] / [Intel XE#656]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_getfb@getfb-handle-zero:
    - {shard-lnl}:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-5/igt@kms_getfb@getfb-handle-zero.html

  * {igt@xe_pm@s4-mocs}:
    - {shard-lnl}:        NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-6/igt@xe_pm@s4-mocs.html
    - shard-adlp:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@xe_pm@s4-mocs.html

  
Known issues
------------

  Here are the changes found in xe-pw-133336v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][6] ([Intel XE#1214] / [Intel XE#1667])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@core_hotunplug@hotrebind.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#873])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_interruptible@legacy-setmode:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#1201] / [Intel XE#1234])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_atomic_interruptible@legacy-setmode.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_atomic_interruptible@legacy-setmode.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1195]) +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-6.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#829]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#607])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#1201] / [Intel XE#829]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#316])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1204])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][20] ([Intel XE#324]) +2 other tests dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][21] ([Intel XE#616]) +4 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_joiner@basic:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#346])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#787]) +47 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#787]) +98 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#650]) +7 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#1252])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#314])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#373]) +10 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_color@ctm-0-75:
    - shard-dg2-set2:     [PASS][39] -> [SKIP][40] ([Intel XE#1201]) +17 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_color@ctm-0-75.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_color@ctm-0-75.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1204])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#308])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#308])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][44] -> [DMESG-WARN][45] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#323])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][47] ([Intel XE#1214] / [Intel XE#282])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-adlp:         [PASS][49] -> [DMESG-FAIL][50] ([Intel XE#1330])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201]) +20 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][53] -> [DMESG-WARN][54] ([Intel XE#1191] / [Intel XE#1214]) +3 other tests dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#702])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1135] / [Intel XE#1201])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [FAIL][58] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][60] -> [FAIL][61] ([Intel XE#616]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#658])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#656]) +42 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb-handle-zero:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#1201] / [Intel XE#687])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_getfb@getfb-handle-zero.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_getfb@getfb-handle-zero.html
    - shard-adlp:         [PASS][71] -> [SKIP][72] ([Intel XE#1201] / [Intel XE#687])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_getfb@getfb-handle-zero.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_getfb@getfb-handle-zero.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#616])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_lease@cursor-implicit-plane:
    - shard-adlp:         [PASS][74] -> [SKIP][75] ([Intel XE#1201]) +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_lease@cursor-implicit-plane.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_lease@cursor-implicit-plane.html

  * igt@kms_mmap_write_crc@main:
    - shard-adlp:         [PASS][76] -> [SKIP][77] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@kms_mmap_write_crc@main.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][78] ([Intel XE#1191] / [Intel XE#1214]) +4 other tests dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][79] -> [FAIL][80] ([Intel XE#616]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-adlp:         NOTRUN -> [FAIL][81] ([Intel XE#616] / [Intel XE#654]) +4 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][82] ([Intel XE#361]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][83] ([Intel XE#361]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][84] ([Intel XE#904] / [Intel XE#909])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#870])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1129] / [Intel XE#1201])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-adlp:         [PASS][87] -> [SKIP][88] ([Intel XE#1201] / [Intel XE#1211])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_pm_rpm@cursor-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#836])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1122] / [Intel XE#1201])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][93] ([Intel XE#294]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][95] -> [FAIL][96] ([Intel XE#899])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [PASS][97] -> [DMESG-WARN][98] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][99] ([Intel XE#1162] / [Intel XE#1214])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#455]) +24 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#756])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3:
    - shard-adlp:         NOTRUN -> [FAIL][102] ([Intel XE#1080]) +9 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1126] / [Intel XE#1201])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1126] / [Intel XE#1201])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][105] -> [TIMEOUT][106] ([Intel XE#1473])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#688])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#1392]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [PASS][111] -> [FAIL][112] ([Intel XE#1396])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@xe_exec_compute_mode@lr-mode-workload.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#1562]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-basic-imm.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [FAIL][116] ([Intel XE#1068])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][117] -> [DMESG-WARN][118] ([Intel XE#1214])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-435/igt@xe_module_load@many-reload.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_pm@d3-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1008] / [Intel XE#1201])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@xe_pm@d3-mmap-vram.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][120] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][121] ([Intel XE#1214])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][123] -> [ABORT][124] ([Intel XE#1358])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@legacy-format:
    - shard-adlp:         [SKIP][127] ([Intel XE#1201]) -> [PASS][128] +11 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_addfb_basic@legacy-format.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_addfb_basic@legacy-format.html
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [i915#6077]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_addfb_basic@legacy-format.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_addfb_basic@too-wide:
    - {shard-lnl}:        [INCOMPLETE][131] -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-3/igt@kms_addfb_basic@too-wide.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-3/igt@kms_addfb_basic@too-wide.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-size-change:
    - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][136] +10 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_cursor_crc@cursor-size-change.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_cursor_crc@cursor-size-change.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][137] ([Intel XE#1195]) -> [PASS][138] +3 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bd-hdmi-a6-dp4.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - {shard-lnl}:        [SKIP][139] ([Intel XE#1650]) -> [PASS][140] +6 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][141] ([Intel XE#1214] / [Intel XE#1608]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - {shard-lnl}:        [FAIL][143] ([Intel XE#886]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][147] ([Intel XE#616]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][150] +9 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb2-into-addfb2:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#687]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_getfb@getfb2-into-addfb2.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_getfb@getfb2-into-addfb2.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-adlp:         [SKIP][155] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_plane_alpha_blend@alpha-basic.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_psr@psr-suspend@edp-1:
    - {shard-lnl}:        [DMESG-WARN][157] ([Intel XE#1595]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][161] ([Intel XE#1729]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][163] ([Intel XE#899]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - {shard-lnl}:        [DMESG-WARN][165] -> [PASS][166] +3 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][167] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][169] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#1081]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-invalidate.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][173] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [DMESG-WARN][175] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][176] +3 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@xe_module_load@reload.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@xe_module_load@reload.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-adlp:         [FAIL][177] ([Intel XE#355]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@xe_pm@d3hot-basic-exec.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [WARN][179] ([Intel XE#1639]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html

  * {igt@xe_pm@s3-vm-bind-userptr}:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#1214]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@xe_pm@s3-vm-bind-userptr.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][183] ([Intel XE#1358]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@xe_pm@s4-exec-after.html

  * {igt@xe_pm@s4-vm-bind-userptr}:
    - shard-adlp:         [ABORT][185] -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [FAIL][187] ([Intel XE#1081]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [ABORT][189] ([Intel XE#1538] / [Intel XE#1717]) -> [INCOMPLETE][190] ([Intel XE#1195] / [Intel XE#1451])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-8/igt@core_hotunplug@hotreplug.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [DMESG-FAIL][191] ([Intel XE#1548]) -> [DMESG-FAIL][192] ([Intel XE#1162] / [Intel XE#1548])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@core_hotunplug@hotreplug-lateclose.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][193] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [SKIP][194] ([Intel XE#1201])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-dg2-set2:     [FAIL][195] ([Intel XE#650]) -> [SKIP][196] ([Intel XE#1201])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#829])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#316])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][201] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#829])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         [SKIP][203] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][206] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][207] ([Intel XE#1231]) -> [DMESG-FAIL][208] ([Intel XE#324])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][209] ([Intel XE#324]) -> [FAIL][210] ([Intel XE#1231])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
    - shard-adlp:         [SKIP][213] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#829])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-adlp:         [SKIP][215] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][216] ([Intel XE#1201])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_big_joiner@invalid-modeset.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][218] ([Intel XE#1201])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#829])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
    - shard-adlp:         [SKIP][221] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#829])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#829]) -> [FAIL][226] ([Intel XE#650])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
    - shard-adlp:         [SKIP][227] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][232] ([Intel XE#1201])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-464/igt@kms_chamelium_color@gamma.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_chamelium_color@gamma.html
    - shard-adlp:         [SKIP][233] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][234] ([Intel XE#1201])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_chamelium_color@gamma.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#373])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-multiple.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][238] ([Intel XE#1201])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][240] ([Intel XE#1204])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][241] ([Intel XE#616]) -> [DMESG-FAIL][242] ([Intel XE#1162])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][243] ([Intel XE#1162]) -> [FAIL][244] ([Intel XE#616])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         [SKIP][245] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][246] ([Intel XE#1201])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][247] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][248] ([Intel XE#1201])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][250] ([Intel XE#1201])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         [SKIP][251] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][252] ([Intel XE#1201])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_feature_discovery@chamelium.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-adlp:         [SKIP][253] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][254] ([Intel XE#1201])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-adlp:         [SKIP][255] ([Intel XE#1201]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#455])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][257] ([Intel XE#324] / [Intel XE#358]) -> [SKIP][258] ([Intel XE#1201])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#651])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
    - shard-adlp:         [SKIP][261] ([Intel XE#1201]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#651])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][263] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][264] ([Intel XE#1201]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#1234])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][267] ([Intel XE#1201]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][269] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][270] ([Intel XE#1191] / [Intel XE#1214])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         [SKIP][271] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][272] ([Intel XE#1201])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][274] ([Intel XE#1201]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][276] ([Intel XE#1201])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-adlp:         [SKIP][277] ([Intel XE#1201]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-adlp:         [SKIP][279] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][280] ([Intel XE#1201]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][282] ([Intel XE#1201]) +6 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-adlp:         [SKIP][283] ([Intel XE#1151] / [Intel XE#1201]) -> [SKIP][284] ([Intel XE#1201])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][287] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][288] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-adlp:         [DMESG-WARN][289] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][290] ([Intel XE#1195] / [Intel XE#927])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         [SKIP][291] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][292] ([Intel XE#1201])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][294] ([Intel XE#1201])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][295] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][296] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][297] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][298] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) +1 other test incomplete
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#1226]) -> [TIMEOUT][300] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][301] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][302] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][303] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][304] ([Intel XE#904] / [Intel XE#909])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [TIMEOUT][305] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909]) -> [INCOMPLETE][306] ([Intel XE#1195] / [Intel XE#909])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         [SKIP][307] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][308] ([Intel XE#1201])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][310] ([Intel XE#1201])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         [SKIP][311] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][312] ([Intel XE#1201])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][314] ([Intel XE#1201])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         [SKIP][315] ([Intel XE#1201]) -> [SKIP][316] ([Intel XE#1122] / [Intel XE#1201])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][318] ([Intel XE#1122] / [Intel XE#1201])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         [SKIP][319] ([Intel XE#1201] / [Intel XE#836]) -> [SKIP][320] ([Intel XE#1201] / [Intel XE#1211])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-adlp:         [SKIP][321] ([Intel XE#1201]) -> [SKIP][322] ([Intel XE#1201] / [Intel XE#929])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_psr@fbc-pr-cursor-render.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_psr@fbc-pr-cursor-render.html
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234]) -> [SKIP][324] ([Intel XE#1201] / [Intel XE#929])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-render.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][326] ([Intel XE#1201]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_psr@psr-cursor-render.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_psr@psr-cursor-render.html
    - shard-adlp:         [SKIP][327] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][328] ([Intel XE#1201]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_psr@psr-cursor-render.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_psr@psr-cursor-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         [SKIP][329] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][330] ([Intel XE#1201] / [Intel XE#829])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][332] ([Intel XE#1201] / [Intel XE#829])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-adlp:         [SKIP][333] ([Intel XE#1201] / [Intel XE#578]) -> [SKIP][334] ([Intel XE#1201] / [Intel XE#455])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_setmode@clone-exclusive-crtc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][335] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][336] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][337] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][338] ([Intel XE#1191] / [Intel XE#1214])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][340] ([Intel XE#1201]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html
    - shard-adlp:         [SKIP][341] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][342] ([Intel XE#1201]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_vrr@flip-dpms.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_vrr@flip-dpms.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][343] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][344] ([Intel XE#1473] / [Intel XE#392])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][345] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][346] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][347] ([Intel XE#1195] / [Intel XE#1473]) -> [TIMEOUT][348] ([Intel XE#1473] / [Intel XE#392])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [INCOMPLETE][349] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][350] ([Intel XE#1191] / [Intel XE#1214])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@xe_pm@s3-basic.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@xe_pm@s3-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1562]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1818
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
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
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/578
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#654]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/654
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7842 -> IGT_7843
  * Linux: xe-1257-34d52122a69076639d526b035c8edd5b43201f84 -> xe-pw-133336v1

  IGT_7842: e2a63accde6e8f3196013ab4809bf07f343fcf1e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84
  xe-pw-133336v1: 133336v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/index.html

--===============2083780671589695852==
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
<tr><td><b>Series:</b></td><td>drm/xe: Move xe_gpu_commands.h file to instructions/</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133336/">https://patchwork.freedesktop.org/series/133336/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1257-34d52122a69076639d526b035c8edd5b43201f84_full -&gt; xe-pw-133336v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-133336v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133336v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133336v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_getfb@getfb-handle-zero:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-5/igt@kms_getfb@getfb-handle-zero.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s4-mocs}:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-6/igt@xe_pm@s4-mocs.html">FAIL</a></li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@xe_pm@s4-mocs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133336v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667">Intel XE#1667</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_atomic_interruptible@legacy-setmode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_atomic_interruptible@legacy-setmode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_getfb@getfb-handle-zero.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_getfb@getfb-handle-zero.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_getfb@getfb-handle-zero.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_getfb@getfb-handle-zero.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_lease@cursor-implicit-plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_lease@cursor-implicit-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@kms_mmap_write_crc@main.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_mmap_write_crc@main.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_plane_multiple@tiling-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/654">Intel XE#654</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396">Intel XE#1396</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562">Intel XE#1562</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-435/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@xe_pm@d3-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_addfb_basic@legacy-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_addfb_basic@legacy-format.html">PASS</a> +11 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_addfb_basic@legacy-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_addfb_basic@legacy-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-3/igt@kms_addfb_basic@too-wide.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-3/igt@kms_addfb_basic@too-wide.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_cursor_crc@cursor-size-change.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_cursor_crc@cursor-size-change.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650">Intel XE#1650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-into-addfb2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_getfb@getfb2-into-addfb2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_getfb@getfb2-into-addfb2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Intel XE#1595</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@xe_module_load@reload.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639">Intel XE#1639</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s3-vm-bind-userptr}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s4-vm-bind-userptr}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-8/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-464/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-8/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/578">Intel XE#578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@xe_pm@s3-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-4/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7842 -&gt; IGT_7843</li>
<li>Linux: xe-1257-34d52122a69076639d526b035c8edd5b43201f84 -&gt; xe-pw-133336v1</li>
</ul>
<p>IGT_7842: e2a63accde6e8f3196013ab4809bf07f343fcf1e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84<br />
  xe-pw-133336v1: 133336v1</p>

</body>
</html>

--===============2083780671589695852==--
