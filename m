Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EC2C79F9F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E73610E745;
	Mon,  7 Sep 2026 09:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvIivssq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2345210E48C;
 Mon,  7 Sep 2026 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788775020; x=1820311020;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=S2raniGDi71Asji58FRRIViOQ3o+ZwHFYaD4zbrCI9w=;
 b=JvIivssq3LEOiw0dSq8cHQmmF5lKnSElRfN4+UtzPR7CIkf64cWQ3VlI
 HcC2glbJtLDv+VUO6L71H+7DgVkTpeEHJArkZ/PU0nJKpHeZTr5SQhjbj
 on7iOTjtBfBRuz9vURMs/1+9SUpz9DZQnNo6ey5VAGeh2Xot2zdJCfV8L
 4x5WpmNpjaWaNrbr+YoCQJ7IQw9dVT4ky+iP9VOWN2oFtIch8UQ2l2htD
 UDw4EwRrHRuF7jUj66IXB3s6ToeN2hTXxS7pcJft0PIzNreOUOTh/idxo
 aXhLEDpu5OMHjuq4NZ5NGBWw0Gt0BYOrteJizrRvEXB6glP+Nblx9lVxR A==;
X-CSE-ConnectionGUID: 7rKiZhAtQf+UmVG/dtBdJg==
X-CSE-MsgGUID: apUvU3IlRfea41nP0WyowQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89104855"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89104855"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:57:00 -0700
X-CSE-ConnectionGUID: iuL52Z8YTiCiPk+14EJzTg==
X-CSE-MsgGUID: PMlpGgAlQfWNoWcqmia5hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="300550985"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:56:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported pipes
In-Reply-To: <MW4PR11MB68875FF691238037309DD2CAE3B22@MW4PR11MB6887.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260904062744.3010375-1-nemesa.garg@intel.com>
 <9514a15f9ded3fa79572f92a61f33650c4ab02e6@intel.com>
 <MW4PR11MB68875FF691238037309DD2CAE3B22@MW4PR11MB6887.namprd11.prod.outlook.com>
Date: Mon, 07 Sep 2026 12:56:55 +0300
Message-ID: <8ff50197b06bfab7e228805760acf7f793f80248@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 07 Sep 2026, "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Friday, September 4, 2026 12:41 PM
>> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org;
>> intel-xe@lists.freedesktop.org
>> Cc: Garg, Nemesa <nemesa.garg@intel.com>
>> Subject: Re: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported
>> pipes
>> 
>> On Fri, 04 Sep 2026, Nemesa Garg <nemesa.garg@intel.com> wrote:
>> > Commit 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
>> > plane disable") started clearing SEL_FETCH_PLANE_CTL and
>> > SEL_FETCH_CUR_CTL on every plane and cursor disable.
>> >
>> > Not all pipes implement these registers. Clearing them on a pipe that
>> > does not have them leads to an unclaimed register access.
>> 
>> Where are the corresponding checks on the enable side, and what prevented
>> this before 7f1172a2ac0d?
>> 
> I will send a new patch where I am checking if its enabled then only we should disable it otherwise
> no action needed.

That doesn't really answer my question, does it?

BR,
Jani.


>
> Thanks and Regards,
> Nemesa
>
>> BR,
>> Jani.
>> 
>> >
>> > Skip the clear on pipes that do not implement the registers.
>> >
>> > Fixes: 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
>> > plane disable")
>> > Closes:
>> > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876
>> > Assisted-by: GitHub-Copilot:claude-opus-4.6
>> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_cursor.c        | 4 ++++
>> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 4 ++++
>> >  2 files changed, 8 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c
>> > b/drivers/gpu/drm/i915/display/intel_cursor.c
>> > index 86bb96ac449b..3c06d5482691 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_cursor.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
>> > @@ -544,6 +544,10 @@ static void
>> i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
>> >  	if (!HAS_PSR2_SEL_FETCH(display))
>> >  		return;
>> >
>> > +	/* Display ver 12 only instantiates these registers for pipe A */
>> > +	if (DISPLAY_VER(display) == 12 && pipe != PIPE_A)
>> > +		return;
>> > +
>> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0);  }
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > index 5cda1ab90e40..252df30debc9 100644
>> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > @@ -893,6 +893,10 @@ static void icl_plane_disable_sel_fetch_arm(struct
>> intel_dsb *dsb,
>> >  	if (!HAS_PSR2_SEL_FETCH(display))
>> >  		return;
>> >
>> > +	/* Display ver 12 only instantiates these registers for pipe A */
>> > +	if (DISPLAY_VER(display) == 12 && pipe != PIPE_A)
>> > +		return;
>> > +
>> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe,
>> > plane->id), 0);  }
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
