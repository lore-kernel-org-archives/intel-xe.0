Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2837CC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 15:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE16D10E5B8;
	Tue, 11 Mar 2025 15:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVq6Ptrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E0310E5C0
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706850; x=1773242850;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bQEj6IOo2FzBPWEpKut7DLHdJP0vY+CMMUwcjpcxzyI=;
 b=nVq6PtrvZaBcgoRrdeGxYJYtE1tjP/FhsWHrM8acc6ASTjbnTnMBsLe/
 uFHXySrPCs+LVZmK61aXkw+cpZ4VPFCRwhf2NlxglvpHrSOfMksNUUXQ1
 7eo+caquwgOM+n6l4fHRDhY59znSQfxNngut31ber4hcEB9LtsoMEha18
 ZCABQbUs3tQilLmDHEAP6hEKW5MVPBaOnDK8syBEj93YhHGD8mAaIIaba
 n7gP51RDbWHeqkVo3kTqaDigQ0Tb1bs1u6d/ULaxT3dLaSj7Q6ihbuWpc
 Inv+SWJ1y0pN4CPYLIYKPXoJAEfHS5IQlVyWRyPa2kCAAl3ZahYB5jTVJ A==;
X-CSE-ConnectionGUID: qIkwHFq2RyK0VwapIGHkHA==
X-CSE-MsgGUID: j3ecMFIWS4+RML+47AjfYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46663504"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46663504"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:27:29 -0700
X-CSE-ConnectionGUID: alDkHiJkQDu9eO33oObtgg==
X-CSE-MsgGUID: qP3qGIBiSW2/h3rB6vSWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120842566"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 11 Mar 2025 08:27:28 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8087D3433A;
 Tue, 11 Mar 2025 15:27:27 +0000 (GMT)
Message-ID: <dca18f07-3644-46d1-9115-df34f516b16f@intel.com>
Date: Tue, 11 Mar 2025 16:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Catch all unexpected register reads
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
 <20250311135726.1998-3-michal.wajdeczko@intel.com>
 <437269cc-69d9-40be-89a2-450d0ede1983@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <437269cc-69d9-40be-89a2-450d0ede1983@intel.com>
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



On 11.03.2025 15:23, Ghimiray, Himal Prasad wrote:
> 
> 
> On 11-03-2025 19:27, Michal Wajdeczko wrote:
>> While we can only mimic read32 for a few GT registers for which
>> the PF shared the values, we shouldn't avoid calling helper code
>> if we try to access non-GT register, as then we miss to trigger
>> a debug warning. For cases where sriov_vf_gt was not set, just
>> use primary_gt instead.
> 
> Under what scenario sriov_vf_gt can be not set for VF ?
> Isn't this initialized for each gt during probe for VF ?

this is true for the reg reads that use gt->mmio, but it's not the case
for reg read which use tile->mmio, and we had this case in driver-flr:

static void __xe_driver_flr(struct xe_device *xe)
{
...	struct xe_mmio *mmio = xe_root_tile_mmio(xe);

where this unexpected reg access was unnoticed, now it will show as:

 [ ] xe 0000:00:02.1: [drm] GT0: VF is trying to read an inaccessible
register 0x10100c+0x0
 [ ] Call Trace:
 ...
 [ ]  xe_mmio_read32+0x179/0x2b0 [xe]
 [ ]  ? release_nodes+0x48/0x120
 [ ]  xe_driver_flr_fini+0x47/0xa0 [xe]
 [ ]  devm_action_release+0x12/0x30
 [ ]  release_nodes+0x3a/0x120
 [ ]  devres_release_all+0x97/0xe0
 [ ]  device_unbind_cleanup+0x12/0x80
 [ ]  device_release_driver_internal+0x23a/0x280
 [ ]  device_release_driver+0x12/0x20

> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mmio.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 70a36e777546..13e06a956ceb 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -204,8 +204,9 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct
>> xe_reg reg, u32 val)
>>         trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>>   -    if (!reg.vf && mmio->sriov_vf_gt)
>> -        xe_gt_sriov_vf_write32(mmio->sriov_vf_gt, reg, val);
>> +    if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>> +        xe_gt_sriov_vf_write32(mmio->sriov_vf_gt ?:
>> +                       mmio->tile->primary_gt, reg, val);
>>       else
>>           writel(val, mmio->regs + addr);
>>   }
>> @@ -218,8 +219,9 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct
>> xe_reg reg)
>>       /* Wa_15015404425 */
>>       mmio_flush_pending_writes(mmio);
>>   -    if (!reg.vf && mmio->sriov_vf_gt)
>> -        val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt, reg);
>> +    if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>> +        val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt ?:
>> +                        mmio->tile->primary_gt, reg);
>>       else
>>           val = readl(mmio->regs + addr);
>>   
> 

