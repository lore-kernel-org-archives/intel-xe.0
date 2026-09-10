Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492F7C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B2510E2B3;
	Thu, 10 Sep 2026 12:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nsSjXN++";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB42810E287
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:41:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C667F600CB;
 Thu, 10 Sep 2026 12:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD8E1F000FF;
 Thu, 10 Sep 2026 12:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789044078;
 bh=l+JrhR4g5qDTJk90l40QgIlSdaxkcTbl6xJZXflJ5W4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nsSjXN++p2JcFVnWdQ6jf37cm4p8b7M/ffrDQ7FbjrgVZvJ//1Cx3W02fZrp7W8Y+
 FylvLJ7p27aYNTqwo1zX2L7hDzU+6UA+y9hCbbocNPZkgcXum78JC7OFl0iPnYns09
 3lzTpF/ToNKvNVDflo+iG6qf6KboaJ/LExQzP5c0atpl9bmCU8dmxPh0SjpWZjL6xW
 Hm+9KjfxRCHhMnlZ8/RfYAJ2JXsXnlTkvE8F4vF1NwAEQopHWlq0m0Z16pjZodB3oR
 NDzOd7+LLPxrcekzGcpadPH5c0AYW+63Wqn3vTC92KQF65a+2AjfAAZ4Ww7byTZ2au
 NRRipte/FvH0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/xe/i2c: Expose AMC Alert reason sysfs
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910124151.3135801-5-badal.nilawar@intel.com>
References: <20260910124151.3135801-4-badal.nilawar@intel.com>
 <20260910124151.3135801-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 12:41:17 +0000
Message-Id: <20260910124118.5BD8E1F000FF@smtp.kernel.org>
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
- [Medium] The ABI documentation incorrectly states that the sysfs attribut=
e is created when an alert is handled.
- [Medium] Lockless data race on `amc->alert_reason` between the workqueue =
writer and sysfs reader.

Pre-existing issues:
- [High] Use-after-free vulnerability during module teardown in `xe_amc_exi=
t()` due to destroying `i2c->amc` while the I2C interrupt remains active.
- [High] Missing cancellation of `i2c->work` in `xe_i2c_remove()` leads to =
a Use-After-Free on driver unbind or error paths.
--

commit ae79b3f2589a0953606cef0104f63d635c6345fa
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/i2c: Expose AMC Alert reason sysfs

This commit exposes a read-only xe_amc_alert_reason sysfs attribute to
help users identify the required recovery action. It adds ABI documentation
and wires up the sysfs creation and AMC worker updates.

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Docume=
ntation/ABI/testing/sysfs-driver-intel-xe-amc
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> @@ -0,0 +1,25 @@
[ ... ]
> +		An AMC alert is delivered via an SMBUS interrupt and causes the
> +		device to be wedged, requiring vendor-specific recovery. This
> +		attribute is created when such an alert is handled and is
> +		available to all users as read-only.

[Severity: Medium]
The documentation states the attribute is created when an alert is handled,
but looking at xe_amc_init(), it appears to be created unconditionally
during driver probe. Could this confuse userspace tools waiting for the
file to appear as a signal that an alert occurred?

> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index edd50bf8261ec..bb9d260f800ff 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
[ ... ]
> @@ -104,6 +109,42 @@ static const struct amc_request amc_get_alert_reason=
 =3D {
[ ... ]
> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_amc *amc =3D xe->i2c->amc;
> +
> +	return sysfs_emit(buf, "%s\n", amc_alert[amc->alert_reason]);
> +}

[Severity: Medium]
Is there a potential lockless data race here?

The worker thread in xe_amc_work() updates amc->alert_reason via normal
assignment, while a concurrent userspace read of the sysfs file can access
it here without synchronization or memory barriers (like READ_ONCE and
WRITE_ONCE).

[ ... ]
> @@ -176,6 +224,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
[ ... ]
>  void xe_amc_exit(struct xe_i2c *i2c)
>  {
>  	if (i2c->amc) {
> +		xe_amc_remove_alert_sysfs(i2c);
>  		cancel_work_sync(&i2c->amc->work);
>  		kfree(i2c->amc);
> +		i2c->amc =3D NULL;
>  	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does freeing i2c->amc here
while the I2C hardware interrupt is still active leave us vulnerable to a
Use-After-Free?

The devm cleanup framework uninstalls the IRQ after removing the I2C
client. Concurrently, if a hardware alert fires exactly when the struct
is freed, could the interrupt handler read the dangling, non-NULL pointer
right before it is set to NULL?

drivers/gpu/drm/xe/xe_i2c.c:xe_i2c_handle_smbus_alert() {
    if (stat & DW_IC_SMBUS_INTR_ALERT && i2c->amc)
        xe_amc_handle_alert(i2c);
}

This could end up queuing work on the freed i2c->amc->work.

[Severity: High]
This is also a pre-existing issue, but I noticed another potential
Use-After-Free during teardown in xe_i2c_remove()=20
(drivers/gpu/drm/xe/xe_i2c.c):

static void xe_i2c_remove(void *data)
{
    struct xe_i2c *i2c =3D data;
    unsigned int i;

    xe_amc_exit(i2c);
    ...
}

Since xe_i2c_notifier() schedules i2c->work, if xe_i2c_remove() completes
and devres frees the struct xe_i2c without first calling
cancel_work_sync(&i2c->work), what happens if the uncancelled work executes
afterwards?

xe_i2c_client_work() {
    struct xe_i2c *i2c =3D container_of(work, struct xe_i2c, work);
    ...
    i2c->client[XE_I2C_CLIENT_AMC] =3D i2c_new_client_device(i2c->adapter, =
&info);
}

Would this dereference the freed i2c structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910124151.3135=
801-4-badal.nilawar@intel.com?part=3D1
