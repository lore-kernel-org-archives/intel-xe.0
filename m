Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AAEC77B75
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 11:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DBC10E02A;
	Fri, 21 Apr 2023 11:02:59 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461B010E02A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682074977; x=1713610977;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YoKK+feSOQFHSfTtMRAh9pIa1BlZdD5mrDbsMKhy7rc=;
 b=M5eJvSJ00WAhS8psPuFoHQuSTLXNA+0ixF1xLXfh9ztqsbjC84SKyaID
 l6JK60X3nCWANU4zssmaaqay68AtvPpvFda2PzXIU0Z7S9OAsytYfFYs/
 uxLKNCjzcNYVwaX9wF77Wp7+T+ZdQ9WDT1rSiQHV/Bo97jGih5cvILv9h
 Wu6yU7AQ+TggK16Caxobc9f7RgXw1pLW3YKSH3c/6xDofD5CumyW2leGw
 tWDDxkiMrhvYsdHV2hEvTRSyfwqc/tzi+lF8Cb6YswWaLGsQK9OF7kE+l
 y6P3iGV2Q5/J9vLMu0c3eyBK6PVDydZygkehwiybE5H4pUgHbpnnkcdyb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="330165775"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="330165775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724779584"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="724779584"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.125])
 ([10.249.254.125])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:02:20 -0700
Message-ID: <cabd2572-9ff0-57ed-f6f0-6ec13fae38df@linux.intel.com>
Date: Fri, 21 Apr 2023 13:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230406162625.320387-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230406162625.320387-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/sched_job: prefer
 dma_fence_is_later
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


On 4/6/23 18:26, Matthew Auld wrote:
> Doesn't look like we are accounting for seqno wrap. Just use
> __dma_fence_is_later() like we already do for xe_hw_fence_signaled().
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_sched_job.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 2985caa6097b..ed0b69ef449c 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -229,7 +229,9 @@ bool xe_sched_job_started(struct xe_sched_job *job)
>   {
>   	struct xe_lrc *lrc = job->engine->lrc;
>   
> -	return xe_lrc_start_seqno(lrc) >= xe_sched_job_seqno(job);
> +	return !__dma_fence_is_later(xe_sched_job_seqno(job),
> +				     xe_lrc_start_seqno(lrc),
> +				     job->fence->ops);
>   }
>   
>   bool xe_sched_job_completed(struct xe_sched_job *job)
> @@ -241,7 +243,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>   	 * parallel handshake is done.
>   	 */
>   
> -	return xe_lrc_seqno(lrc) >= xe_sched_job_seqno(job);
> +	return !__dma_fence_is_later(xe_sched_job_seqno(job), xe_lrc_seqno(lrc),
> +				     job->fence->ops);
>   }
>   
>   void xe_sched_job_arm(struct xe_sched_job *job)
