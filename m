Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822A606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 00:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvnUJ0mP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E9410F0FD;
	Tue, 20 Oct 2026 00:27:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AFA10F10C
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 00:27:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 82F6B43947;
 Tue, 20 Oct 2026 00:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD131F000C4;
 Tue, 20 Oct 2026 00:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792456055;
 bh=ZiRWuvc6Y0eqMnN4nXa0DOB4vG3Baje3WSYcVAk9/Nc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=BvnUJ0mP5jlm6oLxU8lHWNsNtDYgV1tPHBwU7vfHOa7runoCbQHiFgYLSc8zHSlAp
 2jL3s6HYCCSSg1UpHlOxAHKVpUCZ8UUZrJoRtqzUSTjYiSsyajq/95XUpWDrgt9c3z
 ZfheVeE8bM2wN0mFpkrtfx78qLK5mO7EJWQ/d3mjZJusEbPySAw+xOBV3gN8wHOhnK
 uiOidOxqX/XKUUG7KdSyK4HEudliWCcOeqBqQwrna9HPJMOxzxGfhEVfFNefwhCzPE
 Puh+mIJ7vS29eowkD2JOaHluDq9S0cphYOeH4etl1SErLCUIUJuVGsW8XOhSHhgYjR
 bIJqAfeuMzsnw==
Message-ID: <sashiko-outbox-178382@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/cri: Set downstream access to L3 class 3 and
 write-back
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261020001513.1528267-1-daniel.charles@intel.com>
References: <20261020001513.1528267-1-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 00:27:34 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe: GRAPHICS_VERSION() in mert_was fails with NULL gt in rule_=
matches()
--

commit 5c800a0713723914264e86ed44f6bc8185c5ecb8
Author: Fei Yang <fei.yang@intel.com>

drm/xe/cri: Set downstream access to L3 class 3 and write-back

This commit adds a dedicated MERT workaround table and an RTP helper for
full-register device MMIO writes, programming DWNSTRM_ACCESS_MODE_GAMREQ_ME=
RTSS
with 0xcc on graphics version 3511 during probe and resume.

> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 6a8d6ea68f25d..539d06eaba6fc 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c

[ ... ]

> @@ -413,6 +414,44 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
> =20
> +/**
> + * xe_rtp_apply_device_mmio_writes - Apply full-register device MMIO wri=
tes
> + * @xe: Device to apply the actions to
> + * @table: RTP action table containing only full-register writes
> + *
> + * Device registers are accessed via the root tile without GT forcewake =
or
> + * GT save/restore bookkeeping.
> + *
> + * Return: 0 on success or -EINVAL for an unsupported action.
> + */
> +int xe_rtp_apply_device_mmio_writes(struct xe_device *xe,
> +				    const struct xe_rtp_table_sr *table)
> +{
> +	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
> +
> +	for (size_t i =3D 0; i < table->n_entries; i++) {
> +		const struct xe_rtp_entry_sr *entry =3D &table->entries[i];
> +
> +		if (!rule_matches(xe, NULL, NULL, entry->rules, entry->n_rules))
> +			continue;
> +
> +		for (size_t j =3D 0; j < entry->n_actions; j++) {
> +			const struct xe_rtp_action *action =3D &entry->actions[j];
> +
> +			if (drm_WARN_ON(&xe->drm, action->clr_bits !=3D ~0u ||
> +					action->reg.mcr || action->reg.masked ||
> +					action->flags || action->use_func))
> +				return -EINVAL;
> +
> +			xe_mmio_write32(mmio, action->reg, action->set_bits);
> +		}
> +
> +		drm_dbg(&xe->drm, "Applied device workaround %s\n", entry->name);
> +	}
> +
> +	return 0;
> +}
> +
>  bool xe_rtp_match_always(const struct xe_device *xe,
>  			 const struct xe_gt *gt,
>  			 const struct xe_hw_engine *hwe)

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c94fe7753f9a9..18f953ffbc1cf 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c

[ ... ]

> @@ -823,6 +825,13 @@ VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_=
table device_oob_was =3D {
>  };
>  EXPORT_SYMBOL_IF_KUNIT(device_oob_was);
> =20
> +static const struct xe_rtp_table_sr mert_was =3D XE_RTP_TABLE_SR(
> +	{ XE_RTP_NAME("14028586678"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3511)),
> +	  XE_RTP_ACTIONS(WR(DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS, 0xcc))
> +	},
> +);

[Severity: High]
Does using GRAPHICS_VERSION(3511) in mert_was trigger a drm_WARN_ON and
prevent workaround 14028586678 from ever being applied?

When xe_wa_apply_mert_workarounds() runs on a non-VF device with MERT
during xe_device_probe(), xe_pm_resume(), or xe_pm_runtime_resume(), it
calls xe_rtp_apply_device_mmio_writes(xe, &mert_was), which evaluates the
table rules with gt set to NULL:

drivers/gpu/drm/xe/xe_rtp.c:xe_rtp_apply_device_mmio_writes() {
	...
		if (!rule_matches(xe, NULL, NULL, entry->rules, entry->n_rules))
			continue;
	...
}

However, GRAPHICS_VERSION() expands to XE_RTP_MATCH_GRAPHICS_VERSION, which
requires a non-NULL gt in rule_match_item():

drivers/gpu/drm/xe/xe_rtp.c:rule_match_item() {
	...
	case XE_RTP_MATCH_GRAPHICS_VERSION:
		if (drm_WARN_ON(&xe->drm, !gt))
			return false;

		return xe->info.graphics_verx100 =3D=3D r->ver_start &&
			(!has_samedia(xe) || !xe_gt_is_media_type(gt));
	...
}

Because gt is NULL, wouldn't rule_match_item() hit drm_WARN_ON(&xe->drm, !g=
t)
and return false, skipping the write to DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS?

[ ... ]

> +int xe_wa_apply_mert_workarounds(struct xe_device *xe)
> +{
> +	if (!xe_device_has_mert(xe) || IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	return xe_rtp_apply_device_mmio_writes(xe, &mert_was);
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020001513.1528=
267-1-daniel.charles@intel.com?part=3D1
