Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082CC606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 22:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LhQEJifJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52CB10E3D9;
	Mon, 16 Nov 2026 22:54:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0AF10E3D9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 22:54:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C15F60E7B;
 Mon, 16 Nov 2026 22:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F631F000C4;
 Mon, 16 Nov 2026 22:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794869655;
 bh=q8tDssozkA+jN5yBA+hKkYTSY2CN21nry+jJ6HFoMEY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=LhQEJifJWVgGSvT7J6TKHBV78k2OH3GKpedD0nhIFj/TdNLPgzpQTtOAzzF/kh3A1
 dj1blOCYPs5mBkeNOzppOlRPElC/0Wh/2FFuCHNRIuPOwxhPXMEk34zcKj3FEBZ2h3
 Lygr/TTNNGDVs31L5hqv4hgI89gXtbMeo5tXHlvOdn4BxK10D1B05/m3ds1qTd7xhD
 JtbRQpLSL02C8qloaoa4V92NCjfLkRq9ECWo9skJwF+CQ031XKenvj/QkczMxzkU1j
 ktf2240Ib9sngLPYnngv3GMQ2r5xXp49nN8acgnXSDjoirNBsQi5QuPGP1ymef21zz
 i0T4X5SU5ayAA==
Message-ID: <sashiko-outbox-217818@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/7] drm/xe: Reject vm_ops->access on BO mappings of
 an unplugged device
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116222752.3677159-15-umesh.nerlige.ramappa@intel.com>
References: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
 <20261116222752.3677159-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:54:15 +0000
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
- [Low] drm/xe: missing Fixes trailer in commit fixing xe_bo_vm_access()
  unplug check
--

commit 783fff5b804bc64d027ae7f7d9b357dfe008e0e1
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

> drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
>
> A userspace mapping of a BO can outlive the device, e.g. across unbind
> or a PCI slot reset. After drm_dev_unplug() the fault handler only
> installs a dummy page, but ptrace, /proc/<pid>/mem and
> process_vm_readv() can't use get_user_pages() on these VM_PFNMAP vmas
> and fall back to vm_ops->access(), i.e. xe_bo_vm_access().
>
> xe_bo_vm_access() doesn't check whether the device is still there. For
> a BO in VRAM, xe_ttm_access_memory() then either goes through the VRAM
> iomap, which is unmapped on remove, or submits a migrate job after the
> GT has been torn down. This applies to GEM mmaps and to the OA buffer
> mmap of an OA stream that outlives the device.
>
> Enter a drm_dev_enter() section in xe_bo_vm_access() and fail with
> -ENODEV once the device is unplugged, like xe_bo_cpu_fault() does.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

[Severity: Low]
Since this fixes a missing unplug check in xe_bo_vm_access(), should this
include:

  Fixes: f85dc3c5abdd ("drm/xe: Add xe_bo_vm_access")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222752.3677=
159-9-umesh.nerlige.ramappa@intel.com?part=3D6
