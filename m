Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183EDC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 22:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8584610E5B4;
	Thu, 30 May 2024 22:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CafNqK3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4860610E5B4
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 22:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717106475; x=1748642475;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=50GIDn7zGCnHgGq0w+PTiY0ZDWRXl6BhBrmIu5XJ+N4=;
 b=CafNqK3koTn64jYFK7/9YfgWla52OHATTK9cbfJHK3V1YLH+aApQkd1n
 PAoQHf86JSTB8Y2Ij1n2mWhhtq71h5YcJ81f31tj4cjquss6q1O5xhce2
 RYiOxNgZ2ELFsnuw7xyvaYM/aAv51I/WSh6SZcF2eg0rDclsQOTQKpDT2
 WcahCtZBks+NSYgk6nzQyRuHUZLEhnnaIqm5QJ8RKG6LdRZQvfMFhzPRG
 jZrM8ZJtX6B8w2+X8OzN8ViQHjyK9ggjgTBBcgx1ZTaJuxBX4EHqxVWoO
 ZHbSZOGeiKdCn6Y66L9UDi9ddEwdAxSzXnfnH2p1kS7Efd2njodvdylOb Q==;
X-CSE-ConnectionGUID: 62qiP8g1Qz6OEofeaQN/xQ==
X-CSE-MsgGUID: Uo57lBdtTxiJKJhVcB2ggQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17432405"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="17432405"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 15:01:12 -0700
X-CSE-ConnectionGUID: FseXgZLdSa2WsKw1xow6lQ==
X-CSE-MsgGUID: wkXsNcEoQT2k/gkpoORxTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="35956263"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 30 May 2024 15:00:55 -0700
Received: from [10.246.25.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7116228789
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 23:00:52 +0100 (IST)
Message-ID: <ad573832-199f-4115-ad4c-6278c0290cac@intel.com>
Date: Fri, 31 May 2024 00:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Split_?=
 =?UTF-8?Q?MCR_initialization_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240529162945.1240-1-michal.wajdeczko@intel.com>
 <171707928644.2238782.4636975735568916350@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171707928644.2238782.4636975735568916350@8e613ede5ea5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 30.05.2024 16:28, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Split MCR initialization (rev2)
> URL   : https://patchwork.freedesktop.org/series/134196/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385_full -> xe-pw-134196v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134196v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134196v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134196v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
>

unrelated, and it was not seen in rev1 which is exactly the same diff

>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:
>     - {shard-lnl}:        [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-lnl-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-lnl-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134196v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1125] / [Intel XE#1201])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#660])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#610]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124] / [Intel XE#1201]) +14 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124] / [Intel XE#1201])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][11] ([Intel XE#1204]) +1 other test fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][12] ([Intel XE#1231]) +3 other tests fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#367])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +41 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#1252])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#306])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#306]) +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +13 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455]) +39 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][32] ([Intel XE#1214] / [Intel XE#282])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#323])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1138] / [Intel XE#1201])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#310]) +12 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1195]) +1 other test incomplete
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][38] ([Intel XE#1195] / [Intel XE#927])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][39] ([Intel XE#1195]) +1 other test incomplete
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][40] ([Intel XE#324]) +1 other test dmesg-fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [i915#5274])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#656]) +66 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][43] ([Intel XE#1861])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1151] / [Intel XE#1201])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#1341])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#417])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][51] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#498]) +5 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#870])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1122] / [Intel XE#1201])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#734])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#836])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#1211])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201]) +6 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#929]) +22 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#327])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-adlp:         NOTRUN -> [FAIL][67] ([Intel XE#1874]) +2 other tests fail
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#330])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         NOTRUN -> [FAIL][69] ([Intel XE#771] / [Intel XE#899])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][70] ([Intel XE#899])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#1207])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#1932])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_ccs@block-multicopy-inplace:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@xe_ccs@block-multicopy-inplace.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1123] / [Intel XE#1201])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][77] -> [FAIL][78] ([Intel XE#1600]) +1 other test fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][79] -> [INCOMPLETE][80] ([Intel XE#1195] / [Intel XE#1473])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#261]) +8 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-beng-small-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@xe_evict@evict-beng-small-cm.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][83] -> [TIMEOUT][84] ([Intel XE#1473])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1392]) +9 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#288]) +40 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-adlp:         NOTRUN -> [FAIL][89] ([Intel XE#1068])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1008] / [Intel XE#1201])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@xe_mmap@vram.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#979])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#366])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#366])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][94] ([Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][95] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-6/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [PASS][96] -> [INCOMPLETE][97] ([Intel XE#1195] / [Intel XE#1358])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#944]) +4 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#944])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][100] ([Intel XE#1214] / [Intel XE#1760])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][101] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][102] +1 other test pass
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-463/igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-6.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-435/igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][103] ([Intel XE#282] / [Intel XE#910]) -> [PASS][104] +1 other test pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - {shard-lnl}:        [FAIL][105] ([Intel XE#480] / [Intel XE#886]) -> [PASS][106] +1 other test pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - {shard-lnl}:        [DMESG-WARN][107] ([Intel XE#1830]) -> [PASS][108] +2 other tests pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][109] ([Intel XE#361]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - {shard-lnl}:        [FAIL][111] ([Intel XE#899]) -> [PASS][112] +1 other test pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][113] ([Intel XE#1761]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
> 
>   * igt@xe_pm@s2idle-mocs:
>     - shard-dg2-set2:     [DMESG-WARN][115] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@xe_pm@s2idle-mocs.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@xe_pm@s2idle-mocs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][118] ([Intel XE#316]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#316]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][121] ([Intel XE#1231]) -> [DMESG-FAIL][122] ([Intel XE#324])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#610]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#610])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#1124]) -> [SKIP][126] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][128] ([Intel XE#1124]) +8 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][130] ([Intel XE#346])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_big_joiner@basic.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][132] ([Intel XE#367]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#367]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#367])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1252]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#1252])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#787]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][140] ([Intel XE#787]) +55 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][144] ([Intel XE#1252])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][148] ([Intel XE#306])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#373]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][152] ([Intel XE#373]) +5 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][154] ([Intel XE#307])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#307]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#307])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][158] ([Intel XE#308]) +2 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][159] ([Intel XE#282]) -> [DMESG-WARN][160] ([Intel XE#1214] / [Intel XE#282])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][161] ([Intel XE#282]) -> [INCOMPLETE][162] ([Intel XE#1195]) +1 other test incomplete
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-adlp:         [INCOMPLETE][163] ([Intel XE#1195] / [Intel XE#927]) -> [INCOMPLETE][164] ([Intel XE#1195])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][165] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][166] ([Intel XE#282]) +2 other tests dmesg-warn
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][167] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][168] ([Intel XE#1214] / [Intel XE#282])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#455]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#455] / [Intel XE#929]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1927]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#1927])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][176] ([Intel XE#776])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][178] ([Intel XE#1137])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1135]) -> [SKIP][180] ([Intel XE#1135] / [Intel XE#1201])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-433/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [ABORT][181] -> [SKIP][182] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][184] ([Intel XE#651]) +19 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#651]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#653]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][190] ([Intel XE#653]) +17 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][192] ([Intel XE#417])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-dg2-set2:     [FAIL][193] ([Intel XE#616]) -> [DMESG-FAIL][194] ([Intel XE#1162])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     [DMESG-FAIL][195] ([Intel XE#1162]) -> [FAIL][196] ([Intel XE#616])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][198] ([Intel XE#455]) +9 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#498]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#305]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][208] ([Intel XE#1122])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1122]) -> [SKIP][210] ([Intel XE#1122] / [Intel XE#1201])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#929]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][214] ([Intel XE#929]) +12 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1127]) -> [SKIP][216] ([Intel XE#1127] / [Intel XE#1201])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][218] ([Intel XE#327])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#327]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][222] ([Intel XE#1729])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#756]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#756])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][226] ([Intel XE#1091])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][228] ([Intel XE#1126])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#944]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][231] ([Intel XE#1473] / [Intel XE#392]) -> [DMESG-FAIL][232] ([Intel XE#482])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#288]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][236] ([Intel XE#288]) +17 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][238] ([Intel XE#378])
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@xe_module_load@force-load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#366]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][241] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][242] ([Intel XE#1162])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
>     - shard-adlp:         [DMESG-WARN][243] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][244] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-adlp-8/igt@xe_pm@s3-basic-exec.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-9/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-adlp:         [INCOMPLETE][245] ([Intel XE#1195]) -> [DMESG-WARN][246] ([Intel XE#1214])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-adlp-9/igt@xe_pm@s3-vm-bind-prefetch.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-8/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][247] ([Intel XE#1162] / [Intel XE#1941]) -> [DMESG-WARN][248] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-adlp:         [INCOMPLETE][249] ([Intel XE#1195] / [Intel XE#1349]) -> [DMESG-WARN][250] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1941])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][252] ([Intel XE#944])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1207
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
>   [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1927
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385 -> xe-pw-134196v2
> 
>   IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1375-4a32411a2b73e515af2cc54034ef686e03df8385: 4a32411a2b73e515af2cc54034ef686e03df8385
>   xe-pw-134196v2: 134196v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v2/index.html
> 
