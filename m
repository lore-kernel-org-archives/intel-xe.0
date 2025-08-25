Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84743CA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 15:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7F610E038;
	Mon, 25 Aug 2025 15:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mN2RywnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFBB10E038
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756136315; x=1787672315;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cn4wh1XKOUEzz7zqTShHutXoHBv1UJiLEBstjYdOOI8=;
 b=mN2RywnB92MoglaZLKfr9VuikD3WajI08Guwv1+FMjdbvJLaBYKxDdBO
 HfhJkwZEwUXojZkRxt6d//3J+dLcD0RhP08C+TVE1o9fxgoWzCuOnbaSc
 pXMNXikYjF2hzxWGQINoYBSvzrzkExYgC5MQFXmvW/Sp1az986LHvo2SN
 xNSCLa4g+RBUWLuMdXjN5Yo4qc11Kz4tHMwyqN4wDX88cIS/MDGFThDzE
 H2s/CF02kqH3SvU/K0NTvatL1wqEqjov5/fowxU5/3vEtS9z7EbrwhdiF
 eJffgx1IY0/3vykbHA3ANHg/6vavSozXvvwXI86PyQSIeh7pdZVqfW0F3 g==;
X-CSE-ConnectionGUID: va5juGPNTp+k87oh2g+wNQ==
X-CSE-MsgGUID: 3eSjE0YdTfuz5iPUl2Nq1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="75952250"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="75952250"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 08:38:34 -0700
X-CSE-ConnectionGUID: q3sbf9lrTBy2XAJmgKLp5Q==
X-CSE-MsgGUID: 1R16KGCtRB+CrR7VCkv2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="200216776"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.53])
 ([10.245.245.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 08:38:33 -0700
Message-ID: <7ab48a20d83006a1aa4393dd91cd8cf74aed5538.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Don't trigger rebind on initial dma-buf
 validation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Date: Mon, 25 Aug 2025 17:38:31 +0200
In-Reply-To: <20250825152841.3837378-1-matthew.brost@intel.com>
References: <20250825152841.3837378-1-matthew.brost@intel.com>
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

On Mon, 2025-08-25 at 08:28 -0700, Matthew Brost wrote:
> On the first validate of an imported dma-buf (initial bind), the
> device
> has no GPU mappings, so a rebind is unnecessary. Rebinding here is
> harmful in multi-GPU setups and for VMs using preempt-fence mode, as
> it
> would evict in-flight GPU work.
>=20
> v2:
> =C2=A0- Drop dma_buf_validated, check for XE_PL_SYSTEM (Thomas)
>=20
> Signed-off-by: Matthee Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6fea39842e1e..a0630e120cd2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -816,7 +816,8 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	}
> =C2=A0
> =C2=A0	if (ttm_bo->type =3D=3D ttm_bo_type_sg) {
> -		ret =3D xe_bo_move_notify(bo, ctx);
> +		if (new_mem->mem_type =3D=3D XE_PL_SYSTEM)
> +			ret =3D xe_bo_move_notify(bo, ctx);
> =C2=A0		if (!ret)
> =C2=A0			ret =3D xe_bo_move_dmabuf(ttm_bo, new_mem);
> =C2=A0		return ret;

LGTM. If CI is happy,

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

