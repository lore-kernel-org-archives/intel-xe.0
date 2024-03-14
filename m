Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA90C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 19:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4501A10E795;
	Thu, 14 Mar 2024 19:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gdfwjA8r";
	dkim-atps=neutral
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCE310E795
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 19:16:58 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d46d729d89so18736241fa.3
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710443816; x=1711048616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CfnjAGOoHR8kq5tldR16DYh3m5vymO232ReFtJryyRg=;
 b=gdfwjA8rIdOYDPlGKxMgwm35dWya9lEYPmQE7sHpUA62VtGkXhdU2ZMwWT31cewFvB
 dSxaMdOAsFB3rh+BKPpG7pfzgGPohqwgMIBerGjfaWtfS8UjOE5q0YmMLWkZ5Mmypw85
 9pn2AeUDsWExu66D0Td4ekt12puD8DJA1oJP+gUyTZ7ASnCbN+V4aJwIWuZOzao9cWwK
 2Ff3+JG68zqWETMT6bKCkzaDrFC2iINKYxRGrDtIrD2nXIcZi6hNtX5XessRe3/5fYCF
 eqPX4AxoSbXNqKlWRQUH+FXMw9O2j7IwEjeT8mj8pnc8Drd+lhaMl0j2wGjElfqY8PF4
 l4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710443816; x=1711048616;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CfnjAGOoHR8kq5tldR16DYh3m5vymO232ReFtJryyRg=;
 b=pWXWw/XFPXayq2ooAJW4C7jUGafYwUhSaf4meQwQ8qnCZcvEeFfNA9BtL/T/RGTDf4
 uH+F3zwUH0fUdj4BSnh1hRl28hEvejnvfMSn79YgS16x31O0ksLP6dmUwhZV+byo7V5f
 d7MxE6dLqdTZ4ayBg1HkRVzSmEhV7iYTKQU6ioiYpHxdBCCombWRHatJYNo0V5nzY+U+
 bBer6+pEUIqkET0Eil0pb6K+c/mCg+E1U8MSxMsczNUjxLX6Ub0T/KI+vgGXW776nz0i
 i+4p3wlac1oD5f6K7BrJSBvJjSjL2MnnsdRZYLBgs8lC1FYj0cAHGlQR12eOFNTkWR6p
 vyng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPwLvNi3110hyr39yolVXPkQ0nlP/t1os0ZQ8iFGOFH97fsbfchnkbaBK/6lbCWU3sQIk4H/7wg+z0g2jsTcd0RidZQt4Q3hrkpGgr4yA=
X-Gm-Message-State: AOJu0YzrBChvL61EIRgbcbZoOr1DOKsgzCqrom7eifVLeO5haBO/6KEn
 JrB7GYKUG+totb7ogPI+UpvLH5UDcZ9AR1tAUBbOaC440kIfsHZU
X-Google-Smtp-Source: AGHT+IHdKKPqUzcX6Y+XCsg9LTK1nTpK6hDFoGZ8jOq5U9gGTgf0IwtaNNoVJpYjjAxNXJiYM9Jv8A==
X-Received: by 2002:a2e:361a:0:b0:2d4:6aba:f1a3 with SMTP id
 d26-20020a2e361a000000b002d46abaf1a3mr689535lja.6.1710443815986; 
 Thu, 14 Mar 2024 12:16:55 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.84])
 by smtp.googlemail.com with ESMTPSA id
 o1-20020aa7dd41000000b00568830944f9sm970237edw.19.2024.03.14.12.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 12:16:55 -0700 (PDT)
Message-ID: <230047f5-52b6-4271-a840-5cd1617d9514@gmail.com>
Date: Thu, 14 Mar 2024 21:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: mark DPT with XE_BO_PAGETABLE
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20240314164905.239449-2-matthew.auld@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240314164905.239449-2-matthew.auld@intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 14.3.2024 18.49, Matthew Auld wrote:
> Otherwise in the case where we use normal system memory, the CPU access
> will always be cached, like when filling the DPT PTEs, which is likely
> not what we want since HW access could be incoherent on platforms like
> LNL. Marking as XE_BO_PAGETABLE will force wc/uc underneath on such
> platforms.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 722c84a56607..b220f136be70 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -100,17 +100,20 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>   		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>   					   ttm_bo_type_kernel,
>   					   XE_BO_CREATE_VRAM0_BIT |
> -					   XE_BO_CREATE_GGTT_BIT);
> +					   XE_BO_CREATE_GGTT_BIT |
> +					   XE_BO_PAGETABLE);
>   	else
>   		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>   					   ttm_bo_type_kernel,
>   					   XE_BO_CREATE_STOLEN_BIT |
> -					   XE_BO_CREATE_GGTT_BIT);
> +					   XE_BO_CREATE_GGTT_BIT |
> +					   XE_BO_PAGETABLE);
>   	if (IS_ERR(dpt))
>   		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>   					   ttm_bo_type_kernel,
>   					   XE_BO_CREATE_SYSTEM_BIT |
> -					   XE_BO_CREATE_GGTT_BIT);
> +					   XE_BO_CREATE_GGTT_BIT |
> +					   XE_BO_PAGETABLE);
>   	if (IS_ERR(dpt))
>   		return PTR_ERR(dpt);
>   

