Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D34606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 00:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVRbbNcK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2212A10E76E;
	Tue,  3 Nov 2026 00:32:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E6010E743;
 Tue,  3 Nov 2026 00:31:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 63C4260008;
 Tue,  3 Nov 2026 00:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDF61F000C1;
 Tue,  3 Nov 2026 00:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793665914;
 bh=hiNJcGteOy5KUPx8aD9uAyUVnMhaUsHcHdXRNFpRUoE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=QVRbbNcKHbJndieZVPUHkds/IluEfN4biewTZfZWi6EA+ZvhVaTg06kUJFJE0921g
 /GyhaWDq3uah6Xezhis1act16WtcJaDQfL5zn5J3p9+4jeVSzZSP7aCarlJpVolTJY
 XryZJhv2X5cAwiUiYAnabE2YC6/3AD7umVSD6HRF2PMKJZq4gcTEp5cHd65QvX9U2V
 5spd21mCrJvyB4rciLjvZP+EpxCQ4oUl3Cej6LzyJclq6Ts48lrOHHnIjhNEu2AMj9
 /H2AFc7gi6YJfaQgfTN6NuQJsp486B99zj7Ius0vpPgUyIMHHyLhEFdaKFZR7h4MNx
 qCwmZFx2VKUFA==
Message-ID: <sashiko-outbox-194381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] drm/i915: override LT's default Vswing /
 Pre-emphasis when requested
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103001518.3478578-2-michal.grzelak@linux.intel.com>
References: <20261103001518.3478578-1-michal.grzelak@linux.intel.com>
 <20261103001518.3478578-2-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 00:31:53 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/i915/bios: missing VBT block 57 validation in intel_bios_get_l=
t_vspeo()
- [Medium] drm/i915/bios: 16-entry VSPEO table in intel_bios_get_lt_vspeo()=
 warns on DP1.4
--

commit e0e2844e4f9495daf6ba15f7eba3dbda5ee9076e
Author: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

drm/i915: override LT's default Vswing / Pre-emphasis when requested

This commit adds Vswing / Pre-emphasis Override (VSPEO) support for LT PHYs
on NVL+ platforms by reading the requested override table from VBT block 57
in intel_bios_get_lt_vspeo() and hooking up xe3plpd_get_lt_buf_trans_overri=
de().

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 7b6a6f8c3cf19..3c1fc48ca2758 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -3886,6 +3886,52 @@ validate_vspeo(const struct intel_bios_encoder_dat=
a *devdata, bool has_dp)
>  	return true;
>  }
> =20
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_lt_vspeo(const struct intel_bios_encoder_data *devdata,
> +			bool has_dp, bool is_uhbr, bool has_edp)
> +{
> +	struct intel_display *display =3D devdata->display;
> +	union intel_ddi_buf_trans_entry *entries =3D devdata->entries;
> +	struct intel_ddi_buf_trans *vspeo =3D devdata->vspeo;
> +	const u32 *tables =3D display->vbt.vspeo.tables;
> +	int num_columns =3D display->vbt.vspeo.num_columns;
> +	int num_rows =3D display->vbt.vspeo.num_rows;
> +	size_t offset =3D 0;
> +	int level, idx;
> +
> +	if (!validate_vspeo(devdata, has_dp))
> +		return NULL;
> +
> +	if (has_edp)
> +		idx =3D 0;
> +	else if (is_uhbr)
> +		idx =3D 2;
> +	else
> +		idx =3D 1;
> +
> +	offset +=3D idx * num_rows * num_columns;
> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 main_cursor =3D tables[offset];
> +		u32 pre_cursor =3D tables[offset + 1];
> +		u32 post_cursor =3D tables[offset + 2];
> +		u32 txswing =3D tables[offset + 3];
> +		u32 txswing_level =3D tables[offset + 4];

[Severity: High]
Can this dereference an unpopulated or undersized VBT block 57 table in
intel_bios_get_lt_vspeo()?

If a child device sets child.use_vbt_vswing in VBT but BDB_VSWING_PREEMPH
(block 57) is absent, parse_vswing_preemph_override() returns early leaving
display->vbt.vspeo.tables as NULL and display->vbt.vspeo.num_rows as 0.
However, allocate_vswing_preemph_override() still allocates devdata->vspeo
and calls kzalloc_objs(*entries, 0), setting devdata->entries to
ZERO_SIZE_PTR and devdata->vspeo->num_entries to 0:

drivers/gpu/drm/i915/display/intel_bios.c:allocate_vswing_preemph_override(=
) {
	int num_rows =3D devdata->display->vbt.vspeo.num_rows;
	...
	entries =3D kzalloc_objs(*entries, num_rows);
	if (!entries) {
		kfree(vspeo);
		return;
	}

	devdata->entries =3D entries;
	devdata->vspeo =3D vspeo;
	devdata->vspeo->num_entries =3D num_rows;
}

Because validate_vspeo() only checks devdata->vspeo and has_dp,
intel_bios_get_lt_vspeo() skips the loop when num_rows is 0 and returns vsp=
eo
with entries =3D ZERO_SIZE_PTR and num_entries =3D 0 instead of returning N=
ULL,
causing intel_lt_phy_set_signal_levels() to index off ZERO_SIZE_PTR.

Furthermore, when block 57 is present, bdb_blocks[] only enforces a minimum
size of sizeof(struct bdb_vswing_preemph), and neither
parse_vswing_preemph_override(), validate_vspeo(), nor
intel_bios_get_lt_vspeo() checks that idx < display->vbt.vspeo.num_tables,
num_columns >=3D 5, or that the block payload is large enough before reading
tables[offset] through tables[offset + 4].

Should parse_vswing_preemph_override() or validate_vspeo() verify that
display->vbt.vspeo.tables is present and that num_tables, num_columns, and
the block size cover the requested table entries?

> +
> +		entries[level].lt.main_cursor =3D main_cursor;
> +		entries[level].lt.pre_cursor =3D pre_cursor;
> +		entries[level].lt.post_cursor =3D post_cursor;
> +		entries[level].lt.txswing =3D txswing;
> +		entries[level].lt.txswing_level =3D txswing_level;
> +
> +		offset +=3D num_columns;
> +	}
> +
> +	vspeo->entries =3D entries;
> +
> +	return vspeo;
> +}

[Severity: Medium]
Does returning vspeo without updating vspeo->num_entries trigger a
drm_WARN_ON in intel_ddi_dp_voltage_max() during non-UHBR eDP or DP 1.4 link
training?

On NVL+ (DISPLAY_VER(display) >=3D 14), vswing_preemph_num_rows() returns 1=
6,
and allocate_vswing_preemph_override() initializes
devdata->vspeo->num_entries to 16. When xe3plpd_get_lt_buf_trans_override()
calls intel_bios_get_lt_vspeo() for a non-UHBR eDP (idx =3D 0) or DP 1.4
(idx =3D 1) link, vspeo->num_entries remains 16 (whereas the non-override
tables xe3plpd_lt_trans_edp and xe3plpd_lt_trans_dp14 have 10 entries).

During 8b/10b link training, intel_dp_get_lane_adjust_vswing_preemph() ->
intel_dp_phy_voltage_max() -> intel_ddi_dp_voltage_max() retrieves
n_entries =3D 16 from intel_ddi_buf_trans_get() and compares it against
ARRAY_SIZE(index_to_dp_signal_levels), which is 10:

drivers/gpu/drm/i915/display/intel_ddi.c:intel_ddi_dp_voltage_max() {
	...
	intel_ddi_buf_trans_get(encoder, crtc_state, &n_entries);

	if (drm_WARN_ON(display->drm, n_entries < 1))
		n_entries =3D 1;
	if (drm_WARN_ON(display->drm,
			n_entries > ARRAY_SIZE(index_to_dp_signal_levels)))
		n_entries =3D ARRAY_SIZE(index_to_dp_signal_levels);
}

Should intel_bios_get_lt_vspeo() set vspeo->num_entries to 10 when !is_uhbr
(and 16 when is_uhbr)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103001518.3478=
578-1-michal.grzelak@linux.intel.com?part=3D1
