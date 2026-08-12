Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342EBC5DF60
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF32310F0AE;
	Wed, 12 Aug 2026 17:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RPUiVtaM";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D7010EFA9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:49:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 54CA860A92;
 Wed, 12 Aug 2026 12:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F7E1F000E9;
 Wed, 12 Aug 2026 12:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786538985;
 bh=FO93Px+UhPmkwobvH3W43ibzPvs/Zgy3ZgEqSuxm+z0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=RPUiVtaMhb700ev5pFqO25b9r/ZBaTQpYYTZANTzsfwjJtPacNoC26N33WfdW1RzE
 qgerugUpnlT9y4y1fSKBCdPg8B98OEpQD/WrKz0lOamAgMajkzsl5Tl0FLSBjR5M/b
 e1YCVbZxRwhCd4OdZU6j+uTqqpYtpPEFLTYqbVMQVOdZQ2CWWfxBVx2qZxPEHGFlUS
 od9EqKT/hI2iC0pvp3eErGvIeUczNMsXteCJcbXk7F2N0rrJC2x2te7Wlv7Bqu0QUc
 EkbQN3MPGVeds4l6IeN0G2LGSadXLnVw5EEZHGfPzlTvhKn003OR7UNZnbV5SqGS7Z
 WVitMgd7A31JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] drm/xe/log: DO NOT REVIEW
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812123449.239480-6-mallesh.koujalagi@intel.com>
References: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
 <20260812123449.239480-6-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 12:49:44 +0000
Message-Id: <20260812124944.D5F7E1F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:21 +0000
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
- [Medium] Corrected hardware errors are logged at ERROR level, triggering =
false alerts
- [Low] Missing `const` support for generic kernel device structs in type s=
election macros
- [Low] Composite component classes are unhandled in the unknown component =
fallback
--

--- Patch [1]: [PATCH v2 1/3] drm/xe/log: DO NOT REVIEW ---
commit c27ccbea00833a08d0fbc465493aa86a335d74ca
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
drm/xe/log: DO NOT REVIEW

This commit introduces the Xe SIGID logging framework. It defines the stable
error signature identifiers and implements the logging macros to emit
structured log entries.

Link: https://patchwork.freedesktop.org/series/171022/

> diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
> index 0000000000000..c49f87ccdb477
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_any.h

[ ... ]

> +/**
> + * xe_any_to_xe() - Obtain the &xe_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_xe(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct xe_device, (any)),		\
> +		 __xe_any_to_other_assoc(/* */, xe_tile, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(const, xe_tile, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(/* */, xe_gt, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(const, xe_gt, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(, drm_device, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(, pci_dev, xe_device, (any)),		\
> +		 __xe_any_to_other_assoc(, device, xe_device, (any)))

[Severity: Low]
Is it possible to hit a compile-time error here if this macro is called
with a const struct pci_dev *, const struct device *, or const struct
drm_device *? The _Generic selection lacks the const variants for standard
device pointers, though they are present for the driver-specific structs.

> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 0000000000000..32fbf83fd9924
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.c

[ ... ]

> +static const char *log_unknown_component_prefix(u32 component)
> +{
> +	u32 class =3D FIELD_GET(XE_LOG_COMPONENT_CLASS_MASK, component);
> +	u32 type =3D FIELD_GET(XE_LOG_COMPONENT_TYPE_MASK, component);
> +
> +	WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unrecognized component %u.%=
u\n", class, type);
> +	switch (class) {
> +#define MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(_CLASS) \
> +	case XE_LOG_COMPONENT_CLASS_##_CLASS: return #_CLASS "? "
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(SYSTEM);
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(DRIVER);
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(FEATURE);
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(FIRMWARE);
> +	MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(HARDWARE);
> +#undef MAKE_XE_LOG_COMPONENT_CLASS_PREFIX
> +	}
> +	return "COMP? ";
> +}

[Severity: Low]
Does this code handle composite component classes? It appears that
MAKE_XE_LOG_COMPONENT_CLASS_PREFIX is not instantiated for DRIVER_FEATURE,
DRIVER_FIRMWARE, or DRIVER_HARDWARE. If a dynamically constructed component=
 ID
belongs to one of these classes, it looks like it will fall through to the
"COMP? " string instead of generating a class-specific prefix.

[ ... ]

> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct=
 va_format *vaf)
> +{
> +	if (cper_sev =3D=3D CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}

[Severity: Medium]
Will this incorrectly log successfully corrected hardware errors at ERROR l=
evel?
If a corrected fault is emitted via xe_log_emit_corrected() using
CPER_SEV_CORRECTED, it takes the else branch and uses pci_err() along with
the *ERROR* string format. Could this pollute dmesg and cause automated sys=
tem
health monitoring tools to issue false hardware failure alerts?

> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index 0000000000000..7b90e39b97be2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h

[ ... ]

> +#define xe_log_location_type(any)							\
> +	_Generic((any),									\
> +		 struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,				\
> +		 const struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,			\
> +		 struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,				\
> +		 const struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,			\
> +		 struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,			\
> +		 const struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,		\
> +		 struct pci_dev * : XE_LOG_LOCATION_TYPE_DEVICE,			\
> +		 struct device * : XE_LOG_LOCATION_TYPE_DEVICE)

[Severity: Low]
Does this code also omit the const variants for standard device pointers?
Like xe_any_to_xe(), if this macro is called with a const struct pci_dev * =
or
const struct device *, it looks like it will result in a compile-time error=
 due
to an unhandled type in the _Generic selection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812123449.2394=
80-5-mallesh.koujalagi@intel.com?part=3D1
