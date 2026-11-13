Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E151606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqVcOrdN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9F710E37B;
	Fri, 13 Nov 2026 07:49:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7787710E37B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 07:48:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 599D361412;
 Fri, 13 Nov 2026 07:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C321F000C4;
 Fri, 13 Nov 2026 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794556135;
 bh=07cRVEdsbPaygPNzNDGdknfH8UEiFMsObseTlDAOs/A=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KqVcOrdNcXPrU09KQr0Mzuw2xqvX+mIwPp4BtqDgSWdadY5sJSYLlF95VmxvemYFs
 g8OIiUQiPh3sJNy+aYHBpP8hgdZfqBRh9MpI9geVZ9qCckDw/pmuDULYB3/zbgVCn7
 a4yF/zbPXu/n1Q8qJvOfMkl7tl53McH9uuK8MYYVWimTBj16Q4XaCk1CClR6Ux5Tom
 it4sjLaV8dLDITTl0kBX1gnyM8q8gxo+8SBWfec6MaXLZ/y8HdDCInGNmDLZXVgfy7
 hCm+zw5vVT5kxF72gGTLgeVO5pAR7nwGGMdADpMIfF0M630VsNdkatqWCoqa3FvHyv
 5AbuopuEF6Sow==
Message-ID: <sashiko-outbox-212369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] CI_ONLY: Hold a device reference across deferred VM
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261113073549.352746-2-arvind.yadav@intel.com>
References: <20261113073549.352746-1-arvind.yadav@intel.com>
 <20261113073549.352746-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:48:54 +0000
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
- [Low] drm/xe: missing Fixes trailer and truncated CI_ONLY commit
  subject
--

commit 5dc8382fd711cc6e72eaaab388a621fd70e80c06
Author: Arvind Yadav <arvind.yadav@intel.com>

> CI_ONLY: Hold a device reference across deferred VM
>
> xe_vm_free() queues vm_destroy_work_func() and returns.
> drm_gpuvm_free() then drops its device reference, but the worker
> still accesses device state while finishing VM destruction.
>
> Take a device reference before queueing the work and release it
> after the worker has finished using the device.
>
> Run the worker on the module-lifetime destroy workqueue. Releasing
> the last device reference can call xe_device_destroy(), which drains
> xe->destroy_wq. Running on that per-device workqueue would make the
> worker wait for itself.
>
> v3:
> - Move final VM destruction to the module-lifetime destroy workqueue
>   in this patch to avoid self-deadlock on the last device put. (Sashiko)
>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

[Severity: Low]
Since this fixes a device-lifetime bug in deferred teardown, should the
commit message include a Fixes tag?

  Fixes: 61e18525023a ("drm/xe: Route deferred xe_vma/xe_vm teardown off sy=
stem_dfl_wq")

Also, the subject line still carries a test prefix instead of "drm/xe:" and
is cut off at the end.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113073549.3527=
46-1-arvind.yadav@intel.com?part=3D1
