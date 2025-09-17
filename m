Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695BACAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 10:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FFD10E71F;
	Wed, 17 Sep 2025 10:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgxyV/T5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7EB10E71F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758106370; x=1789642370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XHcrMe7WqyeThvgNm1QtoTfKQecwqB01VeegYs42Vbc=;
 b=BgxyV/T5LQM+c2mrewpb0HNn/lSH56v7MFF0AEvVT1Rz0bOUmN/iw4mr
 N4T4OX2j3VVjgZ67a/10gps5TSLo0BoEVoJkDBt1ciyoMKvNwF8Wx99SN
 6mmMFBPATkzHofuyKUDHysZ1dxW8Y+z4+Lki+lOi6P4SFcRruUzSJDw7r
 few95bL/NWmMBWDIaCpqWkkodBQepY/eiCE1CPeZ4Bv9mjHfrTw4+W8Wz
 vm9dr3gixiYhCX2U6DNGnOGumzpbBsIZerMSGR8EUQwsG1sjqEIHR0phV
 Uz9F4JLGughdHxtnPqjfljqJOSUD9AjZNzIn11v8GiqdbVJ3kPKY9AnzR Q==;
X-CSE-ConnectionGUID: +SSssTzgSGCUPipxV4yd3Q==
X-CSE-MsgGUID: lA/wDyk+S66H+7J7nEOyVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64227433"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="64227433"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:52:49 -0700
X-CSE-ConnectionGUID: WMo9E2pCRAeiEAqrqmf35Q==
X-CSE-MsgGUID: LS7R4KvVSpWgn6HUE6DN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="206155673"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:52:48 -0700
Date: Wed, 17 Sep 2025 12:52:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/sysfs: Simplify sysfs registration
Message-ID: <aMqS_SRH3f6PAdM2@black.igk.intel.com>
References: <20250916170029.3313-1-michal.wajdeczko@intel.com>
 <20250916170029.3313-3-michal.wajdeczko@intel.com>
 <aMpS02yLhBs5igpM@black.igk.intel.com>
 <be9d95e9-e02c-452f-a547-f0d3a1ae050e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be9d95e9-e02c-452f-a547-f0d3a1ae050e@intel.com>
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

On Wed, Sep 17, 2025 at 12:24:24PM +0200, Michal Wajdeczko wrote:
> On 9/17/2025 8:18 AM, Raag Jadav wrote:
> > On Tue, Sep 16, 2025 at 07:00:29PM +0200, Michal Wajdeczko wrote:
> > > Instead of manually maintaining each sysfs file define and use
> > > attribute groups and register them using device managed function.
> > > Then use is_visible() to filter-out unsupported attributes.
> > >
> > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Raag Jadav <raag.jadav@intel.com>
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > > v2: rebased, reordered
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 104 +++++++++++----------------
> > >  1 file changed, 41 insertions(+), 63 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > index 896484c8fbcc..c5151c86a98a 100644
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
> > 
> > >  	xe_pm_runtime_put(xe);
> > 
> > The device is already in D0 while probing so runtime PM is probably
> > not needed here.
> 
> true, but this is how it was initially coded and I didn't want to change it now
> 
> we can either drop it completely or replace with
> 
> 	xe_pm_runtime_get_noresume(xe);
> 	xe_pm_runtime_put(xe);
> 
> do you want this to be done as part of this series or it can be done later as follow-up?

Since there's no functional impact, I don't see any harm in dropping
it as part of refactoring here. But whatever the maintainers think is
best.

Raag
