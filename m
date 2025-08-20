Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B15CA0EED
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 06:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F66110E6A2;
	Wed, 20 Aug 2025 06:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2OBOIEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9317E10E6AB
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 06:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755671916; x=1787207916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DBby71bsaV4KwXLYnSCSUpp1uhVme/+C/eHdTYp7bYE=;
 b=i2OBOIEOQ+J6z7RAMP6yy+K1WwZ7my8l8WppjiZJ5c8I1gp3Q/UOhPVh
 lZ4nSYmB0TYtU6uFiCGAIubl7K1gEEeJZynT0b0qt7nAaXlkfXCOa14pk
 Ayhj4KGFGj58BcBZfXuf+1IlvKhIhEtAsf4IS7oy72orCY1Cs8XIAVV7b
 o6Fc4WsKc2E+mx5INyDS9BlN6swh24Y+X/2Cy7no1yGZi+U9hOAec8uQ0
 VluPFLK3K6O3rLS2cWfECJWV1moxceyIzgVPQ8DL3JWYOe396M3wXZxK+
 Ac/laixDXbLvKVP7tfGLGxrwsroW3PKoDW/sfovJ+Tbu6yQ9snDEwWuu9 g==;
X-CSE-ConnectionGUID: LGQCU6KqRXyhcGmAEUZBaA==
X-CSE-MsgGUID: se7gfaGSQWeDeYz6AL5fIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57999442"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57999442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 23:38:35 -0700
X-CSE-ConnectionGUID: Gt3RjSGlQOWtxGSvKIQQkQ==
X-CSE-MsgGUID: 8vQyuUtiRDuX2ccb0y350A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="198907433"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 23:38:33 -0700
Date: Wed, 20 Aug 2025 08:38:30 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Stuart Summers <stuart.summers@intel.com>, badal.nilawar@intel.com,
 karthik.poosa@intel.com
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Message-ID: <aKVtZusHihX3-mnm@black.igk.intel.com>
References: <20250819201054.393220-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819201054.393220-1-stuart.summers@intel.com>
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

+ pcode experts

On Tue, Aug 19, 2025 at 08:10:54PM +0000, Stuart Summers wrote:
> There are two registers filled in when reading data from
> pcode besides the mailbox itself. Currently, we allow a NULL
> value for the second of these two (data1) and assume the first
> is defined. However, many of the routines that are calling
> this function assume that pcode will ignore the value being
> passed in and so leave that first value (data0) defined but
> uninitialized. To be safe, make sure this value is always
> initialized to something (0 generally) in the event pcode
> behavior changes and starts using this value.
> 
> v2: Fix sob/author
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 8 ++++----
>  drivers/gpu/drm/xe/xe_hwmon.c        | 8 ++++----
>  drivers/gpu/drm/xe/xe_vram_freq.c    | 4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index bd9015761aa0..6ee422594b56 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -76,7 +76,7 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
> +	u32 cap = 0, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
>  	u16 major = 0, minor = 0, hotfix = 0, build = 0;
>  	int ret;
>  
> @@ -115,7 +115,7 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
> +	u32 cap = 0, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
>  	u16 major = 0, minor = 0, hotfix = 0, build = 0;
>  	int ret;
>  
> @@ -153,7 +153,7 @@ static int late_bind_create_files(struct device *dev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap;
> +	u32 cap = 0;
>  	int ret;
>  
>  	xe_pm_runtime_get(xe);
> @@ -186,7 +186,7 @@ static void late_bind_remove_files(struct device *dev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap;
> +	u32 cap = 0;
>  	int ret;
>  
>  	xe_pm_runtime_get(xe);
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c17ed1ae8649..32a76ae6e9dc 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -179,7 +179,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  					  u32 clr, u32 set)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> -	u32 val0, val1;
> +	u32 val0 = 0, val1 = 0;
>  	int ret = 0;
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> @@ -734,7 +734,7 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>  					 long *value, u32 scale_factor)
>  {
>  	int ret;
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	mutex_lock(&hwmon->hwmon_lock);
>  
> @@ -918,7 +918,7 @@ xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>  static umode_t
>  xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	/* hwmon sysfs attribute of current available only for package */
>  	if (channel != CHANNEL_PKG)
> @@ -1020,7 +1020,7 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  static umode_t
>  xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	if (!hwmon->xe->info.has_fan_control)
>  		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> index b26e26d73dae..17bc84da4cdc 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -34,7 +34,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	struct xe_tile *tile = dev_to_tile(dev);
> -	u32 val, mbox;
> +	u32 val = 0, mbox;
>  	int err;
>  
>  	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> @@ -56,7 +56,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	struct xe_tile *tile = dev_to_tile(dev);
> -	u32 val, mbox;
> +	u32 val = 0, mbox;
>  	int err;
>  
>  	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> -- 
> 2.34.1
> 
