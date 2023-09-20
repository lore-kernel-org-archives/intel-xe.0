Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A018CE79B9
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 10:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1306B10E21B;
	Wed, 20 Sep 2023 10:08:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF28C10E260
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 10:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695204514; x=1726740514;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GQLvDw3Q9wry0h0zDsjsSTVt609ddqtyuuD/4BXsUCg=;
 b=TPsz16NpNY5snFVBxcly6qJidcOTIiARGJoq1pcTxMwzHsZm3CvAavrP
 R4tnG5R51RHSk7fHCmvaHcfEiTDI/wdpV1XERZdIrV1pavCpg5Ku3eE5o
 LvlXXmQnBOjdLuVClzTYBE6kH2mpdJxyBxP/iJqAZrjZrYa9/VQg61sQ2
 C4m+xMikI2U0juowg4w2oz9LER81e4iyTtlBd0sFgUn5s11G4FiTRVvV8
 UzH0DBMyxJasLqBy5Xj3GvV1T4r4h2MZ15/LtZGZ2z7IZPVEJ/JamlSJT
 ZSBZDp+d5so5JGKGea389jiJbZ2h/HKJJxmfT32rR8HnoQj8WpLkHqH9z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370495292"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="370495292"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 03:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861917942"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="861917942"
Received: from ptelkov-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.38.103])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 03:08:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
In-Reply-To: <DM4PR11MB63600D5DCF025595B46C98B9F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-3-uma.shankar@intel.com> <87h6nqtpzb.fsf@intel.com>
 <DM4PR11MB63600D5DCF025595B46C98B9F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
Date: Wed, 20 Sep 2023 13:08:29 +0300
Message-ID: <878r91rwbm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add wrapper function for VGA
 decode setup
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

On Wed, 20 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Tuesday, September 19, 2023 4:00 PM
>> To: Shankar, Uma <uma.shankar@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Shankar, Uma
>> <uma.shankar@intel.com>
>> Subject: Re: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setup
>>
>> On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
>> > Some of the VGA functionality is not needed by the Intel Xe driver.
>> > Adding a wrapper function for VGA decode setup.
>> >
>> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/display/ext/i915_utils.c | 5 +++++
>> >  drivers/gpu/drm/xe/xe_display.h             | 1 +
>> >  2 files changed, 6 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c
>> > b/drivers/gpu/drm/xe/display/ext/i915_utils.c
>> > index 981edc2788bc..aa3e9ad718c3 100644
>> > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
>> > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
>> > @@ -20,3 +20,8 @@ int __i915_inject_probe_error(struct
>> > drm_i915_private *i915, int err,  {
>> >     return 0;
>> >  }
>> > +
>> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
>> > +enable_decode) {
>> > +   return -EIO;
>> > +}
>>
>> We don't really want to add anything new to i915_utils.c. It's just temporary cruft
>> that had to be taken from i915 to make the rest compile.
>
> Hi Jani,
> Thanks for the feedback.
>
> I was looking at any good place to stack it together. There are some misc stuff like this
> which we may need for some other stuff as well.
> Should I add a xe_disp_misc file for this or any other suggestion on file which we can use.

Let's take a step back, though.

Why is this call needed on i915 but not on xe?

BR,
Jani.


>
> Regards,
> Uma Shankar
>
>> > diff --git a/drivers/gpu/drm/xe/xe_display.h
>> > b/drivers/gpu/drm/xe/xe_display.h index 03b7ea9268d4..d7a200e6ec30
>> > 100644
>> > --- a/drivers/gpu/drm/xe/xe_display.h
>> > +++ b/drivers/gpu/drm/xe/xe_display.h
>> > @@ -38,6 +38,7 @@ void xe_display_pm_suspend(struct xe_device *xe);
>> > void xe_display_pm_suspend_late(struct xe_device *xe);  void
>> > xe_display_pm_resume_early(struct xe_device *xe);  void
>> > xe_display_pm_resume(struct xe_device *xe);
>> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
>> > +enable_decode);
>>
>> We also don't want to add random declarations in xe_display.h either...
>
> Yeah, looking deeper seems we don't need it as compat-header is already including the same.
> Will drop this declaration.
>
> Regards,
> Uma Shankar
>
>> BR,
>> Jani.
>>
>> >
>> >  #else
>>
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
