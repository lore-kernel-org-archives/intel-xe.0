Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48E6C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 16:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDBA10EA16;
	Fri, 14 Mar 2025 16:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMGMPEhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC06F10EA16
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741969058; x=1773505058;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YgiCWbeygmskd9MnsK4r5XUq/qGcjE7AS2b0K33khrc=;
 b=lMGMPEhSk2yMFwAQb+UkbdfPvTe5sd279UTFP/M+GX9fwervYzFwFOHU
 MSNpNBNZQOkkRk0VmZL110zyZAGgXp+J1gY1r0l9VzyU66J3QuDBBIALe
 m1P01k7qu/WZ2O5pnnuNUDz4QxEzWjwbRX/gdDwJVqsAp/yf8kDmhzL9z
 Ks6DNdrmnb5hJmnNLCrLzgYVSmKhGj9/XkW9j4jciZG0fxHZbknJ35+B1
 BoppIstYgyzrzJRFvusfnUwDAxGhqWPRiB6tNNXZ2krB0npwywJqpqdsq
 EVm+jBev0DK4svKdF0ul5Nv3VEUCYYv3bKkcCgczTaGqZGlgjou+aKihK Q==;
X-CSE-ConnectionGUID: Wjw3zosUSniv8WmhmG/edQ==
X-CSE-MsgGUID: A6p9oIM4ShOzXIqrIVEiMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43227671"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43227671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 09:17:38 -0700
X-CSE-ConnectionGUID: u6HHuKCsRpuGRxDNZLTDRQ==
X-CSE-MsgGUID: fsgsOOfzRdeQ6Cuun0lQpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121518061"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.166.140])
 ([10.247.166.140])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 09:17:36 -0700
Message-ID: <cf401432-7e15-4e52-ba85-4eb81c108f64@linux.intel.com>
Date: Fri, 14 Mar 2025 21:47:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
To: Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 matthew.d.roper@intel.com
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <6d82e345-aef5-4629-b7e2-4b9281d919ea@linux.intel.com>
 <8e2ecdef-8709-4b9a-a79d-21da5429ee24@intel.com> <Z9LxNEDuyjBFhUuA@intel.com>
 <ubetnx73lqskmhdruqg4z4jqurc6ixydul6k7qijzltsstk2fr@eh4lkbd5x3je>
 <9e3f18b3-eed1-47f2-9bde-5e3b65c5bda3@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <9e3f18b3-eed1-47f2-9bde-5e3b65c5bda3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 14-03-2025 12:54, Riana Tauro wrote:
>
>
> On 3/14/2025 1:22 AM, Lucas De Marchi wrote:
>> On Thu, Mar 13, 2025 at 10:52:36AM -0400, Rodrigo Vivi wrote:
>>> On Thu, Mar 13, 2025 at 11:48:41AM +0530, Riana Tauro wrote:
>>>> Hi Aravind
>>>>
>>>> On 3/10/2025 12:44 PM, Aravind Iddamsetty wrote:
>>>> >
>>>> > On 07-03-2025 19:54, Riana Tauro wrote:
>>>> >
>>>> > Hi Riana,
>>>> >
>>>> > I do think we can achieve the same functionality with module
>>>> param and
>>>> > we needn't reload the driver
>>>> > if we are doing unbind, Since the driver will be loaded event after
>>>> > unbind we can modify the module param
>>>>
>>>> tried this.  We can modify the module param using sysfs and bind
>>>> similar to
>>>> configfs.
>>>>
>>>> If we want to configure any other attributes or move existing
>>>> module params
>>>> to device specific then adding configfs seems better.
>>>>
>>>> @Rodrigo thoughts?
>>>
>>> Yeap, if we make the param write-able and document that it is only
>>> checked
>>> at probe we could indeed use the flow
>>>
>>> echo <bdf> > /sys/../xe/unbind
>>> echo <bdf> > /sys/../xe/param/survivability_mode
>>> echo <bdf> > /sys/../xe/bind
>>>
>>> and accomplish the same.
>>>
>>> on the good side:
>>>
>>> So, this is the future prof case. Because if we start seeing cases
>>> where
>>> the device fails at boot without the FW request for the
>>> survivability mode
>>> we might be forced to have a parameter anyway. :/
>>
>> With parameters we have these possibilities:
>>
>> 1) driver is already loaded:
>>
>>      echo <bdf> > /sys/../xe/unbind
>>      echo <bdf> > /sys/module/xe/parameters/survivability_mode
>>      echo <bdf> > /sys/../xe/bind
>>
>> 2) driver is not loaded
>>
>>      # put all device in survivability mode
>>      modprobe xe survivability_mode=
>>
>> 3) driver not loaded, and only one device in this mode
>>
>>      echo 0 > /sys/bus/pci/drivers_autoprobe
>>      modprobe xe
>>      echo <bdf> > /sys/module/xe/parameters/survivability_mode
>>      echo <bdf> > /sys/../xe/bind
>>
>> With configfs we have these possibilities:
>>
>> a) driver is already loaded:
>>
>>      echo <bdf> > /sys/../xe/unbind
>>      mkdir /sys/kernel/config/xe/0000:03:00.0
>>      echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>      echo <bdf> > /sys/../xe/bind
>>
>> b) driver is not loaded
>>
>>      # no equivalent option for "all devices in survivability mode"
>>      # other than repeating (c) for each since the option is per
>>      # device not per module
>>
>> c) driver not loaded, and only one device in this mode
>>
>>      echo 0 > /sys/bus/pci/drivers_autoprobe
>>      modprobe xe
>>      mkdir /sys/kernel/config/xe/0000:03:00.0
>>      echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>      echo <bdf> > /sys/../xe/bind
>>
>>>
>>> on the bad side:
>>>
>>> But we were actually aiming to reduce the parameters that we have
>>> because that was getting indiscriminately used and even recommended
>>> by some
>>> distros' doc and wikis.
>>>
>>> Another problem with the write-able param is that people might
>>> expect to
>>>
>>> echo <bdf> > /sys/../xe/param/survivability_mode
>>>
>>> and immediately get the device in the survivability_mode for that
>>> device.
>>> Then we are going to get questions and bug reports that this is not
>>> working.
>>>
>>> But well, perhaps documenting the flow properly in the param
>>> description
>>> might solve this concern.
>>>
>>> Lucas, Thomas, thoughts?
>>
>> Let me add here that we will have to extend configuration to more
>> things. The one I will work once this configfs lands (or even before it)
>> is to allow developers to add WAs (or we could say
>> register-save-restore) dynamically so it's much easier to
>> try/error/recover. For that my plan is something like this:
>>
>>      echo 0 > /sys/bus/pci/drivers_autoprobe
>>      modprobe xe
>>      mkdir /sys/kernel/config/xe/0000:03:00.0
>>      cat gt-wa.txt > /sys/kernel/config/xe/0000:03:00.0/gt_wa
>>      cat engine-wa.txt > /sys/kernel/config/xe/0000:03:00.0/engine_wa
>>      echo <bdf> > /sys/../xe/bind
>>
>> And cleanup my kmod "frontend" protoype to make it simpler[1]:
>>
>> i) no additional configuration:
>>
>>      kmod bind --device 0000:03:00.0 xe
>>
>> ii) with configuration stored somewhere:
>>
>>      kmod bind --device 0000:03:00.0 \
>>          --config <path-to-config-dir|path-to-config-tarball> \
>>          xe
>>
>> iii) with configuration in the command line:
>>
>>      kmod bind --device 0000:03:00.0 \
>>          --config-kv survivability_mode:1 \
>>          xe
>>
>> So, I think the configfs approach is more future proof. For a simple
>> switch/panic-button like survivability_mode I wouldn't oppose to have it
>> as a module parameter though. Maybe make the module param read-only
>> and if per-device support is desired, then handle only via configfs?
> yeah survivability mode is per device. Since there is a plan to extend
> configfs for other attributes will go ahead with configfs.
>
> Thank you all for the inputs.

Even if we go ahead with configfs should we support per device, because
thinking from end user or production environment it doesn't
make sense to recover a device from a system while the system is active
in service. In my opinion the entire system will be taken out of
service for maintenance.

Thanks,
Aravind.
>
> Thanks
> Riana
>
>>
>> Lucas De Marchi
>>
>> [1] Typing here without much thought on the actual interface - my
>>      prototype hardcodes it for pci, but the kmod command would
>>      probably have to consider other buses too.
>>
>>>
>>>>
>>>> Thanks
>>>> Riana
>>>> > and once we bind the device back it can check if the BDF belongs
>>>> to this
>>>> > driver instance and configure the mode accordingly.
>>>> >
>>>> > Thanks,
>>>> > Aravind.
>>>> > > Registers a configfs subsystem called 'xe' to userspace. The
>>>> user can
>>>> > > use this to modify exposed attributes.
>>>> > >
>>>> > > Add survivability mode attribute (config/xe/survivability_mode)
>>>> to the
>>>> > > subsystem to allow the user to specify the card that should enter
>>>> > > survivability mode.
>>>> > >
>>>> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> > > ---
>>>> > >   drivers/gpu/drm/xe/Makefile      |  1 +
>>>> > >   drivers/gpu/drm/xe/xe_configfs.c | 95
>>>> +++++++++++++++++++++++++ +++++++
>>>> > >   drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>>>> > >   drivers/gpu/drm/xe/xe_module.c   |  5 ++
>>>> > >   drivers/gpu/drm/xe/xe_module.h   |  1 +
>>>> > >   5 files changed, 114 insertions(+)
>>>> > >   create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>>>> > >   create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>>>> > >
>>>> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/
>>>> Makefile
>>>> > > index 9699b08585f7..3f8c87292cee 100644
>>>> > > --- a/drivers/gpu/drm/xe/Makefile
>>>> > > +++ b/drivers/gpu/drm/xe/Makefile
>>>> > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/
>>>> %_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>>> > >   xe-y += xe_bb.o \
>>>> > >       xe_bo.o \
>>>> > >       xe_bo_evict.o \
>>>> > > +    xe_configfs.o \
>>>> > >       xe_devcoredump.o \
>>>> > >       xe_device.o \
>>>> > >       xe_device_sysfs.o \
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>>>> b/drivers/gpu/drm/ xe/xe_configfs.c
>>>> > > new file mode 100644
>>>> > > index 000000000000..8c5f248e466d
>>>> > > --- /dev/null
>>>> > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>>> > > @@ -0,0 +1,95 @@
>>>> > > +// SPDX-License-Identifier: MIT
>>>> > > +/*
>>>> > > + * Copyright © 2025 Intel Corporation
>>>> > > + */
>>>> > > +
>>>> > > +#include <linux/configfs.h>
>>>> > > +#include <linux/init.h>
>>>> > > +#include <linux/module.h>
>>>> > > +
>>>> > > +#include "xe_configfs.h"
>>>> > > +#include "xe_module.h"
>>>> > > +
>>>> > > +/**
>>>> > > + * DOC: Xe Configfs
>>>> > > + *
>>>> > > + * XE KMD registers a configfs subsystem called 'xe'to
>>>> userspace that allows users to modify
>>>> > > + * the exposed attributes.
>>>> > > + *
>>>> > > + * Attributes:
>>>> > > + *
>>>> > > + * config/xe/survivability_mode : Write only attribute that
>>>> allows user to specify the PCI address
>>>> > > + *                  of the card that has to enter
>>>> survivability mode
>>>> > > + */
>>>> > > +
>>>> > > +void xe_configfs_clear_survivability_mode(void)
>>>> > > +{
>>>> > > +    kfree(xe_modparam.survivability_mode);
>>>> > > +    xe_modparam.survivability_mode = NULL;
>>>> > > +}
>>>> > > +
>>>> > > +static ssize_t survivability_mode_store(struct config_item
>>>> *item, const char *page, size_t len)
>>>> > > +{
>>>> > > +    char *survivability_mode;
>>>> > > +    int ret;
>>>> > > +    unsigned int domain, bus, slot, function;
>>>> > > +
>>>> > > +    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus,
>>>> &slot, &function);
>>>> > > +    if (ret != 4)
>>>> > > +        return -EINVAL;
>>>> > > +
>>>> > > +    survivability_mode = kstrdup(page, GFP_KERNEL);
>>>> > > +    if (!survivability_mode)
>>>> > > +        return -ENOMEM;
>>>> > > +
>>>> > > +    xe_configfs_clear_survivability_mode();
>>>> > > +    xe_modparam.survivability_mode = survivability_mode;
>>>> > > +
>>>> > > +    return len;
>>>> > > +}
>>>> > > +
>>>> > > +CONFIGFS_ATTR_WO(, survivability_mode);
>>>> > > +
>>>> > > +static struct configfs_attribute *xe_configfs_attrs[] = {
>>>> > > +    &attr_survivability_mode,
>>>> > > +    NULL,
>>>> > > +};
>>>> > > +
>>>> > > +static const struct config_item_type xe_config_type = {
>>>> > > +    .ct_attrs    = xe_configfs_attrs,
>>>> > > +    .ct_owner    = THIS_MODULE,
>>>> > > +};
>>>> > > +
>>>> > > +static struct configfs_subsystem xe_config_subsys = {
>>>> > > +    .su_group = {
>>>> > > +        .cg_item = {
>>>> > > +            .ci_namebuf = "xe",
>>>> > > +            .ci_type = &xe_config_type,
>>>> > > +        },
>>>> > > +    },
>>>> > > +};
>>>> > > +
>>>> > > +int __init xe_configfs_init(void)
>>>> > > +{
>>>> > > +    int ret;
>>>> > > +
>>>> > > +    config_group_init(&xe_config_subsys.su_group);
>>>> > > +    mutex_init(&xe_config_subsys.su_mutex);
>>>> > > +    ret = configfs_register_subsystem(&xe_config_subsys);
>>>> > > +    if (ret) {
>>>> > > +        pr_err("Error %d while registering subsystem %s\n",
>>>> > > +               ret,
>>>> xe_config_subsys.su_group.cg_item.ci_namebuf);
>>>> > > +        mutex_destroy(&xe_config_subsys.su_mutex);
>>>> > > +        return ret;
>>>> > > +    }
>>>> > > +
>>>> > > +    return 0;
>>>> > > +}
>>>> > > +
>>>> > > +void __exit xe_configfs_exit(void)
>>>> > > +{
>>>> > > +    xe_configfs_clear_survivability_mode();
>>>> > > +    configfs_unregister_subsystem(&xe_config_subsys);
>>>> > > +    mutex_destroy(&xe_config_subsys.su_mutex);
>>>> > > +}
>>>> > > +
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>>>> b/drivers/gpu/drm/ xe/xe_configfs.h
>>>> > > new file mode 100644
>>>> > > index 000000000000..491629a2ca53
>>>> > > --- /dev/null
>>>> > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
>>>> > > @@ -0,0 +1,12 @@
>>>> > > +/* SPDX-License-Identifier: MIT */
>>>> > > +/*
>>>> > > + * Copyright © 2025 Intel Corporation
>>>> > > + */
>>>> > > +#ifndef _XE_CONFIGFS_H_
>>>> > > +#define _XE_CONFIGFS_H_
>>>> > > +
>>>> > > +int xe_configfs_init(void);
>>>> > > +void xe_configfs_exit(void);
>>>> > > +void xe_configfs_clear_survivability_mode(void);
>>>> > > +
>>>> > > +#endif
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_module.c
>>>> b/drivers/gpu/drm/xe/ xe_module.c
>>>> > > index 475acdba2b55..15b3cf22193c 100644
>>>> > > --- a/drivers/gpu/drm/xe/xe_module.c
>>>> > > +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> > > @@ -11,6 +11,7 @@
>>>> > >   #include <drm/drm_module.h>
>>>> > >   #include "xe_drv.h"
>>>> > > +#include "xe_configfs.h"
>>>> > >   #include "xe_hw_fence.h"
>>>> > >   #include "xe_pci.h"
>>>> > >   #include "xe_pm.h"
>>>> > > @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>>>> > >       {
>>>> > >           .init = xe_check_nomodeset,
>>>> > >       },
>>>> > > +    {
>>>> > > +        .init = xe_configfs_init,
>>>> > > +        .exit = xe_configfs_exit,
>>>> > > +    },
>>>> > >       {
>>>> > >           .init = xe_hw_fence_module_init,
>>>> > >           .exit = xe_hw_fence_module_exit,
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_module.h
>>>> b/drivers/gpu/drm/xe/ xe_module.h
>>>> > > index 84339e509c80..c238dbee6bc7 100644
>>>> > > --- a/drivers/gpu/drm/xe/xe_module.h
>>>> > > +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> > > @@ -24,6 +24,7 @@ struct xe_modparam {
>>>> > >   #endif
>>>> > >       int wedged_mode;
>>>> > >       u32 svm_notifier_size;
>>>> > > +    char *survivability_mode;
>>>> > >   };
>>>> > >   extern struct xe_modparam xe_modparam;
>>>>
>
