Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6DDC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 21:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B12B11ADAC;
	Thu, 30 May 2024 21:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EG8bKJax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19EC11ADBF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 21:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717103208; x=1748639208;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7wqChLfczHIl7csxAHJ/wmDMyRd923+2pss7fFHOLPA=;
 b=EG8bKJaxVURXxp6wmhmI4MdQyZtrgxWH07vuP9KZpNqR+FHtWl8TdVMV
 SyxlgQEtJbZXygrWLtcpvDzqdbmYRJ/ycoVyB5t6US4hDZkJpi6NeJ81A
 q1MHo2/tE9+1zkuU6KK4ek/tOWJOzqDVmliKS+8RKkY9b4VGn+YIK/xGo
 3SonN1LOEXSBDPJ/UuzMlJgDJtiR4vPhzAk22hZE9fkT7YsEgDCbLNYjE
 tSL77Ohp7y3jSlkpIiq28WL6PXsG1GJHwflXNS6qaATDKmXDNwBTjDRcv
 6TeoAcXQZqFb/kng3ih1IB32zO8IZJg/u9gaobj2uS+flry5qs9JmkUMX Q==;
X-CSE-ConnectionGUID: cxh8v4GoQ5CFcADnblfwSQ==
X-CSE-MsgGUID: Cv1/27qeR4250YKWpb3J1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11828206"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="11828206"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:06:47 -0700
X-CSE-ConnectionGUID: j08CmKKgReKV9jY6trTomQ==
X-CSE-MsgGUID: 4t9h8wYvQUiY0b0B5EqrWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40405843"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:06:47 -0700
Received: from [10.54.75.156] (debox1-desk1.jf.intel.com [10.54.75.156])
 by linux.intel.com (Postfix) with ESMTP id ECC4A2078A10;
 Thu, 30 May 2024 14:06:46 -0700 (PDT)
Message-ID: <bf1030af93a47bcf4ba12fe4d44da9940fd8e4d3.camel@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/xe/vsec: Support BMG devices
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 14:06:46 -0700
In-Reply-To: <20240510205948.904409-7-michael.j.ruhl@intel.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
 <20240510205948.904409-7-michael.j.ruhl@intel.com>
Autocrypt: addr=david.e.box@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQENBF2w2YABCACw5TpqmFTR6SgsrNqZE8ro1q2lUgVZda26qIi8GeHmVBmu572RfPydisEpCK246rYM5YY9XAps810ZxgFlLyBqpE/rxB4Dqvh04QePD6fQNui/QCSpyZ6j9F8zl0zutOjfNTIQBkcar28hazL9I8CGnnMko21QDl4pkrq1dgLSgl2r2N1a6LJ2l8lLnQ1NJgPAev4BWo4WAwH2rZ94aukzAlkFizjZXmB/6em+lhinTR9hUeXpTwcaAvmCHmrUMxeOyhx+csO1uAPUjxL7olj2J83dv297RrpjMkDyuUOv8EJlPjvVogJF1QOd5MlkWdj+6vnVDRfO8zUwm2pqg25DABEBAAG0KkRhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPokBTgQTAQgAOBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH7Mry1gl3p/NusIAK9z1xnXphedgZMGNzifGUs2UUw/xNl91Q9qRaYGyNYATI6E7zBYmynsUL/4yNFnXK8P/I7WMffiLoMqmUvNp9pG6oYYj8ouvbCexS21jgw54I3m61M+wTokieRIO/GettVlCGhz7YHlHtGGqhzzWB3CGPSJMwsouDPvyFFE+28p5d2v9l6rXSb7T297Kh50VX9Ele8QEKngrG+Z/u2lr/bHEhvx24vI8ka22cuTaZvThYMwLTSC4kq9L9WgRv31JBSa1pcbcHLOCoUl0RaQwe6J8w9hN2uxCssHrrfhSA4YjxKNIIp3YH4IpvzuDR3AadYz1klFTnEOxIM7fvQ2iGu5AQ0EXbDZgAEIAPGbL3wvbYUDGMoBSN89GtiC6ybWo28JSiYIN5N9LhDTwfWROenkRvmTESaE5fAM24sh8S0h+F+eQ7j/E/RF3pM31gSovTKw0Pxk7GorK
 FSa25CWemxSV97zV8fVegGkgfZkBMLUId+AYCD1d2R+tndtgjrHtVq/AeN0N09xv/d3a+Xzc4ib/SQh9mM50ksqiDY70EDe8hgPddYH80jHJtXFVA7Ar1ew24TIBF2rxYZQJGLe+Mt2zAzxOYeQTCW7WumD/ZoyMm7bg46/2rtricKnpaACM7M0r7g+1gUBowFjF4gFqY0tbLVQEB/H5e9We/C2zLG9r5/Lt22dj7I8A6kAEQEAAYkBNgQYAQgAIBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsMAAoJEH7Mry1gl3p/Z/AH/Re8YwzY5I9ByPM56B3Vkrh8qihZjsF7/WB14Ygl0HFzKSkSMTJ+fvZv19bk3lPIQi5lUBuU5rNruDNowCsnvXr+sFxFyTbXw0AQXIsnX+EkMg/JO+/V/UszZiqZPkvHsQipCFVLod/3G/yig9RUO7A/1efRi0E1iJAa6qHrPqE/kJANbz/x+9wcx1VfFwraFXbdT/P2JeOcW/USW89wzMRmOo+AiBSnTI4xvb1s/TxSfoLZvtoj2MR+2PW1zBALWYUKHOzhfFKs3cMufwIIoQUPVqGVeH+u6Asun6ZpNRxdDONop+uEXHe6q6LzI/NnczqoZQLhM8d1XqokYax/IZ4=
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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
Reply-To: david.e.box@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 2024-05-10 at 16:59 -0400, Michael J. Ruhl wrote:
> Utilize the PMT callback API to add support for the BMG
> devices.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 5 +
> =C2=A0drivers/gpu/drm/xe/xe_vsec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 145 +++++++++++++++++++++++++--
> =C2=A0drivers/platform/x86/intel/vsec.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2=
 +-
> =C2=A04 files changed, 146 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index e77768bc4471..940f4cf0274a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -315,6 +315,8 @@ struct xe_device *xe_device_create(struct pci_dev *pd=
ev,
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> +	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
> +
> =C2=A0	err =3D xe_display_create(xe);
> =C2=A0	if (WARN_ON(err))
> =C2=A0		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 0af739981ebf..f451216c2283 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -448,6 +448,11 @@ struct xe_device {
> =C2=A0		struct mutex lock;
> =C2=A0	} d3cold;
> =C2=A0
> +	struct {
> +		/** @pmt.lock: protect access for telemetry data */
> +		struct mutex lock;
> +	} pmt;
> +
> =C2=A0	/**
> =C2=A0	 * @pm_callback_task: Track the active task that is running in eit=
her
> =C2=A0	 * the runtime_suspend or runtime_resume callbacks.
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a91aec49d04a..ac840a1e20a4 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -5,9 +5,12 @@
> =C2=A0#include <linux/intel_vsec.h>
> =C2=A0#include <linux/pci.h>
> =C2=A0
> +#include "xe_device.h"
> =C2=A0#include "xe_device_types.h"
> =C2=A0#include "xe_drv.h"
> +#include "xe_mmio.h"
> =C2=A0#include "xe_platform_types.h"
> +#include "xe_pm.h"
> =C2=A0#include "xe_vsec.h"
> =C2=A0
> =C2=A0#define SOC_BASE		0x280000
> @@ -15,6 +18,10 @@
> =C2=A0/* from drivers/platform/x86/intel/pmt/telemetry.c */
> =C2=A0#define TELEM_BASE_OFFSET	0x8
> =C2=A0
> +/* Decode the guid information */
> +#define GUID_RECORD_MASK GENMASK(1, 0)
> +#define GUID_CAP_TYPE=C2=A0=C2=A0=C2=A0 GENMASK(3, 2)
> +
> =C2=A0#define DG2_PMT_BASE		0xE8000
> =C2=A0#define DG2_DISCOVERY_START	0x6000
> =C2=A0#define DG2_TELEM_START		0x4000
> @@ -22,8 +29,18 @@
> =C2=A0#define DG2_DISCOVERY_OFFSET	(SOC_BASE + DG2_PMT_BASE +
> DG2_DISCOVERY_START)
> =C2=A0#define DG2_TELEM_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_TELEM_START=
)
> =C2=A0
> +#define BMG_PMT_BASE		0xDB000
> +#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
> +
> +#define BMG_TELEMETRY_BASE	0xE0000
> +#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)
> +
> =C2=A0#define GFX_BAR			0
> =C2=A0
> +#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
> +#define SG_REMAP_ACCESS(_mem)	((_mem) << 24)
> +#define SG_REMAP_BITS		GENMASK(31, 24)
> +
> =C2=A0static struct intel_vsec_header dg2_telemetry =3D {
> =C2=A0	.length =3D 0x10,
> =C2=A0	.id =3D VSEC_ID_TELEMETRY,
> @@ -38,12 +55,106 @@ static struct intel_vsec_header *dg2_capabilities[] =
=3D {
> =C2=A0	NULL
> =C2=A0};
> =C2=A0
> -static struct intel_vsec_platform_info dg2_vsec_info =3D {
> -	.caps =3D VSEC_CAP_TELEMETRY,
> -	.headers =3D dg2_capabilities,
> -	.quirks =3D VSEC_QUIRK_EARLY_HW | VSEC_QUIRK_P2SB_OFFSET,
> +static struct intel_vsec_header bmg_telemetry =3D {
> +	.length =3D 0x10,
> +	.id =3D VSEC_ID_TELEMETRY,
> +	.num_entries =3D 2,
> +	.entry_size =3D 4,
> +	.tbir =3D GFX_BAR,
> +	.offset =3D BMG_DISCOVERY_OFFSET,
> +};
> +
> +static struct intel_vsec_header *bmg_capabilities[] =3D {
> +	&bmg_telemetry,
> +	NULL
> +};
> +
> +enum xe_vsec {
> +	XE_VSEC_UNKNOWN =3D 0,
> +	XE_VSEC_DG2,
> +	XE_VSEC_BMG,
> +};
> +
> +static struct intel_vsec_platform_info xe_vsec_info[] =3D {
> +	[XE_VSEC_DG2] =3D {
> +		.caps =3D VSEC_CAP_TELEMETRY,
> +		.headers =3D dg2_capabilities,
> +		.quirks =3D VSEC_QUIRK_EARLY_HW | VSEC_QUIRK_P2SB_OFFSET,
> +	},
> +	[XE_VSEC_BMG] =3D {
> +		.caps =3D VSEC_CAP_TELEMETRY,
> +		.headers =3D bmg_capabilities,
> +	},
> +	{ }

There is some cleanup here as well to support handling multiple platforms. =
Can
these structures just be added to the initial DG2 patch?

David

> =C2=A0};
> =C2=A0
> +#define PUNIT_AGGREGATOR 0
> +#define OOBMSM_AGG0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
> +
> +/*
> + * The telemetry memory space shares a common offset.=C2=A0 To get the a=
ppropriate
> + * data, set the index based on the GUID bits.
> + *
> + * The GUID will have the following bits to decode:
> + *=C2=A0=C2=A0 (2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
> + *=C2=A0=C2=A0 (2bits) - Capability Type (Crashlog-0, Telemetry Aggregat=
or-1, Watcher-
> 2)
> + *=C2=A0=C2=A0 ... <other that are not currently relevant>
> + *
> + * Currently only the record-id is set.=C2=A0 Once the other bits are se=
t, the
> + * decode path will get a little more complex.
> + */
> +static int xe_pmt_telem_read(void *args, u32 guid, u64 *data, u32 count)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device((struct pci_dev *)args);
> +	void __iomem *telem_addr =3D xe->tiles[0].mmio.regs +
> BMG_TELEMETRY_OFFSET;
> +	u32 telem_region =3D guid & GUID_RECORD_MASK;
> +	int ret =3D 0;
> +
> +	/* Update the base offset (if necessary) for the specific telementry
> region */
> +	switch (telem_region) {
> +	case PUNIT_AGGREGATOR:
> +		telem_addr +=3D 0x200;
> +		break;
> +	case OOBMSM_AGG0:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&xe->pmt.lock);
> +	if (xe_pm_runtime_get_if_active(xe) > 0) {
> +		/* set SoC re-mapper index register based on guid memory
> region */
> +		xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1,
> SG_REMAP_BITS,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SG_REMAP_ACCESS(telem_region));
> +
> +		memcpy_fromio(data, telem_addr, count);
> +
> +		xe_pm_runtime_put(xe);
> +
> +		ret =3D count;
> +	}
> +	mutex_unlock(&xe->pmt.lock);
> +
> +	return ret;
> +}
> +
> +struct pmt_callbacks xe_pmt_cb =3D {
> +	.read_telem =3D xe_pmt_telem_read,
> +};
> +
> +static const int vsec_platforms[] =3D {
> +	[XE_DG2] =3D XE_VSEC_DG2,
> +	[XE_BATTLEMAGE] =3D XE_VSEC_BMG,
> +};
> +
> +static enum xe_vsec get_platform_info(struct xe_device *xe)
> +{
> +	if (xe->info.platform > XE_BATTLEMAGE)
> +		return XE_VSEC_UNKNOWN;
> +
> +	return vsec_platforms[xe->info.platform];
> +}
> +
> =C2=A0/*
> =C2=A0 * Access the DG2 PMT MMIO discovery table
> =C2=A0 *
> @@ -92,15 +203,35 @@ static int dg2_adjust_offset(struct pci_dev *pdev, s=
truct
> device *dev,
> =C2=A0 */
> =C2=A0void xe_vsec_init(struct xe_device *xe)
> =C2=A0{
> -	struct intel_vsec_platform_info *info =3D &dg2_vsec_info;
> +	struct intel_vsec_platform_info *info;
> =C2=A0	struct device *dev =3D xe->drm.dev;
> =C2=A0	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	enum xe_vsec platform;
> =C2=A0	u32 ret;
> =C2=A0
> -	ret =3D dg2_adjust_offset(pdev, dev, info);
> -	if (ret)
> +	platform =3D get_platform_info(xe);
> +	if (platform =3D=3D XE_VSEC_UNKNOWN)
> +		return;
> +
> +	info =3D &xe_vsec_info[platform];
> +	if (!info->headers)
> =C2=A0		return;
> =C2=A0
> +	switch (platform) {
> +	case XE_VSEC_DG2:
> +		ret =3D dg2_adjust_offset(pdev, dev, info);
> +		if (ret)
> +			return;
> +		break;
> +
> +	case XE_VSEC_BMG:
> +		info->priv_data =3D &xe_pmt_cb;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * Register a VSEC. Cleanup is handled using device managed
> =C2=A0	 * resources.
> diff --git a/drivers/platform/x86/intel/vsec.c
> b/drivers/platform/x86/intel/vsec.c
> index 5a0dfc21eb0f..f59f8ac87b4e 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -341,7 +341,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev=
,
> =C2=A0void intel_vsec_register(struct pci_dev *pdev,
> =C2=A0			 struct intel_vsec_platform_info *info)
> =C2=A0{
> -	if (!pdev || !info)
> +	if (!pdev || !info || !info->headers)
> =C2=A0		return;
> =C2=A0
> =C2=A0	intel_vsec_walk_header(pdev, info);

