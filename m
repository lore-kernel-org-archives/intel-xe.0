Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95F4C77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 14:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EEB10E1F8;
	Mon, 15 May 2023 14:41:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6522D10E1FA
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 14:41:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C52F0617CB;
 Mon, 15 May 2023 14:41:51 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id CDE5EC433D2;
 Mon, 15 May 2023 14:41:49 +0000 (UTC)
Date: Mon, 15 May 2023 10:41:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZGJEmhlyTFNcdUoR@rdvivi-mobl4>
References: <20230512074335.1293293-1-jani.nikula@intel.com>
 <87jzx9itji.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzx9itji.fsf@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 05:00:17PM +0300, Jani Nikula wrote:
> 
> Lucas, Rodrigo, r-b on these two?

I feel the order in the series is the opposite, but anyway,
on the next clean up that will be fixed so, let's move with this

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thanks,
> Jani.
> 
> 
> On Fri, 12 May 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > The dependency on display/intel_display_reg_defs.h is removed by
> > upstream commit 6e4e9fbd5ba0 ("drm/i915/gt: drop dependency on
> > VLV_DISPLAY_BASE").
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 7ae5fa5a8ff7..af80d2fe739b 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -7,9 +7,7 @@
> >  #define __INTEL_GT_REGS__
> >  
> >  #include "i915_reg_defs.h"
> > -#ifdef I915
> >  #include "display/intel_display_reg_defs.h"	/* VLV_DISPLAY_BASE */
> > -#endif
> >  
> >  /*
> >   * The perf control registers are technically multicast registers, but the
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
