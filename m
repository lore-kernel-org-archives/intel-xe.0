Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17750D6B076
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 15:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC58010E89D;
	Thu, 29 Jan 2026 15:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpYHO1iA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF0C10E8A1
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769701193; x=1801237193;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RXA19DD3wYlXa3jFcGFnTh8t3fY+SYCuic0urkcHqj8=;
 b=gpYHO1iAuJPQ5dFBlrw40zHpKDPmSedxAIUYBUs3p+TveAKapXocX553
 tCh9rK2+/fU1L+3Qogps4oYMiiukIU5pJHtT1VTfuxu1ywxZ1cOje7Yku
 TXhyeWiI6sqiZRjKRgHZ8zsL24QamabASpcJ3RHTITFfqqIzfIDzqRSg+
 PmaN7Y2bx/oZQYrN5UsM42nsPsgEK39kbgkVGoUBUlkuP+QkibYxLMElC
 YNaOuwMpMG1jZCLuyafvQrpBGk7TsF86+fuAatUB1tOsdxh/Y1DuVJ/jn
 mSVEBiclXgs18wfsrWYtjdoZySC7phSnfUYzbkFz191mQSMb2xdFKlVmH w==;
X-CSE-ConnectionGUID: vKoB6TlaQ2WpJcnIlQOEJQ==
X-CSE-MsgGUID: j7O67Z0FS7yJGeXZ8NkYeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70143585"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70143585"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 07:39:53 -0800
X-CSE-ConnectionGUID: 5PZL6QkQThCt1g1Qn2VhCw==
X-CSE-MsgGUID: MJ8o6JpSSQmXIx/gZttB+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208616441"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.140])
 ([10.245.245.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 07:39:51 -0800
Message-ID: <39c1fd57b78f09761867a469fae16c347d879dcb.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Thu, 29 Jan 2026 16:39:37 +0100
In-Reply-To: <20260129125141.523087-5-satyanarayana.k.v.p@intel.com>
References: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
 <20260129125141.523087-5-satyanarayana.k.v.p@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

Hi.

On Thu, 2026-01-29 at 12:51 +0000, Satyanarayana K V P wrote:
> CCS save/restore batch buffers are attached during BO allocation and
> detached during BO teardown. The shrinker triggers xe_bo_move(),
> which is
> used for both allocation and deletion paths.
>=20
> When BO allocation and shrinking occur concurrently, a circular
> locking
> dependency involving fs_reclaim and swap_guard can occur, leading to
> a
> deadlock such as:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> WARNING: possible circular locking dependency detected
> ------------------------------------------------------
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 CPU1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ----
> =C2=A0lock(fs_reclaim);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&sa_manager->swap_guard);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(fs_reclaim);
> =C2=A0lock(&sa_manager->swap_guard);
>=20
> =C2=A0*** DEADLOCK ***
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> To avoid this, allocate CCS save/restore BB BOs using GFP_ATOMIC,
> preventing reclaim from being invoked in this context.
>=20
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands
> with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

If shrinking and allocation is indeed happening concurrently, then
GFP_ATOMIC is highly likely to fail. In fact it shouldn't be used if we
can't gracefully recover from a failure or if the failure doesn't
matter at all, like in debugging cases where we can lose data.

I'm trying to wrap my head around the sa manager shadow approach and it
seems to me like external code putting the sa manager in a particular
state and the internal lock is accessed from outside the sa code with
no clearly defined locking rules / asserts? IMO it's a very odd and
fragile construct, in particular when used with guard() where it's
unclear exactly what scope is needing locking.

I'm trying to find some documentation to explain why this is used and
the only thing I can find is=20

"Directly clearing the BB lacks atomicity and can lead to undefined
behavior if the vCPU is halted mid-operation...."

But what if the vCPU is halted during xe_sa_bo_sync_shadow()? What is
exactly is the atomicity in this case?=20

Thanks,
Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bb.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 8b678297aaa2..355365625df9 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -62,7 +62,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> dwords, bool usm)
> =C2=A0struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> =C2=A0			=C2=A0=C2=A0=C2=A0 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> =C2=A0{
> -	struct xe_bb *bb =3D kmalloc(sizeof(*bb), GFP_KERNEL);
> +	struct xe_bb *bb =3D kmalloc(sizeof(*bb), GFP_ATOMIC);
> =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> =C2=A0	struct xe_sa_manager *bb_pool;
> =C2=A0	int err;
> @@ -78,7 +78,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32
> dwords,
> =C2=A0	 */
> =C2=A0
> =C2=A0	bb_pool =3D xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> -	bb->bo =3D xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> +	bb->bo =3D __xe_sa_bo_new(bb_pool, 4 * (dwords + 1),
> GFP_ATOMIC);
> =C2=A0
> =C2=A0	if (IS_ERR(bb->bo)) {
> =C2=A0		err =3D PTR_ERR(bb->bo);
