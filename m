Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B51C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 17:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681910F137;
	Mon, 18 Mar 2024 17:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4MRMA9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871DF10F137
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710783706; x=1742319706;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p7yMeJ1JHzMcXnnYgI9zYjN3vrmblAI1EJnm4z2QNww=;
 b=I4MRMA9DdgSOnK0ahXSzQqAv3VDh/NgDI/O4hPk4ZNDzr4i0AcGtvLDQ
 ifjKamv2UrEDWYRa+EGISTaAmgH5aiygNl9kDnn6LANj35KKhdcA3zJMt
 dSumj3CSe3d4hZ8neTYBzY4h9tIyhFe+80Nnug3pyF0DnmqxiaF9LvC0G
 OQkHMxLEUO5izagaB9I/GLzROG+MSSe3AIqIVgAMapaIg9VXwuiK+Nnd4
 iaDop5z3JJVdUc91+EoYpCGtgL2Vr1AOJQyQYmBL++Zr6aYaz8dh5oyjH
 4BW46jmlu1YSJRui4r2JTkyS5sLntxdvD/C4G40ItBxn1xPQng9BAhCBM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="9440446"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9440446"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 10:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18112267"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2024 10:41:44 -0700
Received: from [10.249.155.246] (jachreni-mobl3.ger.corp.intel.com
 [10.249.155.246])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 029EA28775;
 Mon, 18 Mar 2024 17:41:42 +0000 (GMT)
Message-ID: <5f468d07-be94-479d-a0ae-6e8c76486f11@intel.com>
Date: Mon, 18 Mar 2024 18:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240318164342.3094-1-nirmoy.das@intel.com>
 <20240318164342.3094-2-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240318164342.3094-2-nirmoy.das@intel.com>
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



On 18.03.2024 17:43, Nirmoy Das wrote:
> Add a warn for NULL job when sync->type is
> DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
> error and should never happen so warn and let the kernel crash
> if that ever happens.

IMO adding WARN and then let kernel crash is pointless as you will have
almost exactly the same report as from NPD

for programming errors we should xe_assert() that will provide necessary
hint during code refactor but will be compiled on production builds

only if you feel that that job could be still (but unlikely) NULL then
you should use drm_WARN/xe_gt_WARN and provide necessary fallback

> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 02c9577fe418..247505c3478d 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>  			dma_fence_put(fence);
>  		}
>  	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
> +		XE_WARN_ON(!job);
>  		job->user_fence.used = true;
>  		job->user_fence.addr = sync->addr;
>  		job->user_fence.value = sync->timeline_value;
