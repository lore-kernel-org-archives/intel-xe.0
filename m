Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A069606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAZXDZCP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E60710E489;
	Fri,  6 Nov 2026 22:25:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1AF10E489
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 22:25:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5CC2760232;
 Fri,  6 Nov 2026 22:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09DB1F0089F;
 Fri,  6 Nov 2026 22:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794003900;
 bh=rAgkqne3GVPof/KIGVu13Po5/DjiZO8T9rMWEexul14=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=UAZXDZCPj6adHw8ra/ogeb/y09S5F5v9unj+r0zU3tdqYbMukBFOv0+R5L95os61C
 UGHzgSksfcWQK+LY4r7kKNAKEcConzMG2+JSmH3Xj4XjDb9eOJwk0yhSXl0aj98k+E
 Ak67KpoJSpzA28D4SekZTyf9lTWAIaRJuH98FkRZbTflT3fUB9uVvUJvGQAh/E20j+
 DOIfAsDHn4mhov+lLz9MIJvOnZPvIa6EQrckWr7b5z4bOOqzHgfLNbmkGxhguqA7kn
 PFWSRrD8JiSayENn2lyYw9C7wOKBipDb8kvA2Bn6ROggnBxk03c8t3DnM6ULCGe4An
 NsH85h99zpkrg==
Message-ID: <sashiko-outbox-202331@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] drm/xe/vf: Late fixups of LRCs after VF migration
To: "Tomasz Lis" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106215700.1218318-2-tomasz.lis@intel.com>
References: <20261106215700.1218318-1-tomasz.lis@intel.com>
 <20261106215700.1218318-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 22:24:59 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe/vf: unchecked drmm_mutex_init() in
  xe_gt_sriov_vf_init_early()
- [Low] drm/xe/vf: inaccurate commit message on LRC fixups for
  registered queues
--

commit 23a112cec6cc9cc925edc77bd85cca15d49b52e4
Author: Tomasz Lis <tomasz.lis@intel.com>

drm/xe/vf: Late fixups of LRCs after VF migration

This commit moves LRC HWSP GGTT rebasing out of vf_post_migration_fixups()
to register_exec_queue() and guc_exec_queue_unpause_prepare(), protecting
the migration scratch buffer with a drm-managed mutex.

> Do not fix LRCs of existing contexts during VF post-migration
> recovery. Instead, perform fixups before every exec queue
> registration.

[Severity: Low]
Is this commit message description accurate for already-registered
contexts?

Contexts that are already registered across VF migration do not run
register_exec_queue() again; instead, their LRCs are still rebased during
post-migration recovery in guc_exec_queue_unpause_prepare() (via
vf_post_migration_recovery() -> vf_post_migration_rearm() ->
xe_guc_submit_unpause_prepare_vf()).  Only unregistered contexts defer LRC
fixups until register_exec_queue().

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_vf.c
> index 2a5f2064ad3e8..4412ed6eb422f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
[ ... ]
> @@ -1498,17 +1494,19 @@ static void vf_migration_fini(void *arg)
>   */
>  int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>  {
> +	struct xe_device *xe =3D gt_to_xe(gt);
>  	void *buf;
> =20
> -	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> +	if (!xe_sriov_vf_migration_supported(xe))
>  		return 0;
> =20
> -	buf =3D drmm_kmalloc(&gt_to_xe(gt)->drm,
> -			   post_migration_scratch_size(gt_to_xe(gt)),
> +	buf =3D drmm_kmalloc(&xe->drm,
> +			   post_migration_scratch_size(xe),
>  			   GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
> =20
> +	drmm_mutex_init(&xe->drm, &gt->sriov.vf.migration.scratch_lock);
>  	gt->sriov.vf.migration.scratch =3D buf;

[Severity: Medium]
Should xe_gt_sriov_vf_init_early() check and return the error from
drmm_mutex_init()?

drmm_mutex_init() expands to drmm_add_action_or_reset(), which is annotated
__must_check and triggers a -Wunused-result warning (breaking builds with
-Werror).  If the drmres allocation fails, __drmm_mutex_release() destroys
scratch_lock while xe_gt_sriov_vf_init_early() returns 0, leaving
xe_exec_queue_lrcs_hwsp_rebase() to lock a destroyed mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106215700.1218=
318-1-tomasz.lis@intel.com?part=3D1
