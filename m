Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C18606A680
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xqk0r+Fq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5501124E8;
	Fri, 27 Nov 2026 06:23:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8571124E8
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 06:23:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 548456126C;
 Fri, 27 Nov 2026 06:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940D31F000C1;
 Fri, 27 Nov 2026 06:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795760597;
 bh=O6LIsmtfenIQNw1HNtCydnBS4rFdTRMlPoxQqcQlBCo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Xqk0r+FqfQ6FU3pPci4NebD7TX4+RR2cLRBYZGEvy2cBw0BsI+Kpn1UGotmGfS/4K
 ndi5LHABFKiMkCwxUCmEg5DEYI0GUoE3GkCpmmROR9ieE6y4nicbMkVN+Aou5wPZJd
 /xy8fPHm4QfdWBnVWl0XtkIdFJWXkdtGsBW02mENmqD3WNcMZN1ork/rhGZ8OA94O/
 90ffxUUCUoQyh90XLpMu+zkW6zuSclQZpZM77CV+/p1k0O/GnjJJTrye6oz+V+ej/T
 /VqnUJzLK41h9hcrvejk+y7n4dC6eOhqLVD+sbsaShy7teQ+gu7O37ASE9uG9xHUE8
 uJoMRWwynsfWA==
Message-ID: <sashiko-outbox-236731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] drm/xe: Request vendor recovery for AMC firmware
 download alert
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261127061333.1019047-12-badal.nilawar@intel.com>
References: <20261127061333.1019047-7-badal.nilawar@intel.com>
 <20261127061333.1019047-12-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 06:23:17 +0000
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
- [Low] drm/xe: sysfs path mismatch for amc_alert_reason in xe_wedge.c
  doc
--

commit d7afe86ab766654c2a68f433a70749b0b8d852e5
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe: Request vendor recovery for AMC firmware download alert

This commit declares vendor-specific wedge recovery when an AMC firmware
download alert is received and documents the corresponding recovery
procedure.

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 827fae058976a..633f12e7b48c8 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -54,6 +54,26 @@
>   *
>   * - Admin/userspace consumer can use firmware flashing tools like fwupd=
 to flash
>   *   firmware and restore device to normal operation.
> + *
> + * Case: Firmware Download (AMC alert)
> + * -----------------------------------
> + *
> + * Identification Hint
> + * +++++++++++++++++++
> + *
> + * ``WEDGED=3Dvendor-specific`` drm device wedged uevent with
> + * ``/sys/bus/pci/devices/<device>/xe_amc_alert_reason`` reporting
> + * ``Firmware Download`` indicates that a firmware download is in progre=
ss and
> + * the AMC will reset the device when it completes.

[Severity: Low]
Should this sysfs path be /sys/bus/pci/devices/<device>/amc_alert_reason
(or should the sysfs attribute itself be renamed to xe_amc_alert_reason)?

In drivers/gpu/drm/xe/xe_amc.c, the attribute is defined with
DEVICE_ATTR_RO(amc_alert_reason) and registered on the PCI device via
amc_create_alert_sysfs(), so the file created in sysfs has no "xe_" prefix
and userspace looking up xe_amc_alert_reason will get -ENOENT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127061333.1019=
047-7-badal.nilawar@intel.com?part=3D5
