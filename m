Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53180D6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 19:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCB810E35C;
	Thu, 14 Nov 2024 19:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glUvbdsF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD5010E35C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731613010; x=1763149010;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VPaRImrW/TK+8k8/mi1aQeJ+5T3WTJlTiEKeMRWxeiU=;
 b=glUvbdsFuiIeO88/hXm3dbqUjS+kgQKSZU117LQ33+KleJMMEB7H1puH
 HizY0JESHis0L/22gBP9cF5e5P5THDFAXT5CKwb5q8BnbGFkxc0lnhTnb
 MH646nwWRNaMFX3XKePjX4RU3rO3zHCJdKiJ+pQbIjNSDgJ28hBiR6l47
 GfKGBZVBmVPXsnekXMnsUcUKAFyK6N1h6xSdkzL5vXbejSuy/FmBCQGYi
 8xiYKg1JfS/tSAlzrbKnod12HWS8ifWTZTFAWHcNiJtWEtF8k52N2JBxV
 RUuDro7owNzN2rJ3VHL1sQX0BfNcBpdRLl+YvMSwu3TNjVXTtino+nu9b w==;
X-CSE-ConnectionGUID: WcsH9T4KRHW7XabURH66Rw==
X-CSE-MsgGUID: CXh29MSISmCP2vVrCiJ8vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31830498"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31830498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:36:50 -0800
X-CSE-ConnectionGUID: 0zHiLOKRTyWSs1SuG3tjVg==
X-CSE-MsgGUID: ZPScRNuSSkijVL9jmzTjaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119130166"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 14 Nov 2024 11:36:49 -0800
Received: from [10.245.98.17] (unknown [10.245.98.17])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 884D128781;
 Thu, 14 Nov 2024 19:36:47 +0000 (GMT)
Message-ID: <3dde1c69-39f7-4ae7-8ecd-31338ce94a80@intel.com>
Date: Thu, 14 Nov 2024 20:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Always setup GT MMIO adjustment data
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
 <20241114175955.2299-2-michal.wajdeczko@intel.com>
 <yzyjk63jmruhujcaqpkx4cd64ymrqvjmikwlltgbf7pmbg6s7o@ycn665ds4ile>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <yzyjk63jmruhujcaqpkx4cd64ymrqvjmikwlltgbf7pmbg6s7o@ycn665ds4ile>
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



On 14.11.2024 20:23, Lucas De Marchi wrote:
> On Thu, Nov 14, 2024 at 06:59:54PM +0100, Michal Wajdeczko wrote:
>> While we believed that xe_gt_mmio_init() will be called just once
>> per GT, this might not be a case due to some tweaks that need to
>> performed by the VF driver during early probe.  To avoid leaving
> 
> can you be explicit where this is being set on the VF case? 

it will be used in read_gmdid(), see next patch

> Shouldn't VF
> itself deal with fixing up what it did?

in read_gmdid() we already said

516      /*
517       * Only undo xe_gt.info here, the remaining changes made above
518       * will be overwritten as part of the regular initialization.
519       */

and it looks that xe_gt_mmio_init() is not overwriting everything as we
would expect

> 
>> any stale data in case of the re-run, reset the GT MMIO adjustment
>> data for the non-media GT case.
> 
> 
> Lucas De Marchi
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index d6744be01a68..d45d2cecc4dc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -643,6 +643,9 @@ void xe_gt_mmio_init(struct xe_gt *gt)
>>     if (gt->info.type == XE_GT_TYPE_MEDIA) {
>>         gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>>         gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>> +    } else {
>> +        gt->mmio.adj_offset = 0;
>> +        gt->mmio.adj_limit = 0;
>>     }
>>
>>     if (IS_SRIOV_VF(gt_to_xe(gt)))
>> -- 
>> 2.43.0
>>

