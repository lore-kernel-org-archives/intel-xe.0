Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6631DCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 14:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D81110EF0F;
	Tue, 29 Sep 2026 14:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="isfwam8G";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F9710EF0F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 14:41:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B011340051;
 Tue, 29 Sep 2026 14:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C6C1F000FF;
 Tue, 29 Sep 2026 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790692866;
 bh=YopBdjLKI1jWPIRT2sCRGHWrsBldtoVyDuhyStrbDkA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=isfwam8GlkMBXUOG2K4UrU/XhR2j6woZfglMmri7CiBzmUE2CVMGWKIymSm6GmjkC
 oGz8E8s3IFEUnpODckUHXlegDL5WqcHBhryCxP99LMHnAZ+HeoEVPGvdl4z8ghMH7r
 cRzaadLx7rEX9JnXceElXrvL12++jbwcGoUq4Of2Sp/FDGJJB0q8NK4wiHE1tksrOE
 Or9efMwRDApOghjUt20CHQZpLSYoLLRbpK9g+QL2rjBfOXW4tNMtkvwEoXi3A3+W7q
 eDEdA0REkFq4zaGC0dIB4YYGv/bilEKZPFh7u3Iz3ekKh7hgaoIO7ERdTcYxjZvMWU
 LgXTjL+/5NEsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] drm/xe: Don't unload the driver until all drm
 devices are freed
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260929142910.47480-2-thomas.hellstrom@linux.intel.com>
References: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
 <20260929142910.47480-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 14:41:05 +0000
Message-Id: <20260929144106.68C6C1F000FF@smtp.kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] xe: module unload race causing instruction page fault in xe_device=
_destroy()
--

commit 4a4203d8cd4165e1a99345416f131e7eafe530d1
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Don't unload the driver until all drm devices are freed

This commit introduces a device count and a module exit hook to wait
until all bare drm_device references are freed before unloading the xe
module. It uses a 20-second timeout with wait_var_event_timeout() to
block rmmod from unloading while devices remain active.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c

[ ... ]

> @@ -391,6 +394,9 @@ static void xe_device_destroy(struct drm_device *dev,=
 void *dummy)
>  		destroy_workqueue(xe->destroy_wq);
> =20
>  	ttm_device_fini(&xe->ttm);
> +
> +	if (atomic_dec_and_test(&xe_device_count))
> +		wake_up_var(&xe_device_count);

[Severity: High]
Does this wake up the rmmod thread while still executing inside module text?
If the thread executing xe_device_destroy() is preempted immediately after
wake_up_var(), rmmod can complete the module exit sequence and unmap the
xe module text. When the preempted thread resumes, it might attempt to
execute the function epilogue in unmapped memory, potentially causing an
instruction page fault.

>  }
> =20
>  /**

[ ... ]

> @@ -1501,3 +1508,25 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_devic=
e *xe, u32 asid)
> =20
>  	return vm;
>  }
> +
> +/**
> + * xe_device_exit() - Device subsystem exit function.
> + *
> + * Exit function to be called at module unload time.
> + */
> +void xe_device_exit(void)
> +{
> +	/*
> +	 * Wait for all devices to be freed. 20s is well above the typical
> +	 * maximum dma_fence signalling time, so warn and keep waiting if
> +	 * we're still not done by then, since it may indicate a leaked
> +	 * xe_device reference is stalling module unload.
> +	 */
> +	if (!wait_var_event_timeout(&xe_device_count,
> +				    !atomic_read(&xe_device_count),
> +				    HZ * 20)) {

[Severity: High]
Is there a risk that the rmmod thread waiting here proceeds to exit and unm=
ap
the module before the waker has safely exited xe_device_destroy()? Once
awoken, this thread is unaware that the waker is still executing in module
text.

> +		pr_warn("%s: Waiting for %d xe device(s) to be freed before unloading.=
\n",
> +			DRIVER_NAME, atomic_read(&xe_device_count));
> +		wait_var_event(&xe_device_count, !atomic_read(&xe_device_count));
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929142910.4748=
0-1-thomas.hellstrom@linux.intel.com?part=3D1
