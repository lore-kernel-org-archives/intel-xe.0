Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63582C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 19:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0235D10E664;
	Fri,  5 May 2023 19:47:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2F10E664
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 19:47:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 594D960F93;
 Fri,  5 May 2023 19:47:26 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 9D827C433D2;
 Fri,  5 May 2023 19:47:23 +0000 (UTC)
Date: Fri, 5 May 2023 15:47:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFVdSRPh8O4bDB1j@rdvivi-mobl4>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-6-lucas.demarchi@intel.com>
 <ZFU19MkYZWI+ttvK@rdvivi-mobl4>
 <w2qlrfen5zqwvcj4foqvf4b3ac53lqkcwyxvuynxpl77p6qnf3@b7cl4scp6ieu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w2qlrfen5zqwvcj4foqvf4b3ac53lqkcwyxvuynxpl77p6qnf3@b7cl4scp6ieu>
Subject: Re: [Intel-xe] [PATCH 5/7] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 12:29:42PM -0700, Lucas De Marchi wrote:
> On Fri, May 05, 2023 at 12:59:32PM -0400, Rodrigo Vivi wrote:
> > On Fri, Apr 28, 2023 at 11:23:30PM -0700, Lucas De Marchi wrote:
> > > With the move of display above xe_reg conversion in xe_mmio,
> > > it should use the new types everywhere.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > and this is the one that will likely conflict with the series from Jani
> > right?
> > 
> > I will try to merge his series today, then on your rebase you change
> > both this and the previous at once.
> 
> not sure I understand. Aren't we going to move display up anymore?

oh! indeed... I had promised to take a look this week on that...
where did the week go?! :)

> 
> If I squash this patch on the previous one, it will create a conflict
> when we move display up again, so I'd rather keep this separate as a
> fixup commit to be squashed in the initial display commit.

ack

> 
> Lucas De Marchi
> 
> > 
> > anyway, on the approach:
> > 
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > 
> > > ---
> > >  drivers/gpu/drm/xe/display/xe_de.h | 89 +++++++++++++++++++-----------
> > >  1 file changed, 57 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
> > > index 0c76b0d24d96..e6021f6d031d 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_de.h
> > > +++ b/drivers/gpu/drm/xe/display/xe_de.h
> > > @@ -14,79 +14,95 @@
> > >  #include "i915_reg.h"
> > > 
> > >  static inline u32
> > > -intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
> > > +intel_de_read(struct drm_i915_private *i915, i915_reg_t i915_reg)
> > >  {
> > > -	return xe_mmio_read32(to_gt(i915), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_read32(to_gt(i915), reg);
> > >  }
> > > 
> > >  static inline u64
> > >  intel_de_read64_2x32(struct drm_i915_private *i915,
> > > -		     i915_reg_t lower_reg, i915_reg_t upper_reg)
> > > +		     i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
> > >  {
> > > +	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
> > > +	struct xe_reg upper_reg = XE_REG(i915_mmio_reg_offset(i915_upper_reg));
> > >  	u32 upper, lower;
> > > 
> > > -	lower = xe_mmio_read32(to_gt(i915), lower_reg.reg);
> > > -	upper = xe_mmio_read32(to_gt(i915), upper_reg.reg);
> > > +	lower = xe_mmio_read32(to_gt(i915), lower_reg);
> > > +	upper = xe_mmio_read32(to_gt(i915), upper_reg);
> > >  	return (u64)upper << 32 | lower;
> > >  }
> > > 
> > >  static inline void
> > > -intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
> > > +intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t i915_reg)
> > >  {
> > > -	xe_mmio_read32(to_gt(i915), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	xe_mmio_read32(to_gt(i915), reg);
> > >  }
> > > 
> > >  static inline void
> > > -intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
> > > +intel_de_write(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 val)
> > >  {
> > > -	xe_mmio_write32(to_gt(i915), reg.reg, val);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	xe_mmio_write32(to_gt(i915), reg, val);
> > >  }
> > > 
> > >  static inline u32
> > > -intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
> > > +intel_de_rmw(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 clear, u32 set)
> > >  {
> > > -	return xe_mmio_rmw32(to_gt(i915), reg.reg, clear, set);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_rmw32(to_gt(i915), reg, clear, set);
> > >  }
> > > 
> > >  static inline int
> > > -intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
> > > +intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t i915_reg,
> > >  			   u32 mask, u32 value, unsigned int timeout)
> > >  {
> > > -	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
> > > -			      false);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
> > > +			      timeout * USEC_PER_MSEC, NULL, false);
> > >  }
> > > 
> > >  static inline int
> > > -intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t reg,
> > > +intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t i915_reg,
> > >  			      u32 mask, u32 value, unsigned int timeout)
> > >  {
> > > -	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
> > > -			      false);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
> > > +			      timeout * USEC_PER_MSEC, NULL, false);
> > >  }
> > > 
> > >  static inline int
> > > -__intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
> > > +__intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t i915_reg,
> > >  			     u32 mask, u32 value,
> > >  			     unsigned int fast_timeout_us,
> > >  			     unsigned int slow_timeout_ms, u32 *out_value)
> > >  {
> > > -	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
> > >  			      fast_timeout_us + 1000 * slow_timeout_ms,
> > >  			      out_value, false);
> > >  }
> > > 
> > >  static inline int
> > > -intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t reg,
> > > +intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t i915_reg,
> > >  		      u32 mask, unsigned int timeout)
> > >  {
> > > -	return intel_de_wait_for_register(i915, reg, mask, mask, timeout);
> > > +	return intel_de_wait_for_register(i915, i915_reg, mask, mask, timeout);
> > >  }
> > > 
> > >  static inline int
> > > -intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
> > > +intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t i915_reg,
> > >  			u32 mask, unsigned int timeout)
> > >  {
> > > -	return intel_de_wait_for_register(i915, reg, mask, 0, timeout);
> > > +	return intel_de_wait_for_register(i915, i915_reg, mask, 0, timeout);
> > >  }
> > > 
> > >  /*
> > > @@ -98,19 +114,23 @@ intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
> > >   * a more localised lock guarding all access to that bank of registers.
> > >   */
> > >  static inline u32
> > > -intel_de_read_fw(struct drm_i915_private *i915, i915_reg_t reg)
> > > +intel_de_read_fw(struct drm_i915_private *i915, i915_reg_t i915_reg)
> > >  {
> > > -	return xe_mmio_read32(to_gt(i915), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_read32(to_gt(i915), reg);
> > >  }
> > > 
> > >  static inline void
> > > -intel_de_write_fw(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
> > > +intel_de_write_fw(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 val)
> > >  {
> > > -	xe_mmio_write32(to_gt(i915), reg.reg, val);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	xe_mmio_write32(to_gt(i915), reg, val);
> > >  }
> > > 
> > >  static inline void
> > > -intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
> > > +intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t i915_reg)
> > >  {
> > >  	/*
> > >  	 * Not implemented, requires lock on all reads/writes.
> > > @@ -120,15 +140,20 @@ intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
> > >  }
> > > 
> > >  static inline u32
> > > -intel_de_read_notrace(struct drm_i915_private *i915, i915_reg_t reg)
> > > +intel_de_read_notrace(struct drm_i915_private *i915, i915_reg_t i915_reg)
> > >  {
> > > -	return xe_mmio_read32(to_gt(i915), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_read32(to_gt(i915), reg);
> > >  }
> > > 
> > >  static inline void
> > > -intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
> > > +intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t i915_reg,
> > > +		       u32 val)
> > >  {
> > > -	xe_mmio_write32(to_gt(i915), reg.reg, val);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	xe_mmio_write32(to_gt(i915), reg, val);
> > >  }
> > > 
> > >  static inline int
> > > --
> > > 2.40.1
> > > 
