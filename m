Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51520C79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F190610E088;
	Sun,  6 Sep 2026 17:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QHSzMGAm";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D1010E088
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:24:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 72810601DE;
 Sun,  6 Sep 2026 17:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061C41F00A3A;
 Sun,  6 Sep 2026 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715439;
 bh=ZCVyTabIzP10rXhEAa996blPWkb11kSu/MS0xghFGR8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QHSzMGAmslBNFNA8ClXXJBxq+BXSlcJ8N7TKXF2jCFAcgYDH5wnqfzPB2CUYigFBI
 kjuk93x1+XhQ8w+VXvuXqRW0+B4mGo3rCQ0p/5EIHA3fIe+pNgtJzd28v9sbQwRuCn
 0aiZVdA4+c8BmOWDwfMRxBIMIliJV/mZMYshCD7sALwV+7nX0kLVwWuwqq9dtUbXa/
 ozp2Q2PBVUic4HC8q4MMDXtpvO6xRsjPWNe8t1nFyBFTNle9XEqPyKshYsbAjZMwd0
 Grgr7Ve3a/TZXIp7cjN5wBbSqL9J6fAkwpMF/3IEVBAL0YWaOZACdx7/0dGHyffOWv
 whod4k+1TtVEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/12] drm/xe/cper: Log CPER records for aggregate
 counter retrival
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-21-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-21-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:23:58 +0000
Message-Id: <20260906172359.061C41F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Passing incompletely initialized query counter struct to CPER lo=
gging instead of the fully populated response counter returned by hardware.
- [Low] The sysfs attribute `cper_on_query` is created with 0600 permission=
s, contradicting its documentation which states it is readable by all users.

Pre-existing issues:
- [High] The preexisting `xe_emit_hardware_error_cper` function silently ab=
orts when passed a valid hardware sigid, completely breaking the new CPER l=
ogging functionality.
--

commit 4840bdedfff2abbfbb8ce20f95bb4403db40e936
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Log CPER records for aggregate counter retrival

This commit adds support to log CPER records for aggregate counter
retrieval from userspace. It introduces a new sysfs attribute
cper_on_query to control this behavior.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7e3e627504485..288dbc0942f58 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -612,6 +641,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(str=
uct xe_device *xe)
>   */
>  int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, =
u32 *value)
>  {
> +	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>  	struct xe_ras_error_class counter =3D {0};
>  	struct xe_ras_get_counter_response response =3D {0};
>  	int ret;
> @@ -623,8 +653,13 @@ int xe_ras_get_counter(struct xe_device *xe, u8 seve=
rity, u8 component, u32 *val
>  	ret =3D xe_ras_get_counter_response(xe, &counter, &response);
>  	if (ret)
>  		return ret;
> -
>  	*value =3D response.value;
> +
> +	if (xe->ras.cper_on_query)
> +		xe_emit_hardware_error_cper(pdev, ras_sev_to_cper_sev(counter.common.s=
everity),
> +					    ras_comp_to_hw_sigid(counter.common.component),
> +					    (struct xe_ras_error_class *)&counter,

[Severity: Medium]
Does this code pass the incompletely initialized query counter instead of t=
he=20
fully populated &response.counter returned by hardware?=20

The CPER record emitted will be missing the product-specific hardware
classification fields (like tile, instance, cause), leading to information =
loss
in RAS logging.

[Severity: High]
This is a pre-existing issue, but xe_emit_hardware_error_cper() silently
aborts when passed a valid hardware sigid (which are all=20
>=3D INTEL_SIGID_GPU_XE_HARDWARE_START) due to a backwards check:

drivers/gpu/drm/xe/xe_cper.c:xe_emit_hardware_error_cper() {
	if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START)
		return;
    ...
}

Does this completely break the new CPER logging functionality intended by=20
this patch?

> +					    (struct xe_ras_get_counter_response *)&response);
>  	return 0;
>  }
> =20
[ ... ]
> @@ -1069,6 +1104,56 @@ static const struct attribute_group gpu_health_gro=
up =3D {
>  	.attrs =3D gpu_health_attrs,
>  };
> =20
> +static ssize_t cper_on_query_show(struct device *dev, struct device_attr=
ibute *attr, char *buf)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +
> +	return sysfs_emit(buf, "%u\n", xe->ras.cper_on_query);
> +}
> +
> +static ssize_t cper_on_query_store(struct device *dev, struct device_att=
ribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	bool enable;
> +	int ret;
> +
> +	ret =3D kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	xe->ras.cper_on_query =3D enable;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_ADMIN_RW(cper_on_query);

[Severity: Low]
Does this incorrectly enforce 0600 permissions, preventing non-root users f=
rom=20
reading the value?=20

The documentation below states it should be readable by all users:

> +
> +static struct attribute *cper_on_query_attrs[] =3D {
> +	&dev_attr_cper_on_query.attr,
> +	NULL
> +};
> +
> +/**
> + * DOC: CPER on query
> + *
> + * On Intel Xe platforms that support the RAS error reporting interface,
> + * the driver can emit a CPER (Common Platform Error Record) each time an
> + * error counter is queried. This behaviour is controlled through the
> + * following sysfs attribute::
> + *
> + *     /sys/bus/pci/devices/<device>/cper_on_query
> + *
> + * The attribute is a boolean (``0`` or ``1``). When set to ``1``, every
> + * counter query emits a CPER record built from the associated info queue
> + * data; when set to ``0`` (default) no record is emitted on query.
> + *
> + * Reading the attribute is available to all users and returns the curre=
nt
> + * setting, whereas writing is restricted to administrative users.
> + */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D7
