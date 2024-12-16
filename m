Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1791FE7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 09:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BD610E154;
	Mon, 16 Dec 2024 09:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJQfNqrK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42E110E154
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734339687; x=1765875687;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r/KozuYMeTjHbcO8LwWrshAe4Zp5Zn+4O4INxZnk/Xg=;
 b=RJQfNqrKoHBwJvaMA1q67EYwRK1HnbixgdacoTyXqZu3k5o0BcumvU0Z
 vFoM/93lMdOGf5VWskVjOvn4rZZsKhKzJ7Q/Qk76YJmjqBwyasH3bYvVN
 t89ATyFufCkpBBCM5tb+cp0ydvRyRLhCFmGaL19+laYKLXDJP0xjJQ9Ow
 2UHU0dOotXQbnRDaMRSLRv9hSTwdcxb1XRTvvJ5inxpos3DgEnpaPz94W
 Dc810pqy2Rogszk/09oJxvPNW27zUg/wsCb2QTo+s9u3R5wmHF1hseF+H
 GrdUZ161UG7sCLzeO44GGywKk3TlUJkSj0zzOXFK+87SS20A8mT7KKiwA g==;
X-CSE-ConnectionGUID: QbclGN2LQvGAUsYUWa8vfg==
X-CSE-MsgGUID: 7eApJekdTr6SRaI7hiHJYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34942745"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34942745"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 01:01:26 -0800
X-CSE-ConnectionGUID: WpAwzNajTpyWNqhzwDmVCg==
X-CSE-MsgGUID: 6W4ckSrpRCeRz/aYcPelwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102119524"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.246])
 ([10.245.246.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 01:01:23 -0800
Message-ID: <24eeb9dcbb1845bdb420df12384f54d60234a411.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Use non-interruptible wait when moving
 BO to system
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, stable@vger.kernel.org, Matthew Auld
 <matthew.auld@intel.com>
Date: Mon, 16 Dec 2024 10:01:21 +0100
In-Reply-To: <20241213122415.3880017-1-nirmoy.das@intel.com>
References: <20241213122415.3880017-1-nirmoy.das@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
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

HI, Nirmoy,

On Fri, 2024-12-13 at 13:24 +0100, Nirmoy Das wrote:
> Ensure a non-interruptible wait is used when moving a bo to
> XE_PL_SYSTEM. This prevents dma_mappings from being removed
> prematurely
> while a GPU job is still in progress, even if the CPU receives a
> signal during the operation.
>=20
> Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system
> buffer objects to TT")
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

For both patches
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>




> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 283cd0294570..06931df876ab 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -733,7 +733,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	=C2=A0=C2=A0=C2=A0 new_mem->mem_type =3D=3D XE_PL_SYSTEM) {
> =C2=A0		long timeout =3D dma_resv_wait_timeout(ttm_bo-
> >base.resv,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 true,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 false,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0
> MAX_SCHEDULE_TIMEOUT);
> =C2=A0		if (timeout < 0) {
> =C2=A0			ret =3D timeout;

