Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AB6C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 09:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B0110E67D;
	Mon,  6 May 2024 09:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSv+XqNk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A2710E67D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714986723; x=1746522723;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qCQCNmvup+txT2IXrefik6hOuEZmFxPZQdP3GEuEuMs=;
 b=hSv+XqNk+mIzR6kOzth2mMxHMl3kb8Iitm6X9a1B8pcEY1yvtx03GNJj
 Kv32Fd75B5uifM74yIIb9SDVugvkMDhybgXftfbXEdCaEfQQzD/RCxr6Z
 PAcN9O40asndoLsJnYRQ47WQ4b6a6g4f3tfDCwaBMItmKyNTO0pt/+FFT
 jT5X4eMIrtsrQthUUsRZpl+y8brxusx3mSjFvSIDBlPIV7CI87qcUXm+V
 T5wDGQ6mwuTGtsHNkg23X9L0IzbrabWzMGLup/fuxVsu8PkkezSxzpnLC
 8VQ6ZFuK2kOU04LOYkqc6Op1kpNV/WKfWHEHv3HG1gPG0WckZVIOAOQaN Q==;
X-CSE-ConnectionGUID: WrRo37GETtWf90fGa0Icrw==
X-CSE-MsgGUID: EcwqJpr7QSytsrvYR0AScw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21278178"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="21278178"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:12:02 -0700
X-CSE-ConnectionGUID: RRLB/q/xQqW2XP3vX3hrGA==
X-CSE-MsgGUID: /tqZYxQLRbWujVrJoENQLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="58986701"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:11:59 -0700
Message-ID: <5aaad698-6f16-40cd-937c-bf60049ef706@intel.com>
Date: Mon, 6 May 2024 11:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/guc_pc: move pc_fini to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-13-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240429121436.33013-13-matthew.auld@intel.com>
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

On 29.04.2024 14:14, Matthew Auld wrote:
> Here we are touching the HW/GuC and presumably this should happen when
> the device is removed. Currently if you hotunplug the device this is
> skipped if there is already open driver instance.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 8fc757900ed1..8c855afd1144 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -892,7 +892,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>    * @drm: DRM device
>    * @arg: opaque pointer that should point to Xe_GuC_PC instance
>    */
> -static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
> +static void xe_guc_pc_fini(void *arg)
>   {
>   	struct xe_guc_pc *pc = arg;
>   	struct xe_device *xe = pc_to_xe(pc);
> @@ -940,5 +940,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   
>   	pc->bo = bo;
>   
> -	return drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini, pc);
>   }

