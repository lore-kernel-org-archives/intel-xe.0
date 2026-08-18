Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31ABC5DF67
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 06:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C9E10E20C;
	Tue, 18 Aug 2026 06:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIfFy+fa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091E210E20C;
 Tue, 18 Aug 2026 06:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787036243; x=1818572243;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yp5oytL22Z4cRl/MvOKRs3ODzeTygL7I7qcs2Lwm7Is=;
 b=GIfFy+faoEu7o9b2O830fe8Nb44jTLzeunDJFZmTbFRl0O05hhTGrSc9
 Odvadx/HCdghLrVJcdbA/v6/L4RDrumt9+auQExDdV0/RzEPxhEBPCJ9O
 csnUyNJpz2OAQlP2KW12XwJFUi9t9GVomQ3w9pItY+3yKhZxC/6Hf3c0b
 +YVcMn7eu+HPk1mg35Vb89tOlPgMZXo2RPE9oIAEeG9a5nMWEXUrxVebe
 YMd/AjOO1VunLuV92fG15ZdDdRG1Tks31kshxnWft36szAiGPr76H3gI6
 eA1RM23dNiGKb8IxEsD1mbJwPdehaVMDRQpoTeVLs9KbBO1yelecpi61M g==;
X-CSE-ConnectionGUID: ldMRrr/ZRfWKfT6TC+cT6g==
X-CSE-MsgGUID: LHi6JeWPQhC55V+dtzxqdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="104901998"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="104901998"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:57:19 -0700
X-CSE-ConnectionGUID: QZ6eJEiZQ1O/GQkrrZO1iw==
X-CSE-MsgGUID: M6Il0K5WQwqxxfGJrYLU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263814633"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:57:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [RFC PATCH 2/5] drm/i915/display: add pme_capable() to the
 parent interface
In-Reply-To: <38839928b5b5147989959741068c001ce180eb0b.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
 <20260816224005.886035-3-vinod.govindapillai@intel.com>
 <bb80200efea31ed150318deaa8622d8efddb2666@intel.com>
 <38839928b5b5147989959741068c001ce180eb0b.camel@intel.com>
Date: Tue, 18 Aug 2026 09:57:12 +0300
Message-ID: <4ebf5d30d16433745c38247233178f67a1b8ad93@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 18 Aug 2026, "Govindapillai, Vinod" <vinod.govindapillai@intel.com>=
 wrote:
> On Mon, 2026-08-17 at 13:19 +0300, Jani Nikula wrote:
>> On Mon, 17 Aug 2026, Vinod Govindapillai
>> <vinod.govindapillai@intel.com> wrote:
>> > Add a provision to query the optional pme_capability to the parent
>> > interface so that it could be called independently from xe or i915
>> > based on the implementation.
>>=20
>> But do we need this? Display has all the information to call
>> pci_dev_run_wake() directly, without going through the parent
>> interface.
>>=20
>> The only difference is this is not being set up for i915.
>
> Ok. Yeah pci_dev_run_wake() should handle this properly. But because
> the platform support for the pme is added from NVL, I thought of this
> approach.=20
>
> So you are suggesting something like this?
>
> if (pci_dev_run_wake()), avoid start HPD polling directly in the=20
> intel_display_driver::intel_display_driver_pm_runtime_suspend()?

See my other replies: can we hide this inside intel_hotplug.c?

BR,
Jani.



>
> Or use a wrapper to check the pme_capability.
>
> BR
> Vinod=20
>
>> BR,
>> Jani.
>>=20
>> >=20
>> > Assisted-by: GitHub_Copilot:claude-opus-5
>> > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> > ---
>> > =C2=A0drivers/gpu/drm/i915/display/intel_display_rpm.c | 7 +++++++
>> > =C2=A0drivers/gpu/drm/i915/display/intel_display_rpm.h | 1 +
>> > =C2=A0include/drm/intel/display_parent_interface.h=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 +
>> > =C2=A03 files changed, 9 insertions(+)
>> >=20
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_rpm.c
>> > b/drivers/gpu/drm/i915/display/intel_display_rpm.c
>> > index 0a331f89b4db..73d85384474e 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_rpm.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_rpm.c
>> > @@ -46,6 +46,13 @@ bool intel_display_rpm_suspended(struct
>> > intel_display *display)
>> > =C2=A0	return display->parent->rpm->suspended(display->drm);
>> > =C2=A0}
>> > =C2=A0
>> > +bool intel_display_rpm_pme_capable(struct intel_display *display)
>> > +{
>> > +	const struct intel_display_rpm_interface *rpm =3D display-
>> > >parent->rpm;
>> > +
>> > +	return rpm->pme_capable && rpm->pme_capable(display->drm);
>> > +}
>> > +
>> > =C2=A0void assert_display_rpm_held(struct intel_display *display)
>> > =C2=A0{
>> > =C2=A0	display->parent->rpm->assert_held(display->drm);
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_rpm.h
>> > b/drivers/gpu/drm/i915/display/intel_display_rpm.h
>> > index 6ef48515f84b..2d4071fb9282 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_rpm.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_rpm.h
>> > @@ -21,6 +21,7 @@ void intel_display_rpm_put(struct intel_display
>> > *display, struct ref_tracker *wa
>> > =C2=A0
>> > =C2=A0/* Only for special cases. */
>> > =C2=A0bool intel_display_rpm_suspended(struct intel_display *display);
>> > +bool intel_display_rpm_pme_capable(struct intel_display *display);
>> > =C2=A0
>> > =C2=A0void assert_display_rpm_held(struct intel_display *display);
>> > =C2=A0void intel_display_rpm_assert_block(struct intel_display
>> > *display);
>> > diff --git a/include/drm/intel/display_parent_interface.h
>> > b/include/drm/intel/display_parent_interface.h
>> > index d7d06dcaa699..563de403b102 100644
>> > --- a/include/drm/intel/display_parent_interface.h
>> > +++ b/include/drm/intel/display_parent_interface.h
>> > @@ -196,6 +196,7 @@ struct intel_display_rpm_interface {
>> > =C2=A0	void (*put_unchecked)(const struct drm_device *drm);
>> > =C2=A0
>> > =C2=A0	bool (*suspended)(const struct drm_device *drm);
>> > +	bool (*pme_capable)(const struct drm_device *drm); /*
>> > Optional */
>> > =C2=A0	void (*assert_held)(const struct drm_device *drm);
>> > =C2=A0	void (*assert_block)(const struct drm_device *drm);
>> > =C2=A0	void (*assert_unblock)(const struct drm_device *drm);
>>=20
>

--=20
Jani Nikula, Intel
