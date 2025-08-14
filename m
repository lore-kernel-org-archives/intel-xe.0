Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6841FCA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2510F10E8A8;
	Thu, 14 Aug 2025 15:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mL36ZCKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5273510E8A8
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755185854; x=1786721854;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3tEweLQQ2G4nZEIOy4ZaYe3PDEHFC7s5ybhbQfpgnzE=;
 b=mL36ZCKx1v5QZzlmjSVnFXRbKqLfPUXLJsYS9/JjGbgU4KSK4RwifSwt
 2gyotnXudIPjIrGSY6Yh1BSQQcsyr7HrWzRmYsoMZ5MyPKwxDaCXPde8p
 xZQ339Wemt8HTdKoooaM1JQnt1CCfcj0ptZCCqyv3rjXn6y5ja3pwRTL8
 1NKD2sc+6JVaM4WiOIqFgDSddEDerQvGtWH/xFxRc4PVuULxYn3zn159F
 AwPi2FVN+1xq0kJaENcxtspDnMD3vEwJs8sFVEBJdW3S11XVOTk3t4/ey
 k+ebI/eD65ythDRUvyIZhTwAJ70DqGTyhGugCmSP+8YC9D9/4YjpO9geI g==;
X-CSE-ConnectionGUID: QyvtS+5qRCCqlLfbYmgZ8Q==
X-CSE-MsgGUID: uj6pDh/YSxemwuScLOnnrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82939605"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="82939605"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 08:37:34 -0700
X-CSE-ConnectionGUID: ZOsl8bJYRj2+taF11g3vgg==
X-CSE-MsgGUID: vOv5NfLmRKC6kmGL0SVzFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="165967740"
Received: from zzombora-mobl1 (HELO [10.245.244.158]) ([10.245.244.158])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 08:37:33 -0700
Message-ID: <fc31d120-d44c-4ba3-8136-9fff8cae814c@intel.com>
Date: Thu, 14 Aug 2025 16:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: Make cross-device dma-buf BOs CPU-visible
 on small BAR
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250814145950.430231-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250814145950.430231-1-marcin.bernatowicz@linux.intel.com>
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

On 14/08/2025 15:59, Marcin Bernatowicz wrote:
> Small-BAR systems (e.g., SR-IOV VFs in VMs) expose only a subset of
> VRAM via PCI/BAR. Exporting a BO outside that window fails, and the
> selftests also do CPU fill/verify.
> 
> Set XE_BO_FLAG_NEEDS_CPU_ACCESS for cross-device variants to force
> CPU-mappable placement and keep tests reliable. Large-BAR/P2P setups
> are unaffected.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_dma_buf.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index c53f67ce4b0a..4c3b16835c93 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -206,7 +206,7 @@ static const struct dma_buf_attach_ops nop2p_attach_ops = {
>   static const struct dma_buf_test_params test_params[] = {
>   	{.mem_mask = XE_BO_FLAG_VRAM0,
>   	 .attach_ops = &xe_dma_buf_attach_ops},
> -	{.mem_mask = XE_BO_FLAG_VRAM0,
> +	{.mem_mask = XE_BO_FLAG_VRAM0 | XE_BO_FLAG_NEEDS_CPU_ACCESS,
>   	 .attach_ops = &xe_dma_buf_attach_ops,
>   	 .force_different_devices = true},
>   
> @@ -238,7 +238,8 @@ static const struct dma_buf_test_params test_params[] = {
>   
>   	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
>   	 .attach_ops = &xe_dma_buf_attach_ops},
> -	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
> +	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0 |
> +		     XE_BO_FLAG_NEEDS_CPU_ACCESS,

An alternative might to always apply this unconditionally when calling 
create_user(), just to ensure that the failure cases like with nop2p are 
failing for the right reasons, and not because we didn't supply 
CPU_ACCESS or something.

Anyway, assuming it all passes now,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>   	 .attach_ops = &xe_dma_buf_attach_ops,
>   	 .force_different_devices = true},
>   

