Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA3BCA0ED3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 09:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4D910E716;
	Wed,  4 Sep 2024 09:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kn0C3Yoe";
	dkim-atps=neutral
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D288B10E0B9;
 Wed,  4 Sep 2024 09:42:14 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a86b64ebd8aso378971966b.1; 
 Wed, 04 Sep 2024 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725442932; x=1726047732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XZZnhKf2uRLw6Ccv1W5GAzxrbWTHO0MrdwhjDV2ckzw=;
 b=kn0C3Yoe79zXcVr9xuj7RWV8zl/MM7EfMPmimY+8EYiLRQxWHkvh9Sa8VsU/C186jM
 2s3Qc3KkfqtCSyack+6aaooHxo6kk0R+X4dn4g9q8uOS5mdDC4vx0xKodHuAYBD6Z8RW
 v6Jb3MN+SIBv29aW/6Y7yE9BxAUTZQFkBxKaazwfZTlfu+letNRGzs/ywS28cEBH9lQr
 DOXUXsTS6MU11nkv1kWfTxwSo9UgetwajDElz2lwET3JNPe6R7nQC32eztwocHoXnyzb
 QGX8xa0H+a9ghorw82aLp3v3LMrGSpTG5Fv/9ILL/YxWuOkW/y1XDGhfvc5FhFCecjAe
 EPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725442932; x=1726047732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZZnhKf2uRLw6Ccv1W5GAzxrbWTHO0MrdwhjDV2ckzw=;
 b=neew5LxYgRr3ohzbqvQMTloes5ma4W3iFN4/nrVXLQcn/YztNhREGDxE8jImaPnEkd
 fQJGRBmJf5tfRrltM11I1b0qdRcHRPRAYPBNzs/0bzofFTkBm/DngvpujMcN9bqEkkP8
 +j5vPPGPUsRMCGG7hC6O6gqcogLQzF9xrJIpySEWDKznL2MT1Fb8A3XOcZcdU3Aj63t/
 g7/aK/gYztZo8tDomWVATSq8EcRLIPe3t5FTRzpKncpaK7btUV2NLUWs6BR/pohgFhDb
 XSnixd2Dadwd9f86ggD4Q35bSMfYxk+XPC6jP616zMLNhuIkmrIYZlbVcUtfx6cFyBIR
 4DAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhcUeBLc+yvc2k8N0df155KPakxcgcSbvofvBgZ/2yZVqVC6g18OYTyCJtvvLYaVxQE4sBbLnpEljYY0Be@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxueNKyqqYa3o/j5w0zoAvGanMlk9Dbrr61v6csDP6s5tf3+fXL
 s+JcD2qlLte0rqI/h5HOejk6oaPOzzBdFhMs0hUlsF6EZz4hsIZ4dotK0sLnehE=
X-Google-Smtp-Source: AGHT+IE2H6hTk29o49Ez1frSl23CYlqnsJesOgNXk6iXB2/Mc9Yp055a01HEg+v6npX5obWWpHBidQ==
X-Received: by 2002:a05:6402:2550:b0:5be:fe26:dac1 with SMTP id
 4fb4d7f45d1cf-5c21ed313famr21162898a12.3.1725442931363; 
 Wed, 04 Sep 2024 02:42:11 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24e8dee31sm4581980a12.37.2024.09.04.02.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 02:42:10 -0700 (PDT)
Message-ID: <e84a9a93-5832-491e-b63d-d965d710f2ab@gmail.com>
Date: Wed, 4 Sep 2024 12:42:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display?=
 =?UTF-8?Q?=3A_Fix_BMG_CCS_modifiers_=28rev3=29?=
To: intel-xe@lists.freedesktop.org,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20240902074021.459480-1-juhapekka.heikkila@gmail.com>
 <172527238202.889566.14192118347537404698@2413ebb6fbb6>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <172527238202.889566.14192118347537404698@2413ebb6fbb6>
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

These reported possible new issues have nothing to do with my changes

/Juha-Pekka

On 2.9.2024 13.19, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/i915/display: Fix BMG CCS modifiers (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/137959/ <https:// 
> patchwork.freedesktop.org/series/137959/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-1873-
>   c689a348137cb6f8934a9be49438bafe413b97d5_full -> xe-pw-137959v3_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-137959v3_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-137959v3_full, please notify your bug team (I915-ci- 
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
> pw-137959v3_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_atomic_interruptible@legacy-cursor:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-436/
>         igt@kms_atomic_interruptible@legacy-cursor.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-432/igt@kms_atomic_interruptible@legacy-cursor.html> +1
>         other test incomplete
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-3/igt@kms_ccs@random-ccs-
>         data-4-tiled-bmg-ccs.html> +3 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-436/
>         igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-
>         dp4.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-
>         interruptible@bd-hdmi-a6-dp4.html> +1 other test dmesg-warn
>   *
> 
>     igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-4/
>         igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         adlp-2/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html>
>   *
> 
>     igt@xe_exec_basic@twice-basic:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-8/
>         igt@xe_exec_basic@twice-basic.html> -> TIMEOUT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-adlp-6/
>         igt@xe_exec_basic@twice-basic.html> +1 other test timeout
> 
> 
>         Warnings
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-7/
>         igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html>
>         (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-
>         tiled-bmg-ccs@pipe-c-edp-1.html> +15 other tests skip
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-bmg-1/
>         igt@kms_plane_scaling@planes-unity-scaling-downscale-
>         factor-0-75.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-bmg-8/
>         igt@kms_plane_scaling@planes-unity-scaling-downscale-
>         factor-0-75.html> +3 other tests incomplete
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-137959v3_full that come from known 
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
>     igt@core_hotunplug@unbind-rebind:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-4/
>         igt@core_hotunplug@unbind-rebind.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-adlp-6/
>         igt@core_hotunplug@unbind-rebind.html> (Intel XE#2317 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2317>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-
>     linear:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-5/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-
>         edp-1-linear.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-3/igt@kms_async_flips@async-
>         flip-with-page-flip-events@pipe-a-edp-1-linear.html> (Intel
>         XE#911 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/911>) +3 other tests fail
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-8/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-
>         hdmi-a-1-x.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-adlp-9/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-
>         hdmi-a-1-x.html> (Intel XE#1033 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1033>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-
>     hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-
>         a-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-dg2-433/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-
>         a-hdmi-a-6.html> (Intel XE#1426 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1426>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-8/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-270.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-8/igt@kms_big_fb@4-tiled-max-
>         hw-stride-32bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-6/
>         igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-137959v3/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip.html> (Intel XE#1659 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-463/
>         igt@kms_big_fb@linear-64bpp-rotate-270.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_big_fb@x-tiled-32bpp-rotate-180.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-6/igt@kms_big_fb@x-
>         tiled-32bpp-rotate-270.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-463/igt@kms_big_fb@y-
>         tiled-64bpp-rotate-270.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-9/
>         igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-
>         flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-
>         stride-32bpp-rotate-180-async-flip.html> (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-6/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +2
>         other tests fail
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-1/igt@kms_bw@connected-
>         linear-tiling-2-displays-1920x1080p.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-6/igt@kms_bw@connected-linear-
>         tiling-2-displays-1920x1080p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-2/igt@kms_bw@connected-linear-
>         tiling-4-displays-3840x2160p.html> (Intel XE#1512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-4/igt@kms_bw@linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-4/igt@kms_bw@linear-tiling-3-
>         displays-1920x1080p.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-433/igt@kms_ccs@bad-
>         rotation-90-4-tiled-mtl-mc-ccs.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-433/igt@kms_ccs@bad-
>         rotation-90-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-6.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +6 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-6/igt@kms_ccs@bad-
>         rotation-90-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#1399 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) +7 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-1/igt@kms_ccs@bad-
>         rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-436/igt@kms_ccs@crc-
>         primary-basic-4-tiled-lnl-ccs.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-2/igt@kms_ccs@crc-primary-
>         basic-y-tiled-ccs.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +7 other tests skip
>   *
> 
>     igt@kms_chamelium_audio@dp-audio-edid:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-1/igt@kms_chamelium_audio@dp-
>         audio-edid.html> (Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201> / Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-8/igt@kms_chamelium_edid@hdmi-
>         edid-stress-resolution-4k.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-fast:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@kms_chamelium_frames@dp-crc-fast.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-64x21:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-1/igt@kms_cursor_crc@cursor-
>         offscreen-64x21.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-4/
>         igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#309 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/309>) +1 other test skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-5/
>         igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html> (Intel
>         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-
>     varying-size:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-3/
>         igt@kms_cursor_legacy@short-flip-before-cursor-atomic-
>         transitions-varying-size.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-lnl-3/
>         igt@kms_cursor_legacy@short-flip-before-cursor-atomic-
>         transitions-varying-size.html> (Intel XE#1541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1541>)
>   *
> 
>     igt@kms_cursor_legacy@torture-move@pipe-b:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_cursor_legacy@torture-move@pipe-b.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-435/igt@kms_cursor_legacy@torture-move@pipe-b.html> (Intel
>         XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/877>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-9/igt@kms_flip@2x-
>         nonexisting-fb-interruptible.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-3/igt@kms_flip@2x-nonexisting-
>         fb-interruptible.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +3 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-434/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-137959v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-6/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>         downscaling@pipe-a-valid-mode.html> -> DMESG-FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-adlp-1/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +3 other tests
>         dmesg-fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-
>         render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1201> / Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#1861 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1861>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-1/
>         igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1861>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1201> / Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +3 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1201> / Intel XE#653 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +2 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1201> / Intel XE#656 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +14 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201> / Intel XE#653 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>   *
> 
>     igt@kms_hdmi_inject@inject-4k:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-5/
>         igt@kms_hdmi_inject@inject-4k.html> (Intel XE#1470 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1470>)
>   *
> 
>     igt@kms_invalid_mode@clock-too-high:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-1/igt@kms_invalid_mode@clock-
>         too-high.html> (Intel XE#1450 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1450> / Intel XE#2568 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2568> / Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>   *
> 
>     igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-1/igt@kms_invalid_mode@clock-
>         too-high@pipe-a-edp-1.html> (Intel XE#1450 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1450>) +1 other test
>         skip
>   *
> 
>     igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-1/igt@kms_invalid_mode@clock-
>         too-high@pipe-c-edp-1.html> (Intel XE#1450 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1450> / Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>   *
> 
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-1/
>         igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-137959v3/shard-lnl-2/igt@kms_plane@plane-position-hole-
>         dpms@pipe-b-plane-4.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +6 other tests
>         dmesg-warn
>   *
> 
>     igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-1/
>         igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html>
>         (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1874>) +1 other test fail
>   *
> 
>     igt@kms_plane_multiple@tiling-y@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-4/
>         igt@kms_plane_multiple@tiling-y@pipe-a-hdmi-a-1.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-137959v3/shard-adlp-9/igt@kms_plane_multiple@tiling-y@pipe-a-
>         hdmi-a-1.html> (Intel XE#1195 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-3/igt@kms_plane_scaling@intel-
>         max-src-size.html> (Intel XE#599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-
>     modifiers@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-2/igt@kms_plane_scaling@plane-
>         downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html> (Intel
>         XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/498>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-
>     upscale-20x20@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-2/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-
>         upscale-20x20@pipe-a-edp-1.html> (Intel XE#2318 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +7 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-
>     upscale-20x20@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-4/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-
>         upscale-20x20@pipe-a-hdmi-a-1.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2318>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-
>     upscale-20x20@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-4/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-
>         upscale-20x20@pipe-d-hdmi-a-1.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2318> / Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-3/
>         igt@kms_pm_dc@dc6-dpms.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-lnl-7/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1430 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>   *
> 
>     igt@kms_pm_rpm@dpms-non-lpsp:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-9/igt@kms_pm_rpm@dpms-non-
>         lpsp.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1201> / Intel XE#836 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-4/igt@kms_pm_rpm@dpms-non-
>         lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1439>)
>   *
> 
>     igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-
>         plane-move-continuous-exceed-fully-sf.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-435/igt@kms_psr@fbc-psr2-
>         sprite-plane-onoff.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1
>         other test skip
>   *
> 
>     igt@kms_psr@fbc-psr2-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-1/igt@kms_psr@fbc-psr2-
>         suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +5 other tests
>         skip
>   *
> 
>     igt@kms_psr@pr-primary-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-2/igt@kms_psr@pr-primary-
>         blt.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1406>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-6/
>         igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html>
>         (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1874>) +1 other test fail
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-1/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel
>         XE#1437 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-dg2-436/
>         igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html>
>         (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>) +2 other tests fail
>   *
> 
>     igt@kms_vrr@flip-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-2/igt@kms_vrr@flip-
>         suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201> / Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests
>         skip
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-drrs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-3/igt@kms_vrr@seamless-rr-
>         switch-drrs.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499> / Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-7/igt@sriov_basic@enable-vfs-
>         bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1091>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-2/igt@xe_evict@evict-beng-
>         mixed-threads-large-multi-vm.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3 other tests
>         skip
>   *
> 
>     igt@xe_evict@evict-beng-small-external:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-2/igt@xe_evict@evict-beng-
>         small-external.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/688>)
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@xe_evict@evict-mixed-threads-large.html> -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-466/igt@xe_evict@evict-mixed-threads-large.html> (Intel
>         XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-4/igt@xe_evict_ccs@evict-
>         overcommit-parallel-nofree-samefd.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-4/igt@xe_exec_basic@multigpu-
>         no-exec-bindexecqueue-userptr-invalidate.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1392>) +3 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-2/igt@xe_exec_basic@multigpu-
>         no-exec-bindexecqueue-userptr-rebind.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_compute_mode@twice-basic:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-8/
>         igt@xe_exec_compute_mode@twice-basic.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-adlp-6/
>         igt@xe_exec_compute_mode@twice-basic.html> (Intel XE#1069
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>)
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-2/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/288>) +7 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-435/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-
>         imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1201> / Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-8/igt@xe_exec_mix_modes@exec-
>         simple-batch-store-lr.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_reset@cm-cat-error:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-adlp-2/igt@xe_exec_reset@cm-
>         cat-error.html> (Intel XE#1962 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1962>)
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-6/
>         igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html> (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_module_load@force-load:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-6/igt@xe_module_load@force-
>         load.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1201> / Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>) +1 other test skip
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-3/
>         igt@xe_module_load@load.html> (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_oa@invalid-oa-format-id:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-432/igt@xe_oa@invalid-oa-
>         format-id.html> (Intel XE#2541 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2541>)
>   *
> 
>     igt@xe_oa@non-system-wide-paranoid:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-8/igt@xe_oa@non-system-wide-
>         paranoid.html> (Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201> / Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test
>         skip
>   *
> 
>     igt@xe_oa@oa-regs-whitelisted:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-8/
>         igt@xe_oa@oa-regs-whitelisted.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-lnl-5/igt@xe_oa@oa-
>         regs-whitelisted.html> (Intel XE#2514 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2514>)
>   *
> 
>     igt@xe_oa@oa-regs-whitelisted@ccs-0:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-5/igt@xe_oa@oa-regs-
>         whitelisted@ccs-0.html> (Intel XE#2514 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2514>)
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-7/igt@xe_pm@d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-lnl-3/igt@xe_pm@s3-mocs.html>
>         (Intel XE#584 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/584>)
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-8/
>         igt@xe_pm@s4-d3hot-basic-exec.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-lnl-2/igt@xe_pm@s4-
>         d3hot-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607>) +1 other test abort
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-4/igt@xe_query@multigpu-
>         query-uc-fw-version-guc.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
> 
>       o {shard-bmg}: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-bmg-3/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-
>         hdmi-a-3-4.html> (Intel XE#1033 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-bmg-8/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-
>         hdmi-a-3-4.html> +7 other tests pass
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-9/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-adlp-1/igt@kms_big_fb@x-
>         tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> +1
>         other test pass
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-bmg-8/
>         igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-
>         dp-2.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/787>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-bmg-4/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html> +44 other tests pass
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-
>         ccs@pipe-c-hdmi-a-6.html> -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-434/igt@kms_ccs@crc-
>         sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html> +1
>         other test pass
>   *
> 
>     igt@kms_cursor_legacy@single-move@pipe-a:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         dg2-463/igt@kms_cursor_legacy@single-move@pipe-a.html> (Intel
>         XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@kms_cursor_legacy@single-
>         move@pipe-a.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@torture-move:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         adlp-4/igt@kms_cursor_legacy@torture-move.html> (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-adlp-4/igt@kms_cursor_legacy@torture-move.html> +1 other
>         test pass
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-8/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-
>         y.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-1/igt@kms_flip_tiling@flip-
>         change-tiling@pipe-d-hdmi-a-1-y-to-y.html> +9 other tests pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-
>         blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1861>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-
>         blt.html> +2 other tests pass
>   *
> 
>     igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
> 
>       o {shard-bmg}: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-bmg-1/
>         igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html>
>         (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-bmg-2/igt@kms_plane@pixel-format-source-
>         clamping@pipe-b-plane-0.html> +5 other tests pass
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-a-plane-4:
> 
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-5/
>         igt@kms_plane@plane-position-covered@pipe-a-plane-4.html> (Intel
>         XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-lnl-8/igt@kms_plane@plane-position-
>         covered@pipe-a-plane-4.html>
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-b-plane-2:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-6/
>         igt@kms_plane@plane-position-hole@pipe-b-plane-2.html> (Intel
>         XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-lnl-4/igt@kms_plane@plane-position-
>         hole@pipe-b-plane-2.html>
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-render@edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-7/
>         igt@kms_psr@fbc-psr2-cursor-render@edp-1.html> (Intel XE#1649
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html> +3
>         other tests pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-6/
>         igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-adlp-4/igt@kms_universal_plane@cursor-fb-
>         leak.html>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-bmg-8/
>         igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html> +1
>         other test pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-6/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html>
>         (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-adlp-4/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-b-hdmi-a-1.html>
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-5/
>         igt@kms_vrr@flipline.html> (Intel XE#2443 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         lnl-1/igt@kms_vrr@flipline.html> +1 other test pass
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473> / Intel XE#402 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/402>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-433/igt@xe_evict@evict-
>         beng-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_exec_compute_mode@lr-mode-workload:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-4/
>         igt@xe_exec_compute_mode@lr-mode-workload.html> (Intel XE#2125
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-adlp-1/igt@xe_exec_compute_mode@lr-mode-workload.html>
>   *
> 
>     igt@xe_exec_threads@threads-hang-shared-vm-basic:
> 
>       o shard-adlp: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         adlp-9/igt@xe_exec_threads@threads-hang-shared-vm-basic.html>
>         (Intel XE#1169 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1169> / Intel XE#1195 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-adlp-2/
>         igt@xe_exec_threads@threads-hang-shared-vm-basic.html>
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-5/
>         igt@xe_live_ktest@xe_bo.html> (Intel XE#1192 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1192>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         lnl-6/igt@xe_live_ktest@xe_bo.html>
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-6/
>         igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#1616 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1616>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         lnl-1/igt@xe_pm@s2idle-vm-bind-userptr.html>
>   *
> 
>     igt@xe_pm@s3-multiple-execs:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         dg2-463/igt@xe_pm@s3-multiple-execs.html> (Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> /
>         Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/569>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html>
>         +1 other test pass
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-2/
>         igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-lnl-5/igt@xe_pm@s4-
>         basic-exec.html> +1 other test pass
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-9/
>         igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-adlp-6/
>         igt@xe_pm@s4-multiple-execs.html>
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-lnl-3/
>         igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/958>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         lnl-4/igt@xe_pm_residency@toggle-gt-c6.html>
>   *
> 
>     igt@xe_spin_batch@spin-fixed-duration-with-preempter:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-adlp-6/
>         igt@xe_spin_batch@spin-fixed-duration-with-preempter.html>
>         (Intel XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1081>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-adlp-4/igt@xe_spin_batch@spin-fixed-
>         duration-with-preempter.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-466/
>         igt@kms_async_flips@invalid-async-flip.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/873>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@kms_async_flips@invalid-async-
>         flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/873>)
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-435/
>         igt@kms_big_fb@x-tiled-32bpp-rotate-90.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-
>         rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/316>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/316>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-
>         async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/324>) -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-adlp-6/igt@kms_big_fb@x-
>         tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel
>         XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#1231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *
> 
>     igt@kms_big_fb@y-tiled-16bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_big_fb@y-tiled-16bpp-rotate-90.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html>
>         (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201>) +7 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-466/
>         igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-
>         rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +7 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-435/igt@kms_bw@connected-linear-
>         tiling-2-displays-2160x1440p.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-466/
>         igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#2191 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2191>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-436/igt@kms_bw@connected-linear-
>         tiling-4-displays-2560x1440p.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-433/
>         igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-432/igt@kms_bw@linear-
>         tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +3 other tests
>         skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-435/
>         igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-
>         a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1201> / Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-
>         hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/787>) +69 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-
>         dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-dg2-463/igt@kms_ccs@crc-primary-
>         basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +55 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel
>         XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1252>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-bmg-ccs.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-433/igt@kms_ccs@random-
>         ccs-data-4-tiled-mtl-mc-ccs.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +15 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455> / Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-
>         dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/455> / Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +19 other
>         tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@kms_cdclk@mode-transition-all-outputs.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/314>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@kms_cdclk@mode-transition-all-
>         outputs.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/314>)
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_chamelium_color@gamma.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-436/igt@kms_chamelium_color@gamma.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/306>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-436/
>         igt@kms_chamelium_hpd@dp-hpd-fast.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +6 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_chamelium_hpd@hdmi-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +4 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-436/
>         igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1
>         other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-433/
>         igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@kms_cursor_crc@cursor-
>         onscreen-512x170.html> (Intel XE#308 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +2 other tests
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#323 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-435/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/776>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-436/igt@kms_fbcon_fbt@psr.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-433/igt@kms_feature_discovery@chamelium.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#701 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/701>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#703 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/703>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-435/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138> /
>         Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-432/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-466/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1137> / Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-432/igt@kms_feature_discovery@dp-
>         mst.html> (Intel XE#1137 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1137>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-433/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-
>         fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201> / Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-
>         fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1201> / Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +18 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html> (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-137959v3/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html> (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +23
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1158> / Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v3/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1201> / Intel XE#653 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +24 other
>         tests skip
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_hdr@invalid-hdr.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-436/igt@kms_hdr@invalid-hdr.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +13
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455> / Intel XE#498 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers.html> (Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201> / Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1
>         other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>     modifiers@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers@pipe-c-hdmi-a-6.html> (Intel XE#498 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-25.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2318> / Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-25.html> (Intel XE#2318 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2318> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>     factor-0-25@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2318>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-432/igt@kms_plane_scaling@planes-
>         upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel
>         XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2318>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>     factor-0-25@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>         factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#2318 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-
>         downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2318>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>     factor-0-25@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>         factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#2318 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2318> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-
>         downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2318> / Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-433/
>         igt@kms_pm_backlight@basic-brightness.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@kms_pm_backlight@basic-
>         brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-433/igt@kms_pm_backlight@fade.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_pm_dc@deep-pkgc.html> (Intel XE#908 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/908>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-436/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-
>         move-continuous-exceed-sf.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-466/
>         igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#1489 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html> (Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +3 other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel
>         XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-436/
>         igt@kms_psr2_su@page_flip-xrgb8888.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-432/igt@kms_psr2_su@page_flip-
>         xrgb8888.html> (Intel XE#1122 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_psr@fbc-psr-sprite-render.html> (Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-433/igt@kms_psr@fbc-psr-sprite-render.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/929>) +8 other tests skip
>   *
> 
>     igt@kms_psr@pr-basic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-434/
>         igt@kms_psr@pr-basic.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-432/igt@kms_psr@pr-basic.html> (Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +8 other tests
>         skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1149 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1149>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-463/igt@kms_psr_stress_test@flip-
>         primary-invalidate-overlay.html> (Intel XE#1149 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1149> / Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_rotation_crc@bad-pixel-format:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-466/
>         igt@kms_rotation_crc@bad-pixel-format.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-
>         format.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/327>) +3 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-466/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1127> / Intel XE#1201 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/327>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-435/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#1500 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1500>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-dg2-463/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#362 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/362>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@kms_writeback@writeback-fb-id.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-433/igt@kms_writeback@writeback-fb-id.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/756>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0x369:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-435/
>         igt@xe_copy_basic@mem-set-linear-0x369.html> (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-432/igt@xe_copy_basic@mem-set-
>         linear-0x369.html> (Intel XE#1126 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@xe_evict@evict-mixed-many-threads-large.html> -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel
>         XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_fault_mode@once-rebind-prefetch:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@xe_exec_fault_mode@once-rebind-prefetch.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-
>         prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/288>) +15 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-
>         userptr-invalidate-race.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +17
>         other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-463/
>         igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#2360 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2360>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-dg2-432/
>         igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>)
>   *
> 
>     igt@xe_oa@oa-regs-whitelisted:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@xe_oa@oa-regs-whitelisted.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/shard-
>         dg2-435/igt@xe_oa@oa-regs-whitelisted.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541>) +2 other tests skip
>   *
> 
>     igt@xe_oa@rc6-disable:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-466/
>         igt@xe_oa@rc6-disable.html> (Intel XE#1201 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>         XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-137959v3/shard-dg2-432/igt@xe_oa@rc6-disable.html>
>         (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541>) +1 other test skip
>   *
> 
>     igt@xe_pat@display-vs-wb-transient:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#1337 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1337>)
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#2284 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_query@multigpu-query-cs-cycles:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-434/
>         igt@xe_query@multigpu-query-cs-cycles.html> (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-137959v3/shard-dg2-432/igt@xe_query@multigpu-query-cs-
>         cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-engines:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-dg2-432/
>         igt@xe_query@multigpu-query-engines.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-463/igt@xe_query@multigpu-query-engines.html> (Intel
>         XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/944>)
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/shard-
>         dg2-466/igt@xe_wedged@basic-wedged.html> (Intel XE#1760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v3/
>         shard-dg2-432/igt@xe_wedged@basic-wedged.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8000 -> IGT_8001
>   * Linux: xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5 -> xe-
>     pw-137959v3
> 
> IGT_8000: fba44baafa5d79b6eed52fa24234781e8e47beb8 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5: 
> c689a348137cb6f8934a9be49438bafe413b97d5
> xe-pw-137959v3: 137959v3
> 

