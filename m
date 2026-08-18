Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB13C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 17:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842D110E081;
	Tue, 18 Aug 2026 17:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye4vkdeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32EC10E081
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787072936; x=1818608936;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+dFiw1JbQ7UHg/LKsQQhHDeRwKQiER2tgVBVFWrxLn0=;
 b=Ye4vkdeJ7Xun7MqjFox8Q5lpgL/fa4fwypzYic4zi7J9xzD55KqdUbOR
 PCpxj53bqvsV/A59MqGe64Dr1UQ6qQ16ANTWOq8HcFUsFGSmRw1pmgtcp
 NPu/ZbDpsyT9INSoFtx1H5WB5xnkiH3EVcJ74nZ/4QqDshSdb0qKUZY/M
 gonQ8VT3hRBgKMX7wlkDz2hovF+JFJ0jZ91qoLl0maE5RV9s+sm0ExYZg
 LH3mYOPh0Yk7dMy2fX1296KeoRowz0E83iWDpcLj99meXW2x0Ut+Tzl/d
 ePQN9GOhlL5ODxSHR0P8/2BnNeKSio8fUH9KGcr2fO6FPEXS6s570JDsb g==;
X-CSE-ConnectionGUID: ulRKrWeSQc+gy87asDKhcg==
X-CSE-MsgGUID: diFNx3udQ/+EMF/RJQUOfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91256683"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="91256683"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:08:56 -0700
X-CSE-ConnectionGUID: RB4TNBSiRzSsGcE0sCh+Yg==
X-CSE-MsgGUID: ldhcbcAgQ16NFR+hM8ZXIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263967208"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.14])
 ([10.245.244.14])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:08:54 -0700
Message-ID: <ad03c8234917a8b8e1d1777a0518231a650d1619.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Add force_p2p module/configfs parameter
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Tue, 18 Aug 2026 19:08:51 +0200
In-Reply-To: <20260818154042.301638-1-nathan.d.ciobanu@linux.intel.com>
References: <20260818154042.301638-1-nathan.d.ciobanu@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 2026-08-18 at 08:40 -0700, Nathan Ciobanu wrote:
> Add force_p2p module and configfs parameter to give users an option
> to
> allow P2P DMA between GPU cards that are connected off of the root
> bus
> with no switch/bridge in between, as seen in some virtual machine
> topologies (Q35/QEMU, VMware):
>=20
> =C2=A0\-[0000:03]-+-00.0=C2=A0 Intel Corporation [Intel Graphics]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\-01.0=C2=A0 Intel Corporation [Intel Graphics]
>=20
> or
>=20
> =C2=A0-[0000:00]-+-01.6-[07]----00.0=C2=A0 Intel Graphics
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \-01.7=
-[08]----00.0=C2=A0 Intel Graphics
>=20
> In these situations the p2pdma distance calculation API would fail
> the
> host-bridge case

Why does it fail. Typically there is a very good reason, like the host
bridge is not whitelisted?


>  and not give a chance to users to take advantage of P2P
> DMA.
>=20
> This module/config parameter should be used with caution after
> proving
> that the memory mapped between the two devices is not getting
> corrupted.
> Users need to verify that the platform's physical topology
> allows/facilitates P2P and tests such as the IGT xe_peer2peer pass.
>=20
> Assisted-by: Claude:claude-3.5-sonnet
> Signed-off-by: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I don't think we should do this, but rather fix upstream the cases that
should work (probably by whitelisting the host bridges?)

Thanks,
Thomas



>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> b/drivers/gpu/drm/xe/xe_configfs.c
> index 052cce962161..187352a8b419 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -255,6 +255,39 @@
> =C2=A0 * The created device directories can be removed using ``rmdir``::
> =C2=A0 *
> =C2=A0 *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
> + *
> + * Force P2P DMA
> + * -------------
> + *
> + * This option is useful in virtual machines when the PCIe emulated
> topology
> + * doesn't mimic the physical one and the p2pdma API fails to
> calculate a
> + * distance between nodes due to whitelist checks. In such cases,
> the user can
> + * set the force_p2p module parameter globally or through configfs,
> if needed,
> + * have the option to granularly control that setting on a per-
> device basis.
> + *
> + * By default, force_p2p will have the same value as the
> xe_modparam.force_p2p
> + * which by default is 0.
> + *
> + * The symptoms that point to the P2P issue that this option is
> trying to
> + * address is:
> + * - dmesg errors such as "xe 0000:03:01.0: cannot be used for peer-
> to-peer DMA
> + *=C2=A0=C2=A0 as the client and provider (0000:03:00.0) do not share an
> upstream bridge
> + *=C2=A0=C2=A0 or whitelisted host bridge"
> + * - Running the IGT xe_peer2peer tests result in skips.
> + * - UMD libraries fail with p2p related errors.
> + *
> + * Use these steps if the global xe.force_p2p parameter is
> inconvenient
> + * for some GPU devices in your system. NOTE that this option needs
> to be
> + * set on both endpoints of a pair to take effect.
> + *
> + * 1. Unbind the driver from device:
> + *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
> + *
> + * 2. Set the force_p2p option on/off:
> + *	# echo [0|1] >
> /sys/kernel/config/xe/0000\:03\:00.0/force_p2p
> + *
> + * 3. Rebind the driver to device:
> + *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
> =C2=A0 */
> =C2=A0
> =C2=A0/* Similar to struct xe_bb, but not tied to HW (yet) */
> @@ -275,6 +308,7 @@ struct xe_config_group_device {
> =C2=A0		bool survivability_mode;
> =C2=A0		bool enable_psmi;
> =C2=A0		bool enable_multi_queue;
> +		bool force_p2p;
> =C2=A0		struct {
> =C2=A0			unsigned int max_vfs;
> =C2=A0			bool admin_only_pf;
> @@ -295,6 +329,7 @@ static const struct xe_config_device
> device_defaults =3D {
> =C2=A0	.survivability_mode =3D false,
> =C2=A0	.enable_psmi =3D false,
> =C2=A0	.enable_multi_queue =3D true,
> +	.force_p2p =3D XE_DEFAULT_FORCE_P2P,
> =C2=A0	.sriov =3D {
> =C2=A0		.max_vfs =3D XE_DEFAULT_MAX_VFS,
> =C2=A0		.admin_only_pf =3D XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -304,6 +339,7 @@ static const struct xe_config_device
> device_defaults =3D {
> =C2=A0static void set_device_defaults(struct xe_config_device *config)
> =C2=A0{
> =C2=A0	*config =3D device_defaults;
> +	config->force_p2p =3D xe_modparam.force_p2p;
> =C2=A0#ifdef CONFIG_PCI_IOV
> =C2=A0	config->sriov.max_vfs =3D xe_modparam.max_vfs;
> =C2=A0#endif
> @@ -563,6 +599,37 @@ static ssize_t engines_allowed_store(struct
> config_item *item, const char *page,
> =C2=A0	return len;
> =C2=A0}
> =C2=A0
> +static ssize_t force_p2p_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev =3D
> to_xe_config_group_device(item);
> +
> +	guard(mutex)(&dev->lock);
> +
> +	return sprintf(page, "%d\n", dev->config.force_p2p);
> +}
> +
> +static ssize_t force_p2p_store(struct config_item *item, const char
> *page, size_t len)
> +{
> +	struct xe_config_group_device *dev =3D
> to_xe_config_group_device(item);
> +	bool force_p2p;
> +	int ret;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	ret =3D kstrtobool(page, &force_p2p);
> +	if (ret)
> +		return ret;
> +
> +	dev->config.force_p2p =3D force_p2p;
> +
> +	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +
> +	return len;
> +}
> +
> =C2=A0static ssize_t enable_psmi_show(struct config_item *item, char
> *page)
> =C2=A0{
> =C2=A0	struct xe_config_device *dev =3D to_xe_config_device(item);
> @@ -856,6 +923,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
> =C2=A0CONFIGFS_ATTR(, enable_multi_queue);
> =C2=A0CONFIGFS_ATTR(, enable_psmi);
> =C2=A0CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, force_p2p);
> =C2=A0CONFIGFS_ATTR(, gt_types_allowed);
> =C2=A0CONFIGFS_ATTR(, survivability_mode);
> =C2=A0
> @@ -865,6 +933,7 @@ static struct configfs_attribute
> *xe_config_device_attrs[] =3D {
> =C2=A0	&attr_enable_multi_queue,
> =C2=A0	&attr_enable_psmi,
> =C2=A0	&attr_engines_allowed,
> +	&attr_force_p2p,
> =C2=A0	&attr_gt_types_allowed,
> =C2=A0	&attr_survivability_mode,
> =C2=A0	NULL,
> @@ -1269,6 +1338,25 @@ bool xe_configfs_get_psmi_enabled(struct
> pci_dev *pdev)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/** xe_configfs_get_force_p2p - get configfs force_p2p setting
> + * @pdev: pci device
> + *
> + * Return: force_p2p setting in configfs
> + */
> +bool xe_configfs_get_force_p2p(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev =3D
> find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return xe_modparam.force_p2p;
> +
> +	ret =3D dev->config.force_p2p;
> +
> +	config_group_put(&dev->group);
> +	return ret;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_configfs_get_enable_multi_queue - get configfs
> enable_multi_queue setting
> =C2=A0 * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> b/drivers/gpu/drm/xe/xe_configfs.h
> index 4fbbeafba473..45af69cb74b1 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -30,6 +30,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct
> pci_dev *pdev,
> =C2=A0u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> =C2=A0					enum xe_engine_class class,
> =C2=A0					const u32 **cs);
> +bool xe_configfs_get_force_p2p(struct pci_dev *pdev);
> =C2=A0#ifdef CONFIG_PCI_IOV
> =C2=A0unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> =C2=A0bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> @@ -50,6 +51,7 @@ static inline u32
> xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> =C2=A0static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_de=
v
> *pdev,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum
> xe_engine_class class,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u32
> **cs) { return 0; }
> +static inline bool xe_configfs_get_force_p2p(struct pci_dev *pdev) {
> return xe_modparam.force_p2p; }
> =C2=A0#ifdef CONFIG_PCI_IOV
> =C2=A0static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev
> *pdev)
> =C2=A0{
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> b/drivers/gpu/drm/xe/xe_defaults.h
> index 0884224ef7c7..3881e832566a 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -13,6 +13,7 @@
> =C2=A0#define XE_DEFAULT_GUC_LOG_LEVEL		1
> =C2=A0#endif
> =C2=A0
> +#define XE_DEFAULT_FORCE_P2P			0
> =C2=A0#define
> XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> =C2=A0#define XE_DEFAULT_VRAM_BAR_SIZE		0
> =C2=A0#define
> XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> index bf0728838ead..bd8f8ad70bcd 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -15,6 +15,7 @@
> =C2=A0
> =C2=A0#include "tests/xe_test.h"
> =C2=A0#include "xe_bo.h"
> +#include "xe_configfs.h"
> =C2=A0#include "xe_device.h"
> =C2=A0#include "xe_pm.h"
> =C2=A0#include "xe_ttm_vram_mgr.h"
> @@ -26,9 +27,14 @@ static int xe_dma_buf_attach(struct dma_buf
> *dmabuf,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_attachment *attach)
> =C2=A0{
> =C2=A0	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> +	struct pci_dev *a_pdev =3D to_pci_dev(obj->dev->dev);
> +	struct pci_dev *b_pdev =3D dev_is_pci(attach->dev) ?
> +				 to_pci_dev(attach->dev) : NULL;
> =C2=A0
> =C2=A0	if (attach->peer2peer &&
> -	=C2=A0=C2=A0=C2=A0 pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attac=
h-
> >dev, false) < 0)
> +	=C2=A0=C2=A0=C2=A0 !(b_pdev && xe_configfs_get_force_p2p(a_pdev) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_configfs_get_force_p2p(b_pdev)) &&
> +	=C2=A0=C2=A0=C2=A0 pci_p2pdma_distance(a_pdev, attach->dev, false) < 0)
> =C2=A0		attach->peer2peer =3D false;
> =C2=A0
> =C2=A0	if (!attach->peer2peer &&
> !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c
> index 4bc28dfc1992..99cb2a455c6e 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -22,6 +22,7 @@
> =C2=A0#include "xe_sched_job.h"
> =C2=A0
> =C2=A0struct xe_modparam xe_modparam =3D {
> +	.force_p2p =3D		XE_DEFAULT_FORCE_P2P,
> =C2=A0	.probe_display =3D	XE_DEFAULT_PROBE_DISPLAY,
> =C2=A0	.guc_log_level =3D	XE_DEFAULT_GUC_LOG_LEVEL,
> =C2=A0	.force_probe =3D		XE_DEFAULT_FORCE_PROBE,
> @@ -38,6 +39,10 @@ module_param_named(svm_notifier_size,
> xe_modparam.svm_notifier_size, uint, 0600)
> =C2=A0MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in
> MiB, must be power of 2 "
> =C2=A0		 "[default=3D"
> __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
> =C2=A0
> +module_param_named_unsafe(force_p2p, xe_modparam.force_p2p, bool,
> 0400);
> +MODULE_PARM_DESC(force_p2p, "Force P2P DMA between GPUs (useful in
> virtual machines), bypassing p2pdma checks. "
> +		 "[default=3D" __stringify(XE_DEFAULT_FORCE_P2P) "]");
> +
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> =C2=A0module_param_named(probe_display, xe_modparam.probe_display, bool,
> 0444);
> =C2=A0MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's
> left untouched "
> diff --git a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h
> index 6272d9e41207..bb154c7b095a 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,6 +12,7 @@ struct work_struct;
> =C2=A0
> =C2=A0/* Module modprobe variables */
> =C2=A0struct xe_modparam {
> +	bool force_p2p;
> =C2=A0	bool probe_display;
> =C2=A0	int force_vram_bar_size;
> =C2=A0	int guc_log_level;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 627a741293d5..3cd53bb166af 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -12,6 +12,7 @@
> =C2=A0
> =C2=A0#include "xe_bo.h"
> =C2=A0#include "xe_exec_queue_types.h"
> +#include "xe_configfs.h"
> =C2=A0#include "xe_gt_stats.h"
> =C2=A0#include "xe_migrate.h"
> =C2=A0#include "xe_module.h"
> @@ -892,6 +893,10 @@ static bool xe_has_interconnect(struct
> drm_pagemap_peer *peer1,
> =C2=A0	if (dev1 =3D=3D dev2)
> =C2=A0		return true;
> =C2=A0
> +	if (xe_configfs_get_force_p2p(to_pci_dev(dev1)) &&
> +	=C2=A0=C2=A0=C2=A0 xe_configfs_get_force_p2p(to_pci_dev(dev2)))
> +		return true;
> +
> =C2=A0	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >=3D
> 0;
> =C2=A0}
> =C2=A0
