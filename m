Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511CCD43370
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 07:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2CD10E075;
	Fri, 12 Dec 2025 07:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ql+RYDqo";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AAE10E075
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2JYPaG9BXS31ZSR7wbIUpHNUfcOx3TPUKxhSVjpAcgk=; b=Ql+RYDqo84RefxFc90pFPYN2hm
 fsLPcWUcWL24X2Vyyr1V0bz2hQQj4sS3j8fZqedD60KpsgVgYnPMimI0+GQV7Zqjvq4PvpMs2HGqB
 lit9X9Cofywhj6SXqQ7N/8RyfLteAq6Dioc9POuMepEsp18+OQwAo9EjN4Pn9IPKG38+qPHGaOwHM
 mQhlrfdf7HHt+WsTmkmX+gkFE655U1/Q8nDrfUlMiv5Ks/OY4uysIpeTBRIX/+AML2xPt8iMiN+Y0
 u0qSuSlOWcz2wfJaMPslRVtNKNBULa48mWgtNaw3sjZQ2URzhENIKOLCYRITMmseKVI9+IFeY/DiA
 G/TzJy4A==;
Received: from [86.33.28.86] (helo=[192.168.1.83])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vTxzY-00BuyM-7M
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 08:55:08 +0100
Message-ID: <dc57ce83-dcc6-401f-8387-45e45a26ee81@igalia.com>
Date: Fri, 12 Dec 2025 08:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_auxccs_wc_d?=
 =?UTF-8?B?cHQgKHJldjQp?=
To: intel-xe@lists.freedesktop.org
References: <20251211091530.19031-1-tvrtko.ursulin@igalia.com>
 <176550723575.79502.10246924717531968234@a3b018990fe9>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <176550723575.79502.10246924717531968234@a3b018990fe9>
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


On 12/12/2025 03:40, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	auxccs wc dpt (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/158763/
> *State:* 	success
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/index.html
>
>
>   CI Bug Log - changes from
>   xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da_FULL ->
>   xe-pw-158763v4_FULL
>
>
>     Summary
>
> *SUCCESS*
>
> No regressions found.
>
>
>     Participating hosts (2 -> 2)
>

It used to be 4 hosts in xe shards but since two days ago ADL machines 
seem gone. Are they coming back?

Regards,

Tvrtko

> No changes in participating hosts
>
>
>     Known issues
>
> Here are the changes found in xe-pw-158763v4_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html>
>         (Intel XE#6173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6173>) +4
>         other tests fail
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-planes-random:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-planes-random.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +3
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) +3
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +1
>         other test skip
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934> /
>         Intel XE#6590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590>)
>  *
>
>     igt@kms_pm_rpm@i2c:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-3/igt@kms_pm_rpm@i2c.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_pm_rpm@i2c.html>
>         (Intel XE#5099
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>  *
>
>     igt@xe_exec_system_allocator@once-mmap-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +1
>         other test fail
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html>
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4367>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>  *
>
>     igt@kms_flip@blocking-wf_vblank@b-dp2:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@b-dp2.html>
>         (Intel XE#3650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html>
>         +3 other tests pass
>  *
>
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
>
>       o shard-bmg: WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         (Intel XE#5786
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158763v4/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>
>
>     Build changes
>
>   * Linux: xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da ->
>     xe-pw-158763v4
>
> IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4222-c6ed6720baf0914824cb33b5f003ea3a0b0786da: 
> c6ed6720baf0914824cb33b5f003ea3a0b0786da
> xe-pw-158763v4: 158763v4
>

