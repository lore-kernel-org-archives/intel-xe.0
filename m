Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5481C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 18:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E87210E40F;
	Thu, 27 Aug 2026 18:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CIW3FkYa";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EFA10E40F
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 18:26:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B2AE0600D4;
 Thu, 27 Aug 2026 18:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29DE1F000E9;
 Thu, 27 Aug 2026 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787855214;
 bh=aN3VvbFV+tlw34KBKZE83NlcRvh6gh32uzDLOSCXd/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=CIW3FkYa6y5cKyCU3/AM43jM7MspzRqTFNrzkzUkpWQDIKUxwj4swvZ+ikaxTBzzZ
 0PJkSzmSRNKQCaqhokP7EwiLx5DbHiSwgiLWceR6stVH5yCHNERthFWpDG2PAlz2FW
 +akNBW5rpSW/di/gTDARl6T3HMebGRHVFGYoul+XpvO6xRfEsXIt1Nb3HhhuPn41jj
 AjdBpdCVuue463BvGXvXTJ+nchLjLyXGmP9G1ZUo3wSfzt/rzgNoTRUsdwaz4Zc0qc
 HWy1k+7vs4Pnvzb/f0lXGlZV1QzQYdyI5vYJ823iYgQEPio5zEynVk7uvunpM9d9CH
 FSW2a0z+mj+gg==
Date: Thu, 27 Aug 2026 20:26:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com, 
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH V18 13/14] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Message-ID: <apCBONh8uZNA4ja5@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-29-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826135136.204044-29-tejas.upadhyay@intel.com>
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

> @@ -582,6 +583,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
>  
>  static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
>  {
> +	u32	q_flag = DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;

you have a spurious tab here.

>  	struct ttm_operation_ctx ctx = {};
>  	struct xe_exec_queue *q_to_put = NULL;
>  	struct xe_exec_queue *q = NULL;
