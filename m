Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50A2EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 09:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E6210E4B3;
	Thu, 15 Jun 2023 09:49:23 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FD510E4B3
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 09:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686822562; x=1718358562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qByJ3FNCP+sBuwAsjksmg3h+pNusx4hpZt39FTJ9zEw=;
 b=b0FbwiSdoC23raPyrbcJ8N65NOTXbZGV1/R4naBgsHATrIQF033545c6
 CZgtv69DL0PjkxszW2GSb6oto7yBsJQl3G8f+2lXM4TXhg0o/F1fr5b3l
 Sl3OAWIC5EX5s1WCpUlQZXlre3YrAOnt5sIhfrsuXg7qlh68BxnuAX1n5
 1wnFVViXjzbDFM08wz7usgl4JkGWLwPdaxPH0wBOXXg1hfZ+mj+QOUuTG
 IxgRhcaV+KEViRRC83pCg/222PPSoydJJc0+2ZaIRM7U27NZEdDkoCOiP
 5T5BQFfh4+rMVpdvt3vS06nPff42ISXVv2LFD3egWDtKPW2tDgMS6LzsW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338492871"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="338492871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 02:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="662728574"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="662728574"
Received: from isyrjala-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.211.231])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 02:49:16 -0700
Date: Thu, 15 Jun 2023 11:49:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZIrempN9Bxf4l86u@ashyti-mobl2.lan>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
 <20230613084721.3698818-2-riana.tauro@intel.com>
 <ZImQSlvLphPOU5RW@ashyti-mobl2.lan>
 <9d8057a5-09a9-1a04-bae6-4465b9186917@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d8057a5-09a9-1a04-bae6-4465b9186917@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

> > > +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
> > > +{
> > > +	u64 delta, overflow_residency, prev_residency;
> > > +
> > > +	overflow_residency = BIT_ULL(32);
> > > +
> > > +	/*
> > > +	 * Counter wrap handling
> > > +	 * Store previous hw counter values for counter wrap-around handling
> > > +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
> > > +	 */
> > > +	prev_residency = gtidle->prev_residency;
> > > +	gtidle->prev_residency = cur_residency;
> > > +
> > > +	/* delta */
> > > +	if (cur_residency >= prev_residency)
> > > +		delta = cur_residency - prev_residency;
> > > +	else
> > > +		delta = cur_residency + (overflow_residency - prev_residency);
> > > +
> > > +	/* Add delta to extended raw driver copy of idle residency */
> > > +	cur_residency = gtidle->cur_residency + delta;
> > > +	gtidle->cur_residency = cur_residency;
> > > +
> > > +	/* residency multiplier in ns, convert to ms */
> > > +	cur_residency = mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);
> > 
> > do we need to lock something here? Looks a bit racy to me.

> seq_read_iter takes a lock while calling sysfs_show
> https://elixir.bootlin.com/linux/latest/source/fs/seq_file.c#L171
> 
> This function is used only by idle_residency_show. So didn't add the lock

I was just thinking a lock around gtidle. the m->lock from
seq_read_iter is loking on the seq_file m so that consecutive
reads/writes cannot be made.

If gtidle is not used anywhere else, then I guess locking is
safe and for now "struct xe_gt_idle" is in sysfs (but still in
the xe_gt).

Andi

> > > +	return cur_residency;
> > > +}
