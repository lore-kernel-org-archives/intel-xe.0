Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2DBC61DF7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 14:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D6510E084;
	Thu, 23 Nov 2023 14:30:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A9E10E765
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700749853; x=1732285853;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=usfGvcukFNwH/sY8qtHsYAHKZfWJX9z+qIVxPlLfDUc=;
 b=TkRcTARNO/bLcd8HjaLoOlxc0xABKcTAbId22+6jh6n+shapEl2YgkcJ
 KpDknSkfZkqLMGXgYkQgylgxVT50L2AAfLEVwsv2kxwRYT2yqAwRqs4mW
 Yn2DMcKfmPZUwazseVMkGpgM9GdNVHRB+bgB1nPYZaIb24NF93GVZKZ+W
 P23CPQyWqSXgXvSVbQSGYy09LcsKcE82UdeiEgtsiH0rEq5sXZdOh2hg7
 2SNxrtQ+vEqljQ2ngZJZ4DxQEduZwBvCDjy+4ICp7LIW7prCOfxKKk6hQ
 85rd+ef/1fCGcSTOFqlhIwCkpOVOGBQPn01Tt3FufP2+uHa14w6Huu7kV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391152813"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="391152813"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 06:30:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767217280"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="767217280"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO [10.249.254.177])
 ([10.249.254.177])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 06:30:51 -0800
Message-ID: <4d062532-0b08-7008-596d-1d87576c2f34@linux.intel.com>
Date: Thu, 23 Nov 2023 15:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-2-thomas.hellstrom@linux.intel.com>
 <CAM0jSHM9-mVYUh00gWKcdaQVuLzESwpY+OKrg_t=O92xcg4wCQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAM0jSHM9-mVYUh00gWKcdaQVuLzESwpY+OKrg_t=O92xcg4wCQ@mail.gmail.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Matthew, Thanks for reviewing.

On 11/22/23 13:20, Matthew Auld wrote:
> On Wed, 22 Nov 2023 at 11:04, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> Ensure, using xe_assert that the various try_add_<placement> functions
>> don't access the bo placements array out-of-bounds.
>>
>> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 4305f5cbc2ab..915910b87faa 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -121,9 +121,11 @@ static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
>>          return to_xe_ttm_vram_mgr(mgr)->vram;
>>   }
>>
>> -static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>> -                          u32 bo_flags, u32 *c)
>> +static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>> +                          struct ttm_place *places, u32 bo_flags, u32 *c)
>>   {
>> +       xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> Should we also refer to bo->placements directly, and drop the places argument?
Yeah, good point. I'll make a v2.
>
> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

/Thomas


>
>> +
>>          if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
>>                  places[*c] = (struct ttm_place) {
>>                          .mem_type = XE_PL_TT,
>> @@ -172,6 +174,8 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>>   static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>>                           struct ttm_place *places, u32 bo_flags, u32 *c)
>>   {
>> +       xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
>> +
>>          if (bo->props.preferred_gt == XE_GT1) {
>>                  if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
>>                          add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
>> @@ -188,6 +192,8 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>>   static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
>>                             struct ttm_place *places, u32 bo_flags, u32 *c)
>>   {
>> +       xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
>> +
>>          if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
>>                  places[*c] = (struct ttm_place) {
>>                          .mem_type = XE_PL_STOLEN,
>> @@ -210,11 +216,11 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>>          /* The order of placements should indicate preferred location */
>>
>>          if (bo->props.preferred_mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM) {
>> -               try_add_system(bo, places, bo_flags, &c);
>> +               try_add_system(xe, bo, places, bo_flags, &c);
>>                  try_add_vram(xe, bo, places, bo_flags, &c);
>>          } else {
>>                  try_add_vram(xe, bo, places, bo_flags, &c);
>> -               try_add_system(bo, places, bo_flags, &c);
>> +               try_add_system(xe, bo, places, bo_flags, &c);
>>          }
>>          try_add_stolen(xe, bo, places, bo_flags, &c);
>>
>> --
>> 2.41.0
>>
