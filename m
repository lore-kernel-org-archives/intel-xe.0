Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A148606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RoWHLrnU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C091E10E8C0;
	Tue, 24 Nov 2026 20:35:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489A310E699
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:35:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0D04C432E3;
 Tue, 24 Nov 2026 20:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12811F000C4;
 Tue, 24 Nov 2026 20:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795552522;
 bh=afaz2oMtqPdMzDuvQcJOJjmXxirkrNLz6uNUrodFViU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=RoWHLrnU9N9oEeDWxteAuDZm5pvRrOh823544kmSAmXfYZi6Gb1RalqYTC7fy3v9n
 VeOIzcz5RXr/aM3d7WTqpnJPi+Td5evagTRLX1wadnh9KPMNhZjTWEJzr/XGd6G9lS
 Dwvqmyl7zPWx+9fSvljEUOTBHGPt3JYlqYommeLn/2x8LJFyTA8Mq2sgjvD9E3bGgY
 1R0IuLRfndQ23QJZcSGJFxMM+a+F+CN5yNYIkJFKP2tC7Edso9k5jzM9uZiKKmsJmw
 f4Pk1msmo0U8cHROVYaMM1dfqlCW6J4HxFSvWhELWEZpYT22OSCsL4QBy3TyxsAkC4
 MsI3bDFJnuxyA==
Message-ID: <sashiko-outbox-231992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/7] drm/xe/oa: Fence OA ioctls and mmap against
 device unplug and wedging
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124201150.405479-14-umesh.nerlige.ramappa@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
 <20261124201150.405479-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 20:35:22 +0000
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
- [Medium] drm/xe/oa: unlocked xe_wedged() check and batch submission on
  wedged device
--

commit f0e81809543121dd60748a7d8cd0758e2b8d3805
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Fence OA ioctls and mmap against device unplug and wedging

This commit guards OA ioctls and stream mmap with drm_dev_enter(), fails
stream fd ioctls on a wedged device, and stops waiting for or submitting
certain OA batches once the device is unplugged or wedged.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 7241cf18b3252..9ce96cac3bf67 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
[ ... ]
> @@ -1722,11 +1741,20 @@ static long xe_oa_ioctl(struct file *file,
>  			unsigned long arg)
>  {
>  	struct xe_oa_stream *stream =3D file->private_data;
> -	long ret;
> +	struct xe_device *xe =3D gt_to_xe(stream->gt);
> +	long ret =3D -ECANCELED;
> +	int idx;
> =20
> -	mutex_lock(&stream->stream_lock);
> -	ret =3D xe_oa_ioctl_locked(stream, cmd, arg);
> -	mutex_unlock(&stream->stream_lock);
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (!xe_wedged(xe)) {
> +		mutex_lock(&stream->stream_lock);
> +		ret =3D xe_oa_ioctl_locked(stream, cmd, arg);
> +		mutex_unlock(&stream->stream_lock);
> +	}

[Severity: Medium]
Can an ioctl waiting on stream->stream_lock still run on a wedged device
because xe_wedged(xe) is checked before mutex_lock(&stream->stream_lock)?

If one thread holds stream_lock in xe_oa_emit_oa_config() and a second
thread calls xe_oa_ioctl(), the second thread passes !xe_wedged(xe) and
blocks on stream_lock.  When the device wedges, the first thread breaks
out of its wait loop and releases stream_lock, allowing the second thread
to run xe_oa_ioctl_locked() on the wedged device.

The same issue occurs in xe_oa_stream_open_ioctl(), where xe_wedged() is
only checked on entry to xe_drm_ioctl() before acquiring gt_lock or
allocating the OA buffer.  Neither xe_oa_configure_oa_context() nor
xe_oa_emit_oa_config() checks xe_wedged() before calling
xe_oa_submit_bb(), so an open or config ioctl that was already in flight
when the device wedged still submits batches to stream->exec_q or
stream->k_exec_q (which on a long-running queue without TDR will never
complete and will keep the queue alive), and when output syncs are passed
(num_signal > 0), xe_oa_emit_oa_config() skips the wait loop and returns 0
on a wedged device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124201150.4054=
79-9-umesh.nerlige.ramappa@intel.com?part=3D5
