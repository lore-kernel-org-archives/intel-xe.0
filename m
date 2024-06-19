Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A532C2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 10:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A9410EC10;
	Wed, 19 Jun 2024 10:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="nCier1c1";
	dkim-atps=neutral
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77E210E068
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 10:26:43 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso60868441fa.0
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1718792801; x=1719397601;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aujn0STKyH/Gfbmg4Qen6h4D0viqZNP8GdxwAghkmtQ=;
 b=nCier1c1RvnlRL8SceCROjVVTAPUrow8nkU4GTCjNHVvBiq9UHEktHbK8F66QiT0+m
 pAlq2O+3NaLj/OqOAEzTOBlG8giqu4Hdu0mnYXhcD2O/NllyT6bse3utacAIvaFplTqc
 nIBSMW8AQ3u3s/tMaRx6kViysHArMeYKV17TvWhi9llziJAYWYCpv4gc4PF0nt46/KaJ
 6FA5PIfPuEDijvn4Qocvx+QOrTrIhGnxbzmlEygVzzQacPpy7fCVTMd/53QMT6tokkYJ
 H5mW0i/23wrwWohpBevWkoAJGPMs7ixioh5N2onycPM9YY58j+YEpTMeEVZKrnvwQLMD
 XiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718792801; x=1719397601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aujn0STKyH/Gfbmg4Qen6h4D0viqZNP8GdxwAghkmtQ=;
 b=kaAMztx23dAPtpIer6WPuNgyk6fIqa2kRTgoVGHo0jvrE6fqOiYamJQB98RjFHKlRV
 M0/VecXPiwM8Cv/vdyS7mVBgquyIxbd6WHJm/yylitSaP5N22QIjvdyaIX2k8I7NgWkX
 0vYhLQeQoqUB9JCfrGFzjI/Eajr/6q+S7U8Qdaj6A05famFnNAob/OaiodXf4xDC4l6J
 Z9hHGUzPfObL0zKJJ6SZrhPXEcLh5ULa7FlCl99z7BboicaVs2EYPk6d2LQK5s+HOY/7
 /tEPhP5ssyvTIjR4gesy367EzVN7tETtr5zah9bZ5uUHQyXnnrsP7WGsvipv2FpQqIyb
 DNtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKLRnmeTl91Xnkpgw54FAPe0R/JYvSNyB3DC5Xa24CvlCrOV9ZoUnvJM7BX6Z/2IMMX+Z0JqyfA/BvTLAQVoq0pH8AHLFbLZ0SyKo+MVA=
X-Gm-Message-State: AOJu0YwORQwlY9X3peHGhPj4yIlfKkeD3k2/ZvWep+yCQeCvSzfyobSh
 004dPRomWsRxuIHhXJEXFNMTCYihrU9T4GuWmHwfKD/r639Ez36dSYT/bmwQ2tk=
X-Google-Smtp-Source: AGHT+IFJvIUTCWkOTgVEeh78ujRc/6KgWIWXZtdrfHkfnFgDGyH7SCoPEEseoQ81ktepTPjKxuGAgA==
X-Received: by 2002:a2e:7204:0:b0:2eb:e840:4a1b with SMTP id
 38308e7fff4ca-2ec3ceb6b72mr12225011fa.7.1718792801425; 
 Wed, 19 Jun 2024 03:26:41 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320b11sm224973195e9.29.2024.06.19.03.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 03:26:41 -0700 (PDT)
Message-ID: <83958f28-0e27-428a-b0d0-6860b31ae498@ursulin.net>
Date: Wed, 19 Jun 2024 11:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] drm/i915: Don't check for atomic context on
 PREEMPT_RT
Content-Language: en-GB
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20240613102818.4056866-1-bigeasy@linutronix.de>
 <20240613102818.4056866-4-bigeasy@linutronix.de>
 <94423591-adba-46d4-a9ba-f377dfab369f@ursulin.net>
 <20240614110548.m3lloBjv@linutronix.de>
 <fa38f377-a00a-4e0c-b416-54a1c3f15d4d@ursulin.net>
 <20240617100752.9XDTS0R5@linutronix.de>
 <b740d56d-a744-4d35-b3f2-1166b8df2aef@ursulin.net>
 <20240618125430.9gWIUg9A@linutronix.de>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240618125430.9gWIUg9A@linutronix.de>
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


On 18/06/2024 13:54, Sebastian Andrzej Siewior wrote:
> On 2024-06-18 10:00:09 [+0100], Tvrtko Ursulin wrote:
>> I did a re-test but am not 100% certain yet. CI looks frustratingly noisy at
>> the moment.
>>
>> igt@debugfs_test@read_all_entries appears to be a fluke which is not new.
>>
>> But igt@gem_exec_parallel@engines@basic from the latest run seem new.
>>
>> So I queued another re-test.
> 
> Okay. If you want me to repost the whole series or just parts of it,
> just say so.

Looks like a green set of results, both BAT and full run.

Patches 1&2 will need someone from the display side to bless though.

Regards,

Tvrtko
