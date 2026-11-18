Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16788606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIP/GjXi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F7E10E67A;
	Wed, 18 Nov 2026 03:14:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1707A10E67A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 03:14:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F045061871;
 Wed, 18 Nov 2026 03:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0871F000C4;
 Wed, 18 Nov 2026 03:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794971670;
 bh=koqafCEqyTkrJafZW9VseUvuRk4+LI+mNKeThHc6UM4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZIP/GjXiJ0HbYEgD6CoR/+wjUFt38Kz2Vqpfhl3QtpEHHVRuyOWnDyTZe1Zao7zdf
 TP8P0m1FhIcfL4YBPvHpsTaY6JAXXbAYtNaog7vj9Rna8SNz7oQ8O6DnySRdUI8auf
 Ln0hEvZaVTjq8E/uQzPmFWfJ8bQc3qm2II+0RsAbUBHboryhGcq3HhF99PFDojdGC2
 HqIFKP1bvabIpSJhjje3k0ATsEIFPDuO6+Cj+UdtnG0QEW5YSzCgrm5Kk89B35nMVf
 VHzIrbgwTXs39S/VYukLbuN8SPO5DFX8gVEB0K9HFoV6uzzXWNyQNAavCzp3GIvgxh
 oqyqoVrC5jEKA==
Message-ID: <sashiko-outbox-220008@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/7] drm/xe/oa: Use the drm device address_space for
 the OA stream fd
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118025140.3782678-10-umesh.nerlige.ramappa@intel.com>
References: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
 <20261118025140.3782678-10-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 03:14:30 +0000
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

commit ee3d12a278757fb580419538219695a6394996a5
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
Since this fixes OA buffer mmap handling, should it include Fixes tags:

  Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
  Fixes: 41255b2f1e03 ("drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118025140.3782=
678-9-umesh.nerlige.ramappa@intel.com?part=3D1
