Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09161098784
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 13:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A895510EAC7;
	Fri, 20 Mar 2026 13:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ME3YNx9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B6210EAF1
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774012014; x=1805548014;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=neT4CJujJINsHWHKamR+aeGibdlK2QbEWZprMcrYeVE=;
 b=ME3YNx9ea3jS6PRBaWdpLSqF9j2yrEWy6lUeETL/9PS4t+s2uWLdwVS1
 PTvQ9vnTFmUcHP2ShO8dGWGBddvkS93V4AFVncSrp8C1txPngcdEbZ4Bv
 7RcIWOmuW4wwV0X9NdxUhjulpELlPqluQXyLjuBP9dwDGx3AHIorosHfC
 iSS7jsLgS69yFQoFL40Ad28uTAHfASuVkvx++v7ttu+A2WN9ZyJqSKvva
 20b//m64yWEHeH4p/tBJvvZBnmVMzb90xMgVFTMtFn1m4k2sVrEOsF6Ao
 TVF/mkXvXdP2SyUNcGq0u3lAMAb6cAuinPu9KgqEAs39+yUHmKgbNRUWc A==;
X-CSE-ConnectionGUID: xY8bTi9dTU+zTSpeO/Gh1Q==
X-CSE-MsgGUID: LzCsOfgtQj63DNWrJwtGmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74977921"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74977921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 06:06:54 -0700
X-CSE-ConnectionGUID: e4oGqGi6SBCIQhjCUMRWYQ==
X-CSE-MsgGUID: BtbbvMqBQv+Hjrv+fS5lww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223264045"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.69])
 ([10.245.245.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 06:06:53 -0700
Message-ID: <140f8047a6c5d798dce8c2970d6c47e4033b3e19.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Skip media GT TLB invalidation when VM has no
 queues mapped
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 20 Mar 2026 14:06:51 +0100
In-Reply-To: <20260304233728.926378-1-matthew.brost@intel.com>
References: <20260304233728.926378-1-matthew.brost@intel.com>
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

On Wed, 2026-03-04 at 15:37 -0800, Matthew Brost wrote:
> If no exec queues from a VM are mapped on the media GT, issuing a
> PPGTT TLB invalidation for that GT requires an rc6 wake which is
> expensive.
>=20
> Skip the media GT TLB invalidation when the VM has no exec queues
> mapped on it. If TLB invalidations are already in-flight on that GT
> we can't break fence ordering, so issue a dummy GGTT invalidation
> instead to maintain seqno ordering.
>=20
> This optimization is particularly impactful for SVM workloads which
> may or may not use the media GT. Average TLB invalidation time drops
> from ~75us to ~18us in such benchmarks.
>=20
> Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Can we make this gt type agnostic so that regardless of gt type,
we skip tlb invalidations if there are no active exec-queues?

/Thomas



> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 43
> +++++++++++++++++++++++++--
> =C2=A01 file changed, 41 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index ced58f46f846..20c34469d9a5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -205,14 +205,53 @@ static int send_tlb_inval_asid_ppgtt(struct
> xe_tlb_inval *tlb_inval, u32 seqno,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_suballoc *prl_sa)
> =C2=A0{
> =C2=A0	struct xe_guc *guc =3D tlb_inval->private;
> +	struct xe_device *xe =3D guc_to_xe(guc);
> +	struct xe_gt *gt =3D guc_to_gt(guc);
> +	struct xe_vm *vm;
> +	int err =3D 0, id =3D guc_to_gt(guc)->info.id;
> =C2=A0
> =C2=A0	lockdep_assert_held(&tlb_inval->seqno_lock);
> =C2=A0
> =C2=A0	if (guc_to_xe(guc)->info.force_execlist)
> =C2=A0		return -ECANCELED;
> =C2=A0
> -	return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
> -				=C2=A0=C2=A0=C2=A0 XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> prl_sa);
> +	if (!xe_gt_is_media_type(gt))
> +		return send_tlb_inval_ppgtt(guc, seqno, start, end,
> asid,
> +					=C2=A0=C2=A0=C2=A0
> XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> +					=C2=A0=C2=A0=C2=A0 prl_sa);
> +
> +	/* Try to skip media GT TLB invalidations */
> +
> +	vm =3D xe_device_asid_to_vm(xe, asid);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);
> +
> +	down_read(&vm->exec_queues.lock);
> +
> +	if (!vm->exec_queues.count[id]) {
> +		/*
> +		 * We can't break fence ordering for TLB
> invalidation jobs, if
> +		 * TLB invalidations are inflight issue a dummy
> invalidation to
> +		 * maintain ordering. Nor can we move safely the
> seqno_recv when
> +		 * returning -ECANCELED if TLB invalidations are in
> flight. Use
> +		 * GGTT invalidation as dummy invalidation given
> ASID
> +		 * invalidations are unsupported here.
> +		 */
> +		if (xe_tlb_inval_idle(tlb_inval))
> +			err =3D -ECANCELED;
> +		else
> +			err =3D send_tlb_inval_ggtt(tlb_inval, seqno);
> +		goto err_unlock;
> +	}
> +
> +	err =3D send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
> +				=C2=A0=C2=A0 XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> prl_sa);
> +
> +err_unlock:
> +	up_read(&vm->exec_queues.lock);
> +	xe_vm_put(vm);
> +
> +	return err;
> =C2=A0}
> =C2=A0
> =C2=A0static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval,
> u32 seqno,
