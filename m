Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44461C30624
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 14:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1048A10E4B7;
	Thu, 17 Aug 2023 14:38:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE02210E4B7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692283099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IU2tly2AhtdFtbxtaCxJNcdKsYvG8JAXPFPJT3GasHg=;
 b=OMhWL3vL+Hzkr71UIKbJDioGhJR5XQEPgSbQKM+0uahbewwt/OCP6pctjfkwuMHJYNRnMH
 slDUgDZMtoRwEKOeRlPAYpUxtV5iwVmswS60Ki06AkCj+fe378Ph79zN7rm/pwaw7U6Jeg
 V/w3Q+/HQ8OcvqbQKwjkNDRPEXCw2k8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-YsmaMpAQMJKU-0RfpIqSgQ-1; Thu, 17 Aug 2023 10:38:17 -0400
X-MC-Unique: YsmaMpAQMJKU-0RfpIqSgQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-99beea69484so444768266b.0
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 07:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692283096; x=1692887896;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IU2tly2AhtdFtbxtaCxJNcdKsYvG8JAXPFPJT3GasHg=;
 b=hRMqBtlPykZS4w7diMD0tY90wAc3YeONWzWO7DFxrvWFSwQ8bmwRdIFffNVKa3g2p9
 5AkraGluNtS6Mpuz3qsYMydi1w43aP4j2vrhVDGAu3IpX9UrB8aUYDm3dRGPmUZn30VF
 IbwGk4+mYojTmp+rO/8U44Q86cmyZyeC/pT+M9resvtlEh4FzbSYdkYKGJ483byBYNaA
 MjG3UvJRPFJnMYXQEFs5FPHKB0Nbabd9m8cULRdqAEeAVKzUceuMQz99nKybizQIZ/Kk
 T2HnyEQvRvkKdMZ7F7Rp32empO2K0mmUlCMRJOxyFL4Aer5tnLN75WR5cbwRrl24wvb+
 47QA==
X-Gm-Message-State: AOJu0YwMEWEsH+E7L/PhZph+DhX99zk6GAVzhEyfD7OmPNsywDN7mX3J
 GN0LzabjLtw8VXAYzj/34DjZJ0ZhAVtChtMs/4pJnq0qbRIOVBu1oDpW7GJxa5KHVBq577kEOgm
 35A9H8d+tStm9dUCd+7QsBu3OZ/k=
X-Received: by 2002:a17:906:2112:b0:993:d7fe:7f1d with SMTP id
 18-20020a170906211200b00993d7fe7f1dmr3900017ejt.28.1692283096249; 
 Thu, 17 Aug 2023 07:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+F5+H0WBzKpmCycE5M9iD9rlXxyLNJ0FNlmJHuWqXoqxBweptuKKx/57ngEDeKO3xkkDsgw==
X-Received: by 2002:a17:906:2112:b0:993:d7fe:7f1d with SMTP id
 18-20020a170906211200b00993d7fe7f1dmr3899999ejt.28.1692283095934; 
 Thu, 17 Aug 2023 07:38:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1709060e9700b00977eec7b7e8sm10165987ejf.68.2023.08.17.07.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 07:38:15 -0700 (PDT)
Message-ID: <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
Date: Thu, 17 Aug 2023 14:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 8/17/23 15:35, Christian König wrote:
> Am 17.08.23 um 13:13 schrieb Danilo Krummrich:
>> On 8/17/23 07:33, Christian König wrote:
>>> [SNIP]
>>> The hardware seems to work mostly the same for all vendors, but you 
>>> somehow seem to think that filling the ring is somehow beneficial 
>>> which is really not the case as far as I can see.
>>
>> I think that's a misunderstanding. I'm not trying to say that it is 
>> *always* beneficial to fill up the ring as much as possible. But I 
>> think it is under certain circumstances, exactly those circumstances I 
>> described for Nouveau.
> 
> As far as I can see this is not correct for Nouveau either.
> 
>>
>> As mentioned, in Nouveau the size of a job is only really limited by 
>> the ring size, which means that one job can (but does not necessarily) 
>> fill up the whole ring. We both agree that this is inefficient, 
>> because it potentially results into the HW run dry due to 
>> hw_submission_limit == 1.
>>
>> I recognize you said that one should define hw_submission_limit and 
>> adjust the other parts of the equation accordingly, the options I see 
>> are:
>>
>> (1) Increase the ring size while keeping the maximum job size.
>> (2) Decrease the maximum job size while keeping the ring size.
>> (3) Let the scheduler track the actual job size rather than the 
>> maximum job size.
>>
>> (1) results into potentially wasted ring memory, because we're not 
>> always reaching the maximum job size, but the scheduler assumes so.
>>
>> (2) results into more IOCTLs from userspace for the same amount of IBs 
>> and more jobs result into more memory allocations and more work being 
>> submitted to the workqueue (with Matt's patches).
>>
>> (3) doesn't seem to have any of those draw backs.
>>
>> What would be your take on that?
>>
>> Actually, if none of the other drivers is interested into a more 
>> precise way of keeping track of the ring utilization, I'd be totally 
>> fine to do it in a driver specific way. However, unfortunately I don't 
>> see how this would be possible.
>>
>> My proposal would be to just keep the hw_submission_limit (maybe 
>> rename it to submission_unit_limit) and add a submission_units field 
>> to struct drm_sched_job. By default a jobs submission_units field 
>> would be 0 and the scheduler would behave the exact same way as it 
>> does now.
>>
>> Accordingly, jobs with submission_units > 1 would contribute more than 
>> one unit to the submission_unit_limit.
>>
>> What do you think about that?
> 
> I think you are approaching this from the completely wrong side.

First of all, thanks for keeping up the discussion - I appreciate it. 
Some more comments / questions below.

> 
> See the UAPI needs to be stable, so you need a maximum job size 
> otherwise it can happen that a combination of large and small 
> submissions work while a different combination doesn't.

How is this related to the uAPI being stable? What do you mean by 
'stable' in this context?

The Nouveau uAPI allows userspace to pass EXEC jobs by supplying the 
ring ID (channel), in-/out-syncs and a certain amount of indirect push 
buffers. The amount of IBs per job is limited by the amount of IBs 
fitting into the ring. Just to be clear, when I say 'job size' I mean 
the amount of IBs per job.

Maybe I should also mention that the rings we are talking about are 
software rings managed by a firmware scheduler. We can have an arbitrary 
amount of software rings and even multiple ones per FD.

Given a constant ring size I really don't see why I should limit the 
maximum amount of IBs userspace can push per job just to end up with a 
hw_submission_limit > 1.

For example, let's just assume the ring can take 128 IBs, why would I 
limit userspace to submit just e.g. 16 IBs at a time, such that the 
hw_submission_limit becomes 8?

What is the advantage of doing that, rather than letting userspace 
submit *up to* 128 IBs per job and just letting the scheduler push IBs 
to the ring as long as there's actually space left on the ring?

> 
> So what you usually do, and this is driver independent because simply a 
> requirement of the UAPI, is that you say here that's my maximum job size 
> as well as the number of submission which should be pushed to the hw at 
> the same time. And then get the resulting ring size by the product of 
> the two.

Given the above, how is that a requirement of the uAPI?

> 
> That the ring in this use case can't be fully utilized is not a draw 
> back, this is completely intentional design which should apply to all 
> drivers independent of the vendor.

Why wouldn't we want to fully utilize the ring size?

- Danilo

> 
>>
>> Besides all that, you said that filling up the ring just enough to not 
>> let the HW run dry rather than filling it up entirely is desirable. 
>> Why do you think so? I tend to think that in most cases it shouldn't 
>> make difference.
> 
> That results in better scheduling behavior. It's mostly beneficial if 
> you don't have a hw scheduler, but as far as I can see there is no need 
> to pump everything to the hw as fast as possible.
> 
> Regards,
> Christian.
> 
>>
>> - Danilo
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> Because one really is the minimum if you want to do work at all, but 
>>>> as you mentioned above a job limit of one can let the ring run dry.
>>>>
>>>> In the end my proposal comes down to tracking the actual size of a 
>>>> job rather than just assuming a pre-defined maximum job size, and 
>>>> hence a dynamic job limit.
>>>>
>>>> I don't think this would hurt the scheduler granularity. In fact, it 
>>>> should even contribute to the desire of not letting the ring run dry 
>>>> even better. Especially for sequences of small jobs, where the 
>>>> current implementation might wrongly assume the ring is already full 
>>>> although actually there would still be enough space left.
>>>>
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Otherwise your scheduler might just overwrite the ring buffer by 
>>>>>>> pushing things to fast.
>>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>> Given that, it seems like it would be better to let the 
>>>>>>>> scheduler keep track of empty ring "slots" instead, such that 
>>>>>>>> the scheduler can deceide whether a subsequent job will still 
>>>>>>>> fit on the ring and if not re-evaluate once a previous job 
>>>>>>>> finished. Of course each submitted job would be required to 
>>>>>>>> carry the number of slots it requires on the ring.
>>>>>>>>
>>>>>>>> What to you think of implementing this as alternative flow 
>>>>>>>> control mechanism? Implementation wise this could be a union 
>>>>>>>> with the existing hw_submission_limit.
>>>>>>>>
>>>>>>>> - Danilo
>>>>>>>>
>>>>>>>>>
>>>>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>>>>> kthread for submission / job cleanup. This doesn't scale if a 
>>>>>>>>> large
>>>>>>>>> number of drm_gpu_scheduler are used. To work around the 
>>>>>>>>> scaling issue,
>>>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>>    - (Rob Clark) Fix msm build
>>>>>>>>>    - Pass in run work queue
>>>>>>>>> v3:
>>>>>>>>>    - (Boris) don't have loop in worker
>>>>>>>>> v4:
>>>>>>>>>    - (Tvrtko) break out submit ready, stop, start helpers into 
>>>>>>>>> own patch
>>>>>>>>>
>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

