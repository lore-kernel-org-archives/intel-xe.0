Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F31C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 10:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F80910E5AF;
	Wed, 15 Jan 2025 10:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bigUQgek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0686910E5AF
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736936363; x=1768472363;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sq8QktMXZCBEenEKnNhfbUJnGaxQQoxK8PiGUwzgKbQ=;
 b=bigUQgekevHPncHwRvv4E0Cxp7FFbnkOXd2C/+AOD/A31dKakTEhKaj8
 aJChMeIqPpa1Hth3Dq1GSui5/ghL546Dy/r3pLXoLxSJh+i1tEzZ++KbT
 YyrmNkKKjv/1a6hw5kV48JhC90YKMxydePUUwB/HLP0Jq+nLHR7qmeVjh
 IlfooRPtkcV38zeb6ePYlhCoRC8zW/eC1hLwTA5c63V/3eiYoqm9XDkgw
 INTSCOK3VrYIczfjBug4hrAV5/YXdsI60xE4mDSCTeWfs78HWplke3f6X
 /8muIMT2iNsBt0klY0OsJi3YU5bbahVCrSmoHx/Ae6bpt+L2acohfig3g w==;
X-CSE-ConnectionGUID: da4/GcfvTt+8tLfMQfvLQQ==
X-CSE-MsgGUID: ClyRCKqgQeSWs59AhU1ouQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37180821"
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; d="scan'208";a="37180821"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 02:19:23 -0800
X-CSE-ConnectionGUID: r4Vq3Xq0Sq2mSLuj1UqV8A==
X-CSE-MsgGUID: QJi9/REtS9+J0iq4Ls0U7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; d="scan'208";a="104846522"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.166])
 ([10.245.244.166])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 02:19:21 -0800
Message-ID: <4edb736f-907c-4506-ae77-739d3aa377aa@linux.intel.com>
Date: Wed, 15 Jan 2025 11:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <CH0PR11MB5444F77CC2DE257A7BA51E1DE5182@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CH0PR11MB5444F77CC2DE257A7BA51E1DE5182@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



Den 2025-01-14 kl. 20:22, skrev Cavitt, Jonathan:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juha-Pekka Heikkila
> Sent: Tuesday, January 14, 2025 10:04 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Subject: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
>>
>> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
>> This also fixes bug where dpt could have been allocated from system
>> memory when on dgfx.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
>>   1 file changed, 43 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 9fa51b84737c..c28885316986 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>>   	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>   }
>>   
>> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
>> +				     struct xe_tile *tile0, u64 size,
>> +				     u64 physical_alignment)
>> +{
>> +	struct xe_bo *dpt;
>> +
>> +	/*
>> +	 * If DGFX: try VRAM0 only
>> +	 */
>> +	if (IS_DGFX(xe)) {
>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> +						      size, ~0ull,
>> +						      ttm_bo_type_kernel,
>> +						      XE_BO_FLAG_VRAM0 |
>> +						      XE_BO_FLAG_GGTT |
>> +						      XE_BO_FLAG_PAGETABLE,
>> +						      physical_alignment);
>> +	} else {
>> +		/*
>> +		 * For IGFX: first try STOLEN. on fail try SYSTEM.
>> +		 */
>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> +						      size, ~0ull,
>> +						      ttm_bo_type_kernel,
>> +						      XE_BO_FLAG_STOLEN |
>> +						      XE_BO_FLAG_GGTT |
>> +						      XE_BO_FLAG_PAGETABLE,
>> +						      physical_alignment);
>> +		if (IS_ERR(dpt)) {
>> +			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> +							      size, ~0ull,
>> +							      ttm_bo_type_kernel,
>> +							      XE_BO_FLAG_SYSTEM |
>> +							      XE_BO_FLAG_GGTT |
>> +							      XE_BO_FLAG_PAGETABLE,
>> +							      physical_alignment);
>> +		}
>> +	}
>> +	return dpt;
> 
> We might be able to collapse some of this logic by storing the flags separately:
> 
> """
> static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
> 				     struct xe_tile *tile0, u64 size,
> 				     u64 physical_alignment)
> {
> 	struct xe_bo *dpt;
> 	u32 base_flags = XE_BO_FLAG_GGTT | XE_BO_FLAG_PAGETABLE;
> 	u32 flags = base_flags;
> 
> 	/*
> 	 * If DGFX: try VRAM0.
> 	 * If IGFX: try STOLEN.
> 	 */
> 	flags |= IS_DGFX(xe) ? XE_BO_FLAG_VRAM0 : XE_BO_FLAG_STOLEN;
> 
> 	dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL, size,
> 					      ~0ull, ttm_bo_type_kernel,
> 					      flags, physical_alignment);
> 
> 	/*
> 	 * For IGFX, we first try STOLEN, and on a failure we try SYSTEM.
> 	 * DGFX should only attempt VRAM0
> 	 */
> 	if (IS_DGFX(xe) && IS_ERR(dpt))
> 		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> 						      size, ~0ull,
> 						      ttm_bo_type_kernel,
> 						      base_flags |
> 						      XE_BO_FLAG_SYSTEM,
> 						      physical_alignment);
> 	return dpt;
> }
> """
> This isn't a particularly necessary compression, but it might be worth considering.
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>Except that fails on both integrated and discrete, due to IS_DGFX() used 
wrongly here. ;-)

Every change, no matter how small, has the opportunity to break things.

Regardless, for both patches:
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Cheers,
~Maarten
