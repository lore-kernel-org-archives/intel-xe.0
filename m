Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2176FCCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 08:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D912E10E339;
	Mon,  6 Oct 2025 08:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYq3OEO3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8504010E339
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 08:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759738034; x=1791274034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kF+rby5YVTA66DEpOVxhmARf9oDulvHp2WhrLMKJzW0=;
 b=SYq3OEO3MQxn3EMU2Xjt3Akpd8S5SXSHXqhko1+gYFZYOWUWayKkh4Tt
 BFeLXr1KJn76uAn6AlbW+tZaS/Mi6h7WZIaktLTXp4pRSkYwwRmKb15mJ
 Lk5Wf3tu4CuHb67yZlkqnXBNksJfWVa33LiCbxeryi+eA89z46sCmRi63
 0n3mK0sZE0RESO2ZScoSYmjNaD4WYDcvHQ7zI4ZlOUWo8Yh2NNqIvbmFf
 NTAYAp7XIYuC4XP1dohHSKBni7JR/cqwzzFF+b9Fo47QQ0asQpahUMOeI
 N3RjGNPx16AlMzfIqt5sQVuYhvWUQ4e1tyee78W3dn/4igPqTFTvECdBu A==;
X-CSE-ConnectionGUID: NNx34nLfTLmVJ0BLvo3M6Q==
X-CSE-MsgGUID: GIoBcqYmQ6+adDYxo0VqMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="72582949"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="72582949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 01:07:13 -0700
X-CSE-ConnectionGUID: DGrbtcAxRluAU5adLXuMoQ==
X-CSE-MsgGUID: T675GVjYQ32G4sLH5E190w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="178951689"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by orviesa006.jf.intel.com with ESMTP; 06 Oct 2025 01:07:11 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal.Wajdeczko@intel.com, varun.gupta@intel.com, naresh.kumar.g@intel.com
Subject: 
Date: Mon,  6 Oct 2025 13:32:16 +0530
Message-ID: <20251006080215.1255029-2-naresh.kumar.g@intel.com>
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

Subject: Re: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF Provisioning
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com, Michal.Wajdeczko@intel.com,
varun.gupta@intel.com
>On 9/29/2025 10:36 AM, Nareshkumar Gollakoti wrote:
>> Due to SLA agreement between PF and VFs, multi CCS mode can't be 
>> enabled when VFs are already enabled.
>> Similarly, enabling VFs is disabled when multi ccs mode enabled.
>
>s/ccs/CCS
Incorporated in V4
>> 
>> v2:function xe_device_is_vf_enabled has been refactored to 
>> xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
>> The code now distinctly checks for SR-IOV VF mode and SR-IOV PF with 
>> VFs enabled.
>> Log messages have been updated to explicitly state the current mode.
>> The function xe_multi_ccs_mode_enabled is moved to xe_device.h
>> 
>> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled
>
>you can keep version log under ---
>
Incorporated in V4
>> 
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.h           |  8 ++++++++
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c      | 14 +++++++++++---
>>  drivers/gpu/drm/xe/xe_pci_sriov.c        |  6 ++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 13 +++++++++++++
>>  4 files changed, 38 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>> b/drivers/gpu/drm/xe/xe_device.h index 32cc6323b7f6..986f9cabb897 
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -172,6 +172,14 @@ static inline bool xe_device_has_lmtt(struct xe_device *xe)
>>  	return IS_DGFX(xe);
>>  }
>>  
>> +static inline bool xe_multi_ccs_mode_enabled(struct xe_device *xe) {
>> +	/* Multi CCS mode supported exclusively on GT0 */
>> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>
>beware of the discussion at https://patchwork.freedesktop.org/series/155114/#rev1
>
In my case am using existing gt id '0' and here expectation is will get proper gt.
do we really get gt as NULL?
>> +
>> +	return gt->ccs_mode > 1;
>> +}
>> +
>>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>>  
>>  void xe_device_snapshot_print(struct xe_device *xe, struct 
>> drm_printer *p); diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c 
>> b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index 50fffc9ebf62..584f3245fc7d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -13,6 +13,7 @@
>>  #include "xe_gt_sysfs.h"
>>  #include "xe_mmio.h"
>>  #include "xe_sriov.h"
>> +#include "xe_sriov_pf_helpers.h"
>>  
>>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)  
>> { @@ -117,9 +118,16 @@ ccs_mode_store(struct device *kdev, struct 
>> device_attribute *attr,
>>  	u32 num_engines, num_slices;
>>  	int ret;
>>  
>> -	if (IS_SRIOV(xe)) {
>> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>> +	/*
>> +	 * Check if the device is:
>> +	 * 1. Operating as an SR-IOV Virtual Function (VF), or
>> +	 * 2. An SR-IOV Physical Function (PF) with one or more VFs enabled.
>> +	 * Enabling multi CCS mode is not permitted in either scenario.
>
>in case 1 it is rather "not possible", so I would split that case, as suggested in [1]
>
>[1] https://patchwork.freedesktop.org/patch/674760/?series=154538&rev=1#comment_1240131
>
Interpreted the previous comment as suggesting two separate checks, 
rather than combining the PF and VF flows.
However, based on the latest feedback below, by skipping the creation of the CCS mode store sysfs entry in VF mode,
we can now use a single check of PF with VFs enabled.This update has been incorporated in V4
>> +	 */
>> +	if (IS_SRIOV_VF(xe) || xe_sriov_pf_has_vfs_enabled(xe)) {
>> +		const char *mode_str = 
>> +!strcmp(xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
>
>hmm, what's the goal of comparing mode string, where you already have access to the mode? 
>
>but, what's the point of exposing "gt_ccs_mode_attrs" for VFs when they can't do anything with them?
>
>maybe you can get rid of one condition above, by simply checking for IS_VF when adding sysfs attributes?
>
Incorporated in V4, during sysfs_init for gt_ccs_mode_attrs is not allowing when running in IS_SRIOV_VF Mode.
>> +					"SR-IOV VF") ? "SR-IOV VF" : "SR-IOV PF with VFs Enabled";
>> +		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n", 
>> +mode_str);
>>  		return -EOPNOTSUPP;
>>  	}
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c 
>> b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index af05db07162e..71c1d998ba82 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -155,6 +155,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>  	xe_assert(xe, num_vfs <= total_vfs);
>>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, 
>> str_plural(num_vfs));
>>  
>> +	if (xe_multi_ccs_mode_enabled(xe)) {
>> +		xe_sriov_info(xe, "Disable multi-ccs mode before enabling VF's\n");
>
>multi-CCS ?
>
Corrected in V4
>> +
>> +		return -ECANCELED;
>> +	}
>> +
>
>I still don't see how do you want to protect against the case when CCS mode will be changed right after above check but before PF actually enable VFs

The execution of the sysfs ccs_mode_store function is already protected by the 
kernel's filesystem write operation lock, so no additional specific locking is required here.

In My Test check:
Although I attempted to acquire a lock within ccs_mode_store to ensure protection, 
a deadlock occurs because the lock has already been acquired earlier in the code flow before entering the function.
As a result, trying to acquire the same lock again inside ccsmode_store leads to a deadlock situation.

>>  	err = xe_sriov_pf_wait_ready(xe);
>>  	if (err)
>>  		goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h 
>> b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> index dd1df950b021..e26837091375 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> @@ -43,4 +43,17 @@ static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
>>  	return &xe->sriov.pf.master_lock;
>>  }
>>  
>> +/**
>> + * xe_sriov_pf_has_vfs_enabled() - Determines if the PF has any VFs 
>> +enabled
>> + * @xe: ptr to xe_device
>> + *
>> + * Return: true if one or more VFs are enabled on the PF, false otherwise.
>> + */
>> +static inline bool xe_sriov_pf_has_vfs_enabled(const struct xe_device 
>> +*xe) {
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	return pci_num_vf(pdev) > 0;
>> +}
>> +
>>  #endif


