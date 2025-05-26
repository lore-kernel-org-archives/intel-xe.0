Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14542C5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 09:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4383410E050;
	Mon, 26 May 2025 09:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bf49cKXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196B810E050
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748252882; x=1779788882;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=SFmxpgJuyEMoIjMgoA8rZ2vJbGyVYT2XJ91HTU1DQfM=;
 b=Bf49cKXEJsQTfF/UyEkzbGkfp+aECsjRSyDiAzzDIWOdaTtitUcdUi/7
 ev0UaxBOTK919EZ8qVOM2gq8dXsRJb4eloNcChyTd82rntpA0/aWNYTSw
 zzCsZOhp0TdHAtsa/IW6yR/DDG0RDdtztnN9RLYO7Ymy2Zp2sUi2/h+H9
 J23gO1/unMYMMkuwE4Ag5eNRramRnvfO5Vax65nMGSZE0meifBjJqVZMx
 GVTgJeTVhkGK3V+/mpUEGcYl7TdvKB5eFXni1zuOtlqUuYroxT2+lNr2T
 WC2SNpckujdr61uiNvS/oASxgge/wkMa0JOXmXTn3awZ9ftIncS8eBf0X Q==;
X-CSE-ConnectionGUID: 9JPOWLgFQ7G2bggRQqY5Pg==
X-CSE-MsgGUID: nGtRGHbjRHOY/R5hCrWfUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="52846036"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="52846036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 02:45:07 -0700
X-CSE-ConnectionGUID: rB5/NNjLTI6OpPStLvQTEw==
X-CSE-MsgGUID: 0iLbXv1BT4efFnipd2Vqbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="179487378"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 02:45:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe/configfs: Add attribute to disable engines
In-Reply-To: <20250523-engine-mask-v3-3-11817dc6eb63@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
 <20250523-engine-mask-v3-3-11817dc6eb63@intel.com>
Date: Mon, 26 May 2025 12:45:01 +0300
Message-ID: <2f852afb7e402fe289a2798987fc83292a9f9c6c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 23 May 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Add the userspace interface to load the driver with fewer engines.
> The syntax is to just echo the engine names to a file in configfs, like
> below:
>
> 	echo 'rcs0,bcs0' > /sys/kernel/config/xe/<bdf>/engine_allowed
>
> With that engines other than rcs0 and bcs0 will not be enabled. To
> enable all instances from a class, a '*' can be used.

Only nitpicks inline! ;D

Do what you want with them, ignoring is fine.

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 137 +++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 135 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 11ca36f194bfc..b27bbe203eb46 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -3,14 +3,19 @@
>   * Copyright =C2=A9 2025 Intel Corporation
>   */
>=20=20
> +#include <linux/bitops.h>
>  #include <linux/configfs.h>
> +#include <linux/find.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/string.h>
>=20=20
>  #include "xe_configfs.h"
>  #include "xe_module.h"
>=20=20
> +#include "xe_hw_engine_types.h"
> +
>  /**
>   * DOC: Xe Configfs
>   *
> @@ -48,6 +53,23 @@
>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>   *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivabi=
lity mode if supported)
>   *
> + * Allowed engine:
> + * ---------------
> + *
> + * Allow only a set of engine(s) to be available - this is the equivalen=
t of
> + * fusing engines off in software. Examples:
> + *
> + * Allow only one render and one copy engines, nothing else::
> + *
> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
> + *
> + * Allow only compute engines and first copy engine::
> + *
> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
> + *
> + * The requested configuration may not be supported by the platform and =
driver
> + * may fail to probe - intended for debugging purposes.
> + *
>   * Remove devices
>   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   *
> @@ -60,11 +82,26 @@ struct xe_config_device {
>  	struct config_group group;
>=20=20
>  	bool survivability_mode;
> +	u64 engine_allowed;
>=20=20
>  	/* protects attributes */
>  	struct mutex lock;
>  };
>=20=20
> +struct engine_info {
> +	const char *cls;
> +	u64 mask;
> +};
> +
> +static const struct engine_info engine_info[] =3D {
> +	{ .cls =3D "rcs", .mask =3D XE_HW_ENGINE_RCS_MASK },
> +	{ .cls =3D "bcs", .mask =3D XE_HW_ENGINE_BCS_MASK },
> +	{ .cls =3D "vcs", .mask =3D XE_HW_ENGINE_VCS_MASK },
> +	{ .cls =3D "vecs", .mask =3D XE_HW_ENGINE_VECS_MASK },
> +	{ .cls =3D "ccs", .mask =3D XE_HW_ENGINE_CCS_MASK },
> +	{ .cls =3D "gsccs", .mask =3D XE_HW_ENGINE_GSCCS_MASK },
> +};
> +
>  static struct xe_config_device *to_xe_config_device(struct config_item *=
item)
>  {
>  	return container_of(to_config_group(item), struct xe_config_device, gro=
up);
> @@ -94,10 +131,95 @@ static ssize_t survivability_mode_store(struct confi=
g_item *item, const char *pa
>  	return len;
>  }
>=20=20
> +static ssize_t engine_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev =3D to_xe_config_device(item);
> +	char *p =3D page;
> +
> +	for (size_t i =3D 0; i < ARRAY_SIZE(engine_info); i++) {
> +		u64 mask =3D engine_info[i].mask;
> +
> +		if ((dev->engine_allowed & mask) =3D=3D mask) {
> +			p +=3D sprintf(p, "%s*\n", engine_info[i].cls);
> +		} else if (mask & dev->engine_allowed) {
> +			u16 bit0 =3D __ffs64(mask), bit;
> +
> +			mask &=3D dev->engine_allowed;
> +
> +			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
> +				p +=3D sprintf(p, "%s%u\n", engine_info[i].cls,
> +					     bit - bit0);
> +		}
> +	}
> +
> +	return p - page;
> +}
> +
> +static bool lookup_engine_mask(const char *name, size_t namelen, u64 *ma=
sk)

Arguably s/name/pattern/ would be easier to grasp.

I would pass in a single NUL terminated pattern instead of pattern and
length. Following comments are based on that idea. Everything becomes
easier.

> +{
> +	for (size_t i =3D 0; i < ARRAY_SIZE(engine_info); i++) {
> +		size_t clslen =3D strlen(engine_info[i].cls);
> +		size_t numlen =3D namelen - clslen;
> +		char instancestr[4];

None of the above locals are needed.

> +		u8 instance;
> +		u16 bit;
> +
> +		if (namelen <=3D clslen || strncmp(name, engine_info[i].cls, clslen))
> +			continue;
> +

		if (!str_has_prefix(pattern, engine_info[i].cls))
			continue;

		pattern +=3D strlen(engine_info[i].cls);

> +		if (name[clslen] =3D=3D '*' && numlen =3D=3D 1) {

		if (!strcmp(pattern, "*"))

> +			*mask =3D engine_info[i].mask;
> +			return true;
> +		}
> +
> +		if (numlen > sizeof(instancestr) - 1)
> +			return false;

Not needed.

> +
> +		memcpy(instancestr, name + clslen, numlen);
> +		instancestr[numlen] =3D '\0';

Not needed.

> +
> +		if (kstrtou8(instancestr, 10, &instance))

		if (kstrtou8(pattern, 10, &instance))

> +			return false;
> +
> +		bit =3D __ffs64(engine_info[i].mask) + instance;
> +		if (bit > fls64(engine_info[i].mask))
> +			return false;
> +
> +		*mask =3D BIT_ULL(bit);

Arguably this would benefit from a function:

static u64 match(const struct engine_info *info, const char *pattern)

> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static ssize_t engine_allowed_store(struct config_item *item, const char=
 *page,
> +				    size_t len)
> +{
> +	struct xe_config_device *dev =3D to_xe_config_device(item);
> +	size_t namelen, p;
> +	u64 mask, val =3D 0;
> +
> +	for (p =3D 0; p < len; p +=3D namelen + 1) {
> +		namelen =3D strcspn(page + p, ",\n");

lookup_engine_mask() would become a whole lot easier and simpler if this
part here copied the string to a local buffer, and passed a NUL
terminated string as pattern instead. You need the local buf anyway, so
why not here, where it's the most beneficial?

BR,
Jani.

> +		if (!lookup_engine_mask(page + p, namelen, &mask))
> +			return -EINVAL;
> +
> +		val |=3D mask;
> +	}
> +
> +	mutex_lock(&dev->lock);
> +	dev->engine_allowed =3D val;
> +	mutex_unlock(&dev->lock);
> +
> +	return len;
> +}
> +
>  CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_ATTR(, engine_allowed);
>=20=20
>  static struct configfs_attribute *xe_config_device_attrs[] =3D {
>  	&attr_survivability_mode,
> +	&attr_engine_allowed,
>  	NULL,
>  };
>=20=20
> @@ -139,6 +261,9 @@ static struct config_group *xe_config_make_device_gro=
up(struct config_group *gro
>  	if (!dev)
>  		return ERR_PTR(-ENOMEM);
>=20=20
> +	/* Default values */
> +	dev->engine_allowed =3D U64_MAX;
> +
>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>=20=20
>  	mutex_init(&dev->lock);
> @@ -237,8 +362,16 @@ void xe_configfs_clear_survivability_mode(struct pci=
_dev *pdev)
>   */
>  u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>  {
> -	/* dummy implementation */
> -	return U64_MAX;
> +	struct xe_config_device *dev =3D configfs_find_group(pdev);
> +	u64 engine_allowed;
> +
> +	if (!dev)
> +		return U64_MAX;
> +
> +	engine_allowed =3D dev->engine_allowed;
> +	config_item_put(&dev->group.cg_item);
> +
> +	return engine_allowed;
>  }
>=20=20
>  int __init xe_configfs_init(void)

--=20
Jani Nikula, Intel
