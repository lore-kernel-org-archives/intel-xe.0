Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D95F606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWIWHTg1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDDF10E564;
	Tue, 17 Nov 2026 07:34:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FFD10E564
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 07:34:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DA80940926;
 Tue, 17 Nov 2026 07:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913081F000C5;
 Tue, 17 Nov 2026 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794900862;
 bh=SqsdNTmB5d652H9J5LkcwFTPvfs6nkG8AyjGo0ULUJw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HWIWHTg19chuzpXpiv7J1ghGVtJ1RJ1Gp7IZxIRfOHbqtY+qFI77n0tcGp77cynaY
 5GqJRbQZpoelzOV7b9JbRxR3Uw0lGK38QL/CSTjhhT5nvT5j4l+lqmMA5jHI7e3+NX
 OKc8vJEajqenyOMC2VwIFSvz4D7yjVxYSrEAJFgNuuiTjGpfYfft8cDGuz3BRfxImj
 dqM4FLFl60+BfFE7fDMOh78Zywd83LXlLhzEG52oSsYH3XrudRuX9r3qfaY5V7HbD8
 qJhSbq4KTTpMA5xPP0vsS+WhYF7s1YvG1l8myY+1Ap6fMlf2uo+TLBZDj3dvbFfV8j
 pxBFP/ECQ9/vg==
Message-ID: <sashiko-outbox-218359@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] drm/xe/cper: Prepare Intel CPER info records
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261117072118.4051706-8-badal.nilawar@intel.com>
References: <20261117072118.4051706-5-badal.nilawar@intel.com>
 <20261117072118.4051706-8-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:34:22 +0000
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
- [Medium] drm/xe/cper: cper_prepare_info() triggers offset < dest_size
  assert on 1-chunk queue
--

commit 18adfa7b4a6578ae8c036862ccea81ff06722754
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Prepare Intel CPER info records

This commit builds CPER error info payloads from RAS info queue logs for
both detailed and aggregate error counters, and emits a CPER record for
each generated entry.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index dda82eb4690cc..7a74fe3aed6ef 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c

[ ... ]

> @@ -200,6 +201,227 @@ static void cper_record_emit(struct xe_device *xe, =
u8 severity,

[ ... ]

> +static u8 *cper_get_info_queue_buffer(struct xe_device *xe,
> +				      const struct xe_ras_get_counter_response *counter_resp,
> +				      u32 buf_size, u32 *raw_total)
> +{
> +	u8 *raw_buf;
> +
> +	raw_buf =3D kzalloc_objs(*raw_buf, buf_size);
> +	if (!raw_buf)
> +		return NULL;
> +
> +	*raw_total =3D xe_ras_drain_info_queue(xe, counter_resp, raw_buf, buf_s=
ize);
> +	if (!*raw_total) {
> +		kfree(raw_buf);
> +		return NULL;
> +	}
> +
> +	return raw_buf;
> +}

[ ... ]

> +static u32
> +cper_prepare_info(struct xe_device *xe,
> +		  const struct xe_ras_get_counter_response *counter_resp,
> +		  struct xe_cper_info_entry **info_arr)
> +{
> +	u32 buf_size, raw_total, num_entries;
> +	u8 *raw_buf;
> +
> +	buf_size =3D xe_ras_get_info_queue_size(xe, counter_resp);
> +	if (!buf_size)
> +		return 0;
> +
> +	raw_buf =3D cper_get_info_queue_buffer(xe, counter_resp, buf_size, &raw=
_total);

[Severity: Medium]
Does calling xe_ras_drain_info_queue() with buf_size set to
xe_ras_get_info_queue_size() trigger an assertion failure in
get_remaining_chunks() whenever the entire info queue fits in the first
chunk?

When total_size <=3D XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, get_first_chunk()
copies the full payload and returns offset =3D=3D chunk_size =3D=3D dest_si=
ze.
xe_ras_drain_info_queue() then unconditionally calls
get_remaining_chunks():

drivers/gpu/drm/xe/xe_ras.c:get_remaining_chunks() {
	u32 requests_left =3D XE_SYSCTRL_FLOOD_LIMIT * 2;
	int ret;

	xe_assert(xe, offset < dest_size);
    ...
}

Because offset =3D=3D dest_size, this hits a drm_WARN splat on every
single-chunk info queue when CONFIG_DRM_XE_DEBUG is enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117072118.4051=
706-5-badal.nilawar@intel.com?part=3D3
