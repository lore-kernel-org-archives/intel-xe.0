Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BA6606A330
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cdBjKkvf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D8C10E1D2;
	Thu, 19 Nov 2026 00:39:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3001410E1D2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:39:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CCD2F414D3;
 Thu, 19 Nov 2026 00:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925E01F000C7;
 Thu, 19 Nov 2026 00:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795048772;
 bh=MyrY1JLDTGP1y4ydbGGDNajUKRP/Lo4JXt6Ln/vCeRk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=cdBjKkvf8Mrr6rNI7FYEizLKzj4F/GJt7vDAPYr7ps9KYyK+yX1GnxHQeMRGIvQZ+
 7DTYxmO4cWcePcFmfi1lRPnF1HysEArfpiq7P2GtrRC3dsDS4jpQaW2/t2mpYY1Qeq
 8dCJEfaRTiIUTqudHkXf0uvvACO69+Qcif31Fpa+owMIenCa6ukXbl/HJCcRaLStFQ
 M4wjd8NYMsREbVpmWYFz6QF08AUS9JCRkhKBO8KQyyvyXlyNIEshDEods1h0bV30Fy
 oXq0HHXedd0x6+6vOn9BoW6YNBx+kiNu4Y2NHavvjA65naYNRfUJTSAT6JvutqcMfZ
 QFuVBKTb5sXlA==
Message-ID: <sashiko-outbox-222251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/8] drm/xe: Reject vm_ops->access on BO mappings of
 an unplugged device
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119002737.3899877-14-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:39:32 +0000
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
- [Low] drm/xe: missing Fixes trailer in xe_bo_vm_access() unplug fix
--

commit e933357c9bd9b1d3ece2d7be6b906c17ac2ef57d
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
Since this fixes a missing unplug check in xe_bo_vm_access(), should it
include:

  Fixes: f85dc3c5abdd ("drm/xe: Add xe_bo_vm_access")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119002737.3899=
877-10-umesh.nerlige.ramappa@intel.com?part=3D4
