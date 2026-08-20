Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F6BC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC6910E03D;
	Thu, 20 Aug 2026 20:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HtqJmukT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4E410E03D
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787256698; x=1818792698;
 h=mime-version:content-transfer-encoding:date:message-id:
 cc:subject:from:to:references:in-reply-to;
 bh=/of4vRnWLE+hjhGrJdL3gIaPtT9PZccm6GbqaYxR5TU=;
 b=HtqJmukT0H5tSJLgeka7EL1pJdyIbQu0LdAFc72WPI/MIWPp5vFsxMor
 JYJwABqHE+reIWT/s+0gBxr2GoHjdXVkCU8pCPl3p3F21+cNzx9ORVRXn
 5+P5ljjjOTfOGhT8N8xa+/4InPrNNOUAt8PKMYDcWMljYZTwyAxFJt7No
 /HsWXCguSt+r3M1P4DPi2PR8fOO5KQFTulCExsHk8/J1qf10TLw3YeIEC
 JJy++iqO0FSVAvCu3DtzIG1ma8o5ghKgHGZ+sI0gsXs89GJlkq2obsBe5
 aTlyFBYv7ILVVrFKxA0R0r281O7l8/R7k+zOTJI7aPKULs1ytmO1lkfsv Q==;
X-CSE-ConnectionGUID: 2gLOU81vQoK13RXiLwGSoQ==
X-CSE-MsgGUID: g31y714YT2CtHsh8tWU7cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="99324382"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="99324382"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:11:38 -0700
X-CSE-ConnectionGUID: VapCBKXXQ42MBh/K9q7WKw==
X-CSE-MsgGUID: OWYIfUzhQJ249aa9kFPXUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="263497742"
Received: from ndcfedvm.sc.intel.com (HELO localhost) ([10.3.206.26])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:11:38 -0700
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 13:11:32 -0700
Message-Id: <DKU1MDUB8SRV.3IBTNBODB9S4D@linux.intel.com>
Cc: "Nathan Ciobanu" <nathan.d.ciobanu@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, "Matthew Brost" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Add force_p2p module/configfs parameter
From: "Nathan Ciobanu" <nathan.d.ciobanu@linux.intel.com>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
X-Mailer: aerc 0.21.0
References: <20260818154042.301638-1-nathan.d.ciobanu@linux.intel.com>
 <ad03c8234917a8b8e1d1777a0518231a650d1619.camel@linux.intel.com>
 <aoS7cuG62RCP747L@intel.com>
In-Reply-To: <aoS7cuG62RCP747L@intel.com>
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

On Tue Aug 18, 2026 at 1:07 PM PDT, Rodrigo Vivi wrote:
> On Tue, Aug 18, 2026 at 07:08:51PM +0200, Thomas Hellstr=C3=B6m wrote:
>> On Tue, 2026-08-18 at 08:40 -0700, Nathan Ciobanu wrote:
>> > Add force_p2p module and configfs parameter to give users an option
>> > to
>> > allow P2P DMA between GPU cards that are connected off of the root
>> > bus
>> > with no switch/bridge in between, as seen in some virtual machine
>> > topologies (Q35/QEMU, VMware):
>> >=20
>> > =C2=A0\-[0000:03]-+-00.0=C2=A0 Intel Corporation [Intel Graphics]
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \-01.0=C2=A0 Intel Corporation [Intel Graphics]
>> >=20
>> > or
>> >=20
>> > =C2=A0-[0000:00]-+-01.6-[07]----00.0=C2=A0 Intel Graphics
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \-0=
1.7-[08]----00.0=C2=A0 Intel Graphics
>> >=20
>> > In these situations the p2pdma distance calculation API would fail
>> > the
>> > host-bridge case
>>=20
>> Why does it fail. Typically there is a very good reason, like the host
>> bridge is not whitelisted?
>>=20
>>=20
>> >  and not give a chance to users to take advantage of P2P
>> > DMA.
>> >=20
>> > This module/config parameter should be used with caution after
>> > proving
>> > that the memory mapped between the two devices is not getting
>> > corrupted.
>> > Users need to verify that the platform's physical topology
>> > allows/facilitates P2P and tests such as the IGT xe_peer2peer pass.
>> >=20
>> > Assisted-by: Claude:claude-3.5-sonnet
>> > Signed-off-by: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>>=20
>> I don't think we should do this, but rather fix upstream the cases that
>> should work (probably by whitelisting the host bridges?)
>
> Right, this looks like a good patch to be in some downstream tree for VMW=
are
> since they don't have ways to create the virtual bridge for the proper wh=
itelist
> handling.
>
> Or get this case and take to the PCI core kernel folks and see if there's
> anything that could be done in the whitelist for that case. For qemu this
> is not an issue because they can setup the virtual bridge, so they might
> just push back on that as well though ;/
>
> For-Downstream-Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
Ideally yes, this would be addressed in the PCI subsystem upstream, but a s=
olution there
will take a very long time, especially to percolate down to the different h=
ypervisors
and VM users on older kernel versions. Meanwhile, Xe users under the ESXi h=
ypervisor or
KVM/QEMU (without the host-side hypervisor topology configuration) downstre=
am
may not have a good option.

Incidentally, I found that other vendors have used a similar forceP2P appro=
ach at the
device driver level for the same type of issue.

What if we can reduce the blast radius by further guarding this option unde=
r
a hypervisor-type check and/or xe->info.platform check, or any other sugges=
tion?
Do you think that would be a good compromise for now?

Thanks,
Nathan
>>=20
>> Thanks,
>> Thomas
>>=20
>>=20
>>=20
>> >=20
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>> > b/drivers/gpu/drm/xe/xe_configfs.c
>> > index 052cce962161..187352a8b419 100644
>> > --- a/drivers/gpu/drm/xe/xe_configfs.c
>> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> > @@ -255,6 +255,39 @@
>> > =C2=A0 * The created device directories can be removed using ``rmdir``=
::
>> > =C2=A0 *
>> > =C2=A0 *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
>> > + *
>> > + * Force P2P DMA
>> > + * -------------
>> > + *
>> > + * This option is useful in virtual machines when the PCIe emulated
>> > topology
>> > + * doesn't mimic the physical one and the p2pdma API fails to
>> > calculate a
>> > + * distance between nodes due to whitelist checks. In such cases,
>> > the user can
>> > + * set the force_p2p module parameter globally or through configfs,
>> > if needed,
>> > + * have the option to granularly control that setting on a per-
>> > device basis.
>> > + *
>> > + * By default, force_p2p will have the same value as the
>> > xe_modparam.force_p2p
>> > + * which by default is 0.
>> > + *
>> > + * The symptoms that point to the P2P issue that this option is
>> > trying to
>> > + * address is:
>> > + * - dmesg errors such as "xe 0000:03:01.0: cannot be used for peer-
>> > to-peer DMA
>> > + *=C2=A0=C2=A0 as the client and provider (0000:03:00.0) do not share=
 an
>> > upstream bridge
>> > + *=C2=A0=C2=A0 or whitelisted host bridge"
>> > + * - Running the IGT xe_peer2peer tests result in skips.
>> > + * - UMD libraries fail with p2p related errors.
>> > + *
>> > + * Use these steps if the global xe.force_p2p parameter is
>> > inconvenient
>> > + * for some GPU devices in your system. NOTE that this option needs
>> > to be
>> > + * set on both endpoints of a pair to take effect.
>> > + *
>> > + * 1. Unbind the driver from device:
>> > + *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>> > + *
>> > + * 2. Set the force_p2p option on/off:
>> > + *	# echo [0|1] >
>> > /sys/kernel/config/xe/0000\:03\:00.0/force_p2p
>> > + *
>> > + * 3. Rebind the driver to device:
>> > + *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>> > =C2=A0 */
>> > =C2=A0
>> > =C2=A0/* Similar to struct xe_bb, but not tied to HW (yet) */
>> > @@ -275,6 +308,7 @@ struct xe_config_group_device {
>> > =C2=A0		bool survivability_mode;
>> > =C2=A0		bool enable_psmi;
>> > =C2=A0		bool enable_multi_queue;
>> > +		bool force_p2p;
>> > =C2=A0		struct {
>> > =C2=A0			unsigned int max_vfs;
>> > =C2=A0			bool admin_only_pf;
>> > @@ -295,6 +329,7 @@ static const struct xe_config_device
>> > device_defaults =3D {
>> > =C2=A0	.survivability_mode =3D false,
>> > =C2=A0	.enable_psmi =3D false,
>> > =C2=A0	.enable_multi_queue =3D true,
>> > +	.force_p2p =3D XE_DEFAULT_FORCE_P2P,
>> > =C2=A0	.sriov =3D {
>> > =C2=A0		.max_vfs =3D XE_DEFAULT_MAX_VFS,
>> > =C2=A0		.admin_only_pf =3D XE_DEFAULT_ADMIN_ONLY_PF,
>> > @@ -304,6 +339,7 @@ static const struct xe_config_device
>> > device_defaults =3D {
>> > =C2=A0static void set_device_defaults(struct xe_config_device *config)
>> > =C2=A0{
>> > =C2=A0	*config =3D device_defaults;
>> > +	config->force_p2p =3D xe_modparam.force_p2p;
>> > =C2=A0#ifdef CONFIG_PCI_IOV
>> > =C2=A0	config->sriov.max_vfs =3D xe_modparam.max_vfs;
>> > =C2=A0#endif
>> > @@ -563,6 +599,37 @@ static ssize_t engines_allowed_store(struct
>> > config_item *item, const char *page,
>> > =C2=A0	return len;
>> > =C2=A0}
>> > =C2=A0
>> > +static ssize_t force_p2p_show(struct config_item *item, char *page)
>> > +{
>> > +	struct xe_config_group_device *dev =3D
>> > to_xe_config_group_device(item);
>> > +
>> > +	guard(mutex)(&dev->lock);
>> > +
>> > +	return sprintf(page, "%d\n", dev->config.force_p2p);
>> > +}
>> > +
>> > +static ssize_t force_p2p_store(struct config_item *item, const char
>> > *page, size_t len)
>> > +{
>> > +	struct xe_config_group_device *dev =3D
>> > to_xe_config_group_device(item);
>> > +	bool force_p2p;
>> > +	int ret;
>> > +
>> > +	guard(mutex)(&dev->lock);
>> > +
>> > +	if (is_bound(dev))
>> > +		return -EBUSY;
>> > +
>> > +	ret =3D kstrtobool(page, &force_p2p);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	dev->config.force_p2p =3D force_p2p;
>> > +
>> > +	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
>> > +
>> > +	return len;
>> > +}
>> > +
>> > =C2=A0static ssize_t enable_psmi_show(struct config_item *item, char
>> > *page)
>> > =C2=A0{
>> > =C2=A0	struct xe_config_device *dev =3D to_xe_config_device(item);
>> > @@ -856,6 +923,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
>> > =C2=A0CONFIGFS_ATTR(, enable_multi_queue);
>> > =C2=A0CONFIGFS_ATTR(, enable_psmi);
>> > =C2=A0CONFIGFS_ATTR(, engines_allowed);
>> > +CONFIGFS_ATTR(, force_p2p);
>> > =C2=A0CONFIGFS_ATTR(, gt_types_allowed);
>> > =C2=A0CONFIGFS_ATTR(, survivability_mode);
>> > =C2=A0
>> > @@ -865,6 +933,7 @@ static struct configfs_attribute
>> > *xe_config_device_attrs[] =3D {
>> > =C2=A0	&attr_enable_multi_queue,
>> > =C2=A0	&attr_enable_psmi,
>> > =C2=A0	&attr_engines_allowed,
>> > +	&attr_force_p2p,
>> > =C2=A0	&attr_gt_types_allowed,
>> > =C2=A0	&attr_survivability_mode,
>> > =C2=A0	NULL,
>> > @@ -1269,6 +1338,25 @@ bool xe_configfs_get_psmi_enabled(struct
>> > pci_dev *pdev)
>> > =C2=A0	return ret;
>> > =C2=A0}
>> > =C2=A0
>> > +/** xe_configfs_get_force_p2p - get configfs force_p2p setting
>> > + * @pdev: pci device
>> > + *
>> > + * Return: force_p2p setting in configfs
>> > + */
>> > +bool xe_configfs_get_force_p2p(struct pci_dev *pdev)
>> > +{
>> > +	struct xe_config_group_device *dev =3D
>> > find_xe_config_group_device(pdev);
>> > +	bool ret;
>> > +
>> > +	if (!dev)
>> > +		return xe_modparam.force_p2p;
>> > +
>> > +	ret =3D dev->config.force_p2p;
>> > +
>> > +	config_group_put(&dev->group);
>> > +	return ret;
>> > +}
>> > +
>> > =C2=A0/**
>> > =C2=A0 * xe_configfs_get_enable_multi_queue - get configfs
>> > enable_multi_queue setting
>> > =C2=A0 * @pdev: pci device
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>> > b/drivers/gpu/drm/xe/xe_configfs.h
>> > index 4fbbeafba473..45af69cb74b1 100644
>> > --- a/drivers/gpu/drm/xe/xe_configfs.h
>> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> > @@ -30,6 +30,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct
>> > pci_dev *pdev,
>> > =C2=A0u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>> > =C2=A0					enum xe_engine_class class,
>> > =C2=A0					const u32 **cs);
>> > +bool xe_configfs_get_force_p2p(struct pci_dev *pdev);
>> > =C2=A0#ifdef CONFIG_PCI_IOV
>> > =C2=A0unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>> > =C2=A0bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>> > @@ -50,6 +51,7 @@ static inline u32
>> > xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>> > =C2=A0static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci=
_dev
>> > *pdev,
>> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum
>> > xe_engine_class class,
>> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u32
>> > **cs) { return 0; }
>> > +static inline bool xe_configfs_get_force_p2p(struct pci_dev *pdev) {
>> > return xe_modparam.force_p2p; }
>> > =C2=A0#ifdef CONFIG_PCI_IOV
>> > =C2=A0static inline unsigned int xe_configfs_get_max_vfs(struct pci_de=
v
>> > *pdev)
>> > =C2=A0{
>> > diff --git a/drivers/gpu/drm/xe/xe_defaults.h
>> > b/drivers/gpu/drm/xe/xe_defaults.h
>> > index 0884224ef7c7..3881e832566a 100644
>> > --- a/drivers/gpu/drm/xe/xe_defaults.h
>> > +++ b/drivers/gpu/drm/xe/xe_defaults.h
>> > @@ -13,6 +13,7 @@
>> > =C2=A0#define XE_DEFAULT_GUC_LOG_LEVEL		1
>> > =C2=A0#endif
>> > =C2=A0
>> > +#define XE_DEFAULT_FORCE_P2P			0
>> > =C2=A0#define
>> > XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> > =C2=A0#define XE_DEFAULT_VRAM_BAR_SIZE		0
>> > =C2=A0#define
>> > XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
>> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
>> > b/drivers/gpu/drm/xe/xe_dma_buf.c
>> > index bf0728838ead..bd8f8ad70bcd 100644
>> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> > @@ -15,6 +15,7 @@
>> > =C2=A0
>> > =C2=A0#include "tests/xe_test.h"
>> > =C2=A0#include "xe_bo.h"
>> > +#include "xe_configfs.h"
>> > =C2=A0#include "xe_device.h"
>> > =C2=A0#include "xe_pm.h"
>> > =C2=A0#include "xe_ttm_vram_mgr.h"
>> > @@ -26,9 +27,14 @@ static int xe_dma_buf_attach(struct dma_buf
>> > *dmabuf,
>> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_attachment *attach)
>> > =C2=A0{
>> > =C2=A0	struct drm_gem_object *obj =3D attach->dmabuf->priv;
>> > +	struct pci_dev *a_pdev =3D to_pci_dev(obj->dev->dev);
>> > +	struct pci_dev *b_pdev =3D dev_is_pci(attach->dev) ?
>> > +				 to_pci_dev(attach->dev) : NULL;
>> > =C2=A0
>> > =C2=A0	if (attach->peer2peer &&
>> > -	=C2=A0=C2=A0=C2=A0 pci_p2pdma_distance(to_pci_dev(obj->dev->dev), at=
tach-
>> > >dev, false) < 0)
>> > +	=C2=A0=C2=A0=C2=A0 !(b_pdev && xe_configfs_get_force_p2p(a_pdev) &&
>> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_configfs_get_force_p2p(b_pdev)) &&
>> > +	=C2=A0=C2=A0=C2=A0 pci_p2pdma_distance(a_pdev, attach->dev, false) <=
 0)
>> > =C2=A0		attach->peer2peer =3D false;
>> > =C2=A0
>> > =C2=A0	if (!attach->peer2peer &&
>> > !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
>> > diff --git a/drivers/gpu/drm/xe/xe_module.c
>> > b/drivers/gpu/drm/xe/xe_module.c
>> > index 4bc28dfc1992..99cb2a455c6e 100644
>> > --- a/drivers/gpu/drm/xe/xe_module.c
>> > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > @@ -22,6 +22,7 @@
>> > =C2=A0#include "xe_sched_job.h"
>> > =C2=A0
>> > =C2=A0struct xe_modparam xe_modparam =3D {
>> > +	.force_p2p =3D		XE_DEFAULT_FORCE_P2P,
>> > =C2=A0	.probe_display =3D	XE_DEFAULT_PROBE_DISPLAY,
>> > =C2=A0	.guc_log_level =3D	XE_DEFAULT_GUC_LOG_LEVEL,
>> > =C2=A0	.force_probe =3D		XE_DEFAULT_FORCE_PROBE,
>> > @@ -38,6 +39,10 @@ module_param_named(svm_notifier_size,
>> > xe_modparam.svm_notifier_size, uint, 0600)
>> > =C2=A0MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size i=
n
>> > MiB, must be power of 2 "
>> > =C2=A0		 "[default=3D"
>> > __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
>> > =C2=A0
>> > +module_param_named_unsafe(force_p2p, xe_modparam.force_p2p, bool,
>> > 0400);
>> > +MODULE_PARM_DESC(force_p2p, "Force P2P DMA between GPUs (useful in
>> > virtual machines), bypassing p2pdma checks. "
>> > +		 "[default=3D" __stringify(XE_DEFAULT_FORCE_P2P) "]");
>> > +
>> > =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> > =C2=A0module_param_named(probe_display, xe_modparam.probe_display, boo=
l,
>> > 0444);
>> > =C2=A0MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it'=
s
>> > left untouched "
>> > diff --git a/drivers/gpu/drm/xe/xe_module.h
>> > b/drivers/gpu/drm/xe/xe_module.h
>> > index 6272d9e41207..bb154c7b095a 100644
>> > --- a/drivers/gpu/drm/xe/xe_module.h
>> > +++ b/drivers/gpu/drm/xe/xe_module.h
>> > @@ -12,6 +12,7 @@ struct work_struct;
>> > =C2=A0
>> > =C2=A0/* Module modprobe variables */
>> > =C2=A0struct xe_modparam {
>> > +	bool force_p2p;
>> > =C2=A0	bool probe_display;
>> > =C2=A0	int force_vram_bar_size;
>> > =C2=A0	int guc_log_level;
>> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
>> > b/drivers/gpu/drm/xe/xe_svm.c
>> > index 627a741293d5..3cd53bb166af 100644
>> > --- a/drivers/gpu/drm/xe/xe_svm.c
>> > +++ b/drivers/gpu/drm/xe/xe_svm.c
>> > @@ -12,6 +12,7 @@
>> > =C2=A0
>> > =C2=A0#include "xe_bo.h"
>> > =C2=A0#include "xe_exec_queue_types.h"
>> > +#include "xe_configfs.h"
>> > =C2=A0#include "xe_gt_stats.h"
>> > =C2=A0#include "xe_migrate.h"
>> > =C2=A0#include "xe_module.h"
>> > @@ -892,6 +893,10 @@ static bool xe_has_interconnect(struct
>> > drm_pagemap_peer *peer1,
>> > =C2=A0	if (dev1 =3D=3D dev2)
>> > =C2=A0		return true;
>> > =C2=A0
>> > +	if (xe_configfs_get_force_p2p(to_pci_dev(dev1)) &&
>> > +	=C2=A0=C2=A0=C2=A0 xe_configfs_get_force_p2p(to_pci_dev(dev2)))
>> > +		return true;
>> > +
>> > =C2=A0	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >=3D
>> > 0;
>> > =C2=A0}
>> > =C2=A0

