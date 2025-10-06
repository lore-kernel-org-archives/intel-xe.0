Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7466FCAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 09:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C9810E22E;
	Mon,  6 Oct 2025 09:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9H7S9SA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE30210E22E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759743739; x=1791279739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JHf9VKBVaczlMAjhTeV2eAOOKhPbS+XAJshZ0Ub81w=;
 b=E9H7S9SADuKQDXAJZxOD9qkTJ0jRozUewGxuNJQmxRvDs7CX8rmnPxT6
 uBzntJqrec/7yyN0GjA1NUOGr67Lqk6rBxcfxX1D+dKURj8bfflSJ0eEd
 ZhO3dPCF8Grq3LE2TppEko/nx/tG+5oRhWd0MosN+UJa4cfBaZIwbXhce
 iAsVlek4gilQel9SjfITafZ53QJPj2ULyLlDIL4bGaPOCKa42PGowEEzX
 BXMbKxTSVLzA9PuJqEtfZhEqvX2jguRNu/WkCsT4Xj7Fx2As81A2+4kfx
 Vg4PmMUmjCv06ZfMFe56wEncNmQY4ea4y7cSlldNj4UIwEWGwwzi0pmYg Q==;
X-CSE-ConnectionGUID: cUaEPly2R6+Kjr3aKfu5Yg==
X-CSE-MsgGUID: MBtcnmAvQHy24jlSRZihHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="87379067"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="87379067"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:42:18 -0700
X-CSE-ConnectionGUID: jtvXkUsYSUeJgnhpUCKQOw==
X-CSE-MsgGUID: gLUCIxqBSvq1JsdyP241yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180638410"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by fmviesa010.fm.intel.com with ESMTP; 06 Oct 2025 02:42:17 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: Re: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Date: Mon,  6 Oct 2025 15:07:23 +0530
Message-ID: <20251006093722.1304769-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929083613.644931-2-naresh.kumar.g@intel.com>
References: <20250929083613.644931-2-naresh.kumar.g@intel.com>
MIME-Version: 1.0
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

Hi Stuart,
Please find my comments,

>On Mon, 2025-09-29 at 14:06 +0530, Nareshkumar Gollakoti wrote:
>> Due to SLA agreement between PF and VFs, multi CCS mode can't
>
>> be enabled when VFs are already enabled.
>
>> Similarly, enabling VFs is disabled when multi ccs mode enabled.
>
>
>I have a similar comment inline below as well, but while you're
>describing what you're doing here, I don't understand why we need to do
>it. The previous check should have covered this too right?
The previous logic prevented changing the CCS mode when operating in either SR-IOV PF or VF mode.However, in practice, the default scenario is that SR-IOV is enabled and the device is in PF mode,but no VFs are enabled or provisioned. In this situation,we can allow users to enable multi-CCS mode.To support this, the updated logic ensures that while multi-CCS mode can be enabled in PF mode without any VFs,it also blocks the ability to enable VFs when multi-CCS mode enabled.maintaining the necessary protections
>> 
>
>> v2:function xe_device_is_vf_enabled has been refactored to
>
>> xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
>
>> The code now distinctly checks for SR-IOV VF mode and
>
>> SR-IOV PF with VFs enabled.
>
>> Log messages have been updated to explicitly state the current mode.
>
>> The function xe_multi_ccs_mode_enabled is moved to xe_device.h
>
>> 
>
>> v3: Described missed arg documentation for
>
>> xe_sriov_pf_has_vfs_enabled
>
>> 
>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>
>> ---
>
>>  drivers/gpu/drm/xe/xe_device.h           |  8 ++++++++
>
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c      | 14 +++++++++++---
>
>>  drivers/gpu/drm/xe/xe_pci_sriov.c        |  6 ++++++
>
>>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 13 +++++++++++++
>
>>  4 files changed, 38 insertions(+), 3 deletions(-)
>
>> 
>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>
>> b/drivers/gpu/drm/xe/xe_device.h
>
>> index 32cc6323b7f6..986f9cabb897 100644
>
>> --- a/drivers/gpu/drm/xe/xe_device.h
>
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>
>> @@ -172,6 +172,14 @@ static inline bool xe_device_has_lmtt(struct
>
>> xe_device *xe)
>
>>         return IS_DGFX(xe);
>
>>  }
>
>>  
>
>> +static inline bool xe_multi_ccs_mode_enabled(struct xe_device *xe)
>
>> +{
>
>> +       /* Multi CCS mode supported exclusively on GT0 */
>
>> +       struct xe_gt *gt = xe_device_get_gt(xe, 0);
>
>> +
>
>> +       return gt->ccs_mode > 1;
>
>> +}
>
>> +
>
>>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>
>>  
>
>>  void xe_device_snapshot_print(struct xe_device *xe, struct
>
>> drm_printer *p);
>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>
>> b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>
>> index 50fffc9ebf62..584f3245fc7d 100644
>
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>
>> @@ -13,6 +13,7 @@
>
>>  #include "xe_gt_sysfs.h"
>
>>  #include "xe_mmio.h"
>
>>  #include "xe_sriov.h"
>
>> +#include "xe_sriov_pf_helpers.h"
>
>>  
>
>>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32
>
>> num_engines)
>
>>  {
>
>> @@ -117,9 +118,16 @@ ccs_mode_store(struct device *kdev, struct
>
>> device_attribute *attr,
>
>>         u32 num_engines, num_slices;
>
>>         int ret;
>
>>  
>
>> -       if (IS_SRIOV(xe)) {
>
>> -               xe_gt_dbg(gt, "Can't change compute mode when running
>
>> as %s\n",
>
>> -                        
>
>> xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>
>> +       /*
>
>> +        * Check if the device is:
>
>> +        * 1. Operating as an SR-IOV Virtual Function (VF), or
>
>> +        * 2. An SR-IOV Physical Function (PF) with one or more VFs
>
>> enabled.
>
>> +        * Enabling multi CCS mode is not permitted in either
>
>> scenario.
>
>> +        */
>
>
>IMO this comment isn't needed. The two conditions you have below are
>self-explanatory.
>
incorporated in V4
>> +       if (IS_SRIOV_VF(xe) || xe_sriov_pf_has_vfs_enabled(xe)) {
>
>
>Also as I mentioned earlier, why do we need to make this change here?
>Is there a requirement to enable this in SRIOV_PF mode? My
>understanding is we wanted to explicitly stick to the default mode (one
>CCS) in this case.
>
Provided context in the above comment.
Yeah we will stick to one CCS if any VF is provisioned otherwise we can allow multi CCS Mode if platform supports as requested from IGT team.
>Thanks,
>Stuart
>
>> +               const char *mode_str =
>
>> !strcmp(xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
>
>> +                                       "SR-IOV VF") ? "SR-IOV VF" :
>
>> "SR-IOV PF with VFs Enabled";
>
>> +               xe_gt_dbg(gt, "Can't change compute mode when running
>
>> as %s\n", mode_str);
>
>>                 return -EOPNOTSUPP;
>
>>         }
>
>>  
>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c
>
>> b/drivers/gpu/drm/xe/xe_pci_sriov.c
>
>> index af05db07162e..71c1d998ba82 100644
>
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>
>> @@ -155,6 +155,12 @@ static int pf_enable_vfs(struct xe_device *xe,
>
>> int num_vfs)
>
>>         xe_assert(xe, num_vfs <= total_vfs);
>
>>         xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs,
>
>> str_plural(num_vfs));
>
>>  
>
>> +       if (xe_multi_ccs_mode_enabled(xe)) {
>
>> +               xe_sriov_info(xe, "Disable multi-ccs mode before
>
>> enabling VF's\n");
>
>> +
>
>> +               return -ECANCELED;
>
>> +       }
>
>> +
>
>>         err = xe_sriov_pf_wait_ready(xe);
>
>>         if (err)
>
>>                 goto out;
>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>
>> b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>
>> index dd1df950b021..e26837091375 100644
>
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>
>> @@ -43,4 +43,17 @@ static inline struct mutex
>
>> *xe_sriov_pf_master_mutex(struct xe_device *xe)
>
>>         return &xe->sriov.pf.master_lock;
>
>>  }
>
>>  
>
>> +/**
>
>> + * xe_sriov_pf_has_vfs_enabled() - Determines if the PF has any VFs
>
>> enabled
>
>> + * @xe: ptr to xe_device
>
>> + *
>
>> + * Return: true if one or more VFs are enabled on the PF, false
>
>> otherwise.
>
>> + */
>
>> +static inline bool xe_sriov_pf_has_vfs_enabled(const struct
>
>> xe_device *xe)
>
>> +{
>
>> +       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>
>> +
>
>> +       return pci_num_vf(pdev) > 0;
>
>> +}
>
>> +
>
>>  #endif
