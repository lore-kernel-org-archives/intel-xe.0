Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E64CA0EF1
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 16:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F1410E44B;
	Tue, 12 Sep 2023 16:58:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD3010E449
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694537909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6l3psP0a3JrGxX4VJ2tVGL7lchAEMOWA5OKPLfc9aWM=;
 b=UysWIHEnxKnVtiU5PQNdGU23inDyl5Z4WcSpY/OkBUgJUyJkHf6xUCg8TLt+vslxNCkoWV
 CJ4YjeITUwmiK5a12N1Z92vyodGXWjlr5EcaZApYZpyOj2N7FU/CMCb4yAwS3yrIcnMlaA
 JqRLEdjbQOPbPuKKe2kgr9WQ0hrFetg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-e3bfwZ2_Nu-0NdHcJiz_uw-1; Tue, 12 Sep 2023 12:58:27 -0400
X-MC-Unique: e3bfwZ2_Nu-0NdHcJiz_uw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9aa20a75780so190889166b.2
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 09:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694537906; x=1695142706;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6l3psP0a3JrGxX4VJ2tVGL7lchAEMOWA5OKPLfc9aWM=;
 b=g2OvBZgm7bXUiupIDK3z0A0e6b1LKZIqg1bImOD6drJI6SojokcyDDLmXP4g6V3Z/j
 TlYtpBk8lkTzygFhHr1ur+KDXZd0n4rmR3EALOWP2m+Ds6MAaFP1EnG9kAmHUhy6bxkN
 GNG5SaNh45MjsVAntBmyfB8azoYuNDatjxMv1azB+5tDm8ArTrOuL5HuvD32BZDDKX78
 nbgo2+i6h45GVA7UD7GdINe75+okzgaQnxPRU5F7EAYZd7Sw4ej2pFzBpODriR+J7xu/
 lkAx7gc9w28j360z4odTkU9ZUoFvO1GvO0IGRH9vVPOUh+vn1ocifnF/yoX8UIdSxnM8
 lcpg==
X-Gm-Message-State: AOJu0YwhOTWEl3Qs2a0/OO5bLcoqQmaiTHgD7URYHkZj8PEJbvSiGd3U
 /g2X/uZypJ/7DuiH/zdcYciHet4DKt7vN5u5TojZcxlUdH5Xn9z3JdSL9ybJXZN0fnVopef8zP2
 7yq6Wiq+t+ZsQcYix2NxzywifQGA=
X-Received: by 2002:a17:907:762d:b0:9a9:ef41:e5a6 with SMTP id
 jy13-20020a170907762d00b009a9ef41e5a6mr11276729ejc.1.1694537905839; 
 Tue, 12 Sep 2023 09:58:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEugoC09hYWM4xBodpAT7JabaypzjnG/AKJqPHhCySvjEJ7YdgscksqSwFGFxwzfn/ZNEXm+A==
X-Received: by 2002:a17:907:762d:b0:9a9:ef41:e5a6 with SMTP id
 jy13-20020a170907762d00b009a9ef41e5a6mr11276712ejc.1.1694537905438; 
 Tue, 12 Sep 2023 09:58:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 oz13-20020a170906cd0d00b0098951bb4dc3sm7093003ejb.184.2023.09.12.09.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 09:58:25 -0700 (PDT)
Message-ID: <f521753e-e072-048d-222f-8f77910205bc@redhat.com>
Date: Tue, 12 Sep 2023 18:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <20230912162838.34135959@collabora.com>
 <ef8f493b-212a-3a97-bb37-28d6fb2623a4@redhat.com>
 <20230912164909.018d13c8@collabora.com>
 <20230912171322.6c47a973@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230912171322.6c47a973@collabora.com>
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 9/12/23 17:13, Boris Brezillon wrote:
> On Tue, 12 Sep 2023 16:49:09 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Tue, 12 Sep 2023 16:33:01 +0200
>> Danilo Krummrich <dakr@redhat.com> wrote:
>>
>>> On 9/12/23 16:28, Boris Brezillon wrote:
>>>> On Thu, 17 Aug 2023 13:13:31 +0200
>>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>>      
>>>>> I think that's a misunderstanding. I'm not trying to say that it is
>>>>> *always* beneficial to fill up the ring as much as possible. But I think
>>>>> it is under certain circumstances, exactly those circumstances I
>>>>> described for Nouveau.
>>>>>
>>>>> As mentioned, in Nouveau the size of a job is only really limited by the
>>>>> ring size, which means that one job can (but does not necessarily) fill
>>>>> up the whole ring. We both agree that this is inefficient, because it
>>>>> potentially results into the HW run dry due to hw_submission_limit == 1.
>>>>>
>>>>> I recognize you said that one should define hw_submission_limit and
>>>>> adjust the other parts of the equation accordingly, the options I see are:
>>>>>
>>>>> (1) Increase the ring size while keeping the maximum job size.
>>>>> (2) Decrease the maximum job size while keeping the ring size.
>>>>> (3) Let the scheduler track the actual job size rather than the maximum
>>>>> job size.
>>>>>
>>>>> (1) results into potentially wasted ring memory, because we're not
>>>>> always reaching the maximum job size, but the scheduler assumes so.
>>>>>
>>>>> (2) results into more IOCTLs from userspace for the same amount of IBs
>>>>> and more jobs result into more memory allocations and more work being
>>>>> submitted to the workqueue (with Matt's patches).
>>>>>
>>>>> (3) doesn't seem to have any of those draw backs.
>>>>>
>>>>> What would be your take on that?
>>>>>
>>>>> Actually, if none of the other drivers is interested into a more precise
>>>>> way of keeping track of the ring utilization, I'd be totally fine to do
>>>>> it in a driver specific way. However, unfortunately I don't see how this
>>>>> would be possible.
>>>>
>>>> I'm not entirely sure, but I think PowerVR is pretty close to your
>>>> description: jobs size is dynamic size, and the ring buffer size is
>>>> picked by the driver at queue initialization time. What we did was to
>>>> set hw_submission_limit to an arbitrarily high value of 64k (we could
>>>> have used something like ringbuf_size/min_job_size instead), and then
>>>> have the control flow implemented with ->prepare_job() [1] (CCCB is the
>>>> PowerVR ring buffer). This allows us to maximize ring buffer utilization
>>>> while still allowing dynamic-size jobs.
>>>
>>> I guess this would work, but I think it would be better to bake this in,
>>> especially if more drivers do have this need. I already have an
>>> implementation [1] for doing that in the scheduler. My plan was to push
>>> that as soon as Matt sends out V3.
>>>
>>> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commit/269f05d6a2255384badff8b008b3c32d640d2d95
>>
>> PowerVR's ->can_fit_in_ringbuf() logic is a bit more involved in that
>> native fences waits are passed to the FW, and those add to the job size.
>> When we know our job is ready for execution (all non-native deps are
>> signaled), we evict already signaled native-deps (or native fences) to
>> shrink the job size further more, but that's something we need to
>> calculate late if we want the job size to be minimal. Of course, we can
>> always over-estimate the job size, but if we go for a full-blown
>> drm_sched integration, I wonder if it wouldn't be preferable to have a
>> ->get_job_size() callback returning the number of units needed by job,
>> and have the core pick 1 when the hook is not implemented.
> 
> FWIW, I think last time I asked how to do that, I've been pointed to
> ->prepare_job() by someone  (don't remember if it was Daniel or
> Christian), hence the PowerVR implementation. If that's still the
> preferred solution, there's some opportunity to have a generic layer to
> automate ringbuf utilization tracking and some helpers to prepare
> wait_for_ringbuf dma_fences that drivers could return from
> ->prepare_job() (those fences would then be signaled when the driver
> calls drm_ringbuf_job_done() and the next job waiting for ringbuf space
> now fits in the ringbuf).
> 

Not sure I like that, it's basically a different implementation to work
around limitations of an implementation that is supposed to cover this case
in general.

