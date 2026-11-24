Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D891606A323
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCq0JPkA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B8A10E5D1;
	Tue, 24 Nov 2026 20:22:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADEE10E0EC
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:22:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5210340F2A;
 Tue, 24 Nov 2026 20:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B556F1F000EB;
 Tue, 24 Nov 2026 20:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795551741;
 bh=MQBE/c3B3NNPS7+xRm4pumv1Y+CCSlMUweGT8IorawA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=gCq0JPkA429g6TWT5gdcwVU6+FPYpCYFHWzHGKQFmYF9KgijYMiqNongE2Qi0vVpd
 G3CfbP6mD4+d/QTB+VXLCstSKS7IF/sI5IHX6pVVDevFVnxHPOMqpA3FnzeGTlGYZV
 U/0gGwIgVRMCmxHj4OgHQTcyZXUPtrwUvLLjyZkK17qLKyrpY89C8Y7a73m9pp91+W
 BMJwOBnfZcDPXVV6Rt6KV6Z9eb9L1KvTvYLXZdQQNF1JDoePg7/ve89KRSMxUXWYsW
 ZthLGG7CG83NQrh1Dwxk+AbOFXfCoYodk//whznI67owvfJmOvAU3pLTEC8hGgIDLD
 I464DbhAMmWQA==
Message-ID: <sashiko-outbox-231987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124201150.405479-13-umesh.nerlige.ramappa@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
 <20261124201150.405479-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 20:22:21 +0000
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
- [Low] drm/xe/oa: missing Fixes trailer for in-flight OA batch drain
  fix
--

commit f18139c5b5da20b0f7f24c8f3ba1b577ddf4950e
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

> drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
>
> Config batches submitted with output syncs and context LRI batches are
> not waited for. If one is still in flight when the stream is closed, it
> can program the OA registers after they were restored.
>
> Both go to the same exec queue, so also record the LRI batch fence in
> stream->last_fence, and wait for it before the HW teardown, bounded by
> the job timeout of the exec queue. Also wait for the LRI batch that
> disables the context save/restore of the OA counters during the HW
> teardown, which covers the stream init error path as well.
>
> A config batch with an input sync that doesn't signal sits in the
> scheduler, where no TDR times it out, and still runs once the sync
> signals, possibly reprogramming the OA config of a later stream. Don't
> kill the exec queue when the wait times out to prevent that: the TDR of
> a killed kernel exec queue resets the GT and can wedge the device.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

[Severity: Low]
This fixes a bug where in-flight LRI and asynchronous config batches were
not waited for before stream teardown.  Should this include:

  Fixes: dddcb19ad4d4 ("drm/xe/oa: Separate batch submission from waiting f=
or completion")
  Fixes: 343dd246fd9b ("drm/xe/oa: Signal output fences")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124201150.4054=
79-9-umesh.nerlige.ramappa@intel.com?part=3D4
