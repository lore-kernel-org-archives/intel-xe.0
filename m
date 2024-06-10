Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BE6C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 09:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEA610E057;
	Mon, 10 Jun 2024 09:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAveaN/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D12A10E057
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718013583; x=1749549583;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iVFuZBcWE/MvxVn3ClynkEHdl+wy1UAWkgaLqifqHB4=;
 b=oAveaN/cVMispbl7Don4s422oQqOwl8fBItTwgd1lP29P5GlDO3/2CPl
 UVwBwdEz0xAzk8evu4WcM0YQCG74qw2n1NvshPkWxhKJxmzSjUpy7pEz0
 KTGAG1UnMw3KTZAaMBuge2UryFKtcI9koJEIv2iP/+8V0UgjyZ+goh22b
 1YGpoVvE09tFqw7gJIIJ389lvbeO/CFajAyzbcOW52O0UzzuP1u3bR8aY
 YOBo+zFJyRAuyNDC8PTc4musieTT7ndkzrQpiQg1PlVGnHZEs0HktJj/3
 Ko7ggeNuyqhgVz2Pzhy6JRjkV3KGP+ABzAJFEgp3HU3IijdOlO4JoLqPz g==;
X-CSE-ConnectionGUID: qmhxCUlCQM+ZYbXZ8UOJGA==
X-CSE-MsgGUID: cP3QGydfTX2LOdxM7U/Lgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14794680"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14794680"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 02:59:41 -0700
X-CSE-ConnectionGUID: lFM7TVJMRW+kihlL/6TZSg==
X-CSE-MsgGUID: Gua3NxkrSG2O9zU+bpALdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="38932965"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.65])
 ([10.246.36.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 02:59:39 -0700
Message-ID: <4095731b-f4d3-4f7a-88e7-1290e1c06fa3@linux.intel.com>
Date: Mon, 10 Jun 2024 11:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/xe/xe_reg_sr: Always call xe_force_wake_put/get
 in pairs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, intel-xe@lists.freedesktop.org
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-4-nirmoy.das@intel.com>
 <e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com>
 <63c1b974-491a-4349-bd13-d649d8dc2717@linux.intel.com>
 <ew5v4bxh7ocvaquhp7ghcuwexmkfdkzyp2giuanr3lhaetxntl@xlfupwcaraxd>
 <2f8c48f3-598c-4bc8-b9ca-da22e380c130@intel.com> <ZmH2C6oT0A0-IjKf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZmH2C6oT0A0-IjKf@intel.com>
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


On 6/6/2024 7:46 PM, Rodrigo Vivi wrote:
> On Wed, Jun 05, 2024 at 12:49:42PM +0200, Nirmoy Das wrote:
>> On 6/4/2024 11:13 PM, Lucas De Marchi wrote:
>>> On Tue, Jun 04, 2024 at 04:21:25PM GMT, Nirmoy Das wrote:
>>>> Hi Michal,
>>>>
>>>> On 6/4/2024 3:12 PM, Michal Wajdeczko wrote:
>>>>> On 04.06.2024 13:02, Nirmoy Das wrote:
>>>>>> xe_force_wake_get() increments the domain ref regardless of success
>>>>>> or failure so call xe_force_wake_put() even on failure to keep ref
>>>>>> count accurate.
>>>>>>
>>>>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++------------
>>>>>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>>> b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>>> index 440ac572f6e5..8fcc08658d89 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>>> @@ -201,13 +201,11 @@ void xe_reg_sr_apply_mmio(struct
>>>>>> xe_reg_sr *sr, struct xe_gt *gt)
>>>>>>       xa_for_each(&sr->xa, reg, entry)
>>>>>>           apply_one_mmio(gt, entry);
>>>>>> -    err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>>>>>> -    XE_WARN_ON(err);
>>>>>> -
>>>>>> -    return;
>>>>>> -
>>>>>>   err_force_wake:
>>>>>> -    xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>>>>> +    if (err)
>>>>>> +        xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
>>>>>> +              sr->name, err);
>>>>>> +    XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
>>>>> what's the rule whether to WARN about the failed xe_force_wake_put() or
>>>>> not ? should we also WARN when xe_force_wake_get() failed ? does
>>>>> it make
>>>>> sense to WARN about put() if get() already failed ?
>>>> We don't have one yet.
>>>>> maybe simpler solution would be make function xe_force_wake_put() void
>>>>> as it almost nothing that caller can do and move WARN there if needed ?
>>>> We have code that  does "return xe_force_wake_put()" So question is
>>>> what shall we do
>>>>
>>>> if xe_force_wake_get() worked but subsequent xe_force_wake_put() fails ?
>>> there's not much can be done here. I even don't think there's a reason
>>> to wait on ack for force_wake put... in most of the cases.
>>> +Rodrigo, what exactly are we protecting against there?
>>>
>>> If that xe_mmio_wait32() fails, driver is toast. The reason we check (or
>>> should check) the return on _get() is because we want to bail out
>>> whatever we are starting to do rather than attempting it and handling
>>> bogus values of an IP that is not awaken.
>>>
>>> So, maybe what could be done is
>>>
>>> a) XE_WARN_ON(xe_force_wake_put()) -> xe_force_wake_put()
>>>
>>>      We cann probably move the WARN_ON() inside xe_force_wake_put()
>>>      if we want to maintain the behavior in most places
>>>
>>>      Then make xe_force_wake_put() void as suggested here.
> yeap, I believe we have a rough consensus here that put should be void function
> and perhaps (likely?!) with some warn inside it.
>
>>> b) I'm not sure about the benefit of the weirdness of
>>> xe_force_wake_get() incrementing the ref even if we failed to wait for
>>> ack.  The only thing the caller is going to do is to call
>>> xe_force_wake_put() and bail out. Why are we not unwinding then?
>> With unwinding of ref count and partial woken domains on error, we should be
>> able do
>>
>>
>>      if (xe_force_wake_get(fw, d)) {
>>          ...
>>          xe_force_wake_put(fw, d);
>>
>>      }
>>
>> I will let Rodrigo suggest how best to handle this.
> I believe the benefit of trying to run the code even when ack timed out
> is on clean up cases, since we use this force_wake on a broader scope,
> rather then only around the specific mmio calls that we really need it.
>
> So, I'm okay with make this proposed flow as the rule, on always
> checking the force_wake_get result before doing operations.
> But maybe on top of that it would be worth to scrutinize a bit
> the callers and see if we can/should reduce the scope of impact.


Thanks, Rodrigo. I will send a series for follow below patter

  if (xe_force_wake_get(fw, d)) {
         ...
         xe_force_wake_put(fw, d);

     }

Regards,
Nirmoy

>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>>
>>> Lucas De Marchi
>>>
>>>> Regards,
>>>>
>>>> Nirmoy
>>>>
>>>>> what about making the flow more intuitive like this:
>>>>>
>>>>> bool xe_force_wake_get(fw, d);
>>>>> void xe_force_wake_put(fw, d);
>>>>>
>>>>>      if (xe_force_wake_get(fw, d)) {
>>>>>          ...
>>>>>          xe_force_wake_put(fw, d);
>>>>>      }
>>>>>
>>>>>>   }
>>>>>>   void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>>>>> @@ -253,13 +251,11 @@ void xe_reg_sr_apply_whitelist(struct
>>>>>> xe_hw_engine *hwe)
>>>>>>           xe_mmio_write32(gt,
>>>>>> RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>>>>>>       }
>>>>>> -    err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>>>>>> -    XE_WARN_ON(err);
>>>>>> -
>>>>>> -    return;
>>>>>> -
>>>>>>   err_force_wake:
>>>>>> -    drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>>>>> +    if (err)
>>>>>> +        xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
>>>>>> +              sr->name, err);
>>>>>> +    XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
>>>>>>   }
>>>>>>   /**
