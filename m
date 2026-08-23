Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A164C5DF8C
	for <intel-xe@archiver.kernel.org>; Sun, 23 Aug 2026 10:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CB910E008;
	Sun, 23 Aug 2026 10:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bFePM8++";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04C10E008
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Aug 2026 10:29:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C10660008;
 Sun, 23 Aug 2026 10:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812621F000E9;
 Sun, 23 Aug 2026 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787480956;
 bh=iHn+Ooi1Hj26/oR3vF4a2qcQTaXcAY06SyZA2vn7eZY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bFePM8++FpdXZtGhQ8XNimnQOO32vPqmHGIL+GODXNvSTS7HsW8Em3R+nlvchyv0I
 I5SFjqeKwvLS3EY5lxUd+ejC1aQ9UMIFZz+li1PmOxQi9W2wSDyaz/2092Ntrpz2lY
 ivARvUkHPHeyGYE5Td64ZEHxxq0WARHaLsK++PBtQmvBB4G71jPxlWp0gLMBumzHrR
 zSuRYNPZ7dJjw1KA3nQQAKL1OI3l9ojraoUxSbgnFZ8317v9L1NyQ3WBqUjhlT1loV
 kklyz8POK48TjB1CawhH1EtNQ2V5QtZhAo2Zgw0gRWFpwO5A07OtLu3D1iRTluWmQ6
 3d+BsrpJ6k0Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe/i2c: Expose AMC Alert reason sysfs
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260823103523.554184-6-badal.nilawar@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
 <20260823103523.554184-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 10:29:16 +0000
Message-Id: <20260823102916.812621F000E9@smtp.kernel.org>
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
- [High] NULL or ERR_PTR dereference in `xe_amc_exit` causing kernel panic.
- [Medium] Race condition (TOCTOU) between uevent emission and sysfs attrib=
ute creation.
- [Low] Spurious error message logged on successful sysfs file creation due=
 to a missing return.

Pre-existing issues:
- [High] Use-After-Free (UAF) due to un-canceled asynchronous work during t=
eardown.
--

--- Patch [2]: [PATCH 2/2] drm/xe/i2c: Expose AMC Alert reason sysfs ---
commit c923eec141de210a872cc999c40aa460aad20d6f
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/i2c: Expose AMC Alert reason sysfs

AMC raises an SMBUS alert before performing a power removal or power-cycle
operation, and the driver places the device into vendor-specific wedge mode.
This commit exposes a read-only xe_amc_alert_reason sysfs attribute to help
users identify the required recovery action.

> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index 8ecadee6eea39..ceb2c4d618fef 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
[ ... ]
> @@ -104,6 +107,54 @@ static const struct amc_request amc_get_alert_reason=
 =3D {
[ ... ]
> +static void xe_create_amc_alert_sysfs(struct xe_device *xe)
> +{
> +	struct device *dev =3D xe->drm.dev;
> +	int ret;
> +
> +	if (xe->i2c->amc->sysfs_created)
> +		return;
> +
> +	ret =3D device_create_file(dev, &dev_attr_xe_amc_alert_reason);
> +	if (ret)
> +		goto failed;
> +
> +	xe->i2c->amc->sysfs_created =3D true;
> +failed:
> +	dev_err(dev, "Failed to create sysfs file for amc alert reason\n");
> +}

[Severity: Low]
Is this error message printed even when the sysfs file is successfully crea=
ted?
It looks like there is a missing return statement before the failed label,
causing the code to fall through to dev_err() on success.

[ ... ]
> @@ -158,10 +209,16 @@ static void xe_amc_work(struct work_struct *work)
>  	case AMC_ALERT_THERMAL_TRIP:
>  	case AMC_ALERT_OOB_REQUEST:
>  	case AMC_ALERT_OOB_RESET:
> -	case AMC_ALERT_CATERR:
> +	case AMC_ALERT_CATERR: {
> +		struct xe_device *xe =3D i2c_client_to_xe_device(client);
> +
>  		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]=
);
> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +		amc->alert_reason =3D alert_reason;
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> +		xe_device_declare_wedged(xe);
> +		xe_create_amc_alert_sysfs(xe);

[Severity: Medium]
Could this create a race condition with userspace?

xe_device_declare_wedged() emits a KOBJ_CHANGE uevent. If userspace reacts
to the uevent instantly, it might check the sysfs directory before
xe_create_amc_alert_sysfs() completes, resulting in a -ENOENT error when
trying to read the alert reason.

>  		break;
> +	}
>  	default:
>  		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
>  		break;
> @@ -190,8 +247,12 @@ int xe_amc_init(struct xe_i2c *i2c)
> =20
>  void xe_amc_exit(struct xe_i2c *i2c)
>  {
> +	struct xe_device *xe;
> +
>  	if (i2c->amc) {
>  		cancel_work_sync(&i2c->amc->work);
> +		xe =3D i2c_client_to_xe_device(i2c->client[XE_I2C_CLIENT_AMC]);

[Severity: High]
Can i2c->client[XE_I2C_CLIENT_AMC] be NULL or an ERR_PTR here?

The I2C client is populated asynchronously in xe_i2c_client_work(). If
xe_amc_exit() is called before this work executes, or if the client creation
failed, i2c_client_to_xe_device() will unconditionally dereference an inval=
id
pointer when it accesses client->adapter.

> +		xe_remove_amc_alert_sysfs(xe);
>  		kfree(i2c->amc);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but looking at the driver teardown path in
drivers/gpu/drm/xe/xe_i2c.c:

static void xe_i2c_remove(void *data)
{
	struct xe_i2c *i2c =3D data;
	unsigned int i;

	xe_amc_exit(i2c);

	for (i =3D 0; i < XE_I2C_MAX_CLIENTS; i++) {
		i2c_unregister_device(i2c->client[i]);
		i2c->client[i] =3D NULL;
	}

	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
	xe_i2c_unregister_adapter(i2c);
}

Is there a missing cancel_work_sync(&i2c->work) here?=20

The teardown path unregisters the notifier and xe_amc_exit() cancels amc->w=
ork,
but it appears to leave i2c->work unmanaged. If this asynchronous work exec=
utes
concurrently or after the devm-managed i2c structure is freed, could it lead
to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823103523.5541=
84-4-badal.nilawar@intel.com?part=3D2
