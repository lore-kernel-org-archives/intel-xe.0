Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CC0C02192
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 08:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E90210E769;
	Wed, 29 Jan 2025 08:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ0OlCSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8010E769
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738140516; x=1769676516;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LW3PLBDVHT2Em3ixoEnnyMOQTJlURojYXdi9ux/+RzM=;
 b=QQ0OlCSH6bQjDzvrJt/OdsNuRLQ8FM2X8Gw8noPJ3BxkUqafcNww+wdW
 S1Mrtf1R75Won0CBSbIsVbWUhLx5OPQvYqhJ6SAxpNrQ5K+mY3ayEHGbQ
 Ybl46XKbi5eHTEGQd7mUamvyA1KdtactBmYVlLjTmaVRXkt6ZHUl4N6WZ
 PzZmefTU46vrkZH60nXrKVP+XobU66YZchk43R4PMSkA2I29L1yozsTfo
 2Och3C0dhEzKLet7mrjYgfyY/5XCXRzrPoaTbnSHBykK1rGXOUyN5HhcZ
 Kc8DiZ3jppUajX6TnuRcBhX37uRBUzrqNEbeBhG4ykfeft7WAS+wYScUj A==;
X-CSE-ConnectionGUID: Cd/IAd4aQHOtn/Jo8eV/5A==
X-CSE-MsgGUID: WiIi458ERqGB0H/o6O/EDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37886987"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="37886987"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 00:48:36 -0800
X-CSE-ConnectionGUID: Mv7WC4V7R2eyhf+IOM330Q==
X-CSE-MsgGUID: wlaQruOIT0qi5Ju8MbHTYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109884059"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.222])
 ([10.245.246.222])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 00:48:34 -0800
Message-ID: <3b2a187d95499778863376bbeffdc5aba1f77ea6.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Add a function to zap page table by address
 range
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com
Date: Wed, 29 Jan 2025 09:48:30 +0100
In-Reply-To: <20250128222145.3849874-1-oak.zeng@intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Tue, 2025-01-28 at 17:21 -0500, Oak Zeng wrote:
> Add a function xe_pt_zap_range. This is similar to xe_pt_zap_ptes
> but is used when we don't have a vma to work with, such as zap
> a range mapped to scratch page where we don't have vma.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

As I think also Matt mentions, The zap functionality works only when it
exactly matches a pre-bound range (like in this case a vma) and there
is something cleaning up the zapped ptes afterwards. Typically that's a
rebind or an unbind.

Thanks,
Thomas



> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c | 28 ++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_pt.h |=C2=A0 2 ++
> =C2=A02 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..2363260da6a6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -792,6 +792,34 @@ static const struct xe_pt_walk_ops
> xe_pt_zap_ptes_ops =3D {
> =C2=A0	.pt_entry =3D xe_pt_zap_ptes_entry,
> =C2=A0};
> =C2=A0
> +/**
> + * xe_pt_zap_range() - Zap (zero) gpu ptes of an virtual address
> range
> + * @tile: The tile we're zapping for.
> + * @vm: The vm we're zapping for.
> + * @start: Start of the virtual address range, inclusive.
> + * @end: End of the virtual address range, exclusive.
> + *
> + * This is similar to xe_pt_zap_ptes() but it's used when we don't
> have a
> + * vma to work with. This is used for example when we're clearing
> the scratch
> + * page mapping during vm_bind.
> + *
> + */
> +void xe_pt_zap_range(struct xe_tile *tile, struct xe_vm *vm, u64
> start, u64 end)
> +{
> +	struct xe_pt_zap_ptes_walk xe_walk =3D {
> +		.base =3D {
> +			.ops =3D &xe_pt_zap_ptes_ops,
> +			.shifts =3D xe_normal_pt_shifts,
> +			.max_level =3D XE_PT_HIGHEST_LEVEL,
> +		},
> +		.tile =3D tile,
> +	};
> +	struct xe_pt *pt =3D vm->pt_root[tile->id];
> +
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, start,
> +				end, &xe_walk.base);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
> =C2=A0 * @tile: The tile we're zapping for.
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 9ab386431cad..b166b324f455 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -43,4 +43,6 @@ void xe_pt_update_ops_abort(struct xe_tile *tile,
> struct xe_vma_ops *vops);
> =C2=A0
> =C2=A0bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> =C2=A0
> +void xe_pt_zap_range(struct xe_tile *tile, struct xe_vm *vm, u64
> start, u64 end);
> +
> =C2=A0#endif

