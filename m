Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA28DC25B4F
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 09:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD4B10E303;
	Fri, 10 May 2024 09:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fioakwnb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881BD10E303
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715332204; x=1746868204;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:subject:from:to:message-id:date;
 bh=kUQ7eUUX6UBmoXoQpCwl4G0bJlmL+hymN2y/qSCOuRc=;
 b=FioakwnbhrtCsO0799JHoK/y/zscVPV6LcgF3FiowIfArN7fF4zpgmTs
 huPkEeir7BpI2Aa13zUGfg4wV8SOmV9/NxRSxfmtwl0I808e16iEhzXW9
 oZxeDhaO0i50WWYSU/fFyYs5URBtOu8kK/5xGq/RC27BFpecjOOUr0rzl
 p77xZr7IVQVjnkesunWemWDoPdfM/PixyWjMk3WpgoQa3ljG4PYX2fzue
 mXIAh5Q/dgwjU6+b5QWeyprIR3HMqLPmeHxuefDHN5gfn05kY5PUZSmva
 WiAqi9rwD9DwvsDJoKwwuMGaqtYYh8JlTOJQYMGEpFikeTdXgalGykkZA g==;
X-CSE-ConnectionGUID: sezJnUyuQfaZ1DA8PFqSMQ==
X-CSE-MsgGUID: V0ogrsUzR7S17s2Szex8cA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11153661"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="11153661"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 02:10:04 -0700
X-CSE-ConnectionGUID: Lwr42KaSRbqADj//8Uoggg==
X-CSE-MsgGUID: xLx3O0LTRpy5SVFidQB+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="60407055"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 02:10:01 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZjzzKwMHFjdQaG7m@DUT025-TGLU.fm.intel.com>
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
 <27iutedmzaotadr7fhnqhvy6naydrsqstgarjmqa4ltmlsowix@bn7n2shccrgd>
 <ZjzzKwMHFjdQaG7m@DUT025-TGLU.fm.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <171533219643.7531.15603783689137370423@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 10 May 2024 12:09:56 +0300
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

Quoting Matthew Brost (2024-05-09 19:00:43)
> On Wed, May 08, 2024 at 08:06:52AM -0500, Lucas De Marchi wrote:
> > On Mon, May 06, 2024 at 07:04:47PM GMT, Himal Prasad Ghimiray wrote:
> > > Remove the min/max configs and change minimum values of preemption and
> > > timeslice to 0. The sysman teams must deactivate preemption and
> > > timeslice to assess exclusivity mode. They depend on configuring
> > > timeslice_duration_us and preempt_timeout_us to 0, ensuring these
> > > values are set at their minimum.
> >=20
> > nack for now, based on this explanation. See below.
> >=20
> > >=20
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

<SNIP>

> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -10,41 +10,17 @@
> > >=20
> > > struct drm_printer;
> > >=20
> > > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > -#else
> > > #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > -#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > -#else
> > > #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> >=20
> > previously one could configure a kernel with a different max.
> > And now it's hardcoded. How is this better and related to the
> > motivation in the commit message?
> >=20
> > is this commit doing 2 different things?
> >=20
> > 1) Removing the _MAX from config since nobody is or should change that
> > 2) Modify the min value to 0... That seems weird as basically there is
> >    no minimum.
>=20
> This is true.

Maybe I've missed some discussion but what is wrong with the previously
agreed approach where KConfig would determine hard _MIN/_MAX bounds
(and maybe _DEFAULT) that the kernel can work with, then there would be
sysfs min/max (+ default) which the sysadmin sets as comfortable with
considering the expected use-cases on the system and application then
choose within those bounds (if it wants expedited hang detection for an
example)?

> > I'd like to hear Matt Brost's opinion on that.
>=20
> I chatted with Lucas and second his nack. The requirements for this
> change are coming from sysman and are unclear. If sysman needs to set
> this to 0 (akin to no maximum), why can't sysman build the kernel with a
> Kconfig to allow this? This use case appears to be an HPC/AI data center
> scenario in which the kernel is probably built with a non-standard
> Kconfig anyway. Why can't CONFIG_DRM_*_MIN be set to zero? This needs to
> be addressed clearly and publicly.

I also thought we agreed on doing different build for such scenario
where the interactive desktop is not expected to be used, so larger
delays are more allowable.

The default build simply can't allow unlimited blocking of the HW by
certain workloads in order to make sure the desktop/compositor stays
operational. That can only be enabled by default build when the long-running
workloads can be isolated so they won't interfere with the workloads
using dma-fences. And I don't think that code exists yet.

Sysman should be able to report a feature missing from the kernel if it
detects that it can't set the limits wanted. This can be reported to
user via error code and/or error message asking to install a different
kernel build.

Same strategy has been applied in the past for various kernel features
like realtime/virtualization etc.=20

Regards, Joonas

>=20
> Matt
> =20
> >=20
> > Lucas De Marchi
> >=20
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
> > > -#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> > > -#else
> > > -#define XE_HW_ENGINE_TIMESLICE_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
> > > -#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> > > -#else
> > > +#define XE_HW_ENGINE_TIMESLICE_MIN 0
> > > #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
> > > -#endif
> > > #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > > #else
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> > > #endif
> > > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEO=
UT_MIN
> > > -#else
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEO=
UT_MAX
> > > -#else
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> > > -#endif
> > >=20
> > > int xe_hw_engines_init_early(struct xe_gt *gt);
> > > int xe_hw_engines_init(struct xe_gt *gt);
> > > --=20
> > > 2.25.1
> > >=20
