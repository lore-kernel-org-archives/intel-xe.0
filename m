Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EFCC369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 10:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAC310E54E;
	Mon, 14 Apr 2025 10:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQPNF8CK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB4810E54E
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744626735; x=1776162735;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=18Cg1WHHu6eEDIqAYNZZgkYBhecE3eCAc3s0jUR5mOM=;
 b=WQPNF8CK/VM+Pul3MaHxTFcHYhE1hnFa747qEZNYykmLPP5qHMblwUt7
 a9NpSksUYILUvU8vO0S/Ozu52o5rAmk27tQOLwjoPBBqZ7Vf5guw22fhZ
 CcXT9Tj6PnANiUOoQFV5OJyqHnctxp1lt4ejNMJfqww2VHL3OshBzpf/A
 usR64G+rm9LUSdXJRbYvLO/pkYjM6+4+NTVNxcbd0/aYX3Itn0GAFYzb1
 FKPk9M4Fj4WOFEYb24keOCqaOLPzw7fRf7htC7FN3ata65K4/+Irl3qZ8
 Q87Ae4+d6Lm+8mfetBJGgC6yTlh5JZfRyuwkNXYcfR8zw1EoBf7MMhQLx A==;
X-CSE-ConnectionGUID: hSDWdHX6Qw2fUlEvJzjXUg==
X-CSE-MsgGUID: ZIMjaZBMRU678JMV3pzhog==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45797914"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45797914"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:32:14 -0700
X-CSE-ConnectionGUID: 7OLBh26DTnaTvHndfxdgjg==
X-CSE-MsgGUID: YR3orTduTda3HjPHFa7ipA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134834372"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.253])
 ([10.245.244.253])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:32:13 -0700
Message-ID: <31710fae-5e44-44e4-94e4-e06b2410e639@intel.com>
Date: Mon, 14 Apr 2025 11:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: share bo dma-resv with backup object
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250410162016.158474-5-matthew.auld@intel.com>
 <20250410162016.158474-7-matthew.auld@intel.com>
 <93df6de4ea8945ed0aeafb001f55d04b9e62d211.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <93df6de4ea8945ed0aeafb001f55d04b9e62d211.camel@linux.intel.com>
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

Hi,

On 11/04/2025 16:12, Thomas Hellström wrote:
> On Thu, 2025-04-10 at 17:20 +0100, Matthew Auld wrote:
>> We end up needing to grab both locks together anyway and keep them
>> held
>> until we complete the copy or add the fence. Plus the backup_obj is
>> short lived and tied to the parent object, so seems reasonable to
>> share
>> the same dma-resv. This will simplify the locking here, and in follow
>> up patches.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Is there any chance that the bo dma-resv is freed before the backup
> object's resv is individualized?
> 
> If not, perhaps a short description why that can never happen?

Thanks for reviewing. My thinking was that there should be one reference 
on the backup bo, which is either dropped by the parent bo when calling 
the unpin or the unprepare step, whoever gets there first. In both cases 
there will still be a ref to the parent when we drop the backup ref. The 
individualize step looks to be synchronous in ttm so it should happen 
within the scope of holding the parent lock so parent bo can't disappear.

But as you say maybe this is inviting trouble later, if there is some 
hypothetical way for something to grab an extra ref on the backup bo. 
What about if in addition we also hold a ref to the parent bo, which is 
then dropped after the individualize step:

https://gitlab.freedesktop.org/mwa/kernel/-/commit/3b72a079a1cd9da9590da82912798785ede8c97f

> 
> /Thomas
> 
> 
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 24 +++++++++---------------
>>   1 file changed, 9 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index c337790c81ae..3eab6352d9dc 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1120,9 +1120,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>>   	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
>>   		goto out_unlock_bo;
>>   
>> -	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size,
>> ttm_bo_type_kernel,
>> -				     XE_BO_FLAG_SYSTEM |
>> XE_BO_FLAG_NEEDS_CPU_ACCESS |
>> -				     XE_BO_FLAG_PINNED);
>> +	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo-
>>> ttm.base.resv, NULL, bo->size,
>> +					DRM_XE_GEM_CPU_CACHING_WB,
>> ttm_bo_type_kernel,
>> +					XE_BO_FLAG_SYSTEM |
>> XE_BO_FLAG_NEEDS_CPU_ACCESS |
>> +					XE_BO_FLAG_PINNED);
>>   	if (IS_ERR(backup)) {
>>   		ret = PTR_ERR(backup);
>>   		goto out_unlock_bo;
>> @@ -1177,7 +1178,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>>   
>>   out_backup:
>>   	xe_bo_vunmap(backup);
>> -	xe_bo_unlock(backup);
>>   	if (ret)
>>   		xe_bo_put(backup);
>>   out_unlock_bo:
>> @@ -1212,17 +1212,12 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>>   	if (!backup)
>>   		return 0;
>>   
>> -	xe_bo_lock(backup, false);
>> +	xe_bo_lock(bo, false);
>>   
>>   	ret = ttm_bo_validate(&backup->ttm, &backup->placement,
>> &ctx);
>>   	if (ret)
>>   		goto out_backup;
>>   
>> -	if (WARN_ON(!dma_resv_trylock(bo->ttm.base.resv))) {
>> -		ret = -EBUSY;
>> -		goto out_backup;
>> -	}
>> -
>>   	if (xe_bo_is_user(bo) || (bo->flags &
>> XE_BO_FLAG_PINNED_LATE_RESTORE)) {
>>   		struct xe_migrate *migrate;
>>   		struct dma_fence *fence;
>> @@ -1271,15 +1266,14 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>>   
>>   	bo->backup_obj = NULL;
>>   
>> +out_backup:
>> +	xe_bo_vunmap(backup);
>> +	if (!bo->backup_obj)
>> +		xe_bo_put(backup);
>>   out_unlock_bo:
>>   	if (unmap)
>>   		xe_bo_vunmap(bo);
>>   	xe_bo_unlock(bo);
>> -out_backup:
>> -	xe_bo_vunmap(backup);
>> -	xe_bo_unlock(backup);
>> -	if (!bo->backup_obj)
>> -		xe_bo_put(backup);
>>   	return ret;
>>   }
>>   
> 

