Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C7CD68F4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 07:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E6010E1B5;
	Tue, 10 Oct 2023 07:00:14 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0627010E1B5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 07:00:11 +0000 (UTC)
Received: from 91-155-254-243.elisa-laajakaista.fi ([91.155.254.243]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <luca@coelho.fi>) id 1qq6it-000kCZ-2U;
 Tue, 10 Oct 2023 10:00:09 +0300
Message-ID: <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, Jani
 Nikula <jani.nikula@intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@intel.com>,  Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 10 Oct 2023 10:00:06 +0300
In-Reply-To: <ZSRtavVCM2lqbV5y@intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
 <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
 <20230523163849.GD6250@mdroper-desk1.amr.corp.intel.com>
 <ZG1Rwd2k6oDdiHHT@DUT025-TGLU.fm.intel.com>
 <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
 <ZSRtavVCM2lqbV5y@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 2023-10-09 at 17:15 -0400, Rodrigo Vivi wrote:
> On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> > Hi everyone,
> >=20
> > On Tue, 2023-05-23 at 23:52 +0000, Matthew Brost wrote:
> > > On Tue, May 23, 2023 at 09:38:49AM -0700, Matt Roper wrote:
> > > > On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> > > > > On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > > > > > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > > > > > > It is the maximum protection we can do with the current infra=
structure.
> > > > > > >=20
> > > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > ---
> > > > > > >=20
> > > > > > >=20
> > > > > > > RFC
> > > > > > > =3D=3D=3D
> > > > > > >=20
> > > > > > > Okay, so, this is more an RFC to brainstorm the future of the=
 force_wake in
> > > > > > > Xe than anything else.
> > > > > > >=20
> > > > > > > On i915 the force_wake is built-in the mmio functions at unco=
re component.
> > > > > > >=20
> > > > > > > With that approach we had few historical issues iirc:
> > > > > > >=20
> > > > > > > 1. Display performance with vblank evasion that requested unc=
ore to provide
> > > > > > > the 'fw' variantes that are actually the ones that avoid fw (=
contrary to what
> > > > > > > the name suggests).
> > > > > >=20
> > > > > > In i915 there were more differences between fw and non-fw varia=
nts
> > > > > > of register functions than just forcewake handling:
> > > > > >=20
> > > > > >  * _fw() functions assumed that the caller was already holding
> > > > > >    forcewake, whereas the non-fw functions would obtain it them=
selves
> > > > > >  * _fw() functions also assumed that the caller was already hol=
ding
> > > > > >    uncore->lock, whereas the non-fw functions would obtain and =
release
> > > > > >    the lock around each register access
> > > > > >  * _fw() functions do no tracing and no debug assertions
> > > > > >  * _fw() functions do not check for unclaimed MMIO
> > > > > >=20
> > > > > > I don't think the first bullet there (forcewake) really mattere=
d much
> > > > > > from a performance perspective.  For display registers, a quick=
 binary
> > > > > > search of the FW table (just a handful of CPU cycles) would qui=
ckly
> > > > > > determine that no forcewake domains were needed for those regis=
ter
> > > > > > offsets, so we wouldn't be doing anything with forcewake at the=
 hardware
> > > > > > level at all.  For display registers, the more performance-rele=
vant
> > > > > > aspects of using the _fw() functions was doing all your registe=
r
> > > > > > accesses together without contention with other MMIO work.  I.e=
.,
> > > > > > holding the uncore lock over an entire set of registers rather =
than
> > > > > > grabbing/releasing it for each one, and (for vblank evasion
> > > > > > specifically) doing it all while interrupts were disabled.  For=
 debug
> > > > > > drivers, there was also a bunch of other stuff that the _fw() f=
unctions
> > > > > > bypassed (e.g., tripling of the number of register accesses due=
 to
> > > > > > reading FPGA_DBG before/after each register to look for unclaim=
ed
> > > > > > accesses).
> > > > > >=20
> > > > > > >=20
> > > > > > > 2. Missed ranges updates. Sometimes we messed up with the ran=
ges, there were
> > > > > > > other times that the spec was updated and we didn't get the n=
otification, and
> > > > > > > there were cases that the BSpec had bugs.
> > > > > > >=20
> > > > > > > For these reasons in Xe we have decided to let to the caller =
the
> > > > > > > responsibility to set the force_wake bits for their domains b=
efore doing
> > > > > > > the MMIO.
> > > > > >=20
> > > > > > I don't think #2 was a reason to skip forcewake in Xe.  Not not=
icing a
> > > > > > bspec update (or the bspec itself having incorrect information)=
 would
> > > > > > lead to even more mistakes if the caller has to explicitly grab=
 the
> > > > > > appropriate domains than if the driver does it implicitly.  The=
 explicit
> > > > > > handling only helps in the subset of cases where we blindly gra=
b all of
> > > > > > the domains (as we do during part of init).
> > > > > >=20
> > > > > >=20
> > > > >=20
> > > > > MMIO access that requires forcewakes really only should be in a f=
ew
> > > > > places, off the top of my head:
> > > > >=20
> > > > > 1. Init
> > > > > 2. Reset
> > > > > 3. Sysfs / Debugfs
> > > > >=20
> > > > > In all of these cases I think it fine to blindly grab all forcewa=
kes.
> > > > >=20
> > > > > Please chime in if I'm missing something.
> > > >=20
> > > > I think as we implement more features in the Xe driver we're going =
to
> > > > wind up with a lot more places where we need to access GT registers=
 at
> > > > runtime.  A few examples off the top of my head:
> > > >=20
> > > >  * EU stall sampling
> > > >  * Perf/OA
> > > >  * EU debugger
> > > >  * Various OOB workarounds that ask us to twiddle a register at cer=
tain
> > > >    times in the driver.
> > >=20
> > > Hmm, ok a lot of these I could make the argument that these are not
> > > normal operation so just grab everything and call it a day. If some o=
f
> > > these fall into the category of 'normal enough to be optimized' I can
> > > also make the argument it is no more complex (perhaps less complex) t=
o
> > > explicitly grab the forcewake than having the logic auto-grab the
> > > forcewake.
> > >=20
> > > What a compromise of in a debug mode we auto-generate the asserts bas=
ed
> > > on a table but we still explicitly grab the forcewake?
> > >=20
> > > >=20
> > > > >=20
> > > > > > >=20
> > > > > > > However I'm seeing many questions and doubts popping up:
> > > > > > >=20
> > > > > > > 1. Are we confident that we are not missing any wake-up?
> > > > > > > 2. Are we confident that the domains are set correctly?
> > > > > > > 3. Are we not wasting power if we are waking up ALL the domai=
ns instead
> > > > > > >    of some specific one?
> > > > > >=20
> > > > > > I think we're only holding ALL domains during init; for most of=
 the
> > > > > > runtime MMIO accesses, I think the code is currently attempting=
 to only
> > > > > > grab the domain(s) that it thinks the registers it's accessing =
will
> > > > > > need.  Although that might be working right now, I'm a little b=
it
> > > > > > worried about how that will scale in the long term when a singl=
e
> > > > > > register might be in several different domains depending on wha=
t
> > > > > > platform you're running on.  There have definitely been cases i=
n the
> > > > > > past where groups of registers migrated from RENDER to GT or vi=
ce versa
> > > > > > between platforms, so the exact domain you needed for an operat=
ion
> > > > > > varied by platform.  And things are even more complicated if yo=
u're
> > > > > > doing any MMIO against the media, since the hardware seems to c=
hange
> > > > > > exactly how it splits up the media power wells somewhat often.
> > > > > >=20
> > > > > > > 4. What about the display disconnection now because i915 and =
xe have different
> > > > > > >    mmio approaches but reusing i915-display?
> > > > > > >=20
> > > > > > > It looks to me that the cons of the current approach are supe=
rseding the
> > > > > > > cons of the i915 approach. But I want to hear more thoughts h=
ere before
> > > > > > > we decide which route to take.
> > > > > > >=20
> > > > > > > Maybe we have that domain as part of the mmio calls themselve=
s? Maybe
> > > > > > > a double approach where the caller is responsible but mmio ha=
s the range
> > > > > > > information and double check it?
> > > > > >=20
> > > > > > As noted above, part of the challenge with forcewake is that ev=
en if the
> > > > > > caller knows it wants to access register FOO, and even if it kn=
ow FOO is
> > > > > > a GT register that likely needs forcewake, it's sometimes chall=
enging to
> > > > > > make sure it's grabbing the correct domain(s) for every single =
platform
> > > > > > the Xe driver will eventually support if the power management h=
andling
> > > > > > changes.  I think that was part of the motivation for encoding =
the
> > > > > > tables into the driver in i915.  It seems like GT power wells d=
on't
> > > > > > change as much these days as they used to, but it's hard to say=
 whether
> > > > > > that will continue in the future or not.  Who knows...maybe the=
y'll
> > > > > > eventually start creating dedicated domains for stuff like blit=
ters,
> > > > > > GuC, etc.  rather than lumping all of those into the "GT" catch=
all
> > > > > > domain.
> > > > > >=20
> > > > > > If we do decide to go back to implicit forcewake handling with =
the table
> > > > > > encoded into the driver, it might be worth doing something sort=
 of like
> > > > >=20
> > > > > Let's not do this intel_uncore.c is an unreadable mess, I don't w=
ant
> > > > > anything like this in Xe.
> > > >=20
> > > > When you say unreadable, are you referring to the macros that gener=
ate
> > > > the table lookup functions?  I don't think that macro magic would b=
e
> > > > needed for Xe since we don't have to support old platforms that hav=
e
> > > > very different forcewake behavior, and we also don't need to genera=
te
> > > > separate 8-bit, 16-bit, and 32-bit versions of each operation anymo=
re
> > > > (since I think everything in the GT is 32-bits these days).
> > > >=20
> > >=20
> > > Just the entire file is unreadable in general, trying to avoid these
> > > types of files in Xe, avoid traps of the i915 did this so let's do it=
 in
> > > Xe, and over engineering our driver to avoid hypothetical future bugs=
.
> > >=20
> > > Matt
> > >=20
> > > > The forcewake and shadow tables themselves are pretty clean in i915
> > > > these days, and if we move to autogenerating them from a text file,=
 they
> > > > can become even simpler since the text file will basically be a cle=
aned
> > > > up copy/paste of part of the bspec table.
> > > >=20
> > > >=20
> > > > Matt
> > > >=20
> > > > >=20
> > > > > > what Lucas is doing in the OOB workaround series --- drop the
> > > > > > per-platform tables into a human-readable text file that's more=
 similar
> > > > > > to the format used by the bspec (exact ranges, forcewake domain=
, MCR
> > > > > > replication type, etc.) and then provide a small parser program=
 that
> > > > > > will convert that into actual code (and do things like consolid=
ating
> > > > > > adjacent ranges).
> > > > > >=20
> > > > > > >=20
> > > > > > > Any other idea? Thoughts?
> > > > > >=20
> > > > > > Once the big GT vs tile refactor stuff I have in flight gets fi=
nalized,
> > > > > > I plan to follow up with another series that creates a more app=
ropriate
> > > > > > MMIO target for register operations rather than using "xe_gt" a=
s the
> > > > > > target (even for things completely unrelated to the small GT su=
bset of
> > > > > > hardware).  My idea is that you'd grab an MMIO target structure=
 for MMIO
> > > > > > operations against a specific hardware unit, and then the info =
inside
> > > > > > the MMIO structure would be able to figure out if there are add=
itional
> > > > > > checks and/or operations it should perform.  E.g.,
> > > > > >=20
> > > > > >  * mmio =3D xe_mmio_for_device(xe_device *xe);
> > > > > >     - Used to submit MMIO operations against the root tile of t=
he PCI
> > > > > >       device.  Only used during init (e.g., to read the registe=
rs that
> > > > > >       tell us which tiles exist on the platform) and during top=
-level
> > > > > >       interrupt enable/disable (since all interrupts are routed=
 through
> > > > > >       the root tile).
> > > > > >     - No forcewake needed for register accesses through a handl=
e of this
> > > > > >       type since you'd only ever be accessing sgunit registers =
for these
> > > > > >       types of things.
> > > > > >     - Register accesses through mmio can warn on debug builds i=
f the
> > > > > >       register appears to be in a GT-related MMIO range.
> > > > > >=20
> > > > > >  * mmio =3D xe_mmio_for_display(xe_device *xe);
> > > > > >     - Pretty much the same as handles returned by xe_mmio_for_d=
evice(),
> > > > > >       but if a handle of this type is used to try to read/write
> > > > > >       registers outside the display range, we could have debug =
builds
> > > > > >       throw some extra warnings.
> > > > > >     - Unclaimed register detection could be confined to accesse=
s through
> > > > > >       these handles.
> > > > > >=20
> > > > > >  * mmio =3D xe_mmio_for_tile(xe_tile *tile);
> > > > > >     - Used to access non-GT registers that reside in a specific=
 tile.
> > > > > >       I.e., sgunit/soc registers.
> > > > > >     - As above, no forcewake needed, can make MMIO operations w=
arn
> > > > > >       if used to access a GT range.
> > > > > >=20
> > > > > >  * mmio =3D xe_mmio_for_gt(xe_gt *gt);
> > > > > >     - Used to access GT registers in a specific GT
> > > > > >     - Does automatic GSI offset translation for media GTs
> > > > > >     - Can either do automatic forcewake like i915 does, or can =
do debug
> > > > > >       check+warn like you have here.
> > > > > >     - Can make MMIO operations warn if MMIO offset is outside G=
T range
> > > > > >     - Can also trigger warnings if a GT non-GSI, non-media engi=
ne
> > > > > >       register is accessed from an MMIO obtained from a media G=
T.
> > > > > >=20
> > > > >=20
> > > > > Ack on this if we keep in managable, worried code / feature bloat=
 those
> > > > > that will result in a similar file to intel_uncore.c in Xe.
> >=20
> > Just to revive this thread.
> >=20
> > I've been discussing this proposal in the context of a change we need
> > to make in the display, which is to introduce a wakelock for some
> > registers access in order to be able to remove the DMC trap.
> >=20
> > We came to the conclusion that this new implementation is very much the
> > same as the forcewake proposal here.  From the display point-of-view,
> > we could simply have a new domain and range of registers to protect.
> >=20
> > We _could_ implement a separate "wakelock" mechanism for the display
> > part, but that would be mostly duplicating the entire forcewake
> > implementation.
> >=20
> > So, are there any plans to implement the current proposal? Or any other
> > plans related to the forcewake implementation for Xe? As I see it, the
> > "wakelock" implementation in the display depends on this.
> >=20
> > Any thoughts?
>=20
> Hi Luca, thanks for raising this again here.

Hi Lucas! Thanks for your comments.


> So, as I said in the past, I don't have strong opinions regarding the
> overall forcewake approach.
>=20
> The since GT MMIO is not used very frequently, I don't see a problem of
> leaving that up to the caller to take the right domain when needed, or ev=
en
> the FORCEWAKE_ALL domain. Instead of forcing all the callers to
> go through this extra steps and then have to opt-out with the '_fw' [sic]
> alternatives for the cases where the forcewake cannot be checked undernea=
th.
>=20
> So, for the new display wakelocks, that's the problem of adding them to
> the drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h where the conve=
rions
> from i915's intel uncore are happening to xe_mmio? So, when using the
> intel_uncore's '_fw' variant you skip the wakelock and when doing the reg=
ular
> mmio calls you just add a wakelock_get/put around the xe_mmio call with
> the display domain. And in i915 you implement inside the intel_uncore.
>=20
> What's the downside of this approach?

That's more or less what I was thinking.  I don't think there's any
problem on the display side in calling the same framework.


> Trying to understand all the pros and cons of different approaches, and
> bringing some people to the discussion.
>=20
> If we implement the forwareke underneath the mmio call, display needs
> to anyway implement it twice on the i915's intel_uncore and on the
> xe_forcewake, no?!

Yes, IMHO we should start making Xe the base implementation and
backporting the new implementation into i915.

So,for this specific case, I think we can just make i915 call the new
functions in xe and have them backported in intel_uncore.h for i915.

What I was thinking was basically this:

1. Implement the xe_mmio_for_<hw_unit>() proposal in Xe=E2=80=8B

2. Display code uses new APIs (xe_mmio_for_display ops)=E2=80=8B

3. Update uncore to handle "wakelock domain"=E2=80=8B

4. Wrappers for i915=E2=80=8B, make an xe_mmio_for_display wrapper that cal=
ls
the old functions in uncore and add the necessary locking there.

In i915 we're most likely not going to need the wakelock stuff for DMC
trap, because it shouldn't be needed in older hardware anyway.  So the
backport can remain pretty simple.

Would this work?

--
Cheers,
Luca.
