Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE0EC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F61A10F403;
	Thu, 13 Aug 2026 16:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UUZMWDCe";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3701A10F403;
 Thu, 13 Aug 2026 16:29:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2DBF1600DA;
 Thu, 13 Aug 2026 16:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5701F00A3A;
 Thu, 13 Aug 2026 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786638551;
 bh=wODfBsb/SsT1HDp0PXpPa8sk9ZeuhJJeiN1TF7Wabc4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UUZMWDCejs1bfqrSJ0S24QdczySak8Ga0XE23Ho4sjW+sUziIpnqyv8yqkFonGc4C
 FOqlDitIcdSsd5sWTP02cmoWx3MzNyve5HaE/J+G0a5qtmvux+mbeZrVPDBZkLuNfC
 sVPXdgAPDSsPD+8DSVTEi0dLzit5Cn6QncwY21kjhwxdytg1O8KPZbIbPadcrbtLaU
 Md+n/wWROasNjKdOJPRi/TTAyLAn/36gguLzONQ1S5GBiRhkgiGAuL7U03n22Y5DfR
 EMEZL/89Rbf0ZyM4jp2jvTnhWIVzQP//nOA2stHym1knAK2wdVTilTS0fIy+PaYT7O
 C6gOc4wstMtyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/8] drm/i915: override Snps's VS/PE when requested
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260813160918.918857-7-michal.grzelak@intel.com>
References: <20260813160918.918857-1-michal.grzelak@intel.com>
 <20260813160918.918857-7-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:29:11 +0000
Message-Id: <20260813162911.AF5701F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Out-of-bounds Read in VBT VSPEO parsing
- [High] Data Race when writing to shared devdata->entries array
- [High] Missing VBT block causes ZERO_SIZE_PTR allocation and out-of-bound=
s read
- [Medium] Contradiction of Intent: VBT override bypass for non-DP outputs
- [Medium] Memory leak of devdata->entries
--

--- Patch [6]: [PATCH v11 6/8] drm/i915: override Snps's VS/PE when request=
ed ---
commit 70006d8778b43948ec0e561395199a65420366c2
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
Date:   Thu Aug 13 16:09:16 2026 +0000

    drm/i915: override Snps's VS/PE when requested
   =20
    This commit adds accessor functions to read requested VBT tables for
    Synopsys PHYs and transform the data for the port's buffer. It chooses
    the appropriate accessor based on display version and PHY type (C10/C20)
    and handles table indexing based on link rates.

> For C10, 1st table is used for external DP with modes below HBR2
> (exclusive). 1st table is also used as a fallback for non-DPs. 2nd
> table is used for external DP with modes higher than HBR2 (inclusive).

[Severity: Medium]
Is this description accurate?

The commit message states the 1st table is used as a fallback for non-DPs, =
but
looking at validate_vspeo() and intel_bios_get_c10_vspeo(), the code returns
false/NULL if has_dp is false. This completely aborts the VBT override path
for non-DP outputs rather than falling back to the 1st table.

Could the commit message be more precise, or should the code be adjusted to
allow this fallback?

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index a491b85006117..56b4aacff7763 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
[ ... ]
> @@ -3881,6 +3881,99 @@ bool intel_bios_encoder_supports_tbt(const struct =
intel_bios_encoder_data *devda
>  	return devdata->display->vbt.version >=3D 209 && devdata->child.tbt;
>  }
> =20
> +static bool
> +validate_vspeo(const struct intel_bios_encoder_data *devdata, bool has_d=
p)
> +{
> +	struct intel_ddi_buf_trans *vspeo;
> +
> +	vspeo =3D devdata->vspeo;
> +	if (!vspeo)
> +		return false;
> +
> +	if (!has_dp)
> +		return false;
> +
> +	return true;
> +}
> +
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
> +			 bool has_dp, bool is_uhbr)
> +{
> +	struct intel_display *display =3D devdata->display;
> +	union intel_ddi_buf_trans_entry *entries =3D devdata->entries;
> +	struct intel_ddi_buf_trans *vspeo =3D devdata->vspeo;
> +	const u32 *tables =3D display->vbt.vspeo.tables;
> +	int num_columns =3D display->vbt.vspeo.num_columns;
> +	int num_rows =3D display->vbt.vspeo.num_rows;
> +	int idx =3D is_uhbr ? 5 : 4;
> +	size_t offset =3D 0;
> +	int level;
> +
> +	if (!validate_vspeo(devdata, has_dp))
> +		return NULL;
> +
> +	offset +=3D idx * num_rows * num_columns;
> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 vswing =3D tables[offset];
> +		u32 pre_cursor =3D tables[offset + 1];
> +		u32 post_cursor =3D tables[offset + 2];

[Severity: High]
Does this code adequately protect against out-of-bounds memory reads from t=
he
VBT tables array?

There is no validation that the chosen idx (which can be up to 5) is less
than display->vbt.vspeo.num_tables, or that num_columns is at least 3. If a
malformed or older VBT provides fewer tables or columns, could the driver
read past the end of the VBT block here?

> +
> +		entries[level].snps.vswing =3D vswing;
> +		entries[level].snps.pre_cursor =3D pre_cursor;
> +		entries[level].snps.post_cursor =3D post_cursor;

[Severity: High]
Can writing to the shared devdata->entries array inside this getter function
cause a data race?

This getter is called during PHY programming and link training (e.g., from
commit_tail and intel_dp_link_check). If the asynchronous modeset worker and
hotplug link retraining worker run concurrently, wouldn't they race to
overwrite the exact same devdata->entries array without synchronization,
potentially leading to the hardware being programmed with corrupted values?

> +
> +		offset +=3D num_columns;
> +	}
> +
> +	vspeo->entries =3D entries;
> +	vspeo->num_entries =3D num_rows;
> +
> +	return vspeo;
> +}
> +
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
> +			 bool has_dp, int port_clock, bool has_edp)
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
> +		idx =3D port_clock > 540000 ? 3 : 2;
> +	else
> +		idx =3D port_clock > 270000 ? 1 : 0;
> +
> +	offset +=3D idx * num_rows * num_columns;
> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 vswing =3D tables[offset];
> +		u32 pre_cursor =3D tables[offset + 1];
> +		u32 post_cursor =3D tables[offset + 2];

[Severity: High]
Is it possible to read past the end of the VBT block here?

Similar to the C20 function, there appears to be no validation that idx is
less than display->vbt.vspeo.num_tables or that num_columns is at least 3,
which might lead to out-of-bounds reads if the VBT is older or malformed.

> +
> +		entries[level].snps.vswing =3D vswing;
> +		entries[level].snps.pre_cursor =3D pre_cursor;
> +		entries[level].snps.post_cursor =3D post_cursor;

[Severity: High]
Does overwriting the shared devdata->entries array here introduce a race
condition when accessed concurrently?

If concurrent accesses occur, such as a hotplug event while a modeset is
active, they might race to write to this shared state without locking, lead=
ing
to corrupt PHY programming.

> +
> +		offset +=3D num_columns;
> +	}
> +
> +	vspeo->entries =3D entries;
> +	vspeo->num_entries =3D num_rows;
> +
> +	return vspeo;
> +}


[Severity: High]
Could a missing VBT block lead to a ZERO_SIZE_PTR allocation and subsequent
out-of-bounds read?

If a system's VBT version is >=3D 218 and use_vbt_vswing is true, but VBT b=
lock
57 is omitted, parse_vswing_preemph_override() returns early leaving num_ro=
ws
as 0.

This would lead to allocating with size 0:

allocate_vswing_preemph_override() {
    ...
	entries =3D kzalloc_objs(*entries, num_rows);
	if (!entries) {
    ...
}

Because kzalloc_objs returns ZERO_SIZE_PTR for size 0, the !entries check
passes. When intel_ddi_buf_trans_get() returns this table with num_entries =
=3D 0,
the bounds check in intel_ddi_level() behaves incorrectly:

intel_ddi_level() {
    ...
	if (drm_WARN_ON_ONCE(display->drm, level >=3D n_entries))
		level =3D n_entries - 1;
    ...
}

This sets level to -1, and the PHY code then reads from trans->entries[-1],
which is an invalid memory address (ZERO_SIZE_PTR - sizeof(entry)), potenti=
ally
causing a kernel panic.


[Severity: Medium]
Will this sequence leak the devdata->entries memory on driver removal?

In allocate_vswing_preemph_override(), memory is allocated and assigned to
devdata->entries, but devdata->vspeo->entries remains NULL until one of the
accessor functions (like intel_bios_get_c20_vspeo) is called.

If a port is never used and the accessor is never invoked, the teardown path
frees the wrong pointer:

intel_bios_driver_remove() {
    ...
		if (devdata->vspeo)
			kfree(devdata->vspeo->entries);
    ...
}

Because devdata->vspeo->entries is still NULL in the unused case, the
underlying devdata->entries allocation appears to be permanently leaked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813160918.9188=
57-1-michal.grzelak@intel.com?part=3D6
