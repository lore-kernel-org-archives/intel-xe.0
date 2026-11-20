Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74587606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HH1yYxnn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF8710EC81;
	Fri, 20 Nov 2026 04:42:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6E710E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 04:42:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DDD7D46466;
 Fri, 20 Nov 2026 04:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985791F000D2;
 Fri, 20 Nov 2026 04:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795149720;
 bh=3jLYotI/2TRK/sw8TyiUpED6q6x3xgJ9s0sGDQu0H34=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HH1yYxnnWjbFaJ5C/UWHWl2z03E841a2ZIBNWrlr/I4DPb081NxIHrgwrKoMp3dSp
 YrzwuHFodiqxKqd7e+VZG9P3/nvdDawtwNGAeW4cI4dk+z5f5P1BxcwHWFjcj2NN9s
 /iqwVG4VdXLTeXm2B6m6YdB0OuSy/yXBcuqybGnDllfUxIHl/QG/Ga4jJFe+mWdUPM
 CLWw4+gvw5Z3a/T25gzcRI2FJ+Eg1g5IGwOGXKFpGg9uUy0e6rQqOtO7+ED0sfKJ85
 VvAb24F2iqtsn8ARyk5RwPweF+wWpylEVDaGRVWQiJf8GzhDY/jjOY2526KpV2RhFf
 llHEXmL8dGy6Q==
Message-ID: <sashiko-outbox-224467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] drm/xe/xe_ras: Add support to retrieve info
 queue data
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120043303.107183-7-badal.nilawar@intel.com>
References: <20261120043303.107183-5-badal.nilawar@intel.com>
 <20261120043303.107183-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 04:42:00 +0000
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
- [Medium] drm/xe/ras: assertion and 0-byte fetch in
  get_remaining_chunks() when full
--

commit 6c6fff86d117ac6d5e465e2c1c62372c93a7e520
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_ras: Add support to retrieve info queue data

This commit adds helpers and mailbox structures to retrieve RAS info queue
data in chunks and assemble it into a flat buffer.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index e8984c966876a..46542852e0552 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1123,6 +1123,192 @@ int xe_ras_set_threshold(struct xe_device *xe, u8=
 severity, u8 component, u32 th

[ ... ]

> +static u32 get_remaining_chunks(struct xe_device *xe,
> +				const struct xe_ras_get_counter_response *counter_resp,
> +				u8 *dest_buf, u32 dest_size, u32 offset, u32 flags)
> +{
> +	u32 requests_left =3D XE_SYSCTRL_FLOOD_LIMIT * 2;
> +	int ret;
> +
> +	while (flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) {
> +		struct xe_ras_info_queue_data_request *qdata_req;
> +		struct xe_ras_get_info_queue_response response =3D {};
> +		struct xe_ras_get_info_queue_request request =3D {};
> +		struct xe_ras_info_queue_header *hdr;
> +
> +		xe_assert(xe, offset < dest_size);
> +
> +		qdata_req =3D &request.qdata_req;
> +		qdata_req->offset =3D offset;
> +		qdata_req->size =3D min_t(u32, XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_=
size - offset);
> +		qdata_req->session_id =3D counter_resp->counter;
> +
> +		ret =3D get_info_queue(xe, &request, &response);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=3D%u, re=
t =3D %d\n",
> +			       offset, ret);
> +			return offset;
> +		}
> +
> +		hdr =3D &response.qdata_resp.header;
> +
> +		if (!chunk_is_valid(hdr, offset, counter_resp->first.header.total_size,
> +				    dest_size)) {
> +			xe_warn(xe, "[RAS]: invalid info queue chunk (total=3D%u offset=3D%u =
size=3D%u, expected offset=3D%u)\n",
> +				hdr->total_size, hdr->chunk_offset, hdr->chunk_size, offset);
> +			return offset;
> +		}
> +
> +		memcpy(dest_buf + offset, response.qdata_resp.data, hdr->chunk_size);
> +		offset +=3D hdr->chunk_size;
> +		flags =3D hdr->flags;
> +
> +		if (!--requests_left) {
> +			xe_warn(xe, "[RAS]: info queue flooding, aborted at offset=3D%u\n", o=
ffset);
> +			break;
> +		}
> +	}

[Severity: Medium]
Can get_remaining_chunks() trip xe_assert(xe, offset < dest_size) and issue
a 0-byte GET_INFO_QUEUE request when dest_buf fills up while
XE_RAS_INFO_QUEUE_FLAG_MORE_DATA is still set?

When firmware reports total_size > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE (5120),
xe_ras_get_info_queue_size() truncates the buffer size to 5120 bytes.
Filling dest_buf to 5120 bytes takes 26 chunks (the initial chunk plus 25
requests, leaving requests_left at 7), and firmware keeps
XE_RAS_INFO_QUEUE_FLAG_MORE_DATA set on the chunk that reaches offset =3D=3D
dest_size because data remains beyond offset 5120.  Without a check like
offset < dest_size in the loop condition (or breaking when offset =3D=3D
dest_size), the next iteration asserts and sends a request with
qdata_req->size =3D 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120043303.1071=
83-5-badal.nilawar@intel.com?part=3D2
