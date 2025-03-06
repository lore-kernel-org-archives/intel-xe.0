Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F5DC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 10:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33CB10E175;
	Thu,  6 Mar 2025 10:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCmwwRbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AE910E175
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741257867; x=1772793867;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=34ZYfdI8rPt22I7yf1ubgCBBb6CEV+yFLlEEyVjJ984=;
 b=BCmwwRbiWsjTTuQD2jjsy0tdjvHW1CxJPeTV9Ab/kuES/0KaGdUoi2E6
 5v66+j2RLD7A8xhkFbV48Rot+NQieXJt5O/ZTYCMQd7evCy6cCKkK0aUj
 vCyWzJ1YLtoStX3qAfs+WIFejuJd6TT6BjeZQ6vJDqjrcgBbM+XzhOai/
 ya/tBE8GtfTHKlC7H6AUbZYennleZMQORmtZ/staPwGF6bxjuBtpqQsHs
 yhU1cdOJxkFfaoDSEzNAexk3u7bA9zmfMZoSuJbQQBkTlLkzp2nwnQUh8
 +GcsXzlteFwHE1fT3Gt+Bs7K9GyMiAmT1NvZpoMKF3O+U3TFu8qI6XhH3 w==;
X-CSE-ConnectionGUID: FEIldqXgQZWZrlmuHLjmwA==
X-CSE-MsgGUID: 4uv6WgghRQaNqMjlJECa3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42392100"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="42392100"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 02:44:27 -0800
X-CSE-ConnectionGUID: 2p7HNK4lS3+VjqnUyfDvtQ==
X-CSE-MsgGUID: caqus43hQqCpKrzHfL69SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="124083230"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 02:44:24 -0800
Date: Thu, 6 Mar 2025 12:44:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/xe/pcode: stop logging mailbox status as error
Message-ID: <Z8l8haryZ2q2Cq0V@black.fi.intel.com>
References: <20250304061727.452100-1-raag.jadav@intel.com>
 <29d173b4-4cac-4765-a13e-8723b44f5270@linux.intel.com>
 <Z8ljepyswfhWhl05@black.fi.intel.com>
 <816f679f-e981-4ee5-9c19-31b2881b11e4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <816f679f-e981-4ee5-9c19-31b2881b11e4@linux.intel.com>
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

On Thu, Mar 06, 2025 at 03:17:16PM +0530, Aravind Iddamsetty wrote:
> On 06-03-2025 14:27, Raag Jadav wrote:
> > On Thu, Mar 06, 2025 at 10:08:07AM +0530, Aravind Iddamsetty wrote:
> >> Hi Raag,
> >>
> >> On 04-03-2025 11:47, Raag Jadav wrote:
> >>> Since we're expecting many platform specific mailbox commands that
> >>> might not be widely supported, stop logging them as errors. With this
> >>> we can avoid unnecessary platform checks and use the return value of
> >>> mailbox without enraging CI.
> >> are you saying there are cases where we send a command that is not supported
> >> on a particular platform?
> > Yes. First instance on [1], which will be expanded with more commands.
> >
> > [1] https://lore.kernel.org/r/20250210100515.2205584-1-raag.jadav@intel.com/
> 
> But why should we expose the interface which is not supported on that HW.

It allows checking unsupported functionality through return code without
making CI angry. So it's either this or we can limit each command (current
and future) with explicit platform checks and keep revisiting them everytime
we add a new platform or command for the foreseeable future, whichever makes
more sense.

Raag

> >>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_pcode.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> >>> index 9333ce776a6e..280f69119ff1 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pcode.c
> >>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> >>> @@ -46,7 +46,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
> >>>  
> >>>  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
> >>>  	if (err) {
> >>> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> >>> +		drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> >>>  			err_decode[err].str ?: "Unknown");
> >>>  		return err_decode[err].errno ?: -EPROTO;
> >>>  	}
