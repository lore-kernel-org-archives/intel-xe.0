Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65326C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 17:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204F810E08F;
	Tue,  7 Nov 2023 17:54:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A93310E08F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699379631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGpL9NuEv6Ciw+zA4Ck7tukYdeQ54xRJGOuRiC3a+2o=;
 b=X9nem9qr18rgQB+NWelIAyU6qmUikFYhGxJtcr2SRYCIpW671oPYhjOhBsQ9hm5Vjsuxid
 /EJqf2cMiwry4J3x9+EaI9aYeEYzGZTjObEgkp9Blb9AXG68eKdu18HyTYIzKDK2EBIYAH
 iRp3cPBc1cJFqpAboNbZUdPSnkzMYIo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-4I6LgOKaPOKdoGKw-01ccA-1; Tue, 07 Nov 2023 12:53:48 -0500
X-MC-Unique: 4I6LgOKaPOKdoGKw-01ccA-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-54373788269so4466941a12.2
 for <intel-xe@lists.freedesktop.org>; Tue, 07 Nov 2023 09:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699379627; x=1699984427;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jGpL9NuEv6Ciw+zA4Ck7tukYdeQ54xRJGOuRiC3a+2o=;
 b=W7yrmWtgg80QOgFweY/Q54+3IElonKdF8ZsWoID5+YAnWoZqWRTHYYtcU0tB0Rhchz
 SwiSLZ64X+ygh+KwO9yBFmah/fpCsVCI3T7kVsPt6B+NcxAJPNSZ1DbdH+LRFKhqfW3n
 3XUPP5DmYlXlJ3BSP4n04s4/i9i9ZPn2ZCs1L6JOlX+a5Oy1EpBCOdlSermfQpDFyxCH
 SIwzDbF3+DwkUKzkqaquUK6kf9Ll6dmFRCc6Wpxb5ZW3IGpf9aCHlDrof1hpDZC/SelE
 OOQHYs9SKrPcHGMksIdKM0GBWOs7Q0dvVLSAooAWfQk+2kFdIcIbiXB31v0naojmyPWo
 wt7g==
X-Gm-Message-State: AOJu0YwYDRMVSxYT/vdMHrnboThYx0Rnzlz+L6CnD6RXWP3T2PT9cRRm
 W1Glrt/TQ7Y1l4MiE3kHz2cmMynYVUuCAL59+tGQIerSdBF5ccIFADN6xZru6j8Mrq5FDz2irA3
 pKFEIe+9CIiuTpCd55wxoNLobIx4=
X-Received: by 2002:a17:906:730c:b0:9be:3c7e:7f38 with SMTP id
 di12-20020a170906730c00b009be3c7e7f38mr17886904ejc.10.1699379626848; 
 Tue, 07 Nov 2023 09:53:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuR3jCJ3lqgCr0hx0UTTJXLmRrXvqpbTQxvwLhIwrrbH950/Y9hi2jZCX17YLb2W57B0mmNA==
X-Received: by 2002:a17:906:730c:b0:9be:3c7e:7f38 with SMTP id
 di12-20020a170906730c00b009be3c7e7f38mr17886889ejc.10.1699379626497; 
 Tue, 07 Nov 2023 09:53:46 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a170906410b00b00992f2befcbcsm1280911ejk.180.2023.11.07.09.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 09:53:46 -0800 (PST)
Message-ID: <08dd5af8-a631-49d4-b0bd-13500d55198b@redhat.com>
Date: Tue, 7 Nov 2023 18:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luben Tuikov <ltuikov89@gmail.com>, tvrtko.ursulin@linux.intel.com
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231107041020.10035-2-ltuikov89@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/sched: Don't disturb the entity when in
 RR-mode scheduling
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ltuikov@yahoo.com,
 ketil.johnsen@arm.com, lina@asahilina.net, mcanal@igalia.com,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/7/23 05:10, Luben Tuikov wrote:
> Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
> rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
> it do just that, schedule the work item for execution.
> 
> The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
> to determine if the scheduler has an entity ready in one of its run-queues,
> and in the case of the Round-Robin (RR) scheduling, the function
> drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
> which is ready, sets up the run-queue and completion and returns that
> entity. The FIFO scheduling algorithm is unaffected.
> 
> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
> in the case of RR scheduling, that would result in drm_sched_select_entity()
> having been called twice, which may result in skipping a ready entity if more
> than one entity is ready. This commit fixes this by eliminating the call to
> drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
> in drm_sched_run_job_work().
> 
> v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
>      Add fixes-tag. (Tvrtko)
> 
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
>   1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 27843e37d9b769..cd0dc3f81d05f0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   }
>   
>   /**
> - * __drm_sched_run_job_queue - enqueue run-job work
> + * drm_sched_run_job_queue - enqueue run-job work
>    * @sched: scheduler instance
>    */
> -static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>   {
>   	if (!READ_ONCE(sched->pause_submit))
>   		queue_work(sched->submit_wq, &sched->work_run_job);
> @@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>   void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>   {
>   	if (drm_sched_can_queue(sched))
> -		__drm_sched_run_job_queue(sched);
> +		drm_sched_run_job_queue(sched);
>   }
>   
>   /**
> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   }
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
> -/**
> - * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> -{
> -	if (drm_sched_select_entity(sched))
> -		__drm_sched_run_job_queue(sched);
> -}
> -
>   /**
>    * drm_sched_free_job_work - worker to call free_job
>    *
> 
> base-commit: 27d9620e9a9a6bc27a646b464b85860d91e21af3

