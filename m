Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1D1EEAA44
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 14:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC7A10E296;
	Thu, 14 Sep 2023 14:22:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A1110E296
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694701376; x=1726237376;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8WrxVRs6F9ENaHWXu8uasqRGuN4jnCf8Zg/dONw2GR0=;
 b=V8wwAlyo+YwUR5Yai5XVksLpqTSvN/k1yFxP+W+mfaWvRUlKm7nDlyyL
 9XVmkfrsJuAYsyQmBFg+yZ9sIuf8kT93dwFsKQo5X6Ow9siXbTPCWqQ+l
 +rTndeRJU75iUyJgYI4YMebNo3QbxY+y4v4w5fUBy13j+fj3RUeiCKZcE
 j8FDskfuwUFdyy8OPTDBaXIywKchduZXX9piFyLLVW2AcIln32/ZiTKpF
 YVQF4+dZDwtbXjHkHwosl20aC/LANkSRrHTCCtgxw8/+6p4RN5bJVlN4+
 e+dVjPZSYkNUwY6tbJ9hsozjqKLQf1eF6ZkJ9DDJSY7+ir47D6AKnvofF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376301346"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="376301346"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 07:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="814685830"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="814685830"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 07:22:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZQMSfcP5O8bRpkwO@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
 <20230913232837.2811049-4-daniele.ceraolospurio@intel.com>
 <87msxpw5q3.fsf@intel.com> <ZQMSfcP5O8bRpkwO@intel.com>
Date: Thu, 14 Sep 2023 17:22:50 +0300
Message-ID: <871qf0x29x.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 14 Sep 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Thu, Sep 14, 2023 at 10:53:40AM +0300, Jani Nikula wrote:
>> 
>> [hijacking the thread a bit, sorry]
>> 
>> On Wed, 13 Sep 2023, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> > index de85494e2280..0660017c3e83 100644
>> > --- a/drivers/gpu/drm/xe/xe_module.c
>> > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > @@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
>> >  module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>> >  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>> >  
>> > +char *xe_guc_firmware_path = NULL;
>> > +module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
>> > +MODULE_PARM_DESC(guc_firmware_path,
>> > +		 "GuC firmware path to use instead of the default one");
>> > +
>> > +char *xe_huc_firmware_path = NULL;
>> > +module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
>> > +MODULE_PARM_DESC(huc_firmware_path,
>> > +		 "HuC firmware path to use instead of the default one - empty string disables");
>> > +
>> >  char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>> >  module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
>> >  MODULE_PARM_DESC(force_probe,
>> 
>> Not related to this patch specifically, but, uh, why does xe collect all
>> module parameters in one file like this?
>> 
>> IMO there's two reasonable ways of defining module paramers:
>> 
>> 1) Module parameters defined for static variables in each .c file where
>> needed, and avoid the need to access them in multiple .c files.
>> 
>> 2) Module parameters defined in a single file, wrapped in a global
>> struct. (This is what i915 does.)
>> 
>> Putting all of the variables in a single file, and exposing them
>> globally is not cool. You want to limit the number of module global
>> variables in big drivers like this.
>> 
>> (Of course, primarily module parameters should be avoided altogether.)
>
> Well, I believe this is my fault. I explicitly asked folks to avoid doing
> what i915 was doing. Well, when I asked that I was more focused on avoiding
> the macros and doing in the same way that other drivers were doing.
>
> I really hated the explosion of parameters in our internal version of i915.
> We need to do our best to avoid, or at least minimize the amount of params
> and I believe the macros is like an incentive/invitation to bring more.
>
> Then while checking other big drivers around we see that there are many
> drivers doing the same extern exports as xe.
>
> Would something like iwlwifi_mod_params from
> drivers/net/wireless/intel/iwlwifi/iwl-modparams.h ease your concerns?

I think that's exactly 2) above. i915 having macro wrappers for this is
an implementation detail that's neither here nor there.

BR,
Jani.

>
> Thanks,
> Rodrigo.
>
>> 
>> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> > index 2c1f9199f909..e1da1e9ca5cb 100644
>> > --- a/drivers/gpu/drm/xe/xe_module.h
>> > +++ b/drivers/gpu/drm/xe/xe_module.h
>> > @@ -10,4 +10,6 @@ extern bool force_execlist;
>> >  extern bool enable_display;
>> >  extern u32 xe_force_vram_bar_size;
>> >  extern int xe_guc_log_level;
>> > +extern char *xe_guc_firmware_path;
>> > +extern char *xe_huc_firmware_path;
>> >  extern char *xe_param_force_probe;
>> 
>> Basically *every* extern in a big driver is a sign of a problem. Data is
>> not an interface.
>> 
>> Yes, also i915_modparams violates this, but it groups the stuff together
>> under *one* extern struct with a "namespace", if you will.
>> 
>> 
>> BR,
>> Jani.
>> 
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
