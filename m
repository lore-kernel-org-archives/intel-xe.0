Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574FDC47422
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 10:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F230B11284A;
	Mon, 29 Jan 2024 10:40:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60145112857
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706524853; x=1738060853;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E9LSyWENOuN3zrDerSYUtP0GLc5bw/oK5lgKUn2Bh3Y=;
 b=LZLjjV1jtzZywA6+LlBF8bK8++eKrkzVz7cEh1og/EEDMKxLiL38zcKH
 sfDfJwKe31E+bsd7XG5/ec52+GiYzzgm9D+m8l9R8KQjUHIMvk6fsegPr
 pVBndmV7BZHTX65L0oNM3thimxSORs6xTUsrQKT0CRFK3jCm9rmnbVK5f
 u2D8pYD2EVgge1fyshUsX27YOyORVVQJFP2jADqANOIOzf+t9rl3SuDBY
 jKH5PiDhwCJ4bKQa2fOxHTi93aTgTEl5lbTZU8FYDRFPDoJOzEVo5uX/h
 CdEONsjZnzKmEv+bU8nmztCJR80lP3HPMeOwppBi5w23tdd9qtjhNmTS6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="393349114"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="393349114"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 02:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="911025491"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="911025491"
Received: from cbowler-mobl.ger.corp.intel.com (HELO [10.252.19.51])
 ([10.252.19.51])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 02:40:52 -0800
Message-ID: <aa3a630d-7c67-4374-8f61-78d3a432c8ad@intel.com>
Date: Mon, 29 Jan 2024 10:40:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Grab mem_access when disabling C6 on skip_guc_pc
 platforms
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126220613.865939-2-matthew.d.roper@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126220613.865939-2-matthew.d.roper@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 26/01/2024 22:06, Matt Roper wrote:
> If skip_guc_pc is set for a platform, C6 is disabled directly without
> acquiring a mem_access reference, triggering an assertion inside
> xe_gt_idle_disable_c6.
> 
> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
> Rodrigo has a pending series to kill off mem_access in general, but
> that's a large, complicated series that will probably take some time to
> land.  This quick fix is still useful in the meantime.
> 
>   drivers/gpu/drm/xe/xe_guc_pc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f71085228cb3..d91702592520 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -963,7 +963,9 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
>   	struct xe_device *xe = pc_to_xe(pc);
>   
>   	if (xe->info.skip_guc_pc) {
> +		xe_device_mem_access_get(xe);
>   		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +		xe_device_mem_access_put(xe);
>   		return;
>   	}
>   
