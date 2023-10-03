Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF10E7AD47
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 13:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBB710E083;
	Tue,  3 Oct 2023 13:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BAA10E0E3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696340093; x=1727876093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=g5T7pWW4fP1d62tE5t15BFWSiwR88xPccL8PCGl2lNg=;
 b=S/vSNE9zhCaqs2wKMq6ySyjUEZoK3IDAuiH55Ho02EGCwuAm2hJZ5hIN
 3SQwXxO+oV45w8mKxiEXLj/s2a58QfDhQ7lj6txSlxsopGEBxo+XOMM4o
 0toIVbzDIXeq+JUlstrV9GUXnw87AaNOED5e661RGv1Rmb4wc/uxB7SJr
 MpUPSWjUzEB6fAWFxMOWMLmPNA6GAyZah4GhMSbW85DuIymFkxqIFGRIa
 in3Ch0m7qYjr9Q0T8YuJxABNHdhKKMv6wVv4nLL2M/K8ccB08mt7pFiCu
 JTfpKJYaGad4BZNNz2TmppSx6hiu+IW8eQVvaYwSqCmGjtgfK7Qsw2lUv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="367929260"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="367929260"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 06:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727613874"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="727613874"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga006.jf.intel.com with SMTP; 03 Oct 2023 06:34:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Oct 2023 16:34:49 +0300
Date: Tue, 3 Oct 2023 16:34:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <ZRwYeYYI2QxtDlHj@intel.com>
References: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
 <20230920140339.28322-2-ville.syrjala@linux.intel.com>
 <391fcadb309b9ac381336a5676506a701f8cc1c5.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <391fcadb309b9ac381336a5676506a701f8cc1c5.camel@redhat.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH 2/3] drm/vblank: Warn when silently
 cancelling vblank works
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

On Wed, Sep 20, 2023 at 03:55:28PM -0400, Lyude Paul wrote:
> Good point!
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks. Pushed to drm-misc-next.

> 
> On Wed, 2023-09-20 at 17:03 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Silently cancelling vblank works is a bit rude, especially
> > if said works do any resource management (eg. free memory).
> > WARN if we ever hit this.
> > 
> > TODO: Maybe drm_crtc_vblank_off() should wait for any
> > pending work to reach its target vblank before actually
> > doing anything drastic?
> > 
> > Cc: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_vblank_work.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
> > index bd481fdd6b87..43cd5c0f4f6f 100644
> > --- a/drivers/gpu/drm/drm_vblank_work.c
> > +++ b/drivers/gpu/drm/drm_vblank_work.c
> > @@ -73,6 +73,9 @@ void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank)
> >  
> >  	assert_spin_locked(&vblank->dev->event_lock);
> >  
> > +	drm_WARN_ONCE(vblank->dev, !list_empty(&vblank->pending_work),
> > +		      "Cancelling pending vblank works!\n");
> > +
> >  	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
> >  		list_del_init(&work->node);
> >  		drm_vblank_put(vblank->dev, vblank->pipe);
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat

-- 
Ville Syrjälä
Intel
