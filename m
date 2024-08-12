Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E473C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 13:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1896710E226;
	Mon, 12 Aug 2024 13:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gw4sEvdP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEAC10E226
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723471112; x=1755007112;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=NQjEKE61oUIjY/ZRFUbrG+n8bTrFfRRVQi+6qHJy8xU=;
 b=Gw4sEvdPPAjuB5Heafp8EUS58QCb+T9ue3dcEfUE7ECNWI0gc3TOgrP9
 dVcHS/ExLXvxTNnLn09fMUldUw621DL41UPFzZsSZyGEqXcD673Ai7F1b
 0CPCbBdrsqLNbPTU3l42doE5nOyzaB1NTONOgBcocIJCp03/MaEpKQe+e
 m/vOUhLccf5+iTuwj+gBzTpAP0ElvbK0j99+EsShMvAa4w2p7lsF4bRdB
 EE8p+n4oW/HQAq8BTjc27ubgnG3fO6VsdBoQM1JsduG4fagVrBN91TTUy
 cNIi3a5RTtzquF44Ps3PceKMLjSoLIgil8v93335d8IqbKocwZFyBEJK8 A==;
X-CSE-ConnectionGUID: nNXQY7+sR+uR52OxH3joGA==
X-CSE-MsgGUID: H0w28yxZS8mMrcL0vVrCmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32204930"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="32204930"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:58:32 -0700
X-CSE-ConnectionGUID: 3lB2DXEXT76PLvBuar+edA==
X-CSE-MsgGUID: dsHnoTDJRvOJV/6lUBtXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="62925402"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:58:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe2hpg: Add Wa_14021821874
In-Reply-To: <MN0PR11MB62089AAB6D089B844091CC5281852@MN0PR11MB6208.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812070251.796744-1-tejas.upadhyay@intel.com>
 <b649bd68-1bb2-4f5a-aab5-f9345a145e83@intel.com>
 <MN0PR11MB62089AAB6D089B844091CC5281852@MN0PR11MB6208.namprd11.prod.outlook.com>
Date: Mon, 12 Aug 2024 16:58:27 +0300
Message-ID: <87o75x267w.fsf@intel.com>
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

On Mon, 12 Aug 2024, "Upadhyay, Tejas" <tejas.upadhyay@intel.com> wrote:
>> -----Original Message-----
>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Sent: Monday, August 12, 2024 1:18 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: Re: [PATCH] drm/xe/xe2hpg: Add Wa_14021821874
>>=20
>>=20
>>=20
>> On 12-08-2024 12:32, Tejas Upadhyay wrote:
>> > Wa_14021821874 applies to xe2_hpg
>> >
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > ---
>> >   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>> >   drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>> >   2 files changed, 5 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index 2c8c4d4218db..9054253f6aaa 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -451,6 +451,7 @@
>> >   #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>> >
>> >   #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4,
>> XE_REG_OPTION_MASKED)
>> > +#define	  STK_ID_RESTRICT			REG_BIT(12)
>>=20
>> Nit: space instead of tab ?
>
> Thanks for comment. Its not tab, spaces only. Also strict checkpatch
> is clean. Locally it looks ok, don=E2=80=99t know why it looks like tab h=
ere
> on mailing list.

I presume your editor hides it somehow. There's definitely a tab in the
patch. Try adding spaces at column 0 and see how it behaves.

checkpatch wouldn't complain about spaces after a tab for indentation,
only about tabs after spaces.

BR,
Jani.


>
> Thanks,
> Tejas
>>=20
>> Patch LGTM.
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>=20
>>=20
>> >   #define   SLM_WMTP_RESTORE			REG_BIT(11)
>> >
>> >   #define ROW_CHICKEN				XE_REG_MCR(0xe4f0,
>> XE_REG_OPTION_MASKED)
>> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> > index 564e32e44e3b..28b7f95b6c2f 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa.c
>> > +++ b/drivers/gpu/drm/xe/xe_wa.c
>> > @@ -542,6 +542,10 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
>> >   	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
>> ENGINE_CLASS(RENDER)),
>> >   	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>> CLEAR_OPTIMIZATION_DISABLE))
>> >   	},
>> > +	{ XE_RTP_NAME("14021821874"),
>> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
>> FUNC(xe_rtp_match_first_render_or_compute)),
>> > +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
>> > +	},
>> >
>> >   	/* Xe2_LPM */
>> >

--=20
Jani Nikula, Intel
