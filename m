Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D7AC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D2610E2B3;
	Thu, 10 Sep 2026 12:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SZNu+Ju0";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10AC10E2B3
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:33:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C886600CB;
 Thu, 10 Sep 2026 12:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA311F000FF;
 Thu, 10 Sep 2026 12:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789043595;
 bh=7lXrPL0LWp1K+dl00WBIMJb76L96v7suyLgmYYqZ4cY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SZNu+Ju03xxheOeKvzc4Ovk6Rd5BQ/9EsrGoIH09PZWMt8JqL8Pp1Ify8VN/IWiny
 x5yetgUEMssQv3xTbUanPPusL8Vz8pTZw+EvAzjOwWHw0YUt2vHgOClwdgpwWsEZ3d
 jfDSiVuGGGrFyTzdlh1StwFkg+AK5PCuUmjcYdsTucbmUFQBz0a3GXuABk6X9CywJU
 YY6xfXYbrkYzJiZGZprlSO2QpP2629hx1sR8X/CD5YSuPYlrg99+rLASNUD9LZsOCI
 QuPcaXARJY7idsEoRdJmDiyN3iF17NLwsQcOPkXel1r+Xk4ASZIslIUBKyvZvl1oai
 OPOacjujCKCFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe/cri: Expose device UID through sysfs
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910124151.3135801-6-badal.nilawar@intel.com>
References: <20260910124151.3135801-4-badal.nilawar@intel.com>
 <20260910124151.3135801-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 12:33:15 +0000
Message-Id: <20260910123315.9CA311F000FF@smtp.kernel.org>
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
- [Medium] Exposing a globally unique GPU hardware identifier to unprivileg=
ed users creates a persistent privacy vulnerability. Unprivileged applicati=
ons, sandboxes, and containers can read this 64-bit SOC ID to consistently =
fingerprint and track the machine, circumventing privacy boundaries.
--

commit bf81f8535df00cbd8d5f430123de0394ef920efc
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cri: Expose device UID through sysfs

This commit introduces a sysfs attribute to expose the unique 64-bit hardwa=
re
identifier (SOC UID) of the GPU on supported Intel Xe platforms.

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Docume=
ntation/ABI/testing/sysfs-driver-intel-xe-gpu
> new file mode 100644
> index 0000000000000..36182bbb1b54d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/pci/drivers/xe/.../device_uid
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		RO. Unique 64-bit identifier of the GPU device, exposed as
> +		hexadecimal value.
> +
> +		This sysfs file is present only on Intel Xe platforms that
> +		provide a device UID. It is available to all users.

[Severity: Medium]
Is it intentional to expose this globally unique hardware identifier to
unprivileged users? Typically, unique identifiers like DMI product UUIDs
or system serials are restricted to root access to prevent unauthorized
fingerprinting and tracking across unprivileged applications or containers.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe=
_device_sysfs.c
> index a73e0e957cb0b..657742c22d90b 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c

[ ... ]

> +static ssize_t
> +device_uid_show(struct device *dev, struct device_attribute *attr, char =
*buf)
> +{
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +
> +	return sysfs_emit(buf, "%016llx\n", xe->device_uid);
> +}
> +static DEVICE_ATTR_RO(device_uid);

[Severity: Medium]
Could this use DEVICE_ATTR_ADMIN_RO instead of DEVICE_ATTR_RO? By using
DEVICE_ATTR_RO, the sysfs attribute is granted 0444 world-readable
permissions. This allows any unprivileged user to persistently fingerprint
the machine by reading the device_uid sysfs file via device_uid_show().
Restricting this to 0400 would align with standard kernel practices for
hardware serials.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910124151.3135=
801-4-badal.nilawar@intel.com?part=3D2
