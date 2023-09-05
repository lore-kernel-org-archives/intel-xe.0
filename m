Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46160C83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 15:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1022410E096;
	Tue,  5 Sep 2023 15:04:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A26A10E096
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693926291; x=1725462291;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vq4JHalgzlifEurzSuNek4fkHozPO5UNgQr8bGTpNR0=;
 b=XuDVCKw330pDZ45p2heA4KGBSSPV/EXG0vcqL/deNgESSAIuXxYkMpJn
 3HLdSM8/O6uNBwZtPpqsBiOd/S6sSZD3bkxF9iEHNt/k3xgfCIc0DQwwX
 iYsEEazQEQlglboaLs2685OMQEF4cGal6XzhgiJ573jRvOaQSh0duX08c
 kUOl3gcwM6N5YRXE5Ia6WZnbzM/klNAwIHIbAhiTlSoMd4oQ5t9qQNqKq
 A36rpne7p9QyQkjSJ8mRHzACeR7NaLbLpp7Cjq+MRf89Bt+FIpZRD840f
 ZOljtRUgpi2dxT8VnlnMDIrKGhn0OpG4spceWcJxgmjJWhTjBDipZ3NSH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367037672"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="367037672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 08:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="690959793"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="690959793"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 08:04:10 -0700
Received: from [10.249.135.85] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.85])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4AAD92FC6F;
 Tue,  5 Sep 2023 16:04:09 +0100 (IST)
Message-ID: <753666f8-0d87-9bb6-87db-4784b8b71dc0@intel.com>
Date: Tue, 5 Sep 2023 17:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-3-lucas.demarchi@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230905143144.1706967-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add dbg messages for LRC WAs
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 05.09.2023 16:31, Lucas De Marchi wrote:
> Just like the GT and engine workarounds, add debug message with the
> final value being written to the register for easy debugging.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3d6a7c11bac1..bd307770a620 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -116,6 +116,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  
>  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>  	struct xe_reg_sr_entry *entry;
>  	unsigned long reg;
> @@ -133,10 +134,14 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  		++count;
>  
>  	if (count) {
> +		drm_dbg(&xe->drm, "LRC WA %s save-restore MMIOs\n", sr->name);

shouldn't we use xe_gt_dbg() here?

> +
>  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
>  		xa_for_each(&sr->xa, reg, entry) {
>  			bb->cs[bb->len++] = reg;
>  			bb->cs[bb->len++] = entry->set_bits;
> +			drm_dbg(&xe->drm, "REG[0x%lx] = 0x%08x", reg,
> +				entry->set_bits);
>  		}
>  	}
>  
