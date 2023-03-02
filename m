Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0696C6FD1D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 14:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77B10E263;
	Mon,  6 Mar 2023 14:41:04 +0000 (UTC)
X-Greylist: delayed 163015 seconds by postgrey-1.36 at gabe;
 Thu, 02 Mar 2023 11:26:20 UTC
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEE310E111
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 11:26:20 +0000 (UTC)
Message-ID: <32de8549-1e00-ab70-888a-53f0e269ea97@lankhorst.se>
Date: Thu, 2 Mar 2023 12:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
 <20230301163629.axukda67v4rsqb3l@ldmartin-desk2.lan>
 <Y//caMLc8YAqOB9Q@intel.com>
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <Y//caMLc8YAqOB9Q@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 14:41:02 +0000
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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


On 2023-03-02 00:14, Rodrigo Vivi wrote:
> On Wed, Mar 01, 2023 at 08:36:29AM -0800, Lucas De Marchi wrote:
>> On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
>>> xe_guc_ct_fast_path() is called from an irq context, and cannot lock
>>> the mutex used by xe_device_mem_access_ongoing().
>>>
>>> Fortunately it is easy to fix, and the atomic guarantees are good enough
>>> to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
>>>
>>> As far as I can tell, the runtime ref in device access should be
>>> killable, but don't dare to do it yet.
>> I don't follow this last paragraph. Could you point it in the code?
> I also didn't understand this... if we remove that we will end up in
> memory access with the sleeping device...
I may understand the code wrong, but without error checking by the 
callers, and changing the prototype to return int is there any way this 
will be guaranteed to work regardless?
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++---------
>>> drivers/gpu/drm/xe/xe_device.h       | 14 ++++----------
>>> drivers/gpu/drm/xe/xe_device_types.h |  4 +---
>>> 3 files changed, 13 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 4eb6786b11f0..ab179b1e24c1 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -237,7 +237,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>> 	if (err)
>>> 		goto err;
>>>
>>> -	mutex_init(&xe->mem_access.lock);
>>> 	return xe;
>>>
>>> err_put:
>>> @@ -424,25 +423,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>> void xe_device_mem_access_get(struct xe_device *xe)
>>> {
>>> 	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>>> +	int ref = atomic_inc_return(&xe->mem_access.ref);
>>
>> +Matt Brost
>>
>> Any reason for not using kref?
> hmmm... my bad actually...
>
> I did considered the kref, but I can't remember why I haven't used it.
> I recently was asking myself the same question.

I looked at it, I don't think you can kref from 0 to 1 by design.

xe_device_mem_access_get() is usually called with force wake held 
explicitly or implicitly, so we shouldn't need the runtime pm ref there.

>> Lucas De Marchi
>>
>>> -	mutex_lock(&xe->mem_access.lock);
>>> -	if (xe->mem_access.ref++ == 0)
>>> +	if (ref == 1)
>>> 		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
> hmmm... I'm afraid this can be tricky without locks...
>
> if we have 3 simultaneous threads calling this.
> get
> get
> put
> get
>
> and they happened in this order but the resume didn't finished yet
> on the first one, then you will:
> 1. end up the runtime pm twice.
> 2. the second will pass over thinking the gpu is already awake, but it might
> be still asleep.







>>> -	mutex_unlock(&xe->mem_access.lock);
>>>
>>> 	/* The usage counter increased if device was immediately resumed */
>>> 	if (resumed)
>>> 		xe_pm_runtime_put(xe);
>>>
>>> -	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
>>> +	XE_WARN_ON(ref == S32_MAX);
>>> }
>>>
>>> void xe_device_mem_access_put(struct xe_device *xe)
>>> {
>>> -	mutex_lock(&xe->mem_access.lock);
>>> -	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
>>> +	bool hold = xe->mem_access.hold_rpm;
>>> +	int ref = atomic_dec_return(&xe->mem_access.ref);
>>> +
>>> +	if (!ref && hold)
>>> 		xe_pm_runtime_put(xe);
>>> -	mutex_unlock(&xe->mem_access.lock);
>>>
>>> -	XE_WARN_ON(xe->mem_access.ref < 0);
>>> +	XE_WARN_ON(ref < 0);
>>> }
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>> index 263620953c3b..96b4f3d7969e 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>>> void xe_device_mem_access_get(struct xe_device *xe);
>>> void xe_device_mem_access_put(struct xe_device *xe);
>>>
>>> -static inline void xe_device_assert_mem_access(struct xe_device *xe)
>>> +static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>>> {
>>> -	XE_WARN_ON(!xe->mem_access.ref);
>>> +	return atomic_read(&xe->mem_access.ref);
>>> }
>>>
>>> -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>>> +static inline void xe_device_assert_mem_access(struct xe_device *xe)
>>> {
>>> -	bool ret;
>>> -
>>> -	mutex_lock(&xe->mem_access.lock);
>>> -	ret = xe->mem_access.ref;
>>> -	mutex_unlock(&xe->mem_access.lock);
>>> -
>>> -	return ret;
>>> +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
>>> }
>>>
>>> static inline bool xe_device_in_fault_mode(struct xe_device *xe)
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 9743987fc883..0b8c4ee0ad48 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -230,10 +230,8 @@ struct xe_device {
>>> 	 * triggering additional actions when they occur.
>>> 	 */
>>> 	struct {
>>> -		/** @lock: protect the ref count */
>>> -		struct mutex lock;
>>> 		/** @ref: ref count of memory accesses */
>>> -		s32 ref;
>>> +		atomic_t ref;
>>> 		/** @hold_rpm: need to put rpm ref back at the end */
>>> 		bool hold_rpm;
>>> 	} mem_access;
>>> -- 
>>> 2.34.1
>>>
