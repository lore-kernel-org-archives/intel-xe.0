Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE142D6C287
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 19:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9375210E6A9;
	Tue, 19 Nov 2024 19:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/zVUwx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB7110E69B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 19:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732044082; x=1763580082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TLKkLjlvsKz2dxIYfXtK+yaPWOrdbZyeGWY58IbOjCk=;
 b=L/zVUwx1bnmSB/o9xKj2YYnlUMuygQE3/AuBtcLpHL+sfTJRsZbUTfOU
 f/fbKees/KlONt5VGWMkmS4wbHZUAOgSZlHmmF2PD3+01aSc1vE5fDK4+
 55UQwz7H/LPPSBUAjD9hQoxmDFpSXN8htLwola9PlR9897MhahgSggquc
 KbZOMhkplEHG9PTbjgh+jVF+QALIQvQhxxYMfkPVJVuQ7pblUxrquQQT0
 R6jb3VWizkVh52A7XarS58bDP0U5M8M2THvCagzwhntHx7nAOW9/aZjTw
 uy3ibxsqZEXbz2UmlrXa6DhYfZdp3Pn/1WTHL1gKBIYfVsugP9OgtXArV w==;
X-CSE-ConnectionGUID: mcMws6EFQSCYFKUNMeYStQ==
X-CSE-MsgGUID: zptebyX6RkWwRryZUBrFzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32316679"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32316679"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 11:21:21 -0800
X-CSE-ConnectionGUID: ePm9aaAKS5edTg4OgHROGQ==
X-CSE-MsgGUID: krs9HDhtQAOaJ5Azsk7Q3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90077673"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 11:21:20 -0800
Date: Tue, 19 Nov 2024 21:21:17 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Introduce force-wake guard class
Message-ID: <ZzzlLQAh9yqAl3q8@black.fi.intel.com>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-2-michal.wajdeczko@intel.com>
 <ZzzdQGnrSSD7jKs_@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzzdQGnrSSD7jKs_@intel.com>
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

On Tue, Nov 19, 2024 at 01:47:28PM -0500, Rodrigo Vivi wrote:
> On Mon, Nov 18, 2024 at 07:45:10PM +0100, Michal Wajdeczko wrote:
> > There is support for 'classes' with constructor and destructor
> > semantics that can be used for any scope-based resource management,
> > like our domain force-wake management.
> 
> There is, okay...
> It can be, okay...
> 
> But why do we want?
> What are the advantages?

Makes error cases easier to handle + less code.
We significantly cleaned up intel pinctrl and gpio drivers a few months ago
and almost halved the footprint in some cases.

Raag

> > 
> > Define xe_fw class that can be used for force-wake management.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> > v2: aligned to new force-wake usage model (Michal)
> > ---
> >  drivers/gpu/drm/xe/xe_force_wake.h       | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_force_wake_types.h | 10 ++++++++++
> >  2 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> > index 0e3e84bfa51c..e46e44f7eb70 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake.h
> > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _XE_FORCE_WAKE_H_
> >  #define _XE_FORCE_WAKE_H_
> >  
> > +#include <linux/cleanup.h>
> > +
> >  #include "xe_assert.h"
> >  #include "xe_force_wake_types.h"
> >  
> > @@ -61,4 +63,14 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
> >  	return fw_ref & domain;
> >  }
> >  
> > +DEFINE_CLASS(xe_fw, struct xe_force_wake_guard,
> > +	     xe_force_wake_put(_T.fw, _T.ref),
> > +	     ({ (struct xe_force_wake_guard){ fw, xe_force_wake_get(fw, domains) }; }),
> > +	     struct xe_force_wake *fw, enum xe_force_wake_domains domains);
> > +
> > +static inline void *class_xe_fw_lock_ptr(class_xe_fw_t *_T)
> > +{
> > +	return _T->ref ? _T : NULL;
> > +}
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> > index 899fbbcb3ea9..15456a24f707 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> > +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> > @@ -85,4 +85,14 @@ struct xe_force_wake {
> >  	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
> >  };
> >  
> > +/**
> > + * struct xe_force_wake_guard - Xe force wake guard
> > + */
> > +struct xe_force_wake_guard {
> > +	/** @fw: force wake manager */
> > +	struct xe_force_wake *fw;
> > +	/** @ref: opaque reference to woken domains */
> > +	unsigned int ref;
> > +};
> > +
> >  #endif
> > -- 
> > 2.43.0
> > 
