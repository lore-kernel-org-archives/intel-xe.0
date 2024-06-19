Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8389CC2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 22:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1783810E295;
	Wed, 19 Jun 2024 22:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFnM8Yaz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082DE10E295
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 22:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718837149; x=1750373149;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5FzrgLAj6ukts0bGj5EVAsJZeN0vRMo+bQXKG4bjpP0=;
 b=kFnM8Yazl75n8+wSMKUSIRL1GTZKKsZXX1qtyXc5Ntm7LjMyS9+jSSVy
 ytyHY5Lz/+4u1YRi1SDHgijq7fm8pZ1cz3IXw0KS2k7Lu9IuMIqq1k3l6
 HngB7wJNCYaVsgOd+Gs4N6RE+9aVlHJUyHwOMc3FI1T+83z9IFzXoLCUG
 GmzhhC/xYFdQJ6K4pHe3lMtyYF7OCZdEea9F3oArQBpGSJcfGQ1+TCusS
 SIo07ZrgTRj2yyWewCzPv4LKJFGGZaPp1r+Vnz29j06ftnLILt4m3R0uT
 L8BjQmPC6YrokktuCuVwMaHy2JkNg7pyrBW5SsShCqibJLsiuIPEkL6cj g==;
X-CSE-ConnectionGUID: PdMusG9XSXeeUyT+wKllow==
X-CSE-MsgGUID: +BP4GpQPSQmE7zqJ1OL0LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26480606"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="26480606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 15:45:48 -0700
X-CSE-ConnectionGUID: agjpRjZSRR6YQK7n1jbwPg==
X-CSE-MsgGUID: tr9rNbjHTWC5sRdEQM8w0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="73237436"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 19 Jun 2024 15:45:40 -0700
Received: from [10.246.25.139] (unknown [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 87C722FC57
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:45:34 +0100 (IST)
Message-ID: <688a8057-350e-43fe-81c1-0d687f2faf6b@intel.com>
Date: Thu, 20 Jun 2024 00:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Mo?=
 =?UTF-8?Q?ve_ARAT_interrupts_enabling_to_the_upload_step?=
To: intel-xe@lists.freedesktop.org
References: <20240619163413.817-1-michal.wajdeczko@intel.com>
 <171883667240.125140.1147688458154869222@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171883667240.125140.1147688458154869222@a6498e030952>
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



On 20.06.2024 00:37, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Move ARAT interrupts enabling to the upload step
> URL   : https://patchwork.freedesktop.org/series/135069/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986_full -> xe-pw-135069v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135069v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135069v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135069v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated

> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

<3> [534.743924] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2
-> 0x0)
<4> [534.743931] ------------[ cut here ]------------
<4> [534.743932] xe 0000:00:02.0: [drm] Unexpected DBuf power power
state (0x00000000, expected 0x00000001)
<4> [534.743965] WARNING: CPU: 7 PID: 1161 at
drivers/gpu/drm/i915/display/intel_display_power_well.c:957
gen9_disable_dc_states+0x1b3/0x200 [xe]


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_legacy:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-lnl-8/igt@kms_cursor_legacy.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - {shard-lnl}:        [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-lnl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135069v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#873])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#1231])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][11] ([Intel XE#1204])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#619])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#619])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +20 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1204]) +1 other test fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#308])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#308])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#308])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][32] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#282])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#323])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#776])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#651]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#1195])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1158] / [Intel XE#1201])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#653]) +5 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][52] ([Intel XE#1035] / [Intel XE#1195])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#361])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#870])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1122] / [Intel XE#1201])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-cursor-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#929]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-blt.html
> 
>   * igt@kms_psr@psr-cursor-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_psr@psr-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1127] / [Intel XE#1201])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#327])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#756])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-2/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#756])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-large-external:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#261])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-2/igt@xe_evict@evict-beng-large-external.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#1041])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][69] -> [TIMEOUT][70] ([Intel XE#1473] / [Intel XE#402])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@xe_evict@evict-small.html
> 
>   * igt@xe_exec_basic@multigpu-once-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1392])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-imm.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#288]) +3 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#560])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-434/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#366])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][78] -> [ABORT][79] ([Intel XE#1794])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-1/igt@xe_pm@s4-mocs.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@x-tiled-addfb-size-overflow:
>     - shard-adlp:         [INCOMPLETE][80] ([Intel XE#1195]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
>     - {shard-lnl}:        [INCOMPLETE][82] -> [PASS][83] +1 other test pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][84] ([Intel XE#282]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@forked-bo@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][86] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][87] +4 other tests pass
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@pipe-b.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][88] ([Intel XE#1214]) -> [PASS][89] +3 other tests pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-adlp:         [SKIP][90] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-1/igt@kms_pm_rpm@i2c.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-9/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - {shard-lnl}:        [DMESG-WARN][92] -> [PASS][93] +3 other tests pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-lnl-5/igt@kms_psr@fbc-psr2-suspend.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-lnl-8/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][94] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#1195]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-adlp:         [DMESG-WARN][98] ([Intel XE#1214] / [Intel XE#1975]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-6/igt@xe_gt_freq@freq_reset_multiple.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-6/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - {shard-lnl}:        [SKIP][100] ([Intel XE#1192]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-lnl-5/igt@xe_live_ktest@xe_dma_buf.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-lnl-8/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][102] ([Intel XE#1214] / [Intel XE#1941]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-9/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-4/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     [SKIP][104] ([Intel XE#801]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][107] ([Intel XE#316]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#316]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#619]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#619])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][113] ([Intel XE#607])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1124]) -> [SKIP][115] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][117] ([Intel XE#1124]) +4 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#346]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#346])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][121] ([Intel XE#367])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#787]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][125] ([Intel XE#787]) +48 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][127] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][131] ([Intel XE#306]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#306]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][135] ([Intel XE#373]) +4 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#373]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][139] ([Intel XE#307]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#307]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#307])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#308]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#308])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][145] ([Intel XE#308])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom:
>     - shard-dg2-set2:     [DMESG-WARN][146] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][147] ([Intel XE#282]) +3 other tests dmesg-warn
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][148] ([Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][149] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#282]) -> [DMESG-WARN][151] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#323]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#323])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [i915#3804]) -> [SKIP][155] ([i915#3804])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][157] ([Intel XE#703])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#1138]) -> [SKIP][159] ([Intel XE#1138] / [Intel XE#1201])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#455]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][163] ([Intel XE#658])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#651]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][167] ([Intel XE#651]) +17 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][169] ([Intel XE#653]) +13 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#653]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#498]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +2 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#305]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#870]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#870])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_pm_backlight@fade.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1129]) -> [SKIP][183] ([Intel XE#1129] / [Intel XE#1201])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#908]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#908])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1122]) -> [SKIP][187] ([Intel XE#1122] / [Intel XE#1201])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#929]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][191] ([Intel XE#929]) +11 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#327]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#1127]) -> [SKIP][195] ([Intel XE#1127] / [Intel XE#1201])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][197] ([Intel XE#327]) +1 other test skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][199] ([Intel XE#1729])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][200] ([Intel XE#1551]) -> [DMESG-WARN][201] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][202] -> [DMESG-WARN][203] ([Intel XE#1214]) +1 other test dmesg-warn
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][205] ([Intel XE#455]) +6 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-433/igt@kms_vrr@flipline.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][207] ([Intel XE#1091])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1091]) -> [SKIP][209] ([Intel XE#1091] / [Intel XE#1201])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +3 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][213] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1123]) -> [SKIP][215] ([Intel XE#1123] / [Intel XE#1201])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][216] ([Intel XE#1041]) -> [FAIL][217] ([Intel XE#1600])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-imm:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][219] ([Intel XE#288]) +14 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-imm.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#288]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][222] ([Intel XE#1962]) -> [DMESG-FAIL][223] ([Intel XE#358])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [DMESG-WARN][224] ([Intel XE#1214]) -> [DMESG-WARN][225] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1192]) -> [SKIP][227] ([Intel XE#1192] / [Intel XE#1201])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][229] ([Intel XE#979])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][231] ([Intel XE#366])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@xe_pm@d3cold-basic.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#366]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#366])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [DMESG-WARN][234] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][235] ([Intel XE#1551] / [Intel XE#569])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [INCOMPLETE][236] ([Intel XE#1162] / [Intel XE#1195]) -> [DMESG-WARN][237] ([Intel XE#1162] / [Intel XE#1941])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#944]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#944])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][241] ([Intel XE#944]) +2 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [DMESG-WARN][242] ([Intel XE#1760]) -> [DMESG-WARN][243] ([Intel XE#1214] / [Intel XE#1760])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-432/igt@xe_wedged@basic-wedged.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-436/igt@xe_wedged@basic-wedged.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-WARN][244] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][245] ([Intel XE#1760])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1207
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
>   [Intel XE#1707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1707
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
>   [Intel XE#1975]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986 -> xe-pw-135069v1
> 
>   IGT_7892: 7892
>   xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986: 5a9469e2b0a01256827b5ace72bae9c525005986
>   xe-pw-135069v1: 135069v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135069v1/index.html
> 
