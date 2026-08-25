Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC103C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F8410E16D;
	Tue, 25 Aug 2026 17:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jSOYkDZP";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6950310E205
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:54:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C64A60053;
 Tue, 25 Aug 2026 17:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237511F000E9;
 Tue, 25 Aug 2026 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680458;
 bh=BLVraUBneDK15Z7yVO5t8qOn/yGx6/GjC/qxDfWGB1o=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jSOYkDZPUrkooOv0mFxZRBIIx7g5Da8vWXCraN9IrKWRUGXS/0B1rawhjpndFnO7+
 KRC7Jou9FyFmjMmbmbPMyDEz0BSlf20daivWklTnGCjFjsGLtSQqOmy5NJAqZzmKsS
 1axbdCBxJrek0fVzXM76TL+WJTxnfbw3gZ5LI50MWapJqpBbkBIPCXPgHR7D6cVGYS
 rLy4S/A10/B97d813YaBZFgjm5b3R4OnNuNqj0TLfT86ELWg97Z/2wp4qCoBHSCxqY
 KiyeX+lN1WiIksHhCQ252s4zW1p3T7IDWnXX1+ghNyqENDs2eIPDotYK3cjYrvVDn5
 CNlvYZiwUTenQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] drm/xe/cper: Prepare Intel CPER error info
 from info queue
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-18-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-18-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:54:17 +0000
Message-Id: <20260825175418.237511F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Integer overflow in the info queue chunk bounds check allows a=
 heap buffer overflow.
- [High] Missing bounds check on `chunk_size` against maximum chunk array l=
ength leads to a kernel stack out-of-bounds read and information leak.
- [High] Unbounded processing of info queue chunks can cause an infinite lo=
op and Denial of Service.
- [Medium] Firmware-provided `total_size` is trusted over actual fetched by=
tes, leading to uninitialized memory being parsed as valid error logs.
- [Medium] Capping `num_logs` to `XE_RAS_NUM_COUNTERS` incorrectly truncate=
s log streams and desynchronizes aggregate parsing.
- [Medium] The aggregate error counter parsing loop creates a sparse array =
when `num_logs =3D=3D 0`, leading to the emission of corrupted empty CPER r=
ecords.
--

commit 426ce853adfa4b210c0c07504ac804ae25dd5a2b
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Prepare Intel CPER error info from info queue

This commit adds a function to assemble raw info queue data embedded in a
GET_COUNTER response and subsequent chunks into an Intel CPER error info
structure. The data is retrieved in chunks from the firmware and parsed
into detail or aggregate error records.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index e913235e9cceb..27c78800b5d27 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> +static struct xe_cper_einfo_entry *
> +prepare_cper_error_info(struct xe_device *xe,
> +			const struct xe_ras_get_counter_response *counter_resp,
> +			const struct xe_ras_error_class *error_class,
> +			u32 *count_out)
> +{
[ ... ]
> +	raw_buf =3D kzalloc(XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE, GFP_KERNEL);
> +	if (!raw_buf)
> +		return NULL;
> +
> +	/* Copy first chunk already embedded in the counter response */
> +	if (first_qhdr->chunk_size &&
> +	    first_qhdr->chunk_offset + first_qhdr->chunk_size <=3D
> +	    XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {

[Severity: Critical]
Is `chunk_offset + chunk_size` vulnerable to a 32-bit integer overflow here?
If the firmware provides large values, such as `chunk_offset =3D 0xFFFFFF00`
and `chunk_size =3D 0x200`, the sum would wrap around to 0x100, which is le=
ss
than `XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE` (5120). This would bypass the check
and allow the subsequent `memcpy` to write out-of-bounds on the heap.

> +		memcpy(raw_buf + first_qhdr->chunk_offset,
> +		       counter_resp->info_queue.queue_data,
> +		       first_qhdr->chunk_size);

[Severity: High]
Is `first_qhdr->chunk_size` validated against the actual capacity of the
source `queue_data` buffer? The check above only ensures it fits within
`XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE` (5120), but `queue_data` has a maximum
size of `XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE`. Since `counter_resp` is allocat=
ed
on the caller's stack, could a malicious or broken firmware return a
`chunk_size` greater than the array size and cause this `memcpy` to read pa=
st
the buffer, leaking adjacent kernel stack memory?

> +		iq_offset =3D first_qhdr->chunk_size;
> +	}
> +
> +	/* Fetch any remaining chunks */
> +	if (first_qhdr->flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) {
> +		iq_req.source_command			=3D XE_SYSCTRL_CMD_GET_COUNTER;
> +		iq_req.source_context			=3D counter_resp->counter;
> +		iq_req.queue_request.requested_size	=3D XE_RAS_INFO_QUEUE_MAX_CHUNK_SI=
ZE;
> +		iq_req.queue_request.session_id		=3D counter_resp->counter;
> +
> +		do {
> +			struct xe_ras_info_queue_header *qhdr;
> +			u32 end;
> +
> +			iq_req.queue_request.requested_offset =3D iq_offset;
> +
> +			if (get_info_queue_data(xe, &iq_req, &iq_response))
> +				break;
> +
> +			qhdr =3D &iq_response.queue_response.queue_header;
> +			end  =3D qhdr->chunk_offset + qhdr->chunk_size;
> +
> +			if (end > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {

[Severity: Critical]
Does the `qhdr->chunk_offset + qhdr->chunk_size` calculation here have the
same 32-bit integer overflow risk as the first chunk check, potentially
allowing out-of-bounds writes into `raw_buf`?

> +				xe_warn(xe, "[RAS]: CPER: info queue chunk out of bounds (offset=3D%=
u size=3D%u)\n",
> +					qhdr->chunk_offset, qhdr->chunk_size);
> +				break;
> +			}
> +
> +			memcpy(raw_buf + qhdr->chunk_offset,
> +			       iq_response.queue_response.queue_data,
> +			       qhdr->chunk_size);

[Severity: High]
Similar to the first chunk copy, is there a missing bounds check here to
ensure `qhdr->chunk_size` does not exceed the size of the stack-allocated
`iq_response.queue_response.queue_data` array, which could lead to another
stack out-of-bounds read?

> +
> +			if (!qhdr->chunk_size)
> +				break;
> +
> +			iq_offset +=3D qhdr->chunk_size;
> +		} while (iq_response.queue_response.queue_header.flags &
> +			 XE_RAS_INFO_QUEUE_FLAG_MORE_DATA);

[Severity: High]
Does this `do-while` loop have a bounded maximum number of iterations or a
timeout? If a broken or malicious firmware repeatedly returns a valid small
chunk with the `XE_RAS_INFO_QUEUE_FLAG_MORE_DATA` flag set, could this
loop run indefinitely and cause a kernel soft lockup?

> +	}
> +
> +	raw_total =3D first_qhdr->total_size
> +		  ? min(first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE)
> +		  : iq_offset;

[Severity: Medium]
If `get_info_queue_data()` fails or the fetch loop terminates early, `raw_b=
uf`
is only partially populated. By unconditionally using `first_qhdr->total_si=
ze`
here (when non-zero) instead of `iq_offset`, won't the code later parse
trailing uninitialized (zero-filled) sections of `raw_buf` as valid dynamic
headers and error logs?

[ ... ]
> +	} else {
> +		/* Aggregate case: one einfo per dynamic-counter header */
> +		const struct xe_ras_info_queue_dynamic_counter_hdr *hdrs =3D
> +			(const struct xe_ras_info_queue_dynamic_counter_hdr *)raw_buf;
> +		const struct xe_ras_error_log *all_logs =3D
> +			(const struct xe_ras_error_log *)(raw_buf + headers_size);
> +		u32 avail_logs =3D (raw_total - headers_size) / sizeof(struct xe_ras_e=
rror_log);
> +		u32 log_offset =3D 0;
> +
> +		einfo_arr =3D kzalloc_objs(*einfo_arr, num_headers, GFP_KERNEL);
> +		if (!einfo_arr) {
> +			kfree(raw_buf);
> +			return NULL;
> +		}
> +
> +		for (i =3D 0; i < num_headers; i++) {
> +			u32 num_logs =3D min_t(u32, hdrs[i].counter, XE_RAS_NUM_COUNTERS);

[Severity: Medium]
Does capping `num_logs` to `XE_RAS_NUM_COUNTERS` (16) cause desynchronizati=
on
when parsing the raw log stream? If the hardware actually embedded more than
16 logs for a specific header, limiting `num_logs` to 16 means `log_offset`
will only advance by 16. Won't the remaining logs then be incorrectly parsed
as belonging to the next aggregate header in the stream?

> +			struct xe_cper_sec_intel_error_info *einfo;
> +			struct xe_intel_priv_event_entry *entry;
> +			u32 einfo_size;
> +			u32 j;
> +
> +			if (log_offset + num_logs > avail_logs) {
> +				xe_warn(xe, "[RAS]: CPER: header[%u] claims %u logs but only %u rema=
in\n",
> +					i, num_logs, avail_logs - log_offset);
> +				break;
> +			}
> +
> +			if (!num_logs) {
> +				log_offset +=3D num_logs;
> +				continue;
> +			}

[Severity: Medium]
If `num_logs` is 0, this branch continues without initializing the header d=
ata
for `einfo_arr[i]`. Does this leave an uninitialized gap in the `einfo_arr`
array that gets exposed to the caller, leading to the emission of malformed
empty CPER records?

> +
> +			einfo_size =3D sizeof(*einfo) + num_logs * entry_size;
> +			einfo =3D kzalloc(einfo_size, GFP_KERNEL);
[ ... ]
> +			einfo_arr[i].hdr        =3D hdrs[i];
> +			einfo_arr[i].einfo      =3D einfo;
> +			einfo_arr[i].einfo_size =3D einfo_size;
> +			log_offset +=3D num_logs;
> +		}
> +
> +		*count_out =3D i;

[Severity: Medium]
If the loop encounters headers where `num_logs =3D=3D 0`, `*count_out` is s=
till
set to the total number of headers processed (including the skipped ones).
Could this cause the caller to consume the sparse, zero-filled array entries
that were skipped earlier?

> +	}
> +
> +	kfree(raw_buf);
> +	return einfo_arr;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D5
