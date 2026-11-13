Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0F2606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsjGVITd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A41D10EB90;
	Fri, 13 Nov 2026 07:51:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6CB10EB90
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 07:51:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 75D20625A1;
 Fri, 13 Nov 2026 07:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AB91F000C4;
 Fri, 13 Nov 2026 07:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794556303;
 bh=R3Tlx8vfPPB0URYEfo/ITv3ad9GnC3HZgaQc++t6s5Q=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=YsjGVITdLvXHCRvnjEVD+PKoI3nxYnK+OHoJwmyoC8JUTk4g0t1WuXDdtC9PrFGT6
 L/jxvpb/2EwXBINpf6JmeZ2IBLtpf99gLDof/ED0KFHLonEJ+gKdTR959pkl/nUxg7
 DgVUazW6qyybjpCmOkPeMUhedCtbvr1DeMSeD3vy42dqMS0cB7LS2mh1jMnUpPN0RY
 NAgmB5a7/P6uufkbi9ieZvKNnryPhxGCwo0pCkrSoUWPe+HU0YMOg+lJAg98bp0SIX
 4YxJBPaqWfP7kHQEVi2R66g9Oqd4ZeMdx/Ql1ng22Hp4meeZpINV4TrNpqOKep6Dcz
 6BdpBH5iyw0WA==
Message-ID: <sashiko-outbox-212370@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] CI_ONLY Mark VMs as closing before queue cleanup
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261113073549.352746-3-arvind.yadav@intel.com>
References: <20261113073549.352746-1-arvind.yadav@intel.com>
 <20261113073549.352746-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:51:42 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe: NULL pointer dereference in xe_pagefault_print() on
  ack_fault failure
--

commit 213c218fbf049faac8f39a23293d5c3f7bb580b5
Author: Arvind Yadav <arvind.yadav@intel.com>

CI_ONLY Mark VMs as closing before queue cleanup

This commit introduces an XE_VM_FLAG_CLOSING state set before asynchronous
queue teardown to block new VM work and serialize cached page-fault
acknowledgments against VM closure.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> index 98cce0f12b123..ac05e7b6315de 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c

[ ... ]

> @@ -678,32 +678,35 @@ static void xe_pagefault_queue_work(struct work_str=
uct *w)
> =20
>  	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
>  		const struct xe_pagefault_ops *ops =3D pf->producer.ops;
> +		struct xe_vm *ack_vm =3D NULL;
>  		void *private =3D pf->producer.private;
>  		struct xe_gt *gt =3D pf->gt;
>  		u32 asid =3D FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
> +		struct xe_pagefault original =3D {
> +			.gt =3D gt,
> +			.consumer =3D {
> +				.page_addr =3D pf->consumer.page_addr,
> +				.access_type =3D pf->consumer.access_type,
> +				.fault_type_level =3D pf->consumer.fault_type_level,
> +				.engine_class_instance =3D
> +					pf->consumer.engine_class_instance,
> +				.id =3D pf->consumer.id,
> +			},
> +		};
> +		struct xe_pagefault *report_pf =3D pf;
>  		int err =3D 0;
>  		bool invalidated =3D false;
> +		bool cache_hit =3D false;
> =20
>  		/* Last fault same address, ack immediately */
>  		if (xe_pagefault_match(pf, cache_start, cache_end, cache_asid)) {
> -			xe_gt_stats_incr(gt, XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT, 1);
> +			cache_hit =3D true;
>  			goto ack_fault;
>  		}
> =20
>  		err =3D xe_pagefault_service(pf);
> =20
> -		if (err) {
> -			if (!(pf->consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> -				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
> -				xe_pagefault_cache_start_invalidate(cache_start);
> -				xe_pagefault_print(pf);
> -				xe_log_err_info(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
> -			} else {
> -				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_C=
OUNT, 1);
> -				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
> -					  ERR_PTR(err));
> -			}
> -		} else {
> +		if (!err) {
>  			/* Cache valid fault locally */
>  			cache_start =3D xe_pagefault_start_addr(pf);
>  			cache_end =3D xe_pagefault_end_addr(pf);
> @@ -711,6 +714,55 @@ static void xe_pagefault_queue_work(struct work_stru=
ct *w)
>  		}
> =20
>  ack_fault:
> +		/*
> +		 * Cache hits bypass fault service. Serialize successful replies
> +		 * with VM close, including replies to matching chained faults.
> +		 * Take vm->lock before ack_fault_begin() takes the CT lock and
> +		 * hold it until ack_fault_end() flushes the reply batch.
> +		 */
> +		if (!err) {
> +			/*
> +			 * Successful service may replace the fault fields with
> +			 * the resolved range. Use the original fields to report
> +			 * a failure detected here. Do not restore the live entry,
> +			 * which also contains queue state and chain links.
> +			 */
> +			report_pf =3D &original;
> +			ack_vm =3D xe_pagefault_asid_to_vm(report_pf, asid);
> +			if (IS_ERR(ack_vm)) {
> +				err =3D PTR_ERR(ack_vm);
> +				ack_vm =3D NULL;
> +			} else {
> +				down_read(&ack_vm->lock);
> +				if (xe_vm_is_closed_or_banned(ack_vm)) {
> +					xe_pagefault_set_error(report_pf,
> +							       XE_PAGEFAULT_ERROR_VM_CLOSED);
> +					err =3D -ENOENT;
> +					up_read(&ack_vm->lock);
> +					xe_vm_put(ack_vm);
> +					ack_vm =3D NULL;
> +				}
> +			}
> +		}
> +
> +		if (err) {
> +			xe_pagefault_cache_start_invalidate(cache_start);
> +			if (!(report_pf->consumer.access_type &
> +			      XE_PAGEFAULT_ACCESS_PREFETCH)) {
> +				xe_pagefault_save_to_vm(xe, report_pf);
> +				xe_pagefault_print(report_pf);

[Severity: High]
Does xe_pagefault_print(report_pf) dereference a NULL pf->producer.ops
pointer when the post-service ASID lookup or VM state check fails?

original only initializes .gt and .consumer, leaving original.producer
zero-initialized.  When report_pf is set to &original and the check at
ack_fault sets err, xe_pagefault_print(report_pf) dereferences
pf->producer.ops->print:

drivers/gpu/drm/xe/xe_pagefault.c:xe_pagefault_print() {
	enum xe_pagefault_error err =3D xe_pagefault_get_error(pf);

	if (WARN_ON_ONCE(!pf->producer.ops->print))
		return;

	pf->producer.ops->print(pf, xe_pagefault_error_to_str(err));
}

In addition, xe_guc_pagefault_print() reads pf->producer.msg to decode the
fault details, so original also needs .producer =3D pf->producer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113073549.3527=
46-1-arvind.yadav@intel.com?part=3D2
