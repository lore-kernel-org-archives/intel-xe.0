Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09672CA6017
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 23:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D7E10E996;
	Thu,  8 Oct 2026 23:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOx2RyzC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CDB10E6DB;
 Thu,  8 Oct 2026 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791500621; x=1823036621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pTFyawSk8qHuDwtynB4qHLfAP3KDFPJZgz3OLqIW8tc=;
 b=OOx2RyzCZjsgQ00HDWhEunZqZFuVZOg6hEEIHEjYUHqNTKOBUQ9rZoOe
 X/UB6BrB66h/vAXJB6sc3euV/3md2RUu0bvcpSkINeW8G26mkx6wnL/e4
 Q6rAyIjynCxAPj7IkeratRlD11G0No//D9jvTYdaL0Ag5+xZziN21bsXz
 lUjghRvDa/bMH56jdqk++EB3yud7epUSGZfziGcdwaVuwTlf3fbVWHULE
 bKWv77tNldhtJ1eMhXIrf8VJPewY6rvAqrTjXLJdxk+DeOwGJNHLmd5K3
 Ccw+IEbCQlDH6aO5ewje5w7zQ2zHvqC0+k2eMluCYISsTdg1XfKDqC3V6 w==;
X-CSE-ConnectionGUID: /yCJFasORbqdGVEqWh1WiQ==
X-CSE-MsgGUID: 7o37ANShTMaNCOY44Cifaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="197108"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="197108"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 16:03:40 -0700
X-CSE-ConnectionGUID: pg0kdhLQQh68GkRIj3PZnA==
X-CSE-MsgGUID: QQ75blkFSAWosg8/keThbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="294779"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.205])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 16:03:38 -0700
Date: Fri, 9 Oct 2026 02:03:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [CI] drm/{i915, xe}: move intel_opregion_suspend() to
 intel_display_driver_pm_suspend_late()
Message-ID: <asghR_roL_CLwSHF@intel.com>
References: <20261008114735.2662427-1-jani.nikula@intel.com>
 <aseIwWEv58T-wioc@intel.com>
 <3cd8f3e26fb5e9d195d19dcafbd288fa6ca72f74@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cd8f3e26fb5e9d195d19dcafbd288fa6ca72f74@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Oct 08, 2026 at 05:00:04PM +0300, Jani Nikula wrote:
> On Thu, 08 Oct 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Thu, Oct 08, 2026 at 02:47:35PM +0300, Jani Nikula wrote:
> >> Try to unify the suspend paths and behaviour by moving the
> >> intel_opregion_suspend() calls to
> >> intel_display_driver_pm_suspend_late().
> >> 
> >> This is a change in the suspend sequences. The idea behind adding this
> >> to intel_display_driver_pm_suspend_late() is primarily based on not
> >> having to pass the s2idle parameter to more functions than that.
> >> 
> >> This also changes behaviour for i915 hibernation, going for PCI_D3cold
> >> instead of PCI_D1 on hibernate.
> >
> > Pretty sure I pointed out before that this isn't true. PCI_D3cold is
> > what the current code also does.
> 
> Right, you did, but I failed to address it. Sorry.
> 
> I have tried to track down what acpi_target_system_state() actually
> returns during .freeze_late and .poweroff_late struct dev_pm_ops calls,
> and it's far from obvious.
> 
> I don't think you can reliably say acpi_target_system_state() ==
> ACPI_STATE_S4 on the paths that pass hibernation=true.

After staring at it a bit I think what I said is correct.

hibernation_snapshot() calls acpi_hibernation_begin() (assuming
/sys/power/disk==platform) prior to dpm_suspend(PMSG_FREEZE),
and hibernation_platform_enter() calls it again prior to
dpm_suspend_start(PMSG_HIBERNATE).

Also verified on an actual system, and both .freeze() and
.poweroff() see PCI_D3cold.

Looks like the thing that does change a bit is whether opregion
suspend happens at all during error handling and some pm_test
modes, because the _late() hooks may be skipped for those.

> 
> Are we good to go with the patch or do you want some changes?
> 
> 
> BR,
> Jani.
> 
> 
> >
> > I suppose it *might* be the case if one does something like 
> > 'echo reboot > /sys/power/disk', but I've not actually checked
> > what that sort of thing does to acpi_target_system_state()...
> >
> >> It's probably the correct thing to do
> >> anyway, I don't think it should matter all that much, but fingers
> >> crossed.
> >> 
> >> Reviewed-by: Imre Deak <imre.deak@intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
> >>  drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
> >>  drivers/gpu/drm/xe/display/xe_display.c             | 3 ---
> >>  3 files changed, 2 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> >> index 77009dca7d0d..abab457bce3a 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> >> @@ -783,6 +783,8 @@ void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2
> >>  	if (!HAS_DISPLAY(display))
> >>  		return;
> >>  
> >> +	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
> >> +
> >>  	intel_display_power_suspend_late(display, s2idle);
> >>  }
> >>  
> >> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> >> index 9e047c27a153..293099fe6639 100644
> >> --- a/drivers/gpu/drm/i915/i915_driver.c
> >> +++ b/drivers/gpu/drm/i915/i915_driver.c
> >> @@ -1075,7 +1075,6 @@ static int i915_drm_suspend(struct drm_device *dev)
> >>  {
> >>  	struct drm_i915_private *dev_priv = to_i915(dev);
> >>  	struct intel_display *display = dev_priv->display;
> >> -	pci_power_t opregion_target_state;
> >>  
> >>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> >>  
> >> @@ -1089,9 +1088,6 @@ static int i915_drm_suspend(struct drm_device *dev)
> >>  
> >>  	i9xx_display_sr_save(display);
> >>  
> >> -	opregion_target_state = suspend_to_idle(dev_priv) ? PCI_D1 : PCI_D3cold;
> >> -	intel_opregion_suspend(display, opregion_target_state);
> >> -
> >>  	dev_priv->suspend_count++;
> >>  
> >>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> >> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> >> index aab416485e3e..7d19f3c42e0e 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_display.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> >> @@ -238,14 +238,11 @@ static bool suspend_to_idle(void)
> >>  void xe_display_pm_suspend(struct xe_device *xe)
> >>  {
> >>  	struct intel_display *display = xe->display;
> >> -	bool s2idle = suspend_to_idle();
> >>  
> >>  	if (!xe->info.probe_display)
> >>  		return;
> >>  
> >>  	intel_display_driver_pm_suspend(display);
> >> -
> >> -	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
> >>  }
> >>  
> >>  void xe_display_pm_suspend_late(struct xe_device *xe)
> >> -- 
> >> 2.47.3
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
