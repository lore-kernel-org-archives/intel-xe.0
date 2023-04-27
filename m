Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06F2C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 03:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8951610E0B9;
	Thu, 27 Apr 2023 03:40:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C1510E0B9
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 03:40:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6C0E63982;
 Thu, 27 Apr 2023 03:39:58 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id AEEDFC433D2;
 Thu, 27 Apr 2023 03:39:56 +0000 (UTC)
Date: Wed, 26 Apr 2023 23:39:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZEnudoKAkZpP1nwN@rdvivi-mobl4>
References: <20230415040906.13230-1-jose.souza@intel.com>
 <20230415040906.13230-2-jose.souza@intel.com>
 <20230424225947.GH10045@mdroper-desk1.amr.corp.intel.com>
 <f3bdffa9fd9fb2c780af10b8354b60b955a776ff.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3bdffa9fd9fb2c780af10b8354b60b955a776ff.camel@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Set default MOCS value for copy
 cs instructions
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 05:58:54PM +0000, Souza, Jose wrote:
> On Mon, 2023-04-24 at 15:59 -0700, Matt Roper wrote:
> > On Fri, Apr 14, 2023 at 09:09:06PM -0700, José Roberto de Souza wrote:
> > > copy cs instructions that dont have a explict MOCS field will use this
> > > default MOCS value.
> > > 
> > > This was mainly copied from i915 source code.
> > > 
> > > BSpec: 45807
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  9 +++++++++
> > >  drivers/gpu/drm/xe/xe_wa.c               | 13 +++++++++++++
> > >  2 files changed, 22 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index cc874348f76bc..dbc4b9f15b4e8 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -105,6 +105,15 @@
> > >  		(REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, (write) << 1) | \
> > >  		 REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, (read) << 1))
> > >  
> > > +#define BLIT_CCTL(base)				_MMIO((base) + 0x204)
> > > +#define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 8)
> > > +#define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 0)
> > > +#define   BLIT_CCTL_MASK (BLIT_CCTL_DST_MOCS_MASK | \
> > > +			  BLIT_CCTL_SRC_MOCS_MASK)
> > > +#define   BLIT_CCTL_MOCS(dst, src)				       \
> > > +		(REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, (dst) << 1) | \
> > > +		 REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, (src) << 1))
> > 
> > Same general comments from last patch about file position, mask
> > definition, and potentially dropping last two macros apply to this patch
> > as well.
> > 
> > > +
> > >  #define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
> > >  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index 5ef3561101466..0c12700bedde5 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -660,6 +660,19 @@ xe_wa_process_runtime_was_engine(struct xe_reg_sr *sr,
> > >  					   CMD_CCTL_MOCS_OVERRIDE(mocs_w, mocs_r),
> > >  					   XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE))),
> > >  		},
> > > +		/*
> > > +		 * Some blitter commands do not have a field for MOCS, those
> > > +		 * commands will use MOCS index pointed by BLIT_CCTL.
> > > +		 * BLIT_CCTL registers are needed to be programmed to un-cached.
> > > +		 */
> > > +		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
> > > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> > > +			       ENGINE_CLASS(COPY)),
> > > +		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
> > > +				 BLIT_CCTL_MASK,
> > > +				 BLIT_CCTL_MOCS(mocs_w, mocs_r),
> > > +				 XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE)))
> > 
> > Even though BLIT_CCTL looks a lot like CMD_CCTL on the surface, there
> > are some important differences between the two that need to be noted
> > here:
> > 
> >  - BLIT_CCTL is not a masked register.
> >  - BLIT_CCTL is part of an engine context (e.g., bspec 45585), so it
> >    would need to eventually wind up on an LRC list, not a HWE list.
> > 
> > The inconsistency in hardware design here is frustrating...
> > 
> > Also note that BLIT_CCTL is directly writable by userspace (bspec 45546)
> > so I question whether it's even our responsibility to do this in Xe.
> > It's too late to fix i915 now (at least for current platforms), but I'd
> > suggest just dropping this second patch for Xe and leaving it to
> > userspace to program whatever value they wish for their own context.

one might argue that the MOCS was created exactly to be an implicit
API with kernel always responsible for programming. But I see your point...

> 
> Cc: Rodrigo
> 
> Okay will send the first patch with comments addressed.
> 
> Then if decided to not program this in KMD it needs to be documented publicly.

Yeap, I fully agree.

> Together with all other small behavior changes from i915, MI_BATCH_BUFFER_START is other case where behavior changed.

What's the behavior difference in this case?

Could you please file a gitlab issue for this documentation of the differences
and include the details you already know? So I will add this to the doc when
I get some time to start organizing the docs.

Thanks,
Rodrigo.

> 
> This will save a lot of debug time in the other UMDs.
> 
> > 
> > 
> > Matt
> > 
> > > +		},
> > >  		{}
> > >  	};
> > >  
> > > -- 
> > > 2.40.0
> > > 
> > 
> 
