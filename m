Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB3EC0218F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 08:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1BC10E299;
	Tue,  4 Feb 2025 08:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="x47sXSiF";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651C410E299
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 08:58:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so36357595e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Feb 2025 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738659519; x=1739264319;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AkdPoAQ1Aae3LjCL/dNZypVPbdSgZyo6LeKnFDKvFSM=;
 b=x47sXSiFLWMeVYN+s2t7ONE2MM/ZKIaTyxwhE7nL86QRdwqB5nx4CB/8IwXfNR+4mt
 30/sTDApPIIkXdw/I85ZDZptPALCNpmx3J3z3LjwVVEMwC8Q95u5SstghkgjmeiWH7DP
 he8GzjYN34f/hjeLaggjqBLpx7zViY2uYfkuVD7+A0TtyE/UnNpC/XXLdqzRwtt/A1Xv
 1In0lAE7lq1bkTznwXuSKmfPODNp7WOaSOiFziOlT3m6m29sKMxnMV/MEsflCjeiXOI3
 tDUoKxEQWKU3mxLZLpGIz3roL1Hz+KNSsoWNweC68uxaOrvlbWSZOkoGA/5en2zuDpVm
 dqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738659519; x=1739264319;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AkdPoAQ1Aae3LjCL/dNZypVPbdSgZyo6LeKnFDKvFSM=;
 b=wpsOi6WrVd4mSgFcuHle2Z5ob80HIw/w6smksqEhmz9DK/ysmFH8SSWIYan4u0n317
 /eU4RIdYeVt9fl1x57IYRXSJbbsOyFslhU/MbojkEBNvlWl5i52To0dFQevc7WrIR97V
 hkxr67tv5wxigXEbQHYBCq0FxajwTmUM7c5JwT3p+5su3/rK8EfQ1PlBALto1ipMl1Et
 0YD/JNzzg2X1QarTm7PSNbn4WPR7G6Ssu6TKYaYYdv7+menScb2SwTA78omJmaLOeoSP
 j4KP2inDS370a/xX8ixHusJcbtxp6K41qKplFcgcSzSeHkTztmc+zEh+3QHzPxNaBvPs
 6BAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3QN0cnFJCX2bo5zAKwwo+hBI3NLzZiWDo6qHgiTobnO8sI0G9py7Cpf2Nkqf2l1CpbSTJY9D1lg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNNHcQU6WZCSoMC5b+k7tchk2j06T49MWXtftcN0lXTqObMo13
 u82q+T9FWVhSju6CLD2IPkujdYriVNzj46R/MNnwLrnNqCSX3Y2AjpIlNCYiiN8=
X-Gm-Gg: ASbGnctHqU5c3Km1SkHsZdQMEYGqWAenG7MkGHkZR6nTe3diMglZvVhemOsegwfjNCd
 xX7AuG/h3AblTyv4CGxxQt3WIq0NSdJa6Hg7KN5ywlaVm5N25UX+LCSJcQxjKaUomQ0+6i7Sxpg
 iinJfmxF7WW/9XfAk35fQZPD/baBjWfYcansvWowvR/Bf/EI8c+suNfl3N2e3MVGQ0IDKxsDZxc
 GrGNVQcAlDGX2KGxyYwIzkvPFLHH4R5Z+YzYxvPe4lwGrSVXuSUrWDRTdM6eF65n/8lb7rZ9pc+
 MFtmqEwRUFaQOArjqO6dKIuFpQt2n+o=
X-Google-Smtp-Source: AGHT+IFcF10FVf9PPrMrfz500wgXpGW6E00pYJWNifq3LC28RsoNhV9GUu83YxPKRaOYfJ6R7iOnqA==
X-Received: by 2002:a05:600c:4f55:b0:436:51bb:7a43 with SMTP id
 5b1f17b1804b1-438dc3ab675mr236296745e9.5.1738659518647; 
 Tue, 04 Feb 2025 00:58:38 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e6b62sm182834075e9.24.2025.02.04.00.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 00:58:38 -0800 (PST)
Message-ID: <37e94776-ea74-4fb7-ae50-ab999324df7f@ursulin.net>
Date: Tue, 4 Feb 2025 08:58:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Cleanup error handling on probe
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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


On 31/01/2025 22:31, Lucas De Marchi wrote:
> Mixing style with goto and devm_add_action_or_reset() is very confusing
> and error prone. Clean that up. The only missing one is one of the
> display calls, but that can be done in parallel to the review of these
> first patches.
> 
> This received limited load/unload tests on LNL and may very well not be
> 100%.

Is this series hinting you are looking into making heavier refactorings 
in the init code? Triggered by me recently discovering GT-per-engine 
workarounds are not working?

Regards,

Tvrtko

> Lucas De Marchi (7):
>    drm/xe: Fix xe_display_fini() calls
>    drm/xe: Fix error handling in xe_irq_install()
>    drm/xe: Fix xe_tile_init_noalloc() error propagation
>    drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
>    drm/xe: Cleanup unwind of gt initialization
>    drm/xe: Cleanup extra calls to  xe_hw_fence_irq_finish()
>    drm/xe: Move oa fini to xe_oa
> 
>   drivers/gpu/drm/xe/display/xe_display.c | 22 +++++-----
>   drivers/gpu/drm/xe/display/xe_display.h |  2 -
>   drivers/gpu/drm/xe/xe_device.c          | 53 ++++++++-----------------
>   drivers/gpu/drm/xe/xe_gt.c              | 52 ++++++++++--------------
>   drivers/gpu/drm/xe/xe_gt.h              |  1 -
>   drivers/gpu/drm/xe/xe_irq.c             | 14 +------
>   drivers/gpu/drm/xe/xe_oa.c              | 48 +++++++++++-----------
>   drivers/gpu/drm/xe/xe_oa.h              |  1 -
>   drivers/gpu/drm/xe/xe_tile.c            |  4 +-
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c  | 17 ++++----
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h  |  2 +-
>   11 files changed, 86 insertions(+), 130 deletions(-)
> 
