Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED56CC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 07:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796A610E409;
	Mon, 13 May 2024 07:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GeCCf5FB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D256110E409
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715585461; x=1747121461;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u35TNg3QDnfmhYlUkT5wv53fSnoum5xnT/WIHaNQsxI=;
 b=GeCCf5FB2gswGPmgtYBaAzX/P0+SqaJw9e5UtQ4OrjWpD25Dy+8FsXVh
 bh6w/NqSMaz41mFYiqIIT80BWZEQrzcqbgkI4QA5gpeGdqEsumbUk3UxC
 ZHzE+TTZum4Lr4opEdGTwiGgmzxdFG86C7VmrT4TRaQ+e2LjJMRVFyek/
 KMcd3DNxzrKZMhnIse1+DJnr7evQHChPgSfhzltceWRCV9xhq03xJ+WCZ
 gOeWXV4bXaC5SLyELgsrSx88WbUmsm3ij8a0hdSEXLcNRkVwbKyZ5jA27
 jTmGmoj57guLsZ5CeGjhHoqYZja4d6W8hPEFPikIQpkx55jUZVxCX2vC6 g==;
X-CSE-ConnectionGUID: fJRA1FF2Sjer2YozWmblug==
X-CSE-MsgGUID: n39lPJW+TXCeZByhzeL+ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22105235"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="22105235"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:31:00 -0700
X-CSE-ConnectionGUID: 9pFuyQffSsWMWp1bva0Lhw==
X-CSE-MsgGUID: s/0VCFHSRZ6QAiWRFzRQaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="67752717"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:30:58 -0700
Message-ID: <79dcb114-70e8-400b-ac4e-8b354f5b3319@intel.com>
Date: Mon, 13 May 2024 09:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] drm/xe/guc: s/guc_fini/guc_fini_hw/
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-29-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-29-matthew.auld@intel.com>
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

On 10.05.2024 20:12, Matthew Auld wrote:
> Make it clear that is about cleaning up the HW/FW side, and not software
> state.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 97e2b62df486..90d994e85e43 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -239,7 +239,7 @@ static void guc_write_params(struct xe_guc *guc)
>   		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
>   }
>   
> -static void guc_fini(void *arg)
> +static void guc_fini_hw(void *arg)
>   {
>   	struct xe_guc *guc = arg;
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -323,7 +323,7 @@ int xe_guc_init(struct xe_guc *guc)
>   	if (ret)
>   		goto out;
>   
> -	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini, guc);
> +	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>   	if (ret)
>   		goto out;
>   

