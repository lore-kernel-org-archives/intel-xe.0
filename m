Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A227AC47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 17:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5994310E849;
	Tue, 23 Jan 2024 17:48:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E500410E859
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 17:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706032116; x=1737568116;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=hbCAj+O7Gd0tIPS0QHYb674/A0prFgXrBtUx4zmsF3k=;
 b=KbZZzj/reYOEdUG3QIUG8nCTOKt0164qGYYqs4GwOndeWyfO/X9I4wbq
 ZttdgLHwzRH8Ea4FC4GELEM5ZJcLLwxS9nNBylO1Sdu5ZWU1pcmOQYVxW
 xqRCWZwxLfXgCqhuLwmc56KEPLn7hFo7wWRh37OKpSAlQGleqJqJ/L73m
 ztu6z3HsXxOuA2rl8551FZvfCTMMJ/Efvi4zVImGGY4CLE5SmxVben1Da
 XPWyg3A8ThlmkSVSU95OEx4N8sOepDNuLCOWQfTWoZ8qiSTyD+NAqNupn
 MRf9bHiyD5ClZoajeUI9YbduY/x/+UMXMAZqOY5gpV/FKswionyXFotyZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="432755922"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="432755922"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 09:48:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1612726"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 09:48:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
In-Reply-To: <20240122170445.108856-3-jose.souza@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-3-jose.souza@intel.com>
Date: Tue, 23 Jan 2024 19:48:31 +0200
Message-ID: <87il3klz4g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 22 Jan 2024, Jos=C3=A9 Roberto de Souza <jose.souza@intel.com> wrot=
e:
> Some instructions requires canonical address like
> MI_BATCH_BUFFER_START(UMDs must call xe_exec with a canonical address
> for Xe2+).
>
> So here adding functions to convert regular address to canonical
> address and back, the first user of this functions will be added
> in the next patches.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h |  3 +++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index ab417f4f7d2a7..b4cdcf1b2081a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -727,3 +727,18 @@ void xe_device_mem_access_put(struct xe_device *xe)
>=20=20
>  	xe_assert(xe, ref >=3D 0);
>  }
> +
> +static inline int highest_address_bit_get(struct xe_device *xe)

Please don't use inline in .c files. Just let the compiler do its job.

In fact, using inline prevents the compiler from detecting unused
functions.

BR,
Jani.

> +{
> +	return xe->info.dma_mask_size > 48 ? 57 : 47;
> +}
> +
> +u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
> +{
> +	return sign_extend64(address, highest_address_bit_get(xe));
> +}
> +
> +u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> +{
> +	return address & GENMASK_ULL(highest_address_bit_get(xe), 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> index af8ac2e9e2709..ce20f6fe6219a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -175,4 +175,7 @@ static inline bool xe_device_has_memirq(struct xe_dev=
ice *xe)
>=20=20
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>=20=20
> +u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> +u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> +
>  #endif

--=20
Jani Nikula, Intel
