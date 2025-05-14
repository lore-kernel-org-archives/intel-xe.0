Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E767FC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 17:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC27F10E64A;
	Wed, 14 May 2025 17:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww5y5JSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116EE10E642
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747243113; x=1778779113;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=p6QxZn4WLmISYePlSCvlsc4u6O2sFpnOUUpy4ILYpuE=;
 b=Ww5y5JShX0F2VSPYbyr52jkut4wju611I7KeXvKQt554/Y9qIrIL145r
 v1zkkx91yOI+B0RS2Y70rRhL11PhbB0vcfAbkpskTsqQ6+I+m+8IKL4xq
 7qu5EGWgMYyaSUJIfpomltsivWNFv0fy84adLdZDtNqOJcS0CIjUAuv/R
 1Axe9c9n2tok+vKB31ooSkeNhMKpHaGV+/rR9xVDvQ3vP6VRHHZXO6ypZ
 /0t6tldVN8G9Q78ixs3biyHYlFkTd6w2fVu74RIGfwCIJi/19Hcb5ZZpq
 Xwt6xBtQ9K3ejtddW+gzLmrhXqtUJsZ7IoyQOx+0HkWStwS8r4WMl5jiF Q==;
X-CSE-ConnectionGUID: UNcKqKz8RWuqofo964kECQ==
X-CSE-MsgGUID: nh+DYPPWRA2zOCZrp3TvvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52963469"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="52963469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:18:32 -0700
X-CSE-ConnectionGUID: YKQ+Y42rQ8O4kOfgZ3rBog==
X-CSE-MsgGUID: wZ/cCXfBTRC8SCQqdjOqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="161391208"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.180])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:18:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>, Soham Purkait
 <soham.purkait@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com
Cc: lucas.demarchi@intel.com, ashutosh.dixit@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH 1/4] Utility function and macro for telemetry reading
In-Reply-To: <98bdd2b6-f69e-4ff0-93c8-d57099a3060e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250514080721.265515-1-soham.purkait@intel.com>
 <20250514080721.265515-2-soham.purkait@intel.com>
 <8734d7iltz.fsf@intel.com>
 <98bdd2b6-f69e-4ff0-93c8-d57099a3060e@intel.com>
Date: Wed, 14 May 2025 20:18:27 +0300
Message-ID: <87ldqzglgc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 14 May 2025, "Poosa, Karthik" <karthik.poosa@intel.com> wrote:
> On 14-05-2025 14:57, Jani Nikula wrote:
>> On Wed, 14 May 2025, Soham Purkait <soham.purkait@intel.com> wrote:
>>> The changes in this patch is taken from
>>> https://patchwork.freedesktop.org/series/148926/
>>> Thay are  added only for compilation and does not
>>> require review.
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_pmt.h | 5 +++++
>>>   drivers/gpu/drm/xe/xe_vsec.c     | 2 +-
>>>   drivers/gpu/drm/xe/xe_vsec.h     | 5 +++++
>>>   3 files changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>> index f45abcd96ba8..b1d4504e4adc 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>> @@ -10,6 +10,11 @@
>>>   #define BMG_PMT_BASE_OFFSET		0xDB000
>>>   #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
>>>   
>>> +#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
>>> +#define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
>>> +#define ENERGY_PKG			REG_GENMASK64(31, 0)
>>> +#define ENERGY_CARD			REG_GENMASK64(63, 32)
>>> +
>>>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>>>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>>> index b378848d3b7b..a46e9580b1f4 100644
>>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>>> @@ -149,7 +149,7 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>>>   	return 0;
>>>   }
>>>   
>>> -static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
>>> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
>>>   			     u32 count)
>>>   {
>>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>>> index 5777c53faec2..6184b875e4b1 100644
>>> --- a/drivers/gpu/drm/xe/xe_vsec.h
>>> +++ b/drivers/gpu/drm/xe/xe_vsec.h
>>> @@ -4,8 +4,13 @@
>>>   #ifndef _XE_VSEC_H_
>>>   #define _XE_VSEC_H_
>>>   
>>> +#include "linux/types.h"
>>> +#include "linux/pci.h"
>>> +
>> Please address the reviews [1].
>>
>> BR,
>> Jani.
>
> These are addressed here Jani,
>
> https://patchwork.freedesktop.org/patch/653146/?series=148926&rev=2

Please sort this out between you and Soham. This is clearly conflicting
stuff, sent *after* the above.

BR,
Jani.


>>
>>
>> [1] https://lore.kernel.org/r/87ikmcvfzd.fsf@intel.com
>>
>>
>>
>>>   struct xe_device;
>>>   
>>>   void xe_vsec_init(struct xe_device *xe);
>>> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
>>> +		      u32 count);
>>>   
>>>   #endif

-- 
Jani Nikula, Intel
