Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA023C88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 12:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6134D10F595;
	Fri, 11 Sep 2026 12:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UrF2+1NH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B68B10F595
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 12:31:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DD799400BB;
 Fri, 11 Sep 2026 12:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9DB1F000FF;
 Fri, 11 Sep 2026 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789129911;
 bh=iAH0L+0DbdgH3t6a6eWhMP0azq2fuUjtxXgPHrWnT/I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UrF2+1NHSoil8cx8sjnyykKmWIiKyPilSJGvvPWRZqzFaL0RyqXtUPMi90zmGQru4
 CRKDtjDZqb8cerFBm8SDJufMeGCyqTZodJujoU+bPOMFtn2S6E2G13rNxkq8tgdfWF
 RitKU/myNbwVRxbuGH5GapuCKn8n7O/d/spPcM5hrh309Na9hGm64196FhLbze7ZQ8
 nsl6Kfrp05c3VWIgateMOPBO9e9ekZQUYg58R977/NZmCdlcIZYbPtxRpcvY+7GmzS
 GPQk5FKDFYwSZ+7+Djaz2dOyzm4QGEdA8lWqcrmd+zweJDiEvDLyxpv5MJVZAi71V8
 DX/So2dJL22mA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/i2c: Disable IRQ on unbind
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260911121547.2407261-1-raag.jadav@intel.com>
References: <20260911121547.2407261-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 12:31:51 +0000
Message-Id: <20260911123151.9F9DB1F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Disabling I2C interrupts before flushing work or unregistering I=
2C clients causes subsequent I2C transfers to time out and fail.

Pre-existing issues:
- [High] The patch attempts to fix a Use-After-Free (UAF) by explicitly dis=
abling the I2C IRQ in `xe_i2c_remove()`, but it fails to wait for already-e=
xecuting IRQ handlers, leaving a critical race window open that leads to a =
UAF of `i2c->amc`.
- [High] Missing cancellation of `i2c->work` in `xe_i2c_remove()` leads to =
a Use-After-Free of the `i2c` structure.
- [High] Dangling `xe->i2c` pointer on `xe_i2c_probe()` error paths leads t=
o a UAF during probe failure teardown.
--

commit 3fffddfb454e12e0901f531980c05e733fae1cc6
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/i2c: Disable IRQ on unbind

This commit attempts to fix a potential use-after-free in the unbind path by
explicitly disabling the I2C IRQ in xe_i2c_remove() before struct xe_i2c
is freed. It resets the I2C interrupt and clears the xe->i2c pointer.

> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index d8fa68206f418..51ca9fb73b708 100644
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

[Severity: Medium]
Does disabling I2C interrupts before flushing work or unregistering clients
cause active I2C transfers to time out?

If xe_amc_work() is currently running and attempting an i2c_master_send(),
or if i2c_unregister_device() invokes client remove callbacks that perform
I2C transfers, the underlying designware I2C driver will wait for an interr=
upt
that never arrives. This could delay unbind by timing out and potentially
leave the hardware in an incorrect state.

>  	xe_amc_exit(i2c);

[Severity: High]
This is a pre-existing issue, but does xe_i2c_irq_reset() guarantee that an
already-executing IRQ handler has finished?=20

Without a synchronization barrier like synchronize_irq(), CPU0 could be
handling an interrupt in xe_i2c_handle_smbus_alert(), while CPU1 executes
xe_i2c_remove() and calls xe_amc_exit(i2c) to free i2c->amc.=20

If CPU0 then proceeds to evaluate the freed i2c->amc pointer:

xe_i2c_handle_smbus_alert(struct xe_i2c *i2c)
{
	...
	if (stat & DW_IC_SMBUS_INTR_ALERT && i2c->amc)
		xe_amc_handle_alert(i2c);
}

Could this still result in a use-after-free and memory corruption?

> =20
>  	for (i =3D 0; i < XE_I2C_MAX_CLIENTS; i++) {
> @@ -335,6 +337,7 @@ static void xe_i2c_remove(void *data)
> =20
>  	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
>  	xe_i2c_unregister_adapter(i2c);
> +	xe->i2c =3D NULL;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but should there be a call to
cancel_work_sync(&i2c->work) here to ensure any pending worker is stopped
before the memory is freed?

The notifier schedules i2c->work, but when xe_i2c_remove() unregisters
the notifier, it doesn't flush pending work. Since i2c is managed by devres
(devm_kzalloc), it will be freed shortly after xe_i2c_remove() returns. If
xe_i2c_client_work() executes after this, it will access the freed i2c
memory:

xe_i2c_client_work() {
	struct xe_i2c *i2c =3D container_of(work, struct xe_i2c, work);
	...
	i2c->client[XE_I2C_CLIENT_AMC] =3D i2c_new_client_device(...);
}

[Severity: High]
This is also a pre-existing issue, but in xe_i2c_probe(), the xe->i2c point=
er
is assigned before initialization is complete:

xe_i2c_probe() {
	...
	xe->i2c =3D i2c;
	...
	ret =3D xe_i2c_register_adapter(i2c);
	if (ret) {
		bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
		return ret;
	}
	...
}

If xe_i2c_register_adapter() fails, multiple error paths return without
clearing xe->i2c. Since the IRQ handler is already active and the i2c memory
is managed by devm and will be freed, could an incoming hardware interrupt
trigger a use-after-free when xe_i2c_irq_handler() calls
xe_i2c_handle_smbus_alert(xe->i2c)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911121547.2407=
261-1-raag.jadav@intel.com?part=3D1
