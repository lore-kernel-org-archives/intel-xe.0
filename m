Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3AAC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF3E10E199;
	Thu,  6 Feb 2025 10:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjZ1Z1Je";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD69110E199
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738838914; x=1770374914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kGPMShy00ChPrYY9dyCYWa+i/cEYhlq+4824iwNNeOE=;
 b=HjZ1Z1JeldX2QVZLJFk4UXSf22vKrkWN1ZNUHahL0gCAkYeWs7IzQiT0
 cnKpnOPRO7PxuOPPhT3+1kPjXj7WOFCfc7TpWCBDkTFg2gRbbpNFExmri
 J2axYBm8GTh6KoOQ6UOWwo2+5wjoOiaN9WvsZiQBNp4vnf5c1Fke29Yba
 UQn7PzYzMzXggnz+rDP7nCKytSvQmyfv/GBkhPSvm4gRkFGyJW9A2wOGw
 MXxk5JLnWxBQlO45mbzpnvYaNej3wtWMxXOZxnlMUElAgqBjad/8GakY/
 WOAODyEg3aIU8OVsjfQkd3yyIkr9nE2zSHvK7AnMPbPYzYkSLXauXDTsw A==;
X-CSE-ConnectionGUID: NIuP/hSIQmivSxdGNL372w==
X-CSE-MsgGUID: 9P7wqO0pQli13Q9sJAoe3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27037386"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="27037386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:48:33 -0800
X-CSE-ConnectionGUID: 5jIRKvQrTFiyyu8jtHJMzg==
X-CSE-MsgGUID: rbqxyzZ9Qxev8BsyK1wQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111705152"
Received: from carterle-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.42])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:48:29 -0800
Date: Thu, 6 Feb 2025 11:48:25 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z6STeSgcFc1DszT9@ashyti-mobl2.lan>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <Z5zRn9tijHkPxrhy@ashyti-mobl2.lan>
 <Z6Ok7v0cubcdf2t3@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Ok7v0cubcdf2t3@black.fi.intel.com>
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

On Wed, Feb 05, 2025 at 07:50:38PM +0200, Raag Jadav wrote:
> On Fri, Jan 31, 2025 at 02:35:27PM +0100, Andi Shyti wrote:
> > Hi Raag,
> > 
> > ...
> > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > index 519dd1067a19..f5e5234857c1 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > @@ -34,6 +34,9 @@
> > >  
> > >  #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> > >  
> > > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > > +#define   TEMP_MASK				REG_GENMASK(7, 0)
> > 
> > is it called TEMP also in the docs? It can somehow be confused
> > with "temporary".
> 
> Doc just calls it DATA, but I went with GENMASK() macro convention here.
> And since it'll be used by temperature functions, the room for confusion is
> less likely.
> 
> > In any case:
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> I don't believe we allow duplicate tags (context: it's already in the patch),
> but at some point we might want to allow it for (re-)assurance :D
> 
> Thank you (x2).

ahaha... I was back from a sick leave and I missed it :-)

Andi
