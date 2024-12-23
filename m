Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB17E7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 15:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AAF10E1A8;
	Mon, 23 Dec 2024 15:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpP2u4XV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BAE10E1A8
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734966858; x=1766502858;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Jiq4W90COP7DfzMO4Y4sOddkADkaAAimoovvyWE9rPk=;
 b=TpP2u4XVPU9sUaLfCA3eurnePoU/4iZe4Ei/jQl2fQRLJ30GaezY5l/G
 a5aFCa17uh7zW8Vo4L294Y3UP/w5ET12SPE76Co9uT9iFFOkyIbo/A0HJ
 2LWTz3mipuX5VGAT1k9rmrTyvoiA5w8BY+vTEjhaz7uoaZNgV/SPOR2TN
 yjrAM8tEovOw/PMYWnqLUfjZ69C+CbbQQ+Fov3K7C7q+xt10ipBCsZrqT
 /Vxu56mJlA3gwnOaIWjV/+uIIbUYpqr6Wd7RWGPL55mWBkU3D7uoPM6lO
 LHXnmknbtyKetFUPMYn3PQE78pGXyxHlGCKS5OkRnWYsSVJ38SpiLEEtD g==;
X-CSE-ConnectionGUID: t3gEez0WQFyOr8UqzcH+dg==
X-CSE-MsgGUID: z3jbJ68ATnOfu5H2xVnIxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="38273489"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="38273489"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 07:14:18 -0800
X-CSE-ConnectionGUID: Mm82vEs/TZS9NNE2NVtScw==
X-CSE-MsgGUID: LZso1LDBRgmb25Xqe2OLbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="104300351"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.74])
 ([10.245.246.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 07:14:16 -0800
Message-ID: <5e4087664d041849533e3585738122132d3ec1f5.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Force write completion of MI_STORE_DATA_IMM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Mon, 23 Dec 2024 16:14:13 +0100
In-Reply-To: <Z2MGCDqGmlsYwi+J@lstrano-desk.jf.intel.com>
References: <20241217160732.46280-1-jose.souza@intel.com>
 <Z2ILvmX9y87iFvZP@lstrano-desk.jf.intel.com>
 <3ebdd73cecef119cbfb7fc902909c8c2adc5b0fc.camel@intel.com>
 <Z2MGCDqGmlsYwi+J@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

All,

On Wed, 2024-12-18 at 09:27 -0800, Matthew Brost wrote:
> On Wed, Dec 18, 2024 at 08:38:49AM -0700, Souza, Jose wrote:
> > On Tue, 2024-12-17 at 15:39 -0800, Matthew Brost wrote:
> > > On Tue, Dec 17, 2024 at 08:07:32AM -0800, Jos=C3=A9 Roberto de Souza
> > > wrote:
> > > > With Force write completion unset there is no guarantees of
> > > > when the
> > > > write will be globally visible what is not the behavior wanted.
> > > >=20
> > >=20
> > > Do we want this backported? If so, maybe add a fixes?
> >=20
> > Not sure, I don't have an actual issue that is fixed by this but I
> > think would be good to have it backported.
> > But what do you suggest? Add a fixes tag to the patch removing
> > force probe from LNL?
> >=20
>=20
> Yea fixing LNL force probe removal sounds reasonable to me.


This patch appears very odd to me. What problem is it trying to solve?
I mean in most of the places where we add a command streamer stall by
this flag we *don't* want that behaviour.

emit_store_imm_ppgtt_posted() explicitly calls out that this is a
posted write so why make it a flushed write?

emit_store_imm_gtt() has a flushing equivalent in
emit_flush_imm_ggtt().

emit_pte() is only ever used posted with an explicit flush following
the pte emits and the actual payload using the emitted ptes.

For the changes in xe_migrate.c, those writes are flushed in the
migration ring_ops.

For the oa instance, I'm not sure, but it looks like the ring ops will
be flushing there as well?

So what's the background of this patch? I'm going to leave it out of
drm-xe-fixes for now.

/Thomas


>=20
> Matt
>=20
> > >=20
> > > Matt
> > >=20
> > > > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 13 +++++++=
-
> > > > -----
> > > > =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
11
> > > > ++++++++---
> > > > =C2=A0drivers/gpu/drm/xe/xe_oa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++-
> > > > =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++++--
> > > > =C2=A04 files changed, 22 insertions(+), 12 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > > b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > > index 10ec2920d31b3..f4ee910f09432 100644
> > > > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > > @@ -33,12 +33,13 @@
> > > > =C2=A0#define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
> > > > =C2=A0#define
> > > > MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
> > > > =C2=A0
> > > > -#define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
> > > > -#define=C2=A0=C2=A0 MI_SDI_GGTT			REG_BIT(22)
> > > > -#define=C2=A0=C2=A0 MI_SDI_LEN_DW			GENMASK(9, 0)
> > > > -#define=C2=A0=C2=A0
> > > > MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> > > > -#define=C2=A0=C2=A0
> > > > MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2)|\
> > > > -					 REG_BIT(21))
> > > > +#define
> > > > MI_STORE_DATA_IMM			__MI_INSTR(0x20)
> > > > +#define=C2=A0=C2=A0 MI_SDI_GGTT				REG_BIT(22)
> > > > +#define=C2=A0=C2=A0 MI_FORCE_WRITE_COMPLETION_CHECK	REG_BIT(10)
> > > > +#define=C2=A0=C2=A0
> > > > MI_SDI_LEN_DW				GENMASK(9, 0)
> > > > +#define=C2=A0=C2=A0
> > > > MI_SDI_NUM_DW(x)			REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> > > > +#define=C2=A0=C2=A0
> > > > MI_SDI_NUM_QW(x)			(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 -2)|\
> > > > +						 REG_BIT(21))
> > > > =C2=A0
> > > > =C2=A0#define MI_LOAD_REGISTER_IMM		__MI_INSTR(0x22)
> > > > =C2=A0#define=C2=A0=C2=A0 MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 1b97d90aaddaf..8b32fad678782 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -581,7 +581,9 @@ static void emit_pte(struct xe_migrate *m,
> > > > =C2=A0	while (ptes) {
> > > > =C2=A0		u32 chunk =3D min(MAX_PTE_PER_SDI, ptes);
> > > > =C2=A0
> > > > -		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > > > MI_SDI_NUM_QW(chunk);
> > > > +		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > > > +				=C2=A0=C2=A0=C2=A0
> > > > MI_FORCE_WRITE_COMPLETION_CHECK |
> > > > +				=C2=A0=C2=A0=C2=A0 MI_SDI_NUM_QW(chunk);
> > > > =C2=A0		bb->cs[bb->len++] =3D ofs;
> > > > =C2=A0		bb->cs[bb->len++] =3D 0;
> > > > =C2=A0
> > > > @@ -1223,7 +1225,9 @@ static void write_pgtable(struct xe_tile
> > > > *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > > > =C2=A0		if (!(bb->len & 1))
> > > > =C2=A0			bb->cs[bb->len++] =3D MI_NOOP;
> > > > =C2=A0
> > > > -		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > > > MI_SDI_NUM_QW(chunk);
> > > > +		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > > > +				=C2=A0=C2=A0=C2=A0
> > > > MI_FORCE_WRITE_COMPLETION_CHECK |
> > > > +				=C2=A0=C2=A0=C2=A0 MI_SDI_NUM_QW(chunk);
> > > > =C2=A0		bb->cs[bb->len++] =3D lower_32_bits(addr);
> > > > =C2=A0		bb->cs[bb->len++] =3D upper_32_bits(addr);
> > > > =C2=A0		if (pt_op->bind)
> > > > @@ -1388,7 +1392,8 @@ __xe_migrate_update_pgtables(struct
> > > > xe_migrate *m,
> > > > =C2=A0			u32 idx =3D 0;
> > > > =C2=A0
> > > > =C2=A0			bb->cs[bb->len++] =3D MI_STORE_DATA_IMM
> > > > |
> > > > -				MI_SDI_NUM_QW(chunk);
> > > > +					=C2=A0=C2=A0=C2=A0
> > > > MI_FORCE_WRITE_COMPLETION_CHECK |
> > > > +					=C2=A0=C2=A0=C2=A0
> > > > MI_SDI_NUM_QW(chunk);
> > > > =C2=A0			bb->cs[bb->len++] =3D ofs;
> > > > =C2=A0			bb->cs[bb->len++] =3D 0; /*
> > > > upper_32_bits */
> > > > =C2=A0
> > > > diff --git a/drivers/gpu/drm/xe/xe_oa.c
> > > > b/drivers/gpu/drm/xe/xe_oa.c
> > > > index 56bf375a9d4bc..ae94490b0eac8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > > @@ -690,7 +690,9 @@ static void xe_oa_store_flex(struct
> > > > xe_oa_stream *stream, struct xe_lrc *lrc,
> > > > =C2=A0	u32 offset =3D xe_bo_ggtt_addr(lrc->bo);
> > > > =C2=A0
> > > > =C2=A0	do {
> > > > -		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > > > MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> > > > +		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > > > MI_SDI_GGTT |
> > > > +				=C2=A0=C2=A0=C2=A0
> > > > MI_FORCE_WRITE_COMPLETION_CHECK |
> > > > +				=C2=A0=C2=A0=C2=A0 MI_SDI_NUM_DW(1);
> > > > =C2=A0		bb->cs[bb->len++] =3D offset + flex->offset *
> > > > sizeof(u32);
> > > > =C2=A0		bb->cs[bb->len++] =3D 0;
> > > > =C2=A0		bb->cs[bb->len++] =3D flex->value;
> > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > index 0be4f489d3e12..3a75a08b6be92 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > @@ -72,7 +72,8 @@ static int emit_user_interrupt(u32 *dw, int
> > > > i)
> > > > =C2=A0
> > > > =C2=A0static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw,
> > > > int i)
> > > > =C2=A0{
> > > > -	dw[i++] =3D MI_STORE_DATA_IMM | MI_SDI_GGTT |
> > > > MI_SDI_NUM_DW(1);
> > > > +	dw[i++] =3D MI_STORE_DATA_IMM | MI_SDI_GGTT |
> > > > +		=C2=A0 MI_FORCE_WRITE_COMPLETION_CHECK |
> > > > MI_SDI_NUM_DW(1);
> > > > =C2=A0	dw[i++] =3D addr;
> > > > =C2=A0	dw[i++] =3D 0;
> > > > =C2=A0	dw[i++] =3D value;
> > > > @@ -162,7 +163,8 @@ static int emit_pipe_invalidate(u32
> > > > mask_flags, bool invalidate_tlb, u32 *dw,
> > > > =C2=A0static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> > > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 *dw, int i)
> > > > =C2=A0{
> > > > -	dw[i++] =3D MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
> > > > +	dw[i++] =3D MI_STORE_DATA_IMM |
> > > > MI_FORCE_WRITE_COMPLETION_CHECK |
> > > > +		=C2=A0 MI_SDI_NUM_QW(1);
> > > > =C2=A0	dw[i++] =3D lower_32_bits(addr);
> > > > =C2=A0	dw[i++] =3D upper_32_bits(addr);
> > > > =C2=A0	dw[i++] =3D lower_32_bits(value);
> > > > --=20
> > > > 2.47.1
> > > >=20
> >=20

