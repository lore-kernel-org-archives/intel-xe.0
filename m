Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250E2C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 15:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CDF10E29F;
	Tue, 17 Jun 2025 15:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2wM1xBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FFE10E29F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 15:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750173477; x=1781709477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GC3rbyVB9AJmQjNZtDdP9wbK3e4Vobpkz9kLFS7A23Q=;
 b=h2wM1xBfwGoSG7U0ylG7ZD2IwH+OEmiJ5C30f7AdrZ2iFpUO39Fgsc8n
 r82NroyOKhffo3myEJJr4baqpkse3EXEfmaO3rBAOXNnp7wsmMtr+Dwso
 wx3TZgqcGlYVcI9MBf43PQtPVgbzaq67qhrCIq/UWjhgGtuM09wQYepdG
 ZcpgZ2LKr/fvwIPc1xtIo73j0yvMbCFZk+RN7y4t5X381ygW69zMt+Nww
 C/7/i/YlRNlA4RCJkbHsSEN6zw1vXLftGIv/tLO/1Ie3WKcKmH37LXpuP
 KmAL0st9e9V35Z+54ZaYGH2r8AbVyIl0BNvkLU24660Md1rr25AcPsLWu Q==;
X-CSE-ConnectionGUID: 1ueKGj09QfyvdPUQ2zvtNg==
X-CSE-MsgGUID: onc4Lyo4SqmKrds+4mMUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63391820"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="63391820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:17:56 -0700
X-CSE-ConnectionGUID: NTQvzvdZQieMVcn6lg9o7g==
X-CSE-MsgGUID: LKWnrasuQ8uza6wLvEyNjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="186081999"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:17:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 08:17:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 08:17:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 08:17:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDLhj3gxw3Gmpb8Roj+LRPbPljkzNfBBgd4PG2hKHLBqFRo+8New4zD19laTSJ61SITzqbJWCc/p+sHggYyRdTL4HicjFrYWmGw1jkIGEi1XnzJDFbk+KTYc+n62gMkEbG1sisQlMJk0eWraQvURqNQ+Pf82g/9556W6VbhotuEVodk+ahGLM51/zs6bVKIIVLKCzjkSO1EGWm0v07FPF690/PoOJhTG7spOrW61sZS+V33xBe7KhYt3yS4viF4PQinfWNnsRS/oh2bxRtfUzhLLO2C3f8QOP0LFoCYt4JKTiewOpaRpj+8qE6C7ekhW7YeBZ2Fqld+bo7ULR5+m8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QohYkJQjhf0WpZeVMhJ/J+2ySH6M9YzzVC+mDPlzvaw=;
 b=mj1H9BIh5UV/KnxGDOVAnG/VRZI3wT1NPdqSNGArgWrewj1dYYkX9xoMSg8vbjCWZQwxQru16zdSXfPffISOtEgjVKYSCsnx1MPxFv5vaIN8SFKSdzWkeXlx2Ae0uPzN9Ta4IEoSDi7q9sOMv8GZXXrPcul6skJNz493tmRxFSakjZDdGLpPghis6TQazPKGXdjmjZKnyXQ498oABXidru+jGK/FXZ9AIRL65YpZ9xDAuJnoIhwPaxBhTEtsrKMbOeKTab+GDylI0LngDNUqJHcRZK2UXNoj7YwTQf/bA62W52iKATJWAmUTPrSKzOA6BwNGZXGEQAnhk2oag3LEng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM3PPF4C5964328.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 15:17:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 15:17:37 +0000
Date: Tue, 17 Jun 2025 08:19:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Grab pending job list lock before resubmit
Message-ID: <aFGHcaWirKQRDCEi@lstrano-desk.jf.intel.com>
References: <20250617144753.3177952-1-tejas.upadhyay@intel.com>
 <b049cbbb-9941-440c-ae2d-880e4f420511@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b049cbbb-9941-440c-ae2d-880e4f420511@intel.com>
X-ClientProxiedBy: MW4PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:303:16d::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM3PPF4C5964328:EE_
X-MS-Office365-Filtering-Correlation-Id: c23b7363-3fae-4d24-34ee-08ddadb2180d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qQ+dfE19vKw/aGTbI2H06hDU5g4z06ExDK2AVUrx9OWsUWmrJXoKTF9cX/RP?=
 =?us-ascii?Q?xEHZafdwI35gaxa6GWpV2/kWut+Tdho64Y+/HJWt5Ic/T5v4oS+dKwRElAil?=
 =?us-ascii?Q?R537wLBborAMr7/KpR1F0yRvgqVoEZuD+3Jp2s48WvfxkxJloF5Sm//sHVpr?=
 =?us-ascii?Q?e5nXbtB97+uDPBlE7H/7W+V0qF6IQgTtev7nHXcQsxj1D+ajK9th92JWNW7n?=
 =?us-ascii?Q?usNzhghXzOPgQFrQOVlgAwr2c/nfTiMApxBKwzI7QLeKfAa6Kf8y55lSgBu6?=
 =?us-ascii?Q?8vIvHtj/WvlUMOl9SMkc5u37tFx6d0CngvH16Fi1JJMUZCS2Ekt5oiJHlrdP?=
 =?us-ascii?Q?TjYiMloXd2uQn+AsvmlM1JNqfda8swDP7ryc8ETk0Dd7X7rXpmG5mV3b2soc?=
 =?us-ascii?Q?hQwf8lLDVB5DM9XqA62IFJoyPIZMSsaZPe6jpTc29taFALTrDT/l3vOglmjG?=
 =?us-ascii?Q?Hj1QFR7+v18E2VLDGolfoLfNmqDHmUk7F0l96pDNgNHM2cz20hS+ewc8NoDC?=
 =?us-ascii?Q?gmITLRCW7CHegknGZWytD3qlPgLxk+EnDtdNoyiza/N2Ph/EhlMaDcvBoloe?=
 =?us-ascii?Q?MNBaEYrtjZ+Pcehm5EFRluL7C0S5p/rKAUXVBUpQJQUKxcwGito3zpaZC/LV?=
 =?us-ascii?Q?5Us0FwT2iaIpsWI1+6oj9Y47JrH6FVQuY6LmWvdK1Z/2kto/rcqBSOLrifq+?=
 =?us-ascii?Q?HMjfkE8x8FzCugl+F0zolkqFm2/SXxcQaGvkMNYxtVL70BWYtEb+rFW4IMQm?=
 =?us-ascii?Q?jCFj/wF9pHDEVjxihQsMEy0PFg63+xamgTnxtD4BEUiOuBLmTEK9BM1jhyF+?=
 =?us-ascii?Q?xBvou4aG4fE2mk8lsEyhHx2ue6xXgRorep9m0dgWdCEgVbVvxzoctgQmfrWf?=
 =?us-ascii?Q?/B5e6vaWOF+I0wAf5UmxTkIEh3ut2H8EOHoh1AjoBnhfkuh1/b43T2NBCNUz?=
 =?us-ascii?Q?pCu9Kqzb0FPuRqZ1wgiBPMP7pWFgxPKOQwr2+bR33eXMWXtoopE99e7m+kN7?=
 =?us-ascii?Q?MEVW3CAhXWHaXr1gXJ4KYQRFa2AZZ1TlJ7tAtAvYAtC0GDYHzHHUpsq/lipo?=
 =?us-ascii?Q?ckYO44zXSusDxH7ClxFR/MSvI6sajvT/xcstdvt+C9kmitUwuLw/27WlSnXk?=
 =?us-ascii?Q?Ss8C0AmxzhfTcGwoXmLjZnjrDxW+2e0CneEr6/G7eQINyd3FebWzRzg3uX5K?=
 =?us-ascii?Q?53UoRBF8BiQS2tmdyqaiReqWCtAuYc4LaE9nZ7eY/LNT0cXZm0huUu5bq8+B?=
 =?us-ascii?Q?HTvZoCCCvsy5+KJqRYF3Bnopv3WkPD24zdpLDgjKUbHQfrqfn5Q/WNXhQyt2?=
 =?us-ascii?Q?o0gAPtyEs+1jt/tTaRhFDATNDxt21MmAjyEpUc1edh+2IfK+9Fv5yvxa+9QY?=
 =?us-ascii?Q?aHq+URZflESMXW6LSGaBfvySDMUP3A5aML4HXjV2iOOXh9Xqii/qpWho2BV4?=
 =?us-ascii?Q?KBCq7i3VkYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lS84hWYNHdG11rZ16DbKLeVpTXzbYDS6ErXDDSJuq+C69R9Tkr57daBG3ahm?=
 =?us-ascii?Q?D41neQGboWz/ah6Fnt/2f5v7ziKNVPkG3EtI0pDHVEAj9wKRZEAnC62bCunq?=
 =?us-ascii?Q?v9qFmSha0UCd4VFUblZfzBb7C+frazhx8SDYRmaYIZTooVqIlauCAA6QiO6u?=
 =?us-ascii?Q?dNG8mp92n/1/MGG/gJ6NXE9CJfd7OzCe/WSWnN9u6Tsu7d13T/Gca4C20lOY?=
 =?us-ascii?Q?X4LP7wVszhegFtlXD2pQMxFhnP9YBTQf/YxtL4mFXIjoxxKJsJtumsXozpyo?=
 =?us-ascii?Q?NMYtDlnP4tYpRIk0gqkfgLHgrfCUr/A7FGpLYSz0Ev8YuZmXqPslwUXNNhfV?=
 =?us-ascii?Q?IjeuScyeiAq2kZrwIwKAWKr4Nym8K5rOGvpCIrk05DhTnBIhhW+j7ft7LI1f?=
 =?us-ascii?Q?qCsvNJruFuyfByfuCLy0vLq3UilLfuiKTTYhJU05aJ4x/8+ULpnFfOI7dWwc?=
 =?us-ascii?Q?/FAuGKLeKDf4/FHMP1bSuaEkGKn4vmvXDcbPutRwPgVmdWO0dqPh5sa9Kpqs?=
 =?us-ascii?Q?bBKHJKf/uNJFE/LrbmxymTdNQXGjr4Io4J6SQE3IbiMrCiVuEJu99P+LMwTv?=
 =?us-ascii?Q?DvBSzpVLJIsGzvzwBFnFBYlbe0McqMPUzBVLTAolb0IbymZGWIpaFKEUnRE/?=
 =?us-ascii?Q?QSrqP9rSWA+XXTMoWdzDEY8mz9zhWxC3kJJOSP5Bb3fpM3L5r5xKuAiu3Oyy?=
 =?us-ascii?Q?1Wbmel0Y6hrHTfkp19ZpTwPWTFsqBu6U1kjZ0MVbX06hqvpsXVFu/aLeJce1?=
 =?us-ascii?Q?rKrwt61lzL3A4sE9vhBaCpMUsCL330M2tjEyYIe3HA/ajPKGkMYvQW4f8XFU?=
 =?us-ascii?Q?4s4TjEzTem6X17dJ/5XTmYJXi4615tcHU4+x4HQXC55O6NF5u+fUGIYxng46?=
 =?us-ascii?Q?BYO1mN7nnLhRwheP1XFC0GiAOttRzjSNQEmdr4MU7DYwUU/zLSoqXmdDsdEc?=
 =?us-ascii?Q?tmx7P2FSC65Wu7Hjy1TViVyfZ5o3j5oDzrbSYXSjF2tXw2etdDftyKF2prnY?=
 =?us-ascii?Q?SSRCAxeR0DzPMF9nH48Vdf3o9BqXBwmU7a9D19P3ft1JrY1QmDyUjlcUNDrr?=
 =?us-ascii?Q?2Rgpfc3DAZaOt5a/cayPVzTemsnUk8IZEoU/u3BSeBfCLYGYsGwo7rzSg9/6?=
 =?us-ascii?Q?uMSylHfpnhsQBWaDXNhYtxQ8pP6BBoa5OsJ/VwvJW0iYG7RzVLQFdlr6dsgX?=
 =?us-ascii?Q?dowY9XIFxFA16mfg6+fdBEl+q+BurPGoaUttTvkuWwXWIiVPf19k5PwNZv9z?=
 =?us-ascii?Q?mEDCRkNaXqtGi9xOmpPfmZlUOKuTNvTFEtYAhc55D9BRjmaiODTOq2+GUHp6?=
 =?us-ascii?Q?Hgx2DexiivkHj/xoUkaiCaX6x8benXX+5EpU+jRzoBJPDTbmMTs+QWloVVDq?=
 =?us-ascii?Q?QExLA4bPPrKBMqUDlBhqKY7mRpc4riY1fMRiiqxe8y/iIrJES1Ek50FF/Drq?=
 =?us-ascii?Q?bCi4PlKyDQMJ5FnLMMlINH45D84+vLWyIvb3QvUvrPJmqxn7B7ufA/2sfGNR?=
 =?us-ascii?Q?YPukzQ+zVUh9wurpScr5lBQdZv1lPWX4dyAkf4taTIuSmLjB6Y5KGHxXP7kH?=
 =?us-ascii?Q?qrq7qoe/T6Ar7YhaFeum5vPZgKxdrtfG0VFl4nKTLaE2eaEvbYFQUOWGaObI?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c23b7363-3fae-4d24-34ee-08ddadb2180d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:17:37.8707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARqbZdTB1VhOnk/cn/duRWJwceyljsOtUXpK3wJqKDV0zxfHqxC0Wd6So0vuPYGW39G4/WoK2DgdCdeSz6in8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C5964328
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

On Tue, Jun 17, 2025 at 04:14:05PM +0100, Matthew Auld wrote:
> On 17/06/2025 15:47, Tejas Upadhyay wrote:
> > Pending job list is protected by pending job lock to
> > avoid any racing thus grab pending job list lock before
> > resubmitting jobs.
> > 
> > Fixes: 38fafa9f392f ("drm/xe/sched: stop re-submitting signalled jobs")
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index 308061f0cf37..dfdb409da6ba 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -53,6 +53,7 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> >   {
> >   	struct drm_sched_job *s_job;
> > +	spin_lock(&sched->base.job_list_lock);
> >   	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> >   		struct drm_sched_fence *s_fence = s_job->s_fence;
> >   		struct dma_fence *hw_fence = s_fence->parent;
> > @@ -60,6 +61,7 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> >   		if (hw_fence && !dma_fence_is_signaled(hw_fence))
> >   			sched->base.ops->run_job(s_job);
> 
> Is this fixing a real issue? There is a sleeping lock and maybe other
> nasties in run_job() AFAICT, so I don't think this will work as-is, but I
> don't believe we need this, since sched should be stopped at this point, so
> nothing else should be modifying pending_list until we start it back up,
> which is only later?
> 

Matt Auld is right - the scheduler is stopped here so AFIAK it should
work without &sched->base.job_list_lock lock. This patch itself won't
work as run_job can grab the CT mutex which lock would not be happy
about (i.e., you cannot hold an non-sleeping lock and then take a
sleeping lock).

I'd vote for just dropping this patch.

Matt 

> >   	}
> > +	spin_unlock(&sched->base.job_list_lock);
> >   }
> >   static inline bool
> 
