Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF239C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7738310F13D;
	Wed,  9 Sep 2026 12:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oUtDr1rl";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3025710F13D
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:58:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 021CE40196;
 Wed,  9 Sep 2026 12:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA63B1F00A3A;
 Wed,  9 Sep 2026 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958687;
 bh=pEtotC1qS5sS1UUbwahEAZt9H5wPeWVnVEWLqCp0zbo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=oUtDr1rlKK2YWrrGrXgMSI82nwu0jCQFno6awaSCKBD8qJpHyGifBvIaE5W0WNczC
 Xvwh2NGwRdK8/rLnl23yWyez4ciXYe4Plrc9mbfvc/xaHAVS3bGPYZzljYz+WBMnkK
 yY3S7YTBSd3ko4mMSPxKT1etoaSKj8pAXY9GtldH3a0FoBfuPULehEEjiiQClKePmd
 fB1ZoXu6oLOIAs+tjBAaf4n7wSFTBEgAA6nHO061RTja85RowobUULzmiWLAzxCBsp
 KloWZbfSkpmPJLIHmba/GTHPgxjuoP25IGi39fJcMYmBw+gdm0uce6l3PRGRJRWKJ8
 PIgq67Yf1Vw8A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 21/21] drm/xe/svm: Distinguish access-counter-triggered
 range setup in logs
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-44-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-44-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:58:07 +0000
Message-Id: <20260909125807.BA63B1F00A3A@smtp.kernel.org>
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
- [Medium] Incomplete implementation of debug trace context separation
--

commit 7432312b157971575fb03d4801aac465020f0d08
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/svm: Distinguish access-counter-triggered range setup in logs

This commit modifies __xe_svm_range_setup() to differentiate range_debug()
traces between page fault and access counter trigger paths.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 78a8c72cbbd68..d773a91d24922 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -1429,7 +1432,9 @@ static int __xe_svm_range_setup(struct xe_vm *vm, s=
truct xe_vma *vma,
>  	range_debug(range, "GET PAGES");

[Severity: Medium]
This debug trace was missed and will log identically for both paths, failing
to provide the promised traceability. Should this code distinguish the paths
here too?

>  	err =3D xe_svm_range_get_pages(vm, range, &ctx);
>  	if (err =3D=3D -EOPNOTSUPP)
> -		range_debug(range, "PAGE FAULT - EVICTED PAGES");
> +		range_debug(range, acc_ctr_trigger ?
> +			    "ACCESS COUNTER TRIGGERED - EVICTED PAGES" :
> +			    "PAGE FAULT - EVICTED PAGES");
[ ... ]

In the same function, there is another debug log that still hardcodes the w=
ord
"fault":

drivers/gpu/drm/xe/xe_svm.c:__xe_svm_range_setup() {
    ...
		if (err) {
			if (migrate_try_count || !ctx.devmem_only) {
				drm_dbg(&vm->xe->drm,
					"VRAM allocation failed, falling back to retrying fault, asid=3D%u, er=
rno=3D%pe\n",
					vm->usm.asid, ERR_PTR(err));
    ...
}

[Severity: Medium]
The log message incorrectly assumes it's always a 'fault', which goes again=
st
the goal of correctly distinguishing the execution context. Are we missing =
an
update to this message for the access counter trigger path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D21
