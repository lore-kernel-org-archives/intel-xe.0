Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF63BEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 09:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E96A10E345;
	Tue, 11 Jul 2023 09:16:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C1810E345
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689066959; x=1720602959;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pig1Da1d4FtjP1MAqGLItJslSQ7XsIR6N3qyoACYgmo=;
 b=REkYYYW6HdTeXFHwk/rWYU7r1pNbCg7apo+TR+7bnGYNKLNbYq/3YPLR
 CeQ2s/FDiVKQv/2m55hYjAI2BA5sWcjPbhBE0qsZxNC3or/ZfWQVRsi25
 7l+KhYoY9jeAZItGLG4a5xvEaJPa99yggGnwlmx/Nq4KQ9bUiIf3KPqBd
 LLFIGoh41M9kYxDx5DrTHIP3hAjeW33Ztw3O+zvLJAKtidO/ELqTHhhma
 QTZo78SFdc3XAWoluyutZPtl9MvSR5ddM00oupVTKqLiJBvjsFFlTeyAc
 Eyg9OULDQK97uzdfLjccQyhz9+oEep+ZblR9zb+dMO6jkk4CfJa3YyyW3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354430768"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="354430768"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724366426"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="724366426"
Received: from dmendyk-mobl2.ger.corp.intel.com (HELO [10.252.12.20])
 ([10.252.12.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:15:57 -0700
Message-ID: <5eaabf49-5b51-2673-062c-c730552eedd5@intel.com>
Date: Tue, 11 Jul 2023 10:15:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Ofir Bitton <obitton@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230626172039.88635-2-matthew.auld@intel.com>
 <ab5e9528-08ba-7615-d4a1-e80bf14a06f9@habana.ai>
 <d9952f9a-f1f5-8c63-7de4-43eed5e8f351@intel.com>
 <28eb17a2-a6ab-887b-9499-44628bcaefaf@habana.ai>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <28eb17a2-a6ab-887b-9499-44628bcaefaf@habana.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/mmio: update gt_count when probing
 multi-tile
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/07/2023 07:54, Ofir Bitton wrote:
> On 05/07/2023 13:19, Matthew Auld wrote:
>> Hi,
>>
>> On 05/07/2023 10:50, Ofir Bitton wrote:
>>> On 26/06/2023 20:20, Matthew Auld wrote:
>>>> It looks like the single-tile PVC in CI dies during module load when
>>>> doing
>>>> the pcode init. From the logs we try to access the address
>>>> 0000000000138124 which doesn't map to anything, however 0x138124 also
>>>> looks to be the PCODE_MAILBOX register. So looks like the per-tile
>>>> mmio register mapping is NULL.
>>>>
>>>> During probe the tile count is potentially trimmed, since we don't know
>>>> the real count until we actually probe the device. This seems to be
>>>> the case for single-tile PVC or similar devices.  However it looks like
>>>> the gt_count is never adjusted to respect this updated tile count. As a
>>>> result when later doing some for_each_gt() loop, like we do for the
>>>> pcode, we can get back some GT that maps to some non-existent tile
>>>> which hasn't been properly set up, leading to crashes.
>>>>
>>>> Try to fix this by adjusting the gt_count after probing the tiles for
>>>> real.
>>>>
>>>> v2: Fix typo so it actually builds
>>>>
>>>> Closes:
>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/383
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> ---
>>>>     drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
>>>>     1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>>> index f1336803b915..8150bf6f3578 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>> @@ -334,6 +334,12 @@ static void xe_mmio_probe_tiles(struct xe_device
>>>> *xe)
>>>>         adj_tile_count = xe->info.tile_count =
>>>>                 REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>>>>
>>>> +     /*
>>>> +      * FIXME: Needs some work for standalone media, but should be
>>>> impossible
>>>> +      * with multi-tile for now.
>>>> +      */
>>>> +     xe->info.gt_count = xe->info.tile_count;
>>>> +
>>>>         drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
>>>>                  xe->info.tile_count, adj_tile_count);
>>>>
>>>
>>> 'xe->info.gt_count' is getting incremented in 'xe_info_init' during
>>> probe, seems you must remove it from there, or else 'gt_count' will
>>> eventually be equal to x2 of the desired value.
>>
>> xe_info_init() looks to be called first. But this is very early during
>> probe and might not accurately represent the actual HW, so some of it
>> appears to be "placeholder" only, like with tile_count. Once we
>> eventually initialise enough of the MMIO stuff, we can actually probe
>> the HW to figure out the real number of tiles, as per
>> xe_mmio_probe_tiles() here. At this stage we might need to update
>> tile_count, but we missed also updating the gt_count, leading to
>> explosions if the real vs placeholder tile_count is ever different.
>>
> 
> I see, so do you see any reason to keep 'xe->info.gt_count'
> initialization in 'xe_info_init'? anyway you set it here and it is not
> used in between.

AFAICT xe_info_init() turns the static description (graphics_desc + 
media_desc) of the platform into an xe_info struct, which gets handed to 
the next phase of driver load, and in the case of tile_count it is just 
a placeholder since that information is not static. There looks to be 
various things like media_desc which can also influence the number of 
GTs. I'm not sure where that should instead be handled?

One idea is to very carefully probe the tile_count during 
xe_info_init(), sort of how handle_gmdid() does things. But I'm not 
certain if we are even allowed to do that this early.

Adjusting gt_count when we later adjust tile_count looked to be the 
minimal fix here, but happy to try to some other ideas.

> 
>>>
>>> --
>>> Ofir
> 
