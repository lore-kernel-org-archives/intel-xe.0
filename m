Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6146C47074
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 13:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1B210E128;
	Tue,  2 Jan 2024 13:34:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD6110E0CD
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704202482; x=1735738482;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=w3hg7NPNArJF/JN88a89k6qnf47F/MQ3tO8Lxn2jerA=;
 b=l9reRs4SJyErr/R9m0fRP6sNZvPtQ4htrTUeZTE9ZU+DDeNxRdNWYP5z
 IWOgAwYgTsKDsdR6+PNLTQu0wCsDTbBJoIM4iAPkBqL6VyJTssIBDsNpP
 DguD8xDOMQaqbfO6gwZR9DAokS8xu7I0+qKqhRUtZyqULRFh1PSrnSvKh
 6oxgrI6N6iyOs+vAATILcr9vqE1jYLetFpY3xholPRnnN7fGutF7CArAl
 cRxOozyStVEsMHdH80Rh2xLNO1LRkt3UR2XHYmK4OJZPD9npyb2S71STL
 e6DwPL8CVWHVikMPL/2AToe77tjQzbhQAjNzyZRXrK0Ckl8ZnJMmgcEkI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="483062644"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="483062644"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 05:34:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="952924616"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="952924616"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.235])
 ([10.249.254.235])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 05:34:39 -0800
Message-ID: <c435935326b41a0ccc42613e28d2865cd50f2f0f.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Use XE_CACHE_WB pat index
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Tue, 02 Jan 2024 14:34:37 +0100
In-Reply-To: <20240102113340.836193-1-himal.prasad.ghimiray@intel.com>
References: <20240102113340.836193-1-himal.prasad.ghimiray@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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

On Tue, 2024-01-02 at 17:03 +0530, Himal Prasad Ghimiray wrote:
> Use XE_CACHE_WB pat index by default on xe2 platforms and use
> XE_CACHE_NONE_COMPRESSION pat index only if buffer supports
> compression and indirect access of flat ccs.
>=20
> Fixes the broken "xe_migrate_test kunit test" on LNL.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index adf1dab5eba2..cb66636bfa6f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -439,7 +439,7 @@ static void emit_pte(struct xe_migrate *m,
> =C2=A0	/* Indirect access needs compression enabled uncached PAT
> index */
> =C2=A0	if (GRAPHICS_VERx100(xe) >=3D 2000)
> =C2=A0		pat_index =3D is_comp_pte ? xe-
> >pat.idx[XE_CACHE_NONE_COMPRESSION] :
> -					=C2=A0 xe-
> >pat.idx[XE_CACHE_NONE];
> +					=C2=A0 xe->pat.idx[XE_CACHE_WB];
> =C2=A0	else
> =C2=A0		pat_index =3D xe->pat.idx[XE_CACHE_WB];
> =C2=A0
> @@ -729,14 +729,14 @@ struct dma_fence *xe_migrate_copy(struct
> xe_migrate *m,
> =C2=A0		}
> =C2=A0
> =C2=A0		if (!src_is_vram)
> -			emit_pte(m, bb, src_L0_pt, src_is_vram,
> true, &src_it, src_L0,
> -				 src_bo);
> +			emit_pte(m, bb, src_L0_pt, src_is_vram,
> copy_system_ccs ? true : false,

Can't we just use "copy_system_ccs" rather than "copy_system_ccs ? true
: false" here and below?


> +				 &src_it, src_L0, src_bo);
> =C2=A0		else
> =C2=A0			xe_res_next(&src_it, src_L0);
> =C2=A0
> =C2=A0		if (!dst_is_vram)
> -			emit_pte(m, bb, dst_L0_pt, dst_is_vram,
> true, &dst_it, src_L0,
> -				 dst_bo);
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram,
> copy_system_ccs ? true : false,
> +				 &dst_it, src_L0, dst_bo);
> =C2=A0		else
> =C2=A0			xe_res_next(&dst_it, src_L0);
> =C2=A0
> @@ -978,8 +978,8 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0		size -=3D clear_L0;
> =C2=A0		/* Preemption is enabled again by the ring ops. */
> =C2=A0		if (!clear_vram) {
> -			emit_pte(m, bb, clear_L0_pt, clear_vram,
> true, &src_it, clear_L0,
> -				 bo);
> +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> clear_system_ccs ? true : false,
> +				 &src_it, clear_L0, bo);
> =C2=A0		} else {
> =C2=A0			xe_res_next(&src_it, clear_L0);
> =C2=A0		}

