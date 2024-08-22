Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4CDC52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 12:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E7610E89F;
	Thu, 22 Aug 2024 12:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqOimmDZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524610E89F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724329904; x=1755865904;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xSfv0MfwnzVk6wOKvleFM2ArEpOBOncwn+TfxWX/O3k=;
 b=LqOimmDZ1oJRszDp1590E52xWhaLCpqMXLQT2f2Ya9rRXq7NRYeCBBML
 9zi3o617xS5dZd7jtk+wcX4Pff03x3HS7OgwEVwdokSm11nucpnowEhsY
 g2sAv5bqQPoJur8/0T5Y5aE07BKUnoLHibV/xPRPzVX8QpzbMiRAIWiLQ
 m4RSN+QC7JiBV1BoJ8hnfh9INtMeZ+wEh9VJB2Qj9AlRbTgPizSOqrYKb
 c8Ry2qgb+mgzfG4WEHSGUBRJ9LyErUK+Vq33q14Qycb0KczmlsTxYpBAH
 +t5elgvdBrhVjbKVExXUW/tLWJqcrRHKOk798kfls+Oup/AGJ+mSktVRC g==;
X-CSE-ConnectionGUID: BhqCc9N5Tba5XR75fQYl/g==
X-CSE-MsgGUID: Te5NeKCkTKufPWP/oheMdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26606197"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="26606197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:31:44 -0700
X-CSE-ConnectionGUID: HM7sRrOAQOakj0zLeitamg==
X-CSE-MsgGUID: +Xz/fzzcTEuNcEdjCJI3nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61749221"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.126])
 ([10.245.244.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:31:42 -0700
Message-ID: <1906edf6-f5d3-471c-8cba-12ef84e7a5ff@linux.intel.com>
Date: Thu, 22 Aug 2024 14:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Align all 64k VRAM buffers physically when
 multiple of 64k.
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
References: <20240821205637.552424-1-maarten.lankhorst@linux.intel.com>
 <20240821205637.552424-2-maarten.lankhorst@linux.intel.com>
 <20240822121412.sciljgl3oomkxv4t@zkempczy-mobl2>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240822121412.sciljgl3oomkxv4t@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2024-08-22 kl. 14:14, skrev Zbigniew Kempczyński:
> On Wed, Aug 21, 2024 at 10:56:35PM +0200, Maarten Lankhorst wrote:
>> For CCS formats on affected platforms, CCS can be used freely, but
>> display engine requires a multiple of 64k physical pages. No other
>> changes are needed.
>>
>> At the BO creation time we don't know if the BO will be used for CCS
>> or not. If the scanout flag is set, and the BO is a multiple of 64k,
>> we take the safe route and force the physical alignment of 64k pages.
>>
>> If the BO is not a multiple of 64k, or the scanout flag was not set
>> at BO creation, we reject it for usage as CCS in display. The physical
>> pages are likely not aligned correctly, and this will cause corruption
>> when used as FB.
>>
>> This is a slightly different approach from my previous patch. Instead
>> of requiring a scanout flag at FB creation, we now make all buffers of
>> the right size physically aligned correctly, so no change from userspace
>> is needed.
>>
>> It will be interesting to see if it affects performance in any way,
>> could potentially even improve things with 64k PTE's.
>>
>> Inspired by Zbigniews patch.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/intel_fb_bo.c |  6 ++++++
>>  drivers/gpu/drm/xe/xe_bo.c               | 10 ++++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h     |  1 +
>>  drivers/gpu/drm/xe/xe_vm.c               |  3 ++-
>>  4 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> index f835492f73fb4..407367719abe2 100644
>> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> @@ -7,6 +7,7 @@
>>  #include <drm/ttm/ttm_bo.h>
>>  
>>  #include "intel_display_types.h"
>> +#include "intel_fb.h"
>>  #include "intel_fb_bo.h"
>>  #include "xe_bo.h"
>>  
>> @@ -28,6 +29,11 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
>>  	struct xe_device *xe = to_xe_device(bo->ttm.base.dev);
>>  	int ret;
>>  
>> +	if (XE_IOCTL_DBG(xe, intel_fb_is_ccs_modifier(mode_cmd->modifier[0]) &&
>> +			     (xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS) &&
>> +			     !(bo->flags & XE_BO_FLAG_NEEDS_64K)))
>> +		return -EINVAL;
>> +
>>  	xe_bo_get(bo);
>>  
>>  	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 6ed0e19552159..3a753f4644cb6 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2017,6 +2017,16 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>>  		bo_flags |= XE_BO_FLAG_SCANOUT;
> 
> I wonder, may you fail early here if buffer comes with SCANOUT flag but
> is not aligned to 64K when vram_flags has DISPLAY_NEED64K_CCS set and
> not wait to framebuffer init?
> 
I decided to allow this case. Because only a single format is affected (4-tiled CCS), it makes sense to allow scanout for all buffers and only fail on fb init.

Cheers,
~Maarten
