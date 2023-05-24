Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B405C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDEE10E68D;
	Wed, 24 May 2023 17:06:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952010E68D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:06:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E55616157D;
 Wed, 24 May 2023 17:06:12 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 5D82AC433EF;
 Wed, 24 May 2023 17:06:09 +0000 (UTC)
Date: Wed, 24 May 2023 13:06:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZG5D/vDRixEslJye@rdvivi-mobl4>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > It is the maximum protection we can do with the current infrastructure.
> > 
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > 
> > 
> > RFC
> > ===
> > 
> > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > Xe than anything else.
> > 
> > On i915 the force_wake is built-in the mmio functions at uncore component.
> > 
> > With that approach we had few historical issues iirc:
> > 
> > 1. Display performance with vblank evasion that requested uncore to provide
> > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > the name suggests).
> 
> In i915 there were more differences between fw and non-fw variants
> of register functions than just forcewake handling:
> 
>  * _fw() functions assumed that the caller was already holding
>    forcewake, whereas the non-fw functions would obtain it themselves
>  * _fw() functions also assumed that the caller was already holding
>    uncore->lock, whereas the non-fw functions would obtain and release
>    the lock around each register access
>  * _fw() functions do no tracing and no debug assertions
>  * _fw() functions do not check for unclaimed MMIO
> 
> I don't think the first bullet there (forcewake) really mattered much
> from a performance perspective.  For display registers, a quick binary
> search of the FW table (just a handful of CPU cycles) would quickly
> determine that no forcewake domains were needed for those register
> offsets, so we wouldn't be doing anything with forcewake at the hardware
> level at all.  For display registers, the more performance-relevant
> aspects of using the _fw() functions was doing all your register
> accesses together without contention with other MMIO work.  I.e.,
> holding the uncore lock over an entire set of registers rather than
> grabbing/releasing it for each one, and (for vblank evasion
> specifically) doing it all while interrupts were disabled.  For debug
> drivers, there was also a bunch of other stuff that the _fw() functions
> bypassed (e.g., tripling of the number of register accesses due to
> reading FPGA_DBG before/after each register to look for unclaimed
> accesses).
> 
> > 
> > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > other times that the spec was updated and we didn't get the notification, and
> > there were cases that the BSpec had bugs.
> > 
> > For these reasons in Xe we have decided to let to the caller the
> > responsibility to set the force_wake bits for their domains before doing
> > the MMIO.
> 
> I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> bspec update (or the bspec itself having incorrect information) would
> lead to even more mistakes if the caller has to explicitly grab the
> appropriate domains than if the driver does it implicitly.  The explicit
> handling only helps in the subset of cases where we blindly grab all of
> the domains (as we do during part of init).
> 
> 
> > 
> > However I'm seeing many questions and doubts popping up:
> > 
> > 1. Are we confident that we are not missing any wake-up?
> > 2. Are we confident that the domains are set correctly?
> > 3. Are we not wasting power if we are waking up ALL the domains instead
> >    of some specific one?
> 
> I think we're only holding ALL domains during init; for most of the
> runtime MMIO accesses, I think the code is currently attempting to only
> grab the domain(s) that it thinks the registers it's accessing will
> need.  Although that might be working right now, I'm a little bit
> worried about how that will scale in the long term when a single
> register might be in several different domains depending on what
> platform you're running on.  There have definitely been cases in the
> past where groups of registers migrated from RENDER to GT or vice versa
> between platforms, so the exact domain you needed for an operation
> varied by platform.  And things are even more complicated if you're
> doing any MMIO against the media, since the hardware seems to change
> exactly how it splits up the media power wells somewhat often.
> 
> > 4. What about the display disconnection now because i915 and xe have different
> >    mmio approaches but reusing i915-display?
> > 
> > It looks to me that the cons of the current approach are superseding the
> > cons of the i915 approach. But I want to hear more thoughts here before
> > we decide which route to take.
> > 
> > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > a double approach where the caller is responsible but mmio has the range
> > information and double check it?
> 
> As noted above, part of the challenge with forcewake is that even if the
> caller knows it wants to access register FOO, and even if it know FOO is
> a GT register that likely needs forcewake, it's sometimes challenging to
> make sure it's grabbing the correct domain(s) for every single platform
> the Xe driver will eventually support if the power management handling
> changes.  I think that was part of the motivation for encoding the
> tables into the driver in i915.  It seems like GT power wells don't
> change as much these days as they used to, but it's hard to say whether
> that will continue in the future or not.  Who knows...maybe they'll
> eventually start creating dedicated domains for stuff like blitters,
> GuC, etc.  rather than lumping all of those into the "GT" catchall
> domain.
> 
> If we do decide to go back to implicit forcewake handling with the table
> encoded into the driver, it might be worth doing something sort of like
> what Lucas is doing in the OOB workaround series --- drop the
> per-platform tables into a human-readable text file that's more similar
> to the format used by the bspec (exact ranges, forcewake domain, MCR
> replication type, etc.) and then provide a small parser program that
> will convert that into actual code (and do things like consolidating
> adjacent ranges).

good idea!

> 
> > 
> > Any other idea? Thoughts?
> 
> Once the big GT vs tile refactor stuff I have in flight gets finalized,
> I plan to follow up with another series that creates a more appropriate
> MMIO target for register operations rather than using "xe_gt" as the
> target (even for things completely unrelated to the small GT subset of
> hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> operations against a specific hardware unit, and then the info inside
> the MMIO structure would be able to figure out if there are additional
> checks and/or operations it should perform.  E.g.,
> 
>  * mmio = xe_mmio_for_device(xe_device *xe);
>     - Used to submit MMIO operations against the root tile of the PCI
>       device.  Only used during init (e.g., to read the registers that
>       tell us which tiles exist on the platform) and during top-level
>       interrupt enable/disable (since all interrupts are routed through
>       the root tile).
>     - No forcewake needed for register accesses through a handle of this
>       type since you'd only ever be accessing sgunit registers for these
>       types of things.
>     - Register accesses through mmio can warn on debug builds if the
>       register appears to be in a GT-related MMIO range.
> 
>  * mmio = xe_mmio_for_display(xe_device *xe);
>     - Pretty much the same as handles returned by xe_mmio_for_device(),
>       but if a handle of this type is used to try to read/write
>       registers outside the display range, we could have debug builds
>       throw some extra warnings.
>     - Unclaimed register detection could be confined to accesses through
>       these handles.
> 
>  * mmio = xe_mmio_for_tile(xe_tile *tile);
>     - Used to access non-GT registers that reside in a specific tile.
>       I.e., sgunit/soc registers.
>     - As above, no forcewake needed, can make MMIO operations warn
>       if used to access a GT range.
> 
>  * mmio = xe_mmio_for_gt(xe_gt *gt);
>     - Used to access GT registers in a specific GT
>     - Does automatic GSI offset translation for media GTs
>     - Can either do automatic forcewake like i915 does, or can do debug
>       check+warn like you have here.
>     - Can make MMIO operations warn if MMIO offset is outside GT range
>     - Can also trigger warnings if a GT non-GSI, non-media engine
>       register is accessed from an MMIO obtained from a media GT.

Ack! This sounds like a great plan!
So this RFC discussion was much easier than I expected :)

> 
> At some point we'll probably want to add some debug tracepoints for MMIO
> access to assist with debugging; the mmio structure can also help
> provide meaningful output for each type of MMIO handle as well.
> 
> 
> One other MMIO-related thing:
> At the moment Xe does no locking of MMIO access.  I know there were
> hardware lockups on old platforms if simultaneous MMIO accesses
> happened, but I've never seen that tied to a specific HSD ticket that
> would let us know whether modern platforms are still susceptible or not.
> If it turns out they are and that we need to bring in the equivalent of
> i915's uncore lock (and figure out if any register access is
> problematic, or only certain types/ranges).
> 
> 
> Matt
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> >  drivers/gpu/drm/xe/xe_mmio.h | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index 1407f1189b0d..6302ca85e3f4 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -18,8 +18,26 @@ struct xe_device;
> >  
> >  int xe_mmio_init(struct xe_device *xe);
> >  
> > +static inline void xe_mmio_assert_forcewake(struct xe_gt *gt,
> > +					    struct xe_reg reg)
> > +{
> > +	struct xe_force_wake *fw = &gt->mmio.fw;
> > +
> > +	/* No need for forcewake in this range */
> > +	if (reg.addr >= 0x40000 && reg.addr < 0x116000)
> > +		return;
> > +
> > +	/*
> > +	 * XXX: Weak. It checks for some domain, but impossible to determine
> > +	 * if the right one is selected, or if it was set by the same caller
> > +	 */
> > +	WARN_ON(!fw->awake_domains);
> > +}
> > +
> >  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > @@ -29,6 +47,8 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >  static inline void xe_mmio_write32(struct xe_gt *gt,
> >  				   struct xe_reg reg, u32 val)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > @@ -37,6 +57,8 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
> >  
> >  static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > @@ -58,6 +80,8 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> >  static inline void xe_mmio_write64(struct xe_gt *gt,
> >  				   struct xe_reg reg, u64 val)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > @@ -66,6 +90,8 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
> >  
> >  static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > -- 
> > 2.39.2
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
