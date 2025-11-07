Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC5ECCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 20:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3E010E06E;
	Fri,  7 Nov 2025 20:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TMOJn8pW";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC2B10E06E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 20:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=hBatoqiDr1bcaeOYXEeNvAB3hNSIeV5leKlFZW1W9hw=; b=TMOJn8pWDonHj4L7/jK7I8HR75
 BW040wn9ZagaCRtPtKHsR2OlJlWnmd0OP/TwaiGFYj61HqcIb3QAgdyDT3dbypH8j9V/GIi6+s3cl
 DqlaIOMMwNEPYaVWMnisJZ+GyGNNNl31vpA/E3POQuPoHZY5FIU/qxBnfCbMUsjhCibr7yJ38aFq8
 SeCQN4MmGnxXJDrXRckZQVUk/wryp53j82fhuPzJoDIm+IXXlY1AWOucmjEpFRvgeDik0jd3pS/kM
 Z0AodCNJRsiQ6Lw1K5XHmnab/ptjHFwnIB7N1jxatkqzlPCwexjPs9rCFfFQueA7teb8M/8i+HA6g
 cZyUFZvQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vHTUQ-003aki-3v; Fri, 07 Nov 2025 21:55:22 +0100
Message-ID: <35cdc3be-bcaf-4e67-a28c-772dd0782a8d@igalia.com>
Date: Fri, 7 Nov 2025 20:55:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_hand?=
 =?UTF-8?Q?ling_and_render_compression_modifiers?=
To: intel-xe@lists.freedesktop.org
References: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
 <176135026288.54466.17962914121285555864@97596180aaec>
Content-Language: en-GB
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <176135026288.54466.17962914121285555864@97596180aaec>
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


On 25/10/2025 00:57, Patchwork wrote:
> *Patch Details*
> *Series:*	AuxCCS handling and render compression modifiers
> *URL:*	https://patchwork.freedesktop.org/series/156472/ <https:// 
> patchwork.freedesktop.org/series/156472/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-3980-
>   c840596036111afb71465977a49618cd19ca6e8b_FULL -> xe-pw-156472v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-156472v1_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-156472v1_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
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
> pw-156472v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_drm_fdinfo@utilization-others-full-load:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-6/
>         igt@xe_drm_fdinfo@utilization-others-full-load.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-156472v1/shard-adlp-9/igt@xe_drm_fdinfo@utilization-others-
>         full-load.html>
>   *
> 
>     igt@xe_gt_freq@freq_suspend:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-6/
>         igt@xe_gt_freq@freq_suspend.html> -> TIMEOUT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-adlp-9/
>         igt@xe_gt_freq@freq_suspend.html>

This is something unrelated and all ccs tests appear to pass.

Just trying my luck to see if series can get some more reviews.

Regards,

Tvrtko

> 
> 
>     New tests
> 
> New tests have been introduced between xe-3980- 
> c840596036111afb71465977a49618cd19ca6e8b_FULL and xe-pw-156472v1_FULL:
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
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
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
>       o Exec time: [0.11] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.11] s
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
>       o Exec time: [0.22] s
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
>       o Exec time: [0.12] s
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
>       o Exec time: [0.12] s
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
>       o Exec time: [0.11] s
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
>       o Exec time: [0.22] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.14] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs-cc:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.13] s
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
> Here are the changes found in xe-pw-156472v1_FULL that come from known 
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
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-464/
>         igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel
>         XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-
>     internal-panels:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_atomic_transition@plane-all-modeset-transition-fencing-
>         internal-panels.html> (Intel XE#2370 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2370>)
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@kms_big_fb@4-
>         tiled-16bpp-rotate-270.html> (Intel XE#2327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-2/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-
>         flip.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-
>         hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-434/igt@kms_big_fb@yf-
>         tiled-32bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-464/igt@kms_big_fb@yf-
>         tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@kms_bw@connected-linear-
>         tiling-3-displays-3840x2160p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/igt@kms_bw@linear-
>         tiling-2-displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/igt@kms_ccs@bad-aux-
>         stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +76
>         other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@kms_ccs@ccs-on-another-
>         bo-y-tiled-gen12-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/igt@kms_ccs@ccs-on-
>         another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +21 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/igt@kms_ccs@crc-
>         primary-basic-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-2/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-156472v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4345> / Intel XE#6168 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6168>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html>
>         -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-156472v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs@pipe-b-dp-4.html> (Intel XE#6168 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6168>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-
>         a-6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-463/igt@kms_cdclk@plane-
>         scaling@pipe-b-dp-4.html> (Intel XE#4416 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4416>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1 other test
>         skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/
>         igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-
>         hpd-enable-disable-mode.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-464/
>         igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5 other tests
>         skip
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-2/
>         igt@kms_content_protection@legacy@pipe-a-dp-2.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@uevent@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-2/
>         igt@kms_content_protection@uevent@pipe-a-dp-2.html> (Intel
>         XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/
>         igt@kms_cursor_crc@cursor-offscreen-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-5/
>         igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +2 other tests skip
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-433/
>         igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#2375 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2375>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/
>         igt@kms_feature_discovery@psr1.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-7/
>         igt@kms_flip@2x-plain-flip-fb-recreate.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-bmg-6/
>         igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +8
>         other tests skip
>   *
> 
>     igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-6/
>         igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         adlp-6/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) +5 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-lnl-5/
>         igt@kms_flip@flip-vs-expired-vblank@a-edp1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-rmfb:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-3/
>         igt@kms_flip@flip-vs-rmfb.html> -> DMESG-WARN <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-adlp-3/
>         igt@kms_flip@flip-vs-rmfb.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543> / Intel
>         XE#5208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208>)
>   *
> 
>     igt@kms_flip@flip-vs-rmfb-interruptible:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-2/
>         igt@kms_flip@flip-vs-rmfb-interruptible.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html> (Intel
>         XE#5208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_flip@flip-vs-suspend.html> -> INCOMPLETE <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-bmg-8/
>         igt@kms_flip@flip-vs-suspend.html> (Intel XE#2049 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel
>         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>) +1 other test incomplete
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>         downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5390>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-
>         blt.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6312>) +1 other test skip
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/igt@kms_joiner@basic-
>         force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/
>         igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_lease@lease-unleased-connector:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-2/
>         igt@kms_lease@lease-unleased-connector.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-adlp-8/
>         igt@kms_lease@lease-unleased-connector.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>) +1
>         other test abort
>   *
> 
>     igt@kms_plane_multiple@tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_plane_multiple@tiling-y.html> (Intel XE#5020 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-75@pipe-a.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-433/igt@kms_psr2_sf@fbc-
>         psr2-cursor-plane-move-continuous-exceed-fully-sf.html> (Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#1489 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1489>) +6 other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@kms_psr2_sf@pr-primary-
>         plane-update-sf-dmg-area-big-fb.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-433/igt@kms_psr@fbc-psr-
>         cursor-plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +7 other tests skip
>   *
> 
>     igt@kms_psr@pr-primary-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@kms_psr@pr-primary-
>         blt.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1406> / Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@kms_rotation_crc@bad-
>         tiling.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3414> / Intel XE#3904 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/
>         igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_vblank@ts-continuation-modeset-rpm:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-8/
>         igt@kms_vblank@ts-continuation-modeset-rpm.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) +11 other tests dmesg-warn
>   *
> 
>     igt@kms_vrr@cmrr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/
>         igt@kms_vrr@cmrr.html> (Intel XE#2168 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-434/
>         igt@kms_vrr@flipline.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5 other tests
>         skip
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many-vram-evict:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/
>         igt@xe_compute_preempt@compute-preempt-many-vram-evict.html>
>         (Intel XE#6360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6360>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x8fffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-463/
>         igt@xe_copy_basic@mem-copy-linear-0x8fffe.html> (Intel XE#5300
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0x8fffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-433/
>         igt@xe_copy_basic@mem-set-linear-0x8fffe.html> (Intel XE#5503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/
>         igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) +1
>         other test skip
>   *
> 
>     igt@xe_eudebug@vm-bind-clear-faultable:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-464/igt@xe_eudebug@vm-
>         bind-clear-faultable.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4 other
>         tests skip
>   *
> 
>     igt@xe_eudebug_online@stopped-thread:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@xe_eudebug_online@stopped-thread.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-2/igt@xe_exec_basic@multigpu-
>         no-exec-basic-defer-bind.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +2 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-434/
>         igt@xe_exec_fault_mode@many-userptr.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +11
>         other tests skip
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-6/
>         igt@xe_exec_reset@parallel-gt-reset.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         adlp-9/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-432/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-
>         malloc.html> (Intel XE#4915 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4915>) +196 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@twice-mmap-new-huge:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/
>         igt@xe_exec_system_allocator@twice-mmap-new-huge.html> (Intel
>         XE#4943 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4943>) +2 other tests skip
>   *
> 
>     igt@xe_exec_threads@threads-cm-fd-userptr:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-6/
>         igt@xe_exec_threads@threads-cm-fd-userptr.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         adlp-9/igt@xe_exec_threads@threads-cm-fd-userptr.html> (Intel
>         XE#5625 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>)
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-433/
>         igt@xe_media_fill@media-fill.html> (Intel XE#560 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>   *
> 
>     igt@xe_module_load@many-reload:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-2/
>         igt@xe_module_load@many-reload.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-adlp-8/
>         igt@xe_module_load@many-reload.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173> / Intel XE#5244 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5244>)
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-434/igt@xe_oa@mmio-
>         triggered-reports.html> (Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>)
>   *
> 
>     igt@xe_oa@oa-tlb-invalidate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@xe_oa@oa-tlb-
>         invalidate.html> (Intel XE#2248 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2248>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-system:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-2/igt@xe_pm@d3cold-mmap-
>         system.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284>)
>   *
> 
>     igt@xe_pm@d3hot-i2c:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-464/igt@xe_pm@d3hot-
>         i2c.html> (Intel XE#5742 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5742>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-prefetch:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-3/
>         igt@xe_pm@s2idle-vm-bind-prefetch.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-adlp-3/
>         igt@xe_pm@s2idle-vm-bind-prefetch.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173> / Intel XE#4504 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4504>)
>   *
> 
>     igt@xe_pxp@pxp-optout:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-4/igt@xe_pxp@pxp-optout.html>
>         (Intel XE#4733 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4733>)
>   *
> 
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-434/igt@xe_pxp@pxp-
>         termination-key-update-post-suspend.html> (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-435/
>         igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>) +1 other test skip
>   *
> 
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-464/
>         igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-
>         numvfs.html> (Intel XE#4130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4130>)
>   *
> 
>     igt@xe_sriov_flr@flr-twice:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-463/igt@xe_sriov_flr@flr-
>         twice.html> (Intel XE#4273 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4273>)
>   *
> 
>     igt@xe_sriov_vram@vf-access-after-resize-up:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-dg2-434/igt@xe_sriov_vram@vf-
>         access-after-resize-up.html> (Intel XE#6318 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6318>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-1/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         (Intel XE#3908 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3908>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-adlp-4/igt@kms_atomic_transition@plane-
>         toggle-modeset-transition.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3862 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3862>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-dg2-463/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-dg2-mc-ccs.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-1/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-
>         hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-adlp-4/igt@kms_ccs@crc-
>         primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         +82 other tests pass
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-1/
>         igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-adlp-1/igt@kms_ccs@crc-
>         sprite-planes-basic-y-tiled-gen12-mc-ccs.html> +54 other tests pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-
>         dp-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4345>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-mc-ccs@pipe-b-dp-4.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4345 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4345> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-
>         c-dp-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-
>         c-dp-4.html>
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> +3 other tests pass
>   *
> 
>     igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_dp_linktrain_fallback@dp-fallback.html> (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/
>         shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/
>         shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html> +1
>         other test pass
>   *
> 
>     igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         adlp-6/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-
>         a1.html> (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4543>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-adlp-6/igt@kms_flip@dpms-off-
>         confusion-interruptible@b-hdmi-a1.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         adlp-9/igt@kms_flip@flip-vs-suspend.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-adlp-6/igt@kms_flip@flip-vs-
>         suspend.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-
>         interruptible.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html> (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-
>         dp4.html> +1 other test pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/
>         shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> +5 other tests
>         pass
>   *
> 
>     igt@kms_hdr@static-toggle:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_hdr@static-toggle.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         bmg-2/igt@kms_hdr@static-toggle.html>
>   *
> 
>     igt@kms_pm_rpm@basic-pci-d3-state:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-dg2-433/
>         igt@kms_pm_rpm@basic-pci-d3-state.html> (Intel XE#4741 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4741>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html>
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-lnl-7/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#4459 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html> +1 other test pass
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-1/
>         igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/
>         shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html> +1
>         other test pass
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         dg2-463/igt@xe_exec_basic@multigpu-once-basic.html> (Intel
>         XE#4842 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4842>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-
>         basic.html>
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-
>         dg2-463/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_mmio_send_recv.html> (Intel XE#5893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5893>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         dg2-434/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_mmio_send_recv.html>
>   *
> 
>     igt@xe_pmu@gt-frequency:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-dg2-435/
>         igt@xe_pmu@gt-frequency.html> (Intel XE#4819 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4819>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         dg2-432/igt@xe_pmu@gt-frequency.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-8/
>         igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-adlp-1/
>         igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-adlp-8/
>         igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-
>         a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/787>) -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-adlp-1/igt@kms_ccs@random-
>         ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_content_protection@legacy.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         bmg-2/igt@kms_content_protection@legacy.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-7/
>         igt@kms_content_protection@srm.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         bmg-6/igt@kms_content_protection@srm.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_content_protection@uevent.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-
>         bmg-2/igt@kms_content_protection@uevent.html> (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html>
>         (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5390>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5390>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-156472v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-156472v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +11 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-3/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3374> / Intel
>         XE#3544 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3544>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-156472v1/shard-bmg-5/igt@kms_hdr@brightness-with-
>         hdr.html> (Intel XE#3544 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3544>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-y:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-7/
>         igt@kms_plane_multiple@2x-tiling-y.html> (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/
>         shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html> (Intel
>         XE#4596 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-yf:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-yf.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156472v1/
>         shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html> (Intel
>         XE#5021 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3980-c840596036111afb71465977a49618cd19ca6e8b/shard-bmg-7/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5466> / Intel XE#5530 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5530>) -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-156472v1/shard-bmg-1/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4917> / Intel XE#5466 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5466> / Intel XE#5530 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
> 
> 
>     Build changes
> 
>   * Linux: xe-3980-c840596036111afb71465977a49618cd19ca6e8b -> xe-
>     pw-156472v1
> 
> IGT_8596: 8596
> xe-3980-c840596036111afb71465977a49618cd19ca6e8b: 
> c840596036111afb71465977a49618cd19ca6e8b
> xe-pw-156472v1: 156472v1
> 

