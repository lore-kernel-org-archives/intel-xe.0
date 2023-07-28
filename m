Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54806C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 10:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A8710E0AA;
	Fri, 28 Jul 2023 10:15:05 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5A110E0AA
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 10:15:04 +0000 (UTC)
Message-ID: <4eda6552-9229-11fd-89ab-3441195e8520@linux.intel.com>
Date: Fri, 28 Jul 2023 12:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230725151239.133708-1-maarten.lankhorst@linux.intel.com>
 <ZMAE0yXpF+IdQ6KY@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZMAE0yXpF+IdQ6KY@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix error paths of
 __xe_bo_create_locked
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

Hey,

On 2023-07-25 19:22, Matthew Brost wrote:
> On Tue, Jul 25, 2023 at 05:12:39PM +0200, Maarten Lankhorst wrote:
>> ttm_bo_init_reserved() calls the destroy() callback if it fails.
>>
>> Because of this, __xe_bo_create_locked is required to be responsible
>> for freeing the bo even when it's passed in as argument.
>>
>> Additionally, if the placement check fails, the bo was kept alive.
>> Fix it too.
>>
>> Reported-by: Oded Gabbay <ogabbay@kernel.org>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index e240df6c7ae64..b63290540dd9b 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1158,8 +1158,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   	/* Only kernel objects should set GT */
>>   	XE_BUG_ON(tile && type != ttm_bo_type_kernel);
>>   
>> -	if (XE_WARN_ON(!size))
>> +	if (XE_WARN_ON(!size)) {
>> +		xe_bo_free(bo);
>>   		return ERR_PTR(-EINVAL);
>> +	}
>>   
>>   	if (!bo) {
>>   		bo = xe_bo_alloc();
>> @@ -1197,8 +1199,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   
>>   	if (!(flags & XE_BO_FIXED_PLACEMENT_BIT)) {
>>   		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
>> -		if (WARN_ON(err))
>> +		if (WARN_ON(err)) {
>> +			xe_ttm_bo_destroy(&bo->ttm);
> 
> This doesn't look right as we haven't fully initialized the BO. An
> example of this is the snippet from xe_ttm_bo_destroy:
> 
> 1012         if (bo->vm && xe_bo_is_user(bo))
> 1013                 xe_vm_put(bo->vm);
bo->vm is only assigned later, see xe_bo_create_locked_range line 1300-1302.

> 
> This shouldn't be executed in this error path.
> 
> Also do we need to do a cleanup if ttm_bo_init_reserved fails?
No, it cleans up the bo by calling xe_ttm_bo_destroy itself on failure. 
This is also why it's safe to call xe_ttm_bo_destroy right before 
ttm_bo_init_reserved in our setup function; on failure it would have 
been called anyway.

Because of ttm_bo_init_reserved semantics, the function is slightly 
confusing, but still correct. From the ttm_bo_init_reserved docs:
"If a failure occurs, the function will call the @destroy function. 
Thus, after a failure, dereferencing @bo is illegal and will likely 
cause memory corruption."

This patch is correct, but the semantics are confusing.

~Maarten
