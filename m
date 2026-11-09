Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82116606A322
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WWyBdNbO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4D10E10A;
	Mon,  9 Nov 2026 12:23:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D5E10E10A
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794226983; x=1825762983;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mNOxuWg6C5oAL1+lHmy3CAn7v/FdR38x0IxWz31RSpo=;
 b=WWyBdNbO2b6PimKmoVHnVqCIOtkq0micLj/lUxj7APub/U7/eKnlgO/m
 TNIjVfjq072pmiW319iFeG0mUW4QwnvxCxRrBl3I4dQTLDz42PrbOlEkb
 oJJqWBB6oBIMdRJMg+WIHX14B3J6ixmBPk9Ap51P6M6eePqc53w+fTde0
 Azh+/gvm8By+ib+ejdE82hBtsllq6dRoREZPr0BvAlEAs223lCfSogzHe
 v4+UpdHIbEKJE1XMwmTcel0wW3JzcH3C7RcoRiPPxHWwPG/3qVBTxvcsp
 eLtXlXFnZRvY/TlLUg8NJ4PMkPzHAn1p66vWhjVtL4mLjK1jPZAYtDAwM g==;
X-CSE-ConnectionGUID: FLKV+hPaQguYLnWhglzauQ==
X-CSE-MsgGUID: h+kjkmwGRTObl9pGKaNEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2839819"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2839819"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:23:03 -0800
X-CSE-ConnectionGUID: Dj+Xwvx4StiyiH6yWC4oBw==
X-CSE-MsgGUID: MVjL881BT8WsZkx4Db+78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9628784"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:23:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/xe: Use intel_display_gse_irq_handler()
In-Reply-To: <avG5Zm_5f_q8Kdgk@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-5-ville.syrjala@linux.intel.com>
 <07539696cef399115faedc5d3f84439e7d22207a@intel.com>
 <avG5Zm_5f_q8Kdgk@intel.com>
Date: Mon, 09 Nov 2026 14:22:58 +0200
Message-ID: <1c47a450915aef0eefdedf56656fd77359c7f76c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 09 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Nov 09, 2026 at 02:05:08PM +0200, Jani Nikula wrote:
>> On Mon, 09 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >
>> > Replace the direct intel_opregion_asle_intr() call with the
>> > new intel_display_gse_irq_handler() abstraction. We don't
>> > want to leak random opregion symbols out from the display
>> > code.
>>=20
>> This depends on [1] which I don't think is merged yet?
>
> It's in drm-intel-next. Need to remember to postpone this
> one when pushing the rest to drm-xe-next.

So it is, my bad.

I think patch 4 is independent of 1-3, and could be merged right away
via drm-intel-next, as is usual for display patches. Right?

BR,
Jani.

>
>>=20
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>>=20
>> [1] https://lore.kernel.org/r/20261105203427.8696-3-ville.syrjala@linux.=
intel.com
>>=20
>> >
>> > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm=
/xe/display/xe_display.c
>> > index 21692408f9be..0236f69a0f88 100644
>> > --- a/drivers/gpu/drm/xe/display/xe_display.c
>> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> > @@ -220,7 +220,7 @@ void xe_display_gse_irq_handler(struct xe_device *=
xe, u32 gu_misc_iir)
>> >  		return;
>> >=20=20
>> >  	if (gu_misc_iir & GU_MISC_GSE)
>> > -		intel_opregion_asle_intr(display);
>> > +		intel_display_gse_irq_handler(display);
>> >  }
>> >=20=20
>> >  void xe_display_irq_reset(struct xe_device *xe)
>>=20
>> --=20
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
