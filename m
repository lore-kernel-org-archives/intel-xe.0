Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C659C61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 09:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327B110E9A0;
	Tue, 25 Aug 2026 09:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMDRcV7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CE210E9A2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787650837; x=1819186837;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=MjVAwUpJloncCacwzAgNaqJzZMMQO3GSHdI0cZdJvbo=;
 b=GMDRcV7UJ8RjrD7Y81j6HK7sSL9l9PAVwvEFO4kGtPlcogGCgKx0E/0b
 uxoJiWENn2SSxzFH+gQ7uqBzmOFmb74mb7UtO+0bvlFnNe27bJhP5Rc1S
 Vl7HqDFVoEScAbnUmG8SoMg7aWHPxHIP0KL3NCKKWWbAReBDj0Tlzcelt
 in4MosATKAL44nQ2srvW04ePegDQJLSRORv/9Ygx4l9NGfffoTwcvRkPa
 FnRCA4x52BdvvE2oJzwZRtd/m7WFhmJbnoFIwEBaUQa9eSf3naP9cufoC
 WtQrE7e2RonaxU7mcIEP+3oLdGoNfmJ6s/psn84oAICMgcNAOizksQQAh A==;
X-CSE-ConnectionGUID: 6r1b+atNSoKESZ9pshdqcA==
X-CSE-MsgGUID: x5+UANkwT1i+KJAJrnANEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88130280"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88130280"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 02:40:36 -0700
X-CSE-ConnectionGUID: SSgD+Z8sTA6JkcCBWK/nXQ==
X-CSE-MsgGUID: jy1G40gLQMOa6KfG1+mvsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265465394"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 02:40:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Aug 2026 12:40:26 +0300 (EEST)
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, david.e.box@linux.intel.com
cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3 01/10] platform/x86/intel/pmt: complete pcidev to
 device update
In-Reply-To: <aoyT-PnfaSgo9Kp5@intel.com>
Message-ID: <de9020a6-6363-3c4e-164e-f0a1ceef4535@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-13-michael.j.ruhl@intel.com>
 <aoyT-PnfaSgo9Kp5@intel.com>
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

On Mon, 24 Aug 2026, Rodrigo Vivi wrote:

> On Mon, Aug 24, 2026 at 09:23:17AM -0700, Michael J. Ruhl wrote:
> > Previously the pcidev usage was moved to the struct device.
> > The struct device is set for only the telemetry endpoints.
> > 
> > This usage prevents other PMT features (crashlog) from using
> > the callback mechanism.
> > 
> > Use struct device in the intel_pmt_entry.
> > Update callback usage to os the pmt entry rather than the
> > telemetry endpoint.
> > 
> > Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from pci_dev to device")
> > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> 
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Dave, Hans, Ilpo, ack on getting this through the drm-xe-next tree?

Does David have anything in the horizon for the upcoming for-next cycle 
that could potentially conflict with this?

If not, then it would be fine for me to merge this through the drm-xe-next 
tree (the second patch needs some work though).

> Thanks,
> Rodrigo.
> 
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

