Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE6BC3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 00:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28B410E106;
	Thu, 24 Aug 2023 00:09:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B42910E106
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 00:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692835745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9YTLgom4LLXkDbipBsYHevhLp8X2PuC5uyFIQGQUY8=;
 b=XNBniFADOetvYpm7aanowSyHA2mXcwy8oouBXGhFpAQi+c0EURdpOKBYTlRH1peOpksZq9
 RNDM0PrXX9NSoZzcY79WnZysLyceF1/qoaAikHNzJzxkRUF8RCZOqkoR0LJDgaTGJTE+1r
 916wBD879gYkjboABUIC8ak9KoUs7gw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-SeQ3dXKoOGyoqOgWN5hVgw-1; Wed, 23 Aug 2023 20:09:03 -0400
X-MC-Unique: SeQ3dXKoOGyoqOgWN5hVgw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-99c0bd2ca23so430888466b.2
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 17:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692835742; x=1693440542;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9YTLgom4LLXkDbipBsYHevhLp8X2PuC5uyFIQGQUY8=;
 b=eXYXoCGwD20PKy+bi8K2IaXf3vuH6TOXpCfzMnj7LyN4KJ2cS3WMdbBluOoWYIJjki
 rIRyGObQmIC3ZH+eqeciL+iRlKZkV/FrUz6VAPoTSfyCgZc/45hb4dSJzMuIhOsIe+KA
 T+FY1i0WytwABxI5y1Nqpcx9qUG7FYth9c3MWriha6czXDW6vRTYFGXV9dJ2TR7FQQx9
 IBUFoEohD1Uq8r5QM2vg7e5X6eb//Rfesjhec4OYCrRwZVu0vp+b9uR14dd4JknUCE94
 LR8bx5kBjKaLqFQqnPiLJqNTo5m+lzOHN8fNRjcuTu4zWxcvOpEr/bmxA62KvgISClvA
 VTAA==
X-Gm-Message-State: AOJu0YxVUkxipOM/iycTZciSMZBaOzf05JbRDaNcZOWKbHvo50iDwZzD
 wru9Vw6WKWNVpl00pSh5jk734AgvWt0f4O+E8DebKSkzMJdl/MC1J/yfX3AEuAP0EsafTj4we2e
 oGN4hGV2ZlIDmPc2Yx0BNiMQZRR0=
X-Received: by 2002:a17:906:150:b0:9a1:d79a:418e with SMTP id
 16-20020a170906015000b009a1d79a418emr2539332ejh.40.1692835742238; 
 Wed, 23 Aug 2023 17:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsSyEdQ5ocz51eEwfpOfkEQGYm/87Y7r3ybAiFHh/d9QBfxgKPJ7p5w9hqFsyhIfHUsDMc6Q==
X-Received: by 2002:a17:906:150:b0:9a1:d79a:418e with SMTP id
 16-20020a170906015000b009a1d79a418emr2539316ejh.40.1692835741947; 
 Wed, 23 Aug 2023 17:09:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a17090614d600b009a1c05bd672sm2741765ejc.127.2023.08.23.17.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 17:09:01 -0700 (PDT)
Message-ID: <748c267c-1ede-876a-1cac-c864fb37e3dc@redhat.com>
Date: Thu, 24 Aug 2023 02:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230811023137.659037-1-matthew.brost@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 0/9] DRM scheduler changes for Xe
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 lina@asahilina.net, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matt,

On 8/11/23 04:31, Matthew Brost wrote:
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first.
> 
> This a continuation of a RFC [3] with all comments addressed, ready for
> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of the
> RFC [3].
> 
> These changes have been tested with the Xe driver.

Do you keep a branch with these patches somewhere?

- Danilo

> 
> v2:
>   - Break run job, free job, and process message in own work items
>   - This might break other drivers as run job and free job now can run in
>     parallel, can fix up if needed
> 
> Matt
> 
> Matthew Brost (9):
>    drm/sched: Convert drm scheduler to use a work queue  rather than
>      kthread
>    drm/sched: Move schedule policy to scheduler / entity
>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>    drm/sched: Split free_job into own work item
>    drm/sched: Add generic scheduler message interface
>    drm/sched: Add drm_sched_start_timeout_unlocked helper
>    drm/sched: Start run wq before TDR in drm_sched_start
>    drm/sched: Submit job before starting TDR
>    drm/sched: Add helper to set TDR timeout
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   5 +-
>   drivers/gpu/drm/lima/lima_sched.c          |   5 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c       |   5 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c    |   5 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c    |   5 +-
>   drivers/gpu/drm/scheduler/sched_entity.c   |  85 ++++-
>   drivers/gpu/drm/scheduler/sched_fence.c    |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c     | 408 ++++++++++++++++-----
>   drivers/gpu/drm/v3d/v3d_sched.c            |  25 +-
>   include/drm/gpu_scheduler.h                |  75 +++-
>   11 files changed, 487 insertions(+), 136 deletions(-)
> 

