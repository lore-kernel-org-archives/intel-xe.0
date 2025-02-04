Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB91C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 14:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B5D10E347;
	Tue,  4 Feb 2025 14:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aq767UsI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2205E10E347
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738679192; x=1770215192;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hxr4gYn5J5RuzPs0v67OEZwiO708Y7nDEjUlbO5j4Rg=;
 b=aq767UsI/K6rzfT1/bwisMUKnu/voQlJuOdPTVto7NNVJkY04Gvkswlb
 QsKxERyg9KwmpcG4FqQMdsBGox7DlHVJYbBwOBEUYGBgUoZoiyMeVao4A
 VpShixq9jiTYuNriOIQ9npCpFi4pWyUT8dEKd+PRw+VMqrMgkDETTecmc
 o8wr/L6y/xNLDIAqaL6HTiA96gAD9vhMb/ogf/Bx+TRGhZZZKOMFIDcYT
 KMEwy5U9Xibb/6x3vawQ4LrgEp/YSdI3Q2mKc+lOvw5nWzgeXwv11Hxk4
 2ItYyw3S66TSyK/xC+6v/Wx2/mnOdVjvvjvrp85F6pLEz3Mbmu+MHsXBC g==;
X-CSE-ConnectionGUID: xdZ5uz1bT9WK4XXyEnrRJA==
X-CSE-MsgGUID: IEPcDeNSTayxM0kNM/o4xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42959225"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42959225"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 06:26:32 -0800
X-CSE-ConnectionGUID: 0g01tJOrSO6m9DP1A2IYdQ==
X-CSE-MsgGUID: iWUeW/d9RSyyEG1+AYJNfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110489285"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2025 06:26:30 -0800
Received: from [10.246.16.98] (mwajdecz-MOBL.ger.corp.intel.com [10.246.16.98])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DF41C125A4;
 Tue,  4 Feb 2025 14:26:28 +0000 (GMT)
Message-ID: <ac104e6d-39f8-456d-bbd9-c14204083718@intel.com>
Date: Tue, 4 Feb 2025 15:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Don't try to trigger a full GT reset if VF
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
References: <20250131182502.852-1-michal.wajdeczko@intel.com>
 <jdh3cve7w2owjmelwjsm7tya33zfgd6h455wmgwhkydeefxuwu@pgwdo5zhykgv>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <jdh3cve7w2owjmelwjsm7tya33zfgd6h455wmgwhkydeefxuwu@pgwdo5zhykgv>
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



On 01.02.2025 00:53, Lucas De Marchi wrote:
> On Fri, Jan 31, 2025 at 07:25:02PM +0100, Michal Wajdeczko wrote:
>> VFs don't have access to the GDRST(0x941c) register that driver
>> uses to reset a GT. Attempt to trigger a reset using debugfs:
>>
>> $ cat /sys/kernel/debug/dri/0000:00:02.1/gt0/force_reset
>>
>> or due to a hang condition detected by the driver leads to:
>>
>> [ ] xe 0000:00:02.1: [drm] GT0: trying reset from force_reset [xe]
>> [ ] xe 0000:00:02.1: [drm] GT0: reset queued
>> [ ] xe 0000:00:02.1: [drm] GT0: reset started
>> [ ] ------------[ cut here ]------------
>> [ ] xe 0000:00:02.1: [drm] GT0: VF is trying to write 0x1 to an
>> inaccessible register 0x941c+0x0
>> [ ] WARNING: CPU: 3 PID: 3069 at drivers/gpu/drm/xe/
>> xe_gt_sriov_vf.c:996 xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
>> [ ] RIP: 0010:xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
>> [ ] Call Trace:
>> [ ]  <TASK>
>> [ ]  ? show_regs+0x6c/0x80
>> [ ]  ? __warn+0x93/0x1c0
>> [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
>> [ ]  ? report_bug+0x182/0x1b0
>> [ ]  ? handle_bug+0x6e/0xb0
>> [ ]  ? exc_invalid_op+0x18/0x80
>> [ ]  ? asm_exc_invalid_op+0x1b/0x20
>> [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
>> [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
>> [ ]  ? xe_gt_tlb_invalidation_reset+0xef/0x110 [xe]
>> [ ]  ? __mutex_unlock_slowpath+0x41/0x2e0
>> [ ]  xe_mmio_write32+0x64/0x150 [xe]
>> [ ]  do_gt_reset+0x2f/0xa0 [xe]
>> [ ]  gt_reset_worker+0x14e/0x1e0 [xe]
>> [ ]  process_one_work+0x21c/0x740
>> [ ]  worker_thread+0x1db/0x3c0
>>
>> Fix that by sending H2G VF_RESET(0x5507) action instead.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4078
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt.c          |  4 ++++
>> drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 16 ++++++++++++++++
>> drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>> 3 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 01a4a852b8f4..9fb8f1e678dc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -32,6 +32,7 @@
>> #include "xe_gt_pagefault.h"
>> #include "xe_gt_printk.h"
>> #include "xe_gt_sriov_pf.h"
>> +#include "xe_gt_sriov_vf.h"
>> #include "xe_gt_sysfs.h"
>> #include "xe_gt_tlb_invalidation.h"
>> #include "xe_gt_topology.h"
>> @@ -679,6 +680,9 @@ static int do_gt_reset(struct xe_gt *gt)
>> {
>>     int err;
>>
>> +    if (IS_SRIOV_VF(gt_to_xe(gt)))
>> +        return xe_gt_sriov_vf_reset(gt);
>> +
>>     xe_gsc_wa_14015076503(gt, true);
>>
>>     xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/
>> xe_gt_sriov_vf.c
>> index 6671030439fd..4831549da319 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -58,6 +58,22 @@ static int vf_reset_guc_state(struct xe_gt *gt)
>>     return err;
>> }
>>
>> +/**
>> + * xe_gt_sriov_vf_reset - Reset GuC VF internal state.
>> + * @gt: the &xe_gt
>> + *
>> + * It requires functional `GuC MMIO based communication`_.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_vf_reset(struct xe_gt *gt)
>> +{
>> +    if (!xe_device_uc_enabled(gt_to_xe(gt)))
> 
> I don't think this condition is ever true when driver is loaded in VF

it was copied from xe_gt_sriov_vf_bootstrap(), where it was introduced
by commit f3b59457808f ("drm/xe: Do not attempt to bootstrap VF in
execlists mode"), let it be here for a while until we can confirm that
we never attempt to do a reset prior to bootstrap ;)

> mode, is it? Anyway, looks good:
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks!

> 
> 
> Lucas De Marchi
> 
>> +        return -ENODEV;
>> +
>> +    return vf_reset_guc_state(gt);
>> +}
>> +
>> static int guc_action_match_version(struct xe_guc *guc,
>>                     u32 wanted_branch, u32 wanted_major, u32
>> wanted_minor,
>>                     u32 *branch, u32 *major, u32 *minor, u32 *patch)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/
>> xe_gt_sriov_vf.h
>> index 912d20814261..ba6c5d74e326 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -12,6 +12,7 @@ struct drm_printer;
>> struct xe_gt;
>> struct xe_reg;
>>
>> +int xe_gt_sriov_vf_reset(struct xe_gt *gt);
>> int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>> int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>> int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>> -- 
>> 2.47.1
>>

