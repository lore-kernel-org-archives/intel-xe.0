Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B6AC4450C
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3209A10E249;
	Wed,  1 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="V/6aUYar";
	dkim-atps=neutral
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7976610E246
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 18:02:04 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1782410035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcW7f1KnCKedIvf/bD+eSI3AnSVtFqLGxhFuAZBnp9o=;
 b=V/6aUYarmF+B8FnFQN/7beEEmbCtD5wX5P2YLhYAeBGkCCYal5PWhObasTBZw2PBzfBwFW
 N1SM9QTcxnNZZazAXv4oyAKE1jEYc0/MTpGLd7/KgBLiS8FCz+81lUlScA5Id0Ru/2JElo
 mPMMXg4s+nrgY7MW6uyyCR5m9MR3nH4=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/3] drm/xe: fix NPD in bo_meminfo()
Date: Thu, 25 Jun 2026 18:53:39 +0100
Message-Id: <6929E9BF-BC21-4B17-9FD7-371AB832A37E@linux.dev>
References: <20260625152054.450125-6-matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
In-Reply-To: <20260625152054.450125-6-matthew.auld@intel.com>
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
> =EF=BB=BFWhen a buffer object is purged, its ttm.resource is set to NULL v=
ia the
> TTM pipeline gutting flow. However, the BO remains in the client's
> object list until userspace explicitly closes the GEM handle. If memory
> stats are queried during this time, accessing bo->ttm.resource->mem_type
> will result in a NULL pointer dereference.
>=20
> Fix this by safely skipping purged BOs in bo_meminfo, as they no longer
> consume any memory.
>=20
> User is getting NPD on device resume, and possible theory is that in
> bo_move(), if we need to evict something to SYSTEM to save the CCS state,
> but the BO is marked as dontneed, this won't trigger a move but will
> nuke the pages, leaving us with a NULL bo resource. And the meminfo()
> doesn't look ready to handle a NULL resource.
>=20
> v2 (Sashiko):
> - There could potentially be other cases where we might end up with a
>   NULL resource, so make this a general NULL check for now.
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8419
> Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object su=
pport")
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Have not seen the issue again after applying this patch.

Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Arvind Yadav <arvind.yadav@intel.com>
> ---
> drivers/gpu/drm/xe/xe_drm_client.c | 12 +++++++++++-
> 1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_dr=
m_client.c
> index 84b66147bf49..81020b4b344e 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -168,10 +168,20 @@ static void bo_meminfo(struct xe_bo *bo,
>               struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
> {
>    u64 sz =3D xe_bo_size(bo);
> -    u32 mem_type =3D bo->ttm.resource->mem_type;
> +    u32 mem_type;
>=20
>    xe_bo_assert_held(bo);
>=20
> +    /*
> +     * The resource can be NULL if the BO has been purged, plus maybe som=
e
> +     * other cases. Either way there shouldn't be any memory to account f=
or,
> +     * or a current resource to account this against, so skip for now.
> +     */
> +    if (!bo->ttm.resource)
> +        return;
> +
> +    mem_type =3D bo->ttm.resource->mem_type;
> +
>    if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
>        stats[mem_type].shared +=3D sz;
>    else
> --
> 2.54.0
>=20
