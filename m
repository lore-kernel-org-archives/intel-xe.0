Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866CCC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 08:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDB210E2A2;
	Tue, 27 Aug 2024 08:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8an9guO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EFD10E2A2
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724747359; x=1756283359;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=DGYUyYSkJYqoOBw4zv88kWfkR18zSZWoJbqFH/ga1go=;
 b=J8an9guOLkieFoLHOynf3nPp9MS/BjNMcorzzZOgOtNu8ena3m78/c1I
 5ejOwlFgtzql2TV83/DFMBhWaDTNa+oEFVZV+57Ctg9gafDm1ickoet+H
 1bbnAFiD1fchBfAV8+qwTDPc3/kpXQjwzRek+aZSoX6N1o7+WFFOMnJse
 oaB2qT/w9h/KSPDNqL1PvnMcXW22abJASeCPqzdoJP0C8l2GpcYO1mP/t
 T9p8w7fin9eZxWrLVQfpYM/5Easrt8nELICcQI/0xi/71wzqAbjkymqt/
 n3GwWES4+PDkTMoWqjIJMiWvvSL7c8lpUl+MU0wEMwiSbXkG/NDlkMctm A==;
X-CSE-ConnectionGUID: n70FjGOwRnO9xtl/OqDcOA==
X-CSE-MsgGUID: Ol1+PN0UTy6HqPdnFSJOQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33774558"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="33774558"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:29:19 -0700
X-CSE-ConnectionGUID: xbY6ZlYGRXqQd/arB1uxJg==
X-CSE-MsgGUID: BOuBilNgTPiAxbPPhI1P1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62774376"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.32])
 ([10.245.192.32])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:29:17 -0700
Message-ID: <48fe8239-2a90-4273-9e97-4eac94e18880@linux.intel.com>
Date: Tue, 27 Aug 2024 10:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Remove unrequired NULL check in
 xe_sched_job_free_fences
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
 <20240820090230.3258128-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240820090230.3258128-3-himal.prasad.ghimiray@intel.com>
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


On 8/20/2024 11:02 AM, Himal Prasad Ghimiray wrote:
> dma_fence_chain_free() can handle NULL input, there is no need for NULL
> check by caller.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sched_job.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 44d534e362cd..4ed0c366ccff 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -89,8 +89,7 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
>   
>   		if (ptrs->lrc_fence)
>   			xe_lrc_free_seqno_fence(ptrs->lrc_fence);
> -		if (ptrs->chain_fence)
> -			dma_fence_chain_free(ptrs->chain_fence);
> +		dma_fence_chain_free(ptrs->chain_fence);
>   	}
>   }
>   
