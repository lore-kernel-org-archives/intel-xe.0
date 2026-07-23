Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD49C531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF8010E5AC;
	Thu, 23 Jul 2026 16:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFbD35pk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9D810E5AC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784822438; x=1816358438;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VFKKumnu1Nt+PxW1z/aLfwoZzA96844oOe/ZhtaXYH4=;
 b=gFbD35pkmL+oX6uj7IHFooGCw6PTRihqZXXCYEghVWZMcAN0RhGYXHep
 pyaoonp4nd82VtwdzgEwEN7zmOP6+atl6MAzAnN9XNPl1tOS5nWXRA48w
 CsxpZ23XA6r2pKJ9tiXFouIMtzakIWNsppVDIqo4JvreyYHO6M/wiUNoO
 TY4t2MFccQwZ/xNZmdEatysOJIICTAWVkHXWHkHPHdrF3NAVtoADNhn1K
 FL1sPG4JpaN6p5QZG4gEd8nhrm6mpGA1CQV2pctY2uNBxDzdomSnFLhkb
 QjixWoV10+BHseH7Vbne7XchkbxV6Li3HPaIu6WggGxlvBeMml6ZmcUl5 w==;
X-CSE-ConnectionGUID: 9cSsPTO8SaqBGEjsKxxZcg==
X-CSE-MsgGUID: 3/bM0H2fRpGEmLL2b+gwcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95836735"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="95836735"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:00:38 -0700
X-CSE-ConnectionGUID: EgF5Xb/5RTaxnB23JdhVLg==
X-CSE-MsgGUID: uPzhy6BlQ1SPn2eUWRChWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="252139867"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.122])
 ([10.245.244.122])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:00:36 -0700
Message-ID: <82838dbfe4d30718b59b76f1e813a72d12ebd96e.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/bo: optimise TT population for DONTNEED BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Thu, 23 Jul 2026 18:00:34 +0200
In-Reply-To: <20260723133418.1201717-2-matthew.auld@intel.com>
References: <20260723133418.1201717-2-matthew.auld@intel.com>
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

On Thu, 2026-07-23 at 14:34 +0100, Matthew Auld wrote:
> When a VRAM buffer object is marked as DONTNEED, like in Mesa, the
> driver skips migrating its contents to system memory and instead
> purges
> the backing store during eviction (via xe_ttm_bo_purge).
>=20
> However, xe_evict_flags() still returns tt_placement (XE_PL_TT) for
> VRAM
> BOs even if they were marked DONTNEED.=C2=A0 This causes
> ttm_bo_handle_move_mem() to call always call ttm_bo_populate() to
> allocate destination system pages, only for those pages to be
> immediately freed right after when xe_bo_move() calls
> xe_ttm_bo_purge().
>=20
> Fix this by changing xe_evict_flags() to return sys_placement
> (XE_PL_SYSTEM) for DONTNEED BOs.=C2=A0 This causes TTM to skip the
> population
> step while still ensuring that TTM calls xe_bo_move(), so
> xe_ttm_bo_purge() still triggers.
>=20
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c266fa6bade1..1daa80079608 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -341,6 +341,11 @@ static void xe_evict_flags(struct
> ttm_buffer_object *tbo,
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	if (xe_bo_madv_is_dontneed(bo)) {
> +		*placement =3D sys_placement;
> +		return;
> +	}
> +

It might be worth adding a comment here, since it's tempting to add a
completely empty placement, like I think amdgpu does. But IIRC then the
move callback won't even get called and hence no move_notify which
triggers the deferred rebind.

/Thomas



> =C2=A0	/*
> =C2=A0	 * For xe, sg bos that are evicted to system just triggers a
> =C2=A0	 * rebind of the sg list upon subsequent validation to
> XE_PL_TT.
