Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34470C4451B
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E4410EFBD;
	Wed,  1 Jul 2026 12:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="swBd1MzB";
	dkim-atps=neutral
X-Greylist: delayed 485 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jun 2026 18:02:03 UTC
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B3B10E236
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 18:02:03 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1782410130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8mHMShjtu87RFAU0HlEPuTp9dF4ylEQAmMmXIKK0/Q=;
 b=swBd1MzBBuVX4F5B4suLo2P8oEogmPtJH58uVVYAIN55sLHEAXV789yWdYhxHYjO8htIWW
 8ZnfsOqMqiN5KyzPOt0Y6BSqJmxRAHa5vLz9CjF00jt0pdU/N+xmuVtPyBcEgHoidlzXtW
 zDNIrnIZ5vfoRMxjZIU+bOMnuxrrb4c=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 3/3] drm/xe/pt: prevent invalid cursor access for purged
 BOs
Date: Thu, 25 Jun 2026 18:55:18 +0100
Message-Id: <0E8C0334-5F7A-46C5-A927-EB2ED38943A2@linux.dev>
References: <20260625152054.450125-8-matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
In-Reply-To: <20260625152054.450125-8-matthew.auld@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:56:31 +0000
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



> On Jun 25, 2026, at 4:21=E2=80=AFPM, Matthew Auld <matthew.auld@intel.com>=
 wrote:
>=20
> =EF=BB=BFDuring a page table walk for binding, xe_pt_stage_bind() explicit=
ly
> skips initializing the xe_res_cursor for purged BOs, treating them
> similarly to NULL VMAs by only setting the cursor size.
>=20
> However, xe_pt_hugepte_possible() and xe_pt_scan_64K() did not check
> if the BO was purged before attempting to walk the cursor using
> xe_res_dma() and xe_res_next(). Because the cursor was left
> uninitialized for purged BOs, this falls through and triggers
> warnings like:
>=20
>  WARNING: drivers/gpu/drm/xe/xe_res_cursor.h:274 at xe_res_next
>=20
> Fix this by explicitly checking if the BO is purged in both
> xe_pt_hugepte_possible() and xe_pt_scan_64K(), returning early just
> as we do for NULL VMAs, avoiding the invalid cursor accesses entirely.
>=20
> As a precaution, also zero-initialize the cursor in xe_pt_stage_bind()
> to ensure we don't pass garbage data into the page table walkers
> if we ever hit a similar edge case in the future.
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8418
> Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object su=
pport")
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>

This seems to resolve the repeated warnings I was seeing.

Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Arvind Yadav <arvind.yadav@intel.com>
> ---
> drivers/gpu/drm/xe/xe_pt.c | 12 +++++++-----
> 1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 0959e0e88a14..b1f6a96dab2e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -433,6 +433,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_wa=
lk, struct xe_pt *parent,
> static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,=

>                   struct xe_pt_stage_bind_walk *xe_walk)
> {
> +    struct xe_bo *bo =3D xe_vma_bo(xe_walk->vma);
>    u64 size, dma;
>=20
>    if (level > MAX_HUGEPTE_LEVEL)
> @@ -446,8 +447,8 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next,=
 unsigned int level,
>    if (next - xe_walk->va_curs_start > xe_walk->curs->size)
>        return false;
>=20
> -    /* null VMA's do not have dma addresses */
> -    if (xe_vma_is_null(xe_walk->vma))
> +    /* null VMA's and purged BO's do not have dma addresses */
> +    if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
>        return true;
>=20
>    /* if we are clearing page table, no dma addresses*/
> @@ -468,6 +469,7 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next,=
 unsigned int level,
> static bool
> xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
> {
> +    struct xe_bo *bo =3D xe_vma_bo(xe_walk->vma);
>    struct xe_res_cursor curs =3D *xe_walk->curs;
>=20
>    if (!IS_ALIGNED(addr, SZ_64K))
> @@ -476,8 +478,8 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_=
bind_walk *xe_walk)
>    if (next > xe_walk->l0_end_addr)
>        return false;
>=20
> -    /* null VMA's do not have dma addresses */
> -    if (xe_vma_is_null(xe_walk->vma))
> +    /* null VMA's and purged BO's do not have dma addresses */
> +    if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
>        return true;
>=20
>    xe_res_next(&curs, addr - xe_walk->va_curs_start);
> @@ -708,7 +710,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *=
vma,
> {
>    struct xe_device *xe =3D tile_to_xe(tile);
>    struct xe_bo *bo =3D xe_vma_bo(vma);
> -    struct xe_res_cursor curs;
> +    struct xe_res_cursor curs =3D {};
>    struct xe_vm *vm =3D xe_vma_vm(vma);
>    struct xe_pt_stage_bind_walk xe_walk =3D {
>        .base =3D {
> --
> 2.54.0
>=20
