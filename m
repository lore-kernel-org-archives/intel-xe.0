Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132D1CA0EFA
	for <intel-xe@archiver.kernel.org>; Sat, 23 Aug 2025 09:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C351110E1BE;
	Sat, 23 Aug 2025 09:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PCHHTr0w";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC7610E1BE
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Aug 2025 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ZM4hfOSEh6hxu0h/nPio39rTlPwy96Zbl1k2+hidX4=; b=PCHHTr0wAXwfyt9MJZdnrKfSMu
 FHoazCNQwPSm+micKmD8rcjzWOpTaDFJRQKI1Pp2dBV2NgLj70KWGoHY4SXn1Q84U6Nzj2b6Sq+Kb
 e86YJhZD79MvK59FDs2bonyYCZRnZLB9gIg99I7Z37NBfeLyf6//4ckK/JIpBBfa6iXj6Cod0T81Y
 fxAabF0vdRdFGeBD//nu2XzLPmZMFn6eebh7pdWvzJYH9JsW0HailAz2kXoW6IpUPUxUJfsjZhdpx
 0nDVhCtmIn0h/P/iaiPzVLX3iAv4q/K+GIS+hCNFEJdfXlccdn6hOqsGYUgBjtZ9tMIkVMo2t5NnN
 Xl0+eKdg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1upkMB-000bBC-6J
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Aug 2025 11:16:15 +0200
Message-ID: <d5602355-3268-4129-8d5f-303e25d5ee4f@igalia.com>
Date: Sat, 23 Aug 2025 10:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_hand?=
 =?UTF-8?Q?ling_and_render_compression_modifiers_=28rev13=29?=
To: intel-xe@lists.freedesktop.org
References: <20250821141458.72876-1-tvrtko.ursulin@igalia.com>
 <175587303726.261609.4049463788921062951@1538d3639d33>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <175587303726.261609.4049463788921062951@1538d3639d33>
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


On 22/08/2025 15:30, Patchwork wrote:
> *Patch Details*
> *Series:*	AuxCCS handling and render compression modifiers (rev13)
> *URL:*	https://patchwork.freedesktop.org/series/144186/ <https:// 
> patchwork.freedesktop.org/series/144186/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408_FULL -> xe-
>   pw-144186v13_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-144186v13_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-144186v13_FULL, please notify your bug team (I915- 
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-144186v13_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-8/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v13/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-
>         userptr-rebind-imm.html>

Unrelated fail.

AuxCCS bits are all green.

Regards,

Tvrtko

> 
> 
>     New tests
> 
> New tests have been introduced between 
> xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408_FULL and xe- 
> pw-144186v13_FULL:
> 
> 
>       New IGT tests (44)
> 
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.16] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.19] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.16] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.18] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.23] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.14] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.13] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.11] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.13] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.22] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.21] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-144186v13_FULL that come from known 
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
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-adlp-9/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-
>         a-1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v13/shard-adlp-6/igt@kms_async_flips@async-flip-
>         suspend-resume@pipe-c-hdmi-a-1.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) +4 other tests dmesg-warn
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>     atomic@pipe-c-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-5/
>         igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>         atomic@pipe-c-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-lnl-4/
>         igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>         atomic@pipe-c-edp-1.html> (Intel XE#911 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3 other tests
>         fail
>   *
> 
>     igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-adlp-2/
>         igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-
>         a-1.html> (Intel XE#3884 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3884>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-3/igt@kms_big_fb@4-
>         tiled-64bpp-rotate-270.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-4/igt@kms_big_fb@y-
>         tiled-16bpp-rotate-180.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-adlp-9/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-adlp-4/igt@kms_big_fb@y-tiled-
>         max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +18
>         other tests dmesg-fail
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-7/igt@kms_big_fb@yf-tiled-
>         max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-1/igt@kms_bw@connected-
>         linear-tiling-2-displays-2560x1440p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-4/igt@kms_ccs@bad-aux-
>         stride-4-tiled-mtl-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-2/igt@kms_ccs@bad-
>         rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html> (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-3/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-mtl-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-1/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v13/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-bmg-ccs.html> (Intel XE#3862 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) +1 other test
>         incomplete
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-3/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-dg2-mc-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-466/igt@kms_ccs@crc-
>         primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +104 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-5/
>         igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-
>         dp-2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144186v13/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-bmg-ccs@pipe-a-dp-2.html> (Intel XE#5376 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5376>) +1 other test
>         fail
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-436/igt@kms_ccs@crc-
>         sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +15 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-435/igt@kms_cdclk@mode-
>         transition@pipe-d-dp-4.html> (Intel XE#4417 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-
>         hpd-with-enabled-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-435/
>         igt@kms_content_protection@legacy@pipe-a-dp-4.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-3/igt@kms_cursor_crc@cursor-
>         rapid-movement-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-1/
>         igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-4/igt@kms_cursor_legacy@2x-
>         flip-vs-cursor-legacy.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests
>         skip
>   *
> 
>     igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-3/
>         igt@kms_dp_linktrain_fallback@dp-fallback.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4294 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4294>)
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-3/igt@kms_flip@2x-dpms-vs-
>         vblank-race.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-2/igt@kms_flip@2x-flip-vs-
>         expired-vblank@bd-dp2-hdmi-a3.html> (Intel XE#3321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-4/
>         igt@kms_flip@2x-plain-flip.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-bmg-6/
>         igt@kms_flip@2x-plain-flip.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +5 other
>         tests skip
>   *
> 
>     igt@kms_flip@bo-too-big-interruptible@a-edp1:
> 
>       o shard-lnl: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-2/igt@kms_flip@bo-too-big-
>         interruptible@a-edp1.html> (Intel XE#1504 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1504> / Intel
>         XE#5737 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5737>) +1 other test timeout
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-7/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301> / Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-7/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v13/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@c-edp1.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-adlp-4/
>         igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>         (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@flip-vs-rmfb-interruptible:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-adlp-8/
>         igt@kms_flip@flip-vs-rmfb-interruptible.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html>
>         (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543> / Intel XE#5208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5208>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-1/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-
>         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-
>         blt.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5390>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1
>         other test skip
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-1/
>         igt@kms_hdr@static-toggle-suspend.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-bmg-6/
>         igt@kms_hdr@static-toggle-suspend.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-dg2-463/
>         igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-
>         size-64.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/616>) +1 other test fail
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-4/
>         igt@kms_plane_multiple@2x-tiling-none.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-none.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-1/
>         igt@kms_pm_dc@dc5-psr.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-lnl-3/
>         igt@kms_pm_dc@dc5-psr.html> (Intel XE#718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>     sf@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-
>         cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html> (Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4608> / Intel XE#5899 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5899>) +3 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-update-sf-dmg-area.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893> / Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4608> / Intel XE#5899 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5899>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-7/igt@kms_psr@fbc-psr2-
>         sprite-blt@edp-1.html> (Intel XE#4609 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4609> / Intel
>         XE#5899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>)
>   *
> 
>     igt@kms_psr@pr-sprite-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-1/igt@kms_psr@pr-sprite-
>         render.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406> / Intel XE#5899 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr@psr2-cursor-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-4/igt@kms_psr@psr2-cursor-
>         blt.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel
>         XE#5899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5899>) +1 other test skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-3/igt@kms_psr@psr2-cursor-
>         blt.html> (Intel XE#5784 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5784> / Intel XE#5899 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) +2 other
>         tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-8/igt@kms_rotation_crc@bad-
>         tiling.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3414> / Intel XE#3904 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-8/igt@kms_rotation_crc@bad-
>         tiling.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3414> / Intel XE#3904 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-7/
>         igt@kms_setmode@invalid-clone-single-crtc-stealing.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-
>         stealing.html> (Intel XE#1435 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-5/igt@sriov_basic@enable-vfs-
>         bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel
>         XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>   *
> 
>     igt@xe_eudebug@basic-client:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-466/
>         igt@xe_eudebug@basic-client.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>   *
> 
>     igt@xe_eudebug@basic-connect:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-1/igt@xe_eudebug@basic-
>         connect.html> (Intel XE#4837 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4837>) +4 other tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-3/igt@xe_eudebug@basic-
>         connect.html> (Intel XE#4837 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4837>)
>   *
> 
>     igt@xe_evict@evict-small-cm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-7/igt@xe_evict@evict-small-
>         cm.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/688>) +2 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-1/igt@xe_exec_basic@multigpu-
>         no-exec-userptr-invalidate-race.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-dg2-464/
>         igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-
>         invalidate-race.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-
>         invalidate-race.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-adlp-8/
>         igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-
>         fault.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/288> / Intel XE#5561 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5561>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-463/
>         igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-
>         fault.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/288>) +3 other tests skip
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-dg2-433/
>         igt@xe_exec_reset@parallel-gt-reset.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html> (Intel
>         XE#3876 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>   *
> 
>     igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-bmg-8/
>         igt@xe_exec_system_allocator@once-large-mmap-free-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +1 other test skip
>   *
> 
>     igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-8/
>         igt@xe_exec_system_allocator@process-many-mmap-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +4 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-mmap-remap-eocheck:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-adlp-4/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-remap-
>         eocheck.html> (Intel XE#4915 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4915>) +1 other test skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-
>     race-nomemset:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-dg2-432/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-
>         new-race-nomemset.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +12 other
>         tests skip
>   *
> 
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-lnl-4/
>         igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_pmu@fn-engine-activity-sched-if-idle:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@xe_pmu@fn-engine-activity-sched-if-idle.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>
>         (Intel XE#3876 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3876>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-
>         adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-
>         async-flip.html> (Intel XE#4543 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4543>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-adlp-6/
>         igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-
>         flip.html> +7 other tests pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-bmg-5/
>         igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-adlp-3/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-
>         hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-adlp-8/igt@kms_ccs@crc-
>         primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         +89 other tests pass
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-adlp-8/
>         igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-adlp-6/igt@kms_ccs@crc-
>         sprite-planes-basic-y-tiled-gen12-mc-ccs.html> +59 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v13/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-
>         flipb-toggle.html>
>   *
> 
>     igt@kms_flip@2x-busy-flip:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_flip@2x-busy-flip.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-1/igt@kms_flip@2x-busy-flip.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-
>         adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v13/shard-adlp-9/igt@kms_flip@flip-vs-suspend-
>         interruptible.html> +21 other tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-
>         adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         downscaling.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543> / Intel
>         XE#4921 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4921>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v13/shard-adlp-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         downscaling.html> +1 other test pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-adlp-9/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> +7 other tests
>         pass
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-4/igt@kms_hdr@static-swap.html> +1 other test pass
>   *
> 
>     igt@kms_joiner@basic-force-big-joiner:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_joiner@basic-force-big-joiner.html> (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html>
>   *
> 
>     igt@kms_mmap_write_crc@main:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-5/
>         igt@kms_mmap_write_crc@main.html> (Intel XE#5902 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5902>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-lnl-2/igt@kms_mmap_write_crc@main.html> +1 other test pass
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-4:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-4.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html>
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-5/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/718>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html> +1 other test pass
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-
>         adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-adlp-1/
>         igt@kms_vblank@ts-continuation-dpms-suspend.html> +3 other tests
>         pass
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-7/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#4459 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html> +1 other test pass
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-many-execqueues-many-vm-
>         bindexecqueue-userptr.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-
>         vm-bindexecqueue-userptr.html> +9 other tests pass
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-lnl-2/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-
>         imm.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v13/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-
>         bindexecqueue-rebind-imm.html>
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-2/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html>
>         -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v13/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-
>         userptr-rebind-imm.html>
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-
>         adlp-9/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html>
>   *
> 
>     igt@xe_exec_threads@threads-hang-userptr-rebind:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-
>         dg2-434/igt@xe_exec_threads@threads-hang-userptr-rebind.html>
>         (Intel XE#3876 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3876>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v13/shard-dg2-436/igt@xe_exec_threads@threads-
>         hang-userptr-rebind.html>
>   *
> 
>     igt@xe_exec_threads@threads-mixed-fd-rebind:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-
>         adlp-9/igt@xe_exec_threads@threads-mixed-fd-rebind.html> (Intel
>         XE#3876 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3876>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v13/shard-adlp-2/igt@xe_exec_threads@threads-
>         mixed-fd-rebind.html>
>   *
> 
>     igt@xe_sriov_flr@flr-each-isolation:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-3/
>         igt@xe_sriov_flr@flr-each-isolation.html> (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-
>         adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html>
>         (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v13/shard-adlp-6/igt@kms_async_flips@async-
>         flip-suspend-resume.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel
>         XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         render.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v13/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v13/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +6 other tests skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-yf:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/shard-bmg-2/
>         igt@kms_plane_multiple@2x-tiling-yf.html> (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v13/
>         shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html> (Intel
>         XE#4596 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8501 -> IGT_8503
>   * Linux: xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408 -> xe-
>     pw-144186v13
> 
> IGT_8501: 87027eb34ac38b8217351eeaa021aeae847b6b61 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8503: 8503
> xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408: 
> 16e133c7e6922a9f224b272a48ac172cf06e3408
> xe-pw-144186v13: 144186v13
> 

