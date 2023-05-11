Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EEAC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 07:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD9610E194;
	Thu, 11 May 2023 07:24:12 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819E110E194
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 07:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683789850; x=1715325850;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hMsZZIssAvRuHSO89HsaVDXZ9mL5HaTuREHzLu1TWNk=;
 b=NaCKTcmswEI/J+Hx0jT+Dn9eQ0LR1YQyhyQzIJ6p79scpwj3aX8926yw
 /XPKIP7LM4pJv9ftq1ZrPlKlhDJzTGRgQ7YTnB03J/vtPgmNr9ixJdqPp
 no932WW1Dk0c96V0qEYc2EdsaZLssDSOpBoEqIiRXaaG9AlQV1zqoRObW
 9wO2F9t2I2lKaUUHmY4d+USAB2z+6Wypa4pTzRLPWIC+XawDjasspFMIX
 JoJvbH9C42rPb9mFrOYYOWZdvisDIcJXdtNZQ/0A+jMScagVuSkIYblqu
 7YJpK+vcrG2NseFx8DveZ0K2psk45szy9baqHujc/nIoW/IPI7b49nTx+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="349261298"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="349261298"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 00:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789273509"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789273509"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 00:24:07 -0700
Message-ID: <f47d74e7-51f8-07aa-f845-2ea3f241653b@linux.intel.com>
Date: Thu, 11 May 2023 09:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-9-matthew.brost@intel.com>
 <ef984a4c-82a3-4e4d-f0ad-2d50558b3051@linux.intel.com>
 <ZFrDjttRaPf6hBeo@DUT025-TGLU.fm.intel.com>
 <c58f99e3-a11d-7f2c-cfa3-dfb14a44c6c4@linux.intel.com>
 <ZFvlBMEvuhiT9QSB@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFvlBMEvuhiT9QSB@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 08/31] drm/xe: VM LRU bulk move
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/10/23 20:40, Matthew Brost wrote:
> On Wed, May 10, 2023 at 10:14:12AM +0200, Thomas Hellström wrote:
>> On 5/10/23 00:05, Matthew Brost wrote:
>>> On Tue, May 09, 2023 at 02:47:54PM +0200, Thomas Hellström wrote:
>>>> On 5/2/23 02:17, Matthew Brost wrote:
>>>>> Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
>>>>> LRU position on every exec.
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
>>>>>     drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
>>>>>     drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
>>>>>     drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
>>>>>     drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
>>>>>     5 files changed, 40 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>> index 3ab404e33fae..da99ee53e7d7 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>> @@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
>>>>>     	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
>>>>>     }
>>>>> +static void xe_gem_object_close(struct drm_gem_object *obj,
>>>>> +				struct drm_file *file_priv)
>>>>> +{
>>>>> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>>>>> +
>>>>> +	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
>>>> Is there a reason we don't use bulk moves for LR vms? Admittedly bumping LRU
>>>> doesn't make much sense when we support user-space command buffer chaining,
>>>> but I think we should be doing it on exec at least, no?
>>> Maybe you could make the argument for compute VMs, the preempt worker in
>>> that case should probably do a bulk move. I can change this if desired.
>> Yes, please.
>>> Fot a fault VM it makes no sense as the fault handler updates the LRU
>>> for individual BOs.
>> Yes that makes sense.
>>>>> +		struct ww_acquire_ctx ww;
>>>>> +
>>>>> +		XE_BUG_ON(!xe_bo_is_user(bo));
>>>> Also why can't we use this for kernel objects as well? At some point we want
>>>> to get to evictable page-table objects? Could we do this in the
>>>> release_notify() callback to cover all potential bos?
>>>>
>>> xe_gem_object_close is a user call, right? We can't call this on kernel
>>> BOs. This also could be outside the if statement.
>> Hmm, yes the question was can we stop doing this in xe_gem_object_close()
>> and instead do it in release_notify() to cover also kernel objects. Since
>> release_notify() is called just after individualizing dma_resv, it makes
>> sense to individualize also LRU at that point?
>>
> If we ever support moving kernel BOs, then yes. We need to do a lot of
> work to get there, with I'd rather leave this where is but I'll add a
> comment indicating if we want to support kernel BO eviction, this should
> be updated.
>
> Sound good?

Well, I can't see the motivation to have it in gem close? Are other 
drivers doing that? Whether the object should be bulk moved or not is 
tied to whether it's a vm private object or not and that is closely tied 
to whether the reservation object is the vm resv or the object resv?

/Thomas

>
> Matt
>
>> /Thomas
>>
>>
>>> Matt
>>>
>>>> /Thomas
>>>>
>>>>
