Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F5C83F23
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 13:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912D10E6AF;
	Thu, 29 Aug 2024 13:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VqPgy532";
	dkim-atps=neutral
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DAE10E0BB;
 Thu, 29 Aug 2024 13:49:05 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso640901a12.3; 
 Thu, 29 Aug 2024 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724939343; x=1725544143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0QNL6oB1CoddHALlWCuHo+VKuSp70rwXtrVwofTyGqs=;
 b=VqPgy532g0LDGin0BGfJdhKOElMoSQwn2TgGJ7BN4PxXCKqKk94/W5wlmrcR8qwuJk
 MEtBHeJgZqZvEODgVklWWJgDWyo8lOjUrV7sqZ+DigzM4FUtpgFFHZnW1q2zNkXQ28DA
 lOUXaZW9XcvHUhVwVIM4TpFxt5nCKfZ7EYC3dIrM7SnPVGS8L7j4d1UD0ahpdTffVbFd
 YbRIst2xdViy1lAdM21VHiqwlPZyWzTaRKnIbjKsIT/U7/gBA4qM/bIIHOGOBasEJN9w
 s/XxVSvt4jA9kaRiPZsuLJkB9GUJAkNarBNf02XC1n2vhT+BRYVNqI+oboRlxO+VIvqY
 5F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724939343; x=1725544143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0QNL6oB1CoddHALlWCuHo+VKuSp70rwXtrVwofTyGqs=;
 b=gtsxWYIz8oSkqTZJg9Zw3Tr60jYqkaZjDDpgKsPhL6tpUuK+oxvkp7AqK18Af4SwhE
 cU0H2PwSnH5nrnFx3+atQOwrWndJD39rrN6vPTF8afkLhNkIxlqMncPKcSC9xrM0MXrX
 z0Ityf9KIYjRyG02ohiHypKpDz4+P++1Ubw/FsB6huF2EDdZIykce8hIHiACruHmoK1F
 iyOEiCY/UBsuOGNqFMPauq/RNasyVZdeZVVrkoWSLAOub0fAmHj821LGG5ReYeuN4E90
 evB5C2DqMs16I96T6V1ek0n5Og1O+cJJOgSxI9vOD25K/Nx4LI8QX4/nFdYeCViziQ8I
 fJyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQCNPdzYf/JqbKf6XptddJOGF4H6KYuoL8zWJh+Lh/xjOKL8XDCz1owH9OntUEyy0fYRXbLA6Zdxwubrm5@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/nZasiy4u0SqPofy2TYbwJi5SkuvqUIdE0LRfn6WVZnDfuT9w
 evtwcuT4hiELYrg6tKbPfZOFLcdTiNyWb6C6fy1oKFR4ERYUuUGKOkEvblGSIv4=
X-Google-Smtp-Source: AGHT+IHKWSfjKHXRbXgnzdCcw+nPRwH91uWPzeUNgWJZT3ntsUzvjccm43SfVmn/iwyWh9V/Byb1Vw==
X-Received: by 2002:a05:6402:401f:b0:5c0:ab2d:334c with SMTP id
 4fb4d7f45d1cf-5c21eda0c76mr2794084a12.32.1724939342986; 
 Thu, 29 Aug 2024 06:49:02 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.76])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a400sm722928a12.18.2024.08.29.06.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 06:49:02 -0700 (PDT)
Message-ID: <ca42f9eb-41ac-4a46-99c3-78b090e71778@gmail.com>
Date: Thu, 29 Aug 2024 16:48:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/i915/display?=
 =?UTF-8?Q?=3A_Fix_BMG_CCS_modifiers?=
To: intel-xe@lists.freedesktop.org,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20240829122928.423456-1-juhapekka.heikkila@gmail.com>
 <172493827647.831948.6245569211455866503@2413ebb6fbb6>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <172493827647.831948.6245569211455866503@2413ebb6fbb6>
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

On 29.8.2024 16.31, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/i915/display: Fix BMG CCS modifiers
> *URL:*	https://patchwork.freedesktop.org/series/137959/ <https:// 
> patchwork.freedesktop.org/series/137959/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-1855-
>   c3a10838b94df7ede31b57de48c6386ae1116c77_BAT -> xe-pw-137959v1_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-137959v1_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-137959v1_BAT, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (8 -> 9)
> 
> Additional (1): bat-adlp-7
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-137959v1_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@core_hotunplug@unbind-rebind:
>       o bat-adlp-7: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/igt@core_hotunplug@unbind-
>         rebind.html>
> 

This listed failure has nothing to do with my change.

/Juha-Pekka


> 
>     Known issues
> 
> Here are the changes found in xe-pw-137959v1_BAT that come from known 
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
>     igt@kms_dsc@dsc-basic:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>)
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o bat-adlp-7: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/
>         igt@kms_frontbuffer_tracking@basic.html> (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>   *
> 
>     igt@xe_evict@evict-beng-small:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/igt@xe_evict@evict-beng-
>         small.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/261> / Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +15 other
>         tests skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/igt@xe_evict_ccs@evict-
>         overcommit-parallel-nofree-samefd.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-
>         userptr-invalidate-prefetch.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32 other
>         tests skip
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/
>         igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html> (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229> /
>         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +1 other test skip
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/
>         igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2229>) +1 other test skip
>   *
> 
>     igt@xe_mmap@vram:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/igt@xe_mmap@vram.html> (Intel
>         XE#1008 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008>)
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/igt@xe_pat@pat-index-
>         xe2.html> (Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/977>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-137959v1/bat-adlp-7/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/979>) +1 other test skip
> 
> 
>     Build changes
> 
>   * Linux: xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77 -> xe-
>     pw-137959v1
> 
> IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77: 
> c3a10838b94df7ede31b57de48c6386ae1116c77
> xe-pw-137959v1: 137959v1
> 

