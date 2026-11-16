Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC73606A332
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2kQ8jPm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FC110E47E;
	Mon, 16 Nov 2026 22:46:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4D10E498
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 22:46:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1FE9544F4B;
 Mon, 16 Nov 2026 22:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8CB1F000C4;
 Mon, 16 Nov 2026 22:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794869187;
 bh=027TrPya3tu3wVV3hgmF7uNpSDphKWe+S3a7LrW5A9o=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=c2kQ8jPmMNUvAevSGGj0FCGSuZOVhtZdhW9B9JEBJBWmarZh/dIY2ZlqY5hIrfzdZ
 xoGkKU9bKb2keqk4qkyKzBvP88WKgoE8cKHsjG5OGMnkxHZexmHa886PrW8GgBoTx8
 8HYrCx+KSXc1wKLZq6Y/jorV2BhQYHOeJjQPzlyPQ0/cqwoeVYqG2lHgmgOe+Z4P6k
 23LP7E/w9yXQR4WVOLtqAlXVgjHaOmi0eNCYEba9zo79tA1gMsMLnECaTVEXtfSQ38
 /tbKLjlMTUcURoFejn88KyedhE4zctWCl2cWNzZMdEHqHX6eWO3Z9QcVLKqOD20HFV
 EbAVAhFE/BRKQ==
Message-ID: <sashiko-outbox-217813@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/7] drm/xe/oa: Use the drm device address_space for
 the OA stream fd
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116222752.3677159-10-umesh.nerlige.ramappa@intel.com>
References: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
 <20261116222752.3677159-10-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:46:26 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe/oa: missing Fixes trailer for OA buffer mmap
  address_space fix
--

commit f8622feefccc29c0fd07873f2916fdaeeff20136
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

> drm/xe/oa: Use the drm device address_space for the OA stream fd
>
> anon_inode_getfd() hands back a file whose f_mapping points at the
> address_space of the kernel-wide singleton anon_inode_inode, shared by
> every other anon_inode_getfd()/anon_inode_getfile() user in the system.
> Any code that needs to invalidate userspace mappings of the OA buffer
> via that mapping (e.g. unmap_mapping_range()) would end up operating on
> an address_space it doesn't own, with the potential to affect unrelated
> mappings.
>
> Keep the anon inode singleton and only point the file's f_mapping at the
> drm device's address_space (drm.anon_inode->i_mapping), same as drm_file
> does for drm fds. f_mapping must be set before the fd is visible to
> userspace, so reserve the fd with get_unused_fd_flags(), create the file
> with anon_inode_getfile() and install it with fd_install() after setting
> f_mapping.
>
> To keep the OA buffer mmaps of different streams apart from each other
> and from GEM mmaps in that shared address_space, reserve a GEM fake
> offset for the OA buffer with drm_gem_create_mmap_offset(), and move
> the vma to that offset in xe_oa_mmap() by setting vm_pgoff, the same
> way drm_gem_prime_mmap() does. f_op->mmap runs before the vma is linked
> into the address_space, so the vma is tracked at the OA buffer's own
> range, and drm_vma_node_unmap() on the OA buffer only zaps mappings of
> that buffer. The TTM fault handler already subtracts the fake offset
> from vm_pgoff, so faults resolve to the right pages unchanged.
>
> drm_dev_unplug() now also zaps OA buffer mmaps along with all other
> mmaps of the drm device.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

[Severity: Low]
Since this fixes OA buffer mmap tracking so that ttm_bo_vm_open(),
drm_vma_node_unmap() and drm_dev_unplug() operate on the DRM device's
address_space rather than the global anon_inode_inode mapping, should this
include:

  Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
  Fixes: 41255b2f1e03 ("drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222752.3677=
159-9-umesh.nerlige.ramappa@intel.com?part=3D1
