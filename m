Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91738C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 12:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2810E61E;
	Wed, 15 May 2024 12:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nu721Jye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9749A10E61E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775693; x=1747311693;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ApQn4vhJeC2YBEEvP9Wbl3pfiKlKsL4xYNFwc3WT+3g=;
 b=Nu721JyezCF8lCHsbxQ0LfPC3rj4macRPZRv61eEzj0sfmNLckn44pcz
 belA0XkInr0C6FuLFVT96q0fZg57+XAV/2k43fGmcSRAS8tVcNYQC79XH
 YsmPGu41Q3CzuQLbDY0wXArzFgHRq5h+SI+PLSYrCIsw4WMbLc5isttMa
 1tGLLdt1or0HQVTeclkxPOAnMYvPW62AuqQza3jqaw5BUhEGq0DFLc4+q
 wBTq7EyKnT3PiTgY478FUCxQZkhzDt9U9fkATqmRGvTLXzSc/CG0nu6pY
 wEPds8sQhHyC+TnV9mfXZRMHdY2QdsRlTHBuOmoE0tyUxkH6rdlKLR42z Q==;
X-CSE-ConnectionGUID: CXPyHCewSWWjZ3v4ABt3+Q==
X-CSE-MsgGUID: r8lhhlgzQ56hxMFf4QFuPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22490718"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="22490718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:21:32 -0700
X-CSE-ConnectionGUID: +c2il2ueR46hv6QyJAUgpw==
X-CSE-MsgGUID: r9SlAjMmTO+cDxMElcHsyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="54245734"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 15 May 2024 05:21:28 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 44D2B27BD2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 13:21:26 +0100 (IST)
Message-ID: <4528fbf3-2c0b-4ab2-9d9d-7815a480be36@intel.com>
Date: Wed, 15 May 2024 14:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Don?=
 =?UTF-8?Q?=27t_advertise_support_to_enable_VFs_if_not_ready?=
To: intel-xe@lists.freedesktop.org
References: <20240507165757.2835-1-michal.wajdeczko@intel.com>
 <171514931948.2017561.18378844806509153168@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171514931948.2017561.18378844806509153168@8e613ede5ea5>
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



On 08.05.2024 08:21, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Don't advertise support to enable VFs if not ready
> URL   : https://patchwork.freedesktop.org/series/133289/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820_full -> xe-pw-133289v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-133289v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133289v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-133289v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-shared-vm-userptr:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-464/igt@xe_exec_threads@threads-shared-vm-userptr.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-436/igt@xe_exec_threads@threads-shared-vm-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_atomic@atomic-plane-damage:
>     - shard-adlp:         [INCOMPLETE][3] ([Intel XE#1195] / [Intel XE#1330]) -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-8/igt@kms_atomic@atomic-plane-damage.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-2/igt@kms_atomic@atomic-plane-damage.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-adlp:         [FAIL][5] ([Intel XE#1080]) -> [CRASH][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html

	
Starting subtest: enable-vfs-bind-unbind-each
Received signal SIGFPE.
Subtest enable-vfs-bind-unbind-each: CRASH (0.004s)

this was IGT bug fixed by commit 7348b4fe58a3

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_big_fb:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][7] +1 other test incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-2/igt@kms_big_fb.html
> 
>   * igt@kms_plane_cursor@primary:
>     - {shard-lnl}:        [PASS][8] -> [DMESG-WARN][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-7/igt@kms_plane_cursor@primary.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-7/igt@kms_plane_cursor@primary.html
> 
>   * {igt@xe_pm@s4-mocs}:
>     - {shard-lnl}:        [DMESG-FAIL][10] -> [FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-8/igt@xe_pm@s4-mocs.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-3/igt@xe_pm@s4-mocs.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133289v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#801]) +7 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +47 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#650]) +11 other tests fail
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#616]) +3 other tests fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#373])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#1178])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1195]) +1 other test incomplete
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-hdmi-a-1.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#308])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][32] ([Intel XE#1214] / [Intel XE#282])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@forked-bo@all-pipes:
>     - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@all-pipes.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#1201]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-433/igt@kms_dp_aux_dev.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible:
>     - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1195]) +4 other tests incomplete
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-436/igt@kms_flip@absolute-wf_vblank-interruptible.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-466/igt@kms_flip@absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         NOTRUN -> [FAIL][41] ([Intel XE#616]) +7 other tests fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#651])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#656]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1122] / [Intel XE#1201])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@pr-cursor-render:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@kms_psr@pr-cursor-render.html
> 
>   * igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#294]) +2 other tests fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#327])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [PASS][56] -> [DMESG-WARN][57] ([Intel XE#1162] / [Intel XE#1214])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][58] ([Intel XE#1162] / [Intel XE#1214]) +6 other tests dmesg-warn
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#756])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1123] / [Intel XE#1201])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1126] / [Intel XE#1201])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][64] -> [TIMEOUT][65] ([Intel XE#1473])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#1195] / [Intel XE#1473])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#366])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#579])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@xe_pm@vram-d3cold-threshold.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [DMESG-WARN][72] ([Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][74] ([Intel XE#827]) -> [PASS][75] +1 other test pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][78] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][79] +5 other tests pass
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - {shard-lnl}:        [FAIL][80] ([Intel XE#480] / [Intel XE#886]) -> [PASS][81] +1 other test pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
>     - {shard-lnl}:        [FAIL][82] ([Intel XE#886]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][84] ([Intel XE#1214]) -> [PASS][85] +1 other test pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-436/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-dg2-set2:     [INCOMPLETE][86] ([Intel XE#1195]) -> [PASS][87] +3 other tests pass
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - {shard-lnl}:        [FAIL][88] ([Intel XE#1430]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - {shard-lnl}:        [SKIP][90] ([Intel XE#1211]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-2/igt@kms_pm_rpm@dpms-lpsp.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-7/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr@psr-suspend@edp-1:
>     - {shard-lnl}:        [INCOMPLETE][92] -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-6/igt@kms_psr@psr-suspend@edp-1.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][94] ([Intel XE#771] / [Intel XE#899]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [FAIL][96] ([Intel XE#899]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
>     - {shard-lnl}:        [DMESG-WARN][98] ([Intel XE#1595]) -> [PASS][99] +1 other test pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-2/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][100] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-adlp:         [SKIP][102] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-1/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-464/igt@xe_module_load@many-reload.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-436/igt@xe_module_load@many-reload.html
> 
>   * {igt@xe_pm@s4-vm-bind-unbind-all}:
>     - shard-adlp:         [DMESG-WARN][106] ([Intel XE#1214]) -> [PASS][107] +1 other test pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
>     - {shard-lnl}:        [ABORT][108] ([Intel XE#1794]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][110] ([Intel XE#324]) -> [FAIL][111] ([Intel XE#1231])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][113] ([Intel XE#1178])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [FAIL][114] ([Intel XE#1178]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#455])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-436/igt@kms_content_protection@srm.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@kms_content_protection@srm.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][116] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][117] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][118] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][119] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-adlp:         [DMESG-WARN][120] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][121] ([Intel XE#1195])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     [FAIL][122] ([Intel XE#616]) -> [DMESG-FAIL][123] ([Intel XE#1162]) +1 other test dmesg-fail
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][125] ([Intel XE#1201])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][126] ([Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][127] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-adlp:         [INCOMPLETE][128] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][129] ([Intel XE#1191] / [Intel XE#1214])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820/shard-adlp-1/igt@xe_pm@s2idle-basic.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820 -> xe-pw-133289v1
> 
>   IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820: 9ba3c5b827bb4ad0418a182a5e0064edb6196820
>   xe-pw-133289v1: 133289v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/index.html
> 
