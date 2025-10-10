Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2469CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 15:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C2610EC4E;
	Fri, 10 Oct 2025 15:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYlyUpIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F357310EC4E
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760110054; x=1791646054;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jXhe1NIw5ZFkWMl4vUpcPG7+w/JALXBDAFm/NKLxcyQ=;
 b=LYlyUpItpwIREvQI070ko0RpAkWlHawZJhokwfz2I5OSvgp5rk1T/L3e
 kSgxDw9DtMmdis5GYq3GSEEdTvwNxs08vxUzywS5HNZ9AJ542h+DjSQ21
 FSwlGlYZ3QECH6EgLL406YYubSweAm5fNTFN6+ShPpGPauphrhegaBicv
 V15aKnOsKDB56uYiI3lUQ3coqYL1n2i7hFqqCznKxoXUDHoRGJq9soCT/
 xgeGqvhf5aQXlLa5zTpsG4wQ5MSbrE4aAlssvziie1Zgu6SnN8LKNzj2s
 gwT/Ck/cql9+hX8l+YWeOf4wnmzLJ6E0lFGRByXK/8A/dMVi9oGBFSBGr Q==;
X-CSE-ConnectionGUID: ml7BQNM4S4eXFeasFo8OLg==
X-CSE-MsgGUID: AWzlkuJVS06bw5Y/bIRY3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62274458"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62274458"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:27:34 -0700
X-CSE-ConnectionGUID: IDRgjLXORYC3QumuGQ2mjw==
X-CSE-MsgGUID: jvfmnmKXTCSUpE4IjjrqIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="218097885"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.154])
 ([10.245.245.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:27:33 -0700
Message-ID: <cdaa5a66610f230cdee70def4b90d975d3c1b734.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/evict: drop bogus assert
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 10 Oct 2025 17:27:30 +0200
In-Reply-To: <20251010152457.177884-2-matthew.auld@intel.com>
References: <20251010152457.177884-2-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Fri, 2025-10-10 at 16:24 +0100, Matthew Auld wrote:
> This assert can trigger here with non pin_map users that select
> LATE_RESTORE, since the vmap is allowed to be NULL given that
> save/restore can now use the blitter instead. The check here doesn't
> seem to have much value anymore given that we no longer move pinned
> memory, so any existing vmap is left well alone, and doesn't need to
> be
> recreated upon restore, so just drop the assert here.
>=20
> Fixes: 86f69c26113c ("drm/xe: use backup object for pinned
> save/restore")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6213
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo_evict.c | 8 --------
> =C2=A01 file changed, 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 1a12675b2ea9..7661fca7f278 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -191,7 +191,6 @@ int xe_bo_evict_all(struct xe_device *xe)
> =C2=A0
> =C2=A0static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> =C2=A0{
> -	struct xe_device *xe =3D xe_bo_device(bo);
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	ret =3D xe_bo_restore_pinned(bo);
> @@ -210,13 +209,6 @@ static int xe_bo_restore_and_map_ggtt(struct
> xe_bo *bo)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	/*
> -	 * We expect validate to trigger a move VRAM and our move
> code
> -	 * should setup the iosys map.
> -	 */
> -	xe_assert(xe, !(bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)
> ||
> -		=C2=A0 !iosys_map_is_null(&bo->vmap));
> -
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

