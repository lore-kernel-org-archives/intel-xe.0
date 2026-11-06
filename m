Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606C606A333
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4PhFH2k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775C110E438;
	Fri,  6 Nov 2026 19:43:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEA410E438
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 19:43:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D9EA3414DF;
 Fri,  6 Nov 2026 19:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971131F0089F;
 Fri,  6 Nov 2026 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793994213;
 bh=nOP2JKgWwHO7ZmypmVmAyqbPxBuGyNr3Zm5prsrBYsE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=O4PhFH2k1PAwxtLmhidEBkiWODcBpiUyGuNdnFaGW8mCPX4CZEJHFMZqAP8UuCBj7
 Ri2tznSD8rf18rcQlutzAl00yR5W4t3IuHw3ymAgfrBc3pMKxryEq+Lci+OsHyGDaG
 dLRXv9MRKsoXlxzP3oOHYkcFL+1LrzvEswqtFII0zShzKn2rKWCCN46y0Zb72WX8NM
 T6Im+Exhimpk4R5D+KW8V/BeL4mLGRGGAf1PzW1c1F+1fNhDPpsczwShWPfExavRTw
 0mx4J6uPcqv0Nsx37zi/XJbheINyshSi3vtoEVwg+IGTwUQm0m+1EfjQOjbSkK2HEX
 3mg6LGG/YRjRg==
Message-ID: <sashiko-outbox-202165@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/xe3p: Bump offset for PPHWSP software scratch area
To: "Gustavo Sousa" <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106-xe3p-bump-pphwsp-scratch-v1-1-d1b3e64a4e0a@intel.com>
References: <20261106-xe3p-bump-pphwsp-scratch-v1-1-d1b3e64a4e0a@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 19:43:33 +0000
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
- [High] drm/xe: LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR collides with job
  timestamp offset
--

commit 7647f6d3f27709eeef4ffa64a14662ab16a3295d
Author: Gustavo Sousa <gustavo.sousa@intel.com>

drm/xe/xe3p: Bump offset for PPHWSP software scratch area

This commit defines a base offset of dword 128 for the driver's PPHWSP
software scratch area and expresses the flush and PXP invalidation
scratch addresses relative to it.

> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index f2e829e621684..77949593562c7 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -51,8 +51,23 @@ struct xe_lrc_snapshot {
>  	u32 ctx_job_timestamp;
>  };
> =20
> -#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
> -#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
> +/*
> + * The PPHWSP software scratch area starts at different locations
> + * depending on the IP:
> + *
> + *  - Before graphics version 35.10 B0-step: dword #34.
> + *  - Starting with graphics version 35.10 B0: dword #36.
> + *
> + * For our driver usage, we use a custom base that fits all supported
> + * IPs and adds some extra buffer in case future hardware updates end
> + * up reserving extra dwords and further pushing the base of the
> + * scratch area.
> + */
> +#define LRC_PPHWSP_SCRATCH_BASE			(128 * 4)
> +#define LRC_PPHWSP_SCRATCH_DW(idx)		(LRC_PPHWSP_SCRATCH_BASE + (idx) * 4)
> +
> +#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR	LRC_PPHWSP_SCRATCH_DW(0)
> +#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR	LRC_PPHWSP_SCRATCH_DW(12)

[Severity: High]
Does setting LRC_PPHWSP_SCRATCH_BASE to (128 * 4) make
LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR collide with
LRC_CTX_JOB_TIMESTAMP_OFFSET in drivers/gpu/drm/xe/xe_lrc.c?

drivers/gpu/drm/xe/xe_lrc.c:
#define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
...
static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
{
	/* This is stored in the driver-defined portion of PPHWSP */
	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
}

In __emit_job_gen12_render_compute(), emit_copy_timestamp() stores the
job start timestamp at PPHWSP + 512, and emit_pipe_invalidate()
immediately follows with a PIPE_CONTROL_STORE_DATA_INDEX write of 0 to
PPHWSP + LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (now also 512).  That
zeroes ctx_job_timestamp before the batch runs, causing check_timeout()
in drivers/gpu/drm/xe/xe_guc_submit.c to treat the total cumulative
context runtime as the current job's runtime and trigger false-positive
job timeouts and engine resets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-xe3p-bump-=
pphwsp-scratch-v1-1-d1b3e64a4e0a@intel.com?part=3D1
