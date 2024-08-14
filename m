Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE0FC3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 11:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4553810E3AC;
	Wed, 14 Aug 2024 11:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqA5pnaf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3FA10E3AC
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 11:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723633371; x=1755169371;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kBkskyO7nygVCtZDhPr4P4hgh1Uhn+C8KH98LrIbhow=;
 b=GqA5pnaf8cNQ3ptSJ0Ao40gwecXui2PqXd8W4156wdE3HleCkrG8BUGh
 x7fUxhQIH1/6sCPKgFuS1UYW/uTuBWt3F3KVe2azWEAPKLpSrYLNJE4aW
 sVuFY5nQcbSZlJ9P7LLMfgeiAl15Iu6lLFbIhwHVkLvztiX0IbyWjvfvX
 O9PcfOCfr3rWXfV45iJ11y0JuwN9b3XN2iNv63L9+UhTkxjgOJt3hdhe2
 QGNb2kIjh26rZH7a9vwUqK/iebo0d9d19PSu7KkuopaZ42FiG5+hN1BVk
 QiUHbx6rqt4tBc166PYGotCjdyWWYbegDtspCY82JYg27/mvXCZptLw4i Q==;
X-CSE-ConnectionGUID: KRezFfKgQ0OdzeI8T1Zo0g==
X-CSE-MsgGUID: 03SXxkSHSseGSQsj0AT0ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25703970"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="25703970"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:02:50 -0700
X-CSE-ConnectionGUID: CQ/3/xxRS7usUMTaWhI1VQ==
X-CSE-MsgGUID: tRlvefIlR5CYEIz865MYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="59552209"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.109])
 ([10.245.146.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:02:49 -0700
Message-ID: <d3a3cccf-e615-4620-97d7-0bcb75ef41f0@linux.intel.com>
Date: Wed, 14 Aug 2024 13:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add NULL check before deferencing pointer
To: apoorva.singh@intel.com, intel-xe@lists.freedesktop.org
References: <20240814101750.857665-1-apoorva.singh@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240814101750.857665-1-apoorva.singh@intel.com>
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


On 8/14/2024 12:17 PM, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>
>
> - Add NULL check before deferencing of lrc->bo in
>    xe_lrc_snapshot_capture()
>
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 974a9cd8c379..e31d9bc64ff6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1652,20 +1652,24 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>   	if (lrc->bo && lrc->bo->vm)
>   		xe_vm_get(lrc->bo->vm);


Looking into xe_lrc_init(), it seems we are always allocating a bo for 
lrc so remove the NULL bo check instead.


Regards,

Nirmoy

>   
> -	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> -	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> -	snapshot->head = xe_lrc_ring_head(lrc);
> -	snapshot->tail.internal = lrc->ring.tail;
> -	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> -	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
> -	snapshot->seqno = xe_lrc_seqno(lrc);
> -	snapshot->lrc_bo = xe_bo_get(lrc->bo);
> -	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
> -	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
> -	snapshot->lrc_snapshot = NULL;
> -	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> -	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> -	return snapshot;
> +	if (lrc->bo) {
> +		snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> +		snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> +		snapshot->head = xe_lrc_ring_head(lrc);
> +		snapshot->tail.internal = lrc->ring.tail;
> +		snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> +		snapshot->start_seqno = xe_lrc_start_seqno(lrc);
> +		snapshot->seqno = xe_lrc_seqno(lrc);
> +		snapshot->lrc_bo = xe_bo_get(lrc->bo);
> +		snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
> +		snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
> +		snapshot->lrc_snapshot = NULL;
> +		snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> +		snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> +		return snapshot;
> +	}
> +	kfree(snapshot);
> +	return NULL;
>   }
>   
>   void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
