Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD44EC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A87E10FED1;
	Mon, 18 Mar 2024 19:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp2NbT61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3992610FED1
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710791319; x=1742327319;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pSQGQxwdsmnI7KTPGoBl4ZvQ7s/ETVDCe9A3vekhMdo=;
 b=Dp2NbT618yFvBSmzdIwjxhC7ifDROhV2Mf8oA7vtuS4M2OtX0RUjTi8N
 JllO9/1YNDrzHjqoTskYDYv6NSig6OJa7aCzsXowNSYGv8FR47bOyrufy
 skEMQrQOX9hTdwSXXFAyk8jUHOpBredTfR4ZyIPpYCQmcDQpJGEN9Dymf
 jp/xoprCzXEtglVxRgGJ2QLsHbNxt9VCHs+TyFyKQ8WLTaxWnPPPPDOIl
 ghhMsYt12jJECuyJom7UOCiu1ePARE2RWAJI26odSN0RH1NZulZ/v/Ei4
 4ohHNuI9r9bWwaQZfHdadkpZhAo4s/9WsBc2mDSk8RX3Ao7TRjJQno3YM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16268068"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="16268068"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="13463233"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 12:48:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:48:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:48:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 12:48:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 12:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6ihkuKS1HCPZT703gI0Y6rcsNHnHjyErEhV9tUHHeOeIOTU1mrC1IMYW7JGF3jPeuQsXDxajX1kkVP9D5arYHk2gTYx9THq1W76iRKQwM7R5ChUNT0t1kE16fyM1tMb+t2Naf9F0ZbqMuIcEFLRr+lltbxP2EtVpGykdAv2PfHjgvb7g++E4CcfIRbAfp/rkiSSLhDPma2J4x34bibY7ukSNT33yI0oi0CoH7CYE1NKJsbpgJh4YldFMQc4tv8gHJUpVyfMhnKx+LQGAcmB18TbyOOn9a2Tm7VRAQuvzWTIJsebDGaYVqNt5zpSfLJxKUzJgbdq7EF8nH7ZWbr0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDm7GQB+PexNcTkx0fWgDnBkhcvxQwqcq7tpWNwWFGM=;
 b=ON1X0Q+8j473MNIfs0V7r13W25aFxi1c47pvgH0SDIcaxgeL8qGsWOrotDY8pk17WeE1wWnhAmXrpJbSYSnGs3omRLhKxmVHONdMewmp6COx3gArgst20Ta8WvnDW5bS/V2o/R6Xhk/eEbqS7Z3zxwkantn7jvO8l2PYOyVwytzikcbpTID3/u798SaSD+z/KnHC35At+z8ZoqDP68fpkF/WYZvTD2ID2zp8OHV06GK0NNpNhtQsnvK3iIn+6QVDi5VUW2mq+ldzBxKzm/quCKiEoO/Vf4L6p5wMqjnm8E6RmrUNz37bMj/CL7dYPR0D6STA1tt3MO9/aQu/7r5wzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 19:48:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 19:48:34 +0000
Date: Mon, 18 Mar 2024 15:48:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add dbg messages on the suspend resume
 functions.
Message-ID: <ZfiajmWtdxG0COvx@intel.com>
References: <20240318180141.267458-1-rodrigo.vivi@intel.com>
 <20240318180141.267458-2-rodrigo.vivi@intel.com>
 <8f2a95fa-2acc-46ba-8618-c7e784f69d25@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8f2a95fa-2acc-46ba-8618-c7e784f69d25@intel.com>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7547:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z5g0nVIxX116QccOsQB5HdShFWvvFINfazi9R8MVMoUOLa4eN9f2/YHCu94FIUca5POFx7lacQYDIuh82cVTGj33qxLmgQWh0ZAkMtgH3bWjvmU1MZAM/lkwwdLMRzK+pXyxMxMqWM7zjPKLTtnVMT6RRbwXJUaiaLWNUil9+hkftQbIbto2RJ2ALQPV+JFyHIJZk+TRv+3NnpWqDsICiEDRC0DIqBdtBEv6Q9mDZoMC8qKqhlgTgKZySgbOjXxub8TfUjznmavzuUrospSNybWq9sNzr4ycu+gLYJ4SavGCmKCOZ+Iab6EXTEq2zdoIH85n4DuQiO4OJ0HgxLUGzd26HhuknoeCGB2jgTadKxPMC1p8ZwCPF7MP4pg7rOgO6vszEEULJma70VJ6Q1uSnmIdBCjj9k0CliWWeHlNKJEmc6FkZetxm9MkbbtpwWriFL8/o0+qpGVf6aRI1CPTJx5ABzLffrp3UbQbg72Guj2DKaTKwxmbkM9cPGvUsz5youdM/6aAbgnjMyVkVS99IgRsOgaf/qwxnP72iMzmtjx0FFgPydm2DkDpc2zORhopO2PHPpVhliauQJuG3NnRi1FC4JYuuyQKpK+fyulxIxwJyv6c5WALLhBmOz4vInBVbHKEX6SoyDUvks3WN8xLQ+U+/DlBGQ1pW/GIyOfIRiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W3dLkA9lg9CoqIrNQsJ0Gz2D2bbb/lTz8MwP5Lq6Upwd4eMA2yL6z894MVPE?=
 =?us-ascii?Q?B1bCzU52bKJLwOOFNFgGwR/VKGZnA1RU+U/5HsmoIdUSMNKmkvN1MPHflQJI?=
 =?us-ascii?Q?n/XBu8hqcr58BsADuxQVdr2R9PBhth5b6EW97R/IcisgJphFT6u9xvwNMcAk?=
 =?us-ascii?Q?ayps7k0q1SvyExCzRZuI79m/ZbhKPZrHSOWhvCp3ruqbhIYoY+nwAhGZ5dXP?=
 =?us-ascii?Q?Df6OaWks4eLLp/1a5WK0RjwMyfU1dDX22lfMFuJMYqZFLzEF4sOQ+wyk1yuv?=
 =?us-ascii?Q?k7hJy+nC6WjjC0noO3LHnS0vRLlqQfVDrfJ7OSa1dZywdrRS4UWCQIECyd4z?=
 =?us-ascii?Q?ZeDbdOpR8511nFnmMpwp2X2vg1gP8q13EcIDLtP2dAuRon+Rvwqk6ZmTtsCU?=
 =?us-ascii?Q?YpPuPH8RfmkbO6EAQG8419x49y1QQL5Vep1JjbHkINQiPS45kj2mkwxrrDjx?=
 =?us-ascii?Q?0cTH5QQixM8lphrEZS0Lm8HOCe3NXjn4+K5cW2UjFNuTusiHQmQM8rVM691T?=
 =?us-ascii?Q?tk8pBgiGNixwssmMxqylwYxAi8tNkgyNh3W+SlZ51WJCdXRezpjNindQDWT7?=
 =?us-ascii?Q?hzzB/hL4mQm2AsSvn6a+1B4QnQ6QEq1RPQbZzPKk4UT5aqfqger2wYXxEfhA?=
 =?us-ascii?Q?ezLM0mp9+1CcOsMSFOpSi8hzqySx3QHNjr8DhYsLZjm316wXfKK8qo9fcNte?=
 =?us-ascii?Q?iN4iN4hxYZH4DOPvLlGiO5K7v7en8TOTbHrRAznVTj9MPDBz3zQpAe+aerfU?=
 =?us-ascii?Q?e/nziCp5hx6+LRCYgZQ46LTYrw5EqR69ys8EmFL7AhyzyG5IhuXPVqftlQqr?=
 =?us-ascii?Q?48p8waCrXRw0Mc0hb/4qjo5Xr0qj1NWWP/bryxe1Nrhc3NA0UuRD8rMQmMZv?=
 =?us-ascii?Q?VP2lZvbtr4/htpqtZQ1e52q7eUSxekdUnExKl5naRLz6gtdWerH26FnbOsh/?=
 =?us-ascii?Q?8oHPL1YtDGKMsFB3NbcWNt+VfT2WuaJScirqA6/Ge15UfxqOy3sYbe9AvcIB?=
 =?us-ascii?Q?36TBhGCzc0WzrVwongVfyyiwMYnY/iuP4X38x4gl7+7GTJqLl4aW8I6IigO4?=
 =?us-ascii?Q?aqCPx+U838vrmTEwUcAZWastiZi2dfIiiZmyeaurszMIkjBm04rUYHqiEUhd?=
 =?us-ascii?Q?965c7uN6xShTbTbhV9nj5YnfhZlEScqQDpqt+t8WcyWmkl6TnYCzrIX9GBkC?=
 =?us-ascii?Q?eE77zko+QlDg0Tetskoe256NjMP8gqGTJQX4JwoMEH8NieOAf3oap1EwH8bD?=
 =?us-ascii?Q?eTKM/h1t6UEhoA+LzEjvxp8V5GX81Lq4EczU2Woaq34yfAC3yhvZU4aXsWK1?=
 =?us-ascii?Q?vHADhGAxIG+/lIAbMN2NsFrXyMXkGNG3+FR9oLHkX5b0Lq89pcDs8P08/kti?=
 =?us-ascii?Q?X1hdJoGIzXRHT0vTXAekva4z5+LN7CvKi6Oz3DFeAjI1AMD1T1xPHaq1e+nF?=
 =?us-ascii?Q?fkC90eQGwXqPMjy7liWysIgCnXHOhM77VZiBYA3+scsCOlBqFocQjzEu+3kR?=
 =?us-ascii?Q?Mea/+51rZOTJtiIfzYlqSwrOPjYwWBil52gtLvEulqfMZn5i0uHZ7GV1hFgB?=
 =?us-ascii?Q?69Wvk0Np9s4/M8UHlQ7Ney5YM+fTvu0ckpj3SuWj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61131d6f-f724-41ee-8613-08dc47846566
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 19:48:34.4271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jsH4CXNqE6J8N1ayEwOI3y2Sge+aXJ9T3JH6u3CEpWxh29jNf0yNZmSvVt5/gXxz/bOUYcYV9tZS9oRAe4www==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
X-OriginatorOrg: intel.com
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

On Mon, Mar 18, 2024 at 06:12:44PM +0000, Matthew Auld wrote:
> On 18/03/2024 18:01, Rodrigo Vivi wrote:
> > In case of the suspend/resume flow getting locked up we
> > can get reports with some useful hints on where it might
> > get locked and if that has failed.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Makes sense. What about maybe also adding that to the rpm versions? Those
> can also be fun, and so would be useful to get hints when inside the
> callbacks.

I'm planning to get that on RPM next... just was trying to avoid
conflicting with myself ;)
The bug that I'm targeting with this right now is a suspend to memory.

And I was afraid that someone might complain about verbosity in the rpm
path on cases where gnome-shell keeps doing some ioctl and waking up
the device.

> 
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 22 +++++++++++++++++-----
> >   1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 9fbb6f6c598a..cc650a92c2fc 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -80,13 +80,15 @@ int xe_pm_suspend(struct xe_device *xe)
> >   	u8 id;
> >   	int err;
> > +	drm_dbg(&xe->drm, "Suspending device\n");
> > +
> >   	for_each_gt(gt, xe, id)
> >   		xe_gt_suspend_prepare(gt);
> >   	/* FIXME: Super racey... */
> >   	err = xe_bo_evict_all(xe);
> >   	if (err)
> > -		return err;
> > +		goto err;
> >   	xe_display_pm_suspend(xe);
> > @@ -94,7 +96,7 @@ int xe_pm_suspend(struct xe_device *xe)
> >   		err = xe_gt_suspend(gt);
> >   		if (err) {
> >   			xe_display_pm_resume(xe);
> > -			return err;
> > +			goto err;
> >   		}
> >   	}
> > @@ -102,7 +104,11 @@ int xe_pm_suspend(struct xe_device *xe)
> >   	xe_display_pm_suspend_late(xe);
> > +	drm_dbg(&xe->drm, "Device suspended\n");
> >   	return 0;
> > +err:
> > +	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> > +	return err;
> >   }
> >   /**
> > @@ -118,13 +124,15 @@ int xe_pm_resume(struct xe_device *xe)
> >   	u8 id;
> >   	int err;
> > +	drm_dbg(&xe->drm, "Resuming device\n");
> > +
> >   	for_each_tile(tile, xe, id)
> >   		xe_wa_apply_tile_workarounds(tile);
> >   	for_each_gt(gt, xe, id) {
> >   		err = xe_pcode_init(gt);
> >   		if (err)
> > -			return err;
> > +			goto err;
> >   	}
> >   	xe_display_pm_resume_early(xe);
> > @@ -135,7 +143,7 @@ int xe_pm_resume(struct xe_device *xe)
> >   	 */
> >   	err = xe_bo_restore_kernel(xe);
> >   	if (err)
> > -		return err;
> > +		goto err;
> >   	xe_irq_resume(xe);
> > @@ -146,9 +154,13 @@ int xe_pm_resume(struct xe_device *xe)
> >   	err = xe_bo_restore_user(xe);
> >   	if (err)
> > -		return err;
> > +		goto err;
> > +	drm_dbg(&xe->drm, "Device resumed\n");
> >   	return 0;
> > +err:
> > +	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
> > +	return err;
> >   }
> >   static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
