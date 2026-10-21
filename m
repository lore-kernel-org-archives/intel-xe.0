Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BCE606A31B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wph/r5T3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B1410E2BA;
	Wed, 21 Oct 2026 16:43:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA17F10E2BA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 16:42:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C2B1C60052;
 Wed, 21 Oct 2026 16:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F211F000C2;
 Wed, 21 Oct 2026 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792600974;
 bh=MBVjZ5r2dPvqy3n6Z0PgP8LrLTYpsDXwdTbXolnJBBQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Wph/r5T3q2D/pl8wv9cxKA5h5JLzQECorEuEk+SoIwQF0J0kP3xUiz2xY+a9ysIHc
 8k0OFqyYxCC6Py+izSsXZSa31/qmhnbxBkAPF5OMqMqy5A4Oc0pYFtNk2438zVx3VX
 j7YJgEOSj13dtBos4zj9K3dl4MF/zDEsWyjZBjzmmcfsS7Eh/8oKPlQpAm/TR872yh
 vyYHkU9KwiEIGD3HevbgYdV3Mq7Y40cru1jysYTyH4+gfUZGCPVZ+dA8wkDnMRmHRw
 Jxxzup8rU6Q+pdVhAHvxdubhdU8r/Eoj9pzrm6/kQuDfA1fV8HQ7tqsi7HyuYbiwHY
 AQnbir0hWLWhw==
Message-ID: <sashiko-outbox-180472@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] Add CPER logging support for CRI-Do not review
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261021162508.265700-8-mallesh.koujalagi@intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
 <20261021162508.265700-8-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 16:42:54 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/xe/ras: unchecked firmware operation_status in get_info_queu=
e_data()
- [Medium] drm/xe/ras: missing return on invalid first chunk in xe_ras_drai=
n_info_queue_raw()
--

commit 28084d0de339fad58072c0f9a2f90f9570a279f9
Author: Badal Nilawar <badal.nilawar@intel.com>

Add CPER logging support for CRI-Do not review

This commit adds UEFI CPER error record generation and tracepoint logging
for Intel Xe RAS hardware errors and counter queries, including draining
extended error info queues from system controller firmware and exposing a
cper_on_query sysfs toggle.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 9c15ce8f0b6a8..afd41b7e9e86c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -1016,6 +1086,123 @@ int xe_ras_set_threshold(struct xe_device *xe, u8=
 severity, u8 component, u32 th
>  	return 0;
>  }
> =20
> +static int get_info_queue_data(struct xe_device *xe,
> +			       struct xe_ras_get_info_queue_request *req,
> +			       struct xe_ras_get_info_queue_response *out)
> +{
> +	struct xe_ras_get_info_queue_response response =3D {0};
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	const struct xe_ras_info_queue_header *hdr;
> +	size_t rlen;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_C=
MD_GET_INFO_QUEUE,
> +				  req, sizeof(*req), &response, sizeof(response));
> +
> +	ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get info queue data %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen !=3D sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get info queue data response length %z=
u (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	hdr =3D &response.queue_response.header;
> +	xe_dbg(xe, "[RAS]: info queue data: status=3D%u chunk_size=3D%u flags=
=3D0x%x\n",
> +	       response.operation_status, hdr->chunk_size, hdr->flags);
> +
> +	*out =3D response;
> +	return 0;
> +}

[Severity: Medium]
In drivers/gpu/drm/xe/xe_ras.c, get_info_queue_data() logs
response.operation_status (defined in struct xe_ras_get_info_queue_response
in drivers/gpu/drm/xe/xe_ras_types.h) via xe_dbg(), but never validates it
with ras_status_to_errno() before copying response to *out and returning 0.

Other command handlers in drivers/gpu/drm/xe/xe_ras.c that receive a status
field in their response structure (send_page_offline_cmd(),
xe_ras_clear_counter(), xe_ras_set_threshold(), and gpu_health_store())
convert the status via ras_status_to_errno() and return a negative error
code when it is non-zero.

When draining multi-chunk info queues via:

  xe_cper_emit_counter()
    -> xe_prepare_cper_error_info()
      -> xe_ras_drain_info_queue_raw()
        -> get_info_queue_data()

if firmware returns a non-zero error code in response.operation_status while
the mailbox transport succeeds, should get_info_queue_data() check
response.operation_status with ras_status_to_errno() so callers do not
parse a failed or unpopulated info-queue response chunk?

> +
> +static bool chunk_is_valid(const struct xe_ras_info_queue_header *hdr,
> +			   u32 expected_offset, u32 dest_size)
> +{
> +	u32 end;
> +
> +	return hdr->chunk_offset =3D=3D expected_offset &&
> +	       hdr->chunk_size && hdr->chunk_size <=3D XE_RAS_INFO_QUEUE_MAX_CH=
UNK_SIZE &&
> +	       !check_add_overflow(hdr->chunk_offset, hdr->chunk_size, &end) &&
> +	       end <=3D XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE && end <=3D dest_size;
> +}
> +
> +/**
> + * xe_ras_drain_info_queue_raw() - Drain the full RAS info queue into a =
flat buffer
> + * @xe: xe device
> + * @counter_resp: counter response carrying the first embedded chunk and=
 the
> + *                counter identifier used as the source context for subs=
equent
> + *                GET_INFO_QUEUE fetches
> + * @dest_buf: destination buffer supplied by the caller
> + * @dest_size: size of @dest_buf in bytes; also caps the total amount of=
 data
> + *             assembled from the info queue
> + *
> + * Copies the first chunk already embedded in @counter_resp, then loops
> + * issuing GET_INFO_QUEUE to fetch any remaining chunks until the queue
> + * signals no more data or a transport/bounds error is encountered.  On
> + * transport or bounds errors the function stops and returns whatever has
> + * been assembled so far.
> + *
> + * Returns: number of valid bytes written into @dest_buf.  Zero if @dest=
_buf is
> + *          NULL or @dest_size is 0.
> + */
> +u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
> +				const struct xe_ras_get_counter_response *counter_resp,
> +				u8 *dest_buf, u32 dest_size)
> +{
> +	const struct xe_ras_info_queue_header *first_hdr =3D &counter_resp->fir=
st.header;
> +	struct xe_ras_get_info_queue_request req =3D {0};
> +	struct xe_ras_get_info_queue_response resp;
> +	u32 flags =3D first_hdr->flags;
> +	u32 offset =3D 0;
> +
> +	if (!dest_buf || !dest_size)
> +		return 0;
> +
> +	if (first_hdr->total_size > dest_size)
> +		xe_warn(xe, "[RAS]: info queue size %u exceeds %u, truncating\n",
> +			first_hdr->total_size, dest_size);
> +
> +	/* Copy first chunk already embedded in the counter response */
> +	if (chunk_is_valid(first_hdr, offset, dest_size)) {
> +		memcpy(dest_buf, counter_resp->first.data, first_hdr->chunk_size);
> +		offset =3D first_hdr->chunk_size;
> +	}

[Severity: Medium]
In drivers/gpu/drm/xe/xe_ras.c, when xe_ras_drain_info_queue_raw() is called
from xe_cper_emit_counter() -> xe_prepare_cper_error_info() with
counter_resp->has_info_queue set, what happens if the first embedded chunk
in counter_resp->first fails chunk_is_valid(first_hdr, offset, dest_size)
(for example, when first_hdr->chunk_offset is non-zero, first_hdr->chunk_si=
ze
is 0, or first_hdr->chunk_size exceeds dest_size)?

Here xe_ras_drain_info_queue_raw() skips copying the first chunk without
logging a warning or returning 0, leaving offset at 0 while keeping flags
initialized from the invalid first_hdr->flags. If the more-data flag bit is
set in flags, execution falls through into the while loop below and issues a
follow-up info queue fetch starting at offset 0.

Should a bounds or header validation failure on the first chunk log a
warning and return 0 immediately, matching the !chunk_is_valid() handling
inside the while loop below?

> +
> +	req.source_command =3D XE_SYSCTRL_CMD_GET_COUNTER;
> +	req.source_context =3D counter_resp->counter;
> +	req.queue_request.session_id =3D counter_resp->counter;
> +
> +	/* Fetch any remaining chunks */
> +	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size=
) {
> +		const struct xe_ras_info_queue_header *hdr =3D &resp.queue_response.he=
ader;
> +
> +		req.queue_request.offset =3D offset;
> +		req.queue_request.size =3D min(XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_=
size - offset);
> +
> +		if (get_info_queue_data(xe, &req, &resp)) {
> +			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=3D%u fai=
led\n",
> +			       offset);
> +			return offset;
> +		}
> +
> +		if (!chunk_is_valid(hdr, offset, dest_size)) {
> +			xe_warn(xe, "[RAS]: invalid info queue chunk (offset=3D%u size=3D%u, =
expected offset=3D%u)\n",
> +				hdr->chunk_offset, hdr->chunk_size, offset);
> +			return offset;
> +		}
> +
> +		memcpy(dest_buf + offset, resp.queue_response.data, hdr->chunk_size);
> +		offset +=3D hdr->chunk_size;
> +		flags =3D hdr->flags;
> +	}
> +
> +	return min(offset, first_hdr->total_size);
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021162508.2657=
00-7-mallesh.koujalagi@intel.com?part=3D1
