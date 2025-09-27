Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42582CAC5BD
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 23:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C1C10E1D1;
	Sat, 27 Sep 2025 23:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDjkkZmY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717B110E1D1
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 23:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759014694; x=1790550694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4zZbMg6kV6nDGYmryvbcyWRctuewnfRfOQvBmEL/DHU=;
 b=oDjkkZmY9Dcvp1LBZ/H0S/GE2txIxdY2Bg8QmBGErEJcU4recrNVHMxG
 5NLD9rUmDNBV8+px1lZorgzI0Qq2Uw2bT2CSDRSNvrPwgBqJW89P5oDK0
 EeZCLzmzSe/nxUdMvsLiKJKnMXt1B6NaEBVI6PuJu9v7Lab5caDsfQ9Av
 qog9NNWQfkg4+a4CkxZZVOb5cWVuKpa60fhIL6RAzai/fjcrRoPKznMfy
 y1FrZR/NLteIkRHxBUtLHAQpDXjMkcKzFurl5+40fgkN78dpGWGdpNkq8
 ePQND9d0ysSVUQxSqJfTdtbxVdfXb7G5NKY23xCBtGbNAmXGskmkXw9gT Q==;
X-CSE-ConnectionGUID: 2lR09qRbQhGXphIoUkL0Vg==
X-CSE-MsgGUID: fKKvvgozQvansBf93Uc0wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="64936186"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="64936186"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 16:11:33 -0700
X-CSE-ConnectionGUID: o7eEu+0iRVyf0EmYgwrNoQ==
X-CSE-MsgGUID: vmoYtvqsQImYrnRSCn/Y6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="178300161"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 16:11:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 16:11:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 16:11:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 16:11:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/vGW6if1VZxA/OKoh5JNVxN9S0g5DYkdIMpXs1K1/ohFKdWZEQGj6AfdTJPXIqk1BxH6yKPmRs8Z9ah3pCzliu0GYP+N7XuL6VfPkJiUvQ7EUYx4QKs4tmVGza1rt7TVgXsFIutIHTi+oPr9ot/cZN6kfjaBSlu3XGKGP4mTJ0HhkqVzYEM/BoziZAqApuzW+BJrztm0PMCztiXx15UR2PKIEN7jTQQd4p0HnWlVtF9tOGj//Sg2ukAXwNGd5rhi2HYnIDUL5Mb3xKq1zIC2PTAqFQ+v6rV0839jo/vdlTiaiB6GWF2033l66km5LeRW3kYgHv1PXa53NmlpmrfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRNgObnd+vaDUkeM+UYydg+VbR3rHm712efOgMB2aoo=;
 b=dN5EY/3P7PpT7IgbvIlmpd6luYY5cxFHNfHpf9nsoXj6Ol94HMDQ8lkVLmi6oyrZCsnwgOFeDcu61C35neygd0C0O66IE7aSOKVqU4vAfPBNwDzrM0MSaYY42Jmif6ewXPQ2zhrptvbD6XWyD8agFWy35wzBOZ/H8/LiOcC5mWqyMe0Yk/pzPw6kDj0x9yV2kpQDXQokYqcZnEJKFF/jL5e00VDKK6yNk6fgzaVGEjv9saX6cSuH7jYKay9r5uCp4oaAczfjVV67tU1d54knQqVoLUpNPnEFURz+99RgmNij5u9kQpEl6D4115ikkLHIhOHeOBh0rykZdeJUKadxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sat, 27 Sep
 2025 23:11:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 23:11:29 +0000
Date: Sat, 27 Sep 2025 16:11:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 26/34] drm/xe/vf: Replay GuC submission state on pause
 / unpause
Message-ID: <aNhvH/PJOY7X1YNX@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-27-matthew.brost@intel.com>
 <7d9b5b08-f9bb-40d1-8dd3-8a01ace4a76e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7d9b5b08-f9bb-40d1-8dd3-8a01ace4a76e@intel.com>
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 7061aae8-8fad-4b03-b867-08ddfe1b30ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ir2iTzrz/uqENIV9fnZu4iAyzWa3mOiRqiftNysR1y2iuAlY6I9+b3RfFFFW?=
 =?us-ascii?Q?VcnBoIY1ffLBaalATfm3ZoZN91oqlBMcC+YZQaUy4je2S5wZ4ZUSWl2Wk7Tb?=
 =?us-ascii?Q?ZJjqgRck/gaAAjU1zU6CvidKaCQkwKcb75WVkyG4M4OtwZcFttMC5Ax1nI0/?=
 =?us-ascii?Q?fyzReQmopg22Cozj474L+CliLaNR17CMr1bI1a+pQRHqDxN2k04XweCK3P1N?=
 =?us-ascii?Q?bzpZJugxfXO46XdE+35sx22CGvVpdapL0HqCvEywQnekHO318zBdoqTkG5g6?=
 =?us-ascii?Q?8Wl629ICr5bOJrGGhCBDSJcPSLCIdfNN8xdca8mInJLg7EEJ+2o7WEysV3jn?=
 =?us-ascii?Q?6F88q77Du4lxKje5VNpZ7SXlEggg1GbcZ6fETk5CpWsEevquXogKQ5hwoDQh?=
 =?us-ascii?Q?2SoBRbqgFrsoNa+Pvoj7q+5uLm5z+MypJsBhKXWHPi9X4tcAPu5xlDL8Efup?=
 =?us-ascii?Q?k0fSCSghUXyIfHMLdNS+J+oHgZOkOLwquWwPbf3PUPdd0NFIn+5EaOSJn7V0?=
 =?us-ascii?Q?FlWpa5f90GBnUF2NkFqdktk/SvC+q9nW9+8nrOPPabtAxcHJui7t7loYwYDr?=
 =?us-ascii?Q?S4c2dWima1vG3R0j64hU1QHTrdr/dqQ1g3xMHtVhVZ2PIgWqSCyb6zE7gXK4?=
 =?us-ascii?Q?7zTa1Ank5Cq/qi0280X8c2IHNvEoMhjrObWLYx2AitgYQ/aoJtveb17RpHI0?=
 =?us-ascii?Q?VnKH4fC8C6QTzvyE8GTK11gB8U9IPLs9TUDMUmelEFlOdnYwDSk2txVWKdxh?=
 =?us-ascii?Q?dMUKbMYVr+sPzBwKwj8xiVruDQXBWgdllNHir3YryzcEr4mPw30NmV7DwYws?=
 =?us-ascii?Q?44LO4uAPP5Irw6Fezb8UZc2nx2DeWyEtn2AMdt5i6d6EY/jDghQoBWMZTIXt?=
 =?us-ascii?Q?f19e90paDzfF+jh03ZtvpcYVABA2Kqu23l+ThiO+bnUSc2EhYnFo6X5UC9Ut?=
 =?us-ascii?Q?VrUDfU8iACpRkOyD4kr/h7XCS/p8DQUSCruSbIY3ijFqYrrOPjDU2jzBesti?=
 =?us-ascii?Q?ml/qgLe/bCfiabVAMUUPPAMD9xzVGOHDboo+AeA3n2VV/NAq09akBaVCedC3?=
 =?us-ascii?Q?iyPU2XA3a9w7xNnH4ognGkQqYJ8eiOGu3VAIu81IIuABueRjCq7kpMfIEI4r?=
 =?us-ascii?Q?qjwGUvqGmyZ8HPAKCKmHrsZUjnpLxCi7Ze4scG8uukzTyiuymuYBLIhafilm?=
 =?us-ascii?Q?QW4pO7Q4LcEiKu79ikdNhQiSYTndDBf8FgEW7/lf8MOhRG3ybY1+mJ2WtKFw?=
 =?us-ascii?Q?T3smlRLGENk+FYKaFVb8d5lY5VTAkozerQyHLP7k5D2JBdVb00M4Xhi1RNuv?=
 =?us-ascii?Q?CIk8pg5zR1XtTeQcmi6O6ikFQcugiIQQKWkRjRvM7CbOgjxSGp9aPqS/qKDN?=
 =?us-ascii?Q?z3bQ07e5zheURr/9z2mcEynu+qzmaAr2WqDHcZLsFhgXHSS5dRlTI4NDJP/a?=
 =?us-ascii?Q?Yh/gf1vig6aWhMUnlyNyM/nMANq6nhtx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4PgTece0ia8j3mhZPb6nFmYXlYVnlESORDeoV77a8cRvk5Fg0h6RST8TckXz?=
 =?us-ascii?Q?zMHeI819Hr0Ju5h3C2ytHFmF1gBUYWp6agckQzgps/WGjw36eQCcw0gH365D?=
 =?us-ascii?Q?QGz+K0nVoWAaoiqN0Ch38nZiBlLcOle+tWaW/QOeYG57mMxGgFVoerysD3y5?=
 =?us-ascii?Q?kmUzT/pBbiSF+VkbJ3RdgHvyOf6FT/R/D1/gYzeWsDfhsFq8p/8TUrp424Pn?=
 =?us-ascii?Q?Or96afzEIJVHxg2gEDBYA5E6THAcfGdbpzVZJEpq8JaUUNZLSqAOgmmES4r3?=
 =?us-ascii?Q?4N9zRV4ojRLN2o/F3ILa9XIJABFIvsNiBRumVCiamzAYZmVzQ1ZsnZhYKSQe?=
 =?us-ascii?Q?UKd1nDmK2APXGPsNmaGMUJMeUQiQ9xPn11vqncfcBotRVVFDzcCVtOsH+K5R?=
 =?us-ascii?Q?tuw9ccDHgKPm4nCeMBZVE9n689crTcHwsZsDy3r6zkvn+TxctRV/TEWDXluI?=
 =?us-ascii?Q?xQFLBjvpxqy/mTH/hxxpN87yKi5PsA2mYiQab1W89k6QufjJYM2CI/j3osvW?=
 =?us-ascii?Q?mECgDevhjbRa2zrXlNusklvTepMJn38By8cB2+FtUdtWMIR0mlj/pamGJ4oO?=
 =?us-ascii?Q?Syx5CMqV7Sox/4uhmzO1+f2V7m2EVvxGhDXui7wopeUjBiEjvBBtxN5E1x56?=
 =?us-ascii?Q?fP0BoLQrgUk3ZpEQxtNvKeJad5TmBDtBxEv9mnp1kt4S0qqPlJ6IuKMgu0xX?=
 =?us-ascii?Q?liqT4pPjftE6JWvTCFmLgk/jXyd1iVrouYkw9aVllwYq/ZJ30Svi26hPN/Lu?=
 =?us-ascii?Q?ryUD1mX/n+1MBhS5jqAMvCULIv0drcVHk9EK204ZdMoMgx4beSt+authMmqp?=
 =?us-ascii?Q?AHeqmdGTttcQ0FeEmDRGBDzMvr3ce2UdqT5gnRDyI80nWx45Ze9KRyW0UQQ6?=
 =?us-ascii?Q?JEr2njNDlXPcmvGb0Q1HV3x+HjiUxRw2RDE1mQyEe+ifxM6Tm7tSOJnImkPr?=
 =?us-ascii?Q?ep0TmycASBYoCWDrWMs+ygb5c/x91uVtdzuJX8bN4jYG6wYq0kgL3LVWHDxd?=
 =?us-ascii?Q?/mpgAFa+LtOy6L/ggjgCqxvpCEUmf2bTQbyDR+RPT/K7Qn294ZGQXLchQi5D?=
 =?us-ascii?Q?qtiSkJkeFFljLfHKRSpfZcFj1qt54L/yqJRXiivWz8E/zd4AQr+I+jC6TXOc?=
 =?us-ascii?Q?mkOO0jWBJF0n+fVybGRgzuyLWVVnDKJTyScA33bELb2K0lKZyZSqkh0DWey4?=
 =?us-ascii?Q?bg7gUfDJmN5UoXbhtRchaeqgHV0v3Zc7UShp89Pbh1RT4769NdpJHIolA7ZI?=
 =?us-ascii?Q?dcJGPGEhlGDBvxDptDF9G031YEGIIX3pN0gptiyjrW6ZHszQSzRFnumyAGu5?=
 =?us-ascii?Q?tdkKYPTqIvPOAcrs7YwlQkFqQxELmiuDKvF06jL8eqDP4zcMIQz+YqkbNiux?=
 =?us-ascii?Q?i9tMz3bUHrky4WcfmBYeAyEhR8ighqndwOm1MWKnBW5kq2Y5mKD7zcgWrEtU?=
 =?us-ascii?Q?E98sCyw1w9yJP1b+2saOmTHcKOc1uNzUOCniPjcw6q3Sf+RxJqY7CoBGJEsE?=
 =?us-ascii?Q?qaKeqvi1DEPnsr+ykwvBmZna4SIsQ7rAOF0n4xW1uZFnY8Zkjeinx/A7NqRT?=
 =?us-ascii?Q?cFdWJRB8GIcVd7xT9rah2ziUze8tFuLO5iCwyut0KYQ41sXqNR/aAZwW0Pvz?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7061aae8-8fad-4b03-b867-08ddfe1b30ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 23:11:29.6470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ULS76Yck5POvjPrnNdT/bZvnHEbRDwbxAfBcaw4g4QeqpU5Bm0wGHndKoAI7Dkdvq4fNOYj1GP36+XONeFOhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8428
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

On Sat, Sep 27, 2025 at 03:33:43PM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > Fixup GuC submission pause / unpause functions to properly replay any
> > possible state lost during VF post migration recovery.
> > 
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 ++
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 +
> >   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 ++
> >   drivers/gpu/drm/xe/xe_guc_submit.c           | 225 +++++++++++++++++--
> >   drivers/gpu/drm/xe/xe_guc_submit.h           |   1 +
> >   drivers/gpu/drm/xe/xe_sched_job_types.h      |   4 +
> >   7 files changed, 247 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index 455ccaf17314..af300adc7e1a 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -135,3 +135,17 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> >   	list_add_tail(&msg->link, &sched->msgs);
> >   	xe_sched_process_msg_queue(sched);
> >   }
> > +
> > +/**
> > + * xe_sched_add_msg_head() - Xe GPU scheduler add message to head of list
> > + * @sched: Xe GPU scheduler
> > + * @msg: Message to add
> > + */
> > +void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> > +			   struct xe_sched_msg *msg)
> > +{
> > +	lockdep_assert_held(&sched->base.job_list_lock);
> > +
> > +	list_add(&msg->link, &sched->msgs);
> > +	xe_sched_process_msg_queue(sched);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index e548b2aed95a..010003a6103a 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -29,6 +29,8 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
> >   		      struct xe_sched_msg *msg);
> >   void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> >   			     struct xe_sched_msg *msg);
> > +void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> > +			   struct xe_sched_msg *msg);
> >   static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index a987560de2c7..91e7dbe80ab2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1217,6 +1217,7 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
> >   static void vf_post_migration_rearm(struct xe_gt *gt)
> >   {
> >   	xe_guc_ct_restart(&gt->uc.guc.ct);
> > +	xe_guc_submit_unpause_prepare(&gt->uc.guc);
> >   }
> >   static void vf_post_migration_kickstart(struct xe_gt *gt)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index c30c0e3ccbbb..a3b034e4b205 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -51,6 +51,21 @@ struct xe_guc_exec_queue {
> >   	wait_queue_head_t suspend_wait;
> >   	/** @suspend_pending: a suspend of the exec_queue is pending */
> >   	bool suspend_pending;
> > +	/**
> > +	 * @needs_cleanup: Needs a cleanup message during VF post migration
> > +	 * recovery.
> > +	 */
> > +	bool needs_cleanup;
> > +	/**
> > +	 * @needs_suspend: Needs a suspend message during VF post migration
> > +	 * recovery.
> > +	 */
> > +	bool needs_suspend;
> > +	/**
> > +	 * @needs_resume: Needs a resume message during VF post migration
> > +	 * recovery.
> > +	 */
> > +	bool needs_resume;
> >   };
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 8bee65dd9ca6..b112a4a91a5b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -425,6 +425,11 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_DESTROYED, &q->guc->state);
> >   }
> > +static void clear_exec_queue_destroyed(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_DESTROYED, &q->guc->state);
> > +}
> > +
> >   static bool exec_queue_banned(struct xe_exec_queue *q)
> >   {
> >   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
> > @@ -505,7 +510,12 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> >   }
> > -static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
> > +static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > +}
> > +
> > +static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> >   {
> >   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> >   }
> > @@ -520,7 +530,7 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> >   	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> >   }
> > -static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > +static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> >   {
> >   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
> >   }
> > @@ -1080,7 +1090,7 @@ static void wq_item_append(struct xe_exec_queue *q)
> >   }
> >   #define RESUME_PENDING	~0x0ull
> > -static void submit_exec_queue(struct xe_exec_queue *q)
> > +static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
> >   {
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	struct xe_lrc *lrc = q->lrc[0];
> > @@ -1092,10 +1102,13 @@ static void submit_exec_queue(struct xe_exec_queue *q)
> >   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > -	if (xe_exec_queue_is_parallel(q))
> > -		wq_item_append(q);
> > -	else
> > -		xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> > +	if (!job->skip_emit || job->last_replay) {
> > +		if (xe_exec_queue_is_parallel(q))
> > +			wq_item_append(q);
> > +		else
> > +			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> > +		job->last_replay = false;
> > +	}
> >   	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
> >   		return;
> > @@ -1148,8 +1161,10 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> >   		if (!exec_queue_registered(q))
> >   			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > -		q->ring_ops->emit_job(job);
> > -		submit_exec_queue(q);
> > +		if (!job->skip_emit)
> > +			q->ring_ops->emit_job(job);
> > +		submit_exec_queue(q, job);
> > +		job->skip_emit = false;
> >   	}
> >   	/*
> > @@ -1860,6 +1875,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> >   #define RESUME		4
> >   #define OPCODE_MASK	0xf
> >   #define MSG_LOCKED	BIT(8)
> > +#define MSG_HEAD	BIT(9)
> >   static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> >   {
> > @@ -1984,12 +2000,24 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
> >   	msg->private_data = q;
> >   	trace_xe_sched_msg_add(msg);
> > -	if (opcode & MSG_LOCKED)
> > +	if (opcode & MSG_HEAD)
> > +		xe_sched_add_msg_head(&q->guc->sched, msg);
> > +	else if (opcode & MSG_LOCKED)
> >   		xe_sched_add_msg_locked(&q->guc->sched, msg);
> >   	else
> >   		xe_sched_add_msg(&q->guc->sched, msg);
> >   }
> > +static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
> > +					    struct xe_sched_msg *msg,
> > +					    u32 opcode)
> > +{
> > +	if (!list_empty(&msg->link))
> > +		return;
> > +
> > +	guc_exec_queue_add_msg(q, msg, opcode | MSG_LOCKED | MSG_HEAD);
> > +}
> > +
> >   static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> >   				       struct xe_sched_msg *msg,
> >   				       u32 opcode)
> > @@ -2264,6 +2292,93 @@ void xe_guc_submit_stop(struct xe_guc *guc)
> >   }
> > +/*
> > + * This function is quite complex but only real way to ensure no state is lost
> > + * during VF resume flows. The function scans the queue state, make adjustments
> > + * as needed, and queues jobs / messages which replayed upon unpause.
> > + */
> > +static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
> > +{
> > +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +	struct xe_sched_job *job;
> > +	bool pending_enable, pending_disable, pending_resume;
> > +	int i;
> > +
> > +	lockdep_assert_held(&guc->submission_state.lock);
> > +
> > +	/* Stop scheduling + flush any DRM scheduler operations */
> > +	xe_sched_submission_stop(sched);
> > +	if (xe_exec_queue_is_lr(q))
> > +		cancel_work_sync(&q->guc->lr_tdr);
> > +	else
> > +		cancel_delayed_work_sync(&sched->base.work_tdr);
> 
> We're doing the same cancelling in `__guc_exec_queue_destroy_async()`, maybe
> close it into a function?
> 

I could but in follow up I'm going to drop &q->guc->lr_tdr and just use
DRM scheduler TDR so it will just be cancel_delayed_work_sync. I have
the code for this lying around and there a couple of upcoming features
this will get simplified if &q->guc->lr_tdr is droppped. 

> > +
> > +	pending_enable = exec_queue_pending_enable(q);
> > +	pending_resume = exec_queue_pending_resume(q);
> > +
> > +	if (pending_enable && pending_resume)
> > +		q->guc->needs_resume = true;
> > +
> > +	if (pending_enable && !pending_resume &&
> > +	    !exec_queue_pending_tdr_exit(q)) {
> > +		clear_exec_queue_registered(q);
> > +		if (xe_exec_queue_is_lr(q))
> > +			xe_exec_queue_put(q);
> > +	}
> > +
> > +	if (pending_enable) {
> > +		clear_exec_queue_enabled(q);
> > +		clear_exec_queue_pending_resume(q);
> > +		clear_exec_queue_pending_tdr_exit(q);
> > +		clear_exec_queue_pending_enable(q);
> > +	}
> > +
> > +	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> > +		clear_exec_queue_destroyed(q);
> > +		if (exec_queue_extra_ref(q))
> > +			xe_exec_queue_put(q);
> > +		else
> > +			q->guc->needs_cleanup = true;
> > +		clear_exec_queue_extra_ref(q);
> > +	}
> > +
> > +	pending_disable = exec_queue_pending_disable(q);
> > +
> > +	if (pending_disable && exec_queue_suspended(q)) {
> > +		clear_exec_queue_suspended(q);
> > +		q->guc->needs_suspend = true;
> > +	}
> > +
> > +	if (pending_disable) {
> > +		if (!pending_enable)
> > +			set_exec_queue_enabled(q);
> > +		clear_exec_queue_pending_disable(q);
> > +		clear_exec_queue_check_timeout(q);
> > +	}
> 
> maybe we can close the above into a separate function as well?
> 
> ie. guc_exec_queue_undo_unfinished_state_change()?
> 

Do you mean all the parsing of exec queue state into a single function?
That seems reasonable. I don't really want to abstract each individual
if statement here as that in IMO that is too much abstraction and hard
to figure out what is exactly going on.

> guc_exec_queue_revert_pending_state_change()?
> 
> That would make this function easier to read, but also describe what we're
> doing.
> 
> Then, a counterfunction could be ripped out of guc_exec_queue_unpause().
> 
> > +
> > +	q->guc->resume_time = 0;
> > +
> > +	if (xe_exec_queue_is_parallel(q)) {
> > +		struct xe_device *xe = guc_to_xe(guc);
> > +		struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> > +
> > +		for (i = 0; i < WQ_SIZE / sizeof(u32); ++i)
> > +			parallel_write(xe, map, wq[i],
> > +				       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> > +				       FIELD_PREP(WQ_LEN_MASK, 0));
> 
> ok so for parallel wq we're NOP'ing everything and adding the items back at
> new positions? Maybe a comment here would help in understanding that.
> 

Yes, the GuC didn't like messing with the head / tail. I can add a
comment.

Matt

> -Tomasz
> 
> > +	}
> > +
> > +	job = xe_sched_first_pending_job(sched);
> > +	if (job) {
> > +		/*
> > +		 * Adjust software tail so jobs submitted overwrite previous
> > +		 * position in ring buffer with new GGTT addresses.
> > +		 */
> > +		for (i = 0; i < q->width; ++i)
> > +			q->lrc[i]->ring.tail = job->ptrs[i].head;
> > +	}
> > +}
> > +
> >   /**
> >    * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
> >    * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> > @@ -2273,8 +2388,12 @@ void xe_guc_submit_pause(struct xe_guc *guc)
> >   	struct xe_exec_queue *q;
> >   	unsigned long index;
> > +	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> > +
> > +	mutex_lock(&guc->submission_state.lock);
> >   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > -		xe_sched_submission_stop_async(&q->guc->sched);
> > +		guc_exec_queue_pause(guc, q);
> > +	mutex_unlock(&guc->submission_state.lock);
> >   }
> >   static void guc_exec_queue_start(struct xe_exec_queue *q)
> > @@ -2323,11 +2442,87 @@ int xe_guc_submit_start(struct xe_guc *guc)
> >   	return 0;
> >   }
> > -static void guc_exec_queue_unpause(struct xe_exec_queue *q)
> > +static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> > +					   struct xe_exec_queue *q)
> >   {
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +	struct drm_sched_job *s_job;
> > +	struct xe_sched_job *job = NULL;
> > +
> > +	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > +		job = to_xe_sched_job(s_job);
> > +
> > +		q->ring_ops->emit_job(job);
> > +		job->skip_emit = true;
> > +	}
> > +
> > +	if (job)
> > +		job->last_replay = true;
> > +}
> > +
> > +/**
> > + * xe_guc_submit_unpause_prepare - Prepare unpause submission tasks on given GuC.
> > + * @guc: the &xe_guc struct instance whose scheduler is to be prepared for unpause
> > + */
> > +void xe_guc_submit_unpause_prepare(struct xe_guc *guc)
> > +{
> > +	struct xe_exec_queue *q;
> > +	unsigned long index;
> > +
> > +	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> > +
> > +	mutex_lock(&guc->submission_state.lock);
> > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > +		guc_exec_queue_unpause_prepare(guc, q);
> > +	mutex_unlock(&guc->submission_state.lock);
> > +}
> > +
> > +static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
> > +{
> > +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +	struct xe_sched_msg *msg;
> > +	bool needs_tdr = exec_queue_killed_or_banned_or_wedged(q);
> > +
> > +	lockdep_assert_held(&guc->submission_state.lock);
> > +
> > +	xe_sched_resubmit_jobs(sched);
> > +
> > +	if (q->guc->needs_cleanup) {
> > +		msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> > +
> > +		guc_exec_queue_add_msg(q, msg, CLEANUP);
> > +		q->guc->needs_cleanup = false;
> > +	}
> > +
> > +	if (q->guc->needs_suspend) {
> > +		msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> > +
> > +		xe_sched_msg_lock(sched);
> > +		guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
> > +		xe_sched_msg_unlock(sched);
> > +
> > +		q->guc->needs_suspend = false;
> > +	}
> > +
> > +	/*
> > +	 * The resume must be in the message queue before the suspend as it is
> > +	 * not possible for a resume to be issued if a suspend pending is, but
> > +	 * the inverse is possible.
> > +	 */
> > +	if (q->guc->needs_resume) {
> > +		msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> > +
> > +		xe_sched_msg_lock(sched);
> > +		guc_exec_queue_try_add_msg_head(q, msg, RESUME);
> > +		xe_sched_msg_unlock(sched);
> > +
> > +		q->guc->needs_resume = false;
> > +	}
> >   	xe_sched_submission_start(sched);
> > +	if (needs_tdr)
> > +		xe_guc_exec_queue_trigger_cleanup(q);
> > +	xe_sched_submission_resume_tdr(sched);
> >   }
> >   /**
> > @@ -2339,10 +2534,10 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
> >   	struct xe_exec_queue *q;
> >   	unsigned long index;
> > +	mutex_lock(&guc->submission_state.lock);
> >   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > -		guc_exec_queue_unpause(q);
> > -
> > -	wake_up_all(&guc->ct.wq);
> > +		guc_exec_queue_unpause(guc, q);
> > +	mutex_unlock(&guc->submission_state.lock);
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index fe82c317048e..b49a2748ec46 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
> >   int xe_guc_submit_start(struct xe_guc *guc);
> >   void xe_guc_submit_pause(struct xe_guc *guc);
> >   void xe_guc_submit_unpause(struct xe_guc *guc);
> > +void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
> >   void xe_guc_submit_pause_abort(struct xe_guc *guc);
> >   void xe_guc_submit_wedge(struct xe_guc *guc);
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 7ce58765a34a..13e7a12b03ad 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -63,6 +63,10 @@ struct xe_sched_job {
> >   	bool ring_ops_flush_tlb;
> >   	/** @ggtt: mapped in ggtt. */
> >   	bool ggtt;
> > +	/** @skip_emit: skip emitting the job */
> > +	bool skip_emit;
> > +	/** @last_replay: last job being replayed */
> > +	bool last_replay;
> >   	/** @ptrs: per instance pointers. */
> >   	struct xe_job_ptrs ptrs[];
> >   };
