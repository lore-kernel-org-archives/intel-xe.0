Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331EAC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 12:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E200F10EE53;
	Thu, 28 Mar 2024 12:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYVAWvgm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF7E10EE53
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711629576; x=1743165576;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R/BG3aSEihLqw9KBVZdTF+/i4x0X7AAur7k4PFG17bg=;
 b=PYVAWvgmeTfSXDOZSNJBcmLz9KxWPDhL5RLdVNkOwXtMgh/r1DPJRv1l
 uTC8h+gM83zfhRZJyjf1oVYsuOtFWUMVIRQe+pwiISO5ZZxT+Mmxaumnx
 99YIdHqVdaXqD4JBzCbkOB4sO+2TbswW/dgeiEYzu3TI0VWqOzj9HH48m
 8sjkt1eiJJ5ao9g3JgP5S5zy1VHOOYlCn+t9OEc9uDmWKjRTHs9X42XsK
 FCoNOAcxF5iNGbH+/FV/laTdkC6nM6BUmrr6aP0c8d9QJ1DgjmQZTx/NO
 Q1IpRXFasVekXpwznWEeXcInJTcFMJaOxR7LJHwJ2GcD/KShPePTIBg+q w==;
X-CSE-ConnectionGUID: 74pkt5G5QEmVM3eXPrZfXA==
X-CSE-MsgGUID: G2lMgsc2SLC6u3C2EVz9WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7377591"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7377591"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 05:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16472079"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 28 Mar 2024 05:39:33 -0700
Received: from [10.249.157.82] (unknown [10.249.157.82])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 746D33581D;
 Thu, 28 Mar 2024 12:39:24 +0000 (GMT)
Message-ID: <744b5fed-a136-422f-96d9-921b9d1b20bf@intel.com>
Date: Thu, 28 Mar 2024 13:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Add proper detection of the SR-IOV VF mode
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
 <20240327182740.407-4-michal.wajdeczko@intel.com>
 <20240327230127.GE1332995@mdroper-desk1.amr.corp.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240327230127.GE1332995@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 28.03.2024 00:01, Matt Roper wrote:
> On Wed, Mar 27, 2024 at 07:27:40PM +0100, Michal Wajdeczko wrote:
>> SR-IOV VF mode detection is based on testing VF capability bit on
>> the register that is accessible from both the PF and enabled VFs.
>>
>> Bspec: 49904, 53227
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  3 +++
>>  drivers/gpu/drm/xe/xe_sriov.c           | 17 +++++++++++++++--
>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>> index 58a4e0fad1e1..617ddb84b7fa 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>> @@ -14,4 +14,7 @@
>>  #define   LMEM_EN			REG_BIT(31)
>>  #define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
>>  
>> +#define VF_CAP_REG			XE_REG(0x1901f8, XE_REG_OPTION_VF)
>> +#define   VF_CAP			REG_BIT(0)
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> index 2bcef998c8a9..3e103edf7174 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -5,7 +5,11 @@
>>  
>>  #include <drm/drm_managed.h>
>>  
>> +#include "regs/xe_sriov_regs.h"
>> +
>>  #include "xe_assert.h"
>> +#include "xe_device.h"
>> +#include "xe_mmio.h"
>>  #include "xe_sriov.h"
>>  
>>  /**
>> @@ -28,6 +32,13 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
>>  	}
>>  }
>>  
>> +static bool test_is_vf(struct xe_device *xe)
>> +{
>> +	u32 value = xe_mmio_read32(xe_root_mmio_gt(xe), VF_CAP_REG);
>> +
>> +	return value & VF_CAP;
>> +}
>> +
>>  /**
>>   * xe_sriov_probe_early - Probe a SR-IOV mode.
>>   * @xe: the &xe_device to probe mode on
>> @@ -44,8 +55,10 @@ void xe_sriov_probe_early(struct xe_device *xe)
>>  	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
>>  	bool has_sriov = xe->info.has_sriov;
>>  
>> -	/* TODO: replace with proper mode detection */
>> -	xe_assert(xe, !has_sriov);
>> +	if (has_sriov) {
>> +		if (test_is_vf(xe))
> 
> Seems like we could && these conditions together and avoid the nested
> if's.  But up to you; either way,

soon there will be added another "if" for the PF readiness case and I
wanted to minimize future diffs, hence nested "if"

> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks!

> 
>> +			mode = XE_SRIOV_MODE_VF;
>> +	}
>>  
>>  	xe_assert(xe, !xe->sriov.__mode);
>>  	xe->sriov.__mode = mode;
>> -- 
>> 2.43.0
>>
>>
> 
