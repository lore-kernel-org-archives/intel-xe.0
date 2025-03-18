Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25950C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 14:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1A110E178;
	Tue, 18 Mar 2025 14:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlhM6wRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C076A10E178
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Mar 2025 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742308541; x=1773844541;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nBIWIowGU/RsPrKallLT3te6PoJyDMTc5/DC/xEdNPA=;
 b=AlhM6wRos7REh5l7u5SAUKHdj/VpzE0o9SaSJNY9YHGJv/67DgT5hcVk
 UrOXWaEtZo5ZYMyxxo6u3tmnhX7M05V8TgQyDOmYwLns6xJzA7jLG8e6U
 9/C+tp4pez7jS9VzXwpH993488K9eIQlKuzrDhyhdzEXzaT1HVRzv2nzQ
 pJIdIb3Hko+vTSb1Vk7/kj/bMkZWlomG/nzL1bgec+Ti2hFv3haHHvIsn
 J1bpd/138DIk9K05pwqhhAIwAIfBx09dNE5l43Bvn45FNxohk8x+5Jubt
 iRB9Nd+zF+6TeVFpwOmRecLATwa5GAm4F4uhiMl29KcgMwtyq/PRz3hfa Q==;
X-CSE-ConnectionGUID: AIb1LAmvQw2G2t2ACmxqDg==
X-CSE-MsgGUID: z6Hyqf0DQqa6CQraNfUDxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54444969"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="54444969"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 07:35:40 -0700
X-CSE-ConnectionGUID: cHp7EFrYQ82MqN45eNdKnw==
X-CSE-MsgGUID: BJOdhpcRThWZGHa8oRMf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="126946761"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2025 07:35:39 -0700
Received: from [10.245.252.130] (unknown [10.245.252.130])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 236663432A;
 Tue, 18 Mar 2025 14:35:38 +0000 (GMT)
Message-ID: <4928bef5-a008-4af2-80ca-d7c5bddeb671@intel.com>
Date: Tue, 18 Mar 2025 15:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/guc: Disable lite restore for MTL
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20250318141802.2516616-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250318141802.2516616-1-zhanjun.dong@intel.com>
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



On 18.03.2025 15:18, Zhanjun Dong wrote:
> Lite restore for MTL is not POR for Xe, then disable it for MTL.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index bc5714a5b36b..0c2629e578d9 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -80,7 +80,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>  
>  static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>  {
> -	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
> +	u32 flags = (guc_to_xe(guc)->info.platform == XE_METEORLAKE) ?
> +		    0 : GUC_CTL_ENABLE_LITE_RESTORE;
> +

please avoid long conditional initialization code,
all this could be done in a simpler/unified way:

	struct xe_device *xe = guc_to_xe(guc);
	u32 flags = 0;

	if (xe->info.platform != XE_METEORLAKE)
		flags |= GUC_CTL_ENABLE_LITE_RESTORE;

>  
>  	if (!guc_to_xe(guc)->info.skip_guc_pc)
>  		flags |= GUC_CTL_ENABLE_SLPC;

