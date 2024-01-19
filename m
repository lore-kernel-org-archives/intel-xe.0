Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBD7C47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 15:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1813E10E02E;
	Fri, 19 Jan 2024 15:04:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2801D10E079
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705676672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYcJVkXMjM/MA4K8BzwTfXlCDI5aN8CHClwcdTmEEbM=;
 b=JqeeOlMqv7DuIu/ehBohNWXgOXXmRIXO8iqQQfkks/okOOnEHvxcU6n6+J746COiUlPcqN
 XRUh8Q7I1ENLEToMnEFL1kO1tfAwLyRQ9R1kEPVedyMb+J68fcWAcDpzhCOp2tsqrZsvdi
 2QsGZNmtlTrlveb07MF/r+fMGYeOv5E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-fj7mmr0SOSSfKUJdrNTR_A-1; Fri, 19 Jan 2024 10:04:30 -0500
X-MC-Unique: fj7mmr0SOSSfKUJdrNTR_A-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-559391de41bso545143a12.3
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 07:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705676668; x=1706281468;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gYcJVkXMjM/MA4K8BzwTfXlCDI5aN8CHClwcdTmEEbM=;
 b=RKlJJcdGegnJzw7PdjHp2HWuZGxaqG1I9gjfAswylTdALjpzL5CepXchRDf2ID2Oci
 W+eJcQMrMf5D6oZUm74/PEJlYRy5DlUJF1S8Jo6WLDoHZvQTShYyJ+LeDO9FsYs8TpOf
 lkQi3pxs61Z/k4AyRkyQS/WO0+9y3gmQTeK9YovVJSPdYFqSTU/noY3SWM4sPeSbQhyE
 pSgD4FhmGrCrZaS3PJMWbbmquKSh4/MgYwhD4FHi/sYnBgL38OuZcBTmTw95Rfq3ud9H
 LTsBIh7ipslyj4RHG5CMI/ryhMDZRsjA23aBzMnS0/0sUbUME+1I6UF+z5sUgUpcj8I/
 PpGg==
X-Gm-Message-State: AOJu0YziBfAAH5xsZMqTDU7RBFcc4q4DDhS8tgrR7QZIDf/2BfcZlPYA
 69XVpumOZg7pZxdG//4TfiLAsZ4LdTgqs/vBljNhSUmKKOeQbBRxzxemXQu4HIt8pdE8/vUSu3M
 +yLuRKT7+xx4hGr3cQgK4jSOLV01xrMRuEtn/MgHeFJAIJp1ojJj18h1O5khqXo8M
X-Received: by 2002:a05:6402:2285:b0:55a:6124:1414 with SMTP id
 cw5-20020a056402228500b0055a61241414mr527303edb.48.1705676668678; 
 Fri, 19 Jan 2024 07:04:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHwXHrK0lNyVDzTiz+UqwaMdzLW1w1YYltKBlu/EoceZmaQFlRikGGVEe+RSfP2jDQXM4czA==
X-Received: by 2002:a05:6402:2285:b0:55a:6124:1414 with SMTP id
 cw5-20020a056402228500b0055a61241414mr527296edb.48.1705676668346; 
 Fri, 19 Jan 2024 07:04:28 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 da12-20020a056402176c00b00559f653b328sm2602400edb.22.2024.01.19.07.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 07:04:27 -0800 (PST)
Message-ID: <b285cf5f-10c9-42a1-81fd-dda3af743497@redhat.com>
Date: Fri, 19 Jan 2024 16:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exec, drm/gpuvm: Prefer u32 over uint32_t
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 1/19/24 10:05, Thomas Hellström wrote:
> The relatively recently introduced drm/exec utility was using uint32_t
> in its interface, which was then also carried over to drm/gpuvm.
> 
> Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/drm_exec.c | 2 +-
>   include/drm/drm_exec.h     | 4 ++--
>   include/drm/drm_gpuvm.h    | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 5d2809de4517..20e59d88218d 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -72,7 +72,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>    *
>    * Initialize the object and make sure that we can track locked objects.
>    */
> -void drm_exec_init(struct drm_exec *exec, uint32_t flags)
> +void drm_exec_init(struct drm_exec *exec, u32 flags)
>   {
>   	exec->flags = flags;
>   	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index b5bf0b6da791..187c3ec44606 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -18,7 +18,7 @@ struct drm_exec {
>   	/**
>   	 * @flags: Flags to control locking behavior
>   	 */
> -	uint32_t		flags;
> +	u32                     flags;
>   
>   	/**
>   	 * @ticket: WW ticket used for acquiring locks
> @@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>   	return !!exec->contended;
>   }
>   
> -void drm_exec_init(struct drm_exec *exec, uint32_t flags);
> +void drm_exec_init(struct drm_exec *exec, u32 flags);
>   void drm_exec_fini(struct drm_exec *exec);
>   bool drm_exec_cleanup(struct drm_exec *exec);
>   int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 48311e6d664c..554046321d24 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -514,7 +514,7 @@ struct drm_gpuvm_exec {
>   	/**
>   	 * @flags: the flags for the struct drm_exec
>   	 */
> -	uint32_t flags;
> +	u32 flags;
>   
>   	/**
>   	 * @vm: the &drm_gpuvm to lock its DMA reservations

