Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5EFC77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 15:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C8910E040;
	Thu, 11 May 2023 15:34:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D33C10E040
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683819290; x=1715355290;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ft1wnayW+aRykoImMhi7i3KHPe/4VVlc/Pz4OHR3vjc=;
 b=A+ojiIR/Ui0wkcCDST+LuLu2nwDd1aerBZl0iEcn+VGgF8PET01uA/ka
 0/SK1pr0Ap2Ob4qO3AXOzuKlA53E9Uy+IgKAemN25fjkLM+mFAwW98dyA
 fVpO5s4viScjlNT1f7V6a1idZ38aqaBcKY3tv//NPOcI+lIIyYT4z9GJa
 jlK8fkcqiCa2l8IUQ4sIZKKbvHRDZgdWi0UFxjAjcNF0JwfjpgAMjaFvg
 3RtX9yRQJ5hmM31xUDjvPBpucf85MYXT6ar77lQKruBI4/e38+IdAu1RT
 0Omkpd6j1wcQj3xHXB6QH8W3HJnWnUvET9lxkcoKRqmuRZFz5KFIgOI5L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="339833980"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="339833980"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 08:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824004940"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="824004940"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 08:34:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
In-Reply-To: <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
 <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
Date: Thu, 11 May 2023 18:34:46 +0300
Message-ID: <87cz36lw4p.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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

On Thu, 11 May 2023, "Souza, Jose" <jose.souza@intel.com> wrote:
> On Wed, 2023-05-10 at 12:54 -0700, Lucas De Marchi wrote:
>> Stop the dance of enabling the display-related driver_features to later
>> disable them on display info init if the platform doesn't have display
>> IP. Besides being needless work, it wasn't covering the ATS-M case that
>> is the same platform as DG2, but without display.
>
> Xe should set pipe_mask = 0 and call i915 functions that will handle no display cases.
> Also intel_device_info_runtime_init() needs to be called earlier, as pipes could be fused off and there is a case for discrete platforms with display
>>= 14 that can have display fused off too.

Agreed, seems like this duplicates HAS_DISPLAY() which operates on
pipe_mask, and takes fusing into account.

BR,
Jani.

>
>> 
>> Since now the display is created after the complete device info is
>> populated, the new has_display flag can be consider to enable it.
>> 
>> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/265
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c  | 1 -
>>  drivers/gpu/drm/xe/xe_display.c | 6 ++++--
>>  drivers/gpu/drm/xe/xe_pci.c     | 6 +++++-
>>  3 files changed, 9 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 32cc83c43b2a..1daacc533083 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -192,7 +192,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  	xe->info.devid = pdev->device;
>>  	xe->info.revid = pdev->revision;
>>  	xe->info.enable_guc = enable_guc;
>> -	xe->info.enable_display = enable_display;
>>  
>>  	spin_lock_init(&xe->irq.lock);
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index 77a158ecf4cb..43c5af1ff80e 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -487,8 +487,10 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>>  
>>  void xe_display_info_init(struct xe_device *xe)
>>  {
>> -	if (!xe->info.enable_display)
>> +	if (!xe->info.enable_display) {
>> +		unset_driver_hooks(xe);
>>  		return;
>> +	}
>>  
>>  	switch (xe->info.platform) {
>>  	case XE_TIGERLAKE:
>> @@ -535,7 +537,7 @@ void xe_display_info_init(struct xe_device *xe)
>>  		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
>>  		break;
>>  	default:
>> -		drm_dbg(&xe->drm, "No display IP, skipping\n");
>> +		drm_warn(&xe->drm, "Unknown display IP\n");
>>  		xe->info.enable_display = false;
>>  		unset_driver_hooks(xe);
>>  		return;
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 7dfbc4fa138a..3fa3e8706d98 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -529,6 +529,9 @@ static int xe_info_init(struct xe_device *xe,
>>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>>  	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>>  
>> +	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_DISPLAY) && \
>> +				  enable_display && \
>> +				  desc->has_display;
>>  	/*
>>  	 * All platforms have at least one primary GT.  Any platform with media
>>  	 * version 13 or higher has an additional dedicated media GT.  And
>> @@ -629,7 +632,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  
>>  	xe_display_info_init(xe);
>>  
>> -	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
>> +	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d",
>>  		desc->platform_name,
>>  		subplatform_desc ? subplatform_desc->name : "",
>>  		xe->info.devid, xe->info.revid,
>> @@ -640,6 +643,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		xe->info.media_name,
>>  		xe->info.media_verx100 / 100,
>>  		xe->info.media_verx100 % 100,
>> +		str_yes_no(xe->info.enable_display),
>>  		xe->info.dma_mask_size, xe->info.tile_count);
>>  
>>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>

-- 
Jani Nikula, Intel Open Source Graphics Center
