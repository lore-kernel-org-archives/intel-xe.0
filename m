Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD80606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0y8oxDO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3DA10E24A;
	Fri, 27 Nov 2026 06:31:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAB310E24A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 06:30:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 620B840752;
 Fri, 27 Nov 2026 06:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F971F000C1;
 Fri, 27 Nov 2026 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795761056;
 bh=enBT+2LHkg4M30si8N/RZDUNpHv80WTg/BSwrLU/33Y=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=J0y8oxDOUI5t13lv+sPe5NB5LHo1mZBqLfu49WyeQTUTGSLZMdqceYcKEBu6N4xat
 T0W1vtbBgm7LQHJN14/48R576kR+9wVBI0m41eagrtUSa8MVwBz/pYmazRKGxrulsW
 BBPvypd62KIMJYWERtbP6+EfJpROPil4qrLOC5EOt7HKDC3Utcl17UG7sEon2sWhcJ
 rtuSbUippginkhil+1NuXk2xCT90rByGUdbuWaRfMrf++3jTnclWar49zrpUI/WQ3v
 jbFEIQYCR9LSriUpK4AlYURXwGJz4mk5IHLqPD9qs/IwWv1hsAG6qFMAJFimwm/Rvs
 2YdVHh1rv7eMQ==
Message-ID: <sashiko-outbox-236738@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] drm/xe/i2c: Expose AMC alert reason through sysfs
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261127061333.1019047-11-badal.nilawar@intel.com>
References: <20261127061333.1019047-7-badal.nilawar@intel.com>
 <20261127061333.1019047-11-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 06:30:55 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe/amc: sysfs attribute name mismatch with ABI
  documentation
- [Low] drm/xe/amc: missing memory barriers between alert_reason and
  alert_seen
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] drm/xe: use-after-free in xe_amc_handle_alert() [1]
--

commit b8f40abebebf63a2b3f28d9c10f02b5465a7edf7
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/i2c: Expose AMC alert reason through sysfs

This commit exposes the most recent AMC alert reason through a read-only
device sysfs attribute and documents the new ABI.

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Docume=
ntation/ABI/testing/sysfs-driver-intel-xe-amc
> new file mode 100644
> index 0000000000000..8c2731cfa91c9
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> @@ -0,0 +1,24 @@
> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index b0e9250fa9719..a619346a3451b 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c

[ ... ]

> @@ -107,6 +110,50 @@ static const struct amc_request amc_get_alert_reason=
 =3D {
>  	},
>  };
> =20
> +/**
> + * DOC: AMC Alert Reason
> + *
> + * Expose the most recent AMC alert reason through device sysfs.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
> + * specification.
> + */
> +
> +static enum xe_amc_alert amc_alert_reason(struct xe_amc *amc)
> +{
> +	return READ_ONCE(amc->alert_reason);
> +}
> +
> +static ssize_t amc_alert_reason_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_amc *amc =3D xe->i2c->amc;
> +	enum xe_amc_alert alert_reason;
> +
> +	if (!READ_ONCE(amc->alert_seen))
> +		return sysfs_emit(buf, "none\n");
> +
> +	alert_reason =3D amc_alert_reason(amc);
> +
> +	return sysfs_emit(buf, "%s\n", amc_alert[alert_reason]);
> +}
> +static DEVICE_ATTR_RO(amc_alert_reason);

[Severity: Medium]
Should the sysfs attribute name match the ABI documentation?
DEVICE_ATTR_RO(amc_alert_reason) creates "amc_alert_reason", whereas
Documentation/ABI/testing/sysfs-driver-intel-xe-amc documents
"xe_amc_alert_reason", so userspace tools looking up the documented path
will fail with -ENOENT.

[ ... ]

> @@ -156,11 +203,15 @@ static void xe_amc_work(struct work_struct *work)
>  	}
> =20
>  	alert_reason =3D response.value;
> -	dev_dbg(&client->dev, "Alert reason: %d\n", alert_reason);
> +	dev_dbg(&client->dev, "Alert reason: %u\n", (unsigned int)alert_reason);
> =20
>  out_reassert_interrupt:
>  	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE,=
 0);
> =20
> +	WRITE_ONCE(amc->alert_reason, alert_reason < ARRAY_SIZE(amc_alert) ?
> +		   alert_reason : AMC_ALERT_UNKNOWN);
> +	WRITE_ONCE(amc->alert_seen, true);

[Severity: Low]
Can amc_alert_reason_show() observe amc->alert_seen as true before the
store to amc->alert_reason becomes visible on weakly-ordered architectures?

READ_ONCE() and WRITE_ONCE() do not enforce CPU memory ordering across
distinct variables, so a concurrent sysfs read racing with the first alert
can transiently read the initial zero value (AMC_ALERT_UNKNOWN) and report
"unknown" instead of "none" or the actual reason.  Pairing
smp_store_release(&amc->alert_seen, true) with
smp_load_acquire(&amc->alert_seen) would order the accesses.

[ ... ]

> @@ -202,13 +255,21 @@ int xe_amc_init(struct xe_i2c *i2c)
>  	i2c->amc =3D amc;
>  	amc->i2c =3D i2c;
> =20
> -	return 0;
> +	ret =3D amc_create_alert_sysfs(i2c);
> +	if (ret) {
> +		kfree(i2c->amc);
> +		i2c->amc =3D NULL;
> +	}
> +
> +	return ret;
>  }
> =20
>  void xe_amc_exit(struct xe_i2c *i2c)
>  {
>  	if (i2c->amc) {
> +		amc_remove_alert_sysfs(i2c);
>  		cancel_work_sync(&i2c->amc->work);
>  		kfree(i2c->amc);
> +		i2c->amc =3D NULL;
>  	}
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but can xe_amc_exit() race
with an in-flight SMBus alert interrupt and cause a use-after-free in
xe_amc_handle_alert() [1]?

In xe_i2c_remove(), xe_i2c_irq_reset() disables hardware interrupts and
immediately calls xe_amc_exit() without waiting for in-flight interrupt
handlers to finish:

drivers/gpu/drm/xe/xe_i2c.c:xe_i2c_handle_smbus_alert() {
	...
	if (stat & DW_IC_SMBUS_INTR_ALERT && i2c->amc)
		xe_amc_handle_alert(i2c);
}

CPU0                              CPU1
xe_i2c_remove()
  xe_i2c_irq_reset()
                                  xe_i2c_handle_smbus_alert()
                                    if (... && i2c->amc)
  xe_amc_exit()
    cancel_work_sync(&i2c->amc->work)
    kfree(i2c->amc)
    i2c->amc =3D NULL
                                      xe_amc_handle_alert()
                                        queue_work(..., &i2c->amc->work)
                                          <-- use-after-free

Queuing the freed work_struct corrupts the workqueue lists and crashes the
kernel.  Synchronizing the IRQ after xe_i2c_irq_reset() before running
xe_amc_exit() would prevent the handler from racing with teardown.

[1] https://sashiko.dev/#/bug/linux-e2bb2e7e-d158-4981-a226-338921893668

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127061333.1019=
047-7-badal.nilawar@intel.com?part=3D4
