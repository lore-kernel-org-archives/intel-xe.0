Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1796FC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 06:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B446410E975;
	Wed, 19 Jun 2024 06:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbC/4Hzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616BB10E975
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718779270; x=1750315270;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pF5SHYZHSEnW51znRGpSvJfgI1EXHn+ZErQNNO7BOuY=;
 b=RbC/4HztMLQ0z0Kuof9RESpqQJAn4AKfvmR5bmd+Dg8ecchhJ3A8mQir
 8dPvZQjzyVA9Z8WQ9HlRvlziWtvlbM+p2quMwaDA0gTRiNj03vUjYANhp
 /UdyJAeXzrqfC8M/rhBtR0ElVEfN9FuuCAX9Aseu4uJcRPxNyov2SWAGd
 LMzIWg67RJFJTA7BtfPgNiprlECgE7ir5Ns2gE9E/1UKAxNIX7VdNlT88
 VweUP1lDX874vGufGfsDsCrDm03Av/Vjd5tIDHG+2yW9B/Ji+NSIu4Jhc
 lGLdo5xNCZcQIrsEQFfpDNVoVQ0x0+dqFzcbdZIeyuOEzcvwz7LkyXQqW A==;
X-CSE-ConnectionGUID: gmVTmHYTR3+dJlYuNTY2SA==
X-CSE-MsgGUID: LE594NcdQdmHBXO0uM8B7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="38214009"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="38214009"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 23:41:09 -0700
X-CSE-ConnectionGUID: /gwcPQi4TcesfHeZSbao9g==
X-CSE-MsgGUID: ogeYj24URzKFYaVuF2mYDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="73014806"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 23:41:07 -0700
Message-ID: <db44e9c4f5ee7a57ab083772cb7f6684d1a31169.camel@linux.intel.com>
Subject: Re: [RFC 0/3] FW guard class
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 08:40:54 +0200
In-Reply-To: <ZnHtdMLEHFAHMqRr@intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com> <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
 <ZnDHIba3eBe1+p8y@DUT025-TGLU>
 <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
 <ZnHtdMLEHFAHMqRr@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

Hi, Rodrigo,

On Tue, 2024-06-18 at 16:26 -0400, Rodrigo Vivi wrote:
> On Mon, Jun 17, 2024 at 07:54:41PM -0500, Lucas De Marchi wrote:
> > On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
> > > On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
> > > >=20
> > > >=20
> > > > On 17.06.2024 20:00, Rodrigo Vivi wrote:
> > > > > On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost
> > > > > wrote:
> > > > > > On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko
> > > > > > wrote:
> > > > > > > There is support for 'classes' with constructor and
> > > > > > > destructor
> > > > > > > semantics that can be used for any scope-based resource
> > > > > > > management,
> > > > > > > like device force-wake management.
> > > > > > >=20
> > > > > > > Add necessary definitions explicitly, since existing
> > > > > > > macros from
> > > > > > > linux/cleanup.h can't deal with our specific requirements
> > > > > > > yet.
> > > > > > >=20
> > > > > > > This should allow us to use:
> > > > > > >=20
> > > > > > > 	scoped_guard(xe_fw, fw, XE_FW_GT)
> > > > > > > 		foo();
> > > > > > > or
> > > > > > > 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> > > > > > >=20
> > > > > > > without any concern of leaking the force-wake references.
> > > > > > >=20
> > > > > > > Note: this is preliminary code as right now it's unclear
> > > > > > > how to
> > > > > > > correctly handle errors from the force-wake functions.
> > > > > > >=20
> > > > > >=20
> > > > > > I'm personally don't like this at all. IMO it obfuscate the
> > > > > > code with
> > > > > > little real benefit. This is just an opinion though, others
> > > > > > opinions may
> > > > > > differ from mine.
> > > >=20
> > > > except that is more robust than hand-crafted code that is error
> > > > prone,
> > > > like this snippet from wedged_mode_set():
> > > >=20
> > > > 	xe_pm_runtime_get(xe);
> > > > 	for_each_gt(gt, xe, id) {
> > > > 		ret =3D xe_guc_ads(...);
> > > > 		if (ret) {
> > > > 			xe_gt_err(gt, "...");
> > > > 			return -EIO;
> > > > 		}
> > > > 	}
> > > > 	xe_pm_runtime_put(xe);
> > > >=20
> > > > and thanks to PM guard class we could avoid such mistakes for
> > > > free:
> > > >=20
> > > > 	scoped_guard(xe_pm, xe) {
> > > > 		for_each_gt(gt, xe, id) {
> > > > 			ret =3D xe_guc_ads(...);
> > > > 			if (ret) {
> > > > 				xe_gt_err(gt, "...");
> > > > 				return -EIO;
> > >=20
> > > Just responding with a question here - haven't looked at the rest
> > > of the
> > > comments.
> > >=20
> > > How is this not still a bug? Looking at scoped_guard, it appears
> > > to be a
> > > magic macro for loop which acquires / releases a lock or in your
> > > purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the
> > > release
> > > step? I see coding patterns like above in the kernel [1] so I do
> > > assume
> >=20
> > with __attribute__((cleanup)), the compiler guarantees that
> > it's executed when the variable goes out of scope. What you are
> > probably
> > missing is the use of CLASS() declaring a variable inside the for,
> > which
> > uses attribute cleanup:
> >=20
> > 	for (CLASS(_name, scope)(args),
> > 	=C2=A0=C2=A0=C2=A0=C2=A0 ...
> >=20
> > GCC's doc:
> >=20
> > https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
> >=20
> > 	The cleanup attribute runs a function when the variable
> > goes out
> > 	of scope. This attribute can only be applied to auto
> > function
> > 	scope variables; it may not be applied to parameters or
> > 	variables with static storage duration. The function must
> > take
> > 	one parameter, a pointer to a type compatible with the
> > variable.
> > 	The return value of the function (if any) is ignored.
> >=20
> > 	When multiple variables in the same scope have cleanup
> > 	attributes, at exit from the scope their associated
> > cleanup
> > 	functions are run in reverse order of definition (last
> > defined,
> > 	first cleanup).
> >=20
> > 	If -fexceptions is enabled, then cleanup_function is run
> > during
> > 	the stack unwinding that happens during the processing of
> > the
> > 	exception. Note that the cleanup attribute does not allow
> > the
> > 	exception to be caught, only to perform an action. It is
> > 	undefined what happens if cleanup_function does not return
> > 	normally.
> >=20
> > This was only possible with the recent change in the kernel raising
> > the minimum C std to gnu11 (uapi is still c90 for compatibility):
> >=20
> > 	commit e8c07082a810fbb9db303a2b66b66b8d7e588b53
> > 	Author: Arnd Bergmann <arnd@arndb.de>
> > 	Date:=C2=A0=C2=A0 Tue Mar 8 22:56:14 2022 +0100
> >=20
> > 	=C2=A0=C2=A0=C2=A0 Kbuild: move to -std=3Dgnu11
> >=20
> > 	=C2=A0=C2=A0=C2=A0 During a patch discussion, Linus brought up the opt=
ion
> > of changing
> > 	=C2=A0=C2=A0=C2=A0 the C standard version from gnu89 to gnu99, which
> > allows using variable
> > 	=C2=A0=C2=A0=C2=A0 declaration inside of a for() loop. While the C99, =
C11
> > and later standards
> > 	=C2=A0=C2=A0=C2=A0 introduce many other features, most of these are
> > already available in
> > 	=C2=A0=C2=A0=C2=A0 gnu89 as GNU extensions as well.
> >=20
> > > this works, just confused how it works.
> > >=20
> > > With that, any code which isn't easily understandable IMO is a
> > > negative
> > > ROI as it just creates confusion in the long / makes problems
> > > harder to
> > > understand. Again this is just my opinion.
> >=20
> > I think that is mainly about getting used to the pattern. I think
> > we
> > just have to be careful not to overshoot on trying to use
> > everywhere.
> > For example, I don't know why there's already a second use in a
> > separate
> > thread when we are still discussing it on this one.
> >=20
> > A very positive thing is that this is not xe's own invention and
> > comes
> > from core kernel, maybe from the hottest path that is the
> > scheduling and
> > locking. So I very much disagree with arguments raised here about
> > a) this is an alien thing and b) performance will be severely
> > impacted
>=20
> just for the record:
> a) the alien thing is i915's with_runtime_pm... this is part of core
> kernel, so
> it is not an alien thing. I still don't like C++isms, but that is
> just a preference
> not a blocker.
>=20
> b) it is an overhead, but I really doubt that this would impact
> performance.
> Only data would show.
>=20
> >=20
> > I've used __attribute__((cleanup)) in several userspace projects in
> > the
> > past and it does help avoiding problems on the error path that is
> > usually not very well tested (and xe's track record on error path
> > is not
> > very good either: those were the main issues being submitted in
> > drm-xe-fixes
> > for the last release). So if we have a way to improve (and that
> > I've already seen
> > being used successfully), I prefer failing on trying than on
> > repeating
> > the same mistakes.=20
>=20
> Pretty much agreeing here! Specially because this is a Linux core
> kernel
> infra available. Let's try.
>=20
> Cc Nirmoy Das <nirmoy.das@intel.com>
>=20
> who is looking at the forcewake stuff and to solve the flow.
> Specially to get his eyes here and see if this would cover all the
> needed
> cases for the forcewake.
>=20
> If this series were suggesting another with_runtime_pm macro, then I
> would
> push back hard.

Does this mean you think the functionality of "with_runtime_pm" is bad
or the fact that it is driver specific and not part of the core?

Overall, scoped_guard looks fine with me and will probably come in very
handy in some cases, but I don't think it's necessary with a complete
"driver transition" other than when / if it's used for FW, PM etc. For
locks I'm pretty sure that there are callsites where conversion will be
pretty hard. Also need to read up a bit to check how interruptible
locks and trylocks are supported, and if the answer is "they are not"
we must make sure this doesn't for example encourage the use of
uninterruptible mutex locks where they should really be interruptible.

/Thomas

=20



>=20
> > =C2=A0In kmod my only regret is that I didn't start it
> > earlier, during the bootstrap of the project.
> >=20
> >=20
> > Lucas De Marchi
> >=20
> >=20
> > >=20
> > > Matt
> > >=20
> > > [1]
> > > https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323=
/bmi323_core.c#L1544
> > >=20
> > > > 			}
> > > > 		}
> > > > 	}
> > > >=20
> > > > >=20
> > > > > Well, on the positive side, it is not adding a driver only
> > > > > thing like
> > > > > i915's with_runtime_pm() macro.
> > > > >=20
> > > > > But I'm also not sure if I like the overall idea anyway:
> > > > >=20
> > > > > - I don't like adding C++isms in a pure C code. Specially
> > > > > something not
> > > > > so standard and common that will decrease the ramp-up time
> > > > > for newcomers.
> > > >=20
> > > > does it mean that the use of other guard patterns seen
> > > > elsewhere in the
> > > > tree is now prohibited on the Xe driver ? like:
> > > >=20
> > > > 	scoped_guard(mutex, &lock)
> > > > 		foo();
> > > >=20
> > > > 	scoped_guard(spinlock, &lock)
> > > > 		foo();
> > > > 	...
> > > >=20
> > > > > - It looks like and extra overhead on the object creation
> > > > > destruction.
> > > >=20
> > > > from cleanup.h doc is sounds there is none:
> > > >=20
> > > > =C2=A0"And through the magic of value-propagation and dead-code-
> > > > elimination,
> > > > it eliminates the actual cleanup call and compiles into:"
> > > >=20
> > > >=20
> > > > > - It looks not flexible for handling different cases... like
> > > > > forcewake for
> > > > > instance where we might want to ignore the ack timeout in
> > > > > some cases.
> > > >=20
> > > > there is scoped_cond_guard() that likely will be able to deal
> > > > with it,
> > > > but I guess we first need to cleanup existing force_wake api as
> > > > expected
> > > > flow is not clear and there are different approaches in the
> > > > driver how
> > > > to deal with errors
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > Matt
> > > > > >=20
> > > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > >=20
> > > > > > > Michal Wajdeczko (3):
> > > > > > > =C2=A0 drm/xe: Introduce force-wake guard class
> > > > > > > =C2=A0 drm/xe: Use new FW guard in xe_mocs.c
> > > > > > > =C2=A0 drm/xe: Use new FW guard in xe_pat.c
> > > > > > >=20
> > > > > > > =C2=A0drivers/gpu/drm/xe/xe_force_wake.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 48
> > > > > > > +++++++++++++++++++
> > > > > > > =C2=A0drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
> > > > > > > =C2=A0drivers/gpu/drm/xe/xe_mocs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +----
> > > > > > > =C2=A0drivers/gpu/drm/xe/xe_pat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 60 ++++++++--
> > > > > > > --------------
> > > > > > > =C2=A04 files changed, 82 insertions(+), 50 deletions(-)
> > > > > > >=20
> > > > > > > --
> > > > > > > 2.43.0
> > > > > > >=20

