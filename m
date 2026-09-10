Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018A5C79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 23:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9805010F19B;
	Thu, 10 Sep 2026 23:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VcHQtJeD";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C492910F19B
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 23:41:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 22DAC601F0;
 Thu, 10 Sep 2026 23:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B691F000FF;
 Thu, 10 Sep 2026 23:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789083663;
 bh=pFJcCCBfNN9faemxV9dWryiE6cGLlW/Y1GWKkR2jNDw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VcHQtJeD4j8LJH6k7xmRPuWCZIvyQPmy1ABj1b7uH6dNBqalQdvPBaqX4XeRh7N5V
 T8Dxc70bcVrjhizfsv/hlHG6udhlXhMIVZTrnLmfhvyv9RfMwtLLRePfb1hUFk15CS
 23wkTstNgRUi6bG8hI9IOYDfbmvmFD8fhKaQoe3xvwh5Zq+OEYoIQyLzm5OzobM9Bk
 ftqGgDRhpgG8N2dJUlLBCrsgi4GCTqe9ywNO2k0JH62QSUR2AD51NoZMYQwpYJGDd2
 YQr8o/sUzXsFry5CO9VXQBPRDKFnNnW7RBLyAoNPJX7siryjrHHpsx8sYncYgUyFbt
 IgT3HP3B7KUQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/tlb_inval: Squash wedged error in GGTT TLB
 invalidation
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910232734.93054-1-shuicheng.lin@intel.com>
References: <20260910232734.93054-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:41:02 +0000
Message-Id: <20260910234103.60B691F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix for -ENOTRECOVERABLE during TLB invalidation on wed=
ged devices, leaving PPGTT and ALL invalidation paths unfixed.
--

commit aa259f67109f1c7c63d45a7dc6b510e56c304328
Author: Shuicheng Lin <shuicheng.lin@intel.com>

drm/xe/tlb_inval: Squash wedged error in GGTT TLB invalidation

This commit squashes -ENOTRECOVERABLE into -ECANCELED during GGTT TLB
invalidation on wedged devices. It avoids a WARN_ON taint during resets.

> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/x=
e_guc_tlb_inval.c
> index 111fef781b2ab..578cafa5526dd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -75,8 +75,14 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tl=
b_inval, u32 seqno)
>  			seqno,
>  			MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
>  		};
> +		int ret;
> =20
> -		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
> +		ret =3D send_tlb_inval(guc, action, ARRAY_SIZE(action));
> +		/* Device wedged: message not delivered */
> +		if (ret =3D=3D -ENOTRECOVERABLE)
> +			return -ECANCELED;
> +
> +		return ret;
>  	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
>  		struct xe_mmio *mmio =3D &gt->mmio;
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does this incomplete fix lea=
ve
other invalidation paths vulnerable to the same -ENOTRECOVERABLE propagatio=
n?

For instance, in send_tlb_inval_ppgtt(), send_tlb_inval() can return
-ENOTRECOVERABLE unmodified when the device is wedged:

drivers/gpu/drm/xe/xe_guc_tlb_inval.c:send_tlb_inval_ppgtt() {
	...
	err =3D send_tlb_inval(guc, action, len);
	if (!err && prl_sa) {
		xe_gt_assert(gt, seqno !=3D TLB_INVALIDATION_SEQNO_INVALID);
		err =3D send_page_reclaim(guc, seqno, xe_sa_bo_gpu_addr(prl_sa));
	}
	return err;
}

If a PPGTT invalidation occurs on a wedged device (e.g., during VMA teardow=
n or
BO eviction), it propagates -ENOTRECOVERABLE up the stack.

This triggers a WARN_ON_ONCE in xe_svm_range_notifier_event():

drivers/gpu/drm/xe/xe_svm.c:xe_svm_range_notifier_event() {
	...
	err =3D xe_tlb_inval_range_tilemask_submit(xe, vm->usm.asid, adj_start,
						 adj_end, tile_mask, &batch);
	if (!WARN_ON_ONCE(err))
		xe_tlb_inval_batch_wait(&batch);
	...
}

This can abort the BO eviction or SVM teardown process, leading to resource
leaks exactly as it did in the GGTT path.

Are similar squashing checks needed in send_tlb_inval_ppgtt(),
send_tlb_inval_ctx_ppgtt(), and send_tlb_inval_all() since they also direct=
ly
return the result of send_tlb_inval() on their respective paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910232734.9305=
4-1-shuicheng.lin@intel.com?part=3D1
