Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118A1C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 12:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE3010E8B6;
	Fri, 26 Jul 2024 12:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMsM/Vks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEA110E8B6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721997380; x=1753533380;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=b1zS0iFMdoTkJ7WXtcZCwed8SLMcXtk5JwcmBbl4oKw=;
 b=WMsM/Vkszm9czmLUn3n66i39g3BYAMurc3BVKwMWqCLGLgKwPEdjNHg3
 rZCLjB9wxPugsayT84ar6OaQ1coBJ65Oyf3jZeTjgs29jYTd4MvYeOmyb
 z+LxY/Wyij9leLdXHb7EHHl0uJzlwHszFa/i3rAu2MkwQ4R7O3s4ybY/x
 VCBeCTQDTs04S4++BDsOOBqtZFslbaEHdWudKudmcinv06IO2P2DR7fA1
 6YHKZEcrPrrE0nejlPOy+Pi6gr8B5sDil+4/kenz1YTtF1TjyfTs6pGes
 /8Df6aPh9CjOyomx8IpiSS6HHkE+l9n7+/Qz8iQWyXCobyHjgpO/2uQ2y A==;
X-CSE-ConnectionGUID: Li1ilnYZRiWF392pQVbq1Q==
X-CSE-MsgGUID: ubleaujWSx2Y3+ad4loMPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="31201437"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="31201437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 05:36:20 -0700
X-CSE-ConnectionGUID: U29ehcM3T4Sp9F6ScMzGag==
X-CSE-MsgGUID: Pz3OIoVxSU2S/UGqOEvGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57527618"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 26 Jul 2024 05:36:18 -0700
Received: from [10.246.27.12] (mwajdecz-MOBL.ger.corp.intel.com [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0550D284EE;
 Fri, 26 Jul 2024 13:36:17 +0100 (IST)
Message-ID: <2de91aaa-befe-44f7-ab47-ae6563bf0a08@intel.com>
Date: Fri, 26 Jul 2024 14:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Assert G2H outstanding when releasing G2H
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240725231801.1958038-1-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240725231801.1958038-1-matthew.brost@intel.com>
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



On 26.07.2024 01:18, Matthew Brost wrote:
> Ensure we are managing G2H credits correctly. Extra important now that
> this is tied to PM.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 64afc90ad2c5..beeeb120d1fc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -516,6 +516,7 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  	lockdep_assert_held(&ct->fast_lock);
>  	xe_gt_assert(ct_to_gt(ct), ct->ctbs.g2h.info.space + g2h_len <=
>  		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
> +	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding);
>  
>  	ct->ctbs.g2h.info.space += g2h_len;
>  	if (!--ct->g2h_outstanding)

this all g2h credits handling looks complex, more asserts is better,
especially since we do --ct->g2h_outstanding, so with CI happy:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
