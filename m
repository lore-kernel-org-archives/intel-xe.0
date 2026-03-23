Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC24EC01A9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5E510E2D2;
	Mon, 23 Mar 2026 09:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="egSxRfxK";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9FE10E2D2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yftbfzjIkFbpUcOmBrCQMG+kGN4PrLKZn7A/GsNoy3I=; b=egSxRfxKV0dmAr4ts2cHGqLXyA
 C4BLSvWtqpGTOa6m/BwcQ2OBUGIgNhbSj1J1aYk54jHlhOMuPIGnnDiieNwamkGd00tflmti/yeLx
 +6rQm1BbdPor/mh10g89TVvofVHEc7ru3SqLaIXdg0PPxmOXUww2eSR7AMEzipCqI+4xkrM0aeoi+
 hzkG2dBZejOnMtAdXGtfxpr3FwI50DaGoyOefwsN8STFl8K8np9hNCBDza+JkHUGjJr++hVSbObgC
 AkVOHpGsgiQHiDdyrfyUQSxhbt1XpTus0YiEbj80jGGjqwx1oFiZJo+rRGyAedsCr5AOpTpsXaglS
 dGeoSk1A==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w4bnr-004mcz-3e
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 10:42:31 +0100
Message-ID: <8f60fc5a-d779-47b2-b007-a4cc59e6a338@igalia.com>
Date: Mon, 23 Mar 2026 09:42:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_*AuxCCS_han?=
 =?UTF-8?Q?dling_and_render_compression_modifiers?=
To: intel-xe@lists.freedesktop.org
References: <20260320170222.88625-1-tvrtko.ursulin@igalia.com>
 <177411552592.383330.15034042570807454170@a3b018990fe9>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <177411552592.383330.15034042570807454170@a3b018990fe9>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 21/03/2026 17:52, Patchwork wrote:
> *Patch Details*
> *Series:*	*AuxCCS handling and render compression modifiers
> *URL:*	https://patchwork.freedesktop.org/series/163610/ <https:// 
> patchwork.freedesktop.org/series/163610/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-4753-
>   f64c2a6453d0e0196f9697b8429bf97b1da1807e_FULL -> xe-pw-163610v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-163610v1_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-163610v1_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-163610v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-lnl-3/
>         igt@kms_fbcon_fbt@fbc-suspend.html> -> INCOMPLETE <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-lnl-7/
>         igt@kms_fbcon_fbt@fbc-suspend.html>

There is already an incomplete in the history at 
xe-4754-f202c0d0dece0eeefb750a6a9d80f4b7442529f4 so I am pretty sure 
this one is unrelated.

>   *
> 
>     igt@xe_eudebug@basic-vm-access-userptr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_eudebug@basic-vm-
>         access-userptr.html> +6 other tests skip

'/sys/class/drm/card0/device/enable_eudebug' sysfs attribute not found, 
EU DEBUG not supported

Which is the same as all the history for this test I can see so it is 
some CI confusion that it is flagging this as new.

Regards,

Tvrtko

> 
>     Known issues
> 
> Here are the changes found in xe-pw-163610v1_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_big_fb@linear-max-
>         hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#7059 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7059> / Intel
>         XE#7085 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_bw@connected-linear-
>         tiling-4-displays-2160x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894> / Intel XE#7373 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7373>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-10/igt@kms_bw@linear-tiling-2-
>         displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367> / Intel XE#7354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_ccs@crc-primary-
>         suspend-yf-tiled-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +7 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325> / Intel
>         XE#7358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7358>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_edid@dp-mode-timings:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_chamelium_edid@dp-
>         mode-timings.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +4 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_sharpness_filter@filter-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_chamelium_sharpness_filter@filter-basic.html> (Intel
>         XE#6507 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390> /
>         Intel XE#6974 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6974>)
>   *
> 
>     igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html>
>         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178> / Intel XE#3304 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3304> / Intel XE#7374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7374>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x32:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_cursor_crc@cursor-
>         random-32x32.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
>         varying-size.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-5/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291> / Intel
>         XE#7343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2244>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#2375 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2375>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) +6 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-
>         panning@cd-dp2-hdmi-a3.html> (Intel XE#5545 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5545> / Intel
>         XE#6652 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_flip@flip-vs-suspend.html> -> INCOMPLETE <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-1/
>         igt@kms_flip@flip-vs-suspend.html> (Intel XE#2049 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel
>         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>) +1 other test incomplete
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>         upscaling.html> (Intel XE#7178 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7178> / Intel XE#7351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-
>     reflect-x:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-
>         linear-reflect-x.html> (Intel XE#7179 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html>
>         (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7061> / Intel XE#7356 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7356>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_frontbuffer_tracking@fbc-tiling-linear.html> (Intel
>         XE#4141 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4141>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352> /
>         Intel XE#7399 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7399>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2313>) +16 other tests skip
>   *
> 
>     igt@kms_joiner@basic-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_joiner@basic-ultra-
>         joiner.html> (Intel XE#6911 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6911> / Intel XE#7378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7378>)
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_panel_fitting@legacy.html> (Intel XE#2486 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>   *
> 
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-
>     clamping:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_plane@pixel-
>         format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html>
>         (Intel XE#7283 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7283>) +1 other test skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@kms_plane_multiple@2x-
>         tiling-y.html> (Intel XE#5021 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5021> / Intel XE#7377 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7377>)
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_pm_backlight@fade.html> (Intel XE#7376 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7376> / Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-
>         primary-plane-update-sf-dmg-area.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-10/igt@kms_psr2_su@page_flip-
>         xrgb8888.html> (Intel XE#2387 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2387> / Intel XE#7429 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7429>)
>   *
> 
>     igt@kms_psr@fbc-psr-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_psr@fbc-psr-
>         basic.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +6 other
>         tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel
>         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904> / Intel XE#7342 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7342>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@kms_tv_load_detect@load-
>         detect.html> (Intel XE#2450 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2450> / Intel XE#5857 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5857>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-9/
>         igt@xe_evict@evict-mixed-many-threads-small.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel
>         XE#6321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>   *
> 
>     igt@xe_evict@evict-small-multi-queue-priority:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_evict@evict-small-
>         multi-queue-priority.html> (Intel XE#7140 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7140>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-10/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-null-defer-mmap.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7372>) +5 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html>
>         (Intel XE#7136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7136>) +7 other tests skip
>   *
> 
>     igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-10/
>         igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-
>         priority-smem.html> (Intel XE#6874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +18 other
>         tests skip
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@xe_exec_threads@threads-
>         multi-queue-rebind.html> (Intel XE#7138 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +5 other
>         tests skip
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_relay_init.html> -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-163610v1/shard-bmg-4/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_relay_init.html> (Intel XE#7578 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7578>)
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-bmg: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-9/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-10/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-10/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4753-
>         f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-9/
>         igt@xe_module_load@load.html>) -> (PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-9/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-10/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-10/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-10/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
>         igt@xe_module_load@load.html>) (Intel XE#2457 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2457> / Intel
>         XE#7405 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405>)
>   *
> 
>     igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-
>         coherency-fail-basic.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +1 other test
>         skip
>   *
> 
>     igt@xe_pat@pat-index-xelp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_pat@pat-index-
>         xelp.html> (Intel XE#2245 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2245>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-vram:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@xe_pm@d3cold-mmap-
>         vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#7370 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>   *
> 
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-9/igt@xe_pxp@pxp-termination-
>         key-update-post-suspend.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733> / Intel
>         XE#7417 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7417>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-query:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-2/igt@xe_query@multigpu-query-
>         invalid-query.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894> / Intel XE#7373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7373>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> +3 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291> / Intel XE#7343 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7343>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/
>         shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
>         igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-6/igt@kms_flip@2x-nonexisting-fb.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-2/
>         igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-
>         interruptible.html> (Intel XE#5545 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5545> / Intel
>         XE#6652 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6652>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-163610v1/shard-bmg-2/igt@kms_flip@single-buffer-flip-
>         vs-dpms-off-vs-modeset-interruptible.html> +1 other test pass
>   *
> 
>     igt@kms_hdr@static-toggle-dpms:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_hdr@static-toggle-dpms.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-2/igt@kms_hdr@static-toggle-dpms.html>
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-4/
>         igt@kms_setmode@basic.html> (Intel XE#6361 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-9/igt@kms_setmode@basic.html> +3 other tests pass
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-2/igt@kms_vrr@negative-basic.html>
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel
>         XE#6321 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6321>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-163610v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-
>         many-threads-small.html>
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-4/
>         igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html>
>         (Intel XE#7578 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7578>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-163610v1/shard-bmg-9/igt@xe_fault_injection@vm-bind-
>         fail-xe_pt_update_ops_run.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
>         igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178> / Intel
>         XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3304> / Intel XE#7374 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7374>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
>         igt@kms_content_protection@legacy.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) +1 other test
>         skip
>   *
> 
>     igt@kms_content_protection@suspend-resume:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_content_protection@suspend-resume.html> (Intel XE#6705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/
>         shard-bmg-2/igt@kms_content_protection@suspend-resume.html>
>         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178> / Intel XE#3304 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3304> / Intel XE#7374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7374>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
>         igt@kms_content_protection@uevent.html> (Intel XE#6707 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6707> / Intel
>         XE#7439 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7439>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-163610v1/shard-bmg-5/
>         igt@kms_content_protection@uevent.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_flip@2x-flip-vs-panning.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-
>         bmg-2/igt@kms_flip@2x-flip-vs-panning.html> (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545> /
>         Intel XE#6652 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6652>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         render.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4141>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +14 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-163610v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +14 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +10 other tests skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-5/
>         igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904> / Intel XE#7342 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7342>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-6/
>         igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7342>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e/shard-bmg-7/
>         igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (Intel
>         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904> / Intel XE#7342 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7342>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-163610v1/shard-bmg-3/
>         igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (Intel
>         XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3414> / Intel XE#3904 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3904> / Intel XE#7342 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7342>)
> 
> 
>     Build changes
> 
>   * Linux: xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e -> xe-
>     pw-163610v1
> 
> IGT_8815: 8815
> xe-4753-f64c2a6453d0e0196f9697b8429bf97b1da1807e: 
> f64c2a6453d0e0196f9697b8429bf97b1da1807e
> xe-pw-163610v1: 163610v1
> 

