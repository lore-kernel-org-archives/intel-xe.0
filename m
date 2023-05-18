Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE516C77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B89D89C05;
	Thu, 18 May 2023 17:30:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D538D89C05
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:30:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 562B6601D7;
 Thu, 18 May 2023 17:30:00 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 87F29C433D2;
 Thu, 18 May 2023 17:29:58 +0000 (UTC)
Date: Thu, 18 May 2023 13:29:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZGZglDwYYDI3l00O@rdvivi-mobl4>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-7-matthew.d.roper@intel.com>
 <noyd26jaax2bwnnd3fdylbdfab7525tajig2ruk5q7as2kjqzi@b7fgp5qs2h35>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <noyd26jaax2bwnnd3fdylbdfab7525tajig2ruk5q7as2kjqzi@b7fgp5qs2h35>
Subject: Re: [Intel-xe] [PATCH 06/26] drm/xe: Move VRAM from GT to tile
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 03:40:16PM -0700, Lucas De Marchi wrote:
> On Wed, May 10, 2023 at 08:47:02PM -0700, Matt Roper wrote:
> > On platforms with VRAM, the VRAM is associated with the tile, not the
> > GT.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/Makefile                   |  1 +
> > drivers/gpu/drm/xe/display/xe_fb_pin.c        |  6 +-
> > drivers/gpu/drm/xe/display/xe_plane_initial.c |  8 +-
> 
> I'm not sure the best way to handle the display. On my refactors I've
> been leaving them on a separate patch, even if it breaks the build. The
> reason is that when the rebase happens and display is moved up, we don't
> risk losing the these hunks.

yes, please, display in separated patch would be awesome!

> 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 2481b2045284..6b9e7847161c 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -53,6 +53,8 @@
> > 		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
> > 		 struct xe_tile *: (tile__)->xe)
> > 
> > +struct xe_ggtt;
> > +
> > /**
> >  * struct xe_tile - hardware tile structure
> >  *
> > @@ -96,6 +98,40 @@ struct xe_tile {
> > 		/** @regs: pointer to tile's MMIO space (starting with registers) */
> > 		void *regs;
> > 	} mmio;
> > +
> > +	/** @mem: memory management info for tile */
> > +	struct {
> > +		/**
> > +		 * @vram: VRAM info for tile.
> > +		 *
> > +		 * Although VRAM is associated with a specific tile, it can
> > +		 * still be accessed by all tiles' GTs.
> > +		 */
> > +		struct {
> > +			/** @io_start: IO start address of this VRAM instance */
> > +			resource_size_t io_start;
> > +			/**
> > +			 * @io_size: IO size of this VRAM instance
> > +			 *
> > +			 * This represents how much of this VRAM we can access
> > +			 * via the CPU through the VRAM BAR. This can be smaller
> > +			 * than @size, in which case only part of VRAM is CPU
> > +			 * accessible (typically the first 256M). This
> > +			 * configuration is known as small-bar.
> > +			 */
> > +			resource_size_t io_size;
> > +			/** @size: size of VRAM. */
> > +			resource_size_t size;
> > +			/** @mapping: pointer to VRAM mappable space */
> > +			void *__iomem mapping;
> > +		} vram;
> > +
> > +		/** @vram_mgr: VRAM TTM manager */
> > +		struct xe_ttm_vram_mgr *vram_mgr;
> > +
> > +		/** @ggtt: Global graphics translation table */
> > +		struct xe_ggtt *ggtt;
> 
> I guess the ggtt should be moved on a separate patch?
> 
> other than that it seems good to me, but since it has a lot of
> mechanical changes, but not CI, hard to judge for correctness.
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> 
> Lucas De Marchi
