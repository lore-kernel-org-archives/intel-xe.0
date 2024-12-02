Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC9CD78336
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 16:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1686F10E7BB;
	Mon,  2 Dec 2024 16:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zp6Nf7Tt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D45510E7BB
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733156930; x=1764692930;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3oIE5XBW26oRog8Lj0vQ+BFKlk+v9q8gkLJS1Pzafhc=;
 b=Zp6Nf7Tt0YdOS0lp6+swlHxdCklcPmTRyN111Xu4e8Zac/yk9ivVMmMM
 WO1ABBNbap7sHiL+On8WSEqISGjFVTm35qV5ZpQQYDyNam0ty5kJUtP7R
 EL/eSufoGBc81yZX5HjULxYgZ1UJrtivcht3v2275+egg1tEF0iMYMYVY
 MGzBnyaPaau3dr5aR1FJGnrzHdH0Gob9Wgf1BCBs3/5wLdqNLrkpGquEJ
 24yOZq/BxNl8325H6+TFlb/+CKdNfznYFz7wsVmC+0IjHjLIN9cV0i+Hq
 O0jtMKElxxTzba9TnlEj1qUR2u5rHKydVqKR+OYLNxgBpwrI91eZEKo6o w==;
X-CSE-ConnectionGUID: pMDBf4klT7m24BGVgeOcQQ==
X-CSE-MsgGUID: nSkB+eJnQuWSOtDP8hvpog==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43816651"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="43816651"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 08:28:49 -0800
X-CSE-ConnectionGUID: 5J5LLFTXQ2i5V6UkGpMNBA==
X-CSE-MsgGUID: HY8ltekMQpi3PeRwdQITlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="93053645"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.79])
 ([10.245.244.79])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 08:28:48 -0800
Message-ID: <602c7ab7-cab9-4790-a67c-306b23a75f23@intel.com>
Date: Mon, 2 Dec 2024 16:28:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: fix ttm_bo_access() usage
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20241202154123.76887-2-matthew.auld@intel.com>
 <a758f27d283bc3aff6aeca05c6002d2d5233ec78.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <a758f27d283bc3aff6aeca05c6002d2d5233ec78.camel@linux.intel.com>
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

On 02/12/2024 15:56, Thomas Hellström wrote:
> On Mon, 2024-12-02 at 15:41 +0000, Matthew Auld wrote:
>> ttm_bo_access() returns the size on success. Account for that
>> otherwise
>> the caller incorrectly thinks this is an error in
>> intel_atomic_prepare_plane_clear_colors().
>>
>> Fixes: b6308aaa24a7 ("drm/xe/display: Update intel_bo_read_from_page
>> to use ttm_bo_access")
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3661
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/intel_bo.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c
>> b/drivers/gpu/drm/xe/display/intel_bo.c
>> index 43141964f6f2..b2a8d06cc78a 100644
>> --- a/drivers/gpu/drm/xe/display/intel_bo.c
>> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
>> @@ -40,8 +40,13 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj,
>> struct vm_area_struct *vma)
>>   int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset,
>> void *dst, int size)
>>   {
>>   	struct xe_bo *bo = gem_to_xe_bo(obj);
>> +	int ret;
>>   
>> -	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
>> +	ret = ttm_bo_access(&bo->ttm, offset, dst, size, 0);
>> +	if (ret == size)
>> +		ret = 0;
>> +
>> +	return ret;
>>   }
>>   
> 
> Looking at how callers are using struct vm_operations_struct::access()
> it looks possible that 0 <= ret < size, indicating the number of bytes
> actually processed.
> 
> Now since ttm_bo_access() is actually a helper to implement the above,
> we strictly don't have to follow that for its interface, but I think it
> makes sense to assert that ret is either == size or something negative.
> Ideas?

hmm, what about if we add something like:

+int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
+{
+       int ret;
+
+       ret = ttm_bo_access(&bo->ttm, offset, dst, size, 0);
+       if (!(ret < 0) && ret != size)
+               ret = -EIO;
+       else if (!(ret < 0))
+               ret = 0;
+
+       return ret;
+}

And then both callers use that?

> 
> /Thomas
> 
> 
> 
>>   struct intel_frontbuffer *intel_bo_get_frontbuffer(struct
>> drm_gem_object *obj)
> 

