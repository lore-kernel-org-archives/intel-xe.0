Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5482AC9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 10:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E833010F9D3;
	Fri, 25 Sep 2026 10:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKJvy+7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5BA10F9CA;
 Fri, 25 Sep 2026 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790332212; x=1821868212;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tdIAs/dpz2Z7UVtdZSYRgTG6F9dIY1PgsnpQndrYA2k=;
 b=JKJvy+7sSXwoK3U/QNi9uHdvUr3Ax6qG2HzXf+aldyCh7Q3WASFjnpFL
 xloT8UeSF/dbdikA652X7b0jeVy6O3Hhb9wF6foo1uboeGuAPXNjiRk0s
 5OIYTZ+gTqandGOan1gVI6m7roaGuysiSIkh9Nrgful4L8Nt8VmMSs8tS
 xPPSK7KdttE8bVkilFBd7RZYEWQglApm3L4Olt17F+rDoxGPufaSnGJBk
 bJjxpwnmbIOj6Q1t++qcilRJqSh2DwZA+hkhe7B4V81a0ad+mMnDRzKQz
 1tiG37XUOYkOcOPRMTd9c63A4RRvgZEe5IlfN4CdLGXY7DK2Lmm8mTII0 A==;
X-CSE-ConnectionGUID: UR7eBNs/Rsm0n+OMjhyyVQ==
X-CSE-MsgGUID: 7xZdEy0vQYyz9wgP+6lNlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89980006"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="89980006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:30:12 -0700
X-CSE-ConnectionGUID: 2IA90UGXSJqO3TvnE5veVg==
X-CSE-MsgGUID: YKi5sfdcSWqclw08ZF67uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="274393514"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:30:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Naladala Ramanaidu
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH v2 1/1] drm/i915/gmbus: Add bit-banging debugfs control
In-Reply-To: <20260924152812.439986-2-ramanaidu.naladala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
 <20260924152812.439986-2-ramanaidu.naladala@intel.com>
Date: Fri, 25 Sep 2026 13:30:06 +0300
Message-ID: <ee11604db9b3c47383e1c32e68a34ffdca2fde86@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 24 Sep 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
> Add a connector debugfs interface to enable or disable I2C
> bit-banging for Intel GMBUS adapters.
>
> v1: Address below review comments: (Jani Nikula)
>     - Remove HDMI-specific EDID read path changes.
>     - Control bit-banging directly from debugfs via intel_gmbus_force_bit()
>
> Assisted-by: OpenAI Codex:GPT-5
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  .../drm/i915/display/intel_display_debugfs.c  |  3 +
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_gmbus.c    | 61 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_gmbus.h    |  3 +
>  4 files changed, 68 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 3e302f23f247..74f065175a72 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -40,6 +40,7 @@
>  #include "intel_fb.h"
>  #include "intel_fbc.h"
>  #include "intel_fbdev.h"
> +#include "intel_gmbus.h"
>  #include "intel_hdcp.h"
>  #include "intel_hdmi.h"
>  #include "intel_hotplug.h"
> @@ -1327,6 +1328,8 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
>  	if (!root)
>  		return;
>  
> +	intel_gmbus_connector_debugfs_add(connector);
> +

Superfluous newline. All the other calls below are back to back.

>  	intel_drrs_connector_debugfs_add(connector);
>  	intel_hdcp_connector_debugfs_add(connector);
>  	intel_pps_connector_debugfs_add(connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 79f30660c2b6..5cef2582c361 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -558,6 +558,7 @@ struct intel_connector {
>  	u8 polled;
>  
>  	int force_joined_pipes;
> +	bool force_bit_banging;

This should be hidden in struct intel_gmbus next to force_bit, maybe as
debugfs_force_bit or something.

>  
>  	struct {
>  		struct drm_dp_aux *dsc_decompression_aux;
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 60a70dea5d85..38d6d1148399 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -27,6 +27,7 @@
>   *	Chris Wilson <chris@chris-wilson.co.uk>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/export.h>
>  #include <linux/i2c-algo-bit.h>
>  #include <linux/i2c.h>
> @@ -871,6 +872,66 @@ static const struct i2c_algorithm gmbus_algorithm = {
>  	.functionality	= gmbus_func
>  };
>  
> +bool intel_gmbus_is_adapter(struct i2c_adapter *adapter)

This should be static.

> +{
> +	return adapter->algo == &gmbus_algorithm;
> +}
> +
> +static int intel_force_bit_banging_show(struct seq_file *m, void *data)
> +{
> +	struct intel_connector *connector = m->private;
> +
> +	seq_printf(m, "%u\n", connector->force_bit_banging);
> +
> +	return 0;
> +}
> +
> +static ssize_t intel_force_bit_banging_write(struct file *file,
> +						     const char __user *ubuf,
> +						     size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct intel_connector *connector = m->private;
> +	bool force_bit_banging;
> +	int ret;
> +
> +	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
> +	if (ret)
> +		return ret;
> +
> +	if (force_bit_banging != connector->force_bit_banging) {
> +		intel_gmbus_force_bit(connector->base.ddc, force_bit_banging);
> +		connector->force_bit_banging = force_bit_banging;
> +	}
> +
> +	*offp += len;
> +
> +	return len;
> +}
> +
> +static int intel_force_bit_banging_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, intel_force_bit_banging_show, inode->i_private);
> +}
> +
> +static const struct file_operations intel_force_bit_banging_fops = {
> +	.owner = THIS_MODULE,
> +	.open = intel_force_bit_banging_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = intel_force_bit_banging_write,
> +};
> +
> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
> +{
> +	if (connector->base.ddc &&
> +	    intel_gmbus_is_adapter(connector->base.ddc))

The connector->base.ddc != NULL check should be inside
intel_gmbus_is_adapter().

> +		debugfs_create_file("intel_force_bit_banging", 0644,
> +				    connector->base.debugfs_entry, connector,
> +				    &intel_force_bit_banging_fops);
> +}
> +
>  static void gmbus_lock_bus(struct i2c_adapter *adapter,
>  			   unsigned int flags)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
> index 5fdeab1aa794..968f8cb42821 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.h
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  struct i2c_adapter;
> +struct intel_connector;
>  struct intel_display;
>  
>  #define GMBUS_PIN_DISABLED	0
> @@ -41,6 +42,8 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
>  
>  struct i2c_adapter *
>  intel_gmbus_get_adapter(struct intel_display *display, unsigned int pin);
> +bool intel_gmbus_is_adapter(struct i2c_adapter *adapter);
> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector);
>  void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
>  bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
>  void intel_gmbus_reset(struct intel_display *display);

-- 
Jani Nikula, Intel
