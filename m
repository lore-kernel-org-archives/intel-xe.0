Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E0CCAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 11:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD74010E450;
	Mon, 15 Sep 2025 11:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sArvI+MH";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE3810E450
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 11:12:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so28946745e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757934724; x=1758539524; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=badnNnqIsXkPn2EvMp9u+z86UbkTv8uQkG/3+BUdjvA=;
 b=sArvI+MHa1odOCK3xYGhKkOSve6zEIj6zENyUH3IM6L2eAmfULBzWg6Vi0pHaedn3p
 AQhIrzQl7PuCUIvOdEf/xAQzE1I9T5xbYwsMPCX/jPfNwpeyeJ2aSY1W6zxul5szTL99
 cbrALNzWvxzvtt9fun5HXjc7EreHPwMEqgl1M19kQbG5TkX3yX2srq5lT9W7fcCWYf4n
 gjNLls1udTNANEZ9UWgZUjsQkV1kiXtAw8cqhk3k7UfJo2SJPqUxdX42MFcAho8HwdtK
 +gN/is7q6VvVJhH3YKZp3JUMSeXNfCojbAJYrSeceUvKjJVQsaNVBo0Q/1LeSs/TXIA+
 m1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757934724; x=1758539524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=badnNnqIsXkPn2EvMp9u+z86UbkTv8uQkG/3+BUdjvA=;
 b=ZhaMEPi3iu/0Rmno3No4VmAdtDnGI4nNztUHYN3f8kGVtsTJz9bWsExKAx75VtCGJq
 VtR9gMliby7UYggFxMbN0x64zYIFQPC9kcwGoVhbCxHoDTAHq2nldlH0K+veuA6AbsMM
 Itb0oa9CASksZKdE1fs3WWLoPej+AYvAgOALkx6I1P0cUOCm7j04Zdr7IqrTr8IECfOG
 fjI5RnPCNuQcz/m747NDnkw1o+fe3GOBb6MFDzB8XKCNkxK08XSyGUhn1Ng9w9Rt8boB
 BBU481rKqwWCEVgW1zyUBytPr4rgFE5Q6aD+YYxbQ4J7KpY1QjmFz7v1IWUSWzFQ2A3r
 ytKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUufO1t4FFL+AL8cqR0U8SuF9pmGIr18LSzYjss0EstiTkdK0WCZQP+Tkz56e0YG6gsr0cKKDkcAA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBlbYJHoqPYXMjk/AHRojw2Fy9rjX42/c6j2FQ6kj4Kr/prmzd
 PyaPEaxBogR1MqD6lNIqHLpJmk4r9Y/wNO7OP39TaPDizNxK2IiE8snwUtCqWp8rHQ8=
X-Gm-Gg: ASbGncuozDnxkZ+6fUWiZnYw5sbMkww5glDb7XEA41bJw/oFsB8f28tHEL3U/Re9FL2
 qmo31wLFcafggOFAfDSqMXkalswSwWlh52Bs7QCMSvS08a0IO2qHjI7b5+ThiFwZGXz79XcfHGz
 LQ67hTh+U5W+AouzETQ8KObLgTjnmNaBR9wyoyC+ro7TtSSoO/J4YyVz/BupY4TxvHDeaiqdqRi
 +tacepnMiRYyUJny89dVHAEWh9+GZHa6Xs56VAqsR7lf730Y0kqC64Cj9RyNHn2SPMHskpGv53a
 ARqMZMzUzUaxStzI/bHu9+S6xv5f3SP4kGpc+5JGY2XPgLNRFIEYxQMvCR2rQbYw44shjvoGxuG
 5dbuU0jsio9h6IN8JfGuJwF7ZKL5rHpnac0IPsQ==
X-Google-Smtp-Source: AGHT+IGm63UEHY4s1jwbRi4GCTY1XYfJ6+b0wYpsutPmJZyaFuGMrawbriAbxQunREyvB8TmP6296Q==
X-Received: by 2002:a05:600c:1c0e:b0:45f:2870:222e with SMTP id
 5b1f17b1804b1-45f2a023010mr42132565e9.26.1757934724348; 
 Mon, 15 Sep 2025 04:12:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45e037d62besm171722925e9.21.2025.09.15.04.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 04:12:03 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:12:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/xe: Fix a NULL vs IS_ERR() in
 xe_vm_add_compute_exec_queue()
Message-ID: <aMf0gA6Zyj3PpgZn@stanley.mountain>
References: <aJTMBdX97cof_009@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJTMBdX97cof_009@stanley.mountain>
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

Ping?

regards,
dan carpenter

On Thu, Aug 07, 2025 at 06:53:41PM +0300, Dan Carpenter wrote:
> The xe_preempt_fence_create() function returns error pointers.  It
> never returns NULL.  Update the error checking to match.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..5c58c6d99dce 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -240,8 +240,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  
>  	pfence = xe_preempt_fence_create(q, q->lr.context,
>  					 ++q->lr.seqno);
> -	if (!pfence) {
> -		err = -ENOMEM;
> +	if (IS_ERR(pfence)) {
> +		err = PTR_ERR(pfence);
>  		goto out_fini;
>  	}
>  
> -- 
> 2.47.2
