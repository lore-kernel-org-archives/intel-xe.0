Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76608C79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB8E10E088;
	Sun,  6 Sep 2026 17:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KoA08G9y";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6253210E088
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:17:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E7B8601DE;
 Sun,  6 Sep 2026 17:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094811F00A3A;
 Sun,  6 Sep 2026 17:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715072;
 bh=uZP8s3w+Z4CrEIfBtWB/KmCDtk8APAQrejCix7VmL9g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KoA08G9y6rbH4w1Ub4Gl0Syr8+7GV122kIIiSaPSKyGp2wlmUqLzev9Li0sM749bv
 eHpC09xNhmRlKE7VOWCzRFCcmwhrih8VbLlZpUIJDfwPkR0TFzspSXTbuQKrQwTO0e
 hnO978aUn7wRKr8S9zH8G6oz6LDWx320I+FfIgAo4LdUGF15fkPIs+cz67YUW/yYWw
 6odqm+2IkkbUSrLl18b3zKts/63HuMvtoYmWAL4Dz8okiYS50/qU1O81SIGP0Vn9J4
 9ZTHFro2F9P29BPLYFhJgFROQrEtPVTZTz7Ea+tgNHJSEd2nu+ds42itwiDQkFTnLV
 4sSW4B9iGWFIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/12] drm/xe/xe_ras: Add support to retrieve info
 queue data for CRI
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-19-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-19-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:17:51 +0000
Message-Id: <20260906171752.094811F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Inconsistent handling of queue offsets and blindly trusting the ha=
rdware's total_size leads to sparse buffer writes and returning an inflated=
 valid byte count.
- [High] Missing contiguous progress validation allows a misbehaving or com=
promised firmware to cause an infinite loop in the kernel.
- [Medium] get_info_queue_data ignores the hardware operation_status, retur=
ning success on logical command failures.
--

commit beae2ef0daf0b18e6a50c5076d39abd256ed8593
Author: Badal Nilawar <badal.nilawar@intel.com>
Subject: drm/xe/xe_ras: Add support to retrieve info queue data for CRI

Retrieve the RAS info queue data, in multiple chunks, and assemble
it into flat raw buffer. Follow up patch will use this data to
prepare cper error info.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb9065cdd76f..7e3e627504485 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> +static int get_info_queue_data(struct xe_device *xe,
> +			       const struct xe_ras_get_info_queue_data_request *req,
> +			       struct xe_ras_get_info_queue_data_response *out)
> +{
[ ... ]
> +	if (rlen !=3D sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get info queue data response length %z=
u (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	xe_dbg(xe, "[RAS]: info queue data: status=3D%u chunk_size=3D%u flags=
=3D0x%x\n",
> +	       response.operation_status,
> +	       response.queue_response.queue_header.chunk_size,
> +	       response.queue_response.queue_header.flags);
> +
> +	*out =3D response;
> +	return 0;
> +}

[Severity: Medium]
Does get_info_queue_data() ignore the hardware operation_status? It looks l=
ike
it returns success on logical command failures. If the GET_INFO_QUEUE_DATA
command fails at the firmware level, returning an error code in
response.operation_status, the function only checks the transport status and
returns 0. Can this cause the driver to process an empty or garbage
queue_response payload as valid data?

[ ... ]
> +u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
> +				const struct xe_ras_get_counter_response *counter_resp,
> +				u8 *raw_buf, u32 raw_buf_size)
> +{
[ ... ]
> +	if (!raw_buf || !raw_buf_size)
> +		return 0;
> +
> +	/* Copy first chunk already embedded in the counter response */
> +	if (first_qhdr->chunk_size &&
> +	    first_qhdr->chunk_size <=3D XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE &&
> +	    !check_add_overflow(first_qhdr->chunk_offset, first_qhdr->chunk_siz=
e, &end) &&
> +	    end <=3D XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE && end <=3D raw_buf_size)=
 {
> +		memcpy(raw_buf + first_qhdr->chunk_offset,
> +		       counter_resp->info_queue.queue_data, first_qhdr->chunk_size);
> +		iq_offset =3D first_qhdr->chunk_size;
> +	}

[Severity: High]
Does the initialization of iq_offset incorrectly assume that the first chun=
k's
offset is exactly 0? Also, if the bounds check fails, the copy is skipped b=
ut
the complete variable is left as true. Could this result in miscalculating
iq_offset (e.g., iq_offset =3D chunk_size instead of chunk_offset + chunk_s=
ize)
and returning an inflated valid byte count?

> +
> +	/* Fetch any remaining chunks */
> +	if (first_qhdr->flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) {
[ ... ]
> +			if (check_add_overflow(qhdr->chunk_offset, qhdr->chunk_size, &end) ||
> +			    end > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE || end > raw_buf_size) {
> +				complete =3D false;
> +				xe_warn(xe,
> +					"[RAS]: info queue chunk out of bounds (offset=3D%u size=3D%u)\n",
> +					qhdr->chunk_offset, qhdr->chunk_size);
> +				break;
> +			}

[Severity: High]
The bounds check uses qhdr->chunk_offset but lacks a check like
qhdr->chunk_offset =3D=3D iq_offset to guarantee monotonic forward progress.
Could this missing contiguous progress validation allow a misbehaving or
compromised firmware to cause an infinite loop in the kernel? Firmware could
repeatedly return a valid small chunk (e.g., chunk_offset =3D 0, chunk_size=
 =3D 1)
with the MORE_DATA flag set. The bounds check would pass every time, and
iq_offset would grow indefinitely without terminating the loop.

> +
> +			memcpy(raw_buf + qhdr->chunk_offset,
> +			       iq_response.queue_response.queue_data,
> +			       qhdr->chunk_size);
> +
> +			iq_offset +=3D qhdr->chunk_size;

[Severity: High]
Does this missing contiguous offset validation (e.g.
qhdr->chunk_offset =3D=3D iq_offset) allow uninitialized gaps in the destin=
ation
buffer, and blindly advance the requested offset? This could lead to the ca=
ller
parsing zeroed or uninitialized memory as valid CPER error logs, resulting
in corrupted error reports if firmware returns chunks with gaps.

> +		} while (iq_response.queue_response.queue_header.flags &
> +			 XE_RAS_INFO_QUEUE_FLAG_MORE_DATA);

[Severity: High]
Does the loop rely entirely on the untrusted hardware clearing the MORE_DATA
flag to terminate, without any software fallback limiting total iterations =
or
checking accumulated size?

> +	}
> +
> +	if (!complete)
> +		return iq_offset;
> +
> +	return first_qhdr->total_size
> +	       ? min3(first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE,=
 raw_buf_size)
> +	       : iq_offset;
> +}

[Severity: High]
Is it safe to return an unverified hardware-provided total_size instead of =
the
dynamically accumulated written byte count? If firmware returns
MORE_DATA =3D=3D 0 early or returns chunks with gaps, this exposes uninitia=
lized
memory at the tail of the buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D5
