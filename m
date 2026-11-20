Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268260A2601
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MN2ZAVNy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B49910E1B8;
	Fri, 20 Nov 2026 14:03:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0910E1B8
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 14:03:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6AA9F442E0;
 Fri, 20 Nov 2026 14:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0431F000C0;
 Fri, 20 Nov 2026 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795183423;
 bh=wi2rz1aAGqnhceGWcXKS6GEjYsuxpH/c85SrNsQyuNg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MN2ZAVNy/hX53O+RpCf6RDt+twMfbR/ILCs2+TLqpMkwiUr4ef8qgws77mqTYr3be
 +fED5QXlWA9uSt5P2qB6QMo/LjyYauey3sBK/qMhHIx8Zkvx/lcDLvEfCRcOAfJr2e
 W4JEB9KDNpCtwKJsbenIwl+TLd2oQIof7ch9OUYUjfdbzPai0Py3TItISr/v+ZAYmV
 7lcZ0vDZpKHu53iokTfldXUeMvW1hBGW5zV8tCxedMBogAepn76urvPUdtB4uYjeRS
 Y5k3/Twb8ebenMkCs8Y4J62rIUtgJ32CzrDQe4kKHCuhhYycYq8FlV/z3wbgC1IdCZ
 3QIyrJjtpFk2w==
Message-ID: <sashiko-outbox-225315@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] drm/xe/userptr: Make the repin retry loop non-fatal
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261120-userptr-repin-v2-5-65e1f6e582ef@intel.com>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
 <20261120-userptr-repin-v2-5-65e1f6e582ef@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:03:42 +0000
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
- [Medium] drm/xe/userptr: stale uvma->userptr.repin causes premature
  timeout after retry abort
--

commit 90fc6239c153f6d32105ac91a7723de6506c06a9
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe/userptr: Make the repin retry loop non-fatal

This commit converts -EBUSY from drm_gpusvm_get_pages() during userptr repin
into -EAGAIN until an overall repin timeout expires, discounting idle gaps
between retry attempts.

> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_user=
ptr.h
> index 2a3cd1b5efbb0..179f2aca26a39 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h

[ ... ]

> +static inline void xe_userptr_repin_begin(struct xe_userptr_repin *repin)
> +{
> +	unsigned long now =3D jiffies;
> +
> +	if (!repin->start) {
> +		repin->start =3D now ?: 1;
> +		return;
> +	}
> +
> +	if (repin->last &&
> +	    time_after(now, repin->last +
> +		       msecs_to_jiffies(XE_USERPTR_REPIN_IDLE_MS)))
> +		repin->start =3D (repin->start + (now - repin->last)) ?: 1;
> +	repin->last =3D 0;
> +}

[Severity: Medium]
Can an aborted retry sequence leave stale timestamps in
uvma->userptr.repin and cause a later repin to time out early?

xe_vma_userptr_pin_pages() only zeroes uvma->userptr.repin when the repin
completes or its timeout expires.  If the caller's retry loop aborts after
receiving -EAGAIN, such as when xe_exec_ioctl() returns -ERESTARTSYS on a
pending signal or DRM_XE_VM_BIND_OP_PREFETCH hits its outer repin timeout
in xe_vm_bind_ioctl(), uvma->userptr.repin keeps its non-zero start and
last timestamps.

On a separate repin of that VMA after XE_USERPTR_REPIN_IDLE_MS,
xe_userptr_repin_begin() treats the elapsed time as an idle pause in the
earlier loop and advances repin->start only by (now - repin->last).  That
deducts the prior attempt's accrued duration (repin->last - repin->start)
from the new attempt's timeout budget, which can make the next repin fail
with -EBUSY after a single drm_gpusvm_get_pages() call and kill the VM in
the rebind worker.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-userptr-re=
pin-v2-0-65e1f6e582ef@intel.com?part=3D5
