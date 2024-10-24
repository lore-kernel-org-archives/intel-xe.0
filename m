Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BFDCE8E68
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 11:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B35510E116;
	Thu, 24 Oct 2024 11:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNmmqt6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4886710E116;
 Thu, 24 Oct 2024 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729770287; x=1761306287;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9mSzhO+ErZOeRSj52LzGOO8SchPTv+grUXxOUAT11hQ=;
 b=TNmmqt6HCw0DCYBp49nuzUNKAlnhxuKsz0Pe6C3Ojobb0XjFTwhcLMgZ
 ct+j8PX5O353d3k1VOISoqoYXfmeLJ+7U3oKS5sqbF49XsgxeCQjNO+hW
 uKV5nkplFiV7j12YpbbEyDagjtwWEbi4EVDJeZ2bdxGNnNXsLTRVIMNC+
 HaKkDpyUU9304bChupOid1yqHfRklpvMuWdrBbKUgSj8EbCl9CcwrYKBT
 LglQovO/GIApdGmwuXuJZJynde+dzFZnV3tZLuvMj483jKWqhuEPPWA47
 mAurCu3u5jtA0mvKiffIkNhFD0NpFMTdZvWfxDVXnzJcWKjgjKyt8wduH g==;
X-CSE-ConnectionGUID: 2099tUqPR+OBEJG9LEiZeQ==
X-CSE-MsgGUID: cnHC3+qDThOTQXlJZaGG2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29558823"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29558823"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:44:47 -0700
X-CSE-ConnectionGUID: v8oXwH+SQkiBscjtsC2V8Q==
X-CSE-MsgGUID: ureBgiElTpK572YobXQzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="118038115"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.128.192])
 ([10.245.128.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:44:45 -0700
Message-ID: <74f7344a-dd8e-4b20-a980-daf9b188df7b@linux.intel.com>
Date: Thu, 24 Oct 2024 13:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, pstanner@redhat.com, ltuikov89@gmail.com
References: <20241023235917.1836428-1-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241023235917.1836428-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 10/24/2024 1:59 AM, Matthew Brost wrote:
> drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in the path
> of dma-fences, and dma-fences are in the path of reclaim. Mark scheduler
> work queue with WQ_MEM_RECLAIM to ensure forward progress during
> reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
> progress during reclaim.
>
> v2:
>  - Fixes tags (Philipp)
>  - Reword commit message (Philipp)
>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for submit_wq")
> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Acked-by: Nirmoy Das <nirmoy.das@intel.com>

Looks like Xe has a dependency on this now that xe->ordered_wq is allocated with  WQ_MEM_RECLAIM flag:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 540231e6bac6..df0a5abb1400 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1283,10 +1283,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		sched->own_submit_wq = false;
>  	} else {
>  #ifdef CONFIG_LOCKDEP
> -		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name,
> +								       WQ_MEM_RECLAIM,
>  								       &drm_sched_lockdep_map);
>  #else
> -		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> +		sched->submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
>  #endif
>  		if (!sched->submit_wq)
>  			return -ENOMEM;
