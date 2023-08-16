Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133A8C04E69
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 14:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BA310E371;
	Wed, 16 Aug 2023 14:24:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CB010E371
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 14:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692195870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sRKlT8hXEn5OFLextJhDHP3mx2JjgDHfqkY8schRFY=;
 b=Zmss3ibm82J6TQMEiNFZVG16KapyBlMcpkKdey+klwdCxSwwhl6l8x1EfB3+MAFkSF/4sf
 V9XPiBrW0IlwOcJjTX3U4GKeAtFlSdkb49R1J+DoMsAPf1fYUHFmt9kZVFsoqrTXuPwWRe
 T9GoaYCWRLsJKqbdiWw/9QKvOUhnjHY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-iP94IXR8OweYt5iQ5ElHXw-1; Wed, 16 Aug 2023 10:24:27 -0400
X-MC-Unique: iP94IXR8OweYt5iQ5ElHXw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99beea69484so376922566b.0
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 07:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692195866; x=1692800666;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3sRKlT8hXEn5OFLextJhDHP3mx2JjgDHfqkY8schRFY=;
 b=IkopK2PHGHZlycaPWpBJjmCuwv+AbbYCprbuqVIAF2d8lDRrvmbMMKCdTteGnLlHmL
 tfNt+UKlLmF2XbEtDewOFAaQrKkNKCK196VByblCBlRsnvPrcyCnN9zfbSTm3FRcL9LE
 RmjCcLdUOWmY+8mxcb8B8FLR1xtiW8MUfysk65WPzO39AnmsYSSgcct1lVd6fzx0y8pi
 eXk4u5ZvvtwUGEBZ61rTavKtH7sCGB94UaPkmpzMTO53as/O3Pjl2sZ5y559uIY0cTwN
 n4bOw1mo5zvEjQyhOKZtNTVNnJgTRstsecR1e0jMc5919t6XNtyoMspS73CaA6MJ0FHK
 DoVQ==
X-Gm-Message-State: AOJu0YyQsj7HGUwUY5QtsiSPVP07gGD0k4I5oYg1xTTCbd2hrZJqrrO+
 hZG3u8/478MQi54OLGpQ83QZ48VojNXSQ9ifZ/ucbzOLESWBRYYiXiyqch8iA2R5oxDHMRq95Xk
 y2XW2bB4KUGTlvrYO57aWeGmpq4w=
X-Received: by 2002:a17:906:8a72:b0:99b:d1cb:5add with SMTP id
 hy18-20020a1709068a7200b0099bd1cb5addmr1451238ejc.35.1692195866153; 
 Wed, 16 Aug 2023 07:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEClvCwwkJzjT3/xLqFrOuVuDQISqd1sTXWJv9Jzko1G9VG6cN7ytoLbmVcGiwK0DKG9S9g/w==
X-Received: by 2002:a17:906:8a72:b0:99b:d1cb:5add with SMTP id
 hy18-20020a1709068a7200b0099bd1cb5addmr1451218ejc.35.1692195865862; 
 Wed, 16 Aug 2023 07:24:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a170906411700b00988e953a586sm8533663ejk.61.2023.08.16.07.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 07:24:25 -0700 (PDT)
Message-ID: <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
Date: Wed, 16 Aug 2023 14:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
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

On 8/16/23 16:05, Christian König wrote:
> Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
>> Hi Matt,
>>
>> On 8/11/23 04:31, Matthew Brost wrote:
>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>>> seems a bit odd but let us explain the reasoning below.
>>>
>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>> guaranteed to be the same completion even if targeting the same hardware
>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>> which allowed to reorder, timeslice, and preempt submissions. If a using
>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>>> apart as the TDR expects submission order == completion order. Using a
>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>
>>> 2. In XE submissions are done via programming a ring buffer (circular
>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>>> control on the ring for free.
>>
>> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>>
>> In Nouveau we currently do have such a limitation as well, but it is 
>> derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would 
>> always be 1. However, I think most jobs won't actually utilize the 
>> whole ring.
> 
> Well that should probably rather be RING_SIZE / MAX_SIZE_PER_JOB = 
> hw_submission_limit (or even hw_submission_limit - 1 when the hw can't 
> distinct full vs empty ring buffer).

Not sure if I get you right, let me try to clarify what I was trying to 
say: I wanted to say that in Nouveau MAX_SIZE_PER_JOB isn't really 
limited by anything other than the RING_SIZE and hence we'd never allow 
more than 1 active job.

However, it seems to be more efficient to base ring flow control on the 
actual size of each incoming job rather than the worst case, namely the 
maximum size of a job.

> 
> Otherwise your scheduler might just overwrite the ring buffer by pushing 
> things to fast.
> 
> Christian.
> 
>>
>> Given that, it seems like it would be better to let the scheduler keep 
>> track of empty ring "slots" instead, such that the scheduler can 
>> deceide whether a subsequent job will still fit on the ring and if not 
>> re-evaluate once a previous job finished. Of course each submitted job 
>> would be required to carry the number of slots it requires on the ring.
>>
>> What to you think of implementing this as alternative flow control 
>> mechanism? Implementation wise this could be a union with the existing 
>> hw_submission_limit.
>>
>> - Danilo
>>
>>>
>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>> kthread for submission / job cleanup. This doesn't scale if a large
>>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>>> use a worker rather than kthread for submission / job cleanup.
>>>
>>> v2:
>>>    - (Rob Clark) Fix msm build
>>>    - Pass in run work queue
>>> v3:
>>>    - (Boris) don't have loop in worker
>>> v4:
>>>    - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
> 

