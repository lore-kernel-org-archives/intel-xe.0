Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10847C5DF8C
	for <intel-xe@archiver.kernel.org>; Sun, 23 Aug 2026 10:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3D910E0B6;
	Sun, 23 Aug 2026 10:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LD2DAdaN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F346310E0B6
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Aug 2026 10:30:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A4CB243D90;
 Sun, 23 Aug 2026 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675661F000E9;
 Sun, 23 Aug 2026 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787481032;
 bh=HNzIP3BV/SoyzswctCkOIVpqRFVoX19pwqmVFdKGLq8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LD2DAdaNqBrPUYjKLTMMKQa1ShMcp1r3pVHpOM8TPqB/CtZMZkvgAmlUeL/fttjZO
 q0ZhsWLU6+u1TnKZxNvhqNMJOiXJ47XPyFjOWRvsBDz9xB5b4n2ZxH6p8lE0a+fYDY
 xRZ01/0rPGCXEZzxC2yInXKx9Xd7etGQ/wAhw6pCE1GJqs909wLJ1Qs6Cl/GkrPDag
 7HD3tM+en5B2OBdcUqDjYpEEld4gduYEE5or/zirwYfzqj7vNwlBEYZllqvOjyaE29
 SZ8+3gG69146hTZ454+F8zjuVqtz0kedgsD5EfrJ/SsK9o9NNw0uVM6g7SnsodIzVT
 cM1395DdxrD2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe/i2c: Not for review, Squash of I2C/AMC series
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260823103523.554184-5-badal.nilawar@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
 <20260823103523.554184-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 10:30:31 +0000
Message-Id: <20260823103032.675661F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Interrupt storm due to missing IRQ masking for SMBus Alert.
- [High] Use-After-Free due to dangling pointer and missing synchronization=
 in `xe_amc_exit`.
- [High] `xe_i2c_write` forces `DW_IC_ENABLE` to remain enabled, silently b=
reaking I2C timing configuration.
- [High] Data race on I2C_CONFIG_CMD MMIO register due to non-atomic read-m=
odify-write across contexts.

Pre-existing issues:
- [High] Use-After-Free due to uncancelled asynchronous work during I2C tea=
rdown.
- [High] Missing SR-IOV VF guard in I2C probe allows Virtual Functions to a=
ccess PF-only resources.
--

--- Patch [1]: [PATCH 1/2] drm/xe/i2c: Not for review, Squash of I2C/AMC se=
ries ---
commit 067320578064c382a7fa5cb790273a2f63391cd5
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>

drm/xe/i2c: Not for review, Squash of I2C/AMC series

This commit squashes the I2C and AMC patch series for the Intel Xe driver.
It introduces the Add-In Management Controller (AMC) alert handler and
integrates DesignWare I2C register definitions.

Link: https://patchwork.freedesktop.org/series/168930/

> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_amc.c
[ ... ]
> +static void xe_amc_work(struct work_struct *work)
> +{
[ ... ]
> +	alert_reason =3D response.value;
> +	dev_dbg(&client->dev, "Alert reason: %d\n", alert_reason);
> +
> +out_reassert_interrupt:
> +	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE,=
 0);

[Severity: High]
Does this introduce a data race regression with the hardirq handler?
xe_amc_work() executes in process context, while
xe_i2c_handle_smbus_alert() executes in hardirq context. Both perform an
unprotected xe_mmio_rmw32() on the I2C_CONFIG_CMD register.

Because xe_mmio_rmw32() performs a non-atomic read, bitwise modify, and
write sequence, if the hardirq preempts the workqueue exactly between the
read and write steps, the hardirq's modifications will be clobbered when
the workqueue resumes and writes back its stale value. Does this need
locking or atomic bit operations?

[ ... ]
> +void xe_amc_exit(struct xe_i2c *i2c)
> +{
> +	if (i2c->amc) {
> +		cancel_work_sync(&i2c->amc->work);
> +		kfree(i2c->amc);
> +	}
> +}

[Severity: High]
Can this code leave a dangling pointer that causes a use-after-free
regression? When i2c->amc is freed, the pointer is not set to NULL, and
there is no synchronization with the active IRQ handler.

If an I2C interrupt fires concurrently, xe_i2c_handle_smbus_alert() will
observe i2c->amc as non-NULL and call xe_amc_handle_alert(), which will
execute queue_work() on the freed memory. Should i2c->amc be set to NULL
here, combined with proper IRQ synchronization?

> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
[ ... ]
> +static void xe_i2c_handle_smbus_alert(struct xe_i2c *i2c)
> +{
> +	u32 stat;
> +
> +	stat =3D xe_mmio_read32(i2c->mmio, I2C_REG(DW_IC_SMBUS_INTR_STAT));
> +	if (!stat)
> +		return;
> +
> +	xe_mmio_write32(i2c->mmio, I2C_REG(DW_IC_CLR_SMBUS_INTR), stat);
> +
> +	if (stat & DW_IC_SMBUS_INTR_ALERT && i2c->amc)
> +		xe_amc_handle_alert(i2c);
> +	else
> +		xe_mmio_rmw32(i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
> +}

[Severity: High]
Can this branch cause an interrupt storm regression? The AMC asserts the
level-triggered SMBus Alert line. When the alert is present, this handler
queues a work item via xe_amc_handle_alert(), but does not set
PCI_COMMAND_INTX_DISABLE to mask the INTx at the PCI level.

Since the AMC holds the physical line low until the workqueue runs,
returning from this handler without masking the interrupt will cause the
DW I2C controller to immediately re-assert the interrupt. Would it be safer
to mask the interrupt before returning?

[ ... ]
> @@ -267,8 +258,33 @@ static int xe_i2c_write(void *context, unsigned int =
reg, unsigned int val)
>  {
>  	struct xe_i2c *i2c =3D context;
> =20
> -	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
> +	switch (reg) {
[ ... ]
> +	case DW_IC_ENABLE:
> +		i2c->ic_enable =3D val;
> +		/* Other fields can be updated except the enable bit. */
> +		val |=3D DW_IC_ENABLE_ENABLE;
> +		break;

[Severity: High]
Does forcing this enable bit to 1 introduce a regression that silently
breaks the I2C timing configuration?

The DesignWare core driver configures I2C timings (such as
DW_IC_SS_SCL_HCNT), which strictly requires the controller to be disabled
first. It attempts to disable the controller by writing 0 to DW_IC_ENABLE.

However, by intercepting this write and forcing DW_IC_ENABLE_ENABLE to 1,
the controller remains enabled. Will the hardware silently ignore all
subsequent writes to the timing registers because of this?

[ ... ]
> @@ -310,12 +326,15 @@ static void xe_i2c_remove(void *data)
>  	struct xe_i2c *i2c =3D data;
>  	unsigned int i;
> =20
> -	for (i =3D 0; i < XE_I2C_MAX_CLIENTS; i++)
> +	xe_amc_exit(i2c);
> +
> +	for (i =3D 0; i < XE_I2C_MAX_CLIENTS; i++) {
>  		i2c_unregister_device(i2c->client[i]);
> +		i2c->client[i] =3D NULL;
> +	}
> =20
>  	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
>  	xe_i2c_unregister_adapter(i2c);
> -	xe_i2c_remove_irq(i2c);
>  }

[Severity: High]
This isn't a regression introduced by this patch, but does this function
leave asynchronous work uncancelled during I2C teardown?

The I2C bus notifier schedules i2c->work (xe_i2c_client_work)
asynchronously, but this teardown function unregisters the notifier and
adapter without calling cancel_work_sync(&i2c->work). Since the devres
managed i2c structure is freed shortly after, could a pending work
execution access freed memory if it runs after this completes?

[ ... ]
> @@ -363,22 +382,18 @@ int xe_i2c_probe(struct xe_device *xe)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D xe_i2c_create_irq(xe);
> -	if (ret)
> -		goto err_unregister_notifier;
> -
>  	ret =3D xe_i2c_register_adapter(i2c);

[Severity: High]
This isn't a regression introduced by this patch, but does this function
lack the required SR-IOV Virtual Function (VF) guard before accessing
hardware?

A Virtual Function attempting to load the driver will call xe_i2c_probe(),
which accesses PF-only I2C controller MMIO resources and registers devices.
Without an IS_SRIOV_VF(xe) early return check, can this lead to hardware
failures, MMIO timeouts, or incorrect driver behavior in an unprivileged
VF context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823103523.5541=
84-4-badal.nilawar@intel.com?part=3D1
