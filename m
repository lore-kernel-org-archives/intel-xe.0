Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD69CD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 15:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ADD1124D2;
	Thu,  4 Jun 2026 15:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5BFR205";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA571124C8;
 Thu,  4 Jun 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780585957; x=1812121957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O4bH4kWajuZMw5TFa3rROCfr35wkPeI2yL9uE2TQwbA=;
 b=e5BFR205uLj8NOTy+yDBTlrjnPmZYqAATOtF7P22eHdZsngVLMgu3uNe
 FYI78/ww51OMHJNYU1pJl8WF0dY1qkSBbqcGzRk61CJ4SeGGJV8oghs10
 QrkFuLafx699QeCf/6xpJpk18V6YGthXhV33qHVIyEEgONrb4JhceTlLf
 qwJrXIkKPTBQ3Ii5NXgRxZosAW8TpcmxX2GRXHwC4I3ZE12d8yupldJrr
 WlEISQR0xctqkhOTXGaV9zeBnoafzHKz4Jn8U7nimh/uZt8bAm7coR4n/
 CA2VojzC2673Y/FnoL1H66hgo9d4MlT06e1tuhHJuy1dWnFFESLEB7SGh Q==;
X-CSE-ConnectionGUID: TjHsN569SneV64DCjXlocQ==
X-CSE-MsgGUID: b8UGaITwQI2uBtmbGwn/og==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="91988945"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="91988945"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 08:12:37 -0700
X-CSE-ConnectionGUID: jpm/r4FySbehjZmWgQqYQw==
X-CSE-MsgGUID: 7qBU4RQqSf6E1o8NAXj3ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="240383441"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.98])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 08:12:35 -0700
Date: Thu, 4 Jun 2026 18:12:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] drm/i915/bw: Use icl_qgv_bw()
Message-ID: <aiGV4NpQtyhCN4ct@intel.com>
References: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
 <20260528103458.18069-11-ville.syrjala@linux.intel.com>
 <8c3c70565faba998122b8092b3f3d3783328e53f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c3c70565faba998122b8092b3f3d3783328e53f.camel@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Jun 04, 2026 at 02:59:09PM +0000, Govindapillai, Vinod wrote:
> On Thu, 2026-05-28 at 13:34 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Replace a hand rolled copy of icl_qgv_bw() with the real thing.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_bw.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_bw.c
> > b/drivers/gpu/drm/i915/display/intel_bw.c
> > index f4121223a58b..423cae2ff208 100644
> > --- a/drivers/gpu/drm/i915/display/intel_bw.c
> > +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> > @@ -1106,14 +1106,8 @@ static int mtl_find_qgv_points(struct
> > intel_display *display,
> >  	 * offered per plane group
> >  	 */
> >  	for (i = 0; i < num_qgv_points; i++) {
> > -		unsigned int bw_index =
> > -			tgl_max_bw_index(display, num_active_planes,
> > i);
> > -		unsigned int max_data_rate;
> > -
> > -		if (bw_index >= ARRAY_SIZE(display->bw.max))
> > -			continue;
> > -
> > -		max_data_rate = display-
> > >bw.max[bw_index].deratedbw[i];
> > +		unsigned int max_data_rate =
> > +			icl_qgv_bw(display, num_active_planes, i);
> >  
> >  		if (max_data_rate < data_rate)
> >  			continue;
> 
> Wonder if this could be squashed to patch 3 in the series for
> completeness.

This has nothing to do with that other patch.

> 
> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

-- 
Ville Syrjälä
Intel
