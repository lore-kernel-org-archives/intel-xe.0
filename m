Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E46C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 20:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4134B10E82A;
	Fri,  1 Dec 2023 20:57:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA24610E82A
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 20:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701464273; x=1733000273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S2yRHD0G+X8UzSA9REyv7POMyi4ZW0y8oe1PeWoK7/8=;
 b=Bc0BEZcvmKkuqcLidB61TCbMpwYQJBH1yet3hP51ax/u/WPho1BLiLRG
 7DHOn666mUjX6D7O+2bdt/R0FFQqaDzG/471Zkwe2jadJaRFH+MyfrUDC
 zPKgzrjwkKsjuHaTO777/NaD4NC0ULTzye+r17874+iGwDgf6X9+f+Esj
 AdDOkK6lN6S/ehTGEOvDRHrWpu+8ia1xpIkfYVeoCpJmfc4wyLlNzM+zT
 4yeB4gqYG5JZDxMi/G9CKpRDHANEgMS4nQKT9D+weoWi4fULROXC4sVgp
 OLEwwiEwzmxO98XvWUXH/8iK/3cBAPNOcyBTTrXjaPu41ZaGWzi44TwMC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="460043488"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="460043488"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 12:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="840307746"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="840307746"
Received: from ipollak-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.73])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 12:57:51 -0800
Date: Fri, 1 Dec 2023 21:57:49 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZWpIzR3ucjwkNRty@ashyti-mobl2.lan>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
 <20231129025716.9094-3-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129025716.9094-3-niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 2/3] drm/xe: Allow userspace to configure
 CCS mode
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Niranjana,

> +static ssize_t
> +ccs_mode_show(struct device *kdev,
> +	      struct device_attribute *attr, char *buf)
> +{
> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> +
> +	return sysfs_emit(buf, "Enabled compute engines %d; Number of compute slices %d\n",
> +			  gt->ccs_mode.num_engines, hweight32(CCS_MASK(gt)));
> +}

Please add separate interfaces called:

	- compute_engines
	- compute_slices

and each of them providing respecively

	- gt->ccs_mode.num_engines
	- hweight32(CCS_MASK(gt))

> +static ssize_t
> +ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> +	       const char *buff, size_t count)
> +{
> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> +	u32 num_engines, num_slices;
> +	int ret;
> +
> +	ret = kstrtou32(buff, 0, &num_engines);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Ensure number of engines specified is valid and there is an
> +	 * exact multiple of engines for slices.
> +	 */
> +	num_slices = hweight32(CCS_MASK(gt));
> +	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
> +		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
> +			  num_engines, num_slices);
> +		return -EINVAL;
> +	}
> +
> +	if (gt->ccs_mode.num_engines != num_engines) {
> +		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> +		gt->ccs_mode.num_engines = num_engines;
> +		xe_gt_reset_async(gt);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(ccs_mode);
> +
> +static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	sysfs_remove_file(gt->sysfs, &dev_attr_ccs_mode.attr);
> +}

I think there's no need to remove sysfs files.

> +int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (!xe_gt_ccs_mode_enabled(gt))
> +		return 0;
> +
> +	err = sysfs_create_file(gt->sysfs, &dev_attr_ccs_mode.attr);
> +	if (err)
> +		return err;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +
> +	return err;

Please, don't fail if sysfs fails. Make this function void.

Andi
