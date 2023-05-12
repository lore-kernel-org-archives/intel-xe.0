Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67360C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 06:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292B810E0B9;
	Fri, 12 May 2023 06:59:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6766D10E0B9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683874784; x=1715410784;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yBHS0PgZ2ZTd5C/1q/cznBnSDd38Uc0fIvIq1aMMFs4=;
 b=MyqcAaoKqarTJgTtooVfUX9HdXikev9MfeihduEbyD5or6P77VrEQyPE
 47b2eXqgoGxswyAyKZDHgN6mmjQAR4BGToPyMYwvKY0flQE3Pqflc8QiO
 BIqg2IgYnMJL+h/b7icFmKVT2IqNFKSKVmRdKPkEjE2Rjh8j3TmJzQZ6F
 8zo6JowvmvPibEA/r4ka4YNl7rcD9PcCllFPyCKfcN+BGXU7NvE18jNRV
 U+sPTBJxInBt4J3EwP9nRqK9j2qO+V2Jzp/2Hbfoc+fQzd4wzov0ZwIVd
 hVV7HWq73S0OpgyM4UvU79t2edJbiKpCQ60sceXru9Rjw8ATwpBP/PsVw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="349561440"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="349561440"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1029947283"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="1029947283"
Received: from skwasnia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.231])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:59:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
In-Reply-To: <a07d22dca00b723638da0db67dd7b797f1bdbcb0.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
 <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
 <njuthgb5uutcknbsxvvvxfx5636bofmwmfyjq6nbxkpbxai4xp@4vwutipfdpd7>
 <9d04fce692222624580527c6d07ea88460a32ca7.camel@intel.com>
 <oedsuayuo3wtdea6cvmzaoesji25bwbqohgemayj5ocybbzgtn@el2d34rwqfsn>
 <a07d22dca00b723638da0db67dd7b797f1bdbcb0.camel@intel.com>
Date: Fri, 12 May 2023 09:59:38 +0300
Message-ID: <875y8ykpb9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 11 May 2023, "Souza, Jose" <jose.souza@intel.com> wrote:
> On Thu, 2023-05-11 at 11:02 -0700, Lucas De Marchi wrote:
>> On Thu, May 11, 2023 at 05:22:34PM +0000, Jose Souza wrote:
>> > On Thu, 2023-05-11 at 10:12 -0700, Lucas De Marchi wrote:
>> > > On Thu, May 11, 2023 at 12:47:26PM +0000, Jose Souza wrote:
>> > > > On Wed, 2023-05-10 at 12:54 -0700, Lucas De Marchi wrote:
>> > > > > Stop the dance of enabling the display-related driver_features to later
>> > > > > disable them on display info init if the platform doesn't have display
>> > > > > IP. Besides being needless work, it wasn't covering the ATS-M case that
>> > > > > is the same platform as DG2, but without display.
>> > > > 
>> > > > Xe should set pipe_mask = 0 and call i915 functions that will handle no display cases.
>> > > 
>> > > in xe, enable_display is the runtime config to be the equivalent of
>> > > DRM_XE_DISPLAY=n. It is *not* to meant disabling the display.
>> > > 
>> > > history why this ever came to be was:
>> > > 
>> > > 1) display integration back in the day was less than ideal (still is),
>> > >     and developers couldn't test things ignoring display
>> > 
>> > Xe CI is now testing display, in my opinion this option to disable display should be removed and display support always built.
>> 
>> maybe. Last time I checked there was a 50% divide on having or not
>> having it and afair I was against. I'd not touch that until display
>> integration settles and stop moving in the branch.
>> 
>> 	95dd4dbb5f89 ("drm/xe: Make compilation of display optional")
>> 	6a53b00afa0b ("drm/xe: Add big warning for !CONFIG_DRM_XE_DISPLAY path.")
>> 
>> Unfortunately I can't easily map to the MR where that was discussed.
>> 
>> +Maarten
>> 
>> Also, "Xe CI is now testing display" is not a good justification wrt ats-m.
>> Besides not not covering all ats-m (see
>> https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html?), it's actually
>> running display tests on the AST driver.  See
>> https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html?
>> 
>> > 
>> > > 2) have a way to tell the driver "don't ever touch display IP" for
>> > >     bring-up situations.
>> > 
>> > pipe_mask = 0/HAS_DISPLAY() should take care of it.
>> > developers could force pipe_mask = 0 for giving platform bring-up.
>> 
>> The hole is deeper than you think. See:
>> drivers/gpu/drm/xe/display/ext/intel_device_info.c
>> 
>> In i915, pipe_mask set the device info based on the PCI ID:
>> 
>> 	static const struct intel_device_info ats_m_info = {
>> 		....
>> 	        NO_DISPLAY,
>> 	};
>> 
>> 	INTEL_ATS_M_IDS(&ats_m_info),
>> 
>> This is how i915 differentiates DG2 from ATS-M. Now look at xe with the
>> device info split in 2 places, xe_pci.c and xe_display.c.
>> We can't use the PCI ID mapping to know ATS-M is not DG2. We can't use
>> the subplatform neither, as they are already part of other subplatforms:
>> 
>> 	static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
>> 	static const u16 dg2_g11_ids[] = { XE_DG2_G11_IDS(NOP), XE_ATS_M75_IDS(NOP), 0 };
>> 
>> Changing that for the sake of display basically means having to treat
>> them differently throughout the driver, which is worse than simply
>> having a `has_display` flag added. When we eventually migrate to disable
>> display, the has_display flag in the xe's  device info can still stay
>> and how we tell xe_display.c that the platform has or not display (as
>> opposed to setting info.enable_display)
>> 
>> 
>> As I said above, I'm not really against the long term plan of removing
>> the kernel config. In that long term plan we'd not have a
>> enable_display= module param neither as we'd have already a replacement
>> for the global module configuration, allowing it to be done per device.
>> But I don't think it should block the fix for ats-m done here.
>
> As short term solution ack on this patch from me.
> Do you agree too Jani?

Yeah.

There was a lot of conflation in i915 what the various "has display" and
"disable display" configurations actually meant, and how they needed to
be implemented, and xe adds kconfig and this flag on top. Need to be
careful not to make a mess of it!

BR,
Jani.


>
>> 
>> Lucas De Marchi
>> 
>> > 
>> > > 
>> > > For (1) we may turn that into "disable display" now, but not for (2).
>> > > 
>> > > I'll take a look on how much work it would be to migrate to a
>> > > disable-display scenario rather than the simple "Fix ats-m" being done
>> > > here.
>> > > 
>> > > Lucas De Marchi
>> > 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
