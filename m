Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8AAD16260
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 13:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0609910E47F;
	Mon, 14 Oct 2024 13:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h3eOl+i1";
	dkim-atps=neutral
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFAC10E45C;
 Mon, 14 Oct 2024 13:19:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a11e7so2264694a12.3; 
 Mon, 14 Oct 2024 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728911958; x=1729516758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SKq4lU00Oa2Y56kUONm66HRf7mtHbbWKxLfyWjJIawE=;
 b=h3eOl+i1uN0irn6yro1dqrTE8NWxw6ICqXlK5x2QgPEmGD1/TEhc8ZnbVioyQZVYnV
 c62dtWVqqKUppm2gdU+Gm/5owC0QbAzxpeKce9Lwzxsy0OY0uCuyXwDWEC6gDeafvGnw
 dHoZ60rImnTtVmkWCKYdEZB16jeTOcYdShGNV26z69vokSeGw01OWtKnPLSWQnnDLHcV
 kxsA+wlc3K9xFCMDBJN/4jnG2xBb6OOUo/1BSqiHru3NdHI+YOloxnrXKDSYbdGX9fER
 12uxa4pGpg7nLSpOoJElgC8fvRXJlc0dewWL2RkBsAcNJOnoXClxMCXvNEX4lTdbrT8D
 ELwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728911958; x=1729516758;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SKq4lU00Oa2Y56kUONm66HRf7mtHbbWKxLfyWjJIawE=;
 b=BKHHLGAbZ6A3fLJmWicGHdZf90vJf4kIvdciKRMvhm1Zc47TvxehJ5RX1qITNY1G7j
 J591y2BjKnHX7Op0OaIaO4V/KsbB2ixVcE49Gnupd+cbX3x7nHmI5xbDyn3oa3JNuefy
 l5Tu3A/MfT0o7pKf9YrJTzvkjVjLeRFN3Y5XBRIklGmnES1Zth2pTQgCw9Uhw1NxkUjQ
 7BSw4LFDSEIk7837QjUjDZix4Buv8yH5c2Q312oZ0VuySlE/M1Yh7yi33bB+8qhzyvLe
 hD+Uj80VbQE1lIaet2wZKX9ui8+60NRwQlk0LrVSepoqpSvKYRWBc5sf5DZlhr6NGKM2
 LMqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU72colZJ0DpF1GMvhpqckUGatAQiQ/r2bLjR4GAyA++gh3lYngIB227nHibMGV1yohLVGJ0QdFRrs7aiBJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgpKhDGsY6023tM+cbX4uyw2wvnkFHqzvmClzQX+ieaeBvlWa/
 Tpda/UIq+Afc5uMeq226SU2oaD6ZUcajtx8eB3P9EFc8eBSvsX3PvAKH9MDPO3/X5g==
X-Google-Smtp-Source: AGHT+IGrBajtai8zPAI5fgY5GaT6nq6Onc9QxVioGxrS9v4T6vnKKgBCm/R/I6J4wcRndgY1hpkwjQ==
X-Received: by 2002:a05:6402:2690:b0:5c3:cd88:a0a with SMTP id
 4fb4d7f45d1cf-5c95ac1d549mr5622899a12.18.1728911957240; 
 Mon, 14 Oct 2024 06:19:17 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c93711ba45sm4954857a12.28.2024.10.14.06.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 06:19:16 -0700 (PDT)
Message-ID: <296702bc-b965-497c-8320-383ab0623d4a@gmail.com>
Date: Mon, 14 Oct 2024 16:19:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Align_framebuffe?=
 =?UTF-8?Q?rs_according_to_what_display_minimum_alignment_states_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20241009151947.2240099-1-juhapekka.heikkila@gmail.com>
 <172858908115.1237495.6650695853384749767@2413ebb6fbb6>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <172858908115.1237495.6650695853384749767@2413ebb6fbb6>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These listed regressions don't seem to be caused by my change.

/Juha-Pekka

On 10.10.2024 22.38, Patchwork wrote:
> *Patch Details*
> *Series:*	Align framebuffers according to what display minimum alignment 
> states (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/139794/ <https:// 
> patchwork.freedesktop.org/series/139794/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-2042-
>   e1aba2bf4f79f2f8ae7ce538124d445fc91df852_full -> xe-pw-139794v2_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-139794v2_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-139794v2_full, please notify your bug team (I915-ci- 
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
> pw-139794v2_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-464/igt@kms_ccs@missing-
>         ccs-buffer-4-tiled-mtl-mc-ccs.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-
>         a-6.html>
>   *
> 
>     igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-9/
>         igt@kms_dp_linktrain_fallback@dp-fallback.html>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-6/
>         igt@kms_dp_linktrain_fallback@dp-fallback.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-466/igt@kms_flip@flip-vs-
>         expired-vblank@c-hdmi-a6.html>
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-6/
>         igt@kms_flip@plain-flip-fb-recreate.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-adlp-4/
>         igt@kms_flip@plain-flip-fb-recreate.html> +2 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-
>         blt.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-shrfb-plflip-blt.html> +2 other tests skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-434/
>         igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-
>         reopen.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-
>         parallel-instantfree-reopen.html>
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-4/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-lnl-6/igt@xe_exec_fault_mode@twice-
>         bindexecqueue-rebind-imm.html>
>   *
> 
>     igt@xe_oa@invalid-remove-userspace-config:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-6/
>         igt@xe_oa@invalid-remove-userspace-config.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         lnl-6/igt@xe_oa@invalid-remove-userspace-config.html>
> 
> 
>         Warnings
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> +1 other test skip
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-4/
>         igt@kms_async_flips@invalid-async-flip.html> (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html>
>   *
> 
>     igt@kms_atomic@crtc-invalid-params-fence:
> 
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-2/
>         igt@kms_atomic@crtc-invalid-params-fence.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-bmg-1/
>         igt@kms_atomic@crtc-invalid-params-fence.html>
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-1/
>         igt@kms_chamelium_audio@hdmi-audio-edid.html> (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
> 
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-5/
>         igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-
>         reopen.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-bmg-1/igt@xe_evict_ccs@evict-overcommit-
>         parallel-instantfree-reopen.html>
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-139794v2_full that come from known 
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
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-432/
>         igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel
>         XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/igt@kms_addfb_basic@addfb25-
>         y-tiled-small-legacy.html> (Intel XE#1466 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-
>     linear:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-3/igt@kms_async_flips@async-
>         flip-with-page-flip-events@pipe-a-edp-1-linear.html> (Intel
>         XE#911 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/911>) +3 other tests fail
>   *
> 
>     igt@kms_atomic@crtc-invalid-params-fence:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-466/
>         igt@kms_atomic@crtc-invalid-params-fence.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-464/
>         igt@kms_atomic@crtc-invalid-params-fence.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-7/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-lnl-2/igt@kms_atomic_transition@modeset-
>         transition-nonblocking-fencing.html> (Intel XE#1701 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1 other test
>         fail
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-463/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests
>         skip
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-6/igt@kms_big_fb@4-
>         tiled-64bpp-rotate-90.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-4/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-
>         flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-
>         stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-2/
>         igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-
>         flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-
>         stride-32bpp-rotate-180-async-flip.html> (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/igt@kms_big_fb@y-
>         tiled-max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +9
>         other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-2/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip.html> (Intel XE#1874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-464/igt@kms_bw@connected-
>         linear-tiling-4-displays-1920x1080p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-4/igt@kms_bw@linear-tiling-2-
>         displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-436/igt@kms_bw@linear-
>         tiling-3-displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests
>         skip
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-8/igt@kms_bw@linear-tiling-4-
>         displays-3840x2160p.html> (Intel XE#1512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-4/igt@kms_ccs@bad-rotation-90-
>         y-tiled-gen12-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/igt@kms_ccs@crc-
>         primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +69 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-434/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-
>         a-6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +2 other
>         tests incomplete
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-435/igt@kms_ccs@random-
>         ccs-data-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-435/igt@kms_ccs@random-
>         ccs-data-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-75:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-2/
>         igt@kms_chamelium_color@ctm-0-75.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@ctm-max:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-4/
>         igt@kms_chamelium_color@ctm-max.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-435/
>         igt@kms_chamelium_hpd@hdmi-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-
>         hpd-with-enabled-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4 other tests
>         skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-435/
>         igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-8/
>         igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1
>         other test skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-436/
>         igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test
>         fail
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-6/igt@kms_cursor_crc@cursor-
>         offscreen-32x32.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-435/
>         igt@kms_cursor_crc@cursor-offscreen-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-463/
>         igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/323>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-atomic-transitions.html> (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-1/igt@kms_dsc@dsc-fractional-
>         bpp-with-bpc.html> (Intel XE#599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-1/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-5/igt@kms_flip@2x-blocking-
>         absolute-wf_vblank-interruptible.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +3 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-
>         dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-
>         vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +11
>         other tests fail
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-6/
>         igt@kms_flip@blocking-wf_vblank.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-lnl-5/
>         igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +6 other tests
>         fail
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-434/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-
>         a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@c-hdmi-a6.html> (Intel XE#1204 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-466/igt@kms_flip@flip-vs-
>         expired-vblank@b-hdmi-a6.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +5 other tests
>         fail
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate@a-edp1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/igt@kms_flip@plain-flip-fb-
>         recreate@a-edp1.html> (Intel XE#886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-6/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         downscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-463/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +28 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-1/
>         igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-shrfb-
>         scaledprimary.html> (Intel XE#1861 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) +2 other
>         tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +24
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-
>         tiling-linear.html> (Intel XE#2050 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2050>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-1/
>         igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/igt@kms_getfb@getfb-
>         reject-ccs.html> (Intel XE#605 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/605>)
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-436/igt@kms_joiner@basic-
>         force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-1/
>         igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-lnl-1/igt@kms_plane@plane-position-hole-
>         dpms@pipe-b-plane-4.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests
>         dmesg-warn
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-466/
>         igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/361>) +1 other test fail
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-4/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-
>         scaling@pipe-c.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7 other
>         tests skip
>   *
> 
>     igt@kms_pm_dc@dc5-dpms:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-5/
>         igt@kms_pm_dc@dc5-dpms.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-lnl-3/
>         igt@kms_pm_dc@dc5-dpms.html> (Intel XE#718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/igt@kms_pm_dc@dc6-
>         dpms.html> (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/908>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1430>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-4/
>         igt@kms_pm_rpm@universal-planes.html> -> INCOMPLETE <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-lnl-6/
>         igt@kms_pm_rpm@universal-planes.html> (Intel XE#1620 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1620> / Intel
>         XE#2864 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms:
> 
>       o shard-lnl: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-lnl-4/
>         igt@kms_pm_rpm@universal-planes-dpms.html> (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> /
>         Intel XE#2864 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2864>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms@plane-59:
> 
>       o shard-lnl: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-lnl-4/
>         igt@kms_pm_rpm@universal-planes-dpms@plane-59.html> (Intel
>         XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes@plane-59:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-4/
>         igt@kms_pm_rpm@universal-planes@plane-59.html> -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         lnl-6/igt@kms_pm_rpm@universal-planes@plane-59.html> (Intel
>         XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/igt@kms_psr2_sf@fbc-
>         psr2-primary-plane-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5
>         other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-2/igt@kms_psr2_sf@pr-cursor-
>         plane-move-continuous-exceed-fully-sf.html> (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-435/
>         igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#1122 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/igt@kms_psr2_su@page_flip-
>         xrgb8888.html> (Intel XE#1128 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1128>)
>   *
> 
>     igt@kms_psr@fbc-psr2-basic:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-2/igt@kms_psr@fbc-psr2-
>         basic.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-463/igt@kms_psr@fbc-psr2-
>         cursor-plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +10
>         other tests skip
>   *
> 
>     igt@kms_psr@pr-cursor-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-4/igt@kms_psr@pr-cursor-
>         render.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +1 other test skip
>   *
> 
>     igt@kms_psr@psr2-cursor-blt@edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-2/
>         igt@kms_psr@psr2-cursor-blt@edp-1.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-lnl-6/
>         igt@kms_psr@psr2-cursor-blt@edp-1.html> (Intel XE#2948 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +3 other
>         tests fail
>   *
> 
>     igt@kms_rotation_crc@bad-pixel-format:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-8/igt@kms_rotation_crc@bad-
>         pixel-format.html> (Intel XE#1437 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1437>) +1 other test
>         skip
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-4/
>         igt@kms_vrr@flipline.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-lnl-7/
>         igt@kms_vrr@flipline.html> (Intel XE#2443 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +3 other
>         tests fail
>   *
> 
>     igt@xe_ccs@suspend-resume:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-8/igt@xe_ccs@suspend-
>         resume.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455> / Intel XE#488 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-463/
>         igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-7/
>         igt@xe_drm_fdinfo@utilization-single-full-load-destroy-
>         queue.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-
>         full-load-destroy-queue.html> (Intel XE#2667 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2667>)
>   *
> 
>     igt@xe_eudebug@basic-vm-access-parameters:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/igt@xe_eudebug@basic-
>         vm-access-parameters.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +7 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@multiple-sessions:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-8/igt@xe_eudebug@multiple-
>         sessions.html> (Intel XE#2905 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2905>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-432/
>         igt@xe_evict@evict-beng-mixed-threads-large.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel
>         XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>   *
> 
>     igt@xe_evict@evict-beng-threads-small-multi-vm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-2/igt@xe_evict@evict-beng-
>         threads-small-multi-vm.html> (Intel XE#261 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>   *
> 
>     igt@xe_evict@evict-mixed-threads-small-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/igt@xe_evict@evict-mixed-
>         threads-small-multi-vm.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-432/
>         igt@xe_evict@evict-threads-large.html> -> TIMEOUT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-466/
>         igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_balancer@once-parallel-userptr:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-435/
>         igt@xe_exec_balancer@once-parallel-userptr.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-464/igt@xe_exec_balancer@once-parallel-userptr.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) +6 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-null:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-7/igt@xe_exec_basic@multigpu-
>         no-exec-null.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@many-basic-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/
>         igt@xe_exec_fault_mode@many-basic-prefetch.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +23
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-rebind-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-8/
>         igt@xe_exec_fault_mode@once-rebind-imm.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-464/
>         igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html> (Intel
>         XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_reset@close-execqueues-close-fd:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-432/
>         igt@xe_exec_reset@close-execqueues-close-fd.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-435/igt@xe_exec_reset@close-execqueues-close-fd.html> (Intel
>         XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>)
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-5/
>         igt@xe_exec_reset@close-execqueues-close-fd.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         lnl-8/igt@xe_exec_reset@close-execqueues-close-fd.html> (Intel
>         XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>)
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-3/
>         igt@xe_exec_reset@close-execqueues-close-fd.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         adlp-6/igt@xe_exec_reset@close-execqueues-close-fd.html> (Intel
>         XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>)
>   *
> 
>     igt@xe_exec_sip_eudebug@breakpoint-writesip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-1/
>         igt@xe_exec_sip_eudebug@breakpoint-writesip.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +4
>         other tests skip
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-1/
>         igt@xe_fault_injection@inject-fault-probe.html> (Intel XE#2931
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931>)
>   *
> 
>     igt@xe_live_ktest@xe_dma_buf:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-1/
>         igt@xe_live_ktest@xe_dma_buf.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-lnl-8/
>         igt@xe_live_ktest@xe_dma_buf.html> (Intel XE#1192 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-8/
>         igt@xe_module_load@load.html> (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_module_load@many-reload:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-432/
>         igt@xe_module_load@many-reload.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-433/
>         igt@xe_module_load@many-reload.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/igt@xe_oa@oa-unit-
>         exclusive-stream-sample-oa.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +5 other
>         tests skip
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-8/igt@xe_peer2peer@read.html>
>         (Intel XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1061>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-vram:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-adlp-8/igt@xe_pm@d3cold-mmap-
>         vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3hot-multiple-execs:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-2/
>         igt@xe_pm@d3hot-multiple-execs.html> -> TIMEOUT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-lnl-7/
>         igt@xe_pm@d3hot-multiple-execs.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1620> / Intel XE#2574 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2574>)
>   *
> 
>     igt@xe_pm@s3-d3cold-basic-exec:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-4/igt@xe_pm@s3-d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-multiple-execs:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-432/igt@xe_pm@s3-
>         multiple-execs.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-1/
>         igt@xe_pm@s4-basic-exec.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-lnl-2/igt@xe_pm@s4-
>         basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1358> / Intel XE#1607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-1/
>         igt@xe_pm@s4-vm-bind-prefetch.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-adlp-9/
>         igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-466/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-432/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-433/igt@xe_pm@vram-
>         d3cold-threshold.html> (Intel XE#579 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-lnl-2/igt@xe_query@multigpu-query-
>         invalid-size.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-463/
>         igt@xe_query@multigpu-query-uc-fw-version-guc.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>) +2 other tests skip
>   *
> 
>     igt@xe_query@query-invalid-extension:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-464/igt@xe_query@query-
>         invalid-extension.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-463/
>         igt@xe_wedged@basic-wedged.html> (Intel XE#2919 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2919>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume:
> 
>       o {shard-bmg}: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-2/
>         igt@kms_async_flips@async-flip-suspend-resume.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         bmg-8/igt@kms_async_flips@async-flip-suspend-resume.html> +4
>         other tests pass
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>       o {shard-bmg}: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-1/
>         igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-bmg-8/igt@kms_async_flips@async-flip-
>         with-page-flip-events.html> +12 other tests pass
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         adlp-6/igt@kms_async_flips@async-flip-with-page-flip-
>         events.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-adlp-8/
>         igt@kms_async_flips@async-flip-with-page-flip-events.html> +1
>         other test pass
>   *
> 
>     igt@kms_async_flips@crc:
> 
>       o {shard-bmg}: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-1/
>         igt@kms_async_flips@crc.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         bmg-5/igt@kms_async_flips@crc.html> +1 other test pass
>   *
> 
>     igt@kms_async_flips@crc@pipe-c-dp-2:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-1/
>         igt@kms_async_flips@crc@pipe-c-dp-2.html> (Intel XE#1656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-bmg-5/igt@kms_async_flips@crc@pipe-c-dp-2.html> +2 other
>         tests pass
>   *
> 
>     igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-1/
>         igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html> (Intel XE#1288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-bmg-5/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html> +3
>         other tests pass
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-1/
>         igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-
>         hdmi-a-1.html> (Intel XE#1426 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-adlp-9/
>         igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-
>         hdmi-a-1.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-8/
>         igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-1/
>         igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-lnl-4/igt@kms_big_fb@4-tiled-
>         max-hw-stride-64bpp-rotate-180-hflip.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-180:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-7/
>         igt@kms_big_fb@linear-16bpp-rotate-180.html> (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-bmg-4/igt@kms_big_fb@linear-16bpp-
>         rotate-180.html> +3 other tests pass
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_big_fb@linear-16bpp-rotate-180.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-180.html> +5
>         other tests pass
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-180:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-3/
>         igt@kms_big_fb@x-tiled-8bpp-rotate-180.html> (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-8/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-adlp-4/igt@kms_big_fb@x-
>         tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> +3 other
>         tests pass
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-6/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-
>         flip.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1204>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-adlp-8/igt@kms_big_fb@x-
>         tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-
>         hflip-async-flip.html>
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-463/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip-async-flip.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-
>         b-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-
>         a-6.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-5/
>         igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html> +2 other
>         tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o {shard-bmg}: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-4/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#2791 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2791> / Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-
>         transitions-varying-size.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-4/
>         igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> (Intel
>         XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1475>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-
>         cursor-varying-size.html>
>   *
> 
>     igt@kms_cursor_legacy@torture-bo:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-7/
>         igt@kms_cursor_legacy@torture-bo.html> (Intel XE#3007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         bmg-4/igt@kms_cursor_legacy@torture-bo.html> +13 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-
>         hdmi-a3.html> (Intel XE#2882 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-bmg-3/
>         igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-
>         hdmi-a3.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-4/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-
>         vblank@ab-dp2-hdmi-a3.html> +6 other tests pass
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-2/
>         igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html>
>         (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check-
>         interruptible@c-edp1.html> +3 other tests pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-
>         move.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139794v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
> 
>       o shard-lnl: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html>
>         (Intel XE#3010 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3010>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-
>         rgb101010-draw-mmap-wc.html>
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-7/
>         igt@kms_joiner@invalid-modeset-force-big-joiner.html> (Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-
>         force-big-joiner.html>
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-b-plane-3:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-5/
>         igt@kms_plane@plane-position-covered@pipe-b-plane-3.html> (Intel
>         XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-lnl-6/igt@kms_plane@plane-position-
>         covered@pipe-b-plane-3.html> +3 other tests pass
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-a-plane-4:
> 
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-5/
>         igt@kms_plane@plane-position-hole@pipe-a-plane-4.html> (Intel
>         XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-lnl-7/igt@kms_plane@plane-position-
>         hole@pipe-a-plane-4.html> +2 other tests pass
>   *
> 
>     igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-466/
>         igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html>
>         +16 other tests pass
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20.html> (Intel XE#2566 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2566>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20.html>
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-466/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20@pipe-b.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20@pipe-b.html> +2 other tests pass
>   *
> 
>     igt@kms_pm_rpm@legacy-planes:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_pm_rpm@legacy-planes.html> (Intel XE#2446 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-433/igt@kms_pm_rpm@legacy-planes.html>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-7/
>         igt@kms_pm_rpm@legacy-planes.html> (Intel XE#2446 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         bmg-1/igt@kms_pm_rpm@legacy-planes.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-6/
>         igt@kms_pm_rpm@legacy-planes-dpms.html> (Intel XE#1620 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1620> / Intel
>         XE#2864 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2864>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-
>         dpms.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
> 
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-6/
>         igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html> (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html>
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-2/
>         igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (Intel XE#2055 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2055>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-lnl-1/igt@kms_rotation_crc@multiplane-
>         rotation-cropping-top.html>
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-5/
>         igt@kms_setmode@basic.html> (Intel XE#2883 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         bmg-4/igt@kms_setmode@basic.html> +5 other tests pass
>   *
> 
>     igt@kms_setmode@basic@pipe-a-dp-2:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-5/
>         igt@kms_setmode@basic@pipe-a-dp-2.html> (Intel XE#2947 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2947>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         bmg-4/igt@kms_setmode@basic@pipe-a-dp-2.html>
>   *
> 
>     igt@xe_drm_fdinfo@utilization-others-idle:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-1/
>         igt@xe_drm_fdinfo@utilization-others-idle.html> (Intel XE#2667
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-idle.html>
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel
>         XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-dg2-464/igt@xe_evict@evict-mixed-many-
>         threads-small.html>
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o {shard-bmg}: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-1/
>         igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html>
>   *
> 
>     igt@xe_exec_threads@threads-hang-userptr-rebind-err:
> 
>       o {shard-bmg}: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-6/
>         igt@xe_exec_threads@threads-hang-userptr-rebind-err.html> ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-rebind-
>         err.html>
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-7/
>         igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> +2 other
>         tests pass
>   *
> 
>     igt@xe_oa@oa-regs-whitelisted:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-7/
>         igt@xe_oa@oa-regs-whitelisted.html> (Intel XE#2514 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2514>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         lnl-1/igt@xe_oa@oa-regs-whitelisted.html> +1 other test pass
>   *
> 
>     igt@xe_pat@prime-self-import-coh:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@xe_pat@prime-self-import-coh.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-432/igt@xe_pat@prime-self-import-coh.html> +30 other tests pass
>   *
> 
>     igt@xe_pm@d3hot-basic:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-lnl-4/
>         igt@xe_pm@d3hot-basic.html> (Intel XE#1620 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         lnl-7/igt@xe_pm@d3hot-basic.html>
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         dg2-432/igt@xe_pm@s2idle-basic.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-dg2-464/igt@xe_pm@s2idle-basic.html>
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         adlp-4/igt@xe_pm@s2idle-vm-bind-userptr.html> -> PASS <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-adlp-4/
>         igt@xe_pm@s2idle-vm-bind-userptr.html>
>   *
> 
>     igt@xe_pm@s3-basic-exec:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         dg2-432/igt@xe_pm@s3-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-464/igt@xe_pm@s3-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html> -> PASS <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-466/
>         igt@xe_pm@s4-d3hot-basic-exec.html> +6 other tests pass
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-9/
>         igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html>
>   *
> 
>     igt@xe_query@query-gt-list:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-bmg-7/
>         igt@xe_query@query-gt-list.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         bmg-8/igt@xe_query@query-gt-list.html> +36 other tests pass
>   *
> 
>     igt@xe_spin_batch@spin-fixed-duration:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-2/
>         igt@xe_spin_batch@spin-fixed-duration.html> (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-464/
>         igt@kms_async_flips@invalid-async-flip.html> (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_big_fb@y-tiled-64bpp-rotate-0.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-adlp-4/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-adlp-3/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/324>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#1231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +1 other test
>         fail
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-433/
>         igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html> (Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-
>         basic-y-tiled-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-dg2-464/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>) -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-464/
>         igt@kms_chamelium_audio@hdmi-audio-edid.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-dg2-464/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_chamelium_color@ctm-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_chamelium_color@ctm-0-25.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-433/
>         igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +3 other tests skip
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_plane_multiple@tiling-yf.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139794v2/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-
>         sf.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139794v2/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-
>         overlay-plane-move-continuous-exceed-sf.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>   *
> 
>     igt@kms_psr@fbc-pr-cursor-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_psr@fbc-pr-cursor-blt.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-433/igt@kms_psr@fbc-pr-cursor-blt.html> (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/929>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_psr@fbc-psr-cursor-render.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-435/igt@kms_psr@fbc-psr-cursor-render.html> (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/929>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-dg2-463/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-466/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/362>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-dg2-435/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#1500 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>   *
> 
>     igt@xe_create@multigpu-create-massive-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@xe_create@multigpu-create-massive-size.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>)
>   *
> 
>     igt@xe_eudebug@attach-debug-metadata:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@xe_eudebug@attach-debug-metadata.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/
>         shard-dg2-433/igt@xe_eudebug@attach-debug-metadata.html> (Intel
>         XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-466/
>         igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139794v2/shard-dg2-464/igt@xe_exec_fault_mode@once-
>         userptr-invalidate-prefetch.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@once-userptr-invalidate-race:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@xe_exec_fault_mode@once-userptr-invalidate-race.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139794v2/shard-dg2-463/igt@xe_exec_fault_mode@once-
>         userptr-invalidate-race.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3 other tests
>         skip
>   *
> 
>     igt@xe_oa@oa-exponents:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/shard-dg2-436/
>         igt@xe_oa@oa-exponents.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139794v2/shard-
>         dg2-435/igt@xe_oa@oa-exponents.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8061 -> IGT_8063
>   * Linux: xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852 -> xe-
>     pw-139794v2
> 
> IGT_8061: 8061
> IGT_8063: 8063
> xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852: 
> e1aba2bf4f79f2f8ae7ce538124d445fc91df852
> xe-pw-139794v2: 139794v2
> 

