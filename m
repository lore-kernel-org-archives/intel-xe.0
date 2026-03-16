Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A0DF53D6F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D183410E29A;
	Mon, 16 Mar 2026 16:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWbX7U0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED1E10E2A4
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773678262; x=1805214262;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JkD4VDdlWcWymFobOnDDIK/S5Wte9QRg5KEDuKoKwzg=;
 b=DWbX7U0wj5vkm2/seMfxR5gciZ3JlPXnle0kz25fKvfK+e3OiEt0CY4Q
 6impvkCuVN7odsxgcekL7izN3B3f4gG7r/EzhWyZ485sWyua7gIciV7rv
 jHaj1P2FYdWN5niVHHaC4cf/Ul2Qo3e2IZ3/nKwdD7FbGUmTUVLrR/Q3Y
 TGWbmNtu/Fqa7FOcTlnsxNBtC3Ct8TxJhqeeiTHFDpnxtXruTDSow5SFo
 Mpje82KupAXbjhQijGCaErWQ3MzOfG2ak5SwwLMqupBtvKWqqiSf/TrL+
 zLxIb/WQ+wB4NmzVwa8Y13XrYZ18CxsMTyXsMydKB+PKP/QP/03n6zsCo g==;
X-CSE-ConnectionGUID: XLbLxCkNQAe/8p9y7uLIug==
X-CSE-MsgGUID: As/54JsiQk+xu4PTekK+SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86177868"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="86177868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:24:22 -0700
X-CSE-ConnectionGUID: ifDZIsNVT5KnrHQwxUTAAQ==
X-CSE-MsgGUID: YRTQoomETSi1IXTXzaDkHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222050390"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO [10.245.244.233])
 ([10.245.244.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:24:20 -0700
Message-ID: <2a3ee1ee37810eadea37eb9915bf3d808ebef51d.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/tlb: Init range tilemask err to zero
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com
Date: Mon, 16 Mar 2026 17:24:17 +0100
In-Reply-To: <20260316162003.64643-2-jonathan.cavitt@intel.com>
References: <20260316162003.64643-2-jonathan.cavitt@intel.com>
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

On Mon, 2026-03-16 at 16:20 +0000, Jonathan Cavitt wrote:
> Initialize err =3D 0 in xe_tlb_inval_range_tilemask_submit to prevent a
> possible uninitialized value return in the case where the tile_mask
> somehow doesn't match any available tile ids.
>=20
> This targets a static analysis issue.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

IIRC Claude also complained about this but concluded itself it was
a false positive.

Either way, this makes the code easier to read

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_tlb_inval.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 10dcd4abb00f..bbd21d393062 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -529,7 +529,7 @@ int xe_tlb_inval_range_tilemask_submit(struct
> xe_device *xe, u32 asid,
> =C2=A0	struct xe_tile *tile;
> =C2=A0	u32 fence_id =3D 0;
> =C2=A0	u8 id;
> -	int err;
> +	int err =3D 0;
> =C2=A0
> =C2=A0	batch->num_fences =3D 0;
> =C2=A0	if (!tile_mask)
