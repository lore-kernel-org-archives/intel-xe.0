Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F89606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCB49B1/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1AB10EDBD;
	Tue, 17 Nov 2026 07:31:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1893010EB09
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 07:31:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C58B541379;
 Tue, 17 Nov 2026 07:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9221F000C5;
 Tue, 17 Nov 2026 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794900678;
 bh=V4CwT0mSGWgQrZ4mCxadcu9+AXP5eo7GeUySD0z3B2o=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZCB49B1/Nx59GYcIgtEwmZz5gNARXUO945CkXbrE6V9cNoK2IKLhbKbByfgthiY98
 LdseyCJYvKf6zwAeNOBRlVKF2DIUeZNojxg6akPZx+XEA7VRSXgHNHHhBYW+VwvC7I
 ao2h/iUEcPaGddC1BD5rfaYlukHsHjJGJXmFZsHJbJeddr174m6/oo3wxz09gqDrXq
 GkCjHaUmRY2GFufyKWcRCxc0JiQbLrbsqBEYI7Ra2pOtBybFWX0lN8hbdbAlteur6q
 QUEi2L7iQ6OKJFjvxVK97V+JLBxomb/IgY8m7AJc+vshSgwrVacXdd7z/Nop1Nuh+0
 +IJQZkHJESMig==
Message-ID: <sashiko-outbox-218355@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] drm/xe/xe_ras: Add support to retrieve info
 queue data
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261117072118.4051706-7-badal.nilawar@intel.com>
References: <20261117072118.4051706-5-badal.nilawar@intel.com>
 <20261117072118.4051706-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:31:18 +0000
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
- [Medium] drm/xe/ras: false xe_assert() in get_remaining_chunks() on
  single chunk
- [Low] drm/xe/ras: missing @xe kernel-doc in
  xe_ras_get_info_queue_size()
--

commit 99a89cb129918412b7f5d01c7623b004ecfade2f
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_ras: Add support to retrieve info queue data

This commit adds helpers and mailbox structures to retrieve RAS info
queue data in chunks from the system controller and assemble it into a
flat buffer.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index e8984c966876a..0a5bac375d8c3 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1123,6 +1123,190 @@ int xe_ras_set_threshold(struct xe_device *xe, u8=
 severity, u8 component, u32 th

[ ... ]

> +static bool chunk_is_valid(const struct xe_ras_info_queue_header *hdr,
> +			   u32 expected_offset, u32 total_size, u32 dest_size)
> +{
> +	u32 end;
> +
> +	return hdr->total_size =3D=3D total_size && total_size &&
> +	       hdr->chunk_offset =3D=3D expected_offset &&
> +	       hdr->chunk_size && hdr->chunk_size <=3D XE_RAS_INFO_QUEUE_MAX_CH=
UNK_SIZE &&
> +	       !check_add_overflow(hdr->chunk_offset, hdr->chunk_size, &end) &&
> +	       end <=3D min_t(u32, total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE=
) &&
> +	       end <=3D dest_size;
> +}
> +
> +static u32 get_first_chunk(struct xe_device *xe,
> +			   const struct xe_ras_get_counter_response *counter_resp,
> +			   u8 *dest_buf, u32 dest_size, u32 *flags)
> +{
> +	const struct xe_ras_info_queue_header *hdr =3D &counter_resp->first.hea=
der;
> +
> +	if (!chunk_is_valid(hdr, 0, hdr->total_size, dest_size)) {
> +		xe_warn(xe, "[RAS]: invalid first info queue chunk (total=3D%u offset=
=3D%u size=3D%u, expected offset=3D0)\n",
> +			hdr->total_size, hdr->chunk_offset, hdr->chunk_size);
> +		return 0;
> +	}
> +
> +	memcpy(dest_buf, counter_resp->first.data, hdr->chunk_size);
> +	*flags =3D hdr->flags;
> +
> +	return hdr->chunk_size;
> +}
> +
> +static u32 get_remaining_chunks(struct xe_device *xe,
> +				const struct xe_ras_get_counter_response *counter_resp,
> +				u8 *dest_buf, u32 dest_size, u32 offset, u32 flags)
> +{
> +	u32 requests_left =3D XE_SYSCTRL_FLOOD_LIMIT * 2;
> +	int ret;
> +
> +	xe_assert(xe, offset < dest_size);
> +
> +	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size=
) {

[Severity: Medium]
Won't xe_assert(xe, offset < dest_size) fire on every single-chunk info
queue when CONFIG_DRM_XE_DEBUG is enabled?

When the entire info queue fits in the first chunk and the caller sizes
dest_buf from xe_ras_get_info_queue_size(), get_first_chunk() copies
hdr->chunk_size =3D=3D dest_size bytes and returns offset =3D=3D dest_size,=
 after
which xe_ras_drain_info_queue() unconditionally calls
get_remaining_chunks() even when XE_RAS_INFO_QUEUE_FLAG_MORE_DATA is clear.

[ ... ]

> +/**
> + * xe_ras_get_info_queue_size() - Get the total size of the RAS info que=
ue
> + * @response: Counter response carrying the first info queue chunk
> + *
> + * Return: Info queue size in bytes, capped at the supported maximum, or=
 zero
> + * if no usable info queue is present.
> + */
> +u32 xe_ras_get_info_queue_size(struct xe_device *xe,
> +			       const struct xe_ras_get_counter_response *response)

[Severity: Low]
The kernel-doc comment for xe_ras_get_info_queue_size() is missing a
description for the @xe parameter, which triggers a W=3D1 kernel-doc warnin=
g.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117072118.4051=
706-5-badal.nilawar@intel.com?part=3D2
