Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E0CCCD19A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 08:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E0D10E010;
	Fri, 17 Oct 2025 08:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGPr8ZAA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CEB10E010
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760691297; x=1792227297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vkm6wsLrA7HX6SWrTTPHbNjUCNg74q3K4wMAHTjJC3g=;
 b=SGPr8ZAALaOXqOiLOzopByTgD5soUj3mcSnuvZu0jMIpzCj54qlZckox
 V9RNwl1VN6X6zF6+xV03BIf9KnyRSGhf4/bulS+Yis7O1BR9CSWUT8gHX
 2kAN6M7VeCUmJKm+JieGaDcXWBH2NsZzSyTEkXspF3B3LU59Lh6bt3WZc
 0Q4C4PkwxfD/jtJwi8L2WlI8O2zGqU+M6oMm9Umuk6qs7S9mHtewNxsPO
 upwDcby96ewD8PpudUVXb24tI64RhjNmrow/60y7hW0lqZ2R18KSnv+wr
 NVJZN3PosZC0HqcT0sq8S74Td+mLxWV3rFnU5jyoEa3NXQp+WrIJLWfB+ w==;
X-CSE-ConnectionGUID: WAuwzWJsTNapEWIz1jItbA==
X-CSE-MsgGUID: mBXNkNBVQqqNQfbPppL5PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88368390"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="88368390"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 01:54:57 -0700
X-CSE-ConnectionGUID: s3fQw+H7RF6l/QkoXgw9mw==
X-CSE-MsgGUID: 3OJ5mZpQTBapxmjvQd254w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="186713490"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.244.103])
 ([10.245.244.103])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 01:54:56 -0700
Message-ID: <466c6ba9-7bdc-44b0-bdcc-89fd51150f03@intel.com>
Date: Fri, 17 Oct 2025 09:54:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix stolen size check to allow equal WOPCM size
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251016225506.2256127-2-shuicheng.lin@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251016225506.2256127-2-shuicheng.lin@intel.com>
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

On 16/10/2025 23:55, Shuicheng Lin wrote:
> On some platforms without dedicated stolen memory, the calculated
> stolen size may be exactly equal to the WOPCM size. The current
> assertion incorrectly requires it to be strictly greater, causing
> a false failure. Relax the check to allow equality.
> 
> Fixes: 65369b8e2961 ("drm/xe: Change return type of detect_bar2_dgfx() from s64 to u64")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6359
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Looking at the logs for PVC it has previously never been probed with an 
actual usable stolen area it seems, so this looks correct to me.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index e368b2a36bac..1bddecfb723a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -106,7 +106,7 @@ static u64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   
>   	stolen_size = tile_size - mgr->stolen_base;
>   
> -	xe_assert(xe, stolen_size > wopcm_size);
> +	xe_assert(xe, stolen_size >= wopcm_size);
>   	stolen_size -= wopcm_size;
>   
>   	/* Verify usage fits in the actual resource available */

