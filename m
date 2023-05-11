Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2D1C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 07:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CF110E1AF;
	Thu, 11 May 2023 07:43:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F150710E1E2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683790997; x=1715326997;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0RGIaYXiGD0XWD/aJMnViy6Vw4/hsKlg+VJejbMhUOA=;
 b=UnsU8yZ0QjZkeXaKi0vRpPrZkVdY4rdeVOXFf6EeVzEyVlwHxgsF1egQ
 AeFBm6neR+D88xKH3DhNpMig/EkVc0pNj4FVrHa1/6967eXu4m+D+ld/J
 9WCvyStw9L9t4WbmIqfyFuaNOzp1Sr5KiaCNyBFTGdlOkoreFubKrCvZf
 nbVIOgp8qZDfDGtikQ7Bkd37Gf7+cxOs1X9UI4DSVOK2Oeh6KnrRxrO0X
 hTsypFMRRgrlKEI73bh79DZf9CjAOS2rwsNxRjbN+8PJcoU7ii8O0NDef
 bf4XEk3H6IUVTMA0HrPTITjsISbNOmi2c2/EApEj2NSxPb/BID0iQDj/Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350455531"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="350455531"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 00:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789286073"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789286073"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 00:43:14 -0700
Message-ID: <eed9664b-bb93-f2dc-538a-eb6ecaf5a3e5@linux.intel.com>
Date: Thu, 11 May 2023 09:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-8-matthew.brost@intel.com>
 <ZFVNqF+iqsN059E3@rdvivi-mobl4> <ZFhLejusrFMU3dIk@DUT025-TGLU.fm.intel.com>
 <ZFlrAJI44mbZcq7X@intel.com>
 <58a2affd-fb1f-f703-80f7-836bf2a7e28b@linux.intel.com>
 <ZFwn0RGYdN7zFjWo@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFwn0RGYdN7zFjWo@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 07/31] drm/xe: Only try to lock external
 BOs in VM bind
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Matthew Brost <mattthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/11/23 01:25, Matthew Brost wrote:
> On Tue, May 09, 2023 at 02:29:23PM +0200, Thomas Hellström wrote:
>> On 5/8/23 23:34, Rodrigo Vivi wrote:
>>> On Mon, May 08, 2023 at 01:08:10AM +0000, Matthew Brost wrote:
>>>> On Fri, May 05, 2023 at 02:40:40PM -0400, Rodrigo Vivi wrote:
>>>>> On Mon, May 01, 2023 at 05:17:03PM -0700, Matthew Brost wrote:
>>>>>> Not needed and causes some issues with bulk LRU moves.
>>>>> I'm confused with this explanation and the code below.
>>>>> could you please provide a bit more wording here?
>>>>>
>>>> We only need to try to lock a BO if it external as non-external BOs
>>>> share the dma-resv with the already locked VM. Trying to lock
>>>> non-external BOs caused an issue (list corruption) in an uncoming patch
>> s/uncoming/upcoming/
>>
>> Also it's not clear to me how this could fix a list corruption in the bulk
>> LRU moves? I mean, if it's a duplicate lock then it gets removed from the tv
>> list and not touched again? Could you explain the mechanism of the fix?
>>
> I had my head wrappeed around this at one point but now I forget as I
> coded this one a while ago. This changes later series (drm_exec
> locking), so IMO not that big of a deal merge this along with the
> following patch without further explaination but if you think it is a
> huge deal I can try to figure out what the issue is again or another
> option is just stage the LRU patch after drm_exec.
>
> Open to whatever but prefer to leave as is.

Since this will be part of a bulk LRU series, separate from drm_exec 
then yes please add an explanation as why this is needed, as we can't 
make something dependent on a future patch that may or may not go in 
depending on the review outcome.

Could also consider reordering so that drm_exec goes in before bulk LRU?

/Thomas

>
> Matt
>
>> Thanks,
>>
>> Thomas
>>
>>
>>>> which adds bulk LRU move. Since this code isn't needed, remove it.
>>> it makes more sense now. with this in commit msg (but with Christopher fix)
>>>
>>>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>
>>>
>>>> ^^^ How about this.
>>>>
>>>>>> Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>>>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> index 272f0f7f24fe..6c427ff92c44 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> @@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>>>>>>    		 */
>>>>>>    		xe_bo_get(vbo);
>>>>>> -		tv_bo.bo = &vbo->ttm;
>>>>>> -		tv_bo.num_shared = 1;
>>>>>> -		list_add(&tv_bo.head, &objs);
>>>>>> +		if (!vbo->vm) {
>>>>>> +			tv_bo.bo = &vbo->ttm;
>>>>>> +			tv_bo.num_shared = 1;
>>>>>> +			list_add(&tv_bo.head, &objs);
>>>>>> +		}
>>>>>>    	}
>>>>>>    again:
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
