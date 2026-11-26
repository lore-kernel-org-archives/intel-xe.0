Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97B606A329
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 14:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+BkgDkx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF0510E9AE;
	Thu, 26 Nov 2026 14:13:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB802112445
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 14:13:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AAD0445FF4;
 Thu, 26 Nov 2026 14:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6172F1F0093E;
 Thu, 26 Nov 2026 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795702390;
 bh=Y9d2OGMV5efIOObN2I2XJ1nsNgaJrz+ODS1uRSRBJUQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=e+BkgDkxIUe/4HsdQQPcuOHM748ynzuZ0IIIqjBJcXD+qPQO5tt7ozxswOpPMttez
 T/PGSaBwn3IyNkaxSpRCHqyTayD/KtjHipqFKA94HGYlGaPBxi9qHojos/9gqrlV6q
 NEBaBQAlNwI/zTOOYuNqNq0RkicF2CNRoXUxmjlr3onA4tJFLAKt7nqr3QyTpUZsjF
 WBPVsL+bSujsk7OedDVwzr8ARoho2STJG7SI9uHaIx6uAQf0iwPdpdsLNQzDVYnx/Q
 Npr9Wg3Ds41CLkXXnNdVMC6SuEgff7E4Q1OHRVQ/emjE/0SXrUENGX8UT/OLOm+bgs
 RSBLzHtOtdrVA==
Message-ID: <sashiko-outbox-235678@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 3/6] drm/xe/cper: Add gfp argument to xe_cper_emit()
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126135732.2169939-11-mallesh.koujalagi@intel.com>
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
 <20261126135732.2169939-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 14:13:09 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe/cper: GFP_KERNEL allocation in log_emit_cper() breaks
  atomic callers
--

commit 826dbbb831de269b02c7f7d8232c745e70217854
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/cper: Add gfp argument to xe_cper_emit()

This commit adds a gfp_t parameter to xe_cper_emit() and
xe_cper_emit_counter(), passing GFP_KERNEL from log_emit_cper() and
GFP_ATOMIC | __GFP_NOWARN from log_emit_cper_atomic().

> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 78c114754daa2..c5cc1de4c5076 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -22,7 +22,7 @@ static void log_emit_cper(struct pci_dev *pdev, int cpe=
r_sev, enum xe_sigid sigi
>  				   component, location, data, len, vaf);
> =20
>  	xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
> -		     component, location, data, len, vaf);
> +		     component, location, data, len, vaf, GFP_KERNEL);
>  }

[Severity: High]
Can passing GFP_KERNEL to xe_cper_emit() from log_emit_cper() cause
sleeping allocations in atomic context or invert the fs_reclaim ->
ct->lock lock ordering on platforms with has_driver_cper?

cper_emit_sw_err() previously allocated with GFP_NOWAIT | __GFP_NOWARN,
and several callers of xe_log_err() and xe_log_err_fatal() still run in
atomic or reclaim-restricted contexts.  For example, xe_wedge_declare() is
called from hardirq context via dg1_irq_handler() -> xe_mert_irq_handler()
-> mert_handle_cat_error() -> xe_wedge_declare(), and calls
xe_log_err_fatal().  Similarly, xe_pcode_request() calls
pcode_try_request() -> ... -> pcode_mailbox_status() -> xe_log_err() under
preempt_disable(), and guc_ct_send_locked() and dequeue_one_g2h() call
xe_log_err() while holding ct->lock (which primelockdep() primes under
fs_reclaim_acquire(GFP_KERNEL)).

Later commits in this series ("drm/xe/pagefault: Use xe_log_err_atomic()
for queue full errors" and "drm/xe/guc_ct: Use atomic logging under
ct->fast_lock") convert the pf_queue->lock and ct->fast_lock sites, which
are also broken at this commit, while the xe_wedge_declare(),
pcode_mailbox_status() and ct->lock paths remain unconverted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126135732.2169=
939-8-mallesh.koujalagi@intel.com?part=3D3
