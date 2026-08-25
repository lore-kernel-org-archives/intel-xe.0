Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D8C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9FA10E16D;
	Tue, 25 Aug 2026 17:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="brfLMaq3";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00C510E16D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:55:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 832FD407AB;
 Tue, 25 Aug 2026 17:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393DA1F000E9;
 Tue, 25 Aug 2026 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680520;
 bh=/wHYJKeADA26Sqjgrn3HoHpae3TzaRGli7KJFr6AwDs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=brfLMaq3VbfvqSjrJkMUBybx4H6JLTkQiL2vHk7KSBpi6rvxj1PPU/hhr4r3L4dEx
 ghqoxd3DjbVZl9SRDKs/DOMUS+CtpDX12WDQeZUMufjY2OF4LbyOrx3rEuF9yyXX93
 skJ6fqkE4P7QdXUuklqPd+6mFeU+g7t17nsXJw8jtEi6KuYoSnMv+a5Td6uKsmbb1T
 vsvH9lH26p/atcWxyPeVCU0hiQZiWw6StnbinpZY4GUCvbTWhhPy36oUz6yrXWrDIl
 6JrBprvCTIC0iT+JUcM/IAjHnXRu02TY9r8z7U+zdKcdCLZtot/pMZS5MS2Colnff3
 e3EX/QZehPbfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] drm/xe/cper: Log CPER records for aggregate
 counter retrival
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-19-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-19-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:55:19 +0000
Message-Id: <20260825175520.393DA1F000E9@smtp.kernel.org>
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

New issues:
- [Medium] Unconditional CPER record emission on counter retrieval causes l=
og spam and zero-error records.
- [Medium] Spurious CPER records with empty metadata are emitted for info q=
ueue headers with zero logs.

Pre-existing issues:
- [Critical] An integer overflow in the bounds check `chunk_offset + chunk_=
size` allows firmware to perform an out-of-bounds write relative to the `ra=
w_buf` heap allocation.
- [High] Missing bounds check on `chunk_size` against `XE_RAS_INFO_QUEUE_MA=
X_CHUNK_SIZE` allows a stack buffer over-read, leaking sensitive kernel sta=
ck data.
- [High] The do-while loop fetching info queue chunks can be forced into an=
 infinite loop by malicious firmware, causing a kernel lockup.
--

commit 07283a153280cbc84316c197325268cbc06ecfe6
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Log CPER records for aggregate counter retrival
   =20
Log CPER records for aggregate counter retrieval from userspace.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 27c78800b5d27..ff9d917b8e29c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -749,6 +777,66 @@ prepare_cper_error_info(struct xe_device *xe,
>  	return einfo_arr;
>  }
> =20
> +static void emit_hw_error_cper(struct xe_device *xe,
> +			       struct xe_ras_error_class *error_class,
> +			       struct xe_ras_get_counter_response *resp,
> +			       u32 sig_id, u8 severity)
> +{
[ ... ]
> +	if (einfo_count > 0) {
> +		for (i =3D 0; i < einfo_count; i++) {
> +			struct xe_cper_sec_intel_err_hdr entry_ihdr =3D {};
> +
> +			xe_cper_init_intel_err_hdr(xe,
> +						   (const u8 *)&einfo_arr[i].hdr.error_class,

[Severity: Medium]
When prepare_cper_error_info() processes an info queue header with 0 logs, =
it
skips initializing einfo_arr[i] but still includes it in the *count_out tot=
al.
Does this loop unconditionally access and emit CPER records for potentially
uninitialized (zeroed) elements of the einfo_arr array?

[ ... ]
> +	} else {
> +		xe_cper_init_intel_err_hdr(xe,
> +					   (const u8 *)error_class,
> +					   counter_response->timestamp,
> +					   sig_id,
> +					   counter_response->value,
> +					   &ihdr);
> +		xe_cper_record_emit(xe, severity, &INTEL_CPER_NOTIFY_GPU_ERROR,
> +				    &ihdr, NULL, 0);
> +	}

[Severity: Medium]
If counter_response->value is 0 and there is no info queue, will this fallb=
ack
path explicitly emit a CPER record reporting 0 errors?

[ ... ]
> @@ -886,6 +974,10 @@ int xe_ras_get_counter(struct xe_device *xe, u8 seve=
rity, u8 component, u32 *val
>  		return ret;
> =20
>  	*value =3D response.value;
> +
> +	emit_hw_error_cper(xe, &counter, &response,
> +			   ras_comp_to_hw_sigid(counter.common.component),
> +			   ras_sev_to_cper_sev(counter.common.severity));
>  	return 0;
>  }

[Severity: Medium]
Does this unconditional call trigger a CPER emission on every userspace rea=
d,
regardless of the counter's value or whether it has changed? This might lead
to log spam and incorrect zero-error telemetry when the counter is 0.

While reviewing this patch, I also noticed some pre-existing issues in the
nearby prepare_cper_error_info() function:

> 	if (first_qhdr->chunk_size &&
> 	    first_qhdr->chunk_offset + first_qhdr->chunk_size <=3D
> 	    XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {

[Severity: Critical]
This is a pre-existing issue, but is this boundary validation vulnerable to=
 an
integer overflow? If the firmware provides a large chunk_offset (e.g.
0xFFFFFFF0) and a small chunk_size (e.g. 0x20), the sum could wrap around a=
nd
bypass the check, potentially allowing an out-of-bounds write relative to t=
he
raw_buf heap allocation.

> 		memcpy(raw_buf + first_qhdr->chunk_offset,
> 		       counter_resp->info_queue.queue_data,
> 		       first_qhdr->chunk_size);

[Severity: High]
This is a pre-existing issue, but does this memcpy lack a bounds check on
chunk_size against the stack-allocated queue_data array bounds
(XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE)? If firmware provides a large chunk_size
that passes the total boundary check, could this read past the end of the a=
rray
and leak sensitive kernel stack memory into the heap buffer?

[ ... ]
> 		do {
> 			struct xe_ras_info_queue_header *qhdr;
> 			u32 end;
[ ... ]
> 			qhdr =3D &iq_response.queue_response.queue_header;
> 			end  =3D qhdr->chunk_offset + qhdr->chunk_size;
>=20
> 			if (end > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {

[Severity: Critical]
This is a pre-existing issue, but similar to the first chunk, is this
subsequent boundary validation also vulnerable to an integer overflow if
chunk_offset and chunk_size wrap around?

> 			memcpy(raw_buf + qhdr->chunk_offset,
> 			       iq_response.queue_response.queue_data,
> 			       qhdr->chunk_size);

[Severity: High]
This is a pre-existing issue, but does this location also lack a bounds che=
ck
on chunk_size against the size of the iq_response stack variable, potential=
ly
allowing a stack buffer over-read?

[ ... ]
> 			if (!qhdr->chunk_size)
> 				break;
>=20
> 			iq_offset +=3D qhdr->chunk_size;
> 		} while (iq_response.queue_response.queue_header.flags &
> 			 XE_RAS_INFO_QUEUE_FLAG_MORE_DATA);

[Severity: High]
This is a pre-existing issue, but can this do-while loop be forced into an
infinite loop by malicious or unresponsive firmware? If the firmware repeat=
edly
returns a valid chunk_offset and chunk_size with the MORE_DATA flag set such
that the calculated end boundary never exceeds the limit, could this cause a
kernel soft lockup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D6
