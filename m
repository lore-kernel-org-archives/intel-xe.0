Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFF5107636D
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 06:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6418210EC7A;
	Wed,  1 Apr 2026 06:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJ9FkihB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606BA10EC7A
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 06:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775024723; x=1806560723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d4e4ktdfL4iGzxMyDBxV1T0PcFAf5mv6U0UfP+w2tBI=;
 b=HJ9FkihBYmE/zoN770dSe88QojUnWZhxdV7O2/EwQ/X6d7rVnHgYMkYv
 +9Ferue0x9GaYOjPZgL16N5ZM5KkyzNDJi5lYyC52OZTuRD1HGHfjjSe4
 LpZSNnX1UmVHMlaLHIp657PszKh9wBWaZCfGdA3j/3WMMTv53ya+M2VNq
 YkZgDPUgRRecz6fvSGOvb8rSaXOt81uZEnv2wyREaYUbsxbTKP8M1U77m
 f9tHoHvf8H6s2ip3eBSJ/v/6PjMferyxcQEAuL7F4mR93NKdk2laEq7U6
 lz0C8WkjVlu8vCaySw9XXs7Br9vvbVdldWZLawWmNNNka957LWtBYPp9o A==;
X-CSE-ConnectionGUID: xAbLylS3T7mn2jsX4MTDPg==
X-CSE-MsgGUID: t/TGrou7RvuftSlhXPFL1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87513141"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87513141"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:25:21 -0700
X-CSE-ConnectionGUID: caEvNzgfSueqClXGQNLuZg==
X-CSE-MsgGUID: QXe8CWRITcKwE3FguwChKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="249802020"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:25:18 -0700
Date: Wed, 1 Apr 2026 08:25:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v2 07/11] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
Message-ID: <acy6S8gIHssGiQjp@black.igk.intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-20-riana.tauro@intel.com>
 <aahesvXwzXJZbOSF@black.igk.intel.com>
 <ab19a31f-03f1-4d21-b135-82e3417a2876@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab19a31f-03f1-4d21-b135-82e3417a2876@intel.com>
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

On Tue, Mar 31, 2026 at 09:44:10PM +0530, Tauro, Riana wrote:
> On 3/4/2026 10:02 PM, Raag Jadav wrote:
> > On Mon, Mar 02, 2026 at 03:52:02PM +0530, Riana Tauro wrote:
> > > Add the sysctrl commands and response structures for Uncorrectable
> > > Core Compute errors.
> > ...
> > 
> > > +static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
> > > +{
> > > +	if (severity >= XE_RAS_SEVERITY_MAX)
> > > +		return "Unknown Severity";
> > > +
> > > +	return xe_ras_severities[severity];
> > Rather,
> > 
> > 	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";
> I can make this change
> > 
> > and since this should ideally never happen, I'd also add a
> > 
> > 	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> This is only used in debug builds.

Exactly, we need a splat on out of spec behaviours in debug builds.

Raag

> Won't be useful anyway..
> 
> Thanks
> Riana
> > > +}
> > > +
> > > +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> > > +{
> > > +	if (comp >= XE_RAS_COMPONENT_MAX)
> > > +		return "Unknown Component";
> > > +
> > > +	return xe_ras_components[comp];
> > Ditto.
> > 
> > Raag
> > 
> > > +}
