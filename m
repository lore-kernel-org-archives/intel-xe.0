Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB0FCA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 05:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E24210E073;
	Tue, 13 Oct 2026 05:22:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDA810E073
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 05:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791868959; x=1823404959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wIZk1SmTGd7JKNa15ElM7TOU/o4RvSogFI1RHPmejeg=;
 b=P1NtfIT7C605O/4ke8bur7qyX9ihka51jtCY0U4Hzew0s8AD045GQptx
 szwrlWAZQSNSZm1M+lcwNXgZDdtEQteeCll/ioVPWnZEf0okOh2IOGspl
 vI9m6AvWxcJZf9CcGY9c/A82FBjPRIS6F0q0GPNw4MhdtFeDL7RsRl7pB
 j7p2aHVLRyx+OjoN3IYMY0WG5xs4Ccs7yeH0ZKJfFtqFfUPEk39vQuj5b
 kNAQ7djL2hWgZRNCAhnR4AyjJm6GcI8iHphD4f0j66k+DpD5Dk+APLrT+
 1bM2XA+azxLMvFpSl3CJpucDhjNJumAN3/GeXl5WKJQyZoZEBl8kJGvCU w==;
X-CSE-ConnectionGUID: 0N7qiBZ7Rsmpwa0rB2hnJQ==
X-CSE-MsgGUID: G8zSZqLrTlKLxECXp92a4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="589835"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="589835"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 22:22:39 -0700
X-CSE-ConnectionGUID: dTG42+ChSMGsKGAjxozOmg==
X-CSE-MsgGUID: XtI4K9LrReaov1v1wbyCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1186172"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 22:22:38 -0700
Date: Tue, 13 Oct 2026 07:22:35 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe/cri: Implement workaround Wa_15020021844
Message-ID: <as3AGwcjolGc0hcf@black.igk.intel.com>
References: <20261012233035.1277288-2-matthew.d.roper@intel.com>
 <ad1c34ce-7481-4ba9-9cb7-662caed35528@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad1c34ce-7481-4ba9-9cb7-662caed35528@intel.com>
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

On Tue, Oct 13, 2026 at 10:19:29AM +0530, Tauro, Riana wrote:
> On 13-10-2026 05:00, Matt Roper wrote:
> > On Crescent Island platforms, the pcode is signaling "ready" to the
> > driver prematurely since one last sysctrl firmware initialization step
> > is still underway and not fully complete.  Since the driver's
> > initialization is racing with the end of the firmware's init, this can
> > lead to error messages like:
> > 
> >     xe 0000:be:00.0: [drm] *ERROR* sysctrl: Firmware error: 0x06
> >     xe 0000:be:00.0: [drm] *ERROR* sysctrl: Mailbox command failed: -EIO
> 
> i see boot survivability having failure codes for sysctrl. Shouldn't pcode
> ready be indicated
> only after the firmware is ready?

+1. This loosk like we have no indication of firmware being ready and we'll
still end up with same failure in case sysctrl decides to have a bad day.

Raag

> > The current recommenedation to work around this is for the driver to
> > wait an additional 0.5 seconds after getting the "ready" response,
> > before moving on with other initialization tasks.
> > 
> > Note that the official definition of this workaround is still being
> > finalized, so "Wa_15020021844" is a bit of a placeholder/guess.  It's
> > possible that the actual number could still change, although the request
> > to wait the additional half second is pretty well set at this point.
> > 
> > Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
> >   drivers/gpu/drm/xe/xe_pcode.c             | 5 +++++
> >   2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > index d8dc41851425c..0488a20461d81 100644
> > --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > @@ -7,3 +7,4 @@
> >   14026633728	PLATFORM(CRESCENTISLAND)
> >   14026746987	PLATFORM(CRESCENTISLAND)
> >   14026779378	PLATFORM(CRESCENTISLAND)
> > +15020021844	PLATFORM(CRESCENTISLAND)
> > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > index 266deecbb100a..897d44ecae42b 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > @@ -11,6 +11,7 @@
> >   #include <drm/drm_managed.h>
> > +#include "generated/xe_device_wa_oob.h"
> >   #include "regs/xe_pmt.h"
> >   #include "xe_assert.h"
> >   #include "xe_device.h"
> > @@ -20,6 +21,7 @@
> >   #include "xe_pm.h"
> >   #include "xe_printk.h"
> >   #include "xe_vsec.h"
> > +#include "xe_wa.h"
> >   /**
> >    * DOC: PCODE
> > @@ -320,6 +322,9 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
> >   		xe_log_err(tile, PCODE, ret, "initialization timedout after %ld seconds\n",
> >   			   timeout_us / USEC_PER_SEC);
> > +	if (!ret && XE_DEVICE_WA(xe, 15020021844))
> > +		msleep(500);
> > +
> >   	return ret;
> >   }
