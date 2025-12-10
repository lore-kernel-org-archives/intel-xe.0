Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE5BD3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 09:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF3710E253;
	Wed, 10 Dec 2025 09:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfYi01Kt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16BE10E232
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765358197; x=1796894197;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VDY4U8F63J2NPwqdtQB6bVl86jPB9Pbu/bg8g4qtCKo=;
 b=CfYi01Kt73Nz6gGsJUMEyK2+9NOAkXqNfHHFKhrKjqSp80AudAW01Zyc
 DLTeheZBiykfCnfuwAtQ8jGgTOui1GogmL7JTwRzsqkViZktkbO0YrjBu
 T3eV9A8F07l8uEgygD/mSdWDICOfrO43sXo5EZWjSxiresolPCqnZPacN
 wDERALYFoFz5I/pMVdRCO2lDpWch1nSbuSYGjMVD9cbsOiGRk/ALuaD1c
 yXXTQjTxSb+90D/HjyX3agw8cvAamPKjQmPZTo1GtP8VYWdjjNsQO9/Yk
 DHjb3cRWYYQylrlCArCuzK3cdgin83FMVlCgQ6TSMo1y+lTBcjFNHEPUy Q==;
X-CSE-ConnectionGUID: zctmpOUmRpWqHpiIoIefgQ==
X-CSE-MsgGUID: vuU/Q6tSRZWe9QN6rDIP7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71173553"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71173553"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:16:37 -0800
X-CSE-ConnectionGUID: GP5SwBbWTFOQ8MOPoINDbQ==
X-CSE-MsgGUID: au5j3sN7TE6yCnyjgKc9vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="195533229"
Received: from unknown (HELO [10.102.88.36]) ([10.102.88.36])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:16:35 -0800
Message-ID: <4983e4d2-7c07-4c55-92c8-c4441af4b2f2@linux.intel.com>
Date: Wed, 10 Dec 2025 10:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, stable@vger.kernel.org
References: <20251209204920.224374-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251209204920.224374-1-thomas.hellstrom@linux.intel.com>
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

On 12/9/2025 9:49 PM, Thomas Hellström wrote:
> Some Xe bos are allocated with extra backing-store for the CCS
> metadata. It's never been the intention to share the CCS metadata
> when exporting such bos as dma-buf. Don't include it in the
> dma-buf sg-table.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 54e42960daad..7c74a31d4486 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -124,7 +124,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>  	case XE_PL_TT:
>  		sgt = drm_prime_pages_to_sg(obj->dev,
>  					    bo->ttm.ttm->pages,
> -					    bo->ttm.ttm->num_pages);
> +					    obj->size >> PAGE_SHIFT);
>  		if (IS_ERR(sgt))
>  			return sgt;
>  
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
