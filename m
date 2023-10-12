Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E02CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75C10E471;
	Thu, 12 Oct 2023 09:23:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430FD10E471
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697102623; x=1728638623;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=N/HMz+Pzu7cFJeMSKqj/YFyFqZsTllEYm/S1fexhVaY=;
 b=fsiz3pYdJesyxN1nEx2vVVr9PAcrih7ATyYQy5F3GIx5pU1H57osMmBV
 1UlCetnrK8AooJSdMPvC2atLJk+tWteDkygzmYNtvMWG8a4MzdIR1OdKL
 Jqm35RHJ1bpixiJoi9WqsOP0jGcxfMZUaU/O2ggCr8lF0dOyDeQYw/hcB
 YkpuS+u4r/IPRFKtlnDD0ys/R9lbsj++MkHUtN5lHqIG5/v1tz7ADIL3D
 BDHVcOEgMI7UwV+89LeEzwBnn9Uh7GnSm7ghxR+yLi+GT5CGURF60ChFx
 ZtQAecMUMpteabwuQ1DnGEa2OUcREawJ9USEn1iKTA2W2JmHIsHj21Gc2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364243782"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="364243782"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="820066690"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="820066690"
Received: from anikafix-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.188])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:23:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>
In-Reply-To: <DM6PR11MB317724F933FEF643A1CCAFE1BAD3A@DM6PR11MB3177.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <20231012084707.1254386-1-arun.r.murthy@intel.com>
 <87ttqw2orf.fsf@intel.com>
 <DM6PR11MB317724F933FEF643A1CCAFE1BAD3A@DM6PR11MB3177.namprd11.prod.outlook.com>
Date: Thu, 12 Oct 2023 12:23:38 +0300
Message-ID: <87fs2g2nz9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/2] drm/i915: Remove the module parameter
 'fastboot'
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

On Thu, 12 Oct 2023, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Thursday, October 12, 2023 2:37 PM
>> To: Murthy, Arun R <arun.r.murthy@intel.com>; intel-xe@lists.freedesktop.org;
>> Shankar, Uma <uma.shankar@intel.com>
>> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
>> Subject: Re: [PATCH 1/2] drm/i915: Remove the module parameter 'fastboot'
>>
>> On Thu, 12 Oct 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> > By default fastboot is enabled on all Display 9+ platforms and
>> > disabled on older platforms. Its not necessary to retain this as a
>> > module parameter.
>> >
>> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> > Link:
>> > https://patchwork.freedesktop.org/patch/msgid/20230926091157.635438-1-
>> > arun.r.murthy@intel.com (cherry picked from commit
>> > 58883680a8416661b48a800e5530e2efcea64a4a
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_display.c | 3 ---
>> >  drivers/gpu/drm/i915/i915_params.c           | 5 -----
>> >  drivers/gpu/drm/i915/i915_params.h           | 1 -
>> >  3 files changed, 9 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> > b/drivers/gpu/drm/i915/display/intel_display.c
>> > index 4b73db93d23d..748e9a42e94f 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> > @@ -4989,9 +4989,6 @@ pipe_config_mismatch(bool fastset, const struct
>> > intel_crtc *crtc,  static bool fastboot_enabled(struct
>> > drm_i915_private *dev_priv)  {  #ifdef I915
>> > -   if (dev_priv->params.fastboot != -1)
>> > -           return dev_priv->params.fastboot;
>> > -
>>
>> Sorry, you've got the patch order wrong. You've had to modify the backport
>> which is evident from the context.
>>
>> The revert goes first and the backport next. When the original patch and its
>> revert get rebased away, the backport will still be intact. With this order, you
>> get conflicts every step of the way, and have to be fixed, and still risk deviating
>> from the upstream commit.
>
> I was assuming that if the revert goes first then that would break the build.
> Hence though of removing that variable first and then revert thereby each
> individual patch builds are not broken.
> Anyway will get it done this way.

It's a valid point for upstream, but since we're still doing rebases
let's try to optimize for the person doing the rebases.

>> Also, please post new revisions of patch series as new threads. The replies to
>> threads gets confusing to both humans and CI.
>
> In order to retain the history used in-reply-to. Will push as a new series.

I get the point, but please rather just reference the old version in the
cover letter. In-reply-to is fine for updating individual patches in a
larger series to avoid having to resend the entire series because of
just one or two patches.

BR,
Jani.


>
> Thanks and Regards,
> Arun R Murthy
> --------------------
>>
>> BR,
>> Jani.
>>
>>
>> >     /* Enable fastboot by default on Skylake and newer */
>> >     if (DISPLAY_VER(dev_priv) >= 9)
>> >             return true;
>> > diff --git a/drivers/gpu/drm/i915/i915_params.c
>> > b/drivers/gpu/drm/i915/i915_params.c
>> > index 0a171b57fd8f..036c4c3ed6ed 100644
>> > --- a/drivers/gpu/drm/i915/i915_params.c
>> > +++ b/drivers/gpu/drm/i915/i915_params.c
>> > @@ -137,11 +137,6 @@ i915_param_named_unsafe(enable_ips, int, 0400,
>> > "Enable IPS (default: true)");  i915_param_named_unsafe(enable_dpt, bool,
>> 0400,
>> >     "Enable display page table (DPT) (default: true)");
>> >
>> > -i915_param_named(fastboot, int, 0400,
>> > -   "Try to skip unnecessary mode sets at boot time "
>> > -   "(0=disabled, 1=enabled) "
>> > -   "Default: -1 (use per-chip default)");
>> > -
>> >  i915_param_named_unsafe(load_detect_test, bool, 0400,
>> >     "Force-enable the VGA load detect code for testing (default:false). "
>> >     "For developers only.");
>> > diff --git a/drivers/gpu/drm/i915/i915_params.h
>> > b/drivers/gpu/drm/i915/i915_params.h
>> > index 68abf0ad6c00..d5194b039aab 100644
>> > --- a/drivers/gpu/drm/i915/i915_params.h
>> > +++ b/drivers/gpu/drm/i915/i915_params.h
>> > @@ -72,7 +72,6 @@ struct drm_printer;
>> >     param(int, edp_vswing, 0, 0400) \
>> >     param(unsigned int, reset, 3, 0600) \
>> >     param(unsigned int, inject_probe_failure, 0, 0) \
>> > -   param(int, fastboot, -1, 0600) \
>> >     param(int, enable_dpcd_backlight, -1, 0600) \
>> >     param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
>> >     param(unsigned int, request_timeout_ms,
>> > CONFIG_DRM_I915_REQUEST_TIMEOUT,
>> CONFIG_DRM_I915_REQUEST_TIMEOUT ?
>> > 0600 : 0) \
>>
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
