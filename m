Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F0CCFC27C
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172CD10E5A9;
	Tue, 15 Oct 2024 15:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2rebQjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5885B10E5A9
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729006449; x=1760542449;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DjFDfwPA0bD+TqXk38Em0tvLFUhdTuxZmHAOYyNHe34=;
 b=X2rebQjKrHbgsWFGVIXF77Or7XD+GOH+FABmkNZErcagcvqAxKvf9N0W
 8E3Nuv8mqBJ96mMsImbI+0+4nh65Ths4csMeVZQryccSjP6eyVoMNqvcD
 3/FBbFUlr7VzWVSMA2oik/CsitQSP4stX+Sc4rBnBuw5WRrlzd2ylYpbI
 eNwm/mm3m6/Nq7lBrT5YysKvKtOmxgGdTnKBzFRopHpGc+o/g3lZlvTII
 4BWVdUAFiM+tu+6+pDk/aJFERNIwTh2xy8OGVujuJ8r1BqTjQMyqIhg9/
 XWn3Ww2UGs8A8wKl8wQrdTp4i4CKOSEvg4mnG5zbVtomU6yBRqLFgwEkd A==;
X-CSE-ConnectionGUID: 1C7yJVuYR5CsvFEHCKt3MA==
X-CSE-MsgGUID: 5LoiJHsERTGmPbrOGNMjUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31283456"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="31283456"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:34:07 -0700
X-CSE-ConnectionGUID: pxojbH44RLKf6NkLekGyng==
X-CSE-MsgGUID: C4qeZE41ShmeQHNd9W1Sag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78758890"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:34:06 -0700
Message-ID: <7e2f6f09-3a82-46d1-85ba-c39b5e2a032d@linux.intel.com>
Date: Tue, 15 Oct 2024 17:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 23/26] drm/xe/vram: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-24-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-24-himal.prasad.ghimiray@intel.com>
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


On 10/14/2024 9:55 AM, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be escalated/considered as
> probing error. It internally WARNS on domain ack failure.
>
> v5
> - return unsigned int from xe_force_wake_get()
>
> v7
> - Fix commit message
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vram.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 2a623bfcda7e..b1f81dca610d 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -220,8 +220,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *gt = tile->primary_gt;
> +	unsigned int fw_ref;
>  	u64 offset;
> -	int err;
>  	u32 reg;
>  
>  	if (IS_SRIOV_VF(xe)) {
> @@ -240,9 +240,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		return 0;
>  	}
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>  
>  	/* actual size */
>  	if (unlikely(xe->info.platform == XE_DG1)) {
> @@ -264,7 +264,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  	/* remove the tile offset so we have just the available size */
>  	*vram_size = offset - *tile_offset;
>  
> -	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return 0;
>  }
>  
>  static void vram_fini(void *arg)
