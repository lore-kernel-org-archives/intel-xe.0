Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2980EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D3810E641;
	Fri, 16 Jun 2023 14:29:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3D910E641
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686925750; x=1718461750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4NtmrScmD954nwZiQ+mQ/grf10aXGj66HCj2m/j+ITs=;
 b=bVw69kStLGVapA88Uu54xQo0hyIQ57R4hiYaZnqscoVoodR1NgD6Mfj2
 Q/LS0q6w5mNA3wBCjhDhMwMGbF8VDV+cpxJlWRl0VvA0/WAtYQMnnF42I
 5nktzRf/QamDrip60B3+vHkGuP03zSbHZ9I97uMo4rUTvH9V9f2v7s3Co
 VpnqkmLCrS2EEUqw3sqw6iQq9eGjrp1XQbtLD1CM7zI+jRZUer3NlbwZ/
 Ly7f4GnPjDRvapTkSgVTpKsLPZdLLZf8eWM4E/iMctAvO0WIGdSbP2Del
 vnRAFkLzRDR5xCvsJBLqsx55/ngDsvR+w3Cwh81Qlt5jD7d8l24a9JYEn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343962038"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343962038"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712893063"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="712893063"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 16 Jun 2023 07:29:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Jun 2023 17:29:05 +0300
Date: Fri, 16 Jun 2023 17:29:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Message-ID: <ZIxxsWUVFvH7_OKr@intel.com>
References: <20230606201959.94128-1-jose.souza@intel.com>
 <DM4PR11MB6360A0F1846E78E51FE0A2D0F45BA@DM4PR11MB6360.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB6360A0F1846E78E51FE0A2D0F45BA@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Append dma_buf fences to
 framebuffer fences
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 11:10:55AM +0000, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of José Roberto
> > de Souza
> > Sent: Wednesday, June 7, 2023 1:50 AM
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH] drm/xe/display: Append dma_buf fences to framebuffer
> > fences
> > 
> > This is required to comply with KMS page flip requirements, and it is the only way to
> > synchronize framebuffer scanouts in Xe KMD.
> > 
> > UMDs are expected to attach a syncobj that will be signaled at the end of the GPU
> > job that is rendering in the framebuffer.
> > This way, the compositor can send jobs to the GPU to render the framebuffer and
> > without having to wait for it to complete, queue the page flip in KMS.
> > 
> > This fixes display glitches.
> 
> Looks Good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> 
> @Ville: Can you also check this once and confirm.

Needs an actual explanation why the current code doesn't work.

> 
> Regards,
> Uma Shankar
> 
> > Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/8923
> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > index b756561f08bd1..a3f30a319e4c0 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > @@ -32,6 +32,7 @@
> >   */
> > 
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_gem_atomic_helper.h>
> >  #include <drm/drm_blend.h>
> >  #include <drm/drm_fourcc.h>
> > 
> > @@ -1120,10 +1121,20 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
> > 
> >  	return ret;
> >  #else
> > +	int ret;
> > +
> >  	if (!intel_fb_obj(new_plane_state->hw.fb))
> >  		return 0;
> > 
> > -	return intel_plane_pin_fb(new_plane_state);
> > +	ret = intel_plane_pin_fb(new_plane_state);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = drm_gem_plane_helper_prepare_fb(_plane, _new_plane_state);
> > +	if (ret)
> > +		intel_plane_unpin_fb(new_plane_state);
> > +
> > +	return ret;
> >  #endif
> >  }
> > 
> > --
> > 2.41.0
> 

-- 
Ville Syrjälä
Intel
