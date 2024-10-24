Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0704ACFA451
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 10:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BBA10E271;
	Thu, 24 Oct 2024 10:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2M6/Kwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC6610E271
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729765039; x=1761301039;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rJQgJpH0ElRxvH87dN8PgZDsDlpzZz9/2ocJqMFevYM=;
 b=Z2M6/KwpNQLs4jaC7r3vcLo451EIKSYDSfCGcADcyAI72ohxUOylMX8g
 wYAp7D1oaOgqHf6iJCqSf6re2hSvYeCqg+oE7EmHjlwr9G2XtWk6X84Gu
 Ga/LllKKcKizcB3x/jHXqxUKOhgAZkUomeVjFoNBo3GHJUjFNYbP+Bo8W
 6AYw3Y2W5dA1nbtAt6YYqYUbi7Y0GVmBK+/prD1F3rpa7B1jLOuJVUr7d
 Edi58gOVo1n1azeVf9aQiUe2hSyc7A0GCXAWWSs+GMrU8+3nmZ9t31F/C
 fwKCZrI33eGaCuM4JWGsE4VdZUuGfSiNicAIuGDShVr5obDO7I+Mkgt4+ w==;
X-CSE-ConnectionGUID: WUJXpikESlmVgYrs4rkkeQ==
X-CSE-MsgGUID: TgF1LWGeSFOIvJkyWsw0Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29552060"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29552060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 03:17:19 -0700
X-CSE-ConnectionGUID: wooecbqyQtqNL7sM7WcweA==
X-CSE-MsgGUID: KZUkaKcsSICGiJdEtDtReg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="103867594"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.144.35])
 ([10.245.144.35])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 03:17:16 -0700
Message-ID: <6179d84e-a746-467e-a0ef-a04567dc0554@linux.intel.com>
Date: Thu, 24 Oct 2024 12:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Anshuman Gupta <Anshuman.Gupta@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
 <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
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


On 10/24/2024 12:02 PM, Nilawar, Badal wrote:
>
>
> On 23-10-2024 20:43, Nirmoy Das wrote:
>> Flush the g2h worker explicitly if TLB timeout happens which is
>> observed on LNL and that points recent scheduling issue with E-cores.
>> This is similar to the recent fix:
>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>> response timeout") and should be removed once there is E core
>> scheduling fix.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 773de1f08db9..2c327dccbd74 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>       struct xe_device *xe = gt_to_xe(gt);
>>       struct xe_gt_tlb_invalidation_fence *fence, *next;
>>   +    /*
>> +     * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>> +     * in case of g2h response timeout")
>> +     *
>> +     * TODO: Drop this change once workqueue scheduling delay issue is
>> +     * fixed on LNL Hybrid CPU.
>> +     */
>> +    flush_work(&gt->uc.guc.ct.g2h_worker);
>
> I didn't get the idea of flushing g2h worker here. Moreover AFAIK tlb invalidation is handled in fast path xe_guc_ct_fast_path i.e. in IRQ handler itself. Is this change solving the issue.

AFAIU g2h worker can also handle TLB_INVALIDATION_DONE message from GuC(process_g2h_msg). This indeed fixes the issue from me for LNL.


Regards,

Nirmoy

>
> static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> {
>         if (!xe_guc_ct_enabled(ct))
>                 return;
>
>         wake_up_all(&ct->wq);
>         queue_work(ct->g2h_wq, &ct->g2h_worker);
>         xe_guc_ct_fast_path(ct);
> }
>
> Regards,
> Badal
>
>> +
>>       spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>       list_for_each_entry_safe(fence, next,
>>                    &gt->tlb_invalidation.pending_fences, link) {
>
