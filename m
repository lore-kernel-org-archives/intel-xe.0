Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8721DC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 12:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2759510E7D0;
	Wed, 29 May 2024 12:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsgGZw0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B47910EC61
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716986736; x=1748522736;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=7gaQT26Upz8+Vix329f+nACFENO8A5QWG2AuVbzclto=;
 b=CsgGZw0d7KfgGr2q4tArpZcrNuJ2KHmBAp/G1JKgoLWtb9F97vaWvnI5
 CLmhZCDz+ebmfY9pjGh9rNH1ZrdOzPfU05Y06q3an89uFd5MCLe+bY6Ul
 x7KqKU7IY5ChcazmffR3Yrvu/j+3XKbN9t1dPEm8FRvS77zdZAUhdv0zf
 IvlKHfo7szJyBtLzuARixR2wmla7fflbLDbA4f+HZ7JT8QjNzdb+rmra1
 E8LLzLeEgvZvG1oRT8xjo+l1RVE+g2Oems71ZhmQJnkXLnWGyaaOg0ALv
 9TlpcJHrD6nVoUEumhUn+U7UddtxHlUPXLUicqs/DDmKusF7VWuo7/bD0 Q==;
X-CSE-ConnectionGUID: OZadDLjcTPWXWYsay2WURw==
X-CSE-MsgGUID: jn+qktJ4SF+mpFrFS/4YRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="38771278"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="38771278"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:45:36 -0700
X-CSE-ConnectionGUID: KwWAik/wSGudGeQknHnk6g==
X-CSE-MsgGUID: WpbabKDEQtaueNVxB+f2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40421925"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:45:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
In-Reply-To: <SJ1PR11MB6204A8233ECBFB718C875E8E81F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
 <87bk4pkr2g.fsf@intel.com>
 <SJ1PR11MB6204A8233ECBFB718C875E8E81F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
Date: Wed, 29 May 2024 15:45:41 +0300
Message-ID: <878qzskcqy.fsf@intel.com>
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

On Wed, 29 May 2024, "Upadhyay, Tejas" <tejas.upadhyay@intel.com> wrote:
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Wednesday, May 29, 2024 1:06 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
>> 
>> On Fri, 24 May 2024, Tejas Upadhyay <tejas.upadhyay@intel.com> wrote:
>> > Wa_15015404425 applies to xe2_lpm all steppings
>> >
>> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
>> >  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
>> >  2 files changed, 19 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
>> > b/drivers/gpu/drm/xe/regs/xe_regs.h
>> > index 722fb6dbb72e..07c8a23bd7c2 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> > @@ -42,6 +42,7 @@
>> >  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>> >  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9,
>> 7)
>> >
>> > +#define MEDIA_DUMMY_REG
>> 	XE_REG(0x138000)
>> >  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>> >
>> >  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
>> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>> > b/drivers/gpu/drm/xe/xe_mmio.c index ff7a7cf99530..e1dc87078387
>> 100644
>> > --- a/drivers/gpu/drm/xe/xe_mmio.c
>> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> > @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
>> >  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);  }
>> >
>> > +static void mmio_flush_pending_writes(struct xe_gt *gt) {
>> > +	struct xe_device *xe = gt_to_xe(gt);
>> > +
>> > +	if (!(xe->info.platform == XE_LUNARLAKE))
>> > +		return;
>> > +
>> > +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) == 20) {
>> > +		int itr = 4;
>> > +		/* 4 dummy writes */
>> > +		while (itr--)
>> 
>> If you need to do something N times, the paradigm loop is:
>> 
>> 	for (i = 0; i < N; i++)
>> 
>> and nobody has to pause to consider the loop condition.
>
> Thanks for comment. However I don't understand whats adding pause
> here, for() is also adding similar pause and variable.

Mental pause when reading the code. The for loop is so ubiquitous for
counting that you know it's correct. The while loop, less so.

BR,
Jani.


-- 
Jani Nikula, Intel
