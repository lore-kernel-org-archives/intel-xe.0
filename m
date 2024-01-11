Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA9C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 11:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667A410E8E4;
	Thu, 11 Jan 2024 11:24:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7F10E8E1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 11:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704972298; x=1736508298;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=yES2sNAfKND6DZevBe25v2MtBK2Ag39I2PitibsbzVk=;
 b=Gr4CB04C47gbcDF7eJvkmuiUs2Rc7fRIDemmjTjiyLfIU1bh136AakrG
 g0UfJUkCODh7l4i5f7R3t04Lxj91Ypqyf44vbLTx0BX7h161yZGGonpR7
 2PzZ8E3ni79TIvv1P0SNDEp9Y0QEkBhp3S4xrpUdqQ0gI7No5zOdhl5A2
 VwAdtLvJzC9S2DpVvzuksmrJQU8Jp4O2N4IO5NYj1gs02hB9JCqHhmjno
 Cq91eDcIcUiirkCYIcSvT27pMeFp2zXaI/c1DNzoa+u5NsGsvf/eQv5sl
 AKbf1XBUCtNT3I+0e6blV9U2k+ajijnOlBaBpkVrW2IUarYX2MnJf4RVO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5547143"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5547143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 03:24:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="24297335"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 11 Jan 2024 03:24:56 -0800
Received: from [10.249.150.229] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 96D6C40E01;
 Thu, 11 Jan 2024 11:24:54 +0000 (GMT)
Message-ID: <c357339d-e62f-425d-b70e-73b7bc828d0e@intel.com>
Date: Thu, 11 Jan 2024 12:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Move TLB invalidation reset before HW reset
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240109230149.1399302-1-matthew.brost@intel.com>
 <20240109230149.1399302-3-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240109230149.1399302-3-matthew.brost@intel.com>
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



On 10.01.2024 00:01, Matthew Brost wrote:
> This is a software reset which can be done immediately after stopping
> the UC.

IMO there is too tight relation between TLB invalidation code and CT
internals (TLB code uses internal CT locks) but since this is not new:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3af2adec1295..c647f41b2751 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -619,12 +619,12 @@ static int gt_reset(struct xe_gt *gt)
>  	if (err)
>  		goto err_out;
>  
> +	xe_gt_tlb_invalidation_reset(gt);
> +
>  	err = do_gt_reset(gt);
>  	if (err)
>  		goto err_out;
>  
> -	xe_gt_tlb_invalidation_reset(gt);
> -
>  	err = do_gt_restart(gt);
>  	if (err)
>  		goto err_out;
