Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A4A606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hh3usO4w
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621810E0EB;
	Tue, 10 Nov 2026 19:26:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13A010E0EB
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 19:26:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AC8FA4602E;
 Tue, 10 Nov 2026 19:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D841F008A4;
 Tue, 10 Nov 2026 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794338769;
 bh=6DvieGXmcdK9iBnGaYQC1ao5wMiB7wsQlEROehdfaXQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hh3usO4wMFABeAMKfb/v5bEUNRRzaVcdyQiNADSz4QOpgAktfxDdq+wKwnkpd3vac
 +pRNPUV80AmL7iDiMOLD2jBHFkQ/4cZ/2chW2T2OYU9k4CEpzpSDl8HYDYBTSqztio
 JKx0OqUh0+24Hm0cNuqbnQNpomEr/khwIsGY/vaaxTloG/TZMLfLlaCFW3+I8bOIPK
 S/mCDtMqA+sKae7Ax/nsWwwoJ5T7/T3YQ705BQDV/AfVeBmXLRsrCaVKEi1LWxL8+S
 syuCbVBFBeLOS5LYL0BAT2GHutWDBOvJd2LGu3mYBjFyW6vDm8YnJ4EONWq2R8iI59
 ZvWirPK/8chrg==
Message-ID: <sashiko-outbox-207654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] drm/xe: Reject vm_ops->access on BO mappings of
 an unplugged device
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110190052.3514226-15-umesh.nerlige.ramappa@intel.com>
References: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
 <20261110190052.3514226-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:26:09 +0000
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

commit 2c50602f8cb3fdeed79be6d7644c7fd302b6e48d
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
Since this fixes a missing unplug check in xe_bo_vm_access(), should the
commit message include:

  Fixes: f85dc3c5abdd ("drm/xe: Add xe_bo_vm_access")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110190052.3514=
226-9-umesh.nerlige.ramappa@intel.com?part=3D6
