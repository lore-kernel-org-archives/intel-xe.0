Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8ED606A32D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y6zkr4YG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8A610E3AF;
	Tue, 24 Nov 2026 20:20:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBE210E3AF
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:20:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D9FB414A0;
 Tue, 24 Nov 2026 20:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50C91F000C0;
 Tue, 24 Nov 2026 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795551607;
 bh=D5QVvSwoMgf44u51pBfCWtPWQUBTo0Vnv0dsqiUvN6I=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Y6zkr4YGeYCOfEa6/OfCgkc3PA3xq5Sotz8B1FPOkrtVq4d6PW2zwJIJ9m5HAyIj0
 YhhXaQ/CqZ3YD93DSzUhrqgfT9je37uFR6u3nZ4OUX/7CoC87stztMdUMY6Ve16ld3
 m1foxrLFvpH+dF0/LAUGIi80wL2ZJUEgcb1M1uEcazueWzlU7XuJQlRe3ov4UnKZuA
 fP4k8QdifLTVoTiwMoQ/ifj20iUSwtG7CL6x/i8jaErKhdLx/E4cISEbQjqM4GMy6k
 1rNmlMvKdULuw4HJyh6EkYHMuL3xHpVwtjhQ/APf6m213YsqB7rbe6ZHrAHOb6ZdZX
 em/lP89XUordg==
Message-ID: <sashiko-outbox-231984@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [CI] drm/xe: Crescent Island PMT support + hwmon use-after-free
 debug
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124194656.3508212-2-rodrigo.vivi@intel.com>
References: <20261124194656.3508212-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 20:20:07 +0000
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] drm/xe: devres group race with component_bind() frees xe->hwmon
  causing UAF
- [Medium] drm/xe/vsec: missing wait_for_fw() before reading GUID in
  xe_vsec_get_guid()
- [Medium] drm/xe/hwmon: leftover CI debug logging, stack dumps, and
  unchecked devm action
- [Medium] drm/xe/vsec: missing wait_for_fw() in xe_pmt_discovery_read()
- [Medium] drm/xe/vsec: pmt.work not stopped in xe_device_suspend()
  during PCIe FLR
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [High] drm/xe: missing capability type validation in xe_guid_decode()
  [1]
- [Critical] drm/xe: out-of-bounds read in xe_pmt_telem_read() [2]
--

commit daff6eb7dced704e86958267a6127a89b5f6d8fa
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>

drm/xe: Crescent Island PMT support + hwmon use-after-free debug

This commit adds Platform Monitoring Technology (PMT) support for Crescent
Island devices via VSEC and includes temporary debug instrumentation in
xe_hwmon to investigate a use-after-free on unbind.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index eafc66d686e2f..614b7e376739b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1092,18 +1092,18 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
> =20
> +	xe_vsec_init(xe);
> +
>  	xe_debugfs_register(xe);
> =20
>  	err =3D xe_hwmon_register(xe);
>  	if (err)
> -		goto err_unregister_display;
> +		goto err_unregister_vsec;
> =20
>  	err =3D xe_i2c_probe(xe);
>  	if (err)
>  		goto err_unregister_hwmon;
> =20
> -	xe_vsec_init(xe);
> -

[Severity: High]
Can moving xe_vsec_init() ahead of xe_hwmon_register() cause
component_bind() to capture xe->hwmon into the late-bind component's
devres group and free it prematurely on component_unbind()?

Earlier in xe_device_probe(), xe_heci_gsc_init() registers the mei-gscfi
auxiliary device and xe_late_bind_init() registers xe->drm.dev as a
component via component_add_typed().  Running xe_vsec_init() before
xe_hwmon_register() delays the devm allocations in xe_hwmon_register() into
the window where the asynchronous MEI client probe binds the component on
xe->drm.dev:

CPU0 (xe_device_probe)            CPU1 (MEI client probe)
xe_heci_gsc_init(xe)
xe_late_bind_init(&xe->late_bind)
  component_add_typed(xe->drm.dev, ...)
...
xe_vsec_init(xe)
                                  mei_late_bind_probe()
                                    component_master_add_with_match()
                                      component_bind_all()
                                        component_bind()
                                          devres_open_group(xe->drm.dev,
                                                            component, ...)
                                          component->ops->bind(...)
xe_hwmon_register(xe)
  hwmon =3D devm_kzalloc_obj(xe->drm.dev, *hwmon)
  devm_mutex_init(xe->drm.dev, &hwmon->hwmon_lock)
  xe->hwmon =3D hwmon
                                          devres_close_group(xe->drm.dev, .=
..)
...
                                  component_unbind()
                                    devres_release_group(xe->drm.dev,
                                                         component)
                                      /* frees hwmon */
xe_device_remove(xe)
  xe_hwmon_unregister(xe)
    hwmon_device_unregister(xe->hwmon->hwmon_dev)  <-- use-after-free

Because devres_open_group() on xe->drm.dev captures any concurrent devm
allocations on that device, hwmon is released when the component unbinds
while xe->hwmon remains non-NULL.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 9cbb65891aa40..272ef2aca80a9 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -1867,6 +1874,13 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon =
*hwmon)
>  	return xe_hwmon_init_temp_info(hwmon);
>  }
> =20
> +/* CI DEBUG ONLY: show who releases the hwmon devres */
> +static void xe_hwmon_devres_dbg(void *data)
> +{
> +	pr_err("xe_hwmon CI DEBUG: devres releasing hwmon %p\n", data);
> +	dump_stack();
> +}
> +
>  int xe_hwmon_register(struct xe_device *xe)
>  {
>  	struct device *dev =3D xe->drm.dev;
> @@ -1885,6 +1899,9 @@ int xe_hwmon_register(struct xe_device *xe)
>  	if (!hwmon)
>  		return -ENOMEM;
> =20
> +	pr_err("xe_hwmon CI DEBUG: allocated hwmon %p for xe %p\n", hwmon, xe);
> +	devm_add_action(dev, xe_hwmon_devres_dbg, hwmon);
> +
>  	ret =3D devm_mutex_init(dev, &hwmon->hwmon_lock);
>  	if (ret)
>  		return ret;
> @@ -1925,9 +1942,13 @@ int xe_hwmon_register(struct xe_device *xe)
>   */
>  void xe_hwmon_unregister(struct xe_device *xe)
>  {
> +	pr_err("xe_hwmon CI DEBUG: unregister xe %p hwmon %p\n", xe, xe->hwmon);
>  	if (!xe->hwmon)
>  		return;
> =20
> +	/* prints the alloc and free stacks if the object was already freed */
> +	kmem_dump_obj(xe->hwmon);
> +
>  	hwmon_device_unregister(xe->hwmon->hwmon_dev);
>  	xe->hwmon =3D NULL;
>  }

[Severity: Medium]
Should this temporary CI debug instrumentation be dropped before merging?
It unconditionally logs KERN_ERR messages with raw %p pointers, calls
dump_stack() and kmem_dump_obj() on every probe and unbind, and leaves the
unchecked devm_add_action() callback installed if xe_hwmon_register() fails.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a9baf0bfe572c..33a5237cf5b42 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -94,44 +197,45 @@ enum capability {
>  	WATCHER,
>  };
[ ... ]
>  	switch (record_id) {
>  	case PUNIT:
> -		*index =3D 0;
> +		*index =3D BMG_IDX_TELEM_PUNIT;
>  		if (cap_type =3D=3D TELEMETRY)
> -			*offset =3D PUNIT_TELEMETRY_OFFSET;
> +			*offset =3D BMG_PUNIT_TELEMETRY_OFFSET;
>  		else
> -			*offset =3D PUNIT_WATCHER_OFFSET;
> +			*offset =3D BMG_PUNIT_WATCHER_OFFSET;
>  		break;
> =20
>  	case OOBMSM_0:
> -		*index =3D 1;
> +		*index =3D BMG_IDX_TELEM_OOBMSM;
>  		if (cap_type =3D=3D WATCHER)
> -			*offset =3D OOBMSM_0_WATCHER_OFFSET;
> +			*offset =3D BMG_OOBMSM_0_WATCHER_OFFSET;
>  		break;
> =20
>  	case OOBMSM_1:
> -		*index =3D 1;
> +		*index =3D BMG_IDX_TELEM_OOBMSM;
>  		if (cap_type =3D=3D TELEMETRY)
> -			*offset =3D OOBMSM_1_TELEMETRY_OFFSET;
> +			*offset =3D BMG_OOBMSM_1_TELEMETRY_OFFSET;
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
> =20
>  	return 0;
>  }

[Severity: High]
This problem wasn't introduced by this patch, but can bmg_guid_decode() and
cri_guid_decode() return 0 with *offset left at 0 when an OOBMSM record_id
is paired with an unsupported cap_type [1]?

For example, OOBMSM_0 with TELEMETRY in bmg_guid_decode() (or OOBMSM_0
instance 0 with TELEMETRY in cri_guid_decode()) breaks out of the switch
without setting *offset or returning -EINVAL, allowing xe_pmt_telem_read()
to read from offset 0 of the telemetry region instead of rejecting the GUID.

> +static void cri_late_bind_probe_work(struct work_struct *work)
> +{
> +	struct xe_device *xe =3D container_of(work, struct xe_device, pmt.work.=
work);
> +
> +	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +		cri_late_bind_probe(xe);
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	xe->pmt.retry_count++;
> +
> +	/* wait up to 20 seconds */
> +	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to complete\n");
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	if (!queue_delayed_work(system_freezable_wq, &xe->pmt.work,
> +				msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
> +		xe_pm_runtime_put(xe);
> +}

[Severity: Medium]
Can cri_late_bind_probe_work() race with a PCIe Function Level Reset (FLR)?

During an FLR, xe_pci_reset_prepare() calls xe_device_suspend(), which
flushes the late-bind worker via xe_late_bind_pm_suspend() before PCI core
clears PCI_COMMAND_MEMORY and resets the function.  Because a PCIe FLR does
not freeze system_freezable_wq and xe_device_suspend() does not cancel or
flush xe->pmt.work, cri_late_bind_probe_work() can continue polling
xe_sysctrl_is_oobmsm_fw_ready() and calling cri_late_bind_probe() while
MMIO decoding is disabled and the device is being reset.

[ ... ]

>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t us=
er_offset,
>  		      u32 count)
>  {
>  	struct xe_device *xe =3D kdev_to_xe_device(dev);
> -	void __iomem *telem_addr =3D xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 cap_type =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +	void __iomem *telem_addr =3D xe->mmio.regs + xe->pmt.base_offset;
>  	u32 mem_region;
>  	u32 offset;
> -	int ret;
> +	int ret =3D 0;
> +	int idx;
> +
> +	xe_assert(xe, !IS_SRIOV_VF(xe));
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (!xe->pmt.base_offset) {
> +		ret =3D -EAGAIN;
> +		goto dev_exit;
> +	}
> =20
>  	ret =3D xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
> -		return ret;
> +		goto dev_exit;
> =20
>  	telem_addr +=3D offset + user_offset;
[ ... ]
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		u32 device_id =3D FIELD_GET(GUID_DEVICE_ID, guid);
> +
> +		/* set SoC re-mapper index register based on GUID memory region */
> +		xe->soc_remapper.set_telem_region(xe, mem_region);
> +
> +		memcpy_fromio(data, telem_addr, count);
> +
> +		if (device_id =3D=3D CRI_DEVICE_ID)
> +			xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +	}

[Severity: Critical]
This problem wasn't introduced by this patch, but can xe_pmt_telem_read()
read past the end of the mapped MMIO region (xe->mmio.size) when given a
large user_offset or count [2]?  telem_addr +=3D offset + user_offset
is passed directly to memcpy_fromio(data, telem_addr, count) without
bounds-checking against the mapped MMIO window, which can fault on unmapped
MMIO space.

[ ... ]

> +static int xe_pmt_discovery_read(struct device *dev, unsigned long cap_i=
d, u32 element,
> +				 u32 *disc_data)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	void __iomem *disc_addr =3D xe->mmio.regs;
> +	struct intel_vsec_header *headers;
> +	int ret =3D 0;
> +	u32 offset;
> +	int idx;
> =20
> -	if (!xe->soc_remapper.set_telem_region)
> +	if (!drm_dev_enter(&xe->drm, &idx))
>  		return -ENODEV;
> =20
> -	/* indicate that we are not at an appropriate power level */
> -	if (!xe_pm_runtime_get_if_active(xe))
> -		return -ENODATA;
> +	if (xe->info.platform !=3D XE_CRESCENTISLAND) {
> +		ret =3D -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	if (!xe_pm_runtime_get_if_active(xe)) {
> +		ret =3D -ENODATA;
> +		goto dev_exit;
> +	}
> +
> +	switch (cap_id) {
> +	case ilog2(VSEC_CAP_TELEMETRY):
> +		headers =3D &cri_telemetry;
> +		break;
> +
> +	case ilog2(VSEC_CAP_CRASHLOG):
> +		headers =3D &cri_crashlog;
> +		break;
> +
> +	default:
> +		ret =3D -EINVAL;
> +		goto runtime_exit;
> +	}
> =20
> -	/* set SoC re-mapper index register based on GUID memory region */
> -	xe->soc_remapper.set_telem_region(xe, mem_region);
> +	offset =3D element * (headers->entry_size * sizeof(u32));
> +	disc_addr +=3D headers->offset + offset;
> =20
> -	memcpy_fromio(data, telem_addr, count);
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		memcpy_fromio(disc_data, disc_addr, PMT_DISC_DWORDS * sizeof(u32));
> +	}

[Severity: Medium]
Should xe_pmt_discovery_read() call wait_for_fw(xe) before reading the
discovery table, like xe_pmt_telem_read(), xe_pmt_read_reg(), and
xe_pmt_write_reg() do?

On runtime resume from D3cold or system resume, xe_late_bind_pm_resume()
reloads the OOBMSM firmware asynchronously on late_bind->wq.  If a PMT
auxiliary driver probes or rebinds right after resume,
xe_pm_runtime_get_if_active(xe) succeeds while the firmware reload is still
in flight, so xe_pmt_discovery_read() can read uninitialized discovery
headers.

[ ... ]

> +int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
> +{
> +	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
> +	int ret =3D 0;
> +
> +	xe_assert(xe, !IS_SRIOV_VF(xe));
> +
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return -ENODATA;
> +
> +	mutex_lock(&xe->pmt.lock);
> +
> +	if (xe->pmt.punit_guid_cache) {
> +		*guid =3D xe->pmt.punit_guid_cache;
> +		goto unlock;
> +	}
> +
> +	switch (xe->info.platform) {
> +	case XE_BATTLEMAGE:
> +		*guid =3D xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	case XE_CRESCENTISLAND:
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		*guid =3D xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	default:
> +		*guid =3D 0;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
> +		ret =3D -EINVAL;
> +		goto unlock;
> +	}
> +
> +	/* the GUID is static, read once and cache for all requests */
> +	if (*guid) {
> +		xe->pmt.punit_guid_cache =3D *guid;
> +	} else {
> +		drm_err(&xe->drm, "Invalid GUID: 0x%x\n", *guid);
> +		ret =3D -EINVAL;
> +	}

[Severity: Medium]
Does xe_vsec_get_guid() also need to call wait_for_fw(xe) before reading
CRI_PUNIT_TELEMETRY_GUID on XE_CRESCENTISLAND?

read_residency_counter() and xe_get_pcode_version() both call
xe_vsec_get_guid() before xe_pmt_telem_read(), and their debugfs files are
registered in xe_device_probe() while OOBMSM late-binding firmware is still
loading asynchronously.  Reading CRI_PUNIT_TELEMETRY_GUID before the
firmware is ready either fails immediately with -EINVAL if the register
reads 0, or permanently caches an uninitialized non-zero value in
xe->pmt.punit_guid_cache and breaks all subsequent telemetry reads.

[1] https://sashiko.dev/#/bug/linux-17a44bac-9019-44db-b82d-0af69951b65b
[2] https://sashiko.dev/#/bug/linux-2e09e5e1-327b-4507-bb98-d9a607e0a9e5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124194656.3508=
212-2-rodrigo.vivi@intel.com?part=3D1
