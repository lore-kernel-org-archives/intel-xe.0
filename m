Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C85FC87FCA
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 08:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179FB10E23F;
	Sat, 26 Jul 2025 08:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NrXIeI8I";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1130E10E23F
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=scLOtTP+99PzV6VFvNZal1eQYSafylpJ2X10ySfpSqc=; b=NrXIeI8ICQ8fTrN238oxfvjflQ
 7xZtZ5pKoMgkBsaVt336rO/mwYx+3nAazGXbnNUeLmY9/wlj3pr8A9mr7FHrzQg4t92HM7Yb4inu3
 LxIVu9LyCydEDwYFaowKz0pfchfCMEG3sLMZ21DdksfxSnxDn41Brj9VjCKcfEJO2f+lWzna2+X32
 TIb4AqlJVkZX2EVIvAw+ElEdw8aHPZGLj0fdUqFtf7DwNB9ILZzj48a9P+df1EbU6DNZF9e7H+cBQ
 Cqq4f2UXgQ6NAlQm9UhSfGERiK/72a4MO9B45OtCVSdRmQJV1erYUSNTofUaml4tWq9VZ5koHvTtT
 i4NqgNMg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ufaWb-0044eO-39
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 10:45:01 +0200
Message-ID: <24ddde84-8bf0-43df-bdc1-4558f85455b0@igalia.com>
Date: Sat, 26 Jul 2025 09:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_hand?=
 =?UTF-8?Q?ling_and_render_compression_modifiers_=28rev9=29?=
To: intel-xe@lists.freedesktop.org
References: <20250725200349.99038-1-tvrtko.ursulin@igalia.com>
 <175348854075.191575.2873514755325091654@1538d3639d33>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <175348854075.191575.2873514755325091654@1538d3639d33>
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


On 26/07/2025 01:09, Patchwork wrote:
> *Patch Details*
> *Series:*	AuxCCS handling and render compression modifiers (rev9)
> *URL:*	https://patchwork.freedesktop.org/series/144186/ <https:// 
> patchwork.freedesktop.org/series/144186/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_FULL -> xe-
>   pw-144186v9_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-144186v9_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-144186v9_FULL, please notify your bug team (I915-ci- 
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
> pw-144186v9_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs (NEW):
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-1/igt@kms_flip_tiling@flip-
>         change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs.html> +25
>         other tests fail

It looks like the Test-with: did not work.

Anyway, I tnink all the media compression would have passed with this 
IGT fix: https://patchwork.freedesktop.org/series/151928/

Tvrtko

> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-
>     hdmi-a-1-y:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-
>         tiled@pipe-d-hdmi-a-1-y.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events-
>         tiled@pipe-d-hdmi-a-1-y.html>
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-
>     hdmi-a-1:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-4/
>         igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-
>         a-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/787>) -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-adlp-1/igt@kms_ccs@crc-
>         primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html>
>         +7 other tests fail
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-6/
>         igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-adlp-3/igt@kms_ccs@crc-
>         sprite-planes-basic-y-tiled-gen12-mc-ccs.html> +4 other tests fail
> 
> 
>     New tests
> 
> New tests have been introduced between 
> xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_FULL and xe- 
> pw-144186v9_FULL:
> 
> 
>       New IGT tests (44)
> 
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.17] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
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
>       o Exec time: [0.18] s
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
>       o Statuses : 1 fail(s)
>       o Exec time: [0.24] s
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
>       o Statuses : 1 fail(s)
>       o Exec time: [0.19] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.19] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.19] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 dmesg-fail(s)
>       o Exec time: [0.14] s
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
>       o Statuses : 1 fail(s)
>       o Exec time: [0.25] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-
>     y-rc-ccs:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.12] s
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
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-
>     linear:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.10] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-x:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.13] s
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
>       o Statuses : 1 fail(s)
>       o Exec time: [0.25] s
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
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.13] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y-
>     mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.11] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
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
>       o Statuses : 1 fail(s)
>       o Exec time: [0.24] s
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
>       o Exec time: [0.11] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-
>     to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.13] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-to-
>     y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y-mc-ccs:
> 
>       o Statuses : 1 fail(s)
>       o Exec time: [0.12] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-144186v9_FULL that come from known 
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
>     igt@kms_addfb_basic@addfb25-4-tiled:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-3/
>         igt@kms_addfb_basic@addfb25-4-tiled.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         adlp-6/igt@kms_addfb_basic@addfb25-4-tiled.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) +9 other tests dmesg-warn
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-
>     hdmi-a-1-y-rc-ccs:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-adlp-3/
>         igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-
>         b-hdmi-a-1-y-rc-ccs.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-5/igt@kms_big_fb@4-
>         tiled-16bpp-rotate-90.html> (Intel XE#2327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_big_fb@4-tiled-max-
>         hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/igt@kms_big_fb@x-
>         tiled-8bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests
>         skip
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_big_fb@y-
>         tiled-8bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/igt@kms_big_fb@y-
>         tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/igt@kms_big_fb@yf-
>         tiled-max-hw-stride-32bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v9/shard-bmg-1/igt@kms_bw@connected-linear-tiling-1-
>         displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_bw@connected-
>         linear-tiling-2-displays-1920x1080p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/igt@kms_bw@linear-tiling-1-
>         displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@kms_ccs@bad-aux-
>         stride-4-tiled-mtl-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_ccs@bad-pixel-
>         format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/igt@kms_ccs@bad-
>         rotation-90-4-tiled-mtl-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_ccs@crc-primary-
>         basic-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-
>     hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-436/igt@kms_ccs@crc-
>         sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +132 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_ccs@random-ccs-
>         data-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-
>         a-6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#3124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3124> / Intel XE#4345 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4345>) +1 other test
>         incomplete
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4345 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4345> / Intel
>         XE#4522 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4522 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-436/igt@kms_ccs@random-
>         ccs-data-yf-tiled-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +21
>         other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/igt@kms_cdclk@mode-
>         transition-all-outputs.html> (Intel XE#2724 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/
>         igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-3/igt@kms_chamelium_color@ctm-
>         red-to-blue.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-single:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/
>         igt@kms_chamelium_frames@dp-crc-single.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>   *
> 
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-5/
>         igt@kms_chamelium_hpd@common-hpd-after-suspend.html> (Intel
>         XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2252>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_chamelium_hpd@dp-
>         hpd-with-enabled-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@kms_chamelium_hpd@dp-
>         hpd-with-enabled-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_content_protection@atomic@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-8/
>         igt@kms_content_protection@atomic@pipe-a-dp-2.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/
>         igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@srm@pipe-a-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/
>         igt@kms_content_protection@srm@pipe-a-dp-2.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x32:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-5/igt@kms_cursor_crc@cursor-
>         random-32x32.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/igt@kms_cursor_crc@cursor-
>         random-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +4 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_cursor_crc@cursor-
>         random-512x512.html> (Intel XE#308 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-2/
>         igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +2 other tests skip
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#4494 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4494> / i915#3804 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/
>         igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-
>         formats.html> (Intel XE#4422 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4422>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-5/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/776>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_flip@2x-flip-vs-
>         dpms.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/310>)
>   *
> 
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-2/
>         igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html>
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v9/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-
>         dpms-off-vs-modeset.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@basic-plain-flip@b-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-2/
>         igt@kms_flip@basic-plain-flip@b-hdmi-a1.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         adlp-9/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-lnl-8/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@c-edp1.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_flip@flip-vs-
>         suspend.html> (Intel XE#2953 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2953> / Intel XE#4173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +3 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         upscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2293> / Intel XE#2380 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests
>         skip
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-4/
>         igt@kms_flip_tiling@flip-change-tiling.html> -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         adlp-1/igt@kms_flip_tiling@flip-change-tiling.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-to-x:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-adlp-1/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-
>         to-x.html> (Intel XE#4543 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4543>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         move.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-slowdraw:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@drrs-slowdraw.html> (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-
>         blt.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5390>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>) +4 other tests skip
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-2/
>         igt@kms_hdr@static-toggle-suspend.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-bmg-6/
>         igt@kms_hdr@static-toggle-suspend.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_joiner@basic-max-non-joiner:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_joiner@basic-max-
>         non-joiner.html> (Intel XE#4298 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4298>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-5/igt@kms_joiner@invalid-
>         modeset-force-ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>   *
> 
>     igt@kms_plane_lowres@tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/igt@kms_plane_lowres@tiling-
>         y.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-x:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-2/
>         igt@kms_plane_multiple@2x-tiling-x.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-x.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/
>         igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-5@pipe-b.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4 other
>         tests skip
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_pm_dc@deep-
>         pkgc.html> (Intel XE#2007 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2007>)
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@kms_pm_dc@deep-
>         pkgc.html> (Intel XE#2029 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2029>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/igt@kms_psr2_sf@fbc-
>         pr-overlay-plane-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test
>         skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-move-continuous-sf.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893> / Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-move-continuous-sf@pipe-a-edp-1.html> (Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4608>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-
>         plane-move-continuous-exceed-fully-sf.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-3/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#2387 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2387>)
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/
>         igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#1122 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_psr@fbc-psr2-
>         cursor-blt.html> (Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3 other tests
>         skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@kms_psr@fbc-psr2-
>         primary-blt.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-blt@edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@kms_psr@fbc-psr2-
>         primary-blt@edp-1.html> (Intel XE#4609 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>   *
> 
>     igt@kms_psr@pr-sprite-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/igt@kms_psr@pr-
>         sprite-render.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3
>         other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-5/igt@kms_psr@psr-cursor-
>         plane-move.html> (Intel XE#2234 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2 other
>         tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/
>         igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/
>         igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-3/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#2330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/
>         igt@kms_scaling_modes@scaling-mode-center.html> (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>   *
> 
>     igt@kms_vrr@flip-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@kms_vrr@flip-
>         suspend.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>) +3 other tests skip
>   *
> 
>     igt@kms_vrr@lobf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-3/igt@kms_vrr@lobf.html>
>         (Intel XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2168>)
>   *
> 
>     igt@xe_eudebug@basic-close:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/igt@xe_eudebug@basic-
>         close.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>) +2 other tests skip
>   *
> 
>     igt@xe_eudebug@discovery-race-sigint:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@xe_eudebug@discovery-
>         race-sigint.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837> / Intel
>         XE#5565 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5565>) +3 other tests skip
>   *
> 
>     igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/
>         igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-
>         vram.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>) +4 other tests skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@xe_evict_ccs@evict-
>         overcommit-parallel-instantfree-samefd.html> (Intel XE#5563
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563> /
>         Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/688>)
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-
>         samefd.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-1/igt@xe_evict_ccs@evict-
>         overcommit-standalone-instantfree-samefd.html> (Intel XE#3428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428> /
>         Intel XE#5215 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5215>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@xe_exec_basic@multigpu-
>         no-exec-bindexecqueue-userptr-invalidate.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392> /
>         Intel XE#5575 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5575>) +1 other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-dg2-435/
>         igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html>
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144186v9/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-
>         userptr-invalidate-race.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +5 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-3/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-rebind.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-null:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/igt@xe_exec_basic@multigpu-
>         once-null.html> (Intel XE#1392 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/
>         igt@xe_exec_fault_mode@many-userptr-imm.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288> /
>         Intel XE#5561 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5561>) +5 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/
>         igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +6 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/
>         igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>)
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@xe_exec_mix_modes@exec-
>         spinner-interrupted-lr.html> (Intel XE#2360 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2360> / Intel
>         XE#5573 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5573>)
>   *
> 
>     igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/
>         igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html> (Intel
>         XE#4837 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>   *
> 
>     igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/
>         igt@xe_exec_system_allocator@many-execqueues-mmap-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +10 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/
>         igt@xe_exec_system_allocator@many-large-execqueues-malloc-
>         mlock.html> (Intel XE#4915 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4915> / Intel XE#5560 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5560>) +59 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@xe_exec_system_allocator@process-many-large-malloc-multi-
>         fault.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-1/
>         igt@xe_exec_system_allocator@process-many-large-malloc-multi-
>         fault.html> (Intel XE#3428 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3428>) +1 other test dmesg-warn
>   *
> 
>     igt@xe_exec_system_allocator@process-many-mmap-free-huge-nomemset:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/
>         igt@xe_exec_system_allocator@process-many-mmap-free-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +2 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-mmap-shared:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-
>         shared.html> (Intel XE#4915 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4915>) +59 other tests skip
>   *
> 
>     igt@xe_oa@map-oa-buffer:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-adlp-2/igt@xe_oa@map-oa-
>         buffer.html> (Intel XE#3573 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3573>) +1 other test skip
>   *
> 
>     igt@xe_oa@privileged-forked-access-vaddr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/igt@xe_oa@privileged-
>         forked-access-vaddr.html> (Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +2 other
>         tests skip
>   *
> 
>     igt@xe_pm@d3cold-mmap-vram:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/igt@xe_pm@d3cold-
>         mmap-vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_pxp@pxp-stale-queue-post-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-435/igt@xe_pxp@pxp-stale-
>         queue-post-suspend.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-bmg-7/igt@xe_query@multigpu-query-
>         invalid-cs-cycles.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2 other tests
>         skip
>   *
> 
>     igt@xe_spin_batch@spin-mem-copy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-dg2-432/
>         igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4821 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4821>)
>   *
> 
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144186v9/shard-lnl-5/
>         igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-
>         numvfs.html> (Intel XE#4130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4130>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_atomic_transition@modeset-transition:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_atomic_transition@modeset-transition.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-2/igt@kms_atomic_transition@modeset-transition.html> +10
>         other tests pass
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> +2 other tests pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-bmg-2/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-4/
>         igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-adlp-9/igt@kms_ccs@bad-
>         rotation-90-y-tiled-gen12-rc-ccs-cc.html> +49 other tests pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-5/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> (Intel
>         XE#3862 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3862>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-bmg-ccs.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-8/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-
>         hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-adlp-1/igt@kms_ccs@crc-
>         primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         +74 other tests pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4522 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4522>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-dg2-435/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> +1 other
>         test pass
>   *
> 
>     igt@kms_color@degamma@pipe-a-dp-2:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_color@degamma@pipe-a-dp-2.html> -> PASS <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-bmg-2/
>         igt@kms_color@degamma@pipe-a-dp-2.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-
>         flipa-legacy.html> +4 other tests pass
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-6/
>         igt@kms_display_modes@extended-mode-basic.html> (Intel XE#4302
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html>
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-sst:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_dp_link_training@non-uhbr-sst.html> (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-
>         nop-interruptible.html> +7 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-lnl-8/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144186v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@b-edp1.html>
>   *
> 
>     igt@kms_flip@flip-vs-rmfb-interruptible:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543> / Intel XE#5208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5208>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-adlp-1/
>         igt@kms_flip@flip-vs-rmfb-interruptible.html>
>   *
> 
>     igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html>
>         (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-
>         interruptible@b-hdmi-a1.html> +9 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_flip@flip-vs-suspend.html> (Intel XE#5208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5208>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-2/igt@kms_flip@flip-vs-suspend.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-
>         a1.html> (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2953> / Intel XE#4173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4173> / Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-adlp-4/igt@kms_flip@flip-vs-suspend-
>         interruptible@c-hdmi-a1.html>
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> +5 other tests
>         pass
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-6/
>         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-1/igt@kms_hdr@static-swap.html>
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-adlp-8/
>         igt@kms_plane@plane-panning-bottom-right-suspend.html> +5 other
>         tests pass
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-a-plane-3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_plane@plane-position-hole@pipe-a-plane-3.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-1/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html> +4
>         other tests pass
>   *
> 
>     igt@kms_plane_multiple@tiling-x:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_plane_multiple@tiling-x.html> (Intel XE#3428 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3428> / Intel
>         XE#5175 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5175>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-bmg-2/igt@kms_plane_multiple@tiling-x.html>
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-6/
>         igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>   *
> 
>     igt@kms_pm_rpm@drm-resources-equal:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_pm_rpm@drm-resources-equal.html> (Intel XE#3428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html> +1 other
>         test pass
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-2/
>         igt@kms_setmode@basic.html> (Intel XE#2883 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         adlp-8/igt@kms_setmode@basic.html> +2 other tests pass
>   *
> 
>     igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-lnl-8/
>         igt@kms_setmode@basic@pipe-b-edp-1.html> (Intel XE#2883
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html> +2 other
>         tests pass
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-6/
>         igt@kms_setmode@clone-exclusive-crtc.html> (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html>
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-6/
>         igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-2/igt@kms_vrr@negative-basic.html>
>   *
> 
>     igt@xe_eu_stall@blocking-read:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-4/
>         igt@xe_eu_stall@blocking-read.html> (Intel XE#5420 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5420>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-8/igt@xe_eu_stall@blocking-read.html>
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr-invalidate:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-many-execqueues-many-vm-
>         bindexecqueue-userptr-invalidate.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-
>         bindexecqueue-userptr-invalidate.html> +1 other test pass
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-imm:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-lnl-3/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         lnl-5/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html>
>   *
> 
>     igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-
>     dontunmap-eocheck:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-
>         dontunmap-eocheck.html> (Intel XE#3428 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3428>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-
>         remap-dontunmap-eocheck.html> +20 other tests pass
>   *
> 
>     igt@xe_exec_threads@threads-hang-rebind-err:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html> (Intel
>         XE#3876 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3876>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-dg2-464/igt@xe_exec_threads@threads-
>         hang-rebind-err.html>
>   *
> 
>     igt@xe_pmu@gt-frequency:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-dg2-432/
>         igt@xe_pmu@gt-frequency.html> (Intel XE#5166 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5166>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         dg2-436/igt@xe_pmu@gt-frequency.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-3/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-adlp-6/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-3/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-
>         hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/787>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-adlp-6/
>         igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-
>         hdmi-a-1.html> (Intel XE#2953 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2953> / Intel XE#4173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +3 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_content_protection@atomic.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-8/igt@kms_content_protection@atomic.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-4/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1475>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-lnl-8/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144186v9/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301> / Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-
>         adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173> / Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-adlp-6/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilercccs-downscaling@pipe-a-valid-mode.html> (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543> /
>         Intel XE#4921 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4921>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         move.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>         render.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144186v9/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +14 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-5/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3544 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/shard-
>         bmg-3/igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3544>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-yf:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-2/
>         igt@kms_plane_multiple@2x-tiling-yf.html> (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v9/
>         shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html> (Intel
>         XE#4596 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04/shard-bmg-5/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2509>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144186v9/shard-bmg-3/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#2426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04 -> xe-
>     pw-144186v9
> 
> IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04: 
> 11e629e8c02307977802ba0ea8c60ddb15b17d04
> xe-pw-144186v9: 144186v9
> 

