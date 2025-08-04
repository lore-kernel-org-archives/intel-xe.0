Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1A3C87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 13:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947A410E537;
	Mon,  4 Aug 2025 13:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baY1mM3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194DB10E1FA
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754315449; x=1785851449;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9kLGrRQTdkt0EegxldM+lwM40AQKyXKjNqxA/sLImYc=;
 b=baY1mM3tUv9vpXM7qnp6lsndbqlZIZQ7qClJ1Teb7VMpyhleS1u+hvtN
 7yTurLvLV1ZGgtJyVHu0XZ0Yt36vfgo+F7KdNS4/29CjKse9iJwg1OYQ2
 O/t8NfT/SVvHA1FoTMyCcGbQ4VXJGbf+uJVfIsvMjKuj1TsoprivLbj88
 PGChO7YWL1eM1O2CLu7/xOo/nnMrK/NBSEdLUlfx2q/QuXH48AXfTsTDL
 sD7v3FSDI+nplY3FZERPyKr64mW5gwCL80vfO8PXZkeGd8LWrhr2htbTH
 YGb4cEI/XP0hojTikZIWr3+iH9UCS5BFuhnUCkYPpPluAPBWVCL73CGg2 w==;
X-CSE-ConnectionGUID: 16jrjIoHQ+W3c3Ew4a4bag==
X-CSE-MsgGUID: 9OWLB0aMQwiANhgDOPr2Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="59194731"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="59194731"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 06:50:49 -0700
X-CSE-ConnectionGUID: gUROvvdUSC6zsjJwYbVERg==
X-CSE-MsgGUID: WU4lM0akSgOWhVBKLlAfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164562495"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.97])
 ([10.245.245.97])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 06:50:48 -0700
Message-ID: <e9f4b13d-f3be-4b5b-9efb-35e809c21e6a@intel.com>
Date: Mon, 4 Aug 2025 14:50:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix coverity issue, overflow_assign
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com
References: <20250804134543.3313558-1-pravalika.gurram@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250804134543.3313558-1-pravalika.gurram@intel.com>
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

On 04/08/2025 14:45, Pravalika Gurram wrote:
> Safe cast of error code from long to int
> 
> Fixes: cda06412c0689 ("drm/xe: Wait for migration job before unmapping pages")
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1a72561f987c..a1e82c879f1e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -988,7 +988,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   						     false,
>   						     MAX_SCHEDULE_TIMEOUT);
>   		if (timeout < 0)
> -			ret = timeout;
> +			ret = (int)timeout;

On this error path it should only contain some standard error code which 
will easily fit inside an int. I have at least seen this pattern plenty 
of times elsewhere, even outside of xe, so this seems more like a false 
positive?

>   
>   		if (IS_VF_CCS_BB_VALID(xe, bo))
>   			xe_sriov_vf_ccs_detach_bo(bo);

