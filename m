Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C98C02183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 09:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81832894EA;
	Tue, 14 Jan 2025 09:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kH87fA8B";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E45894EA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 09:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A664D5C56D9
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 09:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD063C4CEDD
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736847360;
 bh=zp8j0S/v7qQq7tl/e42MbEawc8GTHxAQcLFTmDYODkI=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=kH87fA8BZ7xcByR1Ltj1XQr05SAl6sPkqU0sEuqYd1d9tCO82R7d31g6L+WZ84eAW
 dUL0XbL4kWOYcD/0uWntuzBwcAdj2xcNidx1UAI1R5NuMqKPEM+hK3hmmonLedsAmd
 UdkNndlNWBem+K+oxX2Sx/L7k2AhFl3XT8jN1GYy645wJYyyH0dWoGDa2oIypwgSYb
 f/QRe6RjnxcX0XabQFi2+HfG+4m2I3oR4P+RpwuFXzGqpOOIHVVdbImwE6fvrn4yJH
 gL+vm3uX369PKlc1P4voxms3tviuhx9EA1jBfi1x/xp8+PdBZSmtgVWmN5rjVchF2l
 5FlkRpX4HLcag==
Date: Tue, 14 Jan 2025 10:35:55 +0100
From: Joel Granados <joel.granados@kernel.org>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 treewide: const qualify ctl_tables where applicable (rev2)
Message-ID: <4lwrqbmyzey57cfagup6ur45owh5hbttamlllghvsh22s5voyi@zpgzbhbx2vcs>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <173677806092.3265512.10738274622257046049@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173677806092.3265512.10738274622257046049@b555e5b46a47>
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

On Mon, Jan 13, 2025 at 02:21:00PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: treewide: const qualify ctl_tables where applicable (rev2)
> URL   : https://patchwork.freedesktop.org/series/143333/
> State : failure
After searching for "Xe.CI.Full: failure" in lore.kernel.org, I believe
that this is just another false positive. If you see that I'm wrong
please get back to me with a way to reproduce and a way to pinpoint
where things are going wrong. ATM there are way to many links that I
don't know what to do with.

Best

> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde_full -> xe-pw-143333v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143333v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143333v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-143333v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
> 
>   * igt@xe_exec_reset@close-fd:
>     - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-1/igt@xe_exec_reset@close-fd.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-4/igt@xe_exec_reset@close-fd.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-bmg:          [SKIP][5] ([Intel XE#2293] / [Intel XE#2380]) -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          [SKIP][7] ([Intel XE#2293]) -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-143333v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-lnl:          NOTRUN -> [ABORT][9] ([Intel XE#3914])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@core_hotunplug@hotreplug.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          [PASS][10] -> [FAIL][11] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
>     - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#3718] / [Intel XE#827])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2550]) +23 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2370])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#316]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367]) +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +146 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#2692])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#2705])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2907]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#314])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#307])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1188])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2291]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1135])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-464/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#3288] / [Intel XE#3321])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#2882])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2316]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#886]) +1 other test fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
>     - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#2882] / [Intel XE#3288])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#3321])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
>     - shard-bmg:          [PASS][51] -> [FAIL][52] ([Intel XE#3321])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>     - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#301]) +3 other tests fail
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455]) +4 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#651]) +11 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#2333])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#658])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2313]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#653]) +14 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#1503])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#3012])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2925])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-lnl:          [PASS][66] -> [INCOMPLETE][67] ([Intel XE#4016])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
>     - shard-adlp:         [PASS][68] -> [DMESG-WARN][69] ([Intel XE#2953]) +3 other tests dmesg-warn
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          NOTRUN -> [FAIL][70] ([Intel XE#718])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1489]) +5 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1489])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2939])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#3414]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#1435])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#330])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#2159]) +1 other test fail
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2168])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_vrr@lobf.html
> 
>   * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
>     - shard-dg2-set2:     [PASS][82] -> [ABORT][83] ([Intel XE#2625]) +1 other test abort
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-436/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1126])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2905])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][87] ([Intel XE#1473])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#1392]) +7 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#288]) +9 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2905]) +5 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1192])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#512])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2284] / [Intel XE#366])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-dg2-set2:     [PASS][97] -> [INCOMPLETE][98] ([Intel XE#1358])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-433/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-435/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-dg2-set2:     [PASS][99] -> [ABORT][100] ([Intel XE#1358])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-463/igt@xe_pm@s3-exec-after.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-432/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [PASS][101] -> [ABORT][102] ([Intel XE#1358] / [Intel XE#1607])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-7/igt@xe_pm@s4-basic.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-2/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [PASS][103] -> [ABORT][104] ([Intel XE#1358] / [Intel XE#1794])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@cpg-basic:
>     - shard-dg2-set2:     [PASS][105] -> [ABORT][106] ([Intel XE#4046])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-464/igt@xe_pm_residency@cpg-basic.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#944]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][108] ([Intel XE#3908]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][110] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][112] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [ABORT][114] -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-bmg:          [SKIP][116] ([Intel XE#2291]) -> [PASS][117] +1 other test pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-bmg:          [INCOMPLETE][118] ([Intel XE#3226]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [SKIP][120] ([Intel XE#2425]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [SKIP][122] ([Intel XE#1340]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-bmg:          [SKIP][124] ([Intel XE#3009]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_dp_aux_dev.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][126] ([Intel XE#2316]) -> [PASS][127] +4 other tests pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2-set2:     [FAIL][128] ([Intel XE#301]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][130] ([Intel XE#2882] / [Intel XE#3288]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][132] ([Intel XE#2882]) -> [PASS][133] +1 other test pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][134] -> [PASS][135] +1 other test pass
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a6-dp4.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>     - shard-lnl:          [FAIL][136] ([Intel XE#886]) -> [PASS][137] +1 other test pass
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
>     - shard-bmg:          [FAIL][138] ([Intel XE#3288] / [Intel XE#3321]) -> [PASS][139] +2 other tests pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>     - shard-dg2-set2:     [FAIL][140] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][141] +1 other test pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
>     - shard-bmg:          [FAIL][142] ([Intel XE#3321]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-adlp:         [DMESG-FAIL][144] ([Intel XE#1033]) -> [PASS][145] +2 other tests pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [FAIL][146] ([Intel XE#1874]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [INCOMPLETE][148] ([Intel XE#4052]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [SKIP][150] ([Intel XE#3012]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][152] ([Intel XE#361]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-lnl:          [INCOMPLETE][154] -> [PASS][155] +1 other test pass
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][156] ([Intel XE#2883]) -> [PASS][157] +3 other tests pass
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#1392]) -> [PASS][159] +1 other test pass
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [SKIP][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185]) ([Intel XE#378]) -> ([PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-4/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-2/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-2/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-8/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-8/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-5/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-6/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-6/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-6/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-6/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-4/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-4/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-4/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-7/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-7/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-1/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-1/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-5/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-5/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-7/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-3/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-3/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-3/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-1/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-8/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-7/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-6/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-2/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-3/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-2/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-3/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-8/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-3/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-8/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-5/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-8/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-7/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-7/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-7/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-4/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-4/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-4/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-5/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-5/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-6/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-4/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-6/igt@xe_module_load@load.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [DMESG-WARN][211] ([Intel XE#2953]) -> [PASS][212] +9 other tests pass
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [ABORT][213] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][214] +1 other test pass
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [ABORT][215] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][216]
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-2/igt@xe_pm@s4-exec-after.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-1/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [FAIL][217] ([Intel XE#958]) -> [PASS][218]
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
>     - shard-adlp:         [DMESG-FAIL][219] ([Intel XE#1033]) -> [DMESG-WARN][220] ([Intel XE#1033])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][221] ([Intel XE#2312]) -> [SKIP][222] ([Intel XE#2311]) +10 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][223] ([Intel XE#2311]) -> [SKIP][224] ([Intel XE#2312]) +10 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [FAIL][225] ([Intel XE#2333]) -> [SKIP][226] ([Intel XE#2312]) +4 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][227] ([Intel XE#2312]) -> [FAIL][228] ([Intel XE#2333]) +5 other tests fail
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][229] ([Intel XE#2312]) -> [SKIP][230] ([Intel XE#2313]) +11 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][231] ([Intel XE#2313]) -> [SKIP][232] ([Intel XE#2312]) +11 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][233] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][234] ([Intel XE#3544])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][235] ([Intel XE#2509]) -> [SKIP][236] ([Intel XE#2426])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-bmg:          [INCOMPLETE][237] ([Intel XE#1473]) -> [TIMEOUT][238] ([Intel XE#1473])
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-bmg:          [TIMEOUT][239] ([Intel XE#1473]) -> [INCOMPLETE][240] ([Intel XE#1473]) +1 other test incomplete
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-large.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-bmg:          [INCOMPLETE][241] ([Intel XE#1473]) -> [TIMEOUT][242] ([Intel XE#1473] / [Intel XE#2472])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          [SKIP][243] ([Intel XE#2833]) -> [SKIP][244] ([Intel XE#1192])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html
> 
>   
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
>   [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
>   [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
>   [Intel XE#4016]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4016
>   [Intel XE#4046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4046
>   [Intel XE#4052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4052
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde -> xe-pw-143333v2
> 
>   IGT_8186: 2c6b2f0ed4075aa1ac3d341d612e41343cff4e4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde: 00f4619246294b1de4bac42742cfef95c1f37fde
>   xe-pw-143333v2: 143333v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143333v2/index.html

-- 

Joel Granados
