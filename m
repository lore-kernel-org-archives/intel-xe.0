Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADE7C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 21:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626F7112688;
	Tue,  7 May 2024 21:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKk1nl7X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F2B112687;
 Tue,  7 May 2024 21:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715116453; x=1746652453;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dX/LVntoYr4kRWDp/LMJ1Eoxk4K2CE5VCqCSN+YYaYQ=;
 b=DKk1nl7XZ/Iyo+IVifZF7pgWPk4uZEdoZzN3YHmS/50RZvy05yUf0n9y
 HfTGPTP+mW8LgsLMCWReKbHCdFxYmlRiw7vTTcNBRSFa5KIsttq99d8hf
 dbxxZWWrXyomnT/4XLaEvnisaxYmEPlVrxXmQYPjjz9not6jDHE63nNnE
 lR1sUn1Jjdx15QMFD3iKuP+iTRi2ICNmoV1lpXUE1y4b5wwZWad2rw0s2
 9w/Uav7Bs0/MTBUs+LERQvolwlhjdfrRYln6msqRQvsityIs/axcfbGBy
 p0mFyXUUWNumHc1oi4EsmvLwlYWXoFskTAQHUI/fs2Reoqr3/JiP5nAJY w==;
X-CSE-ConnectionGUID: U959o9+STlOU5g1sBMG/Fg==
X-CSE-MsgGUID: pA/vW0XLQymg3Q5hGPWCgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21502711"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="21502711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 14:14:13 -0700
X-CSE-ConnectionGUID: PMr6uGNZRMSKND3M22fDKw==
X-CSE-MsgGUID: 6w5Xdtn/QOmtLkIePMvc9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33467369"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 07 May 2024 14:14:08 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C90E1312EE;
 Tue,  7 May 2024 22:13:59 +0100 (IST)
Message-ID: <483c713a-e763-4e5a-a2e4-31477e03cd6d@intel.com>
Date: Tue, 7 May 2024 23:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Fix_xe=5Fdevice?=
 =?UTF-8?Q?=2Eh?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240507110959.2747-1-michal.wajdeczko@intel.com>
 <171510196488.1961497.4136156474034241259@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171510196488.1961497.4136156474034241259@8e613ede5ea5>
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



On 07.05.2024 19:12, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix xe_device.h
> URL   : https://patchwork.freedesktop.org/series/133273/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6_full -> xe-pw-133273v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-133273v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133273v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 

there were no functional changes in the series (only fixes in #include
order) so all below 'regressions' must be a noise

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
>   Here are the unknown changes that may have been introduced in xe-pw-133273v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-adlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-9/igt@core_setmaster@master-drop-set-shared-fd.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@core_setmaster@master-drop-set-shared-fd.html

Subtest master-drop-set-shared-fd: SUCCESS (0.027s)

This test caused an abort condition: Lockdep not active

> 
>   * igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind:
>     - shard-adlp:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind.html
> 
>   * igt@xe_exec_balancer@once-virtual-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html
> 
>   * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
>     - shard-adlp:         [PASS][6] -> [TIMEOUT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-9/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_threads@threads-bal-userptr-invalidate-race:
>     - shard-adlp:         [DMESG-FAIL][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-9/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:
>     - {shard-lnl}:        [PASS][10] -> [INCOMPLETE][11] +1 other test incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-lnl-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-lnl-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133273v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][12] ([Intel XE#1195] / [Intel XE#1667])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][13] ([Intel XE#650]) +7 other tests fail
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201]) +7 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@test-time-stamp:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][15] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358]) +1 other test dmesg-warn
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_async_flips@test-time-stamp.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#316])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@basic-force-joiner:
>     - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#1201])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-466/igt@kms_big_joiner@basic-force-joiner.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#367])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#1252])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#787]) +79 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#616]) +8 other tests fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +24 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#306])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#306])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1178]) +1 other test fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#307])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#308])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#308])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#309])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#323])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#776])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#701])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1138] / [Intel XE#1201])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:
>     - shard-dg2-set2:     [PASS][50] -> [DMESG-WARN][51] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [i915#5274])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#656]) +10 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a:
>     - shard-adlp:         NOTRUN -> [FAIL][59] ([Intel XE#1331]) +2 other tests fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#361]) +1 other test fail
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#870])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1122] / [Intel XE#1201])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr-cursor-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_psr@psr-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1127] / [Intel XE#1201])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_vblank@wait-forked@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][69] ([Intel XE#1195]) +1 other test incomplete
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-466/igt@kms_vblank@wait-forked@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_ccs@ctrl-surf-copy:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1123] / [Intel XE#1201])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1123] / [Intel XE#1201])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-threads-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_evict@evict-threads-small-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#688])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_basic@many-execqueues-basic-defer-mmap:
>     - shard-adlp:         NOTRUN -> [FAIL][75] ([Intel XE#1257]) +2 other tests fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_exec_basic@many-execqueues-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [FAIL][77] ([Intel XE#1069]) +1 other test fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#1562]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#1562]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@xe_exec_fault_mode@once-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][82] ([Intel XE#1214] / [Intel XE#1638])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:
>     - shard-adlp:         [PASS][83] -> [FAIL][84] ([Intel XE#1069])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr:
>     - shard-adlp:         [PASS][85] -> [FAIL][86] ([Intel XE#1256])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-9/igt@xe_exec_threads@threads-hang-userptr.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_exec_threads@threads-hang-userptr.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#979])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#366])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][89] ([Intel XE#1162] / [Intel XE#1214]) +6 other tests dmesg-warn
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][90] -> [INCOMPLETE][91] ([Intel XE#1195] / [Intel XE#1358])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [PASS][92] -> [DMESG-WARN][93] ([Intel XE#1214])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#944])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-464/igt@kms_big_joiner@invalid-modeset-force-joiner.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-466/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1:
>     - {shard-lnl}:        [DMESG-WARN][98] ([Intel XE#1595]) -> [PASS][99] +1 other test pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-lnl-6/igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-lnl-2/igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1.html
> 
>   * igt@kms_cursor_legacy@forked-bo@all-pipes:
>     - shard-dg2-set2:     [DMESG-WARN][100] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][101] +8 other tests pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@all-pipes.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][102] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1195]) -> [PASS][105] +1 other test pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-433/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible:
>     - {shard-lnl}:        [FAIL][106] ([Intel XE#480] / [Intel XE#886]) -> [PASS][107] +1 other test pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:
>     - {shard-lnl}:        [FAIL][108] ([Intel XE#886]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1.html
> 
>   * igt@kms_plane_cursor@primary:
>     - {shard-lnl}:        [DMESG-WARN][110] ([Intel XE#1330]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-lnl-1/igt@kms_plane_cursor@primary.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-lnl-6/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][112] ([Intel XE#771] / [Intel XE#899]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][114] ([Intel XE#899]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][116] ([Intel XE#1600]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [INCOMPLETE][118] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-464/igt@xe_module_load@many-reload.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@xe_module_load@many-reload.html
> 
>   * {igt@xe_pm@s2idle-vm-bind-prefetch}:
>     - shard-dg2-set2:     [INCOMPLETE][120] ([Intel XE#1195] / [Intel XE#1694]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-adlp:         [DMESG-WARN][122] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-6/igt@xe_pm@s3-basic-exec.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@xe_pm@s3-basic-exec.html
> 
>   * {igt@xe_pm@s3-mocs}:
>     - shard-adlp:         [DMESG-WARN][124] ([Intel XE#1214]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-8/igt@xe_pm@s3-mocs.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@xe_pm@s3-mocs.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-adlp:         [INCOMPLETE][126] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1451]) -> [ABORT][127] ([Intel XE#1717])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][128] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][129] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][130] ([Intel XE#324]) -> [FAIL][131] ([Intel XE#1231]) +1 other test fail
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-adlp:         [DMESG-WARN][132] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][133] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][134] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][135] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][136] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][137] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][138] ([Intel XE#616]) -> [DMESG-FAIL][139] ([Intel XE#1162]) +1 other test dmesg-fail
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [INCOMPLETE][140] ([Intel XE#1195]) -> [DMESG-WARN][141] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [DMESG-WARN][142] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][143] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-adlp:         [DMESG-WARN][144] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][145] ([Intel XE#1195] / [Intel XE#927])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][146] ([Intel XE#1195]) -> [INCOMPLETE][147] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) +1 other test incomplete
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-adlp:         [SKIP][148] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#836])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][151] ([Intel XE#1201])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-adlp:         [DMESG-WARN][152] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][153] ([Intel XE#1191] / [Intel XE#1214])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][154] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][155] ([Intel XE#1191] / [Intel XE#1214])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [DMESG-WARN][156] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][157] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][158] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][159] ([Intel XE#1214] / [Intel XE#1608])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][160] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][161] ([Intel XE#1473] / [Intel XE#392])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][162] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][163] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [DMESG-WARN][164] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][165] ([Intel XE#1195])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-adlp:         [INCOMPLETE][166] ([Intel XE#1195] / [Intel XE#1358]) -> [FAIL][167] ([Intel XE#1257])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6/shard-adlp-9/igt@xe_pm@s3-exec-after.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/shard-adlp-1/igt@xe_pm@s3-exec-after.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
>   [Intel XE#1562]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>   [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>   [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
>   [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
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
>   * Linux: xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6 -> xe-pw-133273v1
> 
>   IGT_7837: 1a77ac56d4538a5a2b9cecd59beab187248f35ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1245-63b497dce7e6aab01b4aa0b6c16899600b10e7b6: 63b497dce7e6aab01b4aa0b6c16899600b10e7b6
>   xe-pw-133273v1: 133273v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133273v1/index.html
> 
