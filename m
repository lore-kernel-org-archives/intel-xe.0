Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC14CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 16:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED59D10ECA6;
	Fri, 12 Sep 2025 16:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjW3fK8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8272110ECA6
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757696205; x=1789232205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TphtycCk8TzvS6sfWGk9N4F2oNenvOTI7qAfRWPbt5Q=;
 b=BjW3fK8V07HbLFzMfKsUGJ5QE7WdDjrp/jQEAMtk/Ym7IET4QqK2yQ/a
 ZEVy7JnEQThcr03vYfLHQmYZ2BWce/CNj47EjlkghwQHbu/B4RNtVM+1F
 T81Tlnbj0NwUtLJ50te3HO9qshTnkTg0Yj3AYhPrz5CHQijyO5oMCbJlo
 wWSVVOnnb75RW0aqIAHrHZ/B70CCBskSi3pG7SIToVa4FoFzRwhdPIwM8
 e/0ggcGtamwTX7RVmjl/F1JkiIdontT7aZdPSn99AoHJpPomOXAciKUTQ
 o9qtfS1GLOIgLx4eekFMHs4Y8VT5Mh2DvyUwHXdo+oGzJoJumP+1KqFim g==;
X-CSE-ConnectionGUID: wn8Xtk6ATF2UCUOM/qFYyQ==
X-CSE-MsgGUID: XImjCAHbQqi1utIZkwbG2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77655699"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="77655699"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 09:56:45 -0700
X-CSE-ConnectionGUID: g34GsVtvQj28ctH7xtupuQ==
X-CSE-MsgGUID: Q71lwU10SQC5HRg7tT9EUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173832995"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 09:56:43 -0700
Date: Fri, 12 Sep 2025 18:56:40 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v4 6/6] drm/xe/configfs: Add post context restore bb
Message-ID: <aMRQyKnPJnAYGWOt@black.igk.intel.com>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-6-c8f7e48f7eae@intel.com>
 <aMPUQcgJsZARb8P4@black.igk.intel.com>
 <b3jh5ppikyzfb5lvur36fpldsstiert6577p62vnmy2jimq34l@mbjxcka55yik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3jh5ppikyzfb5lvur36fpldsstiert6577p62vnmy2jimq34l@mbjxcka55yik>
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

On Fri, Sep 12, 2025 at 09:07:10AM -0500, Lucas De Marchi wrote:
> On Fri, Sep 12, 2025 at 10:05:21AM +0200, Raag Jadav wrote:
> > On Thu, Sep 11, 2025 at 12:36:30PM -0700, Lucas De Marchi wrote:
> > > Allow the user to specify commands to execute during a context restore.
> > > Currently it's possible to parse 2 types of actions:
> > > 
> > > 	- cmd: the instructions are added as is to the bb
> > > 	- reg: just use the address and value, without worrying about
> > > 	  encoding the right LRI instruction. This is possibly the most
> > > 	  useful use case, so added a dedicated action for that.
> > > 
> > > This also prepares for future BBs: mid context restore and rc6 context
> > > restore that can re-use the same parsing functions.
> > 
> > ...
> > 
> > > @@ -123,11 +156,18 @@
> > >   *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
> > >   */
> > > 
> > > +/* Similar to struct xe_bb, but not tied to HW (yet) */
> > 
> > Should I assume we plan to do it at some point?
> 
> no, the "(yet)" means that it's only a struct to stash the bb. There
> isn't an exec queue associated to it like in the xe_bb case. The hw
> association will come later in the runtime flow, not in a future patch.
> 
> I may remove the "(yet)" in the next version to avoid confusion.

Thanks.

> > 
> > > +struct wa_bb {
> > > +	u32 *cs;
> > > +	u32 len; /* in dwords */
> > > +};
> > 
> > ...
> > 
> > > +static ssize_t wa_bb_show(struct xe_config_group_device *dev,
> > > +			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
> > > +			  char *data, size_t sz)
> > > +{
> > > +	char *p = data;
> > > +
> > > +	guard(mutex)(&dev->lock);
> > > +
> > > +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> > > +		enum xe_engine_class ec = engine_info[i].engine_class;
> > > +		size_t len;
> > > +
> > > +		if (!wa_bb[ec].len)
> > > +			continue;
> > > +
> > > +		len = snprintf(p, sz, "%s:", engine_info[i].cls);
> > > +		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> > > +			return -ENOBUFS;
> > > +
> > > +		for (size_t j = 0; j < wa_bb[ec].len; j++) {
> > > +			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
> > 
> > Should we use '0x' prefix?
> 
> Then maybe we'd need to change the input parsing as well :-/. Not sure
> it's worth it.

Fair.

> > 
> > > +			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> > > +				return -ENOBUFS;
> > > +		}
> > > +
> > > +		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
> > > +			return -ENOBUFS;
> > > +	}
> > > +
> > > +	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
> > > +		return -ENOBUFS;
> > > +
> > > +	/* Reserve one more to match check for '\0' */
> > > +	if (!data)
> > > +		p++;
> > > +
> > > +	return p - data;
> > > +}
> > 
> > ...
> > 
> > > +static ssize_t parse_wa_bb_lines(const char *lines,
> > > +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
> > > +{
> > > +	ssize_t dwords = 0, ret;
> > > +	const char *p;
> > > +
> > > +	for (p = lines; *p; p++) {
> > 
> > I found it to be zeroed page but does it gurantee termination at page
> > boundary? (just thinking out loud about overrun cases)
> 
> it's actually not a zeroed page, but it is terminated:
> 
> 	if (!buffer->page)
> 		 buffer->page = (char *)__get_free_pages(GFP_KERNEL, 0);
> 	...
> 	copied = copy_from_iter(buffer->page, SIMPLE_ATTR_SIZE - 1, from);
> 	...
> 	/* if buf is assumed to contain a string, terminate it by \0,
> 	 * so e.g. sscanf() can scan the string easily */
> 	buffer->page[copied] = 0;

*facepalm* I didn't realize I was looking at read_iter().

> > 
> > > +		const struct engine_info *info = NULL;
> > > +		u32 val, val2;
> > > +
> > > +		/* Also allow empty lines */
> > > +		p += strspn(p, " \t\n");
> > > +		if (!*p)
> > > +			break;
> > > +
> > > +		ret = parse_engine(p, " \t\n", NULL, &info);
> > 
> > Nit: Can we work without a double pointer? I've always found it easier to read.
> 
> It's basically "where info should point to in case parse_engine is
> succesfull". Pretty common pattern in parse/lookup code like this.
> 
> in this case we need to use the ret to know how many chars we parsed.
> 
> 	info = parse_engine(p, " \t\n", NULL, &len);
> 
> would avoid the double pointer, but also make it harder to follow as
> we'd need to encode the error in the pointer and use a different pattern
> than the other functions.

A NULL return for error cases would be one way, but at the cost of loosing
internal error codes which is probably controversial. In any case,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
