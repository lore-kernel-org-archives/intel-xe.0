Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A30BC7EE22
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 09:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DAF10E18A;
	Mon, 15 May 2023 09:38:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84D310E18A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684143510; x=1715679510;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ChIodViclpjej52Ak/HcAEBrv7ENFdHVjlt1MMfEDUg=;
 b=ZDgOg3ty+lnU+M7OITl3YUqqd3YhrScSfGikOihd67JruFhG/N5PtvTe
 gEmTYkRQ4jUwHKcwbO7JDV8txmZOVWbtDKOobPhExRTkGauy6M/s5SjPi
 +JfOGXPhNigmgnhES2NpCJzB0K3E9J7INEujLCjSC5iSibiI+spyH6MMb
 /ToPKxww7azcTYrBBzk30FQ7b+oK1fsNI7k+OZaADVLR5atkdtjGmKQXA
 a0OO51TiTXZeBAXImlwX5J9dcCCXKS4ptr8YOsAYgQ5r4LM8ft2X4dSMj
 eUbcofsgXqmSwctmbOelR95PwiVodFl76+pvuBDK3HqCz/2T+HhPfpWbU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="348651067"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="348651067"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="845195101"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="845195101"
Received: from cstoita-mobl.ger.corp.intel.com (HELO [10.249.254.124])
 ([10.249.254.124])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:38:12 -0700
Message-ID: <ed9ba5c3-1769-5c23-9bad-064b9a316e32@linux.intel.com>
Date: Mon, 15 May 2023 11:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230512093632.2988909-1-anshuman.gupta@intel.com>
 <6fe0d5352a52b6ca19c370d1fc3a4eabd6aa3826.camel@linux.intel.com>
 <ZF5FbiNj8D8U6RLF@rdvivi-mobl4>
 <CY5PR11MB621122C90ED5A967E5F2133395789@CY5PR11MB6211.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CY5PR11MB621122C90ED5A967E5F2133395789@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC] drm/xe/pm: d3cold policy
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi!

On 5/15/23 08:34, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
>> Sent: Friday, May 12, 2023 7:26 PM
>> To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [Intel-xe] [RFC] drm/xe/pm: d3cold policy
>>
>> On Fri, May 12, 2023 at 03:13:05PM +0200, Thomas Hellström wrote:
>>> On Fri, 2023-05-12 at 15:06 +0530, Anshuman Gupta wrote:
>>>> Adding pci d3cold capable check support.
>>>> Adding a vram_save_restore_threshold modparam, that is the
>>> Please use imperative language as per the Linux patch-submission
>>> guidelines.
>>>
>>> "Add pci d3cold capable check support."
>>>
>>> Typos:
>>>> permissisble threshold for vram save/restore. If vram used
>>> permissible
>>>> is more then
>>> more than
>>>>   the threshold value then disabllow
>>> disallow
>>>>   the d3cold
>>>> to avoid the vram save/restore latency.
>>>>
>>>> TODO: At resume vram save/restore only in case card really lost
>>>> power.
>>>>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>>>>   drivers/gpu/drm/xe/xe_module.c       |  4 +++
>>>>   drivers/gpu/drm/xe/xe_module.h       |  1 +
>>>>   drivers/gpu/drm/xe/xe_pci.c          | 46
>>>> ++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_pm.c           | 20 ++++++++++++
>>>>   drivers/gpu/drm/xe/xe_pm.h           |  1 +
>>>>   6 files changed, 75 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 1cb404e48aaa..1137f544575d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -263,6 +263,9 @@ struct xe_device {
>>>>                  bool hold_rpm;
>>>>          } mem_access;
>>>>
>>>> +       /** d3cold_capable: Indicates if root port is d3cold capable
>>>> */
>>>> +       bool d3cold_capable;
>>>> +
>>>>          /** @d3cold_allowed: Indicates if d3cold is a valid device
>>>> state */
>>>>          bool d3cold_allowed;
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c
>>>> b/drivers/gpu/drm/xe/xe_module.c index 6860586ce7f8..1dd515ed8a65
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -26,6 +26,10 @@ u32 xe_force_vram_bar_size;
>>>>   module_param_named(vram_bar_size, xe_force_vram_bar_size, uint,
>>>> 0600);
>>>>   MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>>>>
>>>> +u32 xe_vram_save_restore_threshold = 300;
>>>> +module_param_named(vram_save_restore_threshold,
>>>> xe_vram_save_restore_threshold, uint, 0600);
>>>> +MODULE_PARM_DESC(vram_save_restore_threshold, "Set the vram
>> used
>>>> threshold below which vram save/restore premissible (in MB)");
>>> With one-driver-multiple-devices, Would we want to use this as the
>>> default template and then have an interface to set it per-device?
>> probably a good idea. to have a sysfs per device.
>> and sysfs only appears if d3cold is ever possible and supported.
> I have some doubts over handling of sysfs.
> AFAIU this modparam is per pci device.
> What are we referring here as per device ?
> Is it multiple tiles ?

I was thinking about an example where you have, lets say 4 DG2s that are 
bound to the same xe driver instance. You want them to have different 
limits.

> d3cold is state a for a pci device, so "vram_used" metric has to be account all vram
> instances in a gpu card, so sysfs for this parameter should be linked to pci device under
> /sys/bus/pci/devices/$bdf
> directory ?

I'm not fully familiar with the sysfs layout used on xe, perhaps Rodrigo 
can fill in, but perhaps it makes sense to have them in the same 
directory as the gt0..gtX subdirectories? Looks like it's the same path 
as you write above.

/Thomas


>
> Thanks ,
> Anshuman Gupta.
>>> Thanks,
>>> Thomas
>>>
>>>
>>>
>>>> +
>>>>   int xe_guc_log_level = 5;
>>>>   module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>>>>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level
>>>> (0=disable, 1..5=enable with verbosity min..max)"); diff --git
>>>> a/drivers/gpu/drm/xe/xe_module.h
>> b/drivers/gpu/drm/xe/xe_module.h
>>>> index 7169907c3365..620d1b80cab6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> @@ -9,5 +9,6 @@
>>>>   extern bool enable_guc;
>>>>   extern bool enable_display;
>>>>   extern u32 xe_force_vram_bar_size;
>>>> +extern u32 xe_vram_save_restore_threshold;
>>>>   extern int xe_guc_log_level;
>>>>   extern char *xe_param_force_probe;
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>>>> b/drivers/gpu/drm/xe/xe_pci.c index ee61a03d1afd..2c86a8ab727a
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -592,6 +592,40 @@ static void
>>>> xe_pci_unbounded_bridge_disable_pm(struct pci_dev *pdev)
>>>>          }
>>>>   }
>>>>
>>>> +static bool xe_pci_d3cold_capable(struct pci_dev *pdev) {
>>>> +       struct pci_dev *root_pdev;
>>>> +
>>>> +       root_pdev = pcie_find_root_port(pdev);
>>>> +       if (!root_pdev)
>>>> +               return false;
>>>> +
>>>> +       /* D3Cold requires PME capability and _PR3 power resource */
>>>> +       if (!pci_pme_capable(root_pdev, PCI_D3cold) ||
>>>> !pci_pr3_present(root_pdev))
>>>> +               return false;
>>>> +
>>>> +       return true;
>>>> +}
>>>> +
>>>> +static void xe_pci_d3cold_enable_disable(struct pci_dev *pdev, bool
>>>> enable)
>>>> +{
>>>> +       struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +       struct pci_dev *root_pdev;
>>>> +
>>>> +       if (!xe->d3cold_capable)
>>>> +               return;
>>>> +
>>>> +       root_pdev = pcie_find_root_port(pdev);
>>>> +       if (!root_pdev)
>>>> +               return;
>>>> +
>>>> +       if (enable)
>>>> +               pci_d3cold_enable(pdev);
>>>> +       else
>>>> +               pci_d3cold_disable(pdev);
>>>> +
>>>> +}
>>>> +
>>>>   static int xe_pci_probe(struct pci_dev *pdev, const struct
>>>> pci_device_id *ent)
>>>>   {
>>>>          const struct xe_device_desc *desc = (const void *)ent-
>>>>> driver_data;
>>>> @@ -669,6 +703,8 @@ static int xe_pci_probe(struct pci_dev *pdev,
>>>> const struct pci_device_id *ent)
>>>>                  return err;
>>>>          }
>>>>
>>>> +       xe->d3cold_capable = xe_pci_d3cold_capable(pdev);
>>>> +
>>>>          xe_pm_runtime_init(xe);
>>>>
>>>>          return 0;
>>>> @@ -741,6 +777,7 @@ static int xe_pci_runtime_suspend(struct device
>>>> *dev)
>>>>                  pci_set_power_state(pdev, PCI_D3cold);
>>>>          } else {
>>>>                  pci_set_power_state(pdev, PCI_D3hot);
>>>> +               xe_pci_d3cold_enable_disable(pdev, false);
>>>>          }
>>>>
>>>>          return 0;
>>>> @@ -764,6 +801,8 @@ static int xe_pci_runtime_resume(struct device
>>>> *dev)
>>>>                          return err;
>>>>
>>>>                  pci_set_master(pdev);
>>>> +       } else {
>>>> +               xe_pci_d3cold_enable_disable(pdev, true);
>>>>          }
>>>>
>>>>          return xe_pm_runtime_resume(xe); @@ -774,6 +813,13 @@ static
>>>> int xe_pci_runtime_idle(struct device
>>>> *dev)
>>>>          struct pci_dev *pdev = to_pci_dev(dev);
>>>>          struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>
>>>> +       if (!xe->d3cold_capable) {
>>>> +               xe->d3cold_allowed = false;
>>>> +               return 0;
>>>> +       }
>>>> +
>>>> +       xe->d3cold_allowed = xe_pm_vram_d3cold_allowed(xe);
>>>> +
>>>>          /*
>>>>           * TODO: d3cold should be allowed (true) if
>>>>           * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index b7b57f10ba25..523d5f89ec89 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -16,6 +16,7 @@
>>>>   #include "xe_ggtt.h"
>>>>   #include "xe_gt.h"
>>>>   #include "xe_irq.h"
>>>> +#include "xe_module.h"
>>>>   #include "xe_pcode.h"
>>>>
>>>>   /**
>>>> @@ -117,6 +118,25 @@ int xe_pm_resume(struct xe_device *xe)
>>>>          return 0;
>>>>   }
>>>>
>>>> +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe) {
>>>> +       struct ttm_resource_manager *man;
>>>> +       u64 vram_used;
>>>> +       size_t total_vram_used_mb = 0;
>>>> +       int i;
>>>> +
>>>> +       /* TODO: Extend the logic to beyond XE_PL_VRAM1 */
>>>> +       for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
>>>> +               man = ttm_manager_type(&xe->ttm, i);
>>>> +               if (man) {
>>>> +                       vram_used = ttm_resource_manager_usage(man);
>>>> +                       total_vram_used_mb +=
>>>> DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
>>>> +               }
>>>> +       }
>>>> +
>>>> +       return total_vram_used_mb < xe_vram_save_restore_threshold;
>>>> +}
>>>> +
>>>>   void xe_pm_runtime_init(struct xe_device *xe)
>>>>   {
>>>>          struct device *dev = xe->drm.dev; diff --git
>>>> a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h index
>>>> 6a885585f653..33515d5c2cc2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>>> @@ -17,6 +17,7 @@ void xe_pm_runtime_init(struct xe_device *xe);
>>>>   void xe_pm_runtime_fini(struct xe_device *xe);
>>>>   int xe_pm_runtime_suspend(struct xe_device *xe);
>>>>   int xe_pm_runtime_resume(struct xe_device *xe);
>>>> +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe);
>>>>   int xe_pm_runtime_get(struct xe_device *xe);
>>>>   int xe_pm_runtime_put(struct xe_device *xe);
>>>>   bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
