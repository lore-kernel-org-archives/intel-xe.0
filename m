Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF56E92FF3
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 07:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAFB10E4B5;
	Fri,  6 Oct 2023 07:40:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC5910E4B5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696578001; x=1728114001;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Lwt+VwjNEsxgM/3pz4Hjr+3YN0j+dMsmLhicMjvWh54=;
 b=U90d1l7DAm++ZPdhn/sEeKVlOqxq1chUs7a/E6qz2AQ3QIIDLZhs7u8E
 xc+X73HHs95nRBpIBPe7oOblxv9+gJMsWaIJzFN+uDftgOA0Hiy8mVvG5
 QPR841aMtPnqpdxR72IND18x0EqTsKVHzdQSIHYF2X06t8VjaTFWqsGSL
 Y+w5Ml7uTH6gjBt5MN/5562Pa6zy7Nv8AIU+WqMALyryorTgkdJxh+TIv
 gWZ+rBEw7njxiWcnHdONtn1YVd15C4nZro5Wx08hRL8wQuUGpx0hI+ETB
 HciAzQVyjQgD2s+QtwUSxxa91l2vvwROIBWZaQkU2KZl0IAU3sm26WXaI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363056425"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363056425"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 00:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895789147"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="895789147"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.239])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 00:38:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
In-Reply-To: <ZR8DWVeXtkrIU8Uj@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
 <20231003203716.108979-3-anusha.srivatsa@intel.com>
 <87fs2qg6pe.fsf@intel.com>
 <xgggupdygmhbyruwqgr3d3hoorvokgdahfqpfdnhb64qna23mu@zlcb3borrej7>
 <ZR8DWVeXtkrIU8Uj@intel.com>
Date: Fri, 06 Oct 2023 10:39:52 +0300
Message-ID: <87ttr46vxz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/5] fixup! drm/xe/rplu: s/ADLP/ALDERLAKE_P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 05 Oct 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Wed, Oct 04, 2023 at 01:16:48PM -0500, Lucas De Marchi wrote:
>> On Wed, Oct 04, 2023 at 10:58:05AM +0300, Jani Nikula wrote:
>> > On Tue, 03 Oct 2023, Anusha Srivatsa <anusha.srivatsa@intel.com> wrote:
>> > > Extend the change introduced in the previous patch to xe
>> > > driver.
>> > 
>> > This is not a fixup to the previous patch. This needs to be a fixup to
>> > the commit that added the file to begin with.
>> > 
>> > The order of the patches will be changed to add display enabling last.
>> 
>> 
>> assuming we are still going to move display up. Rodrigo mentioned
>> recently about maybe stopping that. +Rodrigo
>
> I hope we don't need to move them up anymore. but let's revisit this
> in about 2 weeks.

I don't think that's the right choice. Please don't lock xe core and
display upstreaming together, even if everyone wants them to happen
together.

This ambiguous approach means we don't know whether to use fixups or
regular commits.

BR,
Jani.



>
>> 
>> In this case the commit message should be:
>> 
>> 	Subject: fixup! drm/xe/display: Implement display support
>
> since this is the fixup, then the right placement is as first patch
> in the series to avoid further conflicts when autosquashing without
> moving the rest of display up.
>
>> 
>> Lucas De Marchi
>> 
>> > 
>> > BR,
>> > Jani.
>> > 
>> > > 
>> > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > 
>> > > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> > > index 7c825f129166..918dd27868fa 100644
>> > > --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> > > +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> > > @@ -146,7 +146,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>> > >  #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
>> > >  #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
>> > >  #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
>> > > -#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
>> > > +#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
>> > >  #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
>> > >  #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
>> > >  #define to_intel_bo(x) gem_to_xe_bo((x))
>> > 
>> > -- 
>> > Jani Nikula, Intel

-- 
Jani Nikula, Intel
