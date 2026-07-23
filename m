Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6581DC531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2718410E5FE;
	Thu, 23 Jul 2026 16:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNsjp2uv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0511810E5FE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823962; x=1816359962;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wXG03VjOGVRLMEV/+Am0hgn8nNyJFafepPvylB/9zh4=;
 b=fNsjp2uvfpY1FAWTl13cRqPAOJyaEjeLR/wrWPcmjKS4vLpk2j259m6y
 Twu8VvmDKQoKHS1dQ0ew11cMjbw49B59AifUwRBGoGcd5hRWtTO1YuH2g
 rz6Mt9Lo4AsH+FSNakwr9AcQcqb7UNacqRzqFWw6mnyDhKi3wrYFwtN1M
 ar/5hRE+FCMupRSVSDSewr0TX6EY9JIK6UdDkuSYHuqqRbBTK0xiMRAqm
 89sfaVJRmOul5VjFuHYLiSzUTNNFGMlnr46alfeMqEjaX/CHFJs/LBXyQ
 Q6shYA3GQ5ZzjHXOLpFXeHev5MmEljNNsgHLAXpqHkIGTwX+E6+D0uLiR Q==;
X-CSE-ConnectionGUID: VFCwhrFlQbqwmvzg2C8uag==
X-CSE-MsgGUID: 7G5qdqx6RFGizHv5xZm7qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95839268"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="95839268"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:26:01 -0700
X-CSE-ConnectionGUID: btpmDgsmRsW+9FQjx55gwQ==
X-CSE-MsgGUID: 1V35BnIrTmeEBuTcO1q+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="252144480"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.122])
 ([10.245.244.122])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:26:00 -0700
Message-ID: <8b4ad0cc3b13f8d8e62ccfa97a9f5c4beb7f1e0d.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/bo: optimise TT population for DONTNEED BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
Date: Thu, 23 Jul 2026 18:25:58 +0200
In-Reply-To: <20260723161542.1220276-2-matthew.auld@intel.com>
References: <20260723161542.1220276-2-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Thu, 2026-07-23 at 17:15 +0100, Matthew Auld wrote:
> When a VRAM buffer object is marked as DONTNEED, like in Mesa, the
> driver skips migrating its contents to system memory and instead
> purges
> the backing store during eviction (via xe_ttm_bo_purge).
>=20
> However, xe_evict_flags() still returns tt_placement (XE_PL_TT) for
> VRAM
> BOs even if they were marked DONTNEED.=C2=A0 This causes
> ttm_bo_handle_move_mem() to always call ttm_bo_populate() to allocate
> destination system pages, only for those pages to be immediately
> freed
> right after when xe_bo_move() calls xe_ttm_bo_purge().
>=20
> Fix this by changing xe_evict_flags() to return sys_placement
> (XE_PL_SYSTEM) for DONTNEED BOs.=C2=A0 This causes TTM to skip the
> population
> step while still ensuring that TTM calls xe_bo_move(), so
> xe_ttm_bo_purge() still triggers.
>=20
> v2 (Thomas):
> =C2=A0 - Add a comment to highlight why sys_placement over
> purge_placement.
>=20
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c266fa6bade1..b1fdc802d27b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -341,6 +341,18 @@ static void xe_evict_flags(struct
> ttm_buffer_object *tbo,
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	if (xe_bo_madv_is_dontneed(bo)) {
> +		/*
> +		 * We can't use purge_placement here, since we need
> to trigger
> +		 * our own purge procedure at the start of
> xe_bo_move(), which
> +		 * would otherwise be skipped. At the same time we
> don't want
> +		 * ttm to then populate the tt with dst pages,
> before the move
> +		 * callback, hence use sys_placement here.
> +		 */
> +		*placement =3D sys_placement;
> +		return;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * For xe, sg bos that are evicted to system just triggers a
> =C2=A0	 * rebind of the sg list upon subsequent validation to
> XE_PL_TT.
