Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A824AD6C29A
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 21:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A09910E364;
	Tue, 19 Nov 2024 21:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/tEMgwm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B139C10E364
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732050354; x=1763586354;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=itLfHzqp4oALr3/tKtYFNhkIdiiyc62A8m7IBffiCdU=;
 b=F/tEMgwmGkJ2xcsj7yqT2xSRyOKGytwpqCQ/RBZEUuLfa0KhKOISzV0Y
 k3ChmZOaqjycXQJc9j+72WDNfUJcaActhekehD1mX44G+zW4SNYvze500
 aXirit0b2SyZgkpVHOEiq5OiA3xr9CetmF3J0KDLBk1mW0sX4wTIOMteA
 RzQfKuRoCLBybz1+OO1qQUnXoAnskzX2N0BenyezXG8wQ/zIKUYjsTshn
 mf4dVKBXo2M0prn55AX2uaveTSGFhjT1rNyqapNtoEoFx3zVG8+igYBsY
 rXH/dCKU8+fQX2gJi9csH/O2qJZ8cTaeyw4wOLf0gN2BQFG+k2G11+1EP g==;
X-CSE-ConnectionGUID: nM3ZOTmgQriG+N8c+g5WPg==
X-CSE-MsgGUID: PJjNjuu1Qn2iwtTxuot8Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="34939425"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="34939425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 13:05:50 -0800
X-CSE-ConnectionGUID: 7+204LDhQJia6sFPmzn2TA==
X-CSE-MsgGUID: Ghp94B8USTiry74pKlM1sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89638993"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 19 Nov 2024 13:05:48 -0800
Received: from [10.245.80.89] (unknown [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E95122FC51;
 Tue, 19 Nov 2024 21:05:46 +0000 (GMT)
Message-ID: <8e9b5a14-0439-410e-96dd-36c89429a3f9@intel.com>
Date: Tue, 19 Nov 2024 22:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Use new force-wake guard class in xe_mocs.c
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-3-michal.wajdeczko@intel.com>
 <q6oftdodc3xpjczeddv3ghr2c5msrqgekbz3f34yi5leg4hz22@dwodxaqpk6pd>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <q6oftdodc3xpjczeddv3ghr2c5msrqgekbz3f34yi5leg4hz22@dwodxaqpk6pd>
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



On 19.11.2024 21:03, Lucas De Marchi wrote:
> On Mon, Nov 18, 2024 at 07:45:11PM +0100, Michal Wajdeczko wrote:
>> Start using new xe_fw class to minimize risk of leaking force-wake
>> references.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> v2: rebased
>> ---
>> drivers/gpu/drm/xe/xe_mocs.c | 10 +++-------
>> 1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>> index 54d199b5cfb2..f18aaa6595c7 100644
>> --- a/drivers/gpu/drm/xe/xe_mocs.c
>> +++ b/drivers/gpu/drm/xe/xe_mocs.c
>> @@ -776,19 +776,15 @@ void xe_mocs_dump(struct xe_gt *gt, struct
>> drm_printer *p)
>> {
>>     struct xe_device *xe = gt_to_xe(gt);
>>     struct xe_mocs_info table;
>> -    unsigned int fw_ref, flags;
>> +    unsigned int flags;
>>
>>     flags = get_mocs_settings(xe, &table);
>>
>>     xe_pm_runtime_get_noresume(xe);
>> -    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> -    if (!fw_ref)
>> -        goto err_fw;
>>
>> -    table.ops->dump(&table, flags, gt, p);
>> +    scoped_guard(xe_fw, gt_to_fw(gt), XE_FW_GT)
>> +        table.ops->dump(&table, flags, gt, p);
> 
> 
> afair one caveat is that you can't have a goto that jumps over guard
> because of the usage of the cleanup attribute. Is that still the case or
> do we have some magic convincing the compiler to do the right thing?

not sure if I get the problem right, but in the perfect world, we will
not need to use goto's any more (as we need them mostly for the cleanup)

so code like this:

int legacy(gt)
{
	unsigned int fw_ref;
	int res;

	xe_pm_runtime_get(gt_to_xe(gt));
	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_GT);
	if (!fw_ref) {
		res = -ETIMEDOUT;
		goto out_pm;
	}

	res = foo();

	xe_force_wake_put(gt_to_fw(gt), fw_ref);
out_pm:
	xe_pm_runtime_put(gt_to_xe(gt));
	return res;
}

we could likely replace with:

int future(gt)
{
	guard(xe_pm)(gt_to_xe(gt));
	scoped_guard(xe_fw, gt_to_fw(gt), XE_FORCEWAKE_GT)
		return foo();

	return -ETIMEDOUT;
}

> 
> once we get agreement on the approach, please let's convert everything
> that can be converted to scoped guard so we don't have to keep both
> approaches for a long time.
> 
> Lucas De Marchi
> 
>>
>> -    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -err_fw:
>>     xe_pm_runtime_put(xe);
>> }
>>
>> -- 
>> 2.43.0
>>

