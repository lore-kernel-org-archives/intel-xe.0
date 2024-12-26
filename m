Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF60E77188
	for <intel-xe@archiver.kernel.org>; Thu, 26 Dec 2024 11:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A6310E16B;
	Thu, 26 Dec 2024 11:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vf80a4wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E00410E16B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Dec 2024 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735211385; x=1766747385;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0A6Qm3LXaR0KSctiOFrazermhXDP/mlrAgp1UlMoyDo=;
 b=Vf80a4wpCedknoKIZccqMBMScnG4MuqNCw250z551ReDOAxVOUGtlljc
 456BYLbQ96tw6Z96FXHPdWGlLz7Ytz5zO4h5NWmpfomtTnwD2KLi/4Ily
 9irsXI+hk3u2kUdBMzexote5Bym+EmXufAx2pDQTfdtM+KW1w5dNZS/wH
 b4qruyQc2yMPk3gB1+uwbUtP7KQmLJJw4bcQFqDj16wt1vwA/0fpWUl+L
 fNekASU4kJmqi7zk+oEhH+VI6FebmfZAexVCPq1SW0RGIcxo42gn0dPZX
 5VG+iw7T2lN+cr++j43KoQlM9+myTpq/7tFiiyhDP7IqK3zfFOl+A9yn/ w==;
X-CSE-ConnectionGUID: 7bCALCdgQmSdVmgJns2kCQ==
X-CSE-MsgGUID: WnUiaLaSSdCB1nn5ak9bkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35766626"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="35766626"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2024 03:09:45 -0800
X-CSE-ConnectionGUID: 8TyZ1Ee4SjaXlKHIpUBkvQ==
X-CSE-MsgGUID: aUz3KLRcQ2KHilLBFRHddg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103979814"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.115])
 ([10.245.246.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2024 03:09:42 -0800
Message-ID: <b4ae13f0f1e8fc89de4d3da2675c916895845afb.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove 'Force write completion' from
 MI_STORE_DATA_IMM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, =?ISO-8859-1?Q?Jos=E9?=
 Roberto de Souza <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Date: Thu, 26 Dec 2024 12:09:39 +0100
In-Reply-To: <85cyhh22xy.wl-ashutosh.dixit@intel.com>
References: <20241223182918.126288-1-jose.souza@intel.com>
 <85cyhh22xy.wl-ashutosh.dixit@intel.com>
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

Hi!

On Mon, 2024-12-23 at 19:08 -0800, Dixit, Ashutosh wrote:
> On Mon, 23 Dec 2024 10:29:18 -0800, Jos=C3=A9 Roberto de Souza wrote:
> >=20
> > In all places the MI_STORE_DATA_IMM are not followed by a read of
> > the same memory address in the same batch buffer and the posted
> > writes
> > are flushed with PIPE_CONTROL or MI_FLUSH_DW in xe_ring_ops.c
> > functions
> > so there is no need to set this register.
> >=20
> > This is not a revert because I think it is worthy keep the register
> > definition and the comment on top of it so future readers don't
> > get the same wrong conclusion as I did.
> >=20
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Fixes: 1460bb1fef9c ("drm/xe: Force write completion of
> > MI_STORE_DATA_IMM")
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
> > =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +=
+-------
> > =C2=A0drivers/gpu/drm/xe/xe_oa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 -
> > =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ++----
> > =C2=A04 files changed, 8 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > index f4ee910f09432..8e9884aaa4b8a 100644
> > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > @@ -35,6 +35,10 @@
> >=20
> > =C2=A0#define MI_STORE_DATA_IMM			__MI_INSTR(0x20)
> > =C2=A0#define=C2=A0=C2=A0 MI_SDI_GGTT				REG_BIT(22)
> > +/*
> > + * PIPE_CONTROL and MI_FLUSH_DW flushes all posted writes, only
> > needed if
> > + * written value is read in batch buffer
>=20
> I don't think this is correct. If a previous posted write writes data
> and
> that data is lying in GPU cache, this or a future batch buffer should
> be
> able to read that data, even without this flag.
>=20
> The purpose of MI_FORCE_WRITE_COMPLETION_CHECK flag seems to be a
> sort of
> SFENCE for the GPU, and SFENCE equivalent can also be done using
> MI_FLUSH_DW and PIPE_CONTROL. It is the latter which seem to be used
> in the
> driver now, rather than this flag. So the purpose is to make the
> writes
> globally visible.
>=20
> So if you want to leave a comment here you'd have to say something
> like
> that and drop "only needed if written value is read in batch
> buffer". So something like:
>=20
> /*
> =C2=A0* At present PIPE_CONTROL and MI_FLUSH_DW flush posted writes (when
> needed)
> =C2=A0* in the Xe driver. This flag provides another means of doing the
> same.
> =C2=A0*/
>=20
> Otherwise just revert the patch. Thomas can review the wording.
>=20
> Also the OA instance has or will be been soon deleted so is no longer
> relevant.
>=20
> Sorry, I should have been more careful while reviewing.
>=20
> Thanks.
> --
> Ashutosh

If you have not already applied this patch, just please revert the
original one with a short explanation in the commit message.

I think that will stop unnecessary stable backporting and I can skip
both patches for the -fixes series. Also typically we avoid having code
in KMD for future use.

Moving forward I think this flag might come in handy for simplifying
some ring-ops. In particular the ones where we first emit page-table
updates and then the payload.

Thanks,
Thomas




>=20
> > + */
> > =C2=A0#define=C2=A0=C2=A0 MI_FORCE_WRITE_COMPLETION_CHECK	REG_BIT(10)
> > =C2=A0#define=C2=A0=C2=A0 MI_SDI_LEN_DW				GENMASK(9,
> > 0)
> > =C2=A0#define=C2=A0=C2=A0
> > MI_SDI_NUM_DW(x)			REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 8b32fad678782..9b3bcb789eee3 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -581,9 +581,7 @@ static void emit_pte(struct xe_migrate *m,
> > 	while (ptes) {
> > 		u32 chunk =3D min(MAX_PTE_PER_SDI, ptes);
> >=20
> > -		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > -				=C2=A0=C2=A0=C2=A0
> > MI_FORCE_WRITE_COMPLETION_CHECK |
> > -				=C2=A0=C2=A0=C2=A0 MI_SDI_NUM_QW(chunk);
> > +		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > MI_SDI_NUM_QW(chunk);
> > 		bb->cs[bb->len++] =3D ofs;
> > 		bb->cs[bb->len++] =3D 0;
> >=20
> > @@ -1225,9 +1223,7 @@ static void write_pgtable(struct xe_tile
> > *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > 		if (!(bb->len & 1))
> > 			bb->cs[bb->len++] =3D MI_NOOP;
> >=20
> > -		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > -				=C2=A0=C2=A0=C2=A0
> > MI_FORCE_WRITE_COMPLETION_CHECK |
> > -				=C2=A0=C2=A0=C2=A0 MI_SDI_NUM_QW(chunk);
> > +		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > MI_SDI_NUM_QW(chunk);
> > 		bb->cs[bb->len++] =3D lower_32_bits(addr);
> > 		bb->cs[bb->len++] =3D upper_32_bits(addr);
> > 		if (pt_op->bind)
> > @@ -1392,7 +1388,6 @@ __xe_migrate_update_pgtables(struct
> > xe_migrate *m,
> > 			u32 idx =3D 0;
> >=20
> > 			bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > -					=C2=A0=C2=A0=C2=A0
> > MI_FORCE_WRITE_COMPLETION_CHECK |
> > 					=C2=A0=C2=A0=C2=A0 MI_SDI_NUM_QW(chunk);
> > 			bb->cs[bb->len++] =3D ofs;
> > 			bb->cs[bb->len++] =3D 0; /* upper_32_bits */
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c
> > b/drivers/gpu/drm/xe/xe_oa.c
> > index ae94490b0eac8..6b440a5470255 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -691,7 +691,6 @@ static void xe_oa_store_flex(struct
> > xe_oa_stream *stream, struct xe_lrc *lrc,
> >=20
> > 	do {
> > 		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > MI_SDI_GGTT |
> > -				=C2=A0=C2=A0=C2=A0
> > MI_FORCE_WRITE_COMPLETION_CHECK |
> > 				=C2=A0=C2=A0=C2=A0 MI_SDI_NUM_DW(1);
> > 		bb->cs[bb->len++] =3D offset + flex->offset *
> > sizeof(u32);
> > 		bb->cs[bb->len++] =3D 0;
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 3a75a08b6be92..0be4f489d3e12 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -72,8 +72,7 @@ static int emit_user_interrupt(u32 *dw, int i)
> >=20
> > =C2=A0static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int
> > i)
> > =C2=A0{
> > -	dw[i++] =3D MI_STORE_DATA_IMM | MI_SDI_GGTT |
> > -		=C2=A0 MI_FORCE_WRITE_COMPLETION_CHECK |
> > MI_SDI_NUM_DW(1);
> > +	dw[i++] =3D MI_STORE_DATA_IMM | MI_SDI_GGTT |
> > MI_SDI_NUM_DW(1);
> > 	dw[i++] =3D addr;
> > 	dw[i++] =3D 0;
> > 	dw[i++] =3D value;
> > @@ -163,8 +162,7 @@ static int emit_pipe_invalidate(u32 mask_flags,
> > bool invalidate_tlb, u32 *dw,
> > =C2=A0static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> > 				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 *dw, int i)
> > =C2=A0{
> > -	dw[i++] =3D MI_STORE_DATA_IMM |
> > MI_FORCE_WRITE_COMPLETION_CHECK |
> > -		=C2=A0 MI_SDI_NUM_QW(1);
> > +	dw[i++] =3D MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
> > 	dw[i++] =3D lower_32_bits(addr);
> > 	dw[i++] =3D upper_32_bits(addr);
> > 	dw[i++] =3D lower_32_bits(value);
> > --
> > 2.47.1
> >=20

