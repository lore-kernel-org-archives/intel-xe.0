Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F2606A33B
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dckRz6yj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123BE10E83E;
	Sat, 21 Nov 2026 02:11:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE7710E83E
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 02:11:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A6F6044695;
 Sat, 21 Nov 2026 02:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4C31F000C0;
 Sat, 21 Nov 2026 02:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795227093;
 bh=AFXyW9jqQwWhoAiIyKCvjJSzzXHKX294ZiDWRozOUOs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=dckRz6yjrIKR3G/AumlEkDbBLKt8Ff04wX8iF2JYjKv+cOdk/Yj36M4uIuAllAuHv
 XHEVWlmY/5sGQXwZBmdZeYY/QNZv+O2rurvIX1V88E8dmMHXCP/GxzDs1PwK08e7re
 VehlE5bJsKpbKYzWqWoMMlUDJ+31DkComSu12uxioMOFg+tv6d5u9UUe9Akd5oAG84
 IVE8FZermG/XQciQT9eETrqtXdG8Pu4UZfcmlBdvHWF92YYhA3qKhzigVtR2c7de+A
 Ftmhy3txj8JL2vOOug5LeKNZ03WjvzItXKtXvvW8VOZ4O6MKj1tZY60cV49VdLqIs5
 84H3KUripwbyw==
Message-ID: <sashiko-outbox-226541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261121020145.147384-13-umesh.nerlige.ramappa@intel.com>
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
 <20261121020145.147384-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 02:11:32 +0000
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

commit 115bf9f1b769e2b40c1b9a0296a4a3bbf04bb581
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
> Reviewed-by:=C2=A0 Shekhar Chauhan <shekhar.chauhan@intel.com>

[Severity: Low]
Commit dddcb19ad4d4 ("drm/xe/oa: Separate batch submission from waiting for
completion") dropped the synchronous wait from xe_oa_submit_bb(), leaving
context LRI batches submitted by xe_oa_load_with_lri() unwaited, and commit
343dd246fd9b ("drm/xe/oa: Signal output fences") made OA config batches
submitted with output syncs complete asynchronously without waiting for
stream->last_fence before tearing down OA hardware state.

Should this bug fix include Fixes tags for those commits:

  Fixes: dddcb19ad4d4 ("drm/xe/oa: Separate batch submission from waiting f=
or completion")
  Fixes: 343dd246fd9b ("drm/xe/oa: Signal output fences")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121020145.1473=
84-9-umesh.nerlige.ramappa@intel.com?part=3D4
