Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D9E606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsNx4daU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E57910FB18;
	Wed, 28 Oct 2026 10:30:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF3910FB18
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 10:30:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A179B41A80;
 Wed, 28 Oct 2026 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2111F01825;
 Wed, 28 Oct 2026 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793183432;
 bh=7Tn9nPcwWR1PGkBWNm6W+nqJMEjPqIQvVpB7X6o+biA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=AsNx4daUq5cYDfMD+f31HmowLTQ31wHDGAM3REYTAl2QhfCrjLvG7BD3j/HXpUFQu
 bfj7wU8A7s0S2WWV5htOQZbrkeiP94/h1HLwa47rQAKZV20MjRYRvObLKqiZ+1T/3v
 wsP/wfyC1n0GB2MfXsRkE8+ydQjZbRev1lk+yXHPiptCDoVnbn3jopg5aPK4HuKQGM
 Oy/Y5fc7FL/5yNnc773p7VXYZz3qQ//MBZqqJlbINA25k2gzglUwz/e+EMWBus/zSR
 AvbKxM/rz2W0xtm+xp5xc0IGVaWBfpM3KA6pnV5uKUuwAxzheG8ZvNBdYXYSA4ki+g
 oBCeHUL5njYAQ==
Message-ID: <sashiko-outbox-187748@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/10] drm/xe/cper: Log CPER records for aggregate
 counter retrieval
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261028095723.734387-17-badal.nilawar@intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-17-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 10:30:31 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe/ras: leak offlined_pages XArray on xe_cper_sysfs_init() e=
rror
--

commit 6077a66c6338e4db5c918ef6aa2f82fb393dd9be
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Log CPER records for aggregate counter retrieval

This commit adds a cper_on_query sysfs attribute to control whether CPER
records are emitted when userspace queries RAS error counters, and updates
xe_ras_get_counter() and xe_ras_init() to support it.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0555b86b63b27..6664153b3cae7 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -1246,5 +1284,9 @@ int xe_ras_init(struct xe_device *xe)
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);
> =20
> +	ret =3D xe_cper_sysfs_init(xe);
> +	if (ret)
> +		return ret;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
>  }

[Severity: Medium]
Does returning early here on xe_cper_sysfs_init() failure leak the entries
allocated in state->offlined_pages?

Earlier in xe_ras_init(), state->offlined_pages is initialized and populate=
d:

drivers/gpu/drm/xe/xe_ras.c:xe_ras_init() {
	...
	xa_init(&state->offlined_pages);

	/* Fetch the offline list before queue to avoid duplication */
	get_offline_list(xe);
	get_offline_queue(xe);
	...
	xe_ras_process_errors(xe);
}

Those helpers store entries into state->offlined_pages via xa_store(...,
GFP_KERNEL), which is normally cleaned up by ras_fini():

static void ras_fini(void *arg)
{
	struct xe_device *xe =3D arg;

	xa_destroy(&xe->ras.state.offlined_pages);
}

If xe_cper_sysfs_init() fails and returns before devm_add_action_or_reset()
registers ras_fini(), nothing calls xa_destroy(&state->offlined_pages). Sho=
uld
devm_add_action_or_reset(xe->drm.dev, ras_fini, xe) be registered right aft=
er
xa_init(), or should xa_destroy() be called on this error path (or should
xe_cper_sysfs_init() failure be logged as non-fatal like gpu_health_group
above)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028095723.7343=
87-12-badal.nilawar@intel.com?part=3D5
