Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BF0C6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 09:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F0D10E124;
	Wed, 30 Aug 2023 09:34:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C131C10E124
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693388090; x=1724924090;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rx16sZcYYW0fiQ7yO5WZGt2O4MY+bLSzibat+PwVu7E=;
 b=ADIawGXO14lTsaxXouXKv5mEUfX3s58rU4GHqRGta0tQOZYe1rSYgJ59
 3N4xBDv8BdH6pP3FDVKExmF1t+zgOFTk/qd7b+vIyEgTzp/qLYZ8yj6Lu
 zAT98m8SYLpPH4GoFAZErT+3jvSq3qkR/AMWoDQWqekjTC5MnH0OXN0eT
 iwG1OIVciP+8cf9h3gkpa5nXBdk6rJrSwE/bOMvHAl89nHFOpHo4VtdAu
 +Hi4v5izIlpKcZl856SroMLpNhEXsYwlZ0Tk46a/RBJdDgg7lssCalL2X
 /hpbSWl4uIawIZ5XpNa9TyAA78HaskHF6vv/i9auil5meZEXiN1tcp/QA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441958911"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="441958911"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 02:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="742167039"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="742167039"
Received: from mhanlon1-mobl.ger.corp.intel.com (HELO [10.252.22.82])
 ([10.252.22.82])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 02:34:48 -0700
Message-ID: <b1943066-ba71-0e4d-dccb-d0531f0e14e5@intel.com>
Date: Wed, 30 Aug 2023 10:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-10-matthew.auld@intel.com>
 <2atx3jvuevvb3a4duzqkym3n3rglbcbxjfn4smamcmuz3wazhq@kpwcva26aenl>
 <20230829222002.GR6080@mdroper-desk1.amr.corp.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230829222002.GR6080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC 3/5] drm/xe: move pat_table into device info
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

On 29/08/2023 23:20, Matt Roper wrote:
> On Tue, Aug 29, 2023 at 02:49:59PM -0700, Lucas De Marchi wrote:
>> On Tue, Aug 29, 2023 at 05:28:44PM +0100, Matthew Auld wrote:
>>> We need to able to know the max pat_index range for a given platform, as
>>> well being able to lookup the pat_index for a given platform in upcoming
>>> vm_bind uapi, where userspace can directly provide the pat_index. Move
>>> the platform definition of the pat_table into the device info with the
>>> idea of encoding more information about each pat_index in a future
>>> patch.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> ---
> ...
>>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>>> index 54022f591621..9ab059758ad1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pat.h
>>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>>> @@ -26,8 +26,9 @@
>>> #define XELPG_PAT_WB_CACHE_1_WAY       3
>>>
>>> struct xe_gt;
>>> -extern struct xe_device *xe;
>>> +struct xe_device;
>>
>> leftover from a previous patch? what was the base you used? I can't see
>> this on drm-xe-next.
> 
> I think his series is based on top of the latest copy of Ravi's PTE
> encoding series.

Yes, series is based on top of that patch (mentioned somewhere in cover 
letter).

> 
> 
> Matt
> 
>>
>> Lucas De Marchi
>>
>>>
>>> +int xe_pat_fill_info(struct xe_device *xe);
>>> void xe_pat_init(struct xe_gt *gt);
>>> void xe_pte_pat_init(struct xe_device *xe);
>>> unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 791107dec045..24f2021aae22 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -22,6 +22,7 @@
>>> #include "xe_gt.h"
>>> #include "xe_macros.h"
>>> #include "xe_module.h"
>>> +#include "xe_pat.h"
>>> #include "xe_pci_types.h"
>>> #include "xe_pm.h"
>>> #include "xe_step.h"
>>> @@ -553,6 +554,7 @@ static int xe_info_init(struct xe_device *xe,
>>> 	struct xe_tile *tile;
>>> 	struct xe_gt *gt;
>>> 	u8 id;
>>> +	int err;
>>>
>>> 	xe->info.platform = desc->platform;
>>> 	xe->info.subplatform = subplatform_desc ?
>>> @@ -601,6 +603,10 @@ static int xe_info_init(struct xe_device *xe,
>>> 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>>> 				  enable_display &&
>>> 				  desc->has_display;
>>> +
>>> +	err = xe_pat_fill_info(xe);
>>> +	if (err)
>>> +		return err;
>>> 	/*
>>> 	 * All platforms have at least one primary GT.  Any platform with media
>>> 	 * version 13 or higher has an additional dedicated media GT.  And
>>> -- 
>>> 2.41.0
>>>
> 
