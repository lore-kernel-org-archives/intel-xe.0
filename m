Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74145CEDDA1
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 15:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50510E4EC;
	Tue, 18 Nov 2025 15:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyFp20GT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3926610E4EC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763480332; x=1795016332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0wdA3dMh6w9A+s0G2sYD/WNhWNd1ugeLbTnauWarwnY=;
 b=ZyFp20GTHZ2wt8HjAUnHbnBxsexNTQwJJG8Cvkc3Bgv+/2cvHAA28iSa
 llX2wvTUVYdwOwI1r72oj/m4HXfbbFooZH42+RzapNdOIagJl26tCQhsC
 v49ExIYNoozPZXm3VuJLHaWYlyaoWfhgSe6MsBSCGguOvVSNVVzEk4OYg
 meIRH/FbBA2h88jozJDKhOlE4Pj042S45S8tg7npYiAE/ioedsTcILpV9
 YhNk9l4Um4W+rri7pCZ9wI7jDz4xCE1OTmaN91OJSDDVxw2ZG78R6gKuH
 R21ara4Z0//lEI43bmlN0i0fZoNOQkrjIMclCLWc7XFTQtgcqEBwpBCdQ w==;
X-CSE-ConnectionGUID: v+iCrk/iRumVleN8Z3ufkQ==
X-CSE-MsgGUID: SNJyXkowQA+aJ1FwdkzyzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76857312"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76857312"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 07:38:52 -0800
X-CSE-ConnectionGUID: 08H+a7OuTO215tSBF0nn3Q==
X-CSE-MsgGUID: PT4QU/cDSJ6qtG4fhBY28w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195241956"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 07:38:49 -0800
Date: Tue, 18 Nov 2025 16:38:46 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, jani.nikula@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com
Subject: Re: [PATCH v1 1/4] drm/xe/pcode: Introduce xe_pcode_read_probe()
Message-ID: <aRyTBkBgFK3OO_wT@black.igk.intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
 <20251118090012.608250-2-raag.jadav@intel.com>
 <aRx3u9LuWvhGvMZj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRx3u9LuWvhGvMZj@intel.com>
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

On Tue, Nov 18, 2025 at 08:42:19AM -0500, Rodrigo Vivi wrote:
> On Tue, Nov 18, 2025 at 02:29:17PM +0530, Raag Jadav wrote:
> > If the device is running older pcode firmware, it is possible that newer
> > mailbox commands are not supported by it. The respective functionality
> > isn't useful in that case but nor is error logging, as it doesn't
> > particularly signify anything wrong with pcode firmware or device as a
> > whole. Introduce xe_pcode_read_probe() which allows the caller to check
> > for mailbox command support and determine if the respective functionality
> > exists on the device without it being reported as an error. This is useful
> > in cases where we want to make functionality decisions in the driver based
> > on pcode return codes and a relatively simpler design choice compared to
> > other solutions like checking pcode firmware version, which comes with
> > additional complexity of binding every single command to a specific version
> > and deems pcode commands useless in case the driver fails to obtain it for
> > reasons unrelated to pcode.
> > 
> > This only silences command related failures and still reports other
> > failures as errors, so we don't end up hiding the genuine ones.
> > 
> > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pcode.c | 42 ++++++++++++++++++++++++-----------
> >  drivers/gpu/drm/xe/xe_pcode.h |  1 +
> >  2 files changed, 30 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > index 0d33c14ea0cf..797b757f7a68 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > @@ -30,7 +30,7 @@
> >   * - PCODE for display operations
> >   */
> >  
> > -static int pcode_mailbox_status(struct xe_tile *tile)
> > +static int pcode_mailbox_status(struct xe_tile *tile, bool probe)
> >  {
> >  	const char *err_str;
> >  	int err_decode;
> > @@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
> >  	}
> >  
> >  	if (err) {
> > -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> > -			err_decode, err_str);
> > +		if (probe && err_decode == -ENXIO)
> > +			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox unsupported: %d %s",
> > +				err_decode, err_str);
> > +		else
> > +			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> > +				err_decode, err_str);
> >  
> >  		return err_decode;
> >  	}
> > @@ -69,7 +73,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
> >  
> >  static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
> >  			      unsigned int timeout_ms, bool return_data,
> > -			      bool atomic)
> > +			      bool atomic, bool probe)
> >  {
> >  	struct xe_mmio *mmio = &tile->mmio;
> >  	int err;
> > @@ -95,19 +99,20 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
> >  			*data1 = xe_mmio_read32(mmio, PCODE_DATA1);
> >  	}
> >  
> > -	return pcode_mailbox_status(tile);
> > +	return pcode_mailbox_status(tile, probe);
> >  }
> >  
> >  static int pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
> >  			    unsigned int timeout_ms, bool return_data,
> > -			    bool atomic)
> > +			    bool atomic, bool probe)
> >  {
> >  	if (tile_to_xe(tile)->info.skip_pcode)
> >  		return 0;
> >  
> >  	lockdep_assert_held(&tile->pcode.lock);
> >  
> > -	return __pcode_mailbox_rw(tile, mbox, data0, data1, timeout_ms, return_data, atomic);
> > +	return __pcode_mailbox_rw(tile, mbox, data0, data1, timeout_ms, return_data,
> > +				  atomic, probe);
> >  }
> >  
> >  int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout)
> > @@ -115,7 +120,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
> >  	int err;
> >  
> >  	mutex_lock(&tile->pcode.lock);
> > -	err = pcode_mailbox_rw(tile, mbox, &data, NULL, timeout, false, false);
> > +	err = pcode_mailbox_rw(tile, mbox, &data, NULL, timeout, false, false, false);
> >  	mutex_unlock(&tile->pcode.lock);
> >  
> >  	return err;
> > @@ -126,7 +131,7 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data
> >  	int err;
> >  
> >  	mutex_lock(&tile->pcode.lock);
> > -	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false);
> > +	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false, false);
> >  	mutex_unlock(&tile->pcode.lock);
> >  
> >  	return err;
> > @@ -137,7 +142,18 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
> >  	int err;
> >  
> >  	mutex_lock(&tile->pcode.lock);
> > -	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
> > +	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false, false);
> > +	mutex_unlock(&tile->pcode.lock);
> > +
> > +	return err;
> > +}
> > +
> > +int xe_pcode_read_probe(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
> > +{
> > +	int err;
> > +
> > +	mutex_lock(&tile->pcode.lock);
> > +	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false, true);
> >  	mutex_unlock(&tile->pcode.lock);
> >  
> >  	return err;
> > @@ -154,10 +170,10 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
> >  	for (slept = 0; slept < timeout_us; slept += wait) {
> >  		if (locked)
> >  			*status = pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
> > -						   atomic);
> > +						   atomic, false);
> >  		else
> >  			*status = __pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
> > -						     atomic);
> > +						     atomic, false);
> >  		if ((*status == 0) && ((request & reply_mask) == reply))
> >  			return 0;
> >  
> > @@ -268,7 +284,7 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
> >  		u32 data = freq << PCODE_FREQ_RING_RATIO_SHIFT | freq;
> >  
> >  		ret = pcode_mailbox_rw(tile, PCODE_WRITE_MIN_FREQ_TABLE,
> > -				       &data, NULL, 1, false, false);
> > +				       &data, NULL, 1, false, false, false);
> >  		if (ret)
> >  			goto unlock;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> > index a5584c1c75f9..688eca8f24e6 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode.h
> > +++ b/drivers/gpu/drm/xe/xe_pcode.h
> > @@ -18,6 +18,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked);
> >  int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
> >  				 u32 max_gt_freq);
> >  int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
> > +int xe_pcode_read_probe(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
> 
> Is "probe" the right condition? I mean, the right name for the exported function?
> 
> The caller is deciding to downgrade the Illegal command from error to debug, but
> is it because it is in the probe? Or because we know that most of FW out there
> might not have this command yet and driver knows that and will handle the
> lack of backward compatibility properly... in a way that this is not an error.
> 
> But is this 'probe' ?!

This is following Ville's original comment[1] as in 'probing' for something
that may or may not exist.

[1] https://lore.kernel.org/intel-xe/aQ3xItyGMVnKdzoi@intel.com/

> I'm bad with naming as well, so asking help from AI:
> 
> Alternative naming ideas:
> xe_pcode_read_optional
> (Indicates the command is optional and failure is acceptable.)
> xe_pcode_read_safe
> (Suggests a safe read that won't break if unsupported.)
> xe_pcode_read_tolerant
> (Highlights tolerance for missing command.)
> xe_pcode_try_read
> (Common pattern for non-fatal attempts.)
> xe_pcode_read_if_supported
> (Explicit about conditional support.)

I don't even begin to qualify here so it's upto you all.

Raag
