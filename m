Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32921C61DF7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 13:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F257610E746;
	Thu, 23 Nov 2023 13:21:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AD310E749
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700745672; x=1732281672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8uvkBfY+bRsAOLvWQcGLTJ1hKRlATJD6/VGdXZv50ZY=;
 b=U+RYs378WI3G6zzmvRJjOXy/eU5k7cIxysUuPKtDFqjVfrFgdTx/TBqL
 9a90nP2ybdODeIWASoAxuy9UDQul9w+g4Si9pFkyKT7En9SNon1pnRkMc
 54icwayJzScftOV1Jm3fdlfLelioq3fK40D4NNIRi/457X8QE1hFaOp3p
 CmMJptZGmgWD0aaOYW8O90mMDNcBIBi4TjSVNfBDYMhqCyntDU8SI3KPk
 N2CajxJ51J/FX7IioGTiyw/MNoHu91a8Lv0URn3qu0HgAcdNz8Shk+7lN
 m/xFiH3sGUJlUa3DiumlwrvZxIAI5gYf3+fzZjwLCTaiWEXUStpCPHSXH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392039052"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="392039052"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 05:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="858096933"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="858096933"
Received: from amongesa-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.132])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 05:21:10 -0800
Date: Thu, 23 Nov 2023 14:21:07 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Message-ID: <ZV9RwyWZKIujjV9G@ashyti-mobl2.lan>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-4-mika.kuoppala@linux.intel.com>
 <ZV4lMfD0b37rhb7j@ashyti-mobl2.lan>
 <01ccd1935007538ed2a7b0347476e8c5ecb447b9.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01ccd1935007538ed2a7b0347476e8c5ecb447b9.camel@intel.com>
Subject: Re: [Intel-xe] [RFC 03/25] drm/xe/eudebug: Introduce exec_queue
 events
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

Hi Dominik,

> > > +		if (h < 0)
> > > +			return h;
> > > +
> > > +		h_lrc[i] = h;
> > > +	}
> > > +
> > > +	/* No need to cleanup for added handles on error as if we fail
> > > +	 * we disconnect
> > > +	 */
> > 
> > this comment is misplaced and not properly formatted.
> > 
> > Anyway, for -EEXIST and -ENOTCONN, you don't really fail, I think
> > those need to be checked and treated separately. If -EEXIST, I
> > believe the correct behavior should be 'continue', rather than
> > 'return'.
> 
> Isn't that already handled in xe_eudebug_exec_queue_create? In fact, 
> if resource exists we do continue, we just do not send an event twice.

no, you return. if (h == -EEXIST) return -EEXIST;

-EEXIST is treated at the same way as -ENOTCONN, which most
probably means that the queue is full.

> You actually made me think if we shouldn't be more radical and disconnect if sth 
> already exists in our resource tracking. 

nah... I don't think so. If things go wrong let them fail on
their own, don't kill by speculation.

> > > +	return send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
> > > +				     h_c, h_vm, h_queue, (u16)q->class,
> > > +				     q->width, h_lrc);
> > > +}
> > > +
> > > +static int exec_queue_destroy_event(struct xe_eudebug *d,
> > > +				    struct xe_file *xef, struct xe_exec_queue *q)
> > > +{
> > > +	int h_c, h_vm, h_queue;
> > > +	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE];
> > > +	int i;
> > > +
> > > +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> > > +	if (h_c < 0)
> > > +		return h_c;
> > > +
> > > +	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
> > > +	if (h_vm < 0)
> > > +		return h_vm;
> > > +
> > > +	h_queue = xe_eudebug_remove_handle(d,
> > > +					   XE_EUDEBUG_RES_TYPE_EXEC_QUEUE,
> > > +					   q);
> > > +	if (h_queue < 0)
> > > +		return h_queue;
> > > +
> > > +	for (i = 0; i < q->width; i++) {
> > > +		int h = xe_eudebug_remove_handle(d,
> > > +						 XE_EUDEBUG_RES_TYPE_LRC,
> > > +						 &q->lrc[i]);
> > > +
> > > +		if (h < 0)
> > > +			return h;
> > 
> > why not continue?
> > 
> > Andi
> Because we can't send valid destroy event, so we disconnect. If we end up in situation where there
> is exec_queue with lrc missing, it means we are already in an invalid state. 

So that if one handle failes to be removed we disconnect the
debugger and clear everything. Right?

Andi
