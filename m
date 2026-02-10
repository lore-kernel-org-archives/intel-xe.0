Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5955EB26E9
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 16:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AAD10E171;
	Tue, 10 Feb 2026 16:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j895ECCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D752410E171;
 Tue, 10 Feb 2026 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770741589; x=1802277589;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aAvVYjl6DawTN0v8POMG8q4x0T3yehEuSmeiJNP1Ep4=;
 b=j895ECCruhhoPMcUw6gKc/n3ew9FsN64eZiAn6oCvbwr8yx5xO2Nom1O
 A184TLXYTdwDCs+k06JkTJlWSGNlCl6mnEePZHgBkKvYL/mR5pcEgUxCu
 op+IM7Qv51fwGoiKDsf4KXUEauGwCsIZp6A4XBSFIpihYVQnHc5FQTCaU
 Y65TreAg4uGqBAg5cWv3vF0VFCksoC7AFKMI9ut5Yp1Bedti2HnCJD4AX
 5a2ACsvuO5DHurPPDF0U+Lfsi0Z+NTEE/U2sdEcz01ruzhor8kqdHFE3A
 HpnqQFF+zOd1D1CIYuTGhqLrkYazinXOs9TSKUrFTuQJqu5VM5LKBSVZZ g==;
X-CSE-ConnectionGUID: IEeKAAw5T6mhBxvMHhmEQQ==
X-CSE-MsgGUID: LXN2neC0SdGvyp1W9mZYHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83314258"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83314258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:39:48 -0800
X-CSE-ConnectionGUID: DGVGzVzcTjKNEU/pIHmAOw==
X-CSE-MsgGUID: 2/Z1qBooQ0qQBXH9eqKC7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="234944421"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:39:46 -0800
Date: Tue, 10 Feb 2026 18:39:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH] drm/i915/gmbus: fix spurious timeout on 512-byte burst
 reads
Message-ID: <aYtfT7aw5n1Dwd-Y@intel.com>
References: <20260206203044.3892925-1-samasth.norway.ananda@oracle.com>
 <83ad67d411502b2e2ece666745b5209dae83e4f7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83ad67d411502b2e2ece666745b5209dae83e4f7@intel.com>
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

On Tue, Feb 10, 2026 at 11:23:02AM +0200, Jani Nikula wrote:
> On Fri, 06 Feb 2026, Samasth Norway Ananda <samasth.norway.ananda@oracle.com> wrote:
> > When reading exactly 512 bytes with burst read enabled, the
> > extra_byte_added path breaks out of the inner do-while without
> > decrementing len. The outer while(len) then re-enters and gmbus_wait()
> > times out since all data has been delivered. Decrement len before the
> > break so the outer loop terminates correctly.
> 
> Nice find, and the fix looks correct. How did you figure this out? Did
> you hit the issue?
> 
> I wonder if the whole extra byte thing is a workaround for some old
> hardware that shouldn't be needed on modern hardware... Ville, thoughts?

I think it's still needed due to the weird way this is implemented
in the hardware. The byte counter rolls over at 256->1, so for that
to happen the programmed byte count must be >256 or else we'd reach
the target byte count before the rollover happens, in which case
the entire transfer would terminate already during the first 256
byte chunk.

> 
> > Also fix a typo in a nearby comment ("generata" -> "generate").
> 
> "Also" is a good hint that it should be a separate patch. ;)
> 
> BR,
> Jani
> 
> > Fixes: d5dc0f43f268 ("drm/i915/gmbus: Enable burst read")
> > Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_gmbus.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> > index 2caff677600c..5fb3fee34af4 100644
> > --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> > +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> > @@ -496,8 +496,10 @@ gmbus_xfer_read_chunk(struct intel_display *display,
> >  
> >  		val = intel_de_read_fw(display, GMBUS3(display));
> >  		do {
> > -			if (extra_byte_added && len == 1)
> > +			if (extra_byte_added && len == 1) {
> > +				len--;
> >  				break;
> > +			}
> >  
> >  			*buf++ = val & 0xff;
> >  			val >>= 8;
> > @@ -693,7 +695,7 @@ do_gmbus_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num,
> >  			goto clear_err;
> >  	}
> >  
> > -	/* Generate a STOP condition on the bus. Note that gmbus can't generata
> > +	/* Generate a STOP condition on the bus. Note that gmbus can't generate
> >  	 * a STOP on the very first cycle. To simplify the code we
> >  	 * unconditionally generate the STOP condition with an additional gmbus
> >  	 * cycle. */
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
