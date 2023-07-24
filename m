Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AE4C0015E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 15:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D229210E336;
	Mon, 24 Jul 2023 15:50:01 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A68910E336
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690213800; x=1721749800;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8YNRlTG17gc2pjb+h7phCLf4PXXP9V9JIPVP85xRR3g=;
 b=du62gSRs67wZQXpv1BxpTZ6ORgJr3WV33bUxiQWh7Xl9Il5XURXB3xLM
 TKAbWA4jTpvmXWgbv6jEcTd8AlFD0HCmayfG/aAngj5SFCuAjuGGR36qD
 65YiNArfHtAv7sGF1MVgpVwGG2kleA43cqTpXMYfdWhYbPCtBsGFYufJo
 uf9ErzIh7f3wnoAeKxoTjY8pVBfTgLAeuBeLoMEn2moodCaH6ENIq0H0w
 rQrF64qOmGL3Bzqx5BdP5M30ZTdkD4q1MFFajLwDSY+zBWtS163O5/89C
 lYF08rca6N0xSPiDtEpaBT/7CxSY/N8nSVJalxWtErz189vNTEGzTz+36 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="433719227"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="433719227"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 08:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="795823410"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="795823410"
Received: from dmansoco-mobl.ger.corp.intel.com (HELO [10.252.14.189])
 ([10.252.14.189])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 08:49:57 -0700
Message-ID: <d93c096b-90f9-f6ce-b8a5-a5638cb4c401@intel.com>
Date: Mon, 24 Jul 2023 16:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20230721175557.1513250-3-matthew.d.roper@intel.com>
 <t4z4llhy4g2kqz45utcucexv6hzh2gc6ktrndxjsgevi7fgmhz@e2euksrkr7i2>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <t4z4llhy4g2kqz45utcucexv6hzh2gc6ktrndxjsgevi7fgmhz@e2euksrkr7i2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/mtl: Map PPGTT as CPU:WC
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

On 21/07/2023 21:54, Lucas De Marchi wrote:
> On Fri, Jul 21, 2023 at 10:55:58AM -0700, Matt Roper wrote:
>> On MTL and beyond, the GPU performs non-coherent accesses to the PPGTT
>> page tables.  These page tables should be mapped as CPU:WC.
>>
>> Removes CAT errors triggered by xe_exec_basic@once-basic on MTL:
>>
>>   xe 0000:00:02.0: [drm:__xe_pt_bind_vma [xe]] Preparing bind, with 
>> range [1a0000...1a0fff) engine 0000000000000000.
>>   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]] 1 entries to update
>>   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]]  0: Update level 
>> 3 at (0 + 1) [0...8000000000) f:0
>>   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
>>   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
>>   xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, 
>> flags=0x4
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_bo.c | 17 +++++++++++++----
>> drivers/gpu/drm/xe/xe_bo.h |  1 +
>> drivers/gpu/drm/xe/xe_pt.c |  3 ++-
>> 3 files changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 828a9fea420b..d04538e65f11 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -301,6 +301,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct 
>> ttm_buffer_object *ttm_bo,
>>     struct xe_device *xe = xe_bo_device(bo);
>>     struct xe_ttm_tt *tt;
>>     unsigned long extra_pages;
>> +    enum ttm_caching caching = ttm_cached;
>>     int err;
>>
>>     tt = kzalloc(sizeof(*tt), GFP_KERNEL);
>> @@ -314,10 +315,18 @@ static struct ttm_tt *xe_ttm_tt_create(struct 
>> ttm_buffer_object *ttm_bo,
>>         extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>>                        PAGE_SIZE);
>>
>> -    /* TODO: Select caching mode */
>> -    err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
>> -              bo->flags & XE_BO_SCANOUT_BIT ? ttm_write_combined : 
>> ttm_cached,
>> -              extra_pages);
>> +    /*
>> +     * Display scanout is always non-coherent with the CPU cache.
>> +     *
>> +     * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent 
>> and
>> +     * require a CPU:WC mapping.
>> +     *
>> +     */
>> +    if (bo->flags & XE_BO_SCANOUT_BIT ||
>> +        (xe->info.graphics_verx100 >= 1270 && bo->flags & 
>> XE_BO_PPGTT_BIT))
>> +        caching = ttm_write_combined;
>> +
>> +    err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, 
>> extra_pages);
>>     if (err) {
>>         kfree(tt);
>>         return NULL;
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 72c68facd481..fd103b64f446 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -31,6 +31,7 @@
>> #define XE_BO_DEFER_BACKING        BIT(9)
>> #define XE_BO_SCANOUT_BIT        BIT(10)
>> #define XE_BO_FIXED_PLACEMENT_BIT    BIT(11)
>> +#define XE_BO_PPGTT_BIT            BIT(12)
> 
> we have XE_BO_CREATE_GGTT_BIT. To make name consistent and close to a
> similar flag, this should probably be
> 
> #define XE_BO_CREATE_PPGTT_BIT        BIT(6)
> 
> While at it, let's remove the _BIT that is agains our naming
> convention.
> 
> Although here I think what we actually need is the XE_BO_NEEDS_CPU_ACCESS
> from Matt Auld's  series. Cc'ing him.

Do you mean make it conditional on XE_BO_NEEDS_CPU_ACCESS && 
XE_BO_CREATE_PPGTT_BIT, or what did you have in mind here?

> 
> Lucas De Marchi
> 
>> /* this one is trigger internally only */
>> #define XE_BO_INTERNAL_TEST        BIT(30)
>> #define XE_BO_INTERNAL_64K        BIT(31)
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index a458224a88ca..fe91b10f951e 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -221,7 +221,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, 
>> struct xe_tile *tile,
>>                   XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>                   XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
>>                   XE_BO_CREATE_PINNED_BIT |
>> -                  XE_BO_CREATE_NO_RESV_EVICT);
>> +                  XE_BO_CREATE_NO_RESV_EVICT |
>> +                  XE_BO_PPGTT_BIT);
>>     if (IS_ERR(bo)) {
>>         err = PTR_ERR(bo);
>>         goto err_kfree;
>> -- 
>> 2.41.0
>>
