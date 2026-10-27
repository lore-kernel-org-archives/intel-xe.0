Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A26D606A323
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUCqxlu/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6011F10F608;
	Tue, 27 Oct 2026 15:03:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408F010F62D
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 15:03:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E364143DDF;
 Tue, 27 Oct 2026 15:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB37F1F031E3;
 Tue, 27 Oct 2026 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793113415;
 bh=HYJsdwyu5iGwbuT+f+xLHCuP971pWYPtbxE9wstHxzo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=VUCqxlu/JhiIL+FtSXeV09iPKBQxSJfBZcEa0evGjaySEmZ7GfxBabjHrb4hK9e5D
 gmiXGiW93zTnX/s7th8uMKwn03pMdJ5jXbwUJAbcUkdyquN2VrK55/EjVjekwPHtzI
 y89rA0NWS2ZayI59I+D7/siUh2zez/+64xFdZfqsY+fz/wETua3OsHtueju0DfwCn4
 drZwQUVBrgymKzEdWi4xJpNWCdA9ZGKkUAyBH91xPRHZ5CR7a/I9GAH5An6wzIF2Nl
 yr6Fi/HQGqBsjDO+/hYocjEgPceYCpn+1Hkw2CtPeeYn5H2XWNdYjZKZFA0gfv+Fz4
 dUDTDmxU6waYQ==
Message-ID: <sashiko-outbox-186788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe/tests: Cover a large write to an unaligned
 bo offset
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261027145237.1862132-2-mika.kuoppala@linux.intel.com>
References: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
 <20261027145237.1862132-2-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:03:35 +0000
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
- [Medium] drm/xe/tests: 64B bounce loop in access_memory_test_unaligned_la=
rge_write()
--

commit 983819064579a8f3c33e9b1bc03bdf5b989cdcfe
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>

drm/xe/tests: Cover a large write to an unaligned bo offset

This commit adds a KUnit test case to drivers/gpu/drm/xe/tests/xe_migrate.c
that writes and reads back a 16 MiB buffer object from an unaligned offset =
of
4 bytes using xe_migrate_access_memory() to exercise the
MAX_PREEMPTDISABLE_TRANSFER chunking path.

> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/t=
ests/xe_migrate.c
> index a9ef8f2dcebbf..715de366d33c0 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -1041,6 +1041,53 @@ static void access_memory_test_run_tile(struct xe_=
device *xe,
>  	kvfree(buf);
>  }
> =20
> +static void access_memory_test_unaligned_large_write(struct kunit *test,
> +						     struct xe_tile *tile)
> +{
> +	const u32 size =3D SZ_16M, offset =3D 4;

[ ... ]

> +	xe_bo_lock(bo, false);
> +	ret =3D xe_migrate_access_memory(tile->migrate, bo, offset, buf,
> +				       size - offset, true);
> +	if (!ret) {
> +		memset(buf, 0, size);
> +		ret =3D xe_migrate_access_memory(tile->migrate, bo, offset, buf,
> +					       size - offset, false);
> +	}

[Severity: Medium]
On discrete GPUs without MEM_COPY instruction support (where
xe->info.has_mem_copy_instr is false, such as DG1, DG2, ATS-M, and PVC), wi=
ll
calling xe_migrate_access_memory() with offset =3D 4 for a 16 MiB transfer
fall into the 64-byte bounce-buffer loop for the entire buffer instead of
exercising the MAX_PREEMPTDISABLE_TRANSFER chunking path?

In drivers/gpu/drm/xe/tests/xe_migrate.c, access_memory_test_run_device()
calls access_memory_test_unaligned_large_write() on all discrete devices.
In drivers/gpu/drm/xe/xe_migrate.c, xe_migrate_access_memory() checks:

	/* Use bounce buffer for small access and unaligned access */
	if (!xe->info.has_mem_copy_instr &&
	    (!IS_ALIGNED(len, 4) ||
	     !IS_ALIGNED(page_offset, XE_CACHELINE_BYTES) ||
	     !IS_ALIGNED(offset, XE_CACHELINE_BYTES))) {
		...
		do {
			int copy_bytes =3D min_t(int, bytes_left,
					       XE_CACHELINE_BYTES -
					       (offset & XE_CACHELINE_MASK));
			...
			err =3D xe_migrate_access_memory(m, bo,
						       offset &
						       ~XE_CACHELINE_MASK,
						       bounce,
						       XE_CACHELINE_BYTES, 0);
			...
			if (write) {
				...
				err =3D xe_migrate_access_memory(m, bo,
							       offset & ~XE_CACHELINE_MASK,
							       bounce,
							       XE_CACHELINE_BYTES, write);
			...
		} while (bytes_left);

		kfree(bounce);
		return err;
	}

Because offset =3D 4 is not aligned to XE_CACHELINE_BYTES (64),
!IS_ALIGNED(offset, XE_CACHELINE_BYTES) is true when
!xe->info.has_mem_copy_instr. Rather than bouncing only the unaligned head,
that loop processes all bytes_left (SZ_16M - 4) in 64-byte chunks.

For a 16 MiB write followed by a 16 MiB read, this performs 262,144 write
iterations (each doing two synchronous 64-byte xe_migrate_access_memory()
calls) plus 262,144 synchronous 64-byte read calls, totaling 786,432
sequential synchronous GPU jobs per tile and bypassing the main
MAX_PREEMPTDISABLE_TRANSFER loop on those platforms.

Should offset be aligned to XE_CACHELINE_BYTES (for example, offset =3D 64)=
 on
!xe->info.has_mem_copy_instr platforms so that it remains unaligned to the
page and 256-byte pitch while still reaching the main transfer loop without
timing out?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027145237.1862=
132-1-mika.kuoppala@linux.intel.com?part=3D2
