Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF1C282DE
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 18:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C2410EA5B;
	Thu,  6 Mar 2025 18:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYga286X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BB410EA5B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741284696; x=1772820696;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QbSezbEQie3vNNUmxXcCzp6BrD8U6pIIF7qVXPF1mOo=;
 b=BYga286XZOQ3mtEFzPYMEjxaaSZJb3VRPljEI8Tnjxt2zicprXnhHNKz
 JXX234JAsixTytk6fCYwU3BvHrV8igpPkpAHXd5cVOv+cJDyhDXa1/9/I
 tpjnG0v6QuOTrgj6Wgb2o0BemAuPDCxsXOQ/G0wKWBuaMXPgt842K34Vx
 jAzSZCJoP3bAv0yecb3Y7ss9QiZVXBlZ5f9YOrRy1Vy6BlfC51V7ED09N
 RqWFQ3T5bEYwoprvVfqLNRpvp9jX3n4BvFYDSLgMkYlMtMTB2rOtQm22J
 76YHHG8/TbgIERoqUMeR39z89zUEAKJ08tr4DAt6NUvvfcRIIgRSOqPIH g==;
X-CSE-ConnectionGUID: Z07QvVbaRfqIl7SgDf8QfQ==
X-CSE-MsgGUID: zShKKrimSzeU+NIlRZUsHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59721116"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="59721116"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 10:11:35 -0800
X-CSE-ConnectionGUID: U7BC7gn2Q0eFnTWCj3UKvQ==
X-CSE-MsgGUID: C5m0HkX9TaKE23o6h3OHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119603843"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 10:11:31 -0800
Date: Thu, 6 Mar 2025 20:11:27 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 lucas.demarchi@intel.com, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/xe/pcode: stop logging mailbox status as error
Message-ID: <Z8nlT4bltXcqqc6s@black.fi.intel.com>
References: <20250304061727.452100-1-raag.jadav@intel.com>
 <29d173b4-4cac-4765-a13e-8723b44f5270@linux.intel.com>
 <Z8ljepyswfhWhl05@black.fi.intel.com>
 <816f679f-e981-4ee5-9c19-31b2881b11e4@linux.intel.com>
 <Z8l8haryZ2q2Cq0V@black.fi.intel.com> <Z8nJvdYSYfIafB37@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8nJvdYSYfIafB37@intel.com>
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

On Thu, Mar 06, 2025 at 11:13:49AM -0500, Rodrigo Vivi wrote:
> On Thu, Mar 06, 2025 at 12:44:21PM +0200, Raag Jadav wrote:
> > On Thu, Mar 06, 2025 at 03:17:16PM +0530, Aravind Iddamsetty wrote:
> > > On 06-03-2025 14:27, Raag Jadav wrote:
> > > > On Thu, Mar 06, 2025 at 10:08:07AM +0530, Aravind Iddamsetty wrote:
> > > >> Hi Raag,
> > > >>
> > > >> On 04-03-2025 11:47, Raag Jadav wrote:
> > > >>> Since we're expecting many platform specific mailbox commands that
> > > >>> might not be widely supported, stop logging them as errors. With this
> > > >>> we can avoid unnecessary platform checks and use the return value of
> > > >>> mailbox without enraging CI.
> > > >> are you saying there are cases where we send a command that is not supported
> > > >> on a particular platform?
> > > > Yes. First instance on [1], which will be expanded with more commands.
> > > >
> > > > [1] https://lore.kernel.org/r/20250210100515.2205584-1-raag.jadav@intel.com/
> > > 
> > > But why should we expose the interface which is not supported on that HW.
> > 
> > It allows checking unsupported functionality through return code without
> > making CI angry. So it's either this or we can limit each command (current
> > and future) with explicit platform checks and keep revisiting them everytime
> > we add a new platform or command for the foreseeable future, whichever makes
> > more sense.
> 
> I believe what other folks tried to raise here is:
> If the platform doesn't support it, please do not call it to start with.

I thought the point of error codes is to actually use them, but sure.
Platform checks it is.

Raag

> > > >>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > >>> ---
> > > >>>  drivers/gpu/drm/xe/xe_pcode.c | 2 +-
> > > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > > >>> index 9333ce776a6e..280f69119ff1 100644
> > > >>> --- a/drivers/gpu/drm/xe/xe_pcode.c
> > > >>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > > >>> @@ -46,7 +46,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
> > > >>>  
> > > >>>  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
> > > >>>  	if (err) {
> > > >>> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> > > >>> +		drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> > > >>>  			err_decode[err].str ?: "Unknown");
> > > >>>  		return err_decode[err].errno ?: -EPROTO;
> > > >>>  	}
