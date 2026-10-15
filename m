Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABEACC6B2F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 08:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546221121F8;
	Thu, 15 Oct 2026 08:43:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6726E10E848
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792053780; x=1823589780;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=ug/SBtofzOCNtwHzfQDr9rmDmqu2o+slsJSK0FwJYeY=;
 b=loOz6BsJ3e6vTfKENRvX5hyU0218vHBDrhiGc/5t02bhuyN2B3N0sjL2
 9eeWYqHZVANu9ZOkqeS7tR6UhrdoIaUUih6G6o9eyLBlXV4Qw5su5HJpt
 70o7bDDnd7KFQekGwxkcfCcxXrE2GdhsZz/Nj8bIuMzHM58evgK2E6nEO
 frefMLRpiorzA7mICCd9OLoXG8qLJNkaluBMmTIV+RaXvr2tUpHt81aOI
 vBrT4GadlY/7HOArcEKXFXlTHpSS5zT6aHBWhZrQQdzFL43JxW4aj7fDq
 8bd8FaK7TP8Z+nIwwPcQ0M5Rh/lXCpsoLWqaNscJdzBvZmjZe4/Y2Sg4U g==;
X-CSE-ConnectionGUID: Lh3yIDw7TiWrpNh26MSsSQ==
X-CSE-MsgGUID: Ng2ZaVPDT7i/lga15xy/gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="723301"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="723301"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 01:43:00 -0700
X-CSE-ConnectionGUID: ZDXZAxFDQiGWsuhBRLbIew==
X-CSE-MsgGUID: Lpj20XdSRmS7Pl/UsTfVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1892617"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.130])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 01:42:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Oct 2026 11:42:50 +0300 (EEST)
To: David Box <david.e.box@linux.intel.com>
cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, anoop.c.vijay@intel.com, 
 badal.nilawar@intel.com, matthew.d.roper@intel.com, james.ausmus@intel.com, 
 karthik.poosa@intel.com
Subject: Re: [PATCH v12 01/21] platform/x86/intel/pmt: complete pcidev to
 device update
In-Reply-To: <a2ce6kxrcpuk7qytfrl5hfhtxqi2w475qkmixlylffa6kx7lny@guqekbmhjyl6>
Message-ID: <7f79fa1e-ff18-2690-5086-7ebd6c83aafe@linux.intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
 <20261013214655.3502964-24-michael.j.ruhl@intel.com>
 <a2ce6kxrcpuk7qytfrl5hfhtxqi2w475qkmixlylffa6kx7lny@guqekbmhjyl6>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 14 Oct 2026, David Box wrote:

> On Tue, Oct 13, 2026 at 02:46:54PM -0700, Michael J. Ruhl wrote:
> > The update that moved struct pci_dev usage to struct device is
> > incomplete. Only telemetry endpoints are covered.
> > 
> > Other PMT features (crashlog) are now blocked from using the callback
> > mechanism.
> > 
> > Change struct intel_pmt_entry pci_dev member to device.
> > 
> > Update callback usage to use the intel_pmt_entry rather than the
> > telemetry endpoint.
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from pci_dev to device")
> > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> 
> Thanks for this change. Your fix is preferable to mine, so I'll drop
> "platform/x86/intel/pmt: Fix NULL dereference when reading crashlog
> data" from my crashlog uevent series.
>   
> If you do a v13, please make it clear in the commit message that this
> fixes a NULL pointer dereference when reading crashlog data, and add
> Cc: stable@vger.kernel.org since the regression is in v7.1. Otherwise,
> 
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>

Hi,

Thanks David for checking.

This commit is already in my tree and beyond enough merges that I'd prefer 
to not touch it at this point.

...I think there was plenty of time to comment before I took it. ;-)

I believe it's likely stable people will pick it due to Fixes tag and the 
change being simple enough. But if it for some reason doesn't end up 
being autoselected, one can always send it separately for stable inclusing 
after it has reached Linus' tree.

-- 
 i.

> > ---
> >  drivers/platform/x86/intel/pmt/class.c     | 5 ++---
> >  drivers/platform/x86/intel/pmt/class.h     | 3 +--
> >  drivers/platform/x86/intel/pmt/discovery.c | 2 +-
> >  3 files changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> > index d0ab8e33c62a..402d51df834a 100644
> > --- a/drivers/platform/x86/intel/pmt/class.c
> > +++ b/drivers/platform/x86/intel/pmt/class.c
> > @@ -100,7 +100,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
> >  	if (count > entry->size - off)
> >  		count = entry->size - off;
> >  
> > -	count = pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.guid, buf,
> > +	count = pmt_telem_read_mmio(entry->dev, entry->cb, entry->header.guid, buf,
> >  				    entry->base, off, count);
> >  
> >  	return count;
> > @@ -286,8 +286,6 @@ static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
> >  		return -EINVAL;
> >  	}
> >  
> > -	entry->pcidev = pci_dev;
> > -
> >  	return 0;
> >  }
> >  
> > @@ -365,6 +363,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> >  	entry->guid = header->guid;
> >  	entry->size = header->size;
> >  	entry->cb = ivdev->priv_data;
> > +	entry->dev = ivdev->dev;
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> > index a0ece4fc3837..258cb460e61c 100644
> > --- a/drivers/platform/x86/intel/pmt/class.h
> > +++ b/drivers/platform/x86/intel/pmt/class.h
> > @@ -20,7 +20,6 @@
> >  #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
> >  
> >  struct device;
> > -struct pci_dev;
> >  extern struct class intel_pmt_class;
> >  
> >  struct telem_endpoint {
> > @@ -42,7 +41,7 @@ struct intel_pmt_header {
> >  
> >  struct intel_pmt_entry {
> >  	struct telem_endpoint	*ep;
> > -	struct pci_dev		*pcidev;
> > +	struct device		*dev;
> >  	struct intel_pmt_header	header;
> >  	u32			disc_header[PMT_DISC_DWORDS];
> >  	struct bin_attribute	pmt_bin_attr;
> > diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
> > index c482368bfaae..f4203d240f54 100644
> > --- a/drivers/platform/x86/intel/pmt/discovery.c
> > +++ b/drivers/platform/x86/intel/pmt/discovery.c
> > @@ -609,7 +609,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *entry)
> >  
> >  	mutex_lock(&feature_list_lock);
> >  	list_for_each_entry(feature, &pmt_feature_list, list) {
> > -		if (feature->priv->parent != entry->ep->dev)
> > +		if (feature->priv->parent != entry->dev)
> >  			continue;
> >  
> >  		pmt_get_features(entry, feature);
> > -- 
> > 2.43.0
> > 
> 

-- 
 i.

