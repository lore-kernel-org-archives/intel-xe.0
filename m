Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14653C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF82410E50A;
	Fri, 11 Sep 2026 04:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z3chL5yd";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F03810E50A
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 04:54:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D6DB411E2;
 Fri, 11 Sep 2026 04:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C909B1F00893;
 Fri, 11 Sep 2026 04:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789102479;
 bh=B0kAQ3XV5A9Td3B/XNtEw7LtIx9rZv3VhmkcTjYWqC4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Z3chL5ydmAikdou0jBLZezjSxMxVcAlzLrM78mjErQY1ccvG9Aw+Obdg3h71ahiA7
 GqwzF1q2qoQKGrf6yYBxO6ddv4QqVCX6ZolAhsa/NUZ3nL/nORLktVKSc8VKAEiEwc
 R2AxspDn0hJ/2oAUmv84HBiiGFDEjzBFSOnjElobZUM7dA4nLMoFd2YhSagTCct4rD
 MOicpMGER6LrrLWSJrp1GyiJFoyqIbSotB63+kLWWmL1FUHWr0RwZVhcWQ656XhqDC
 DQ1SUFjUnOAl++3Xg13a8NQlPKUa0YYNZdm3IYQbEmvl+x2T/b59ppVLVrwS8crLz0
 g0pYjgarIKhjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/xe/i2c: Disable IRQ on unbind
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260911044021.2393342-1-raag.jadav@intel.com>
References: <20260911044021.2393342-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 04:54:38 +0000
Message-Id: <20260911045438.C909B1F00893@smtp.kernel.org>
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

Pre-existing issues:
- [High] The patch attempts to fix a Use-After-Free by disabling the I2C IR=
Q in hardware during `xe_i2c_remove()`, but it leaves multiple UAF vectors =
open: a synchronous UAF in the later devres teardown path due to a dangling=
 `xe->i2c` pointer, and asynchronous UAFs due to missing IRQ synchronizatio=
n and work cancellation.
--

commit 45a43617b8b535b9ff0b0cfa6ca5c0e40ebb1dc5
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/i2c: Disable IRQ on unbind

This commit disables the I2C IRQ explicitly during driver unbind. It
attempts to fix a potential use-after-free if the SGUnit IRQ is hit in the
small window before the IRQ is disabled by the subsystem.

> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index d8fa68206f418..82b22c5412bab 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -324,8 +324,10 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3c=
old)
>  static void xe_i2c_remove(void *data)
>  {
>  	struct xe_i2c *i2c =3D data;
> +	struct xe_device *xe =3D tile_to_xe(i2c->mmio->tile);
>  	unsigned int i;
> =20
> +	xe_i2c_irq_reset(xe);
>  	xe_amc_exit(i2c);

[Severity: High]
This is a pre-existing issue, but does this teardown sequence leave open
a synchronous use-after-free in the devres teardown path?

During driver unbind, devres executes teardown actions in LIFO order. While
xe_i2c_remove() is called here, it fails to set xe->i2c =3D NULL. The memory
for the i2c struct (allocated via devm_kzalloc()) is then freed by devres.

Later in the teardown, the irq_uninstall() devres action executes, leading
to this call chain:

irq_uninstall() -> xe_irq_reset() -> xe_i2c_irq_reset() -> xe_i2c_irq_prese=
nt()

Inside xe_i2c_irq_present(), the dangling pointer is dereferenced:

static bool xe_i2c_irq_present(struct xe_device *xe)
{
	return xe->i2c && xe->i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ &&
		!xe_survivability_mode_is_boot_enabled(xe);
}

Could we prevent this by clearing the pointer here with xe->i2c =3D NULL?

Additionally, is there an asynchronous use-after-free if a concurrent IRQ
handler is executing? Without a call to synchronize_irq(), a concurrent
handler could execute immediately after xe_amc_exit() frees i2c->amc, and
attempt to queue work on the freed memory:

void xe_amc_handle_alert(struct xe_i2c *i2c)
{
	queue_work(system_long_wq, &i2c->amc->work);
}

Would it be appropriate to include synchronize_irq() and perhaps a call to
cancel_work_sync() in this teardown path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911044021.2393=
342-1-raag.jadav@intel.com?part=3D1
