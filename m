Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61978E94115
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 20:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234A710E563;
	Fri,  6 Oct 2023 20:12:21 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046D10E563
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 20:12:18 +0000 (UTC)
Message-ID: <85b90a64-bd54-6753-5f04-c3e9034ae5cc@lankhorst.se>
Date: Fri, 6 Oct 2023 22:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
References: <20231006171800.1816211-1-maarten.lankhorst@linux.intel.com>
 <d530b1b8303e1f1317d9b97e21af35aebcdb1899.camel@intel.com>
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <d530b1b8303e1f1317d9b97e21af35aebcdb1899.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: Add uapi for dumpable bos
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

Hey,

On 2023-10-06 20:29, Souza, Jose wrote:
> On Fri, 2023-10-06 at 19:18 +0200, maarten.lankhorst@linux.intel.com wrote:
>> From: Maarten Lankhorst <dev@lankhorst.se>
>>
>> Add XE_GEM_CREATE_FLAG_DUMPABLE for use with VM_BIND.
>> For BO's with vram regions, XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
>> also needs to be specified.
>>
>> After this, we can use the flag XE_VM_BIND_FLAG_DUMPABLE to notify
>> devcoredump that this mapping should be dumped.
>>
>> This is not hooked up, but the uapi should be ready before merging.
>> If needed, we can relax the restrictions later.
>>
>> It's also not yet certain whether the BO contents will be preserved,
>> or a reference to the BO. The latter allows us to skip a whole lot of
>> tricky locking. This requires userspace to destroy all bo's that were
>> marked dumpable though, but I feel this is a cleaner solution from
>> a kernel perspective.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c |  9 +++++++++
>>   drivers/gpu/drm/xe/xe_bo.h |  1 +
>>   drivers/gpu/drm/xe/xe_vm.c | 17 ++++++++++++++---
>>   include/uapi/drm/xe_drm.h  | 25 +++++++++++++++++++++++++
>>   4 files changed, 49 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 61789c0e88fb..0de0bd5eb825 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1776,6 +1776,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
>>   			   XE_GEM_CREATE_FLAG_SCANOUT |
>>   			   XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
>> +			   XE_GEM_CREATE_FLAG_DUMPABLE |
>>   			   xe->info.mem_region_mask)))
>>   		return -EINVAL;
>>   
>> @@ -1810,6 +1811,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>   	}
>>   
>> +	if (args->flags & XE_GEM_CREATE_FLAG_DUMPABLE) {
>> +		if (XE_IOCTL_DBG(xe, (bo_flags & XE_BO_CREATE_VRAM_MASK &&
>> +				 !(bo_flags & XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM))))
>> +			return -EINVAL;
>> +
>> +		bo_flags |= XE_BO_NEEDS_CPU_ACCESS | XE_BO_DUMPABLE;
> 
> It is not viable to just ignore VMAs that can't be mapped in CPU during dump?
> Because it will not be viable to dump real applications in small PCIe bar systems, it would run out of CPU mappable memory.
> 
> And if UMD really wants a dump of a small test that fits into the CPU mappable memory it can set XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM and get the
> whole dump.
> 
> So we would be able to drop the need of XE_GEM_CREATE_FLAG_DUMPABLE.
It would be doable, we could evict the BO's to sysmem if we only take a 
reference and dump each bo.

Taking a reference during crash would require the userspace app to 
recreate all dumpable bo's after a hang, or it will risk overwriting
the state at the time of the dump.

~Maarten
