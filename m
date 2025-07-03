Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650AAC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 14:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1519910E855;
	Thu,  3 Jul 2025 14:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOhv7I84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2152A10E858
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751551412; x=1783087412;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dDNtLgID8YN/LQ6CNxfwfCqgvUIkUVfweHJnuuIbMUI=;
 b=HOhv7I84qjh4mHN/ttsvRUHRTD3+msjxJXoMc8N+eN/b3AWvvb+tuRb9
 98qAyuMuDYlegF3k+t2SFHylOcGnHc+NeHjxRDegFmN9IaL9ZLNmQLUz4
 w6dBL+rWxWN9zTQkgu4+xykUCaEf5WFtuHziQHjb27pijf0OHzRIR06q6
 gmru8QY5aFloe+OcfhT0zpASm+WpWuLTjA6mJzhgesuFrDB9+FDpVGv5H
 1zbMQryXqrAbsObleTDHFK+aO3HoWhDQnHD+0xMyWSF/jFivGlqxwRklO
 mVGNAddQqKssQ7x8I/Pod50cKaBv9u2ZxVdxyI+QMFxhEqV86txZUud69 Q==;
X-CSE-ConnectionGUID: MdmqjtaoRg2V8u7OkTfUBw==
X-CSE-MsgGUID: waUaVkttSLuqG+ZIDmWnkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53974848"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53974848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:03:32 -0700
X-CSE-ConnectionGUID: MmEYFT9cQ3Cx3bd7PBoXcQ==
X-CSE-MsgGUID: courr6zqQCmdo1gov35qEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154146071"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 03 Jul 2025 07:03:31 -0700
Received: from [10.245.112.168] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.112.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2483B2FC70;
 Thu,  3 Jul 2025 15:03:29 +0100 (IST)
Message-ID: <a22f999a-6d73-4f3b-8b49-6124482d7ed6@intel.com>
Date: Thu, 3 Jul 2025 16:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Invalidate LMTT after completing changes
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
 <20250702223041.1700-4-michal.wajdeczko@intel.com>
 <aGW1poOpWmu2qa8P@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aGW1poOpWmu2qa8P@lstrano-desk.jf.intel.com>
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



On 03.07.2025 00:41, Matthew Brost wrote:
> On Thu, Jul 03, 2025 at 12:30:41AM +0200, Michal Wajdeczko wrote:
>> Once we finish populating all leaf pages in the VF's LMTT we should
>> make sure that hardware will not access any stale data. Explicitly
>> force LMTT invalidation (as it was already planned in the past).
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index a75ef4007a1e..a1b916e80fdd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1327,7 +1327,17 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
>>  
>>  static void pf_force_lmtt_invalidate(struct xe_device *xe)
>>  {
>> -	/* TODO */
>> +	struct xe_lmtt *lmtt;
>> +	struct xe_tile *tile;
>> +	unsigned int tid;
>> +
>> +	xe_assert(xe, xe_device_has_lmtt(xe));
>> +	xe_assert(xe, IS_SRIOV_PF(xe));
>> +
>> +	for_each_tile(tile, xe, tid) {
>> +		lmtt = &tile->sriov.pf.lmtt;
>> +		xe_lmtt_invalidate_hw(lmtt);
> 
> If this is a critical path, you may want to consider issuing all TLB
> invalidations across all GTs/tiles, then waiting on all fences to
> pipeline these - we do this the VM code which is certainly a critical
> path. If this is not-so-critical here, maybe this is ok.

no, it's not on any critical path right now and btw I already have some
hybrid solution: first I'm sending TLBINVAL to all GTs per tile and then
waiting for those fences, as this was more self contained from the LMTT
SW component POV (since it's per-tile)

> 
> Matt
> 
>> +	}
>>  }
>>  
>>  static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>> -- 
>> 2.47.1
>>

