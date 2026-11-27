Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8B5606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R36fsFTp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532E210E707;
	Fri, 27 Nov 2026 09:37:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB6310E698
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 09:37:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7391743644;
 Fri, 27 Nov 2026 09:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E38C1F00926;
 Fri, 27 Nov 2026 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795772262;
 bh=rxckmx1G2EGGogizcE1l+u3C5j4wxtZPsVD5g5Yocrk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=R36fsFTp+wU0/4RLzPFIFtRE7kjSIr+p/1pyXskNf6XUcD6fXRpborHnx9h8zXx7u
 Vg9xE+UoVFEcyESo+5mielIhu0gnHQeMX/8u8pS6vyoCJ3Fj2QDbST/4CKFsXH0+UM
 b4UTtnFxd+EFbeTiOV8kLYIJu5FyBjcZobgDdVFJU4ZvM3N1/LQQ4XWdsnrVP54ceD
 kCH2R7KFkHO2lIjmgGyaF43lDAIZLRbhj5JN1FpkhEb1CDt3MhdDGURx7OXPbkMasZ
 4K6offXyLCbDANPbsNXJfjYCWzeMJUZD7lcjxpuLrymA5FZWdyz37biCFrjlzyZ+X8
 Lf2S68mJEDlZA==
Message-ID: <sashiko-outbox-236990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/6] drm/xe/cper: Handle CPER allocations in atomic
 context
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261127092914.2176025-12-mallesh.koujalagi@intel.com>
References: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
 <20261127092914.2176025-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:37:41 +0000
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
- [Medium] drm/xe/cper: commit message contradicts GFP_NOWAIT use in
  cper_emit_sw_err()
--

commit fa3585155a74f119f9e4b51f2fac71fc5b12420d
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/cper: Handle CPER allocations in atomic context

This commit adds a gfp_t parameter to cper_record_emit() and updates
cper_emit_sw_err() to allocate software CPER messages and records with
GFP_NOWAIT instead of GFP_KERNEL.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 9161f2b52e9ba..10a4085d47f0a 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -183,7 +183,7 @@ static void cper_init_section_desc(struct xe_device *=
xe, u8 severity,
>  static void cper_record_emit(struct xe_device *xe, u8 severity,
>  			     const guid_t *notification_type,
>  			     const struct xe_cper_intel_hdr *ihdr,
> -			     const void *einfo, u32 einfo_len)
> +			     const void *einfo, u32 einfo_len, gfp_t gfp)
>  {
>  	struct cper_section_descriptor *sdesc;
>  	struct xe_cper_nonstd_record *rec;
> @@ -191,7 +191,7 @@ static void cper_record_emit(struct xe_device *xe, u8=
 severity,
>  	u32 total_len;
> =20
>  	total_len =3D sizeof(struct xe_cper_nonstd_record) + einfo_len;
> -	rec =3D kzalloc(total_len, GFP_KERNEL);
> +	rec =3D kzalloc(total_len, gfp);
>  	if (!rec)
>  		return;
> =20
> @@ -477,7 +477,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int c=
per_sev, enum xe_sigid sigi
>  				    entries[i].einfo_size, &ihdr);
> =20
>  		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
> -				 entries[i].einfo, entries[i].einfo_size);
> +				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
>  	}
> =20
>  	free_info_arr(info_arr, num_entries);
> @@ -511,7 +511,8 @@ static void cper_emit_sw_err(struct xe_device *xe, in=
t cper_sev, enum xe_sigid s
>  	char *msg;
>  	size_t msg_len;
> =20
> -	msg =3D kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
> +	/* TODO: Handle xe_log_* helper function for atomic context */
> +	msg =3D kvasprintf(GFP_NOWAIT, vaf->fmt, *vaf->va);
>  	if (!msg)
>  		xe_warn(xe, "Failed to allocate CPER message\n");
> =20
> @@ -525,7 +526,8 @@ static void cper_emit_sw_err(struct xe_device *xe, in=
t cper_sev, enum xe_sigid s
>  	timestamp =3D ktime_get_real_ns();
> =20
>  	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ih=
dr);
> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg=
, msg_len);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg=
, msg_len,
> +			 GFP_NOWAIT);
>  	kfree(msg);
>  }

[Severity: Medium]
Does the commit message match the changes in this patch?

The commit message says it adds a GFP argument to xe_cper_emit() and
introduces xe_log_*_atomic() helpers so callers can use GFP_KERNEL or
GFP_ATOMIC "without relying on a single GFP_NOWAIT allocation policy".
The code instead adds the gfp_t parameter to cper_record_emit(), uses a
single GFP_NOWAIT policy in cper_emit_sw_err(), and leaves atomic
xe_log_*() helpers as a TODO comment.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127092914.2176=
025-8-mallesh.koujalagi@intel.com?part=3D4
