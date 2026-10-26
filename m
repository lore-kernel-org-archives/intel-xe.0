Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E4F606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 02:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dy59qucr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB6F10E28B;
	Mon, 26 Oct 2026 02:24:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D192B10E17C
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 02:24:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F92443CDC;
 Mon, 26 Oct 2026 02:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAA31F01825;
 Mon, 26 Oct 2026 02:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792981457;
 bh=+tyVKfdWKgaarf/sPosFjRl2PgE+wPOOgtPh5UhrgDU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Dy59qucrGsFM9eeQzj+SyYbtMkgSgewD5vrvWiZcsnMDPHHyATKbAADVkORIRbejQ
 RfLGoPjcPg65EXgcRZWRQEfqZVMy0ThhFZy0E8dpv9qZVGNO1o1K7lWjOPy6ZZKZWA
 4xJg682KeVDm7+G3wUSjgNzvR61NXyu52VVgKyhZN7WsjC0X8avhLrirm4q6++/Sfw
 PWywUt5YX1bDyYfdYKk50vR5y8XnI40cCNV4tk65mpTzsfTUMDR9GZ4LJ4ZM8tySs7
 l2v2KgGDkuw9oPMJYX/gGnqF9oJbLH1Gsu4sSmfEcyknqJQar/MjiR9MYpp8HzD8bU
 BSBXcAyzZoIfQ==
Message-ID: <sashiko-outbox-184600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Unwrap sync fences before adding them as job
 dependencies
To: =?utf-8?b?Q2hlbiwgSnVuamlh?= <junjia.chen@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261026020721.973291-1-junjia.chen@intel.com>
References: <20261026020721.973291-1-junjia.chen@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 02:24:16 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: dma_fence leak in xe_sync_entry_add_deps() on error retu=
rn
--

commit 7c1f1992f566aa87fc231ce7e528d8b1c35d0686
Author: Chen, Junjia <junjia.chen@intel.com>

drm/xe: Unwrap sync fences before adding them as job dependencies

This commit unwraps fence containers in xe_sync_entry_add_deps() using
dma_fence_unwrap_for_each() before adding unsignaled underlying fences as
job dependencies via drm_sched_job_add_dependency(). This allows the DRM
scheduler to recognize same-entity fences wrapped inside timeline syncobj
chain nodes instead of treating the container as a cross-queue dependency.

> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 06b1c913588ab..73fe7f05ba166 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c

[ ... ]

> @@ -233,9 +234,30 @@ ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
> =20
>  int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_j=
ob *job)
>  {
> -	if (sync->fence)
> -		return  drm_sched_job_add_dependency(&job->drm,
> -						     dma_fence_get(sync->fence));
> +	struct dma_fence_unwrap iter;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	if (!sync->fence)
> +		return 0;
> +
> +	/*
> +	 * Unwrap fence containers (e.g. dma_fence_chain from a timeline
> +	 * syncobj) so the scheduler sees the underlying fences. That lets it
> +	 * drop dependencies on jobs from the same entity and only wait for
> +	 * jobs on the same scheduler to be scheduled, rather than waiting for
> +	 * the container, which forces a full GPU completion wait and drains
> +	 * the queue.
> +	 */
> +	dma_fence_unwrap_for_each(fence, &iter, sync->fence) {
> +		if (dma_fence_is_signaled(fence))
> +			continue;
> +
> +		err =3D drm_sched_job_add_dependency(&job->drm,
> +						   dma_fence_get(fence));
> +		if (err)
> +			return err;

[Severity: Medium]
Does returning early from inside dma_fence_unwrap_for_each() leak the
dma_fence reference held in iter.chain when drm_sched_job_add_dependency()
fails?

When dma_fence_unwrap_for_each() starts, dma_fence_unwrap_first() takes a
reference on the head fence and stores it in cursor->chain:

drivers/dma-buf/dma-fence-unwrap.c:dma_fence_unwrap_first() {
	cursor->chain =3D dma_fence_get(head);
	return __dma_fence_unwrap_array(cursor);
}

That reference is only stepped and eventually dropped as
dma_fence_unwrap_next() walks cursor->chain to the end of the chain via
dma_fence_chain_walk():

drivers/dma-buf/dma-fence-unwrap.c:dma_fence_unwrap_next() {
	...
	cursor->chain =3D dma_fence_chain_walk(cursor->chain);
	return __dma_fence_unwrap_array(cursor);
}

If drm_sched_job_add_dependency() returns an error before the loop finishes
iterating, should xe_sync_entry_add_deps() call dma_fence_put(iter.chain)
before returning err?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026020721.9732=
91-1-junjia.chen@intel.com?part=3D1
