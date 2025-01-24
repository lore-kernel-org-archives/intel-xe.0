Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D04C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 18:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2210E175;
	Fri, 24 Jan 2025 18:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWOD+6B/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712DB10E175
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 18:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737744131; x=1769280131;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kf/m/bw6RL5mHRHwdnIfzksMDJdJi8jE8sz8B+VKeBc=;
 b=SWOD+6B/M3WcRp1gi6FmMmKFLj1uWSsE7td8X1WtXix1wmgKFi7V7iif
 sppI1MfJyQ9UBjOhyLrFyIsfKqtKWcXuB0OWmyTx1btftHamVmw1No6wY
 on876d0BuzAqBJOqx2Pg/xT1JbwSNduFUimDE6qq2iUAGtpgWcpzqQLNf
 uinYzc0FUKP6zdYamrUHNPiEQljmIEqkWU0M6GnUXsI9EEVD8itV9GyQ8
 QN4RL5fWHbzqRkkr2AECpV7x36n3bxEsNBzp5EzHpnVHXy9Qn5o/laxxd
 Z4uS1QwV6yfw/ztx7rkqvkKPeh575Q0uhNcOnxhnDJTlameq2CJuI6p9T w==;
X-CSE-ConnectionGUID: FlptW2VwR82i9UtRytTw8g==
X-CSE-MsgGUID: k+sXDHMRRwiIRtLeBPXgCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="55704150"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="55704150"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 10:42:11 -0800
X-CSE-ConnectionGUID: sq92mO9hRn6gQ0sKyLZAPw==
X-CSE-MsgGUID: HTHkmz4WT1iPwJCZfVGz4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="112853737"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 24 Jan 2025 10:42:10 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A18C032C9D;
 Fri, 24 Jan 2025 18:42:08 +0000 (GMT)
Message-ID: <dd0e6859-efca-4620-9f77-c4c2354acd2e@intel.com>
Date: Fri, 24 Jan 2025 19:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Use GuC Buffer Cache during policy
 provisioning
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
 <20250122214955.632-2-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B51D20C9C4A5CA179FC8E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444B51D20C9C4A5CA179FC8E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 22.01.2025 23:29, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Wednesday, January 22, 2025 1:50 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Subject: [PATCH 1/3] drm/xe/pf: Use GuC Buffer Cache during policy provisioning
>>
>> Start using GuC buffer cache for the SRIOV policy configuration
>> actions. This is a required step before we could declare SRIOV
>> PF as being a reclaim safe.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> LGTM, though I have to wonder if the pf_send_policy_klvs helper function
> is particularly necessary now that it's been mostly gutted.

it makes conversion from "gt/buf" layers to lower "guc/addr" layers

> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

thanks!

btw, I plan to merge this patch separately from this series

Michal

> 
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 50 +++++++++++-----------
>>  1 file changed, 24 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index c00fb354705f..4445f660e6d1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -10,6 +10,7 @@
>>  #include "xe_gt_sriov_pf_helpers.h"
>>  #include "xe_gt_sriov_pf_policy.h"
>>  #include "xe_gt_sriov_printk.h"
>> +#include "xe_guc_buf.h"
>>  #include "xe_guc_ct.h"
>>  #include "xe_guc_klv_helpers.h"
>>  #include "xe_pm.h"
>> @@ -34,48 +35,28 @@ static int guc_action_update_vgt_policy(struct xe_guc *guc, u64 addr, u32 size)
>>   * Return: number of KLVs that were successfully parsed and saved,
>>   *         negative error code on failure.
>>   */
>> -static int pf_send_policy_klvs(struct xe_gt *gt, const u32 *klvs, u32 num_dwords)
>> +static int pf_send_policy_klvs(struct xe_gt *gt, struct xe_guc_buf buf, u32 num_dwords)
>>  {
>> -	const u32 bytes = num_dwords * sizeof(u32);
>> -	struct xe_tile *tile = gt_to_tile(gt);
>> -	struct xe_device *xe = tile_to_xe(tile);
>>  	struct xe_guc *guc = &gt->uc.guc;
>> -	struct xe_bo *bo;
>> -	int ret;
>>  
>> -	bo = xe_bo_create_pin_map(xe, tile, NULL,
>> -				  ALIGN(bytes, PAGE_SIZE),
>> -				  ttm_bo_type_kernel,
>> -				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> -				  XE_BO_FLAG_GGTT);
>> -	if (IS_ERR(bo))
>> -		return PTR_ERR(bo);
>> -
>> -	xe_map_memcpy_to(xe, &bo->vmap, 0, klvs, bytes);
>> -
>> -	ret = guc_action_update_vgt_policy(guc, xe_bo_ggtt_addr(bo), num_dwords);
>> -
>> -	xe_bo_unpin_map_no_vm(bo);
>> -
>> -	return ret;
>> +	return guc_action_update_vgt_policy(guc, xe_guc_buf_flush(buf), num_dwords);
>>  }
>>  
>>  /*
>>   * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO if reply was malformed,
>>   *         negative error code on failure.
>>   */
>> -static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
>> -			       const u32 *klvs, u32 num_dwords)
>> +static int pf_push_policy_buf_klvs(struct xe_gt *gt, u32 num_klvs,
>> +				   struct xe_guc_buf buf, u32 num_dwords)
>>  {
>>  	int ret;
>>  
>> -	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
>> -
>> -	ret = pf_send_policy_klvs(gt, klvs, num_dwords);
>> +	ret = pf_send_policy_klvs(gt, buf, num_dwords);
>>  
>>  	if (ret != num_klvs) {
>>  		int err = ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
>>  		struct drm_printer p = xe_gt_info_printer(gt);
>> +		void *klvs = xe_guc_buf_cpu_ptr(buf);
>>  
>>  		xe_gt_sriov_notice(gt, "Failed to push %u policy KLV%s (%pe)\n",
>>  				   num_klvs, str_plural(num_klvs), ERR_PTR(err));
>> @@ -86,6 +67,23 @@ static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
>>  	return 0;
>>  }
>>  
>> +/*
>> + * Return: 0 on success, -ENOBUFS if there is no free buffer for the indirect data,
>> + *         negative error code on failure.
>> + */
>> +static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
>> +			       const u32 *klvs, u32 num_dwords)
>> +{
>> +	CLASS(xe_guc_buf_from_data, buf)(&gt->uc.guc.buf, klvs, num_dwords * sizeof(u32));
>> +
>> +	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
>> +
>> +	if (!xe_guc_buf_is_valid(buf))
>> +		return -ENOBUFS;
>> +
>> +	return pf_push_policy_buf_klvs(gt, num_klvs, buf, num_dwords);
>> +}
>> +
>>  static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
>>  {
>>  	u32 klv[] = {
>> -- 
>> 2.47.1
>>
>>

