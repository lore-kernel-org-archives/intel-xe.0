Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9EFEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 13:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4544010E10E;
	Thu, 29 Jun 2023 13:49:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC2010E10E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688046594; x=1719582594;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WDuzu+Ee/1OfWwFmJIt/U0/ftCMHy4OMZ43jDu9dXiI=;
 b=cFG9N5VO2ASkE9d0VgSL8u0+S5ylA1DEDVSUC7H4AzAhqlJzDsr1roCs
 lMiycCTHltlhwH7063ExYXPkFozYtKuTB0UWc+NBoydQuqbikj4BJPl42
 lRBxze410nW8kn45CsVVj058LxLreQzFwNLxj2PBT2uyoyV153hnBO/od
 dsCs3yIatvm/6tcVMwaw+DfHEltBcXES2LgBk0F1+QxJrYbxdIy3UplEn
 1PNCZot4VRw8uMBezD6PhBD8lEToTfl5I+Q6RGShADK4Ugj/mlnLI0QOQ
 0j63u9slLunHRrIJXBlOPG1FAfGw/spF6qQJGG3QfInIeTdRSvzDellwl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342448606"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="342448606"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 06:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="717382454"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="717382454"
Received: from gkarray-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.226])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 06:49:47 -0700
Date: Thu, 29 Jun 2023 15:49:43 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZJ2L9+lMBU1L0U3M@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627183043.2024530-2-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe/hwmon: Add HWMON infrastructure
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

[...]

>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_debugfs_register(xe);
>  
> +	xe_hwmon_register(xe);

we don't have any information whe hwmon has been created or not.

Please return an error and print a warning if something wrong
happens and we fail to register the hwmon interface.

[...]

> +struct hwm_drvdata {
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	char name[12];
> +};
> +
> +struct xe_hwmon {
> +	struct hwm_drvdata ddat;
> +	struct mutex hwmon_lock;
> +};

What's the reason for having two different structures here?

[...]

> +void xe_hwmon_register(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	struct hwm_drvdata *ddat;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(xe))
> +		return;

this check is useless, we wouldn't be here otherwise.

[...]

> +void xe_hwmon_unregister(struct xe_device *xe)
> +{
> +	xe->hwmon = NULL;

We could also destroy the mutex and unregister the hwmon?

[...]

> +#if IS_REACHABLE(CONFIG_HWMON)
> +void xe_hwmon_register(struct xe_device *xe);
> +void xe_hwmon_unregister(struct xe_device *xe);
> +#else
> +static inline void xe_hwmon_register(struct xe_device *xe) { };
> +static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +#endif

for readability we can leave some space between the
#if...#else...#endif and the content.

Andi
