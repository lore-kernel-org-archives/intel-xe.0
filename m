Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCD0FCE06D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FEB10E920;
	Thu, 26 Feb 2026 12:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Do7CHi5e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A96110E920
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772110067; x=1803646067;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I30qaKRuyRpshbK7CQO+z6Zt20Z/6Hkdc0RdZwp72H0=;
 b=Do7CHi5euP3QTM+DVa9vxh/B3X1tQ+x0gr6hlp6G96Xfng7puD+91sIO
 vP/yTcGNTGJGNGEgV3bzTREHLPkWzcWT+eKsbalhTK2CaC7JmYiHi/Wph
 VypafCZDreaBL26FexlW8eS/KQj8oVOnWW5RNojtvEfPtHHzf5ltGdwid
 X4WORw0AUnwXFYN9imeEGuh+PY0piS5MCn5/C5txoYY+HzaKfJ9+VZRbv
 pZ1Et4Asqs7iEQsqMkIGiAttNDCnlgbqXmSBL+OZAaiOpop2jd7kiDhV5
 wmXp+Y4oFjkB5q7Xw2xNsKzga+li6r+XSfFMisoBS4VynUkSoSJI+RXqe A==;
X-CSE-ConnectionGUID: 9pMdNYgpQZ2WOmnbwITUBA==
X-CSE-MsgGUID: xQ43OekySwy2Cm/UF3LAHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76774837"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="76774837"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:47:46 -0800
X-CSE-ConnectionGUID: 6ZpyrupYRzmmL/1k6GvJFQ==
X-CSE-MsgGUID: AvWsLOMWTM+IgaVc9bKX+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="220696412"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.215])
 ([10.245.244.215])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:47:44 -0800
Message-ID: <5af82176a404fed45d84f727141db32ed05c73ae.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Avoid unconditional VRAM reads in H2G path
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, francois.dugast@intel.com, 
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Date: Thu, 26 Feb 2026 13:47:42 +0100
In-Reply-To: <20260218043319.809548-3-matthew.brost@intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-3-matthew.brost@intel.com>
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

On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> desc_read() issues an VRAM read which serializes the CPU and drains
> posted writes on dGPU platforms. The H2G tracepoint evaluated its
> arguments unconditionally, so even with tracing disabled the
> submission
> path paid the full VRAM readf latency. Guard the tracepoint with

s/readf/read/

> trace_xe_guc_ctb_h2g_enabled().
>=20
> Adso move the descriptor status verification under

s/Adso/Also/

> CONFIG_DRM_XE_DEBUG.
> This removes another unnecessary VRAM read in non-debug builfds.

s/builfds/builds/

>=20
> This results in ~10=C3=97 faster H2G submission and significantly reduces
> lock contention across the driver.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc_ct.c | 25 ++++++++++++++++---------
> =C2=A01 file changed, 16 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> b/drivers/gpu/drm/xe/xe_guc_ct.c
> index ea07a27757d5..37842c93e0ee 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -939,22 +939,22 @@ static int h2g_write(struct xe_guc_ct *ct,
> const u32 *action, u32 len,
> =C2=A0	u32 full_len;
> =C2=A0	struct iosys_map map =3D IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
> =C2=A0							 tail *
> sizeof(u32));
> -	u32 desc_status;
> =C2=A0
> =C2=A0	full_len =3D len + GUC_CTB_HDR_LEN;
> =C2=A0
> =C2=A0	lockdep_assert_held(&ct->lock);
> =C2=A0	xe_gt_assert(gt, full_len <=3D GUC_CTB_MSG_MAX_LEN);
> =C2=A0
> -	desc_status =3D desc_read(xe, h2g, status);
> -	if (desc_status) {
> -		xe_gt_err(gt, "CT write: non-zero status: %u\n",
> desc_status);
> -		goto corrupted;
> -	}
> -
> =C2=A0	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> =C2=A0		u32 desc_tail =3D desc_read(xe, h2g, tail);
> =C2=A0		u32 desc_head =3D desc_read(xe, h2g, head);
> +		u32 desc_status;
> +
> +		desc_status =3D desc_read(xe, h2g, status);
> +		if (desc_status) {
> +			xe_gt_err(gt, "CT write: non-zero status:
> %u\n", desc_status);
> +			goto corrupted;
> +		}
> =C2=A0
> =C2=A0		if (tail !=3D desc_tail) {
> =C2=A0			desc_write(xe, h2g, status, desc_status |
> GUC_CTB_STATUS_MISMATCH);
> @@ -1023,8 +1023,15 @@ static int h2g_write(struct xe_guc_ct *ct,
> const u32 *action, u32 len,
> =C2=A0	/* Update descriptor */
> =C2=A0	desc_write(xe, h2g, tail, h2g->info.tail);
> =C2=A0
> -	trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1),
> full_len,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 desc_read(xe, h2g, head), h2g-
> >info.tail);
> +	/*
> +	 * desc_read() performs an VRAM read which serializes the
> CPU and drains
> +	 * posted writes on dGPU platforms. Tracepoints evaluate
> arguments even
> +	 * when disabled, so guard the event to avoid adding =C2=B5s-
> scale latency to
> +	 * the fast H2G submission path when tracing is not active.
> +	 */
> +	if (trace_xe_guc_ctb_h2g_enabled())
> +		trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1),
> full_len,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 desc_read(xe, h2g, head), h2g-
> >info.tail);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
With the typos fixed,

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
