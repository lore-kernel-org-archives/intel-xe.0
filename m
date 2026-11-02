Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9F9606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPTTpYjw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86C210E5B9;
	Mon,  2 Nov 2026 10:11:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0490210E5B9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 10:11:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 15F2360618;
 Mon,  2 Nov 2026 10:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F481F000C1;
 Mon,  2 Nov 2026 10:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793614308;
 bh=aPl/8qX3uSLfMB/IV6hlXbM1cVRaD0fv3rCbFTY16nY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=QPTTpYjwJeRwgOEmt+RPCWjesXUaV98V7TVxsHl8DZWLy9F1ThqsP8QLXWzPLJA6q
 MNpGK3DIOb89r8UtydRv0mxJVLdf6fYP/f0vs1fV/sH6rQFpqOkRa2P/CU21JrsV8p
 1KtpSpwblvJcPtnpO4NAyCA1bfz3WRF1LgG+p5M+O8rOqvQlLlpa9odt0iZinzp840
 8DR4sRMXrNRcRnN3HVnChQaSlDnGHstuogV4IImrg0IgXn68s5H5fioXy9Lf4v4zlr
 kiL0MJKJoj0GJr5we6rnXFspC1W3szL5Wb+qMnsuxzW+6WNq1SXgFrbtSPXAgoXGtn
 lpu3MdLHSO5+w==
Message-ID: <sashiko-outbox-193242@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS
 postamble where supported
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20261102100018.2209034-4-tilak.tirumalesh.tangudu@intel.com>
References: <20261102100018.2209034-1-tilak.tirumalesh.tangudu@intel.com>
 <20261102100018.2209034-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:11:48 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe: 64-bit semaphore wait on 32-bit slots in emit_ulls_postamb=
le()
--

commit 909e8abff72efe9fa35cc90369278500a84b3c16
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where supported

This commit updates emit_ulls_postamble() to emit MI_SEMAPHORE_WAIT_64 on
platforms where gt->info.has_sem64 is set, and increases ULLS_JOB_SIZE_DW f=
rom
48 to 50 to accommodate the 2 additional dwords.

> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_rin=
g_ops.c
> index 267bb1c26f997..e4073fce87664 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -562,14 +562,30 @@ static int emit_ulls_ring_tail(struct xe_gt *gt, st=
ruct xe_lrc *lrc, u32 *dw,
>  static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32=
 *dw,
>  			       int i, u32 seqno, u32 head)
>  {
> -	dw[i++] =3D MI_SEMAPHORE_WAIT |
> -		MI_SEMW_GGTT |
> -		MI_SEMW_POLL |
> -		MI_SEMW_COMPARE(SAD_EQ_SDD);
> -	dw[i++] =3D LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
> -	dw[i++] =3D xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
> -	dw[i++] =3D 0;
> -	dw[i++] =3D 0;
> +	u32 addr =3D xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
> +
> +	/* Wa_16029281913: legacy semaphore has an issue on some Xe3p platforms=
, prefer sem64 */
> +	if (gt->info.has_sem64) {
> +		dw[i++] =3D MI_SEMAPHORE_WAIT_64 |
> +			MI_SEMW_GGTT |
> +			MI_SEMW64_INHIBIT_CTX_SWITCH |
> +			MI_SEMW_COMPARE(SAD_EQ_SDD);
> +		dw[i++] =3D LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
> +		dw[i++] =3D 0;
> +		dw[i++] =3D addr;

[Severity: High]
Does using MI_SEMAPHORE_WAIT_64 here cause a GPU hang because the ULLS
semaphore slots in PPHWSP are still spaced at 32-bit intervals?

In drivers/gpu/drm/xe/xe_lrc.c, xe_lrc_ulls_semaphore_ggtt_addr() and
xe_lrc_set_ulls_semaphore() index the semaphore array with a 4-byte stride:

#define semaphore_offset(seqno) \
	(sizeof(u32) * ((seqno) % LRC_MIGRATION_ULLS_SEMAPHORE_COUNT))

u32 xe_lrc_ulls_semaphore_ggtt_addr(struct xe_lrc *lrc, u32 seqno)
{
	...
	return __xe_lrc_ulls_ggtt_addr(lrc) + semaphore_offset(seqno);
}

void xe_lrc_set_ulls_semaphore(struct xe_lrc *lrc, u32 seqno)
{
	...
	iosys_map_incr(&map, semaphore_offset(seqno));
	xe_map_write32(xe, &map, LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL);
}

MI_SEMAPHORE_WAIT_64 performs a 64-bit comparison (against 0x00000000000000=
01
with SAD_EQ_SDD) and requires an 8-byte aligned GGTT address (bits 2:0 are
MBZ).

When seqno + 1 is odd, addr is only 4-byte aligned (addr & 7 =3D=3D 4). Whe=
n the
hardware masks bits 2:0, the 64-bit read accesses the qword at addr & ~7,
which holds semaphore[seqno] (cleared to 0 by emit_ulls_preamble()) in the
lower 32 bits and semaphore[seqno + 1] (set to 1 by
xe_lrc_set_ulls_semaphore()) in the upper 32 bits, reading 0x00000001000000=
00
instead of 0x0000000000000001.

Even when seqno + 1 is even and 8-byte aligned, the 64-bit read at
semaphore[seqno + 1] spans both semaphore[seqno + 1] in the low 32 bits and
semaphore[seqno + 2] in the high 32 bits. If both jobs seqno + 1 and
seqno + 2 are submitted before job seqno reaches its postamble,
xe_lrc_set_ulls_semaphore() writes 1 to both slots, making the 64-bit value
at addr 0x0000000100000001. Because semaphore[seqno + 2] is only cleared wh=
en
job seqno + 2 executes its preamble on the engine, the SAD_EQ_SDD check on
job seqno will never match and the engine will hang.

Should semaphore_offset() in drivers/gpu/drm/xe/xe_lrc.c use sizeof(u64) so
that each ULLS semaphore slot is 8-byte aligned with its upper 32 bits zero=
ed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102100018.2209=
034-1-tilak.tirumalesh.tangudu@intel.com?part=3D3
