Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE82C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 10:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993F310EBCB;
	Fri, 19 Jul 2024 10:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioVMqQZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B87A10EBCB
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721385079; x=1752921079;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=c/8pvkw8b9GO94Hr62gfsHf9U6Le/nbQP9BrCfuzEPI=;
 b=ioVMqQZA5pn5dM3Pughs+5LxULKMdAdtGJA622w1eKtdzbkIjAGiQO9H
 U/vgH4hk6+oJwdfUxk7ydoRQnqdKHC474xffBGS5NwFuPXcsWwO/hdCqW
 YthVCj6bBw9styEA+kK04wN2BJ3Svl0bCXm5VXb10tyKJO1EYqLnJLy3r
 5MPLLfmsAVrsxskla8Yo43w+X852KsBODyZOaNli/hRDXYhyP0TEawbz4
 lNta+lBus68nGDYK2eRpAACqcYRua1VPmS4yfJDFFIBWn5jPgZbQmtGOH
 m8fPCHyBcS7eqQ2g0/2ayJw5LIqnZlaRZMAOYfy0GOWHeHd889igb2tqA w==;
X-CSE-ConnectionGUID: TiXQmXYaTySvizzLpfVPgg==
X-CSE-MsgGUID: dPuPjiHJT+2bSgrfpIAERw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19105513"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="19105513"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 03:31:08 -0700
X-CSE-ConnectionGUID: bd61vYTEQdKcb7AP2fXDuA==
X-CSE-MsgGUID: ZbMCPwt3QyqrG41ZzGjyTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="55592202"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 19 Jul 2024 03:31:04 -0700
Received: from [10.246.48.8] (unknown [10.246.48.8])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3FC6727BAD
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 11:30:57 +0100 (IST)
Message-ID: <39366920-782f-4343-9084-a4c32dae0ac5@intel.com>
Date: Fri, 19 Jul 2024 12:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Add_NE?=
 =?UTF-8?Q?EDS=5F2M_BO_flag_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240715180538.1418-1-michal.wajdeczko@intel.com>
 <172136910054.288091.6835402881867639447@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172136910054.288091.6835402881867639447@2413ebb6fbb6>
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



On 19.07.2024 08:05, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add NEEDS_2M BO flag (rev2)
> URL   : https://patchwork.freedesktop.org/series/136107/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd_full -> xe-pw-136107v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136107v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136107v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-136107v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, also a different set than reported in rev1

> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

<3> [166.489417] xe 0000:00:02.0: [drm] *ERROR* CPU pipe B FIFO
underrun: port,transcoder,
<6> [168.133814] [IGT] kms_async_flips: finished subtest
pipe-B-HDMI-A-1-x, SUCCESS

> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][3] +1 other test dmesg-fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

<3> [473.598833] xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO
underrun: port,transcoder,

> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-lnl:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][6] ([Intel XE#1204]) -> [DMESG-FAIL][7] +1 other test dmesg-fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_plane@plane-position-hole@pipe-b-plane-1}:
>     - shard-lnl:          [PASS][8] -> [DMESG-WARN][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136107v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@legacy-format:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][10] ([Intel XE#2226]) +11 other tests dmesg-warn
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_addfb_basic@legacy-format.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#1231])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201]) +25 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#619])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#346])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#1252])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#306])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#307])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1413])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1424])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#308])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#323])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#323])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#307])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#776])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1135] / [Intel XE#1201])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#310])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][46] -> [FAIL][47] ([Intel XE#1874]) +3 other tests fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#656]) +6 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#616])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#656]) +13 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#417])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#361])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#498]) +5 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][60] ([Intel XE#1195])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#870])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1122] / [Intel XE#1201])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#908])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-pr-cursor-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1406])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-blt.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-lnl:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#2052]) +1 other test dmesg-warn
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-1/igt@kms_psr@psr2-suspend.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-1/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#327])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1437])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1127])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [PASS][77] -> [FAIL][78] ([Intel XE#771] / [Intel XE#899])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][79] -> [FAIL][80] ([Intel XE#899])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1091] / [Intel XE#1201])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_ccs@block-multicopy-inplace:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html
> 
>   * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
>     - shard-lnl:          [PASS][83] -> [ABORT][84] ([Intel XE#2331]) +1 other test abort
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#1050])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1126] / [Intel XE#1201])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][87] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][88] -> [TIMEOUT][89] ([Intel XE#1473] / [Intel XE#392])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-beng-small-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-2/igt@xe_evict@evict-beng-small-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][91] -> [INCOMPLETE][92] ([Intel XE#1195] / [Intel XE#1473])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-threads-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@xe_evict@evict-threads-large-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#688])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1392])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-prefetch:
>     - shard-lnl:          NOTRUN -> [FAIL][99] ([Intel XE#1069])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-dg2-set2:     [PASS][100] -> [ABORT][101] ([Intel XE#2271])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [PASS][102] -> [DMESG-WARN][103] ([Intel XE#1620])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-adlp:         NOTRUN -> [FAIL][104] ([Intel XE#1999]) +2 other tests fail
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#512])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#1337])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1061])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#366])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][110] ([Intel XE#1191] / [Intel XE#1727] / [Intel XE#2226])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [PASS][111] -> [ABORT][112] ([Intel XE#1358] / [Intel XE#1794])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-4/igt@xe_pm@s4-basic-exec.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][113] -> [ABORT][114] ([Intel XE#1358])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-2/igt@xe_pm@s4-exec-after.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>     - shard-lnl:          [PASS][115] -> [ABORT][116] ([Intel XE#1358] / [Intel XE#1607])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-1/igt@xe_pm@s4-exec-after.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [PASS][117] -> [ABORT][118] ([Intel XE#1358] / [Intel XE#1794])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#944])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][121] ([Intel XE#1426]) -> [PASS][122] +1 other test pass
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][123] ([Intel XE#1426]) -> [PASS][124] +1 other test pass
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-lnl:          [FAIL][125] ([Intel XE#1659]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][127] ([Intel XE#1195]) -> [PASS][128] +1 other test pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-1.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-9/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x:
>     - shard-lnl:          [FAIL][131] ([Intel XE#1491]) -> [PASS][132] +1 other test pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-lnl:          [INCOMPLETE][133] ([Intel XE#2050]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-FAIL][137] -> [PASS][138] +2 other tests pass
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-6/igt@kms_plane@plane-position-covered.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-7/igt@kms_plane@plane-position-covered.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-b-plane-3}:
>     - shard-lnl:          [DMESG-WARN][139] -> [PASS][140] +2 other tests pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][141] ([Intel XE#1874]) -> [PASS][142]
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [FAIL][143] ([Intel XE#771] / [Intel XE#899]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][145] ([Intel XE#899]) -> [PASS][146] +1 other test pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         [FAIL][147] ([Intel XE#899]) -> [PASS][148]
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [INCOMPLETE][149] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][150]
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][151] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][152] +2 other tests pass
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-436/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_reset@parallel-close-fd:
>     - shard-adlp:         [ABORT][153] ([Intel XE#2271] / [Intel XE#2309]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-6/igt@xe_exec_reset@parallel-close-fd.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@xe_exec_reset@parallel-close-fd.html
> 
>   * igt@xe_gt_freq@freq_range_exec:
>     - shard-dg2-set2:     [ABORT][155] ([Intel XE#2271]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-435/igt@xe_gt_freq@freq_range_exec.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-463/igt@xe_gt_freq@freq_range_exec.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [ABORT][157] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [ABORT][159] ([Intel XE#1794]) -> [PASS][160] +1 other test pass
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][161] -> [FAIL][162] ([Intel XE#1231])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-adlp:         [INCOMPLETE][163] ([Intel XE#1195]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#367])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][165] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][166] ([Intel XE#1551])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [FAIL][167] ([Intel XE#1000]) -> [TIMEOUT][168] ([Intel XE#1473])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-adlp:         [ABORT][169] ([Intel XE#2273]) -> [ABORT][170] ([Intel XE#2271])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
>   [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>   [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>   [Intel XE#2273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2273
>   [Intel XE#2309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309
>   [Intel XE#2331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2331
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd -> xe-pw-136107v2
> 
>   IGT_7930: 7930
>   xe-1627-776d87c393f0e4fb669f05e1cdac000c63649afd: 776d87c393f0e4fb669f05e1cdac000c63649afd
>   xe-pw-136107v2: 136107v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136107v2/index.html
> 
