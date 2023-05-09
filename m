Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C4C77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 11:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAC910E38C;
	Tue,  9 May 2023 11:37:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C8010E38C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 11:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683632250; x=1715168250;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Grg5T1rhtwkYIVD7ips0o0llwTzVq9TbveKLZyWrRyA=;
 b=Otk/NEKQQslbA1n1PcwKeNQ2JpLNtvAUe5Mx/SoLQDmrTaGyWU/Vnfd2
 MKmkbBuZBEKgseSbpgWbfLx/SWwR03Z8FowZHLUD1iqATH+1Z5yybz8iT
 ugJosRMicLeXKoxJfy5Rjok1ca515ErduRH4CknfyA6X6SGjXKgf6xM16
 c0zCL1S6PXOU5up3UeSEkZfrJYHs51iNr1WUBOx3DMqXO+ycK7A2VAirK
 lBS7NdEHYiaITJwFSdWD5Tb28FCj6VRy/cLBb4c8hfnRPo6Kdp7yZI1Th
 DiAYvJEJ3yiwLtkb7zwE9lr43vDtqg3uwvsuJJuE602rEUkXO/mGp6rpR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347361750"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="347361750"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 04:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028787568"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="1028787568"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.38.60])
 ([10.249.38.60])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 04:37:28 -0700
Message-ID: <eecbd993-4464-aa21-0440-d0bb37333293@linux.intel.com>
Date: Tue, 9 May 2023 13:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-7-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230412225248.3229571-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 6/8] drm/xe: Include GT ID in error
 message if TLB invalidation times out
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

I missed it. I have sent a very similar patch which now merged.

Tried this series on a MTL  and I can confirm it fixes driver load.


On 4/13/2023 12:52 AM, Matt Roper wrote:
> This will hopefully help debug TLB invalidation problems.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index f279e21300aa..796403b82531 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -285,8 +285,8 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>   				 tlb_invalidation_seqno_past(gt, seqno),
>   				 TLB_TIMEOUT);
>   	if (!ret) {
> -		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
> -			seqno, gt->tlb_invalidation.seqno_recv);
> +		drm_err(&xe->drm, "TLB invalidation time'd out on GT%d, seqno=%d, recv=%d\n",
> +			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>   		return -ETIME;
>   	}
>   
