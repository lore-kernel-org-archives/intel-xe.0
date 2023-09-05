Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD630CA0FE9
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 15:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0D410E0C1;
	Tue,  5 Sep 2023 15:39:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9C10E0C1
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693928354; x=1725464354;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=klx0GA8pai6WnQ3+t4zPdqVyVhQEQ/+MOMrWAn/2d9I=;
 b=eh0gC5j4IUxvRB+VwIX/fspCuMt5KDpITvRqoZHk6lxfI9gfhYsEpkud
 9Gr5TnOBXQDLOmyTnpvIrKAoT7GGGfahpBC6WdImgRuuRyRP2nmgzziHW
 PfdQQkPjs1vd/pNwhd6W8i2eB7abxGrVRibARTs7ZLUnw8joMEpkxJU5g
 csWpqVPSKVSOHs5WP6xFCmf7gaKEM4HfvBCOqB5bPt5Wl5jiQZGRdWWop
 PnVvB4W3D/l06dF2BMROh7ZPULvmJ2X4Zw0tCmn/5fqCm90eD5gaLIMDM
 s421Mpcpm2A2QIcWEhoPs4goA/qqxxvzcQ0v/lZoBySoGbEWq5i+vJvm2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="374219432"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="374219432"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 08:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="864755948"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="864755948"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.152])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 08:39:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
In-Reply-To: <ZPclzYMmBovI4VlQ@fdugast-desk.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230901160300.7-1-francois.dugast@intel.com>
 <87cyyyi6x9.fsf@intel.com> <ZPclzYMmBovI4VlQ@fdugast-desk.home>
Date: Tue, 05 Sep 2023 18:39:07 +0300
Message-ID: <871qfciq90.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Use acpi_target_system_state
 only if ACPI_SLEEP is enabled
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

On Tue, 05 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> On Mon, Sep 04, 2023 at 01:12:02PM +0300, Jani Nikula wrote:
>> On Fri, 01 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
>> > This fixes the build when ACPI_SLEEP is disabled.
>>=20
>> What is the build failure exactly? It's usually helpful to copy-paste
>> the error in the commit message.
>
> Sure, I will add it to the commit message in the next revision. Here it i=
s:
>
> drivers/gpu/drm/xe/xe_display.c:334:23: error: implicit declaration of fu=
nction =E2=80=98acpi_target_system_state=E2=80=99; did you mean =E2=80=98ac=
pi_get_system_info=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   334 |         bool s2idle =3D acpi_target_system_state() < ACPI_STATE_S=
3;
>
>>=20
>> acpi_target_system_state() should evaluate to ACPI_STATE_S0 for
>> CONFIG_ACPI_SLEEP=3Dn, and the changes here would be unnecessary.
>>=20
>> Most likely the problem is CONFIG_ACPI=3Dn leading to <acpi/acpi_bus.h>
>> not being included at all, and the function not being present. Directly
>> including <acpi/acpi_bus.h> would be the cleaner fix.
>
> It seems that with CONFIG_ACPI_SLEEP=3Dn, acpi_target_sleep_state evaluat=
es to
> ACPI_STATE_S0 but acpi_target_system_state is not defined as it is compil=
ed out
> in acpi/sleep.c, which causes the error above. Including <acpi/acpi_bus.h=
> does
> not help.

Meh. I was lookig at sleep.h defining it as static inline for
CONFIG_ACPI_SLEEP=3Dn:

#ifdef CONFIG_ACPI_SLEEP
u32 acpi_target_system_state(void);
#else
static inline u32 acpi_target_system_state(void) { return ACPI_STATE_S0; }
#endif

But the whole thing is wrapped inside #ifdef CONFIG_ACPI.

i915_driver.c has a wrapper for this, suspend_to_idle(). I guess have to
mimic that then to not duplicate the #ifdefs.


BR,
Jani.


>
> Regards,
> Francois
>
>>=20
>> BR,
>> Jani.
>>=20
>> >
>> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_display.c | 14 ++++++++++++--
>> >  1 file changed, 12 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_d=
isplay.c
>> > index b6b547c4877c..54f52b6d702d 100644
>> > --- a/drivers/gpu/drm/xe/xe_display.c
>> > +++ b/drivers/gpu/drm/xe/xe_display.c
>> > @@ -331,7 +331,12 @@ static void intel_suspend_encoders(struct xe_devi=
ce *xe)
>> >=20=20
>> >  void xe_display_pm_suspend(struct xe_device *xe)
>> >  {
>> > -	bool s2idle =3D acpi_target_system_state() < ACPI_STATE_S3;
>> > +	bool s2idle;
>> > +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
>> > +	s2idle =3D acpi_target_system_state() < ACPI_STATE_S3;
>> > +#else
>> > +	s2idle =3D true;
>> > +#endif
>> >  	if (!xe->info.enable_display)
>> >  		return;
>> >=20=20
>> > @@ -360,7 +365,12 @@ void xe_display_pm_suspend(struct xe_device *xe)
>> >=20=20
>> >  void xe_display_pm_suspend_late(struct xe_device *xe)
>> >  {
>> > -	bool s2idle =3D acpi_target_system_state() < ACPI_STATE_S3;
>> > +	bool s2idle;
>> > +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
>> > +	s2idle =3D acpi_target_system_state() < ACPI_STATE_S3;
>> > +#else
>> > +	s2idle =3D true;
>> > +#endif
>> >  	if (!xe->info.enable_display)
>> >  		return;
>>=20
>> --=20
>> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
