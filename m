Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADB6606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xe0tsK/G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79BB10E086;
	Wed, 18 Nov 2026 03:05:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EE110E086
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 03:05:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E4D75618D7;
 Wed, 18 Nov 2026 03:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F41D1F000C6;
 Wed, 18 Nov 2026 03:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794971131;
 bh=UfuCZ9IRSS8b1+zcynQEZpZFVJN4HTE2d7RIiRLsy8A=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Xe0tsK/GY82M1um4Y2D9X365T1D72qE5je3GFpX5WmTr3oYs61g6DDIKgv2ay/vax
 T8dCSSKw6Knubxj+g3h/giiujzKvcMCnCxTEGJLkGfcNNMr8H7w/+0qyn6KvBOReXx
 nPaTS3tXs25Yhpf8av7t6ih57cUqIlPd6BTdd+e+MyHPEsFnl4rTUU45+dDpAA/9dd
 9kqjQnAXZ1EHLStKfPzzF4cXTIrvujQauh73EWRajOw1dfxXEkwcBu4lBb21xs0UDi
 zO2Zs4iTImB3abYq93F5lHQSccQ/9dLguit6Zz7xf//holmhCxKTzog0BCewrfNrQV
 rDTKEvhfan/xQ==
Message-ID: <sashiko-outbox-219996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/7] drm/xe: Reject vm_ops->access on BO mappings of
 an unplugged device
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118025140.3782678-15-umesh.nerlige.ramappa@intel.com>
References: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
 <20261118025140.3782678-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 03:05:31 +0000
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

commit 320ffd7019542a47cc051af4e8e31dbbf1dbd413
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
include a Fixes tag?

  Fixes: f85dc3c5abdd ("drm/xe: Add xe_bo_vm_access")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118025140.3782=
678-9-umesh.nerlige.ramappa@intel.com?part=3D6
