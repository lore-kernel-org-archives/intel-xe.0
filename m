Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221D3C27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 01:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7566610E11B;
	Thu, 13 Jun 2024 01:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ed/e3p1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4482D10E11B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 01:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718243305; x=1749779305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CeQNh19CgcN5D++vGU0qrToKGumBFgRMTZDkbZg96W8=;
 b=ed/e3p1YHsA7yj+TDo08BvKhT1C+f0xZLgqylmbRN1um8Bd6hgV/HUjn
 X7cuSuSkgmTu839QZEJf8Cim0dA+I+DpDsEck+7SnXo7mwrz4PnQTs8Za
 W4MV1bwnU+PtqZMFiisMaA/wbZCKB5CHgQyagZH34cvFD7BW+E/1cOu7p
 9oGiaZe6tYMVtJBTVUqH2UZSIA4mWFv0i5zNahern0Xk0Cn7XQddsDm3V
 EHGPzOmPaNg2EiKJO8KZVaUoImQsK4aB19WOyhryhkm4jwGd2mF1PzNNb
 nlacXgCRluAE2IkgDR4IHxd3vgWHOn0uKt1M1fuEkl+3hdya6cKWumwEX Q==;
X-CSE-ConnectionGUID: 3QN7tkBQT4Sc4OO4wunD7w==
X-CSE-MsgGUID: fglluRJ/TQakEGQQP118sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="37556366"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="37556366"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 18:48:21 -0700
X-CSE-ConnectionGUID: Uixe6h6mSOyiC53IlduBBg==
X-CSE-MsgGUID: zO/51I7ORIuY6UDJkw1jbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="70767430"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 18:48:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 18:48:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 18:48:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 18:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U198Osm1urUc9aQCJG4B2BK7xgywlP7w3vXpYvTkTa1z7ok1KhtgjtNaYy7Rt60OApCrmA6Ve+gTtVtsqByUxs8//o5ea4qnqKl0GMViQRKrpvFGaf8KsAgHw54lz4DwFGwk51OvnE0KtGfuWDpb7SO24fz0C68zh/iXzAzi+zcIWNnmGjhQnPVKCohEy1dsZCBgavf+PXJF0PcLIa4ofz4IAJr+0jD7D27p7Gqih7UQdpbCAk1Fed65WEww2LfOMpPvG0KG/LEcUnyakKTqIwdbnwakKHGjWjOMkNm9wVdUuiFSFG7pFulu/ldmEaPzmFtwmKl7KzLCXQCkRAEA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvolP3t5kn5jXMtj/prMPifhPCBdtIgLiPbVDmQlQzg=;
 b=QQLISUqV4cK4OwP9OT3JylXzzsjX4bP5xQx9Hbq9cMz95n6CjCevgwcWSHD0aieqVx4l6t1N3socbuTdwTcqEChcBnjOcEqlUKxjg2NamVJJU+fF38DvmdWEl0H0CvDLxrIJ0rHB1b7nx1mg4hdnWXv1F6ArvxbojX8/DXEpfXYvuxxASPusvJ3zESdn1ZpeXPwDwUibgd/FdAq+5Sq9AXX0Dn3Xfj6E1ZWbRFzp7lpk8VVNUT8V+KqbBZ/UmUJRamN8i7F7ZO7Pw1noL8f8aziTbk3As+roIjH5mONUvnQLvp1ydQSATWiUmuDHpMoaIpwJmRLdh4DCPU/Iy8Fhdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB6604.namprd11.prod.outlook.com (2603:10b6:806:270::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 01:48:17 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 01:48:17 +0000
Date: Thu, 13 Jun 2024 01:47:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 07/11] drm/xe: Assert runnable state in
 handle_sched_done
Message-ID: <ZmpPvPMnHhUL5ttV@DUT025-TGLU.fm.intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-8-matthew.brost@intel.com>
 <70b451a2-b23d-47ce-8d20-501046744959@intel.com>
 <Zmog3JDBVPcX71Ru@DUT025-TGLU.fm.intel.com>
 <72968729-ac99-4e63-bd2c-ebf1d6d3df25@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <72968729-ac99-4e63-bd2c-ebf1d6d3df25@intel.com>
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 241fe75f-8762-4e36-3374-08dc8b4ae585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BPwQkjXBpu7/zQ0h9zBs7D/JPcGiFDZ+PMmhgySg+YevCRYRG6EVOHbUuL1z?=
 =?us-ascii?Q?eAlr1d9jw4hF4U2qk941tIezhilfKQr63AptAVegmjMPxHfsJNLuK1dF5hbz?=
 =?us-ascii?Q?51WIUaeRvhfrNIiH6k8GbgBz5wor8xWeeatrYYRYsR2jNIdXFQLZKHatdULh?=
 =?us-ascii?Q?wUd48QBvNtz0NmoqfjwEKRvG+Z4cg92IzaW6lxpPG2fUsApRw4C02WSi3GPn?=
 =?us-ascii?Q?3k9GNjVFk7I94ZiVIUwjE4Kl2tQfH5SuH6ehyNA3gFFxQ+2rCxQJdTtUHcX1?=
 =?us-ascii?Q?MBVP/RX6yzO8jRewWfL3PQfpqkFMAWgeHBqcc4NTMXcOCy7tGncwQWEc+JLJ?=
 =?us-ascii?Q?mYTQ5vovYI9sVkAMXX6EQArmcaNwnL73xA2g/svVGZmDdRzI5AglOlKnFHah?=
 =?us-ascii?Q?vY8m8MKoRQar7waWaCbHNTIED5eU8RmzBTWG7s5eEgvK/kFcztD4Y4fIvosT?=
 =?us-ascii?Q?PtL0ce99bKSHwuey52Cmmx+s+L4JD1X6pF5zO89ePH86IwxMhGLMsYl7m1q3?=
 =?us-ascii?Q?l01KYcdj0l9WD4LochmUgm3hw1cZXjhDxexXxbLoSnxKV6XTe9ywVwGTZw8n?=
 =?us-ascii?Q?enoBwssEY97upajSAiDoGeZgz8jHyMqgMO0S6p2vRkiyLOswCqKxZccOXqBA?=
 =?us-ascii?Q?YMxHqdABkGHFgAdt1IANWSN7q0eOXtDg04aNIi7+2o+KrOKAVPpR3L2X4kO2?=
 =?us-ascii?Q?bMxysSZfg/uzLMIl/H/bO/4lsGSx9aJOa9wGQMjG23/6L/o2ONu0/i+98GZp?=
 =?us-ascii?Q?k5vTu1w8zF4DwCfu6RYFC1kFZpR1a+bBjtUGFTP/rQHCz8r/UQ/AYic8Gniu?=
 =?us-ascii?Q?BuVt9ORM498WuTzMRwl2H/GACNWE1JoCVUByhN1vPdvmfc4ng/78zOh6ZDie?=
 =?us-ascii?Q?tSU1QpCFXHcCNi4jbYMrT0WuQIUS6ATTPq21A2ul2/WFVlL/WiVbMEkP+UYf?=
 =?us-ascii?Q?xg8iKOP6PAnEpRgqdYGy3ebMwmKQ6m0jCB8/CwgIGWvgz1PCM+6yyAR7Cg2M?=
 =?us-ascii?Q?+Ale0F8x1SD96Xao4jUArnFSvHFKdrzV7wHyCMBe/L64feQ1jD2TsQkYG1Fp?=
 =?us-ascii?Q?ufWuxrCZy2WA1BNoR2j5R7sSn5z6bODFMaR0w0Hua4wMCLgNklHzWxUpSazj?=
 =?us-ascii?Q?BCCTNPPQmKgZ1qrOpMW/PrWYQ8U4sHCMylquVPY76Nufd2mha/qZ+khuI3DS?=
 =?us-ascii?Q?fPTinDuihnke0jjYhFqduhKnUFAVoOZ4kH3ZRQKFsfASjTxXVXhngGMEUHUD?=
 =?us-ascii?Q?HymUdp90VVaKR04yoyNBtyLtmbCqt2COKTpXNoAH9IZ/zI3rOyYj+pxGj0EP?=
 =?us-ascii?Q?05KECGXabanSYnCnTPXkn7Qp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ekCrJMzxxO1n2vAaS/bh+jkX1L28xqbTChKBv3sMXyftPGGkRjDiS4OIypdF?=
 =?us-ascii?Q?FQbcWkLN2aR/80/z6fezVQmrnZkFGhNMjjefAsoWaHNOyJIRLyOhZDZ+t0Ky?=
 =?us-ascii?Q?u/zkbxFu6T5ZbZo+Op+FCxjqj24bv6S18gkXC0A26fExGTwLEabBVJXIaO7J?=
 =?us-ascii?Q?W/aU9h+MXqYJfAaQp3Mc4xtk7pshyEJ0VFT20n/7hOI/CoqlfTMISexjTBG+?=
 =?us-ascii?Q?Rm2TYV4yFHiyZQ8wQaFhHo0kQPZF1vdRFuq46nsbhisYSmIXPV8nhD+TyJNO?=
 =?us-ascii?Q?Fsd9FosqswAqVz3o49+6UoX/PgAMGZRNk+EayR77AJDJwWjMHyjaJBDQZAA6?=
 =?us-ascii?Q?FExldKSqAKrHOscpVcSO5F4nGZIjDR272bNxN+5dPhPoCvH9SzelmtP+uTSn?=
 =?us-ascii?Q?YmaAnYriVSCXBJ0mCWR0rnB0UIHfijA0qGZqpi0IQPDhJb7+8+MUeBN7WC9+?=
 =?us-ascii?Q?cXcR6BJxXdWuD84NTbVDjS3i4JJvAjI6lQOmD/ghawM98YACIxF0GWVTgZxw?=
 =?us-ascii?Q?zEIEYmuZt8zgZ9BsQe20QgjDfYNb2P1WQ+XE3wbdCDHaM+F/CLlFDmQdoSJF?=
 =?us-ascii?Q?+rOa89RJR0uJIfCGHCfl16s9vIkDU/bJxHzezZFZfVVPIGYvlBT5TI9cFBDz?=
 =?us-ascii?Q?dguKPoX/I6DI8+23S1tKe9RRGjhHbHS46yK7t8JhOY/7REV/ENApZhZ1/ohy?=
 =?us-ascii?Q?pf5AaB9AeLIsndY0ZtFthw9GteUcuiRXaXLjoorUKNeEeAOMbYfABLdAHYSw?=
 =?us-ascii?Q?MFVMsf7GG14lyqCDAjpLha6kSpoXUbu4YC7w6Oz7ZzaqoUtLel1VzR/9O31y?=
 =?us-ascii?Q?7rj4K2+98QHQHie/a3nKRk5TTSMG5BESKcMd19hz9nGf35QPL/t+hMWJy28g?=
 =?us-ascii?Q?6FpE/2+ZM7sZZxjnTTLKz+kTt/ApsIuk5hrM453tmnxAsQcem2W0nL90IFZz?=
 =?us-ascii?Q?RpNR+EbdPZr+HwaNMsq2yGpiEl15LDFYjntPyGEsVvu0uRR84xxb82Sts6HZ?=
 =?us-ascii?Q?Uii9adEaRREVEg1T+R4vw+4WHe3bTsudVeCtNK9C3nndiJylOvJ/8A0V2U4p?=
 =?us-ascii?Q?MO27+GzTIw/bAOekNct4GIHQ+0yDJBBtZUiKL7UXy7teUImFwzpi4/H9dsFI?=
 =?us-ascii?Q?f68xVCxgk7SHKUJcvZAbhbt+w/VHZdEWgH4TDFs6dAoGUxYRxbE3fUL7lYAa?=
 =?us-ascii?Q?+ftupYOnjHJN9JyWpvyQtSHVl+gJ2JfgpUa6fAoHAgsJHdokYleyNjHEhrqt?=
 =?us-ascii?Q?PnPdXz/CCgLJLTOSeLKd7gsZYQLGtsMeH052n/eEAUXtuTrtyBwYjkcMnoTR?=
 =?us-ascii?Q?NbNRxXFh4JU1gpmGX3WBXJeS8GZOIhG2SGto4FGXU0lcOjLSeupYt/IT0LrF?=
 =?us-ascii?Q?HVbxBv8bSi/Q5AGmw2sfvLvZmbMPwgwiZhBGIMoaPgK9vTMn3T9rNtymuB0C?=
 =?us-ascii?Q?0+x49GEtRIFy3SbbsfLANZ61nbprIilbvmsnA8K54goS4LxjxdJGClr1WdpO?=
 =?us-ascii?Q?h2CzXGr+7STLs/c0l6FN6b7oUzC8vuI7czTwbkE1UQ0FRNYcloAvwIrTJFVD?=
 =?us-ascii?Q?qMU6ZbOYzXLfZ6T6T7VcuGz+rDo31tM9gQkC0EG223PU9Nf5SBKxWrtvDUXN?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 241fe75f-8762-4e36-3374-08dc8b4ae585
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 01:48:17.6022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4AeMwtvrTjI/eLB74ORhg3FtH0Y+FXW6kpKce4/N8x6JdNF+ihA5KFr/x+OAdB1phSZhTwt4E9Uz9n9d4tUpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6604
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

On Wed, Jun 12, 2024 at 05:54:30PM -0700, John Harrison wrote:
> On 6/12/2024 15:27, Matthew Brost wrote:
> > On Wed, Jun 12, 2024 at 02:25:40PM -0700, John Harrison wrote:
> > > On 6/11/2024 07:40, Matthew Brost wrote:
> > > > Ensure G2H and KMD GuC machine match.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
> > > >    1 file changed, 7 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index afd22a8d815d..ab0dc93d7740 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1592,16 +1592,21 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > > >    	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> > > >    }
> > > > -static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > +static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > > > +			      u32 runnable_state)
> > > >    {
> > > >    	trace_xe_exec_queue_scheduling_done(q);
> > > >    	if (exec_queue_pending_enable(q)) {
> > > > +		xe_gt_assert(guc_to_gt(guc), runnable_state == 1);
> > > > +
> > > >    		q->guc->resume_time = ktime_get();
> > > >    		clear_exec_queue_pending_enable(q);
> > > >    		smp_wmb();
> > > >    		wake_up_all(&guc->ct.wq);
> > > >    	} else {
> > > > +		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> > > > +
> > > Isn't this the wrong way around?
> > > 
> > These asserts are per my testing and CI.
> > 
> > > You made an earlier comment that sounded like it is legal for an enable to
> > > be queued while a disable is still pending? If so, then you would get in
> > Other way around, a disable can be sent when an enable is still in
> > flight in the case of a preempt fence.
> > 
> > Enables cannot be issued when a pending disable is in flight.
> > 
> > So I believe this patch is correct.
> It might work but it does not feel correct.
> 
> On receipt of a disable notification, the code first checks to see if there
> is a pending enable. That just seems backwards. It is more logical to
> process the message according to the message type actually received rather
> than according to the message type that is expected.
> 
> If there is ever a valid reason for sending back to back
> disable-then-enable, then this will break. Whereas, coding it according to
> the notification type rather than the internal state would allow that
> sequence to work just fine.
> 

Can I do this in a follow up? Like immediately after merging this? I
suggest this as this series has green CI, RBs, will help stablize the
stack for VK (issue #799), ack'd by Paulo, and fixes a known gap in our
job timeout mechanism.

Matt

> As I mentioned earlier, this code is basically broken in i915 and can't be
> fixed without a significant re-write of the upper layers. It would be
> greatly preferable to do it properly in Xe.
> 
> John.
> 
> 
> > 
> > Matt
> > 
> > > here for the disable notification but with both enable_pending and
> > > disable_pending flags set. That would hit the assert. Whereas, if the if
> > > checks the runnable_state parameter and the assert then checks for pending,
> > > you will not hit the assert and the code will do the correct thing.
> > > 
> > > John.
> > > 
> > > >    		clear_exec_queue_pending_disable(q);
> > > >    		if (q->guc->suspend_pending) {
> > > >    			suspend_fence_signal(q);
> > > > @@ -1640,7 +1645,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > >    		return -EPROTO;
> > > >    	}
> > > > -	handle_sched_done(guc, q);
> > > > +	handle_sched_done(guc, q, runnable_state);
> > > >    	return 0;
> > > >    }
> 
