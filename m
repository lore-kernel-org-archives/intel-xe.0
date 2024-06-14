Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3156C27C75
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 10:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B8C10ECE4;
	Fri, 14 Jun 2024 10:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXDDbh/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB8B10ECD5
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718359289; x=1749895289;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CI6NpS1n0bSJVB2i2KDOu2pc9AdOoMK57c1HTe1paUc=;
 b=IXDDbh/lXkpjjchotRimPbdHWQ8cFmPqEV6BeOUxI3pFnPQrKe2z3mOu
 eMgcZmUH+7dhROV3H44PTtFNVkva2H+kIckSu41LcatVpVIlorQyYzPQD
 7Y94YJTDZjGq1ZNvRVDynsEA/pc9jjN8eQa0frVY0OjhJb/KOYoc2UrKD
 0fVguzzcxHH0uTQNCc7ftTEwrscBUPuYMJ9W2y13BQzYgYiPLyZevmoLj
 rzlYmBdkV5Y7sQYjT59LI0jTUevKYChOZ9WQG34Y78SrMCiC8x23CHDvK
 2ek3mDkN0e9PkvL8YpC4Yi9u2QdJz7LHELhPtJahLufhtwqmWejC92g+j Q==;
X-CSE-ConnectionGUID: 4wnLQTH1R6yYnxLpT3Dxuw==
X-CSE-MsgGUID: Ty8tPp+9TtGK55wi2PZGXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="32715396"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="32715396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 03:01:28 -0700
X-CSE-ConnectionGUID: 24gnZsXER2+JTTQ2r043Wg==
X-CSE-MsgGUID: /oI4pV6hRBC+NtX/X/JMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="44869202"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 14 Jun 2024 03:01:26 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BBF902816E;
 Fri, 14 Jun 2024 11:01:24 +0100 (IST)
Message-ID: <dd721714-460b-4849-af42-d8bc708cedaa@intel.com>
Date: Fri, 14 Jun 2024 12:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use fixed CCS mode when running in SR-IOV mode
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240613135445.2076-1-michal.wajdeczko@intel.com>
 <ytfnpy6bbt7bnxgsrwzcm7kafk4alzx2rftuswa3gbbbxpggav@6vkcnb6vc3ab>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ytfnpy6bbt7bnxgsrwzcm7kafk4alzx2rftuswa3gbbbxpggav@6vkcnb6vc3ab>
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



On 13.06.2024 22:51, Lucas De Marchi wrote:
> On Thu, Jun 13, 2024 at 03:54:45PM GMT, Michal Wajdeczko wrote:
>> We don't support changing CCS mode when running in SR-IOV mode yet.
>> When running as a PF driver just apply default ccs_mode=1 that VF
>> drivers will assume as already applied and fixed.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 9 ++++++++-
>> 1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index 5d4cdbd69bc3..aea49253d9c9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -12,6 +12,7 @@
>> #include "xe_gt_printk.h"
>> #include "xe_gt_sysfs.h"
>> #include "xe_mmio.h"
>> +#include "xe_sriov.h"
>>
>> static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>> {
>> @@ -75,7 +76,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt,
>> u32 num_engines)
>>
>> void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>> {
>> -    if (!gt->ccs_mode)
>> +    if (!gt->ccs_mode || IS_SRIOV_VF(gt_to_xe(gt)))
>>         return;
>>
>>     __xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
>> @@ -110,6 +111,12 @@ ccs_mode_store(struct device *kdev, struct
>> device_attribute *attr,
>>     u32 num_engines, num_slices;
>>     int ret;
>>
>> +    if (IS_SRIOV(xe)) {
>> +        xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>> +              xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>> +        return -EPERM;
> 
> EPERM? I'd expect ENOTSUPP

I will change to EOPNOTSUPP(95) as ENOTSUPP(524) is not correctly
recognized by the user space:

	$ echo 2 | sudo tee tile0/gt0/ccs_mode

	tee: 'tile0/gt0/ccs_mode': Unknown error 524
vs
	tee: 'tile0/gt0/ccs_mode': Operation not supported


> 
> Lucas De Marchi
> 
>> +    }
>> +
>>     ret = kstrtou32(buff, 0, &num_engines);
>>     if (ret)
>>         return ret;
>> -- 
>> 2.43.0
>>
