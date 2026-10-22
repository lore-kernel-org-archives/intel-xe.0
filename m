Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F6606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5ymFnrw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CB210E3B8;
	Thu, 22 Oct 2026 05:07:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7D610E3B8
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792645615; x=1824181615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sL5G3tsQ4p1M6Affs6+C+pd/ZuX8xgA0DkPs+T3IitQ=;
 b=L5ymFnrwOvq79tSdZk5uD1LY5naNVn9dAwAy/Rqee2q4xDl219cfCfJT
 XSs9VTP5hFlZOtsZe45dtuupxXu2RuVRRPNWWK0SZKUP1LAajIx5SKjxa
 1bKh/UPlWdb7lOE7UFIrbc4rZEq9cHNpO0sap4zUFh1vBkR2fjkG3DOuF
 Lwpo5E94YQGo7uzr3V1QmfCT2mqXfPaRDuPymfqTrHDX2PGPSN+bYRL6S
 p1+7afVwJqavD1Qq0Fvvw6VbOXdZcDtYOvt5yTfjxgN5fe3c12co01AzK
 h3Ozjaod7wfATWpX9E63/5LPM6y34kYuxMFnjwbVL4uTEW+Linv/KC7KL w==;
X-CSE-ConnectionGUID: c74qDCx0QK2/+tSfXfHvUA==
X-CSE-MsgGUID: 74ChyyMhQMuwq35b1jQwJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1283391"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1283391"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:06:55 -0700
X-CSE-ConnectionGUID: KSBAcESQRFiK4rO6KYfmXQ==
X-CSE-MsgGUID: nm4JJZA4SrKHG9ul7YsjDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="5118515"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:06:54 -0700
Date: Thu, 22 Oct 2026 07:06:50 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, mallesh.koujalagi@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH v13 7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
Message-ID: <atmZ6r0OxAhzATjF@black.igk.intel.com>
References: <20261020023641.200658-1-raag.jadav@intel.com>
 <20261020023641.200658-8-raag.jadav@intel.com>
 <c51e19af-aa41-491a-b1c9-07ba5ea17de6@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c51e19af-aa41-491a-b1c9-07ba5ea17de6@intel.com>
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

On Thu, Oct 22, 2026 at 10:09:47AM +0530, Tauro, Riana wrote:
> 
> On 20-10-2026 08:06, Raag Jadav wrote:
> > xe_device_declare_wedged() callers are expected to hold a runtime PM
> > reference. Fix it.
> > 
> > Fixes: a55b76b8bc2c ("drm/xe/i2c: Fix the interrupt handling")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v10: Guard wedge callers with runtime PM (Sashiko)
> > v11: Use traditional xe_pm_runtime_get/put() with goto (Sashiko)
> > ---
> >   drivers/gpu/drm/xe/xe_amc.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> > index b7390a4ee3ce..1f85df598e56 100644
> > --- a/drivers/gpu/drm/xe/xe_amc.c
> > +++ b/drivers/gpu/drm/xe/xe_amc.c
> > @@ -15,9 +15,11 @@
> >   #include "regs/xe_i2c_regs.h"
> >   #include "xe_amc.h"
> > +#include "xe_any.h"
> >   #include "xe_device.h"
> >   #include "xe_i2c.h"
> >   #include "xe_mmio.h"
> > +#include "xe_pm.h"
> >   /**
> >    * DOC: Add-In Management Controller (AMC)
> > @@ -108,11 +110,14 @@ static void xe_amc_work(struct work_struct *work)
> >   {
> >   	const struct amc_request *request = &amc_get_alert_reason;
> >   	struct xe_amc *amc = from_work(amc, work, work);
> > +	struct xe_device *xe = xe_any_to_xe(amc->i2c->drm_dev);
> >   	u8 alert_reason = AMC_ALERT_UNKNOWN;
> >   	struct amc_response response;
> >   	struct i2c_client *client;
> >   	int ret;
> > +	xe_pm_runtime_get(xe);
> 
> Even though Sashiko did complain about guard.
> Wouldn't usage of guard maintain consistency and be better here?

I don't know enough about guard to suspect the side effects (if any),
so just following the documentation.

include/linux/cleanup.h +148

 * Lastly, given that the benefit of cleanup helpers is removal of
 * "goto", and that the "goto" statement can jump between scopes, the
 * expectation is that usage of "goto" and cleanup helpers is never
 * mixed in the same function. I.e. for a given routine, convert all
 * resources that need a "goto" cleanup to scope-based cleanup, or
 * convert none of them.

> With or without guard
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Awesome.

Raag

> >   	client = amc->i2c->client[XE_I2C_CLIENT_AMC];
> >   	if (IS_ERR_OR_NULL(client))
> >   		goto out_reassert_interrupt;
> > @@ -167,6 +172,8 @@ static void xe_amc_work(struct work_struct *work)
> >   		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
> >   		break;
> >   	}
> > +
> > +	xe_pm_runtime_put(xe);
> >   }
> >   void xe_amc_handle_alert(struct xe_i2c *i2c)
