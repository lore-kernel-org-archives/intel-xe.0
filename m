Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEAECC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 16:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E84810F196;
	Thu, 15 Oct 2026 16:12:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC4A10F196
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 16:12:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 810D140AE6;
 Thu, 15 Oct 2026 16:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5CD1F000C4;
 Thu, 15 Oct 2026 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792080771;
 bh=hbJnbLPJE1WdQAAC6E5MwtsU0EwZdeG/ityohMpw/pw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=l4vtLi8sj4yrIPsDrZ5aFNGwgX9vFIVDezLRsmaUB8yw0F1eSf9szUAcYn1WWdkae
 Ue3yJWoaDsw3ESxPNzeu+sq9199p1zOUZN+59dcfUhLnlfHt9gbD7Nr9O1magigvGX
 uNmeoNt+9HgvXNUt2nsFVYBr+XQtYnQOZwrrqP0sxV+PSz54aBuCE2Hnn218VSI0LM
 E1h9ncB+7lxnfolq7NQGgHoDFo+Croj/XtQ6Wa/qQ+Fl2Bw2Kx5YHFgELU2xHAdjr7
 Q3L+oFy79xCkpk1Tyz6SmU/he1NtET8WqC54vKnVlDEGmMqd693eXZx34RLQyer0yX
 LZ4TpVtiufeYg==
Message-ID: <sashiko-outbox-173147@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] drm/xe/pat: always check is_valid() when
 querying an index
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261015154553.483229-8-matthew.auld@intel.com>
References: <20261015154553.483229-5-matthew.auld@intel.com>
 <20261015154553.483229-8-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:12:50 +0000
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
- [High] drm/xe: speculative OOB read via unmitigated pat_index in madvise =
ioctl
--

commit 9ef2350e60afb2ff1710835baa5a7f21be86bd9c
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe/pat: always check is_valid() when querying an index

This commit makes the behavior consistent by treating unknown indices as
programmer errors when extracting comp or l3, similar to coh_mode.

> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index d0dac1ebd4784..9ab8fab43a884 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -302,7 +302,7 @@ bool xe_pat_index_is_valid(struct xe_device *xe, u16 =
pat_index)
> =20
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  {
> -	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));

[Severity: High]
Does this WARN_ON() allow a speculative out-of-bounds read?

When xe_vm_madvise_ioctl() passes an unmitigated user value args->pat_index=
.val
into check_pat_args_are_sane():

xe_vm_madvise_ioctl() {
	...
	if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
		if (!check_pat_args_are_sane(xe, &madvise_range,
					     args->pat_index.val)) {
	...
}

It bypasses the array_index_nospec() mitigation computed earlier in the same
function. check_pat_args_are_sane() then calls xe_pat_index_get_coh_mode(),
which now invokes xe_pat_index_is_valid():

xe_pat_index_is_valid() {
	WARN_ON(pat_index >=3D xe->pat.n_entries);
	return xe->pat.table[pat_index].valid;
}

Since WARN_ON() does not return early on failure, could an unmitigated
speculative index cause a speculative out-of-bounds read on
xe->pat.table[pat_index]?

The loaded values are then used in branching logic (if (coh_mode !=3D XE_CO=
H_NONE)),
which might create a speculative disclosure gadget reachable by an unprivil=
eged
user.

>  	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
>  		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>  	return xe->pat.table[pat_index].coh_mode;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015154553.4832=
29-5-matthew.auld@intel.com?part=3D3
