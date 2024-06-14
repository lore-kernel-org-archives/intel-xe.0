Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925E7C27C77
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 07:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD7710EC36;
	Fri, 14 Jun 2024 07:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duVCsd0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1403D10EC3C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718348406; x=1749884406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/9wbkW3PYkJnmIgOyVU35brjHPZjRdwYpAjZZrj3Gg4=;
 b=duVCsd0fESYJesHOikQ/In819rjWwKD84/Wfh3KoPT3Mlr98K4+blQcS
 rZ0ttS1sM6V6EKJuIkcYlelS5j4TrEzRK8R5xtesfkx+NJZrI5n0Ju2CU
 iNsh0/UUNcgc4n2hwhHPthF98D6A1sPzFhCkhEK+z+//DMZhMMUpcP5fW
 uErB9yQWSX2ctDUSPNdOuj3Y+7dhtYD+9VnEvjd6Adyx+F2I+Gv5MUcUE
 L+ejfkFOAJo++eS01eIvCAUUoaLR/YbOWx+o2wlfT4/iLg7e4xdnNxOP2
 KTFKb6Q188XlKJBlIK3Ufe0vf0D7xr2CBcDM/ierNApPMixR4FzNrcBDT w==;
X-CSE-ConnectionGUID: Nk5FwTRURNGcAKDbvEwfQg==
X-CSE-MsgGUID: G4BbbuuoQFST6L7jvyQqIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15049739"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15049739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 00:00:06 -0700
X-CSE-ConnectionGUID: xU1jGXeDS9Cgp+4HCQe0wg==
X-CSE-MsgGUID: PvvlTjt/RkWqfVRipFKaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="63606859"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 00:00:04 -0700
Date: Fri, 14 Jun 2024 09:00:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Explicitly cast to u64 to avoid overflow
Message-ID: <20240614070001.zepvgids4v5n5vem@zkempczy-mobl2>
References: <20240614062415.260340-1-zbigniew.kempczynski@intel.com>
 <877cest3mo.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877cest3mo.wl-ashutosh.dixit@intel.com>
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

On Thu, Jun 13, 2024 at 11:55:27PM -0700, Dixit, Ashutosh wrote:
> On Thu, 13 Jun 2024 23:24:15 -0700, Zbigniew Kempczyński wrote:
> >
> 
> Hi Zbyzsek,
> 
> > Without casting whole expression will be calculated on u32 what
> > means adding U32_MAX effectively decreases the result by one due to
> > overflow. Fix this and use explicit cast to u64.
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> > v2: Fix spacing
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 74552391dc5a..f46d1e18f8e7 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -967,7 +967,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> >	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> >
> >	if (ctx_timestamp < ctx_job_timestamp)
> > -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > +		diff = (u64)ctx_timestamp + U32_MAX - ctx_job_timestamp;
> >	else
> >		diff = ctx_timestamp - ctx_job_timestamp;
> 
> Looks like the function expects to be called every 100 ms, and counter
> wraps around 223 s, so previous code is fine with normal 2's complement
> arithmetic?

Yes, you're totally right. Sorry for the noise.

--
Zbigniew

> 
> Thanks.
> --
> Ashutosh
