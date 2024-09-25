Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442E0C369CC
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 11:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0C410E7E7;
	Wed, 25 Sep 2024 11:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGeUuJRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4E510E7E7
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727263496; x=1758799496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8UMYnnCewNoIhOVtoC5pQi88a8a2bJ+lNZ17uFqrCCA=;
 b=lGeUuJRI/0GdqIHd9NmdIguKLsVEvtSlsMHLY5byE7GyI0Ww6JjMowNg
 py/PkuvEBU28CMrzldoUSlBlmTdOGPFVS5IvXCywAi4VbKNhkC6q2v4z0
 Oya2Tirb8UbAxvI9ZR71zQqC9MU26dm4qLBbs59d7ViLr+DgBTR2vCykY
 h5NdbP+YuzZm0X5/XTujnZTIjB1IEquqdqr0WLhmiN4RJXEJ9ANbu4/42
 vaHtZJZbunxNyrSyyVbtAKZZ4ue9D0SEuVgrT4tDoiq8pvCJ4/P6RMPw/
 YXBpgcHAsOQXiKpFKYUHo/JMsV9G+r49Dp5n9pBwVwHMWtIVdCBsN4I6R w==;
X-CSE-ConnectionGUID: 8RpfsvmkQZqyIaQFhcniKA==
X-CSE-MsgGUID: VrK3AiwHTNaN+icVohGbng==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37445813"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="37445813"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 04:24:56 -0700
X-CSE-ConnectionGUID: rOxzXnV6SSuJKp5euEP4hg==
X-CSE-MsgGUID: tjzddCV+QPG2/CZEEXJiiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="102495378"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.236])
 ([10.245.244.236])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 04:24:55 -0700
Message-ID: <8d83962f-abff-455e-a14e-d3bf7c5a9cbf@intel.com>
Date: Wed, 25 Sep 2024 12:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/queue: move xa_alloc to prevent UAF
To: Nirmoy Das <nirmoy.das@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240925071426.144015-3-matthew.auld@intel.com>
 <20240925071426.144015-4-matthew.auld@intel.com>
 <598b2e8c-a50f-42ec-a6c0-749b0ae507b6@linux.intel.com>
 <8f3dda30-b6ea-4800-b357-4332bd8c5be4@intel.com>
 <d74a5462-7fd4-4911-b62c-178f4292f90d@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d74a5462-7fd4-4911-b62c-178f4292f90d@linux.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 25/09/2024 11:44, Nirmoy Das wrote:
> 
> On 9/25/2024 11:51 AM, Matthew Auld wrote:
>> On 25/09/2024 10:33, Nirmoy Das wrote:
>>>
>>> On 9/25/2024 9:14 AM, Matthew Auld wrote:
>>>> Evil user can guess the next id of the queue before the ioctl completes
>>>> and then call queue destroy ioctl to trigger UAF since create ioctl is
>>>> still referencing the same queue. Move the xa_alloc all the way to the end
>>>> to prevent this.
>>>
>>> The commit message doesn't match the diff, xa_alloc already happening at the end here.
>>
>> It's not at the end. It is dereferencing the q to set xef after the xa_alloc, but that needs to happen before it is visible to userspace.
> 
> 
> Ah I see, that make sense.
> 
> I think now  we have to undo xe_file_get() if xe_alloc fails.

That is already handled by the queue put().

> 
> 
> Regards,
> 
> Nirmoy
> 
>>
>>>
>>>> v2:
>>>>    - Rebase
>>>>
>>>> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
>>>> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> index 7743ebdcbf4b..d098d2dd1b2d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>> @@ -635,12 +635,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>>            }
>>>>        }
>>>>    +    q->xef = xe_file_get(xef);
>>>> +
>>>> +    /* user id alloc must always be last in ioctl to prevent UAF */
>>>>        err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>>>>        if (err)
>>>>            goto kill_exec_queue;
>>>>          args->exec_queue_id = id;
>>>> -    q->xef = xe_file_get(xef);
>>>>          return 0;
>>>>    
