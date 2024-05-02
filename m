Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460AEC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 11:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89F10E341;
	Thu,  2 May 2024 11:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R28uctmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCEF10E39C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714647667; x=1746183667;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qjG/R6nzcsBkplLwehmg/bm0GC7yqLimPMf359r+LOE=;
 b=R28uctmH0VxHqTJM7ZB3GbsQiBoHDHFo80Ob0bsqrdgBxMuSqg9rlm9s
 RzJ3p2LIrmVnjGfkYblz4l+DsJ6E1g7NyRoFMgWdgAomc20Hcr5g/Lj5w
 2r74V0hzuqCoMwHYggjKOvSFJAhdcYbukAeXYlLjxJawTMBXrVKIyI5CW
 ykW+uXn1UupJMNxKHIBgJWRz3hWhaEhhCmXmxOiYbdK9+GafXGUEZcrgg
 +98m6zVWqeR+5lTDPoqvujI2P+9ZDvNLaSprvN/F1goI9DkdJgX9KvX/Q
 rC5ewa09sYOwP01Z4btJoDINTQxors8Sf7lWSkJBsUDs95ulTlgW78DaG A==;
X-CSE-ConnectionGUID: eP1zqiXXQvSzb0rP+/N54w==
X-CSE-MsgGUID: G20XxiSZRTqLkkn2PHYEqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10337405"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10337405"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 04:01:06 -0700
X-CSE-ConnectionGUID: ZR/LV04eRlidune7Al2Enw==
X-CSE-MsgGUID: yYpaSNkoQjiFbyW1R+RXkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27594640"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 02 May 2024 04:01:04 -0700
Received: from [10.246.17.255] (unknown [10.246.17.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 461252879A;
 Thu,  2 May 2024 12:01:02 +0100 (IST)
Message-ID: <3ab475e9-b5ae-4dca-8764-806a8236e883@intel.com>
Date: Thu, 2 May 2024 13:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pf: Implement pci_driver.sriov_configure
 callback
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240426132217.2351-1-michal.wajdeczko@intel.com>
 <20240426150713.ntnegd6r4s3qbpvk@intel.com>
 <29b2e173-55f3-48dc-9343-b107812fffac@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <29b2e173-55f3-48dc-9343-b107812fffac@intel.com>
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

+ @Rodrigo

On 30.04.2024 13:25, Nilawar, Badal wrote:
> 
> 
> On 26-04-2024 20:37, Piotr Piórkowski wrote:
>> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią
>> [2024-kwi-26 15:22:17 +0200]:
>>> The PCI subsystem already exposes the "sriov_numvfs" attribute
>>> that users can use to enable or disable SR-IOV VFs. Add custom
>>> implementation of the .sriov_configure callback defined by the
>>> pci_driver to perform additional steps, including fair VFs
>>> provisioning with the resources, as required by our platforms.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>> ---
>>> v2: check result of VFs provisioning (Piotr)
>>>      use xe_sriov_pf_get_totalvfs consistently (Piotr)
>>>      prefer VFID instead of plain a VF number (Piotr)
>>> ---
>>>   drivers/gpu/drm/xe/Makefile       |   1 +
>>>   drivers/gpu/drm/xe/xe_pci.c       |   4 +
>>>   drivers/gpu/drm/xe/xe_pci_sriov.c | 138 ++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_pci_sriov.h |  13 +++
>>>   4 files changed, 156 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index a67977edff5b..6acde66f0827 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -169,6 +169,7 @@ xe-$(CONFIG_PCI_IOV) += \
>>>       xe_lmtt.o \
>>>       xe_lmtt_2l.o \
>>>       xe_lmtt_ml.o \
>>> +    xe_pci_sriov.o \
>>>       xe_sriov_pf.o
>>>     # include helpers for tests even when XE is built-in
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index a0cf5dd803c2..f3efde939df4 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -23,6 +23,7 @@
>>>   #include "xe_macros.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_module.h"
>>> +#include "xe_pci_sriov.h"
>>>   #include "xe_pci_types.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_sriov.h"
>>> @@ -952,6 +953,9 @@ static struct pci_driver xe_pci_driver = {
>>>       .probe = xe_pci_probe,
>>>       .remove = xe_pci_remove,
>>>       .shutdown = xe_pci_shutdown,
>>> +#ifdef CONFIG_PCI_IOV
>>> +    .sriov_configure = xe_pci_sriov_configure,
>>> +#endif
>>>   #ifdef CONFIG_PM_SLEEP
>>>       .driver.pm = &xe_pm_ops,
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> b/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> new file mode 100644
>>> index 000000000000..75248fdd6cee
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> @@ -0,0 +1,138 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023-2024 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_assert.h"
>>> +#include "xe_device.h"
>>> +#include "xe_gt_sriov_pf_config.h"
>>> +#include "xe_pci_sriov.h"
>>> +#include "xe_pm.h"
>>> +#include "xe_sriov.h"
>>> +#include "xe_sriov_pf_helpers.h"
>>> +#include "xe_sriov_printk.h"
>>> +
>>> +static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>>> +{
>>> +    struct xe_gt *gt;
>>> +    unsigned int id;
>>> +    int result = 0, err;
>>> +
>>> +    for_each_gt(gt, xe, id) {
>>> +        err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>>> +        result = result ?: err;
>>> +    }
>>> +
>>> +    return result;
>>> +}
>>> +
>>> +static void pf_unprovision_vfs(struct xe_device *xe, unsigned int
>>> num_vfs)
>>> +{
>>> +    struct xe_gt *gt;
>>> +    unsigned int id;
>>> +    unsigned int n;
>>> +
>>> +    for_each_gt(gt, xe, id)
>>> +        for (n = 1; n <= num_vfs; n++)
>>> +            xe_gt_sriov_pf_config_release(gt, n, true);
>>> +}
>>> +
>>> +static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>> +{
>>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> +    int total_vfs = xe_sriov_pf_get_totalvfs(xe);
>>> +    int err;
>>> +
>>> +    xe_assert(xe, IS_SRIOV_PF(xe));
>>> +    xe_assert(xe, num_vfs > 0);
>>> +    xe_assert(xe, num_vfs <= total_vfs);
>>> +    xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs,
>>> str_plural(num_vfs));
>>> +
>>> +    /*
>>> +     * hold additional reference to the runtime PM as long as VFs are
>>> +     * enabled to keep GuC alive - will be released in pf_disable_vfs()
>>> +     */
> AFAIK PF shouldn't be placed in lower power state than VF. With that in
> above comment we should mention PF alive rather than GuC alive.

from the VFs provisioning POV we are more interested in that the GuC
will be kept alive, and in result we will have PF also alive.

but maybe indeed it will be better to refer to the PCI level spec:

/*
 * We must hold additional reference to the runtime PM to keep PF in D0
 * during VFs lifetime, as our VFs do not implement the PM capability.
 *
 * With PF being in D0 state, all VFs will also behave as in D0 state.
 * This will also keep GuC alive with all VFs' configurations.
 *
 * We will release this additional PM reference in pf_disable_vfs().
 */

sounds better ?

>>> +    xe_pm_runtime_get(xe);

@Rodrigo, is this ok, or based on below discussion this should be
xe_pm_runtime_get_noresume() instead?

>>> +
>>> +    err = pf_provision_vfs(xe, num_vfs);
>>> +    if (err < 0)
>>> +        goto failed;
>>> +
>>> +    err = pci_enable_sriov(pdev, num_vfs);
>>> +    if (err < 0)
>>> +        goto failed;
>>> +
>>> +    xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>>> +              num_vfs, total_vfs, str_plural(total_vfs));
>>> +    return num_vfs;
>>> +
>>> +failed:
>>> +    pf_unprovision_vfs(xe, num_vfs);
>>> +    xe_pm_runtime_put(xe);
>>> +
>>> +    xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>>> +            num_vfs, str_plural(num_vfs), ERR_PTR(err));
>>> +    return err;
>>> +}
>>> +
>>> +static int pf_disable_vfs(struct xe_device *xe)
>>> +{
>>> +    struct device *dev = xe->drm.dev;
>>> +    struct pci_dev *pdev = to_pci_dev(dev);
>>> +    u16 num_vfs = pci_num_vf(pdev);
>>> +
>>> +    xe_assert(xe, IS_SRIOV_PF(xe));
>>> +    xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs,
>>> str_plural(num_vfs));
>>> +
>>> +    if (!num_vfs)
>>> +        return 0;
>>> +
>>> +    pci_disable_sriov(pdev);
>>> +
>>> +    pf_unprovision_vfs(xe, num_vfs);
>>> +
>>> +    /* not needed anymore - see pf_enable_vfs() */
>>> +    xe_pm_runtime_put(xe);
>>> +
>>> +    xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs,
>>> str_plural(num_vfs));
>>> +    return 0;
>>> +}
>>> +
>>> +/**
>>> + * xe_pci_sriov_configure - Configure SR-IOV (enable/disable VFs).
>>> + * @pdev: the &pci_dev
>>> + * @num_vfs: number of VFs to enable or zero to disable all VFs
>>> + *
>>> + * This is the Xe implementation of struct
>>> pci_driver.sriov_configure callback.
>>> + *
>>> + * This callback will be called by the PCI subsystem to enable or
>>> disable SR-IOV
>>> + * Virtual Functions (VFs) as requested by the used via the PCI
>>> sysfs interface.
>>> + *
>>> + * Return: number of configured VFs or a negative error code on
>>> failure.
>>> + */
>>> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +    int ret;
>>> +
>>> +    if (!IS_SRIOV_PF(xe))
>>> +        return -ENODEV;
>>> +
>>> +    if (num_vfs < 0)
>>> +        return -EINVAL;
>>> +
>>> +    if (num_vfs > xe_sriov_pf_get_totalvfs(xe))
>>> +        return -ERANGE;
>>> +
>>> +    if (num_vfs && pci_num_vf(pdev))
>>> +        return -EBUSY;
>>> +
>>> +    xe_pm_runtime_get(xe);
> I think this is not needed as rpm ref is already being held and released
> in vfs enable and disble function.

IMO this is the 'outer-bound' caller, as called by our PM doc, which
should take the initial reference, while rpm calls in enable_vfs() and
disable_vfs() are just additional one, SR-IOV VFs lifetime specific, to
allow VFs to operate.

@Rodrigo, is my above understanding correct ?

> 
> Regards,
> Badal
>>> +    if (num_vfs > 0)
>>> +        ret = pf_enable_vfs(xe, num_vfs);
>>> +    else
>>> +        ret = pf_disable_vfs(xe);
>>> +    xe_pm_runtime_put(xe);
>>> +
>>> +    return ret;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h
>>> b/drivers/gpu/drm/xe/xe_pci_sriov.h
>>> new file mode 100644
>>> index 000000000000..3b8bfbf7e1d9
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023-2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_PCI_SRIOV_H_
>>> +#define _XE_PCI_SRIOV_H_
>>> +
>>> +struct pci_dev;
>>> +
>>> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
>>> +
>>> +#endif
>>
>>
>> LGTM:
>> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>
>>> -- 
>>> 2.43.0
>>>
>>
