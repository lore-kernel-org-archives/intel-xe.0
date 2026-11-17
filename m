Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740C6606A33E
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qv1aPZE8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC0110F280;
	Tue, 17 Nov 2026 08:51:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4DE10F280
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794905461; x=1826441461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mYQzUc13HeGBB+W+GEthoTDnA/KkWUL/PdZ8cO8JGQg=;
 b=Qv1aPZE83tLayxMZd/9oIYpR6Gz561AkTCV6OQB26cRkLYEHHgeeE05U
 c+29LwdJ8rmaK08f3i7l+nn2pP0F6lZVhppXzAIlM16t3N6Nc6W76a2Cm
 Z+6PwmDUs7yCpfVDWi5G+4IfHzeanUD6jyOeL9Q0Bd1AaA0mcU65IwdpQ
 hOFo7pzqCNb3oFRVxkUUgf2dsz7QAu40Tf0nBUvCAI+gw2tNtD2t++F6M
 ghJUBSqNvk77X9u/QriMv/KraxgRWyx6eQnrqan7ZQQb/ZIWBlSuPBRZT
 nNbg9tBJthWDlNAUKKELWyy5UmbcBtDhenkt8bqB6Ne6F4GSwVL+t0saf Q==;
X-CSE-ConnectionGUID: ExB/VzDbQ4OYjW3qzRLkmg==
X-CSE-MsgGUID: 8bTOtn/XQ/+7tci778LYVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3558973"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3558973"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:51:01 -0800
X-CSE-ConnectionGUID: POIitPwaSKef4j7tyN+cuw==
X-CSE-MsgGUID: MM7KAokGRBSbszoEkJKz5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9791295"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:51:00 -0800
Date: Tue, 17 Nov 2026 09:50:57 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Tauro, Riana" <riana.tauro@intel.com>, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v1] drm/xe/drm_ras: Protect against unplugged or wedged
 device
Message-ID: <avwVcXpCWxo2xMgF@black.igk.intel.com>
References: <20261116085343.1972825-1-raag.jadav@intel.com>
 <85d0eb950789c3d413fb91dc02b9c53751207c57.camel@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85d0eb950789c3d413fb91dc02b9c53751207c57.camel@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 04:58:23AM +0530, Summers, Stuart wrote:
> On Mon, 2026-11-16 at 14:23 +0530, Raag Jadav wrote:
> > Xe driver exposes drm_ras counters to userspace through netlink
> > interface,
> > which the user can access during the device lifetime. But this should
> > not
> > be done in case of unplugged or wedged device. Protect against such
> > cases.
> > 
> > Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Hm.. I'm not fully convinced on the sashiko issue, particularly after
> we have the get/put in this patch. I think we'll need some digging
> there to see if that's really still a problem after this one gets
> merged. Anyway as it called out, it's pre-existing.
> 
> I agree with the changes here. Functionally looks correct and makes
> sense to include the wedge here too.
> 
> Should we have a test that injects an error after wedge with a netlink
> hook enabled just to prove this works in CI?

+ Ravi and Riana for IGT, this sounds like good extension to our suite[1].

[1] https://patchwork.freedesktop.org/series/171275/

> Either way, for the kernel change:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Awesome.

Raag

> > ---
> >  drivers/gpu/drm/xe/xe_drm_ras.c | 93 ++++++++++++++++++++++++-------
> > --
> >  1 file changed, 69 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c
> > b/drivers/gpu/drm/xe/xe_drm_ras.c
> > index 7554803aae11..c0c1acb84e89 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/bitmap.h>
> >  
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_ras.h>
> > @@ -12,10 +13,33 @@
> >  #include "xe_device_types.h"
> >  #include "xe_drm_ras.h"
> >  #include "xe_ras.h"
> > +#include "xe_wedge.h"
> >  
> >  static const char * const error_components[] =
> > DRM_XE_RAS_ERROR_COMPONENT_NAMES;
> >  static const char * const error_severity[] =
> > DRM_XE_RAS_ERROR_SEVERITY_NAMES;
> >  
> > +static int drm_ras_counter_get(struct xe_device *xe, struct
> > xe_drm_ras_counter *info,
> > +                              u32 error_id, int *idx)
> > +{
> > +       if (xe_wedged(xe))
> > +               return -ECANCELED;
> > +
> > +       if (!info || !info[error_id].name)
> > +               return -ENOENT;
> > +
> > +       /* Must be last */
> > +       if (!drm_dev_enter(&xe->drm, idx))
> > +               return -ENODEV;
> > +
> > +       return 0;
> > +}
> > +
> > +static void drm_ras_counter_put(int idx)
> > +{
> > +       /* Pair with drm_ras_counter_get() */
> > +       drm_dev_exit(idx);
> > +}
> > +
> >  static bool drm_ras_counter_is_valid(u32 severity, u32 component)
> >  {
> >         if (!in_range(severity, DRM_XE_RAS_ERR_SEV_CORRECTABLE,
> > DRM_XE_RAS_ERR_SEV_MAX))
> > @@ -33,19 +57,23 @@ static int query_error_counter(struct xe_device
> > *xe,
> >  {
> >         struct xe_drm_ras *ras = &xe->ras.nl_data;
> >         struct xe_drm_ras_counter *info = ras->info[severity];
> > +       int idx, ret;
> >  
> > -       if (!info || !info[error_id].name)
> > -               return -ENOENT;
> > -
> > -       *name = info[error_id].name;
> > +       ret = drm_ras_counter_get(xe, info, error_id, &idx);
> > +       if (ret)
> > +               return ret;
> >  
> >         /* Fetch counter from system controller if supported */
> >         if (xe->info.has_sysctrl)
> > -               return xe_ras_get_counter(xe, severity, error_id,
> > val);
> > +               ret = xe_ras_get_counter(xe, severity, error_id,
> > val);
> > +       else
> > +               *val = atomic_read(&info[error_id].counter);
> >  
> > -       *val = atomic_read(&info[error_id].counter);
> > +       if (!ret)
> > +               *name = info[error_id].name;
> >  
> > -       return 0;
> > +       drm_ras_counter_put(idx);
> > +       return ret;
> >  }
> >  
> >  static int clear_error_counter(struct xe_device *xe,
> > @@ -54,17 +82,20 @@ static int clear_error_counter(struct xe_device
> > *xe,
> >  {
> >         struct xe_drm_ras *ras = &xe->ras.nl_data;
> >         struct xe_drm_ras_counter *info = ras->info[severity];
> > +       int idx, ret;
> >  
> > -       if (!info || !info[error_id].name)
> > -               return -ENOENT;
> > +       ret = drm_ras_counter_get(xe, info, error_id, &idx);
> > +       if (ret)
> > +               return ret;
> >  
> >         /* Clear counter from system controller if supported */
> >         if (xe->info.has_sysctrl)
> > -               return xe_ras_clear_counter(xe, severity, error_id);
> > +               ret = xe_ras_clear_counter(xe, severity, error_id);
> > +       else
> > +               atomic_set(&info[error_id].counter, 0);
> >  
> > -       atomic_set(&info[error_id].counter, 0);
> > -
> > -       return 0;
> > +       drm_ras_counter_put(idx);
> > +       return ret;
> >  }
> >  
> >  static int query_uncorrectable_error_counter(struct drm_ras_node
> > *ep, u32 error_id,
> > @@ -103,15 +134,21 @@ static int
> > query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
> >         struct xe_device *xe = ep->priv;
> >         struct xe_drm_ras *ras = &xe->ras.nl_data;
> >         struct xe_drm_ras_counter *info = ras-
> > >info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
> > -
> > -       if (!info || !info[error_id].name)
> > -               return -ENOENT;
> > +       int idx, ret;
> >  
> >         if (!xe->info.has_sysctrl)
> >                 return -EOPNOTSUPP;
> >  
> > -       *name = info[error_id].name;
> > -       return xe_ras_get_threshold(xe,
> > DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
> > +       ret = drm_ras_counter_get(xe, info, error_id, &idx);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = xe_ras_get_threshold(xe,
> > DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
> > +       if (!ret)
> > +               *name = info[error_id].name;
> > +
> > +       drm_ras_counter_put(idx);
> > +       return ret;
> >  }
> >  
> >  static int set_correctable_error_threshold(struct drm_ras_node *ep,
> > u32 error_id, u32 threshold)
> > @@ -119,14 +156,19 @@ static int
> > set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id
> >         struct xe_device *xe = ep->priv;
> >         struct xe_drm_ras *ras = &xe->ras.nl_data;
> >         struct xe_drm_ras_counter *info = ras-
> > >info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
> > -
> > -       if (!info || !info[error_id].name)
> > -               return -ENOENT;
> > +       int idx, ret;
> >  
> >         if (!xe->info.has_sysctrl)
> >                 return -EOPNOTSUPP;
> >  
> > -       return xe_ras_set_threshold(xe,
> > DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
> > +       ret = drm_ras_counter_get(xe, info, error_id, &idx);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = xe_ras_set_threshold(xe,
> > DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
> > +
> > +       drm_ras_counter_put(idx);
> > +       return ret;
> >  }
> >  
> >  static struct xe_drm_ras_counter *allocate_and_copy_counters(struct
> > xe_device *xe)
> > @@ -244,7 +286,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32
> > component, u32 severity, u32 val
> >         struct xe_drm_ras *ras = &xe->ras.nl_data;
> >         struct xe_drm_ras_counter *info;
> >         struct drm_ras_node *node;
> > -       int ret;
> > +       int idx, ret;
> >  
> >         /* Event is supported only if drm-ras is enabled */
> >         if (!xe->info.has_drm_ras)
> > @@ -256,13 +298,16 @@ void xe_drm_ras_event(struct xe_device *xe, u32
> > component, u32 severity, u32 val
> >         node = &ras->node[severity];
> >         info = ras->info[severity];
> >  
> > -       if (!info || !info[component].name)
> > +       ret = drm_ras_counter_get(xe, info, component, &idx);
> > +       if (ret)
> >                 return;
> >  
> >         ret = drm_ras_nl_error_event(node, component,
> > info[component].name, value);
> >         if (ret)
> >                 drm_err_ratelimited(&xe->drm, "drm-ras error-event
> > failed: %d for %s %s\n", ret,
> >                                     info[component].name,
> > error_severity[severity]);
> > +
> > +       drm_ras_counter_put(idx);
> >  }
> >  
> >  /**
> 
