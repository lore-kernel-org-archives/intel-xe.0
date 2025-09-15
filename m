Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6827CCAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 16:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD8110E500;
	Mon, 15 Sep 2025 16:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrJQis9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E35710E4FC
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757952202; x=1789488202;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fi112k8/o+wtltv0XnY43ihCCzwdYuSKPCgH04zLJx8=;
 b=jrJQis9e3kK0nrR9kILuF2UJ3MEMI71MmkyIYDepT6v5z0oxsvJzmwrw
 p7go95KStwaxNjU2I5MWJXTTLk6KyjfacfHzCZNFG0NtmyvO8vwaYikau
 /sodOCgD/zcYOZHH/jO5vYqRtIq+9cLEc7pHEQxrShzL7sLB2uCbYMkeK
 BDpv4UNXA9INhpAHlY3LiFJxu/tEZoFiXJ+B7vlmSV5fEiypKlGGpzyv1
 rUhiVCJCksd5xQLU+zrromme8aZsxpuclsdOC/SBhvc1JgdBEGtn5cyFy
 3O2Ta75POjyerp5YVaZQPSLjYzx3qKWt5pxEUpXe5ogbMQ4oQX4v3eygz w==;
X-CSE-ConnectionGUID: bzjxlsm6Sk6ntpHa5orwmA==
X-CSE-MsgGUID: /xO/hegRRgePFhrpKWnEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70832011"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="70832011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 09:03:21 -0700
X-CSE-ConnectionGUID: 4w7BQKCHTVu5sVZ3JganUw==
X-CSE-MsgGUID: Nji01QjJSMW+HFCKK23hSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174611313"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 09:03:20 -0700
Date: Mon, 15 Sep 2025 18:03:17 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/sysfs: Simplify and fix sysfs registration
Message-ID: <aMg4xRh3VuI9MORl@black.igk.intel.com>
References: <20250915140614.2076-1-michal.wajdeczko@intel.com>
 <20250915140614.2076-2-michal.wajdeczko@intel.com>
 <aMgt994Z4Yr99mHF@black.igk.intel.com>
 <25c43237-e102-45aa-8e3b-63f7891d38fd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25c43237-e102-45aa-8e3b-63f7891d38fd@intel.com>
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

On Mon, Sep 15, 2025 at 05:51:33PM +0200, Michal Wajdeczko wrote:
> On 9/15/2025 5:17 PM, Raag Jadav wrote:
> > On Mon, Sep 15, 2025 at 04:06:13PM +0200, Michal Wajdeczko wrote:
> > > Instead of manually maintaining each sysfs attribute define and use
> > > attribute groups and register them using device managed function.
> > > Then use is_visible() to filter-out unsupported attributes.
> > >
> > > This will result not only in less code and smaller footprint:
> > >
> > >   Function                                     old     new   delta
> > >   late_bind_attr_is_visible                      -     183    +183
> > >   ____versions                               80832   80896     +64
> > >   vram_attr_group                                -      48     +48
> > >   late_bind_attr_group                           -      48     +48
> > >   auto_link_downgrade_attr_group                 -      48     +48
> > >   late_bind_attrs                                -      24     +24
> > >   vram_attrs                                     -      16     +16
> > >   __pfx_late_bind_attr_is_visible                -      16     +16
> > >   xe_device_sysfs_init.cold                     20      21      +1
> > >   __pfx_xe_device_sysfs_fini                    16       -     -16
> > >   xe_device_sysfs_fini.cold                     21       -     -21
> > >   xe_device_sysfs_fini                         271       -    -271
> > >   xe_device_sysfs_init                         421     135    -286
> > >   Total: Before=2848898, After=2848752, chg -0.01%
> >  
> >  I find the summary to be sufficient but upto you.
> 
> sure, can strip this (if there will be v2)

Thanks.

> > > but will also fix some bad error handling that we had here.
> > >
> > > Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
> > > Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
> > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 96 +++++++++++-----------------
> > >  1 file changed, 39 insertions(+), 57 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > index 6ee422594b56..5b0b98ac9b17 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > @@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> > >  
> > >  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> > >  
> > > +static struct attribute *vram_attrs[] = {
> > > +	&dev_attr_vram_d3cold_threshold.attr,
> > > +	NULL
> > > +};
> > > +
> > > +static const struct attribute_group vram_attr_group = {
> > > +	.attrs = vram_attrs,
> > > +};
> > > +
> > >  static ssize_t
> > >  lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
> > >  {
> > > @@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
> > >  }
> > >  static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
> > >  
> > > -static int late_bind_create_files(struct device *dev)
> > > +static struct attribute *late_bind_attrs[] = {
> > > +	&dev_attr_lb_fan_control_version.attr,
> > > +	&dev_attr_lb_voltage_regulator_version.attr,
> > > +	NULL
> > > +};
> > > +
> > > +static umode_t late_bind_attr_is_visible(struct kobject *kobj,
> > > +					 struct attribute *attr, int n)
> > >  {
> > > +	struct device *dev = kobj_to_dev(kobj);
> > >  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> > >  	struct xe_tile *root = xe_device_get_root_tile(xe);
> > >  	u32 cap = 0;
> > > @@ -160,51 +177,25 @@ static int late_bind_create_files(struct device *dev)
> > >  
> > >  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> > >  			    &cap, NULL);
> > > -	if (ret) {
> > > -		if (ret == -ENXIO) {
> > > -			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
> > > -			ret = 0;
> > > -		}
> > > -		goto out;
> > > -	}
> > > -
> > > -	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
> > > -		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
> > > -		if (ret)
> > > -			goto out;
> > > -	}
> > > -
> > > -	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
> > > -		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
> > > -out:
> > >  	xe_pm_runtime_put(xe);
> > > -
> > > -	return ret;
> > > -}
> > > -
> > > -static void late_bind_remove_files(struct device *dev)
> > > -{
> > > -	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> > > -	struct xe_tile *root = xe_device_get_root_tile(xe);
> > > -	u32 cap = 0;
> > > -	int ret;
> > > -
> > > -	xe_pm_runtime_get(xe);
> > > -
> > > -	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> > > -			    &cap, NULL);
> > >  	if (ret)
> > > -		goto out;
> > > +		return 0;
> > 
> > Should we keep the original log so we don't have to guesswork our way around
> > random pcode errors?
> 
> hmm, I was assuming that PCODE_LATE_BINDING is also used elsewhere
> so it will be reported, but it looks that it's not
> 
> but OTOH, is it a right place (sysfs init, or now is_visible)
> to report any missing firmware cap?
> 
> maybe there should be xe_lb_init() somewhere, where we can report any
> unexpected problems, and then in xe_sysfs_init() we will just use
> already retrieved and confirmed cap?

The idea was to land the sysfs along with [1] but it still seems going
through its own hoops due to cross subsys dependency.

[1] https://lore.kernel.org/intel-xe/20250905154953.3974335-1-badal.nilawar@intel.com/

Raag
