Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3152BC77B78
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 19:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CC910E053;
	Tue,  2 May 2023 19:58:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6375710E053
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 19:58:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDBC5601D7;
 Tue,  2 May 2023 19:58:49 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 7D4C1C433EF;
 Tue,  2 May 2023 19:58:47 +0000 (UTC)
Date: Tue, 2 May 2023 15:58:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ZFFrdfwZpTizsnCf@rdvivi-mobl4>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <871qkxyz7g.fsf@intel.com>
 <SA1PR11MB70389B5E7E0207B638A90228B3659@SA1PR11MB7038.namprd11.prod.outlook.com>
 <87y1m713aq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1m713aq.fsf@intel.com>
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE.
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 12:38:21PM +0300, Jani Nikula wrote:
> On Wed, 26 Apr 2023, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com> wrote:
> > Hi Jani,
> >
> > Is recommendation to create new .h file for error related registers ?
> > Can I go ahead with adding file xe_gt_error_regs.h (GT, SOC, GSC) which explicitly mentions registers related to error handling ?
> 
> I don't know what the best grouping for this stuff would be. Maybe I'd
> go for grouping by hardware blocks rather than functionality like
> errors. Cc: Lucas, Matt, Rodrigo, just to pick a few names who might
> have a better idea.

I believe the right way is to group by the IP block and/or reset domain,
rather than by functionality.

But Lucas is probably the best one to guide us here. He has some ideas
of tools to generate the regs we use from specs and the organization
might be impacted.

> 
> Just don't dump register macros to a single file that will bloat to
> become unmanageable.
> 
> BR,
> Jani.
> 
> 
> PS. Please also don't top-post on mailing lists.
> 
> 
> 
> >
> > BR
> > Himal Ghimiray
> >
> >
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: 06 April 2023 17:56
> >> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> >> xe@lists.freedesktop.org
> >> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> >> Subject: Re: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE.
> >> 
> >> On Thu, 06 Apr 2023, Himal Prasad Ghimiray
> >> <himal.prasad.ghimiray@intel.com> wrote:
> >> > These patches in series are for adding Reliability, Availability and
> >> > Serviceability support on xe.
> >> > Patches provide the infra for various hardware error counting and
> >> > logging. These error counters will be exposed to userspace in
> >> > subsequent patches.
> >> > In current patches:
> >> > 1) We are adding support to handle new interrupts bits.
> >> > 2) Counting of GT errors.
> >> > 3) Soc/SGunit error counting.
> >> > 4) CSC HW and FW error counting and sending uvent.
> >> >
> >> > Akeem G Abodunrin (1):
> >> >   drm/xe/ras: Add support for reporting CSC HW and FW errors.
> >> >
> >> > Aravind Iddamsetty (2):
> >> >   drm/xe/ras: Log the GT hw errors.
> >> >   drm/xe/ras: Count SOC and SGUNIT errors
> >> >
> >> > Himal Prasad Ghimiray (1):
> >> >   drm/xe: Handle GRF/IC ECC error irq
> >> >
> >> >  drivers/gpu/drm/xe/regs/xe_regs.h    | 244 ++++++++
> >> 
> >> Please don't recreate i915_reg.h in xe. Please add separate regs files like
> >> we've been doing in i915. It's pain to split a monster register file later.
> >> 
> >> BR,
> >> Jani.
> >> 
> >> 
> >> >  drivers/gpu/drm/xe/xe_device.c       |   6 +
> >> >  drivers/gpu/drm/xe/xe_device_types.h |   4 +
> >> >  drivers/gpu/drm/xe/xe_gt.c           |  30 +
> >> >  drivers/gpu/drm/xe/xe_gt_types.h     | 105 ++++
> >> >  drivers/gpu/drm/xe/xe_irq.c          | 824
> >> +++++++++++++++++++++++++++
> >> >  drivers/gpu/drm/xe/xe_pci.c          |   6 +
> >> >  7 files changed, 1219 insertions(+)
> >> 
> >> --
> >> Jani Nikula, Intel Open Source Graphics Center
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
