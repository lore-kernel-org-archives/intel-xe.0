Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248B1C61DF7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 14:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E5110E765;
	Thu, 23 Nov 2023 14:32:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A1710E765
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 14:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700749952; x=1732285952;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cDpkkA4jhc5Lwgnt+5YpGugtJ0wm/92bIJ/pZ03cARE=;
 b=I6sgXaZ+xg4uA2xCx0NwBs6EFGeB21lhr5QrNCEHHtx7ZWmHUv7q7Gbw
 koeZva+ZJKc269L0+W+12NcXCOEPAXXwgvz/FF5XTn/L8292mAC9mfy4o
 joji7dny04Uc/7LNNCeXxYoZW/VptLDdFOZ8bKWv0d8gUhJY8wwE7c8so
 lETYLYs9bhFgZ9Jhf01t5BoNuYB88bq4wAu14MGlUZyBGTGdl6iAQKEWH
 nn8j0C722At3DRb+5S2+rI3PC+chjpDabgyn0garGBgrQdXHqpkT0aD6Y
 /o/RsaFgW8NCEHzYL+dzNvPBeL8REqF7hHCu91gEPnlHUY1ceBfsoA3Wg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391153077"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="391153077"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 06:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767217319"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="767217319"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO [10.249.254.177])
 ([10.249.254.177])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 06:32:30 -0800
Message-ID: <5f627133-2312-fe24-2ebe-e3aa05387f3f@linux.intel.com>
Date: Thu, 23 Nov 2023 15:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Ohad Sharabi <osharabi@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-2-thomas.hellstrom@linux.intel.com>
 <34f31f28-9095-e802-4243-e77eedb63cfc@habana.ai>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <34f31f28-9095-e802-4243-e77eedb63cfc@habana.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Ensure that we don't access the
 placements array out-of-bounds
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

Hi, Ohad.

On 11/22/23 18:18, Ohad Sharabi wrote:
> On 22/11/2023 13:03, Thomas Hellström wrote:
>> Ensure, using xe_assert that the various try_add_<placement> functions
>> don't access the bo placements array out-of-bounds.
>>
>> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Ohad Sharabi<osharabi@habana.ai>

Thanks for reviewing. I'll make a v2 of this patch according to Matthew 
Auld's suggestion.

/Thomas


>
>> ---
>>    drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++----
>>    1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 4305f5cbc2ab..915910b87faa 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -121,9 +121,11 @@ static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
>>        return to_xe_ttm_vram_mgr(mgr)->vram;
>>    }
>>
>> -static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>> -                        u32 bo_flags, u32 *c)
>> +static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>> +                        struct ttm_place *places, u32 bo_flags, u32 *c)
>>    {
>> +     xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
>> +
>>        if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
>>                places[*c] = (struct ttm_place) {
>>                        .mem_type = XE_PL_TT,
>> @@ -172,6 +174,8 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>>    static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>>                         struct ttm_place *places, u32 bo_flags, u32 *c)
>>    {
>> +     xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
>> +
>>        if (bo->props.preferred_gt == XE_GT1) {
>>                if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
>>                        add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
>> @@ -188,6 +192,8 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>>    static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
>>                           struct ttm_place *places, u32 bo_flags, u32 *c)
>>    {
>> +     xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
>> +
>>        if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
>>                places[*c] = (struct ttm_place) {
>>                        .mem_type = XE_PL_STOLEN,
>> @@ -210,11 +216,11 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>>        /* The order of placements should indicate preferred location */
>>
>>        if (bo->props.preferred_mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM) {
>> -             try_add_system(bo, places, bo_flags, &c);
>> +             try_add_system(xe, bo, places, bo_flags, &c);
>>                try_add_vram(xe, bo, places, bo_flags, &c);
>>        } else {
>>                try_add_vram(xe, bo, places, bo_flags, &c);
>> -             try_add_system(bo, places, bo_flags, &c);
>> +             try_add_system(xe, bo, places, bo_flags, &c);
>>        }
>>        try_add_stolen(xe, bo, places, bo_flags, &c);
>>
