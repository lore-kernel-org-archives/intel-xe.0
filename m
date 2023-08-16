Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746C6C04A6A
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 13:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1927710E36C;
	Wed, 16 Aug 2023 13:29:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0853310E36D
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692192560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zzWey38HM2kl2tP6Yo35O0O7svAYPRwrWuIqvfpikk=;
 b=X43PkHzMUG+rULZ3nqUmYeiID42FLtLKgqV3tvdmWJEkJ7ChYgeTpg0twIxEqldYt11lfa
 DvBdMzMZ78zRtyvn9Oa79QyyYCQLVKcN8uvEFEpdQmhh/1Wq19qJZiSnZ9hzvlr+GYvJbg
 P/F/Sg58GCnPhSeJ0/0CQL3dse34Iv4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-ukmWcPJkPMiSdDAgd6Y_CQ-1; Wed, 16 Aug 2023 09:29:17 -0400
X-MC-Unique: ukmWcPJkPMiSdDAgd6Y_CQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-523d73637e2so3012462a12.2
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 06:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692192555; x=1692797355;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0zzWey38HM2kl2tP6Yo35O0O7svAYPRwrWuIqvfpikk=;
 b=GD3FLLrVbchkS6zZjT1J5HHgoxw8igpuW0s1fohBkoZnS/RPGztox2AG9tRW6g0JhY
 G7VbMSCoTY//HKatfxRSEaGGWD3m8KGYwuw0Qq0ToGtYjcIpqcgdLzgWndIGerzDcec4
 /uOpYeciZAjuHJCjDXnjpNUPUSN3Ijh2GfudFBApy86TwR6IlKgu9ZvVIuzYYiLPdyCo
 OYWM+SDj529FH05SDG4bbe+/Os/kEa4KSBHg8eseljzEWe5JvyETi85MDi/a9UfSqe+T
 pLrS/NxI7Xnp7YPWF/tlIegxIec8mOY4JMQWd7YUsVpm2uYZw2LwfH/QFELc8sXyMLD1
 EsmA==
X-Gm-Message-State: AOJu0YwsgXlVGp3YZWxcWkAX6NyTZGp4RONkQo0NPipmOVSSZSlNLcX6
 uTvYBi+sptlQjN3SfMX6EUnOzpda6/TvNLczslqbfJkVOFdx5anh2FiDN9T8AsAt/6gpD5BZ58N
 ACduWd9vNSrIsbSB+4NqgibGp4nXu3RMAS2s=
X-Received: by 2002:a17:906:118b:b0:99d:f0e8:5623 with SMTP id
 n11-20020a170906118b00b0099df0e85623mr1477943eja.54.1692192555666; 
 Wed, 16 Aug 2023 06:29:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7BO553Uv2K2M6GZIjOmPRpCfK/eILJ+o7OHtWwUS+06gCkH7BYmuFP151ju9neAoHrQ836A==
X-Received: by 2002:a17:906:118b:b0:99d:f0e8:5623 with SMTP id
 n11-20020a170906118b00b0099df0e85623mr1477921eja.54.1692192555305; 
 Wed, 16 Aug 2023 06:29:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 gx20-20020a170906f1d400b0099cbe71f3b5sm8452748ejb.0.2023.08.16.06.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 06:29:14 -0700 (PDT)
Message-ID: <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
Date: Wed, 16 Aug 2023 13:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230811023137.659037-2-matthew.brost@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 1/9] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
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
> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> seems a bit odd but let us explain the reasoning below.
> 
> 1. In XE the submission order from multiple drm_sched_entity is not
> guaranteed to be the same completion even if targeting the same hardware
> engine. This is because in XE we have a firmware scheduler, the GuC,
> which allowed to reorder, timeslice, and preempt submissions. If a using
> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> apart as the TDR expects submission order == completion order. Using a
> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> 
> 2. In XE submissions are done via programming a ring buffer (circular
> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> control on the ring for free.

In XE, where does the limitation of MAX_SIZE_PER_JOB come from?

In Nouveau we currently do have such a limitation as well, but it is 
derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would 
always be 1. However, I think most jobs won't actually utilize the whole 
ring.

Given that, it seems like it would be better to let the scheduler keep 
track of empty ring "slots" instead, such that the scheduler can deceide 
whether a subsequent job will still fit on the ring and if not 
re-evaluate once a previous job finished. Of course each submitted job 
would be required to carry the number of slots it requires on the ring.

What to you think of implementing this as alternative flow control 
mechanism? Implementation wise this could be a union with the existing 
hw_submission_limit.

- Danilo

> 
> A problem with this design is currently a drm_gpu_scheduler uses a
> kthread for submission / job cleanup. This doesn't scale if a large
> number of drm_gpu_scheduler are used. To work around the scaling issue,
> use a worker rather than kthread for submission / job cleanup.
> 
> v2:
>    - (Rob Clark) Fix msm build
>    - Pass in run work queue
> v3:
>    - (Boris) don't have loop in worker
> v4:
>    - (Tvrtko) break out submit ready, stop, start helpers into own patch
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

