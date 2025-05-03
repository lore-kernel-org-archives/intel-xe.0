Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FF8C369D9
	for <intel-xe@archiver.kernel.org>; Sat,  3 May 2025 07:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697EF10E074;
	Sat,  3 May 2025 07:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myiQmFNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5856410E074
 for <intel-xe@lists.freedesktop.org>; Sat,  3 May 2025 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746258918; x=1777794918;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H5/JpanaGh8qpS95sQPctbZiJpz+gxl77AyIgD5dPZU=;
 b=myiQmFNKYdFODamC6GiyV9t0cqz/v93/OdVdQHiO6Smduo3IGCFenHAe
 4mjdb8H0AsWqE46XmRyS822XO/oVwgRB//gG+3cMtmYlvWkUmP07hPw3P
 mQ0duoqpfeu/Z3RGtHM1TSJErl2XEWiPPlAQVG/oSjqsx6JZNqehxbiAd
 /85Aiig+w1vsVjNy3VBMzdCiUfPd5shUN320krgavMuhKZDsbQolD2CYj
 HE9Bwgv4/x15d2BQswoJ9gap0fUVF4YoMBlJnZAfkwtu6lHHfZwZiYfxH
 vPog2bhq8DAoQD48ZEKkp1QfF3FteejcpQlRqTi0wypm9nrfTXZEWSUjp Q==;
X-CSE-ConnectionGUID: MLgK++gsTuaO1T6HWmmVRA==
X-CSE-MsgGUID: /V1oxBi+QdqecyU2Yf0x+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47190258"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; d="scan'208";a="47190258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2025 00:55:17 -0700
X-CSE-ConnectionGUID: 8q423n4/SyyMcIKDo5IYyg==
X-CSE-MsgGUID: yuYTxZ9TTL6BlukRwPfKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; d="scan'208";a="139622608"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2025 00:55:14 -0700
Date: Sat, 3 May 2025 10:55:11 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v6 1/3] drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
Message-ID: <aBXL3-nvGOReGNH8@black.fi.intel.com>
References: <20250502183739.3308069-1-raag.jadav@intel.com>
 <20250502183739.3308069-2-raag.jadav@intel.com>
 <4keegjzampto67kcdasnztjnv4pdli2zwfztey5mo26akzvw6v@tnxf5z6keokk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4keegjzampto67kcdasnztjnv4pdli2zwfztey5mo26akzvw6v@tnxf5z6keokk>
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

On Fri, May 02, 2025 at 05:00:55PM -0500, Lucas De Marchi wrote:
> On Sat, May 03, 2025 at 12:07:37AM +0530, Raag Jadav wrote:
> > Attributes being exposed in xe_pm_init() are PM specific and should
> > follow its naming.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device_sysfs.c | 6 +++---
> > drivers/gpu/drm/xe/xe_device_sysfs.h | 2 +-
> > drivers/gpu/drm/xe/xe_pm.c           | 2 +-
> > 3 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > index 7efbd4c52791..2d25e5b5d4bf 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > @@ -63,14 +63,14 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> > 
> > static DEVICE_ATTR_RW(vram_d3cold_threshold);
> > 
> > -static void xe_device_sysfs_fini(void *arg)
> > +static void xe_pm_sysfs_fini(void *arg)
> > {
> > 	struct xe_device *xe = arg;
> > 
> > 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> > }
> > 
> > -int xe_device_sysfs_init(struct xe_device *xe)
> > +int xe_pm_sysfs_init(struct xe_device *xe)
> > {
> > 	struct device *dev = xe->drm.dev;
> > 	int ret;
> > @@ -79,5 +79,5 @@ int xe_device_sysfs_init(struct xe_device *xe)
> > 	if (ret)
> > 		return ret;
> > 
> > -	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> > +	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
> > index f9e83d8bd2c7..2c1fabdba9e4 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
> > @@ -8,6 +8,6 @@
> > 
> > struct xe_device;
> > 
> > -int xe_device_sysfs_init(struct xe_device *xe);
> > +int xe_pm_sysfs_init(struct xe_device *xe);
> 
> you can do it on top, but I don't see it in this series. If you are
> naming this xe_pm_* since it's pm specific, then please make sure
> it is in xe_pm.c

Yes, I already have it locally but delayed it since it's unrelated
to the series. Will send it out separately once we merge this.

Raag
