Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3923CEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 15:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C4E10E0E3;
	Fri, 16 Jun 2023 15:48:20 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B8310E0E3
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686930498; x=1718466498;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7ENXzGAuV+78Ve+xO6da4h7i/R3ZjTEIzz56ZCHVwYc=;
 b=j0wW+x6vupux3aTYLy39u3wLfj+kF2/X33JRVZdK9jVhiotk2UecEtwl
 3RdWu1RYS/r1wuo/fg//evOzLD15imMe6HSrObQBwPgnucVJmdKaPC8vM
 baQNSXpPduYHK2G/6MmuRGDC4VHY+oAq7eRez/lgnp2iEXqmN5JHrPogk
 lmB8aDyQnfpVcVYR9/0b9IoP+HBP+6BWJAblKngxVjbbo/xKVJ63tSiXA
 CFkXGYTG4UBcIrve9vG6LJbqMLdsWuG7hpdyvK53rIEUKXPkO/hySoHbY
 P/i4dTN+4StmtyNMuA7btlMac2+tFR040+u3FXYjh0UVSq9h8q3QM/mSG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348952634"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="348952634"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 08:47:55 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="746330736"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="746330736"
Received: from nurha65x-mobl2.gar.corp.intel.com (HELO [10.249.254.148])
 ([10.249.254.148])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 08:47:54 -0700
Message-ID: <b8f7bd32-bfb3-613d-a4d5-ea9b8f8764b1@linux.intel.com>
Date: Fri, 16 Jun 2023 17:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230615181840.76075-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230615181840.76075-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/bo: handle PL_TT -> PL_TT
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

Hi,

On 6/15/23 20:18, Matthew Auld wrote:
> When moving between PL_VRAM <-> PL_SYSTEM we have to have use PL_TT in
> the middle as a temporary resource for the actual copy. In some GL
> workloads it can be seen that once the resource has been moved to the
> PL_TT we might have to bail out of the ttm_bo_validate(), before
> finishing the final hop. If this happens the resource is left as
> TTM_PL_FLAG_TEMPORARY, and when the ttm_bo_validate() is restarted the
> current placement is always seen as incompatible, requiring us to
> complete the move.  However if the BO allows PL_TT as a possible
> placement we can end up attempting a PL_TT -> PL_TT move (like when
> running out of VRAM) which leads to explosions in xe_bo_move(), like
> triggering the XE_BUG_ON(!tile).
>
> Going from TTM_PL_FLAG_TEMPORARY with PL_TT -> PL_VRAM should already
> work as-is, so it looks like we only need to worry about PL_TT -> PL_TT
> and it looks like we can just treat it as a dummy move, since no real
> move is needed.
>
> Reported-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Could perhaps be merged with the SYSTEM-to-TT test above so we get 
any-ttm-backed to TT, but perhaps that will become hairy.

Either way

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b94a80a32d86..5aed626cce80 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -603,6 +603,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		goto out;
>   	}
>   
> +	/*
> +	 * Failed multi-hop where the old_mem is still marked as
> +	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
> +	 */
> +	if (old_mem->mem_type == XE_PL_TT &&
> +	    new_mem->mem_type == XE_PL_TT) {
> +		ttm_bo_move_null(ttm_bo, new_mem);
> +		goto out;
> +	}
> +
>   	if (!move_lacks_source && !xe_bo_is_pinned(bo)) {
>   		ret = xe_bo_move_notify(bo, ctx);
>   		if (ret)
