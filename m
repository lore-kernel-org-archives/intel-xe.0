Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A692D597B0
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2750610E1D0;
	Tue, 12 Nov 2024 22:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQQ4R4St";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B820A10E1D0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731449357; x=1762985357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IP86mghnFymoi4vXSiB+uewArRO6Q4z4JXHULgCQVwE=;
 b=FQQ4R4StKEd/9zMNay4fowS2AbbyFJJpcejwISVcjqZCpLCdYrtvuASK
 B79VovA7D216I1kc1ILvPXS+HWN74bov722JdjI4Kmcni9Cgt1JSdw+cU
 RjDkElUMHySqjOSRd6Wdjb/waFUZJG2ate5yplT3M/04tBzHf20iLAZ6Q
 Y3Iltogz9c9b9i/mD/FhR0MK6uDjSZsJR9GLXWD3TjsawnziylaF6h5L9
 xwtpjDEv4geQoRJsLkfTE5CAUMpk2fqN2J9nVxanNGv9YQ/jfMzgfpjXQ
 Kc5EA3BqmFRd5Hrn3buSKOKIkezvWl187hbvnBjL77hXIZML7k94NvaXW A==;
X-CSE-ConnectionGUID: hcgbz/TUR7eUW1Jbfg7TJQ==
X-CSE-MsgGUID: uAL6PUeyTX6yc2fGLAftuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31542287"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31542287"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:09:16 -0800
X-CSE-ConnectionGUID: pSgKblx3RwCxG9L6Za46JA==
X-CSE-MsgGUID: IYyjNyCpQaOW0B+KLDQCcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="125182694"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 14:09:15 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 14:09:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 14:09:15 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 14:09:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGoEHImWn+dJmvB6JwK5H+vcdYV7/hBjWjACCK1OMWB5MklCq35NaNL2MSb25nHYaqnU+w+r95paw7vUGQw9CeXMx6AQCI43hRPtmVf3DA3enmwJLtch+KevNZYoWKVlq7xWMLujhmlkmjHwiTRPti6XnBhKlkN+DxAFuoPU3eWCLe3dADJf0My+7KdeQtU7le+xvUuT1ZS4NCd0mJWYwzPmInHqazOlLvTOtJa0iHBpnlmIsk8NLfe4Om8MFPwPdj2rOm4djEnJlHiEE84ZTnAPkin3fLYII78WHL6/TCVh+0gUVScSmK028dNBMU5uzlLE0IygbOrYTHj4Emf8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtrK/3/ukPIHctjH9BoUDvHHC/u9zKBJiVNlZT9QvFM=;
 b=eYqsIJTZizvPccvaNEMBcW0+66FgmzIOG4+pgItbb3FWeMRFY1wMt8FuZAjZ/LqCPjVUmMDxNQZznLg1etmOn+1JG6kXm3Ddpha5JNgIYxrkr05f6KU6uw7aT4srVG98feXGD+VEvtZL35H33YIQLAw94Rn7hK/3Y4PNjc4UtOtpeI2hJBjzQeju3AM4tRxAsZLMyH7+U4nxG/hQH96MV7SpDGK+zfbPid8dhVW8J45i5ogKElP9OuUgjou+zV8FhwxZQUAQoi6z3nO5ruoaLMLY1QwbRvgdye4kb/O3pv+w6JGwBi3GqH1DEdbCj3qjkC+JRyczHQBZ0HL9B8yPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6769.namprd11.prod.outlook.com (2603:10b6:510:1af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 22:09:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 22:09:07 +0000
Date: Tue, 12 Nov 2024 14:09:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove redundant rebind from preempt rebind worker
Message-ID: <ZzPSJHSWnhCCbZxx@lstrano-desk.jf.intel.com>
References: <20241112214104.1341240-1-matthew.brost@intel.com>
 <CH0PR11MB544438DCEDDCE33CB71C14D4E5592@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB544438DCEDDCE33CB71C14D4E5592@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b09d8f1-dbae-43a3-391e-08dd0366a06a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oabu3rstf6hS0P5y3G36HUS+9yUuYN0sffminnTGDt2+mTn2O+zkb1/avdav?=
 =?us-ascii?Q?m0HSffycjQ9ERzCuZ8c0RXuq6uIuMWrVmRFfITzy/KtaVc4LYat83yEFUYCL?=
 =?us-ascii?Q?sSq7c2Qu5UeXUeAl8misyO7xg+JGt9fzOh7w25ERwtYh9QHoeZTUGA3BDW9y?=
 =?us-ascii?Q?INrFjvQRm9LxV4n1UH5diYDirhmm42jUS+yINNaxbUMOo8pjA7hRxnXNDriV?=
 =?us-ascii?Q?mCCDMZkhUoSd+kf4lRJyeROv6LLsotby1n6a5EcozrfguuV5m5raKcLR5MIV?=
 =?us-ascii?Q?vI9oQnF+opbzrOP+ddSxFC23UMF9kcu+2cph83fHRrM6F6csTd5Wppqn8wu/?=
 =?us-ascii?Q?JHtOu/MHWc8cUwy4YOW0wdezFiVtTEbn+xY71CEqqI723nixMD94ghHnw7Am?=
 =?us-ascii?Q?1otWUC9freUUCVb6t7y0IqNnWC+iCpyKai1e4W+B3tqrlqdNzlBAookwtLLb?=
 =?us-ascii?Q?Hp9dJvO6665obyqRJqXmJ+jM6cxJNI+amufJlcVNqCMBS/Tj6Xx/Z+fg104L?=
 =?us-ascii?Q?kSFjMejL01Oa4zBJjw99A6qSMX511WIBLYUffHrPeLwCj9Lsl6osOkBfY8Yt?=
 =?us-ascii?Q?FFguXS583f7j5iIHu85te9a1uuQIaUmpDnPgIEx/h7DOdSzwuFBobC9L+2+z?=
 =?us-ascii?Q?IxWprluSRfIc0tEb+WUg7pCp33IziTMVKhtRclJf3cPLInQS8i3dfr1QB5l1?=
 =?us-ascii?Q?YsuhbgJUqhj23YDS27MTorB1KBL69yfq4Z+29xXtYNXIcV4Qc9hCpYwPCbTQ?=
 =?us-ascii?Q?3O9oCkbKiHkeOzamfGl6idbNTp5HDqkaEen5ofeQ32Q2eI+GoHBxqjOxBG3y?=
 =?us-ascii?Q?i++oIqVwGKUTOwlbsMoMe8TYtNRv/BpwoNVcEnKyh8ZnhoAe37XsgXFogzxC?=
 =?us-ascii?Q?9k7uGPKsA98cseXnyBHxdRrxKEeobcn5OABXafd42+dF82EYE1aCuWjcKQv7?=
 =?us-ascii?Q?IinZgCvd9YrhavUVlSIHzqvvAAwYfpOIdScr6VOsnvRT3t7J3qwcLU6NTF2j?=
 =?us-ascii?Q?ZRwbzccOwkDAcqkT97qVm8SXZr8L9v9FZ5mm7HUozzVImMs+hPEvZ3RNO8LK?=
 =?us-ascii?Q?/T+tFABJPyiUtoXc6ErIFDGAGQbLatLQaBoVxOTHqq0xVAUXVtBKGknmd/ny?=
 =?us-ascii?Q?Qa4GGIS8tN0cuiIER6jkiO912MvUT38kgwv0VYyNkmBPtnqgqsu3veoTOtAy?=
 =?us-ascii?Q?KRKYGJOy2WI6Gmes08XA9ovGbgYOnmAoYe/FLJzdAAo9HYcumUNaSPhee65t?=
 =?us-ascii?Q?8mrt0ln3WYfSeAVcSBNAHWURPJysAalBKloNH1hv0uP0sp7AHUnAFP3VgeMD?=
 =?us-ascii?Q?qeKDUcy2ks7l5aHSevbNvD3l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bsydE8UV+NtDXoBp6I2x/NH+5bSAzLc9HYEpZjk7QSbpU/REsNWGro1WkG3G?=
 =?us-ascii?Q?wq7FtyC/xMOC3OWRzM302yaKSjTbiOtHLzI864UUqEyLk9BVv4fG9fGInOWC?=
 =?us-ascii?Q?YoyH3WfdIhQCXxzhCi4JFnRffnqvWdPqR8gFkQYRfYvt3hZyVyvItrl8wHh5?=
 =?us-ascii?Q?fWA1guWv9A51JrtZShu8QWHmxcbeAddKXnGHV5U6AuGylgpctuw8f2Kwr4g5?=
 =?us-ascii?Q?JI2cORbwNY7WY0OlL16WNIee+BglmQnMjLr8P1vlaL+VkoE5LlgCPytNq/4H?=
 =?us-ascii?Q?3OSXn8R6nXhjgI1ydZeZUm+h7n+ld7XouxeYb1iVj1Br0ySOQ3auolXAFouV?=
 =?us-ascii?Q?hLLbIaikmgA4qgnHohaBgGw0Z1S3QivPJnK88P8Kunzn164zdy5oJH/pbF/R?=
 =?us-ascii?Q?Q1top6Rrn7Pqa8ofL04KYsAkuvCnwn11CsWkisMwt/jP1X5C0CgFx02cxOSS?=
 =?us-ascii?Q?CLrs2t+K5OVgdoQn1Dhm40PkEHHyzPYPG8yAlW7Zsdam5Pm/QK1dRG/L3GrF?=
 =?us-ascii?Q?Wq07lair8EbM+/r8KGPjaHz5vLTzhy0ywWeKbZYddVTywWXZP6JnrxfV0s6U?=
 =?us-ascii?Q?M3khCWbGMmtVrS9GAoqAo6pPK++qW/cfSh5l+juxqezJQ/Xy0siuyYbDiiia?=
 =?us-ascii?Q?MfC06AyYTv9D++4OFFC2ntZGpuVXRQ4rBMAuI+6o3CR7cQ60Z6/NtaxQIkk1?=
 =?us-ascii?Q?VqRiQdZXyHL/MTKsq24AJUiA5xqwGVXyi8wxx2/IM/G4zi6/MwRaqJ7sd5Lt?=
 =?us-ascii?Q?80lGh6Nke3aUtPylY1eAuZU8kbhX/aG8J0SX2TKVTQURevKvopMnDkBLe8nr?=
 =?us-ascii?Q?FcydXjMA7ytbudXGnYh9BW68uQmxGLVmzr/q8MKYdVo29560ByVGfI+j1Kir?=
 =?us-ascii?Q?lpEa/11ElYKTLrSmN1rBqzBVZJ4v9FZsl7hlUtr6hdsYmgdD+0iAeCMNcQcI?=
 =?us-ascii?Q?I7dpSTxzwrpHdZMV9Sn18abHdiTRRU7FaaT2eFCgUjrOQsjlqoluFsNW5hkM?=
 =?us-ascii?Q?2vvIWHalFjYURmmtW77z1U96BaEy0rP0Hj6ypj/Rpl5ePKFwAUykimU5h/0t?=
 =?us-ascii?Q?MziSBtQZRwaOiAkzunIJEGt3DSZIZT+JRr70NqW3hcl2K9+Ny07BDqzCXF7p?=
 =?us-ascii?Q?DGuzdaA4hFUmkJ3pfLWnhDYqqm2dZV/NgmzbcquIXmNcsBJcimjvvla25Nw/?=
 =?us-ascii?Q?GfQm5rgsCcsoKdkSI5O6CluLkCXfDfoBt2KaRv1qe5BtxOg+vxTaUj7klQ1K?=
 =?us-ascii?Q?F6IRNmKiEzDWaKNICxY3/LUhiOicQ7xuY7IQGO2MjBkExan44BbCDnGO/jO8?=
 =?us-ascii?Q?kNSk2W2AqGVGArygxQ3ygSNY45gh6jCoIl3W7LQc6JAvuy8eNhrRwOa2TRQn?=
 =?us-ascii?Q?LAELBgnGwnLDV3nIc24sfdDP3CTH9MLuEno+Icrw1k9ODrsSIFFBR+lZ0t5l?=
 =?us-ascii?Q?ggrJBAJ6M4Guaem7Y24tiepylnK2peIDvu5VXK4oLBpB0fjPbXqHgUQBsWzH?=
 =?us-ascii?Q?hWRHTkJQTlIpy+2TVEOUNRi+U3J801yJUnXY4H6jmidAa/VjpgqJBtvJwu6H?=
 =?us-ascii?Q?7vxlHALA0iSY7aIxtRqueE4H5zHVyFIVPXceM8L11MmH6z6tEr/WR+zdEp7Z?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b09d8f1-dbae-43a3-391e-08dd0366a06a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 22:09:07.1003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ml1AirCICUOpJD9eTHCTaQEcFEOpH5MIe5ooXmZZE1ZJQKCVCPZVUKCWWXlGH/vDcCl9ZbV7EEqjI0xISOp7+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6769
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

On Tue, Nov 12, 2024 at 02:47:39PM -0700, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Tuesday, November 12, 2024 1:41 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH] drm/xe: Remove redundant rebind from preempt rebind worker
> > 
> > We issue a rebind in xe_preempt_work_begin so no need to call
> > xe_vm_rebind again in the preempt rebind worker.
> 
> The call to xe_vm_rebind in xe_preempt_work_begin passes a rebind_worker value of "false",
> whereas the call in preempt_rebind_work_func passes a rebind_worker value of "true".
> Ergo, I think the execution requirements are different enough to warrant two separate calls.
> 

Hmm, this still doesn't look right but yea this patch also isn't right.
Let mm follow up on way we doing it is this way. I think we should just
call xe_vm_bind in xe_preempt_work_begin with a value of true unless I'm
mistaken.

Matt

> I could be wrong, though, so I won't nack.
> -Jonathan Cavitt
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 624133fae5f5..756c72cd6048 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -525,10 +525,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >  	if (err)
> >  		goto out_unlock;
> >  
> > -	err = xe_vm_rebind(vm, true);
> > -	if (err)
> > -		goto out_unlock;
> > -
> >  	/* Wait on rebinds and munmap style VM unbinds */
> >  	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
> >  				     DMA_RESV_USAGE_KERNEL,
> > -- 
> > 2.34.1
> > 
> > 
