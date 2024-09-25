Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFB1C369CA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 10:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F0F10E034;
	Wed, 25 Sep 2024 10:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnlJxBnd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A0110E034
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727261077; x=1758797077;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2eaMdDGMJ87AGL1y3VwcyVzqQyoVIPuMhcPGhwvFgaQ=;
 b=HnlJxBndxgMVYyCAWzy7ooSICKFicUB/yP1rScf+bWfjIVtWfRT2yGUv
 5/8KDQeeRN/JhWf3yk0SfN7kofbuDc/Vhh3bi0SXBFNr3Xqr+NLo74+iO
 dvNxnLCmS8k10x0MnILNZU6pvz6k7LBHPubqij4pb/swNAYscESrfRvX3
 9pXjkchzp78EcY4IgdbZYB5zY/ZG5p9JLfxwQjxgwPjxG72LIf9Hbx41P
 J8okgu0F1I4f48xnM2CpA84xC2TWNlzM0fbvncRb6ijqOezwQ9AOx0mOk
 ZnRu3N7+cTlbEcwbhKFelmcwiJXTQk1Wh43zRjq3QvXYWxcFBFegp/r5e A==;
X-CSE-ConnectionGUID: yIeh4DDQROK07V8NkEzqOg==
X-CSE-MsgGUID: f/cpfs8ZR/uOTRO+LiCiqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37677939"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="37677939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:44:37 -0700
X-CSE-ConnectionGUID: 4erpIbzjQcmrwP3glawdOg==
X-CSE-MsgGUID: vW63z/dgRMqy319beG+k7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71617135"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.178.53])
 ([10.245.178.53])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:44:35 -0700
Message-ID: <d74a5462-7fd4-4911-b62c-178f4292f90d@linux.intel.com>
Date: Wed, 25 Sep 2024 12:44:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/queue: move xa_alloc to prevent UAF
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240925071426.144015-3-matthew.auld@intel.com>
 <20240925071426.144015-4-matthew.auld@intel.com>
 <598b2e8c-a50f-42ec-a6c0-749b0ae507b6@linux.intel.com>
 <8f3dda30-b6ea-4800-b357-4332bd8c5be4@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <8f3dda30-b6ea-4800-b357-4332bd8c5be4@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 9/25/2024 11:51 AM, Matthew Auld wrote:
> On 25/09/2024 10:33, Nirmoy Das wrote:
>>
>> On 9/25/2024 9:14 AM, Matthew Auld wrote:
>>> Evil user can guess the next id of the queue before the ioctl completes
>>> and then call queue destroy ioctl to trigger UAF since create ioctl is
>>> still referencing the same queue. Move the xa_alloc all the way to the end
>>> to prevent this.
>>
>> The commit message doesn't match the diff, xa_alloc already happening at the end here.
>
> It's not at the end. It is dereferencing the q to set xef after the xa_alloc, but that needs to happen before it is visible to userspace.


Ah I see, that make sense.

I think now  we have to undo xe_file_get() if xe_alloc fails.


Regards,

Nirmoy

>
>>
>>> v2:
>>>   - Rebase
>>>
>>> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
>>> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index 7743ebdcbf4b..d098d2dd1b2d 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -635,12 +635,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>           }
>>>       }
>>>   +    q->xef = xe_file_get(xef);
>>> +
>>> +    /* user id alloc must always be last in ioctl to prevent UAF */
>>>       err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>>>       if (err)
>>>           goto kill_exec_queue;
>>>         args->exec_queue_id = id;
>>> -    q->xef = xe_file_get(xef);
>>>         return 0;
>>>   
