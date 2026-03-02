Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B2EB3633
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC7E10E36C;
	Mon,  2 Mar 2026 20:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtQSAFbZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10C10E36C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 20:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772484304; x=1804020304;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9I2+mEPa7NxCRX220PgjQYU72fVD3rhhW2qohLXitZ8=;
 b=GtQSAFbZZ6KNPwxVs4kBIIeqL0J4qg5BIMQ0r8gx2Zskl65ynUYfoXoI
 yKFlXnnH9SmxZDXjQAmxrQyrNJpKcHha4IluceMvBugVrn2w6tobPLVXL
 zMXTAnx868O4bjghGLvCbXehkQ0ntE0tgEFLBq/SL9nRNlfxXp0tcZ1f+
 wP8rR55yoiIfKEpKO57iSo0HGOLR5jmRAJUjvnSydwS3C0NPV84ZPd5kI
 SBSlsvsiJNi2mk+q9MIUuTzIsDzYaTy3pTa3W8MLDTRV3ANnvCO5ON3Qj
 rHFVV7lAWkc7bJGeGWB/1550tSckVJ+U2+8s6DP5QngDS+f76WUJmP6f7 A==;
X-CSE-ConnectionGUID: 59wYOvxbR4SLt6SvpTbGNw==
X-CSE-MsgGUID: qW8rqQn3QiSCyWehdIFZCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72534792"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="72534792"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:45:04 -0800
X-CSE-ConnectionGUID: kuYd4bT9RpmbHfOAadWY4Q==
X-CSE-MsgGUID: h1aLMEPQRMay/MOFwmW7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215362053"
Received: from unknown (HELO [10.241.241.198]) ([10.241.241.198])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:45:04 -0800
Message-ID: <6569e4c4-1d60-40cc-b9f2-9bf0b0c0441c@linux.intel.com>
Date: Mon, 2 Mar 2026 12:44:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2_hpg: Correct implementation of Wa_16025250150
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Cc: Aradhya Bhatia <aradhya.bhatia@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, stable@vger.kernel.org
References: <20260227164341.3600098-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20260227164341.3600098-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Matt,

On 2026-02-27 08:43, Matt Roper wrote:
> Wa_16025250150 asks us to set five register fields of the register to
> 0x1 each.  However we were just OR'ing this into the existing register
> value (which has a default of 0x4 for each nibble-sized field) resulting
> in final field values of 0x5 instead of the desired 0x1.  Correct the
> RTP programming (use FIELD_SET instead of SET) to ensure each field is
> assigned to exactly the value we want.
>
> Cc: Aradhya Bhatia <aradhya.bhatia@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: <stable@vger.kernel.org> # v6.16+
> Fixes: 7654d51f1fd8 ("drm/xe/xe2hpg: Add Wa_16025250150")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

This looks good to me.

Reviewed-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>

Thanks,
Ngai-Mint Kwan

> ---
>   drivers/gpu/drm/xe/xe_wa.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 26950b8a7543..183c5c86c35a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -249,12 +249,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>   
>   	{ XE_RTP_NAME("16025250150"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
> -	  XE_RTP_ACTIONS(SET(LSN_VC_REG2,
> -			     LSN_LNI_WGT(1) |
> -			     LSN_LNE_WGT(1) |
> -			     LSN_DIM_X_WGT(1) |
> -			     LSN_DIM_Y_WGT(1) |
> -			     LSN_DIM_Z_WGT(1)))
> +	  XE_RTP_ACTIONS(FIELD_SET(LSN_VC_REG2,
> +				   LSN_LNI_WGT_MASK | LSN_LNE_WGT_MASK |
> +				   LSN_DIM_X_WGT_MASK | LSN_DIM_Y_WGT_MASK |
> +				   LSN_DIM_Z_WGT_MASK,
> +				   LSN_LNI_WGT(1) | LSN_LNE_WGT(1) |
> +				   LSN_DIM_X_WGT(1) | LSN_DIM_Y_WGT(1) |
> +				   LSN_DIM_Z_WGT(1)))
>   	},
>   
>   	/* Xe3_LPG */

