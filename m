Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238A4C001DF
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 14:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D271110E1F1;
	Wed,  2 Aug 2023 14:15:07 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B52489160
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 14:15:06 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3490a1f8ae0so22257105ab.2
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Aug 2023 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690985705; x=1691590505;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UwCnlAPKhLtAH5NwQSSuuJAOXvBPJ+1xzh6zZ/WllQ4=;
 b=q/ptiYBh0qOBl5hnOoNWMXHPlBMAO5E7RQRwsCDqf9n5IVWVmZTR0laPVQCJe49Jp6
 0AKgfYJr18Id6YOLI+pxTiN8evo344hyt+BURj8drKQ8usuSasGZr/fBDSaQs+O9jX5s
 7mcQQ6n3Pka1AuT0rnWsolR7a88ICh5ShJPWDb5u5I8lVLR8AFGZtJdZgHNXyp6apgKw
 RFz4bryzAqZPKzObS7gby2XzV6DAUYCvvTxSXhcX9Cyl+MumBnilcrQMpAZCq8S9JhSX
 t6dUYX/YmB7naNY4dLtGs5AW/szgUOmYfUkgVqmLWXcZZ36yAZlMn0ko9TWy+d6a6mUw
 AGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690985705; x=1691590505;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UwCnlAPKhLtAH5NwQSSuuJAOXvBPJ+1xzh6zZ/WllQ4=;
 b=E6OyFdSqy2NbmfHBjwGVGN9DwGbAfaWp8g4Dh3L5RdiDvC2Ag/dja1H05nNxqmYjwd
 K0tNFGpNHumKgDo82tPSBmAzhgAnuZW6ogTGYI7uFFYWfrtIPgfkJxd68HbtFKqFe/pL
 Y1Qz6ouy/ZHWVhwyQPcaSPov5ff9nOesYXaSAw0y4oiF9n4VxWPNK/zISssZUluqovmU
 DKYSbWawffcc5cdyBYGo19P1nPxuBt/BK+P71UxsBLZ8ZE4rZjFMIoEj7nQRQUKGBj4x
 NNi0e5rbVnysRMOyZPbYij6ISQbBuujcrm8RlvV2SHRNgVj0L5CiJp81A21SdBGo7IES
 2jhA==
X-Gm-Message-State: ABy/qLbDCn0lXQrkB0f/6g//TWGJUBDTBsIS+gfec0vHR8qIWQIb7Lgq
 eq/dosl3iSxrA+Yfds9B58Sr/YfY1Fw=
X-Google-Smtp-Source: APBJJlEEG107Lg+tkvsMO2Cfx+KSWDlXg+dIzd+As2w+pquxRZC1+zYClBtE4p/5j1xo3NS8unXkcw==
X-Received: by 2002:a05:6e02:1805:b0:348:8576:15b5 with SMTP id
 a5-20020a056e02180500b00348857615b5mr12374654ilv.3.1690985705075; 
 Wed, 02 Aug 2023 07:15:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a92ce91000000b0034267d3fcc5sm4537623ilo.55.2023.08.02.07.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 07:15:04 -0700 (PDT)
Message-ID: <5deda843-a9e6-2fe8-ed85-41cd70b287ae@roeck-us.net>
Date: Wed, 2 Aug 2023 07:15:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230802135241.458855-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
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

On 8/2/23 06:52, Badal Nilawar wrote:
> The xe HWMON module will be used to expose voltage, power and energy
> values for dGfx. Here we set up xe hwmon infrastructure including xe
> hwmon registration, basic data structures and functions.
> 
> v2:
>    - Fix review comments (Riana)
> v3:
>    - %s/hwm_/hwmon/ (Matt Brost)
>    - Use drmm_mutex_init (Matt Brost)
>    - Print error value (Matt Brost)
>    - %s/hwmon_drvdata/xe_hwmon_data/
>    - Move rpm (xe_device_mem_access_get/put) calls
>      to this patch (Matt Brost)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |   3 +
>   drivers/gpu/drm/xe/xe_device.c       |   5 +
>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>   drivers/gpu/drm/xe/xe_hwmon.c        | 150 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.h        |  22 ++++
>   5 files changed, 182 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4ea9e3150c20..831be23e000b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -116,6 +116,9 @@ xe-y += xe_bb.o \
>   	xe_wa.o \
>   	xe_wopcm.o
>   
> +# graphics hardware monitoring (HWMON) support
> +xe-$(CONFIG_HWMON) += xe_hwmon.o
> +
>   # i915 Display compat #defines and #includes
>   subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>   	-I$(srctree)/$(src)/display/ext \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5409cf7895d3..01bd08812514 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>   #include "xe_vm.h"
>   #include "xe_vm_madvise.h"
>   #include "xe_wait_user_fence.h"
> +#include "xe_hwmon.h"
>   
>   #ifdef CONFIG_LOCKDEP
>   struct lockdep_map xe_device_mem_access_lockdep_map = {
> @@ -335,6 +336,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_debugfs_register(xe);
>   
> +	xe_hwmon_register(xe);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>   	if (err)
>   		return err;
> @@ -361,6 +364,8 @@ static void xe_device_remove_display(struct xe_device *xe)
>   
>   void xe_device_remove(struct xe_device *xe)
>   {
> +	xe_hwmon_unregister(xe);
> +
>   	xe_device_remove_display(xe);
>   
>   	xe_display_unlink(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b156f69d7320..dd06eba815ec 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -376,6 +376,8 @@ struct xe_device {
>   	 */
>   	struct task_struct *pm_callback_task;
>   
> +	struct xe_hwmon *hwmon;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> new file mode 100644
> index 000000000000..5e35128a61a8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/hwmon.h>
> +
> +#include <drm/drm_managed.h>
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_hwmon.h"
> +
> +struct xe_hwmon_data {
> +	struct device *hwmon_dev;
> +	struct xe_gt *gt;
> +	char name[12];
> +};
> +
> +struct xe_hwmon {
> +	struct xe_hwmon_data ddat;
> +	struct mutex hwmon_lock;
> +};
> +
> +static const struct hwmon_channel_info *hwmon_info[] = {
> +	NULL
> +};
> +
> +static umode_t
> +hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +		 u32 attr, int channel)
> +{
> +	struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	switch (type) {
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
> +}
> +
> +static int
> +hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	   int channel, long *val)
> +{
> +	struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	switch (type) {
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
> +}
> +
> +static int
> +hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	    int channel, long val)
> +{
> +	struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	switch (type) {
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
> +}
> +
> +static const struct hwmon_ops hwmon_ops = {
> +	.is_visible = hwmon_is_visible,
> +	.read = hwmon_read,
> +	.write = hwmon_write,
> +};
> +
> +static const struct hwmon_chip_info hwmon_chip_info = {
> +	.ops = &hwmon_ops,
> +	.info = hwmon_info,
> +};
> +
> +static void
> +hwmon_get_preregistration_info(struct xe_device *xe)
> +{
> +}
> +
> +void xe_hwmon_register(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	struct xe_hwmon_data *ddat;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(xe))
> +		return;
> +
> +	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return;
> +
> +	xe->hwmon = hwmon;
> +	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
> +
> +	ddat = &hwmon->ddat;
> +
> +	/* primary GT to access device level properties */
> +	ddat->gt = xe->tiles[0].primary_gt;
> +
> +	snprintf(ddat->name, sizeof(ddat->name), "xe");

Why not just pass "xe" as string to devm_hwmon_device_register_with_info() ?

> +
> +	hwmon_get_preregistration_info(xe);
> +
> +	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> +
> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
> +							 ddat,
> +							 &hwmon_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
> +		xe->hwmon = NULL;
> +		return;
> +	}
> +

What is xe->hwmon used for other than for setting it to NULL
in xe_hwmon_unregister() ?

> +	ddat->hwmon_dev = hwmon_dev;
> +}
> +
> +void xe_hwmon_unregister(struct xe_device *xe)
> +{
> +	xe->hwmon = NULL;
> +}

Not sure I understand why this function is needed. Please explain.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> new file mode 100644
> index 000000000000..a078eeb0a68b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_HWMON_H__
> +#define __XE_HWMON_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +#if IS_REACHABLE(CONFIG_HWMON)
> +void xe_hwmon_register(struct xe_device *xe);
> +void xe_hwmon_unregister(struct xe_device *xe);
> +#else
> +static inline void xe_hwmon_register(struct xe_device *xe) { };
> +static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +#endif
> +
> +#endif /* __XE_HWMON_H__ */

