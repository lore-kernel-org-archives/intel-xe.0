Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A054CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6978310E0A5;
	Mon, 16 Oct 2023 10:22:39 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC4310E0A5
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 10:22:37 +0000 (UTC)
Received: from 91-155-254-243.elisa-laajakaista.fi ([91.155.254.243]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97-RC1)
 (envelope-from <luca@coelho.fi>) id 1qsKk5-000000001UM-2MXi;
 Mon, 16 Oct 2023 13:22:34 +0300
Message-ID: <f352c534f049f7068cef667b4faa88d7cca9b8fd.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 16 Oct 2023 13:22:32 +0300
In-Reply-To: <ZShRTTLRD7ltDGSS@intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
 <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
 <20230523163849.GD6250@mdroper-desk1.amr.corp.intel.com>
 <ZG1Rwd2k6oDdiHHT@DUT025-TGLU.fm.intel.com>
 <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
 <ZSRtavVCM2lqbV5y@intel.com>
 <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
 <ZShRTTLRD7ltDGSS@intel.com>
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
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2023-10-12 at 16:04 -0400, Rodrigo Vivi wrote:
> On Tue, Oct 10, 2023 at 10:00:06AM +0300, Luca Coelho wrote:
> > On Mon, 2023-10-09 at 17:15 -0400, Rodrigo Vivi wrote:
> > > On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> > > > Hi everyone,
> > > >=20
> > > > On Tue, 2023-05-23 at 23:52 +0000, Matthew Brost wrote:
> > > > > On Tue, May 23, 2023 at 09:38:49AM -0700, Matt Roper wrote:
> > > > > > On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> > > > > > > On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > > > > > > > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrot=
e:
> > > > > > > > > It is the maximum protection we can do with the current i=
nfrastructure.
> > > > > > > > >=20
> > > > > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > > > > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.co=
m>
> > > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > > > ---
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > RFC
> > > > > > > > > =3D=3D=3D
> > > > > > > > >=20
> > > > > > > > > Okay, so, this is more an RFC to brainstorm the future of=
 the force_wake in
> > > > > > > > > Xe than anything else.
> > > > > > > > >=20
> > > > > > > > > On i915 the force_wake is built-in the mmio functions at =
uncore component.
> > > > > > > > >=20
> > > > > > > > > With that approach we had few historical issues iirc:
> > > > > > > > >=20
> > > > > > > > > 1. Display performance with vblank evasion that requested=
 uncore to provide
> > > > > > > > > the 'fw' variantes that are actually the ones that avoid =
fw (contrary to what
> > > > > > > > > the name suggests).
> > > > > > > >=20
> > > > > > > > In i915 there were more differences between fw and non-fw v=
ariants
> > > > > > > > of register functions than just forcewake handling:
> > > > > > > >=20
> > > > > > > >  * _fw() functions assumed that the caller was already hold=
ing
> > > > > > > >    forcewake, whereas the non-fw functions would obtain it =
themselves
> > > > > > > >  * _fw() functions also assumed that the caller was already=
 holding
> > > > > > > >    uncore->lock, whereas the non-fw functions would obtain =
and release
> > > > > > > >    the lock around each register access
> > > > > > > >  * _fw() functions do no tracing and no debug assertions
> > > > > > > >  * _fw() functions do not check for unclaimed MMIO
> > > > > > > >=20
> > > > > > > > I don't think the first bullet there (forcewake) really mat=
tered much
> > > > > > > > from a performance perspective.  For display registers, a q=
uick binary
> > > > > > > > search of the FW table (just a handful of CPU cycles) would=
 quickly
> > > > > > > > determine that no forcewake domains were needed for those r=
egister
> > > > > > > > offsets, so we wouldn't be doing anything with forcewake at=
 the hardware
> > > > > > > > level at all.  For display registers, the more performance-=
relevant
> > > > > > > > aspects of using the _fw() functions was doing all your reg=
ister
> > > > > > > > accesses together without contention with other MMIO work. =
 I.e.,
> > > > > > > > holding the uncore lock over an entire set of registers rat=
her than
> > > > > > > > grabbing/releasing it for each one, and (for vblank evasion
> > > > > > > > specifically) doing it all while interrupts were disabled. =
 For debug
> > > > > > > > drivers, there was also a bunch of other stuff that the _fw=
() functions
> > > > > > > > bypassed (e.g., tripling of the number of register accesses=
 due to
> > > > > > > > reading FPGA_DBG before/after each register to look for unc=
laimed
> > > > > > > > accesses).
> > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > 2. Missed ranges updates. Sometimes we messed up with the=
 ranges, there were
> > > > > > > > > other times that the spec was updated and we didn't get t=
he notification, and
> > > > > > > > > there were cases that the BSpec had bugs.
> > > > > > > > >=20
> > > > > > > > > For these reasons in Xe we have decided to let to the cal=
ler the
> > > > > > > > > responsibility to set the force_wake bits for their domai=
ns before doing
> > > > > > > > > the MMIO.
> > > > > > > >=20
> > > > > > > > I don't think #2 was a reason to skip forcewake in Xe.  Not=
 noticing a
> > > > > > > > bspec update (or the bspec itself having incorrect informat=
ion) would
> > > > > > > > lead to even more mistakes if the caller has to explicitly =
grab the
> > > > > > > > appropriate domains than if the driver does it implicitly. =
 The explicit
> > > > > > > > handling only helps in the subset of cases where we blindly=
 grab all of
> > > > > > > > the domains (as we do during part of init).
> > > > > > > >=20
> > > > > > > >=20
> > > > > > >=20
> > > > > > > MMIO access that requires forcewakes really only should be in=
 a few
> > > > > > > places, off the top of my head:
> > > > > > >=20
> > > > > > > 1. Init
> > > > > > > 2. Reset
> > > > > > > 3. Sysfs / Debugfs
> > > > > > >=20
> > > > > > > In all of these cases I think it fine to blindly grab all for=
cewakes.
> > > > > > >=20
> > > > > > > Please chime in if I'm missing something.
> > > > > >=20
> > > > > > I think as we implement more features in the Xe driver we're go=
ing to
> > > > > > wind up with a lot more places where we need to access GT regis=
ters at
> > > > > > runtime.  A few examples off the top of my head:
> > > > > >=20
> > > > > >  * EU stall sampling
> > > > > >  * Perf/OA
> > > > > >  * EU debugger
> > > > > >  * Various OOB workarounds that ask us to twiddle a register at=
 certain
> > > > > >    times in the driver.
> > > > >=20
> > > > > Hmm, ok a lot of these I could make the argument that these are n=
ot
> > > > > normal operation so just grab everything and call it a day. If so=
me of
> > > > > these fall into the category of 'normal enough to be optimized' I=
 can
> > > > > also make the argument it is no more complex (perhaps less comple=
x) to
> > > > > explicitly grab the forcewake than having the logic auto-grab the
> > > > > forcewake.
> > > > >=20
> > > > > What a compromise of in a debug mode we auto-generate the asserts=
 based
> > > > > on a table but we still explicitly grab the forcewake?
> > > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > However I'm seeing many questions and doubts popping up:
> > > > > > > > >=20
> > > > > > > > > 1. Are we confident that we are not missing any wake-up?
> > > > > > > > > 2. Are we confident that the domains are set correctly?
> > > > > > > > > 3. Are we not wasting power if we are waking up ALL the d=
omains instead
> > > > > > > > >    of some specific one?
> > > > > > > >=20
> > > > > > > > I think we're only holding ALL domains during init; for mos=
t of the
> > > > > > > > runtime MMIO accesses, I think the code is currently attemp=
ting to only
> > > > > > > > grab the domain(s) that it thinks the registers it's access=
ing will
> > > > > > > > need.  Although that might be working right now, I'm a litt=
le bit
> > > > > > > > worried about how that will scale in the long term when a s=
ingle
> > > > > > > > register might be in several different domains depending on=
 what
> > > > > > > > platform you're running on.  There have definitely been cas=
es in the
> > > > > > > > past where groups of registers migrated from RENDER to GT o=
r vice versa
> > > > > > > > between platforms, so the exact domain you needed for an op=
eration
> > > > > > > > varied by platform.  And things are even more complicated i=
f you're
> > > > > > > > doing any MMIO against the media, since the hardware seems =
to change
> > > > > > > > exactly how it splits up the media power wells somewhat oft=
en.
> > > > > > > >=20
> > > > > > > > > 4. What about the display disconnection now because i915 =
and xe have different
> > > > > > > > >    mmio approaches but reusing i915-display?
> > > > > > > > >=20
> > > > > > > > > It looks to me that the cons of the current approach are =
superseding the
> > > > > > > > > cons of the i915 approach. But I want to hear more though=
ts here before
> > > > > > > > > we decide which route to take.
> > > > > > > > >=20
> > > > > > > > > Maybe we have that domain as part of the mmio calls thems=
elves? Maybe
> > > > > > > > > a double approach where the caller is responsible but mmi=
o has the range
> > > > > > > > > information and double check it?
> > > > > > > >=20
> > > > > > > > As noted above, part of the challenge with forcewake is tha=
t even if the
> > > > > > > > caller knows it wants to access register FOO, and even if i=
t know FOO is
> > > > > > > > a GT register that likely needs forcewake, it's sometimes c=
hallenging to
> > > > > > > > make sure it's grabbing the correct domain(s) for every sin=
gle platform
> > > > > > > > the Xe driver will eventually support if the power manageme=
nt handling
> > > > > > > > changes.  I think that was part of the motivation for encod=
ing the
> > > > > > > > tables into the driver in i915.  It seems like GT power wel=
ls don't
> > > > > > > > change as much these days as they used to, but it's hard to=
 say whether
> > > > > > > > that will continue in the future or not.  Who knows...maybe=
 they'll
> > > > > > > > eventually start creating dedicated domains for stuff like =
blitters,
> > > > > > > > GuC, etc.  rather than lumping all of those into the "GT" c=
atchall
> > > > > > > > domain.
> > > > > > > >=20
> > > > > > > > If we do decide to go back to implicit forcewake handling w=
ith the table
> > > > > > > > encoded into the driver, it might be worth doing something =
sort of like
> > > > > > >=20
> > > > > > > Let's not do this intel_uncore.c is an unreadable mess, I don=
't want
> > > > > > > anything like this in Xe.
> > > > > >=20
> > > > > > When you say unreadable, are you referring to the macros that g=
enerate
> > > > > > the table lookup functions?  I don't think that macro magic wou=
ld be
> > > > > > needed for Xe since we don't have to support old platforms that=
 have
> > > > > > very different forcewake behavior, and we also don't need to ge=
nerate
> > > > > > separate 8-bit, 16-bit, and 32-bit versions of each operation a=
nymore
> > > > > > (since I think everything in the GT is 32-bits these days).
> > > > > >=20
> > > > >=20
> > > > > Just the entire file is unreadable in general, trying to avoid th=
ese
> > > > > types of files in Xe, avoid traps of the i915 did this so let's d=
o it in
> > > > > Xe, and over engineering our driver to avoid hypothetical future =
bugs.
> > > > >=20
> > > > > Matt
> > > > >=20
> > > > > > The forcewake and shadow tables themselves are pretty clean in =
i915
> > > > > > these days, and if we move to autogenerating them from a text f=
ile, they
> > > > > > can become even simpler since the text file will basically be a=
 cleaned
> > > > > > up copy/paste of part of the bspec table.
> > > > > >=20
> > > > > >=20
> > > > > > Matt
> > > > > >=20
> > > > > > >=20
> > > > > > > > what Lucas is doing in the OOB workaround series --- drop t=
he
> > > > > > > > per-platform tables into a human-readable text file that's =
more similar
> > > > > > > > to the format used by the bspec (exact ranges, forcewake do=
main, MCR
> > > > > > > > replication type, etc.) and then provide a small parser pro=
gram that
> > > > > > > > will convert that into actual code (and do things like cons=
olidating
> > > > > > > > adjacent ranges).
> > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > Any other idea? Thoughts?
> > > > > > > >=20
> > > > > > > > Once the big GT vs tile refactor stuff I have in flight get=
s finalized,
> > > > > > > > I plan to follow up with another series that creates a more=
 appropriate
> > > > > > > > MMIO target for register operations rather than using "xe_g=
t" as the
> > > > > > > > target (even for things completely unrelated to the small G=
T subset of
> > > > > > > > hardware).  My idea is that you'd grab an MMIO target struc=
ture for MMIO
> > > > > > > > operations against a specific hardware unit, and then the i=
nfo inside
> > > > > > > > the MMIO structure would be able to figure out if there are=
 additional
> > > > > > > > checks and/or operations it should perform.  E.g.,
> > > > > > > >=20
> > > > > > > >  * mmio =3D xe_mmio_for_device(xe_device *xe);
> > > > > > > >     - Used to submit MMIO operations against the root tile =
of the PCI
> > > > > > > >       device.  Only used during init (e.g., to read the reg=
isters that
> > > > > > > >       tell us which tiles exist on the platform) and during=
 top-level
> > > > > > > >       interrupt enable/disable (since all interrupts are ro=
uted through
> > > > > > > >       the root tile).
> > > > > > > >     - No forcewake needed for register accesses through a h=
andle of this
> > > > > > > >       type since you'd only ever be accessing sgunit regist=
ers for these
> > > > > > > >       types of things.
> > > > > > > >     - Register accesses through mmio can warn on debug buil=
ds if the
> > > > > > > >       register appears to be in a GT-related MMIO range.
> > > > > > > >=20
> > > > > > > >  * mmio =3D xe_mmio_for_display(xe_device *xe);
> > > > > > > >     - Pretty much the same as handles returned by xe_mmio_f=
or_device(),
> > > > > > > >       but if a handle of this type is used to try to read/w=
rite
> > > > > > > >       registers outside the display range, we could have de=
bug builds
> > > > > > > >       throw some extra warnings.
> > > > > > > >     - Unclaimed register detection could be confined to acc=
esses through
> > > > > > > >       these handles.
> > > > > > > >=20
> > > > > > > >  * mmio =3D xe_mmio_for_tile(xe_tile *tile);
> > > > > > > >     - Used to access non-GT registers that reside in a spec=
ific tile.
> > > > > > > >       I.e., sgunit/soc registers.
> > > > > > > >     - As above, no forcewake needed, can make MMIO operatio=
ns warn
> > > > > > > >       if used to access a GT range.
> > > > > > > >=20
> > > > > > > >  * mmio =3D xe_mmio_for_gt(xe_gt *gt);
> > > > > > > >     - Used to access GT registers in a specific GT
> > > > > > > >     - Does automatic GSI offset translation for media GTs
> > > > > > > >     - Can either do automatic forcewake like i915 does, or =
can do debug
> > > > > > > >       check+warn like you have here.
> > > > > > > >     - Can make MMIO operations warn if MMIO offset is outsi=
de GT range
> > > > > > > >     - Can also trigger warnings if a GT non-GSI, non-media =
engine
> > > > > > > >       register is accessed from an MMIO obtained from a med=
ia GT.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > Ack on this if we keep in managable, worried code / feature b=
loat those
> > > > > > > that will result in a similar file to intel_uncore.c in Xe.
> > > >=20
> > > > Just to revive this thread.
> > > >=20
> > > > I've been discussing this proposal in the context of a change we ne=
ed
> > > > to make in the display, which is to introduce a wakelock for some
> > > > registers access in order to be able to remove the DMC trap.
> > > >=20
> > > > We came to the conclusion that this new implementation is very much=
 the
> > > > same as the forcewake proposal here.  From the display point-of-vie=
w,
> > > > we could simply have a new domain and range of registers to protect=
.
> > > >=20
> > > > We _could_ implement a separate "wakelock" mechanism for the displa=
y
> > > > part, but that would be mostly duplicating the entire forcewake
> > > > implementation.
> > > >=20
> > > > So, are there any plans to implement the current proposal? Or any o=
ther
> > > > plans related to the forcewake implementation for Xe? As I see it, =
the
> > > > "wakelock" implementation in the display depends on this.
> > > >=20
> > > > Any thoughts?
> > >=20
> > > Hi Luca, thanks for raising this again here.
> >=20
> > Hi Lucas! Thanks for your comments.
> >=20
> >=20
> > > So, as I said in the past, I don't have strong opinions regarding the
> > > overall forcewake approach.
> > >=20
> > > The since GT MMIO is not used very frequently, I don't see a problem =
of
> > > leaving that up to the caller to take the right domain when needed, o=
r even
> > > the FORCEWAKE_ALL domain. Instead of forcing all the callers to
> > > go through this extra steps and then have to opt-out with the '_fw' [=
sic]
> > > alternatives for the cases where the forcewake cannot be checked unde=
rneath.
> > >=20
> > > So, for the new display wakelocks, that's the problem of adding them =
to
> > > the drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h where the c=
onverions
> > > from i915's intel uncore are happening to xe_mmio? So, when using the
> > > intel_uncore's '_fw' variant you skip the wakelock and when doing the=
 regular
> > > mmio calls you just add a wakelock_get/put around the xe_mmio call wi=
th
> > > the display domain. And in i915 you implement inside the intel_uncore=
.
> > >=20
> > > What's the downside of this approach?
> >=20
> > That's more or less what I was thinking.  I don't think there's any
> > problem on the display side in calling the same framework.
> >=20
> >=20
> > > Trying to understand all the pros and cons of different approaches, a=
nd
> > > bringing some people to the discussion.
> > >=20
> > > If we implement the forwareke underneath the mmio call, display needs
> > > to anyway implement it twice on the i915's intel_uncore and on the
> > > xe_forcewake, no?!
> >=20
> > Yes, IMHO we should start making Xe the base implementation and
> > backporting the new implementation into i915.
> >=20
> > So,for this specific case, I think we can just make i915 call the new
> > functions in xe and have them backported in intel_uncore.h for i915.
> >=20
> > What I was thinking was basically this:
> >=20
> > 1. Implement the xe_mmio_for_<hw_unit>() proposal in Xe=E2=80=8B
>=20
> hmm probably a new component then?! xe_display_wakelock that
> implements and export the get/put domain in a similar way
> of xe_forcewake, and then on the wrapper you add the get/put
> around the existing xe_mmio calls?!

Yes, I guess a new component, but part of Xe.  I don't exactly know
what you mean with "xe_forcewake", but it's the same as Matt proposed
with the different functions for different domains.  These functions
would do everything that is needed for the specific domain, such as
keeping it awake, checking if the registers are in the right range etc.


> > 2. Display code uses new APIs (xe_mmio_for_display ops)=E2=80=8B
> >=20
> > 3. Update uncore to handle "wakelock domain"=E2=80=8B
>=20
> then on uncore you would need to parse the mmio range and then
> call the get and puts, that in that case would be static inside
> the uncore itself like the forcewakes ?!

The callers will use the new Xe APIs, so in i915, the display code (and
probably GT and others too) will be the same as in Xe.  I see it as a
backport.  We can create wrappers that call the uncore APIs to achieve
the same functionality as before.

There are things that we may not need to be backported, for instance,
we don't really need the new wakelock that is needed in LNL (and future
HW), because i915 may not need to support it.  So we can just make a
dummy wrapper for this.  And it should still be easy to properly
backport if needed.

Do you see any problem with this approach?

--
Cheers,
Luca.
