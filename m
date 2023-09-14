Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A367EDE98F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 07:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C77B10E511;
	Thu, 14 Sep 2023 07:53:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAA910E518
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694678033; x=1726214033;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=CJvDsDWpWoGjz50uoy0FU0iXTuUw4Lapxufsh+4V2Jc=;
 b=TXcFWJ4f1D4HmXpE7FK/ljDcfAowwPH/ah4zzGr6pz77oZMIvJWyUPHu
 8cmRiNbgPvzqDJduHviRlwz1OqsaJoIFLJO4L1LGxc5P5uloTeR0G19Lf
 bvHGT6evqy3nfrrnianABLyIBns8k/kh1cBt2CYlH6zhAL5d3Rk8mm4Vq
 kSPrHY0hrqNkXZsrJ/gmo0rvBfYvI5+cNlK32IdTjSzUHYdsa91WGycGs
 Kv0RnvTQzUD2dFbZ8Q4aeZdL9vmegLw/rOC7pKVV2rpXPdiopCu/tR8vD
 6XZrraVcHmm786nUminESORCxy5RYNecYnmYHyxldpa7hfyRPnfHUkaOc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363921615"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="363921615"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 00:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773799979"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="773799979"
Received: from haslam-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 00:53:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
In-Reply-To: <20230913232837.2811049-4-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
 <20230913232837.2811049-4-daniele.ceraolospurio@intel.com>
Date: Thu, 14 Sep 2023 10:53:40 +0300
Message-ID: <87msxpw5q3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/uc: Add GuC/HuC firmware path
 overrides
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


[hijacking the thread a bit, sorry]

On Wed, 13 Sep 2023, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index de85494e2280..0660017c3e83 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
>  module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>  
> +char *xe_guc_firmware_path = NULL;
> +module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
> +MODULE_PARM_DESC(guc_firmware_path,
> +		 "GuC firmware path to use instead of the default one");
> +
> +char *xe_huc_firmware_path = NULL;
> +module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
> +MODULE_PARM_DESC(huc_firmware_path,
> +		 "HuC firmware path to use instead of the default one - empty string disables");
> +
>  char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>  module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,

Not related to this patch specifically, but, uh, why does xe collect all
module parameters in one file like this?

IMO there's two reasonable ways of defining module paramers:

1) Module parameters defined for static variables in each .c file where
needed, and avoid the need to access them in multiple .c files.

2) Module parameters defined in a single file, wrapped in a global
struct. (This is what i915 does.)

Putting all of the variables in a single file, and exposing them
globally is not cool. You want to limit the number of module global
variables in big drivers like this.

(Of course, primarily module parameters should be avoided altogether.)

> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 2c1f9199f909..e1da1e9ca5cb 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -10,4 +10,6 @@ extern bool force_execlist;
>  extern bool enable_display;
>  extern u32 xe_force_vram_bar_size;
>  extern int xe_guc_log_level;
> +extern char *xe_guc_firmware_path;
> +extern char *xe_huc_firmware_path;
>  extern char *xe_param_force_probe;

Basically *every* extern in a big driver is a sign of a problem. Data is
not an interface.

Yes, also i915_modparams violates this, but it groups the stuff together
under *one* extern struct with a "namespace", if you will.


BR,
Jani.


-- 
Jani Nikula, Intel
