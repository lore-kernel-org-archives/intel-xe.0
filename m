Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA07DC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 16:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A124D10E72F;
	Wed, 22 Jan 2025 16:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="D8rUKek6";
	dkim-atps=neutral
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000C810E72F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 16:24:58 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaef00ab172so1074425566b.3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1737563037; x=1738167837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k6yifiK7k1egD832rtDY2X5ShBnrSfrr32YKaeunTC8=;
 b=D8rUKek6/zmMn0UvE2170JJ/xZOA/wr8vX0OdfnEt3nWO+s70SMoSlJbaIvZw3X4Tg
 yjgucxFz0+1als4lgkbwQXkEbrFMKv2jziGiHAjWABBn4+8+GvRHdxsYQvcuYoeQPXg+
 Fk4Q3JIXnuHuaSdit2/OsdjGfhSQkLDH4wns6HgbeHWpVLjvp/NWszBmlLASW6zayqla
 URfZT1gXtUzx08kDKOfIruwNh0T168uTj+6jB9YNQMIT1HhoVJgGWbYkkcu/25qHhqkS
 1ODj7Y7SoNX+7t6FjUuOgngA2GxP5hc7jK48rTgcmhycxJIkcPJCaQEtpdCmJVwKSS2A
 k21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737563037; x=1738167837;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6yifiK7k1egD832rtDY2X5ShBnrSfrr32YKaeunTC8=;
 b=ArQEjfAdNLFetnZYZ/qmRBkqGELp/a0aPXNfCS5BKHA8lv5odJd0cbVojIc8MNeqnU
 YYYUVJBWfrPlAsBvqpN49ycm0s8C66av11h83Ojr4VPyabfpaetmxrFS/gtVPC42rIOr
 sLOM0/+lwy2jn9TMESRSCJeO4uFdNuE+f7cUBSTCOsZSlwwZqG0P/PJH3K7WwscXN3gP
 lOlrGSvBu3KF6skmxtSfEQHyJ5YLOlX4FwP9vCgyKPmNrJiWpFEZ2VACZ08lZARGl4f3
 6duXqWlOXpS1WfRBiqy4G0iNQTyjVJ3OQP3fOhvdbDyTyrTZbm8kjSLdQVO8+xuvV0ox
 555A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDfwcl+7FHP1Mh51FWNzFJsEieIYvsIF+oEv5zy4kQvHdFWC9Os+ah4pNmcKg2Pww/d8LqeO6NSA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCzQvh4ZD799o3OQj669g+Gq9UCPBuI8DxvQcu2QfX84iGQr5O
 BWQZGau+WLRrLxf4XZTrHcwP9NflbJJDD8pByijM/Sy1gmlYJmiXINWc7O4tQSK9+Y07z5dTP3N
 /x1lSKQ==
X-Gm-Gg: ASbGncsUWJEDcxwi95NT2Yk55Rjpzb3K0exBgswYJfx4YO4+GhMgCMZUQrfx3CdianD
 /uYglme32/blf9dvPF6y6KoyiJGi5YjDEPR4E1bi03uNzrcYObpN0lW2kShUvq5mEIF/iGNA3Gt
 LKjE6YJ90ttzkmnbQUbxAG32qqzXzjL5mV2QV3Q2xhybYMc52y4sNJu4e5bx9OH/91m7/ZwxtCW
 0GXmb5jhIR5u84UYZNAW01CnKBpz4L0y+q3CsishHKsxapZWZ0PHEWt6cPQkgCUiM5SG269NaU1
 yl8GT+/MKw==
X-Google-Smtp-Source: AGHT+IHjMS8YRSk6XzW0Efeh0A/XzjKRZHlKqwNXg3TUjzGuKVwVdcPgC6qrdd/tzzJ2CrO/z5EPcw==
X-Received: by 2002:a05:600c:4ecb:b0:434:ff45:cbbe with SMTP id
 5b1f17b1804b1-438913f5c63mr219797095e9.18.1737562501952; 
 Wed, 22 Jan 2025 08:15:01 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b1718741sm20115825e9.0.2025.01.22.08.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 08:15:01 -0800 (PST)
Message-ID: <ce6bd1f3-8d7c-4b3c-af07-b8c9e0912f51@ursulin.net>
Date: Wed, 22 Jan 2025 16:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122165104.536c4143@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250122165104.536c4143@collabora.com>
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


On 22/01/2025 15:51, Boris Brezillon wrote:
> On Wed, 22 Jan 2025 15:08:20 +0100
> Philipp Stanner <phasta@kernel.org> wrote:
> 
>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>> @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group *group,
>>   		   const struct drm_panthor_queue_create *args)
>>   {
>>   	struct drm_gpu_scheduler *drm_sched;
>> +	struct drm_sched_init_params sched_params;
> 
> nit: Could we use a struct initializer instead of a
> memset(0)+field-assignment?
> 
> 	struct drm_sched_init_params sched_params = {
> 		.ops = &panthor_queue_sched_ops,
> 		.submit_wq = group->ptdev->scheduler->wq,
> 		.num_rqs = 1,
> 		.credit_limit = args->ringbuf_size / sizeof(u64),
> 		.hang_limit = 0,
> 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> 		.timeout_wq = group->ptdev->reset.wq,
> 		.name = "panthor-queue",
> 		.dev = group->ptdev->base.dev,
>          };

+1 on this as a general approach for the whole series. And I'd drop the 
explicit zeros and NULLs. Memsets could then go too.

Regards,

Tvrtko

> 
> The same comment applies the panfrost changes BTW.
> 
>>   	struct panthor_queue *queue;
>>   	int ret;
>>   
>> @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group *group,
>>   	if (!queue)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> +	memset(&sched_params, 0, sizeof(struct drm_sched_init_params));
>> +
>>   	queue->fence_ctx.id = dma_fence_context_alloc(1);
>>   	spin_lock_init(&queue->fence_ctx.lock);
>>   	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
>> @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group *group,
>>   	if (ret)
>>   		goto err_free_queue;
>>   
>> +	sched_params.ops = &panthor_queue_sched_ops;
>> +	sched_params.submit_wq = group->ptdev->scheduler->wq;
>> +	sched_params.num_rqs = 1;
>>   	/*
>> -	 * Credit limit argument tells us the total number of instructions
>> +	 * The credit limit argument tells us the total number of instructions
>>   	 * across all CS slots in the ringbuffer, with some jobs requiring
>>   	 * twice as many as others, depending on their profiling status.
>>   	 */
>> -	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>> -			     group->ptdev->scheduler->wq, 1,
>> -			     args->ringbuf_size / sizeof(u64),
>> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>> -			     group->ptdev->reset.wq,
>> -			     NULL, "panthor-queue", group->ptdev->base.dev);
>> +	sched_params.credit_limit = args->ringbuf_size / sizeof(u64);
>> +	sched_params.hang_limit = 0;
>> +	sched_params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
>> +	sched_params.timeout_wq = group->ptdev->reset.wq;
>> +	sched_params.score = NULL;
>> +	sched_params.name = "panthor-queue";
>> +	sched_params.dev = group->ptdev->base.dev;
>> +
>> +	ret = drm_sched_init(&queue->scheduler, &sched_params);
>>   	if (ret)
>>   		goto err_free_queue;
