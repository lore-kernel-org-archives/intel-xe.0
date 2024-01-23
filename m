Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EAEC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DA910E8D0;
	Tue, 23 Jan 2024 20:14:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC75A10E8B5
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 20:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706040862; x=1737576862;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uwi/R7eT4ZHr/p1Ir29zXmuWAyxBTRyXR/3KJZJSNNs=;
 b=M8xYgVQXD+zG2r7Blg+EQJn9QeyzR+xgNTBuOTOHYSrMkL150L+M2DMY
 naXK2BAa2jFNzRiCdO3tq9pO4m1ZzmZnNEI49sHu3rzJBo4/rEs7sN2Rm
 8jM836Z6b2ysKIv1bkxTnhKOFy6mI/P5mGR8GC0LiAtRXyZIn5Yxq2Mr+
 4wcPvw4GjD0u/uQ8a1tifLJ/o5h+ds9bNqCdDXx2siwtTmOy2E7a4VACL
 +wjDjwWhh6OEFemAWfl1Ii10qbt+UaYaMXnWFBHEMkm2IPVYIgIb2cclY
 Vo6X7kmdMQSN6yDyH3BArPX0DXwT//aPR8U8uaXEHWjzkhb8HemZBQWSy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1527520"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1527520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1732573"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 23 Jan 2024 12:14:13 -0800
Received: from [10.246.32.115] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.32.115])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 71208371EC;
 Tue, 23 Jan 2024 20:14:07 +0000 (GMT)
Message-ID: <194d5e8d-e462-474b-93ac-154f82ecb4b4@intel.com>
Date: Tue, 23 Jan 2024 21:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Prefer BIT/GENMASK macros over shifts
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240123190201.1599333-1-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240123190201.1599333-1-matthew.brost@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 23.01.2024 20:02, Matthew Brost wrote:
> Using BIT/GENMASK macros is a better convention than using manual shift
> and will also fix build errors [1].
> 
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112475/log/

commit message and diff doesn't match (missed patch ?)

and the actual problem was only due to missed "u" suffix in
GUC_CTB_MSG_0_FENCE and GUC_HXG_MSG_0_ORIGIN definitions (as using 0x
notation alone really doesn't make those integer definitions unsigned)

note that those were already fixed on i915 by commit 962bd34bb457f6353f
and discussed here in [1]

[1] https://patchwork.freedesktop.org/patch/573620/?series=128312&rev=1

> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c    | 2 +-
>  drivers/gpu/drm/xe/xe_guc_relay.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index ee5d99456aeb..fc5cc2b2bcc5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -866,7 +866,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	 */
>  	if (fence & CT_SEQNO_UNTRACKED) {
>  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> +			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%lx, h=%lu\n",
>  				  fence,
>  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index c0a2d8d5d3b3..2d1f19270d9a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -300,7 +300,7 @@ static int relay_send_transaction(struct xe_guc_relay *relay, struct relay_trans
>  		ret = -EPROTO;
>  	}
>  	if (unlikely(ret < 0)) {
> -		relay_notice(relay, "Failed to send %s.%x to GuC (%pe) %*ph ...\n",
> +		relay_notice(relay, "Failed to send %s.%lx to GuC (%pe) %*ph ...\n",
>  			     guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, buf[0])),
>  			     FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, buf[0]),
>  			     ERR_PTR(ret), (int)sizeof(u32) * txn->offset, buf);
