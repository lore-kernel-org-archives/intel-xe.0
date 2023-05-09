Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A33BC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 17:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D990C10E3B4;
	Tue,  9 May 2023 17:16:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357B210E3B3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 17:16:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DCCB614C6;
 Tue,  9 May 2023 17:16:37 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id D2EE0C4339B;
 Tue,  9 May 2023 17:16:34 +0000 (UTC)
Date: Tue, 9 May 2023 13:16:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZFp/5YDyICIjpv6h@rdvivi-mobl4>
References: <20230508225322.2692066-1-lucas.demarchi@intel.com>
 <20230508225322.2692066-3-lucas.demarchi@intel.com>
 <ZFpmQOxiO1DGB5/b@intel.com>
 <t3xgc2hzjtbru3k2x7emvrxtypsuejj4ms25rq6x2lsoo4auai@v77oi3plujhm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t3xgc2hzjtbru3k2x7emvrxtypsuejj4ms25rq6x2lsoo4auai@v77oi3plujhm>
Subject: Re: [Intel-xe] [PATCH v2 2/4] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 10:09:08AM -0700, Lucas De Marchi wrote:
> On Tue, May 09, 2023 at 11:26:56AM -0400, Rodrigo Vivi wrote:
> > On Mon, May 08, 2023 at 03:53:20PM -0700, Lucas De Marchi wrote:
> > > WARNING: This should only be squashed when the display implementation
> > > moves above commit "drm/xe/mmio: Use struct xe_reg".
> > 
> > I wonder if we should then try to move this patch under the display
> 
> that is the v1 of the patch
> 
> > instead waiting for the next round of moving the display up...
> 
> but that then means build will be broken for all the commits between the
> current place display is in and the previous commit, rather than just 1
> commit.
> 
> I think the next display move will be messy as there are commits in the
> middle that depend on the display being down. My attempt to moving it up
> last week
> (https://gitlab.freedesktop.org/demarchi/xe/-/tree/tip-display-rebase)
> led to a bigger squash at the end because leaving some commits behind
> didn't make sense and adding them on top didn't look good neither.
> 
> Question: is display in an acceptable enough state now that we can stop
> doing this and just leave it behind the build config? Maybe just move it
> once more and stop doing that? Another option is to accept the display
> move is painful enough and maintain it with just a single commit on top.

Jani, what are your thoughts on this?

> 
> Lucas De Marchi
> 
> > 
> > Also, could we change the subject from fixup to future-fixup so the
> > a git autosquash doesn't try to move this before we are ready?
> > 
> > > 
> > > With the move of display above xe_reg conversion in xe_mmio,
> > > it should use the new types everywhere.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  .../drm/xe/compat-i915-headers/intel_uncore.h | 103 +++++++++++++-----
> > >  1 file changed, 74 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > index 90d79290a211..14f195fe275d 100644
> > > --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > @@ -17,82 +17,127 @@ static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
> > >  	return to_gt(xe);
> > >  }
> > > 
> > > -static inline u32 intel_uncore_read(struct fake_uncore *uncore, i915_reg_t reg)
> > > +static inline u32 intel_uncore_read(struct fake_uncore *uncore,
> > > +				    i915_reg_t i915_reg)
> > >  {
> > > -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> > >  }
> > > 
> > > -static inline u32 intel_uncore_read8(struct fake_uncore *uncore, i915_reg_t reg)
> > > +static inline u32 intel_uncore_read8(struct fake_uncore *uncore,
> > > +				     i915_reg_t i915_reg)
> > >  {
> > > -	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg);
> > >  }
> > > 
> > > -static inline u64 intel_uncore_read64_2x32(struct fake_uncore *uncore, i915_reg_t lower_reg, i915_reg_t upper_reg)
> > > +static inline u64
> > > +intel_uncore_read64_2x32(struct fake_uncore *uncore,
> > > +			 i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
> > >  {
> > > +	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
> > > +	struct xe_reg upper_reg = XE_REG(i915_mmio_reg_offset(i915_upper_reg));
> > >  	u32 upper, lower, old_upper;
> > >  	int loop = 0;
> > > 
> > > -	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
> > > +	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
> > >  	do {
> > >  		old_upper = upper;
> > > -		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg.reg);
> > > -		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
> > > +		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg);
> > > +		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
> > >  	} while (upper != old_upper && loop++ < 2);
> > > 
> > >  	return (u64)upper << 32 | lower;
> > >  }
> > > 
> > > -static inline void intel_uncore_posting_read(struct fake_uncore *uncore, i915_reg_t reg)
> > > +static inline void intel_uncore_posting_read(struct fake_uncore *uncore,
> > > +					     i915_reg_t i915_reg)
> > >  {
> > > -	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> > >  }
> > > 
> > > -static inline void intel_uncore_write(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
> > > +static inline void intel_uncore_write(struct fake_uncore *uncore,
> > > +				      i915_reg_t i915_reg, u32 val)
> > >  {
> > > -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> > >  }
> > > 
> > > -static inline u32 intel_uncore_rmw(struct fake_uncore *uncore, i915_reg_t reg, u32 clear, u32 set)
> > > +static inline u32 intel_uncore_rmw(struct fake_uncore *uncore,
> > > +				   i915_reg_t i915_reg, u32 clear, u32 set)
> > >  {
> > > -	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg.reg, clear, set);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg, clear, set);
> > >  }
> > > 
> > > -static inline int intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
> > > +static inline int intel_wait_for_register(struct fake_uncore *uncore,
> > > +					  i915_reg_t i915_reg, u32 mask,
> > > +					  u32 value, unsigned int timeout)
> > >  {
> > > -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
> > > +			      timeout * USEC_PER_MSEC, NULL, false);
> > >  }
> > > 
> > > -static inline int intel_wait_for_register_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
> > > +static inline int intel_wait_for_register_fw(struct fake_uncore *uncore,
> > > +					     i915_reg_t i915_reg, u32 mask,
> > > +					     u32 value, unsigned int timeout)
> > >  {
> > > -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
> > > +			      timeout * USEC_PER_MSEC, NULL, false);
> > >  }
> > > 
> > > -static inline int __intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value,
> > > -					    unsigned int fast_timeout_us, unsigned int slow_timeout_ms, u32 *out_value)
> > > +static inline int
> > > +__intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t i915_reg,
> > > +			  u32 mask, u32 value, unsigned int fast_timeout_us,
> > > +			  unsigned int slow_timeout_ms, u32 *out_value)
> > >  {
> > > -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask,
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
> > >  			      fast_timeout_us + 1000 * slow_timeout_ms,
> > >  			      out_value, false);
> > >  }
> > > 
> > > -static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore, i915_reg_t reg)
> > > +static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore,
> > > +				       i915_reg_t i915_reg)
> > >  {
> > > -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> > >  }
> > > 
> > > -static inline void intel_uncore_write_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
> > > +static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
> > > +					 i915_reg_t i915_reg, u32 val)
> > >  {
> > > -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> > >  }
> > > 
> > > -static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore, i915_reg_t reg)
> > > +static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
> > > +					    i915_reg_t i915_reg)
> > >  {
> > > -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> > >  }
> > > 
> > > -static inline void intel_uncore_write_notrace(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
> > > +static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
> > > +					      i915_reg_t i915_reg, u32 val)
> > >  {
> > > -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
> > > +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > +
> > > +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> > >  }
> > > 
> > >  #endif /* __INTEL_UNCORE_H__ */
> > > --
> > > 2.40.1
> > > 
