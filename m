Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3C9C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B927310E4FE;
	Mon, 13 May 2024 08:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJvkAjSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE9F10E4FE
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715588380; x=1747124380;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sQgj0P5cLzj12FwgbO7FiCJ0Qx8ZRktapjjqRdm20uo=;
 b=bJvkAjSbVSDLlLdsbYF5XzQFcmNsqQEHwXgMLYJKhfT+0D3VXDTOzlX9
 /7l2/B7FOyk0UqkoXfR/j5Um5YDREOpS5/blQmn9FbgN4oQVgHqNT/u82
 cdnfqe2ybibOgUTZ3GN1Nf/S0JUIxqFoFN479u0HECOmezYwrHBeSWwli
 /fXw1mLOLDZ0wcSs981v/XJ2aFy8DHw80w7TcwwW6ggFkOjJKSLCRCEt0
 ngD28ZYK5Lc81U0Ujs9UPKVX6EPuFKjmIFSoIYrFxQ3SKKFeZMq/Rt1/i
 mw+h1rZZSPDMAQmr1JlU1bjLIPuq4v28YlZQS85clIEc8oPQByECvAZ63 A==;
X-CSE-ConnectionGUID: Ta52eVqjRoKpkSE3gomulg==
X-CSE-MsgGUID: /ztBTa7CSqaQ5Cg80mB/kQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22913818"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="22913818"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:19:39 -0700
X-CSE-ConnectionGUID: bFDigYHhRyShwwFn435MHQ==
X-CSE-MsgGUID: msUuIz6oQySHaFJvveHM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="61453689"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:19:38 -0700
Message-ID: <c6395f41-462e-4ad7-bedf-67828e255469@intel.com>
Date: Mon, 13 May 2024 10:19:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] drm/xe/display: stop calling domains_driver_remove
 twice
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-41-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-41-matthew.auld@intel.com>
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
> Unclear why we call this twice.

Hmm, where is another call, I couldn't find one.

Andrzej


> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_display.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 6d74c9f55b0a..734bddbb8932 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -134,7 +134,6 @@ static void xe_display_fini_noirq(void *arg)
>   		return;
>   
>   	intel_display_driver_remove_noirq(xe);
> -	intel_power_domains_driver_remove(xe);


>   }
>   
>   int xe_display_init_noirq(struct xe_device *xe)

