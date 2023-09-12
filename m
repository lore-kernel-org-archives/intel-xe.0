Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F70CA0EEF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 14:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69B410E41B;
	Tue, 12 Sep 2023 14:33:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F039810E41C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694529187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+4wVaFpvpRs5KMluJLTlNSxuF0X3udW73jAZSHWeOI=;
 b=O5JMYC/UcYIyxmOnnEUWJnwF+MyqRMM55sIZ1o63Mqb6V0gQrnJHaK2CU/Z/ayZYtD5PoQ
 1EzF+lOPpnXMC+bEHfjaxTg2ezD051zJONzDrKq3B8rw6i861KZPAqmIAjSyFoCjIr6WBO
 pI18VZV61LKJ6+T4EErkGy7Q7Q1Ueu4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-0SFJceh7Ox-g0F1MRuccXQ-1; Tue, 12 Sep 2023 10:33:05 -0400
X-MC-Unique: 0SFJceh7Ox-g0F1MRuccXQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2bcba79cedfso64784191fa.2
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 07:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694529184; x=1695133984;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+4wVaFpvpRs5KMluJLTlNSxuF0X3udW73jAZSHWeOI=;
 b=ioYDog6VHC0ReXAWuc4n/++jGiVepq18hdh4T9lt2p1AWa0AVwbQXJk3Y1/bNZH3qe
 KKMuX9DPqDnx9oQXa3kam8IkU+NjnFgxYPv2OjoWWoN82FKn59XSICpZKBPYntTBvtpg
 5XC+1qwU83zoN5Y9y15H2haAa3AnUlT1OvqRsXCsoB17YbjHzwpnOnMcy5uVBcyqVW2T
 uvaxQNpGcBMH+6lHwU/KV//SXFGJ4wQRrQTpWU479md8BbyX1aVSrTpMCDtkD4ucuvLY
 eNy0R4LMOaLKVMkYCudtYHIBIBNXKanuqKrQy/Gu+94GnWF9Ocry1fbgszbOv0NOCt41
 ro1w==
X-Gm-Message-State: AOJu0Yzh9dLgYk3msBN7TbPnY81nLTSLV+mQq/xH+a/gXYlUSqPPzMT4
 5j4z5KanlL5r86wvgi6uEIv5W34EMf/Q5/mfJVDo5nHEeuJkCLFVGW5/XrJNsqHivNoj8uLeu/J
 9MHOrc8zfS5TV6KvDUTHrdpI2o6c=
X-Received: by 2002:a2e:9887:0:b0:2bc:f118:7821 with SMTP id
 b7-20020a2e9887000000b002bcf1187821mr10811257ljj.29.1694529184465; 
 Tue, 12 Sep 2023 07:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzngc6qpmouYfwWUshJ3wauX1G+c83rtThrw5guri7sT57WDoaX/W3is0v4PeDqZNJUJWiww==
X-Received: by 2002:a2e:9887:0:b0:2bc:f118:7821 with SMTP id
 b7-20020a2e9887000000b002bcf1187821mr10811225ljj.29.1694529184054; 
 Tue, 12 Sep 2023 07:33:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ck8-20020a170906c44800b009930c80b87csm6997120ejb.142.2023.09.12.07.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 07:33:03 -0700 (PDT)
Message-ID: <ef8f493b-212a-3a97-bb37-28d6fb2623a4@redhat.com>
Date: Tue, 12 Sep 2023 16:33:01 +0200
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230912162838.34135959@collabora.com>
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

On 9/12/23 16:28, Boris Brezillon wrote:
> On Thu, 17 Aug 2023 13:13:31 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> I think that's a misunderstanding. I'm not trying to say that it is
>> *always* beneficial to fill up the ring as much as possible. But I think
>> it is under certain circumstances, exactly those circumstances I
>> described for Nouveau.
>>
>> As mentioned, in Nouveau the size of a job is only really limited by the
>> ring size, which means that one job can (but does not necessarily) fill
>> up the whole ring. We both agree that this is inefficient, because it
>> potentially results into the HW run dry due to hw_submission_limit == 1.
>>
>> I recognize you said that one should define hw_submission_limit and
>> adjust the other parts of the equation accordingly, the options I see are:
>>
>> (1) Increase the ring size while keeping the maximum job size.
>> (2) Decrease the maximum job size while keeping the ring size.
>> (3) Let the scheduler track the actual job size rather than the maximum
>> job size.
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
>> Actually, if none of the other drivers is interested into a more precise
>> way of keeping track of the ring utilization, I'd be totally fine to do
>> it in a driver specific way. However, unfortunately I don't see how this
>> would be possible.
> 
> I'm not entirely sure, but I think PowerVR is pretty close to your
> description: jobs size is dynamic size, and the ring buffer size is
> picked by the driver at queue initialization time. What we did was to
> set hw_submission_limit to an arbitrarily high value of 64k (we could
> have used something like ringbuf_size/min_job_size instead), and then
> have the control flow implemented with ->prepare_job() [1] (CCCB is the
> PowerVR ring buffer). This allows us to maximize ring buffer utilization
> while still allowing dynamic-size jobs.

I guess this would work, but I think it would be better to bake this in,
especially if more drivers do have this need. I already have an
implementation [1] for doing that in the scheduler. My plan was to push
that as soon as Matt sends out V3.

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commit/269f05d6a2255384badff8b008b3c32d640d2d95

> 
>>
>> My proposal would be to just keep the hw_submission_limit (maybe rename
>> it to submission_unit_limit) and add a submission_units field to struct
>> drm_sched_job. By default a jobs submission_units field would be 0 and
>> the scheduler would behave the exact same way as it does now.
>>
>> Accordingly, jobs with submission_units > 1 would contribute more than
>> one unit to the submission_unit_limit.
>>
>> What do you think about that?
>>
>> Besides all that, you said that filling up the ring just enough to not
>> let the HW run dry rather than filling it up entirely is desirable. Why
>> do you think so? I tend to think that in most cases it shouldn't make
>> difference.
> 
> [1]https://gitlab.freedesktop.org/frankbinns/powervr/-/blob/powervr-next/drivers/gpu/drm/imagination/pvr_queue.c#L502
> 

