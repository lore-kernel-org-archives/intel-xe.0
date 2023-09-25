Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904CBCE79A5
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 21:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508D110E330;
	Mon, 25 Sep 2023 21:47:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A762910E32F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695678438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plYYRgspvMGEmVQw/x/6P2ks0Fpcn1eZQTQWNdgVczc=;
 b=Is4jtc5DBl9XOm0EGweNSvRfJBibqtgHWxyBFFScrTB986g7GZ+TdfRHhSPk7FLW+hQPg7
 oMzA8YGqeG/a9LJg4LfK66w9zkF3LCh0YAkGDWaSPPqXs3JfzjzdxxwhhA+DgZ8F1M7Pai
 19/KweDHQbESPOOoeyBorRty0KAIuVo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-1CoX0FN6MT-6P8Lkz-9Wsw-1; Mon, 25 Sep 2023 17:47:17 -0400
X-MC-Unique: 1CoX0FN6MT-6P8Lkz-9Wsw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-402cd372b8bso67978395e9.2
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 14:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695678436; x=1696283236;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=plYYRgspvMGEmVQw/x/6P2ks0Fpcn1eZQTQWNdgVczc=;
 b=YJ85ZwibsuxGXrQidjSJeux9Esa0YE0KnMaiWZuuDk/l6VEtcSX4ejb6D8HQN2eaO6
 MnVWl/J9j4AbtjqSYXiJju8E3KkX8NaegBfQkU7ILcQ4xBPDBLQ1RW+Y24rzj6MpmPr2
 rSctrX84HpnS2+/c5lIyGatf7b1peeZ6xo0KvY3/jYHEtombGHwRzmsjztKGBMibACSr
 N/vvlbcl7nzwFC0xKK7goy9lyFiK96lzV+/c7l/tHJyc2o8dAhepfmGjPsIWwBNGUuZd
 V+6WGwZcjxtVpMqU1KlDKAxs32E/HL88dCLJUQFFUQD7KGUJhyuytFDet/LbWMPbx8Nl
 kxhQ==
X-Gm-Message-State: AOJu0YwSefYbWtHU8VSX+hYcGORuSBB38ic0X2wubsjh/mKfD/9bOgq/
 WvCBXtZfpMIeOIjPIERTzQ02VfJmdv2SyZ0gKG3EBUqs0BHrIP97yjczM909ElG0ErHUpZ5zoiL
 Xvda7J9jsSqlKOyUjXE4b8rPqPDI=
X-Received: by 2002:a7b:c417:0:b0:405:3455:567e with SMTP id
 k23-20020a7bc417000000b004053455567emr7162144wmi.5.1695678436136; 
 Mon, 25 Sep 2023 14:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE92PYno9wFsw7ddsc7QMZpSlrJmQLHolDhdumgmMRcjJFUmU6pWJ8ePn2Rhb78s8GqBYUNWQ==
X-Received: by 2002:a7b:c417:0:b0:405:3455:567e with SMTP id
 k23-20020a7bc417000000b004053455567emr7162123wmi.5.1695678435815; 
 Mon, 25 Sep 2023 14:47:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c00d100b00405935b417asm3348599wmm.2.2023.09.25.14.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 14:47:15 -0700 (PDT)
Message-ID: <739f8ba2-82e1-2a1b-2b56-c7f54065030e@redhat.com>
Date: Mon, 25 Sep 2023 23:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Danilo Krummrich <dakr@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <7739a88e-28e9-27fb-8d2a-4f294fdfe672@redhat.com>
Organization: RedHat
In-Reply-To: <7739a88e-28e9-27fb-8d2a-4f294fdfe672@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 00/10] DRM scheduler changes for Xe
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
 frank.binns@imgtec.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 daniel@ffwll.ch, boris.brezillon@collabora.com, airlied@gmail.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 9/19/23 13:44, Danilo Krummrich wrote:
> Hi Matt,
> 
> On 9/19/23 07:01, Matthew Brost wrote:
>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>> have been asked to merge our common DRM scheduler patches first.
>>
>> This a continuation of a RFC [3] with all comments addressed, ready for
>> a full review, and hopefully in state which can merged in the near
>> future. More details of this series can found in the cover letter of the
>> RFC [3].
>>
>> These changes have been tested with the Xe driver.
>>
>> v2:
>>   - Break run job, free job, and process message in own work items
>>   - This might break other drivers as run job and free job now can run in
>>     parallel, can fix up if needed
>>
>> v3:
>>   - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
>>   - Fix issue with setting timestamp to early
>>   - Don't dequeue jobs for single entity after calling entity fini
>>   - Flush pending jobs on entity fini
>>   - Add documentation for entity teardown
>>   - Add Matthew Brost to maintainers of DRM scheduler
>>
>> v4:
>>   - Drop message interface
>>   - Drop 'Flush pending jobs on entity fini'
>>   - Drop 'Add documentation for entity teardown'
>>   - Address all feedback
> 
> There is some feedback from V3 that doesn't seem to be addressed yet.
> 
> (1) Document tear down of struct drm_gpu_scheduler. [1]
> (2) Implement helpers to tear down struct drm_gpu_scheduler. [2]
> (3) Document implications of using a workqueue in terms of free_job() being
>      or not being part of the fence signaling path respectively. [3]
> 
> I think at least (1) and (3) should be part of this series. I think (2) could
> also happen subsequently. Christian's idea [2] how to address this is quite
> interesting, but might exceed the scope of this series.
> 
> I will try to rebase my Nouveau changes onto your V4 tomorrow for a quick test.

Tested-by: Danilo Krummrich <dakr@redhat.com>

> 
> - Danilo
> 
> [1] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m2e8c1c1e68e8127d5dd62509b5e424a12217300b
> [2] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m16a0d6fa2e617383776515af45d3c6b9db543d47
> [3] https://lore.kernel.org/all/20230912021615.2086698-1-matthew.brost@intel.com/T/#m807ff95284089fdb51985f1c187666772314bd8a
> 
>>
>> Matt
>>
>> Matthew Brost (10):
>>    drm/sched: Add drm_sched_submit_* helpers
>>    drm/sched: Convert drm scheduler to use a work queue rather than
>>      kthread
>>    drm/sched: Move schedule policy to scheduler
>>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>>    drm/sched: Split free_job into own work item
>>    drm/sched: Add drm_sched_start_timeout_unlocked helper
>>    drm/sched: Start submission before TDR in drm_sched_start
>>    drm/sched: Submit job before starting TDR
>>    drm/sched: Add helper to queue TDR immediately for current and future
>>      jobs
>>    drm/sched: Update maintainers of GPU scheduler
>>
>>   MAINTAINERS                                   |   1 +
>>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
>>   drivers/gpu/drm/lima/lima_sched.c             |   5 +-
>>   drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>>   drivers/gpu/drm/msm/msm_ringbuffer.c          |   5 +-
>>   drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
>>   drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c      |  85 ++-
>>   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>>   drivers/gpu/drm/scheduler/sched_main.c        | 491 ++++++++++++------
>>   drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
>>   include/drm/gpu_scheduler.h                   |  48 +-
>>   15 files changed, 495 insertions(+), 220 deletions(-)
>>

