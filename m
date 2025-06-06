Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF49CC5B555
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 15:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F1910E38E;
	Fri,  6 Jun 2025 15:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPIza6dL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9BF10E38E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749223149; x=1780759149;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=HGVGnAi0B7LJ0pZobzS+bnJFwUkPfXV+b8qyKxRXktA=;
 b=jPIza6dLlLYB0zLtxAVjiFntpp4fpMEmfc3hfnjNu+boHhzW4pNkwv4t
 dBOj+D8lfXyYDja1QTokrR/u9lChpnom45GGmXUvayPPEDmJt/Ve6edUg
 Phh0yWwzljO441tDC45IPLJn0WnCiVzZfZzWyVgdVEyyTtsN1p9yqUzzq
 zhC9y67KZyMydXVJY2iqJdtH+0EzXS1TaMSBWtz6NfYLNHZUeAKn4wzC1
 Ll/abDi2bLDJh2gy1e0E7wZ5NuSzJpFOZ4Zab3R1HuRdFThbWJJea25SH
 BULSUxj/v92E2dPDfsUJh6xNBE3eNUrVfRTaENr07Vdy51M9jgxhT3Ei2 w==;
X-CSE-ConnectionGUID: SxLByHMJStGqBrLTqjNLxA==
X-CSE-MsgGUID: cv+1qEuHQTCi4isBZ+uVNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="50605808"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="50605808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:19:08 -0700
X-CSE-ConnectionGUID: 7KQDcNuXTHuqp8DsJZKenw==
X-CSE-MsgGUID: NjME5DUTSW22oE1l4PzNgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="150862704"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.52])
 ([10.245.245.52])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:19:07 -0700
Message-ID: <097aa0d8-6bc1-4616-8f8f-805b7fc5e886@intel.com>
Date: Fri, 6 Jun 2025 16:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Move DSB l2 flush to a more sensible place
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
References: <20250606104546.1996818-3-matthew.auld@intel.com>
Content-Language: en-GB
In-Reply-To: <20250606104546.1996818-3-matthew.auld@intel.com>
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

On 06/06/2025 11:45, Matthew Auld wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Flushing l2 is only needed after all data has been written.
> 
> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Tested this locally and noticed a pretty big improvement just playing 
around in the desktop environment, where stuff feels way smoother.

> ---
>   drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> index f95375451e2f..9f941fc2e36b 100644
> --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> @@ -17,10 +17,7 @@ u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf)
>   
>   void intel_dsb_buffer_write(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val)
>   {
> -	struct xe_device *xe = dsb_buf->vma->bo->tile->xe;
> -
>   	iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val);
> -	xe_device_l2_flush(xe);
>   }
>   
>   u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx)
> @@ -30,12 +27,9 @@ u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx)
>   
>   void intel_dsb_buffer_memset(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val, size_t size)
>   {
> -	struct xe_device *xe = dsb_buf->vma->bo->tile->xe;
> -
>   	WARN_ON(idx > (dsb_buf->buf_size - size) / sizeof(*dsb_buf->cmd_buf));
>   
>   	iosys_map_memset(&dsb_buf->vma->bo->vmap, idx * 4, val, size);
> -	xe_device_l2_flush(xe);
>   }
>   
>   bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *dsb_buf, size_t size)
> @@ -74,9 +68,12 @@ void intel_dsb_buffer_cleanup(struct intel_dsb_buffer *dsb_buf)
>   
>   void intel_dsb_buffer_flush_map(struct intel_dsb_buffer *dsb_buf)
>   {
> +	struct xe_device *xe = dsb_buf->vma->bo->tile->xe;
> +
>   	/*
>   	 * The memory barrier here is to ensure coherency of DSB vs MMIO,
>   	 * both for weak ordering archs and discrete cards.
>   	 */
> -	xe_device_wmb(dsb_buf->vma->bo->tile->xe);
> +	xe_device_wmb(xe);
> +	xe_device_l2_flush(xe);
>   }

