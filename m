Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D75C2BA12
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 06:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2810EC36;
	Fri, 14 Jun 2024 06:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEqodYZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D2110EC36
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 06:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718348267; x=1749884267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Iboq4wTNtaMyYH0jdByrHrBFKeOVtSnM0PNbO2/qqIo=;
 b=MEqodYZ2saLB1lG9pMJly5Oy8hUavk1kVMwwQJCuC7jpQBjD/M/4S78I
 9aVQ6cjgApKmg5PKpz2C+vhe1cromrJseCFCFFqHC07eVFBr1JF3ZBwG3
 PQz7GYgBjEyyOeC+tmVf36DZhnyGdVQLBBluHQ0yBV2J3/teZMHORKNPo
 XzeE6/o5H9pHpRdrNX0f3XKzdULPlvrwhijd4VlnRtndJhYSnKgW4MJFk
 lYutn0pgDTZ/2gTUYmyPL7VSmNVG3Sl7i5egoJSZU/WoYWbjnIXX8c2BY
 5rj+A5TV02Ri3CBQPMUwR0vnp6dvvelOHHKkeepXeYihV6gczf/1eyTan w==;
X-CSE-ConnectionGUID: aMpe4RuPRHWdnYp4Ds0KCQ==
X-CSE-MsgGUID: QbioDAD4TG+m3Z8PGI6MCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15369378"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15369378"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 23:57:47 -0700
X-CSE-ConnectionGUID: ijF3SqoTTiueJOqrMfgFpA==
X-CSE-MsgGUID: TumUwlqgRqC9z0qcC+PGTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="40546692"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 23:57:45 -0700
Date: Fri, 14 Jun 2024 08:57:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Explicitly cast to u64 to avoid overflow
Message-ID: <20240614065741.p65wfuxb5mu4hhwd@zkempczy-mobl2>
References: <20240614051556.255455-1-zbigniew.kempczynski@intel.com>
 <ZmvhN2911IV+9EYW@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmvhN2911IV+9EYW@DUT025-TGLU.fm.intel.com>
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

On Fri, Jun 14, 2024 at 06:20:39AM +0000, Matthew Brost wrote:
> On Fri, Jun 14, 2024 at 07:15:56AM +0200, Zbigniew Kempczyński wrote:
> > Without casting whole expression will be calculated on u32 what
> > means adding U32_MAX effectively decreases the result by one due to
> > overflow. Fix this and use explicit cast to u64.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 74552391dc5a..347773f003f3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -967,7 +967,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> >  	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> >  
> >  	if (ctx_timestamp < ctx_job_timestamp)
> > -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > +		diff = (u64) ctx_timestamp + U32_MAX - ctx_job_timestamp;
> 
> I think the existing logic is correct, it dealing with the wrap of a u32
> counter. There be a better way to code this though but this patch
> doesn't look correct to me.

You're right, effect is same regardless u32/u64. Please ignore this patch.

--
Zbigniew

> 
> Matt
> 
> >  	else
> >  		diff = ctx_timestamp - ctx_job_timestamp;
> >  
> > -- 
> > 2.34.1
> > 
