Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012B9C49EA1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 14:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C042410E392;
	Tue,  6 Aug 2024 14:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vt+17HI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783F910E392
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722954874; x=1754490874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WWp6JJjoJB9k3PWoLoCEyjL5YMuYOYRLUWrb8QLAX3U=;
 b=Vt+17HI/lppFdsu6DVQP7PhjHgKzixmOXKLrxScmdD9XYLCwDy3/KiaS
 qsns3pW2chejJsRx477uBGOYTtyWIhJ5l2QXr5Uky6qaS2WW3HqCaxslc
 vd9rop+yaAHFvZyPO2FAML3YgZ2uRdTc7Nsi9pkXoZ9NAgBgFbCxV/eae
 jIYSXGgQ7UoTvV29hu9oMqfCCDGbkdc4veBffsY63NP5ffWozMgvB6yEc
 3G2tGwS3hF6oEO8aqJPKgP/9eD1kvHS2CknEEznjm+aCpUxATvz/00Un3
 omKyoFgXLM3wf5xTD1QzUXxynPMvAPMG5kfr475f1XXXz498MOQ/yqhR4 Q==;
X-CSE-ConnectionGUID: WaYgy81nRzmlFRYzZnebRA==
X-CSE-MsgGUID: QvjyeeKeQfKhZwIY9XmeGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24741032"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="24741032"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:34:33 -0700
X-CSE-ConnectionGUID: GMDs7uCwQ8u/1h/JQh0dYQ==
X-CSE-MsgGUID: oErBJCEZRp+D3Vt4RCtrBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="79797759"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 07:34:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 07:34:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 07:34:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 07:34:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 07:34:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caNTH7Ugf8dtiWHg7conaywqdpckWY/1GbrozJiaKALZXzsYQSDnYddOvFpk9SExgMzbLnmVKns9MQS0dGnf40lc1LFwp3/6wg7Gos/mcYU8XNRmxE/+UDSQ8NHivOFJdPrw/R0W1hd6Knlbvz3U+tLMse/XeYXGRtxlp/eDCJ/a23giy/t+hLfyArVMPssffFWr9Q1x9CCDyYZjQAF3wz3hJozGmhCTHTvgF1dSBHJ18C3GfvYajg6GgBLOeiIohgidxJvvkKHEvYsWICWJxp+mnLO2D/wTHJ57MEx4EuuvOo/Thw6JEPXEwq6avR2BdMlhoy8P07hT/zS/a2S41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mXPMHgahcU9LC4Horu2rWg8NF2s4zcuwvsHEmmk5vI=;
 b=TyJ889XsYD6HZ94U402KuInaidOC1ygj8vgWY4mpzKVhqxh02BNi6e/nunqmRWG7ISp2hbp64cWWUo2m287FC9y2gQN0ltAUPgRaeerVnhCXuFw/nF4e6Y/glf9+pVLO8ng/3abnWM/au6qm+rgUpl3Wkw0iU09hO3HwoMOTnODPJeNXAxgnSwvRr+p4iahArNjD1v9wZoRgpN5USNzPKfM7UtZjvU89foO1tb19MsoHC/vAWYEfGC+/OzC967uDhK887op8KwFHS5f2mheN42CxHPsuuv+lsRyH/81ewGctU6SH6h43wUJhAExos0b3pbFRapNBzMPv8WD90eOKXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 14:34:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 14:34:26 +0000
Date: Tue, 6 Aug 2024 14:33:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/13] drm/xe/exec_queue: Prepare last fence for hw
 engine group resume context
Message-ID: <ZrI0KbIe2V4cihha@DUT025-TGLU.fm.intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
 <20240801125748.355078-7-francois.dugast@intel.com>
 <ZrE1L2hhrsFndmrP@DUT025-TGLU.fm.intel.com>
 <ZrHxAUVNOZRmBrg5@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrHxAUVNOZRmBrg5@fdugast-desk>
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c380c28-c5ee-4f45-248a-08dcb624df54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aSBXg8o+Rzr8vCETIZCjpbZKHYTVjSmi/zbkBDW7hhZjr4uika5VvM++7vh9?=
 =?us-ascii?Q?2v4KCI2ervDJf30G870motZ9Dby6mCP21+6RNQZO9R87AkS76B4TQF+hWP6m?=
 =?us-ascii?Q?tZbUb8yDtSz6rr8Cq3Mg+y/tPeylYA6+9zU/8XfwxPdMbUug8AHH4g/LaMU5?=
 =?us-ascii?Q?ilOWjuxoqE7LFaxN8p4FMETZk9hQ2hFO5LDexW9yDjmZ/V0qetimlkbH/BUV?=
 =?us-ascii?Q?coeBZNlk+67YrEnTpmaDCRZ93RVP0EcgKXJ+4lroxd+BxiHNnOu7Tz/mLdBZ?=
 =?us-ascii?Q?uyx9MWMP9hN6wiHLYi/lH/uMiV432ZJ0gvH26cPPd2wAuJklH+BNO6l4aV2N?=
 =?us-ascii?Q?gfo6vy3Y7hNBT1RSMVN49laft4LAwXU/CvWP6M3r3lREZB8X9oR7sz4UkhJy?=
 =?us-ascii?Q?rozmB0NOq3YjiizapUVDy97RqvUZqC5kOdX4WVbwVsqaMmoBf6fBW598vFy/?=
 =?us-ascii?Q?vN69uwD7wPRTRhYoh2ENHMI9v047lyp2LzsWpqa+x5lLmjDCKBPvseodlHyS?=
 =?us-ascii?Q?Bo/q8FlX8N5mdqsRwNV8goX00IE7qE4/+x84OWfvYTNsAwTCMGiAKPBTDCu5?=
 =?us-ascii?Q?33YWyBf0EZeXd4WC79288apzolVjtDEXnmkiQxJvVkhaJtrTE2qAUrzwIxOm?=
 =?us-ascii?Q?UvB4x+l9qBzDln7ggyR9eQcTO8Nh5Fk13C3T074Z+ykGERwJ2FNxRNDJxu1F?=
 =?us-ascii?Q?+4mJnN/sA0IysM733QW0VjABrwEChmWkXkIdXggf1Cbh2AYCD+cAZG4xNXcG?=
 =?us-ascii?Q?wMsWxhLgTIe3wtcXH2Nxq2guHPONEEflSLGIsyTA0ybNSouJvhySwjiNLzcq?=
 =?us-ascii?Q?QwFjN2wk2yPLIF5fX4PZ96eiXyNpmyivG446H7MDdIxbJ0fEe1n5o+xdcKn7?=
 =?us-ascii?Q?//zVMbmuN4tVYoYzh1EdGP/xmVcHB4hg8AqGhs2b0voOWj1/iIuXkt6dx6Cd?=
 =?us-ascii?Q?ao/0gGWOb/DcQrajSGQK8q99gXdp0tE6hLH1ztqoCfWu8AbeNzZrkBxcs7SW?=
 =?us-ascii?Q?1Mu3vFV7PLG4MkoDtjSkO9BYktAiJLozt7RABdj648M9/DwCn6ap7i5iiSj8?=
 =?us-ascii?Q?suSIjx+/DDjLZlRpEwWI+2/+8KWuiSy+eDwMRdJwo42/Pzb9WksUVTbWyoDT?=
 =?us-ascii?Q?aKcnv5pqPdd0A59E2IWty6DGetm9OmPIrTj+Dwy/aBtZd8fdvj0XtNADAlgC?=
 =?us-ascii?Q?tcjQhlyTXN6vxRh0RbdfIfPyeBji33nKVOWeo+UXxiDXVU0o3Zn1rifO/6Wy?=
 =?us-ascii?Q?+6WRR15XQaEZyHtrIg8xvQCBfUyKSCEZWYr2sOQUwZj/0u6XLNb0iBZQKjjc?=
 =?us-ascii?Q?AHI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TLKnR6rnA56onagZrPgN47YqF8iyolDUVz6ReWt0KNtP+LsOo0XsvgAnLVOF?=
 =?us-ascii?Q?RAE8LFkDxvdheea4uI2yCRimqg7EbjbdjvUJNYHJfwkBEhVr0Zt2vKOQKM2H?=
 =?us-ascii?Q?1h44oIsO/WkJsO664waRnnWP3F8N54lLrJFpNII+MnPvVqvVevIwoLWZzoo1?=
 =?us-ascii?Q?ACuQH6sX1GY06QUFRjyfs8jDRTe1VhGTO5eVrGh1rZ1PnQ7AHGlPiPZJBXfX?=
 =?us-ascii?Q?ndAbXWJ2agn/MIg69OqB/ndSNfVVuNwG4ljZ7wrE1zt6tAzdylloQdfP+E0j?=
 =?us-ascii?Q?PqYUZPqZHwPnLWdEHNoybkTD0KeJncFbuEMQ3v9AOSAE01aA2yWxXgh7IjjW?=
 =?us-ascii?Q?8Bnyq3D6XSG67PW8AOmHYDVdAF47NP7jJUg84tG6dersFLKEuY6pj/dar0Ol?=
 =?us-ascii?Q?VnjjQohHBhr0jU4JiBIAVy1PjjcJ0B/UHLEoLGJX+qAIHouogkcZNack7AFM?=
 =?us-ascii?Q?gWLh1HoElsvXz8DWQ9DnQMxPt7B0VATq6vAS0T49271wPqmmy5TpZzEODyf1?=
 =?us-ascii?Q?B8wW/TdEoMiskw2OBw+mfcAgooYyID1BoKWA9uC4u0+eh8M/BdteEFvQBrAY?=
 =?us-ascii?Q?nuqtfxnz8qr8YWV/Iu4Zw6kUR4cWgfV4gFOapQLKCcMEp3QCiy3QIDRSlg5c?=
 =?us-ascii?Q?D9Y6pc5cUl142kTNi7MdpguYVgKv6t2Cx95DStJ+LTIEH/rbBkhCgB7/My8Z?=
 =?us-ascii?Q?yz1FDfBcGin7GduNNRn7JZsFb/PITSgCauibg8fFVSytHyiRLzYs9glhJlFC?=
 =?us-ascii?Q?bGHqaKY8Rp8ngU7k2Qb31wU+sOHaYUcF5bf8RnfHtSxs5DJAEziUiyVj5cFP?=
 =?us-ascii?Q?W4omgChP1xrIVtLwkGb/962glMQBaaA4J8N0q5TVlJW6jgqDkRSJW6x03BdK?=
 =?us-ascii?Q?2qvddYcXPYokNbHxNu7dlIue8gxKgVyH45ADJthX9YNri7gaKVtlWUbQoPGF?=
 =?us-ascii?Q?Z2juVdaAPOpVpnw2L+7d3FaZpRxAXlzcGSJBQISZTMsrTPnOx5uVIoug1eBD?=
 =?us-ascii?Q?R2YiAx4yPHay1MABP0Iltxle9Y2XOiW3ssC+XkwMGacUteH8C7JKpsVJ2n/k?=
 =?us-ascii?Q?YGHAvXRj8GvuXwsrojCm4ofuIL/UiXA9LCo2nmonnVaRNu9GwEUxoSRcdlwC?=
 =?us-ascii?Q?WJFQBctcFWYYyORrUpYlPU0CLu4JziXdyNJooIqVCdpSagGPYqdQDb28IRDK?=
 =?us-ascii?Q?WAYrUopi+wW8bV8bDhlodH4qS4Pg8+1ufHtXwNp+b1Dak7qGo2mD75vKElR1?=
 =?us-ascii?Q?nh3PNtIU6ZdUbOCLvUYJx3zlTNRE7vFKltocSlHQYHMsY/Vj1Q+2ZJtJFYyY?=
 =?us-ascii?Q?AX9C/hGGa4SUiaoujJvpGAIYSLvmOlYisdqRdA3gfo7eO0YKIuQy9aySWLfv?=
 =?us-ascii?Q?Lafw9MU36lX/jT4/9LsxGRQHyLggnTaCl35JjA8a9cm1oC1rRw+b2fsqU3V+?=
 =?us-ascii?Q?dEtSM0oBhwPLmhKvqi3kEcpaRDtWMoF+VzUppo7IK9M56cxatZ1qZgf6C1Er?=
 =?us-ascii?Q?2qGGtJoqTcbjI9AIBOOqXAU7WyOgZWcLckRLYUoyMv4a63TKEnqEA8QvqFcV?=
 =?us-ascii?Q?tg6+XVsheA1M8hMFRq3ATTbGdZbBaRYn5SDmpstPwcmk9YKQsCSJIt5tRezQ?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c380c28-c5ee-4f45-248a-08dcb624df54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 14:34:26.2648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41tU2gYjCJJ0puTl4QEiSn541o+VPpJMwhrOzC2n9RP0mrvEIUKk5xVSlm1ctT8qE6ZjBPLUtVhF1QWBaySS8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
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

On Tue, Aug 06, 2024 at 11:46:41AM +0200, Francois Dugast wrote:
> On Mon, Aug 05, 2024 at 08:25:19PM +0000, Matthew Brost wrote:
> > On Thu, Aug 01, 2024 at 02:56:47PM +0200, Francois Dugast wrote:
> > > Ensure we can safely take a ref of the exec queue's last fence from the
> > > context of resuming jobs from the hw engine group. The locking requirements
> > > differ from the general case, hence the introduction of
> > > xe_exec_queue_last_fence_{get,put}_for_resume().
> > > 
> > > v2: Add kernel doc, rework the code to prevent code duplication
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c | 123 ++++++++++++++++++++++++++---
> > >  drivers/gpu/drm/xe/xe_exec_queue.h |   3 +
> > >  2 files changed, 113 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 85da2a30a4a4..a860ba752786 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -815,8 +815,37 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > >  	return 0;
> > >  }
> > >  
> > > -static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> > > -						    struct xe_vm *vm)
> > > +/**
> > > + * exec_queue_last_fence_lockdep_assert() - Assert locking to access last fence
> > > + * @q: The exec queue
> > > + * @vm: The VM
> > > + *
> > > + * These are the locking requirements to access the last fence of this exec
> > > + * queue. This is the general and strictest version, to be used by default.
> > > + */
> > > +static void exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> > > +						 struct xe_vm *vm)
> > > +{
> > > +	if (q->flags & EXEC_QUEUE_FLAG_VM) {
> > > +		lockdep_assert_held(&vm->lock);
> > > +	} else {
> > > +		xe_vm_assert_held(vm);
> > > +		lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem);
> > 
> > I think this (lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem))
> > is the only change needed here, then just use existing functions as is.
> > Yes, we won't have have lockdep_assert_held_write in this layer for
> > resume but we'd have it in the resume worker so I think we are fine?
> > Does that sounds reasonable?
> 
> I was hoping to come up with complete explicit locking requirements here but
> in the end the multiple variants are difficult to read.
> 
> Yes your suggestion makes sense for lockdep_assert_held_write, however beyond
> this assert another reason for adding separate *_for_resume variants was to
> skip xe_vm_assert_held(vm) above in the context of calling from the resume
> worker. Or did you mean to also grab the VM lock for each exec queue in the
> resume worker?
>

Yes, you are right, I missed that xe_vm_assert_held(vm) will not be held
in the resume path.

Hmm how about keep the updated exec_queue_last_fence_lockdep_assert with
'lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem);'.

Then still add '_for_resume' functions which don't call
'exec_queue_last_fence_lockdep_assert' but rather have
'lockdep_assert_write_held(&q->hwe->hw_engine_group->mode_sem);'?

Can we make this work without bool arguments? That would be cleaner.

> > 
> > Note you will need this patch though [1] to stop kernel binds from
> > blowing up lockdep.
> 
> Thanks for this patch.
> 

I merged this one btw.

Matt

> Francois
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/136898/
> > 
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * exec_queue_last_fence_lockdep_assert_for_test_dep() - Assert locking only to
> > > + * test the last fence dep
> > > + * @q: The exec queue
> > > + * @vm: The VM
> > > + *
> > > + * This version of exec_queue_last_fence_lockdep_assert() does not require
> > > + * locking of the hw engine group semaphore. It is exclusively meant to be used
> > > + * from the context of xe_exec_queue_last_fence_test_dep().
> > > + */
> > > +static void exec_queue_last_fence_lockdep_assert_for_test_dep(struct xe_exec_queue *q,
> > > +							      struct xe_vm *vm)
> > >  {
> > >  	if (q->flags & EXEC_QUEUE_FLAG_VM)
> > >  		lockdep_assert_held(&vm->lock);
> > > @@ -831,7 +860,22 @@ static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> > >   */
> > >  void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
> > >  {
> > > -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > > +	exec_queue_last_fence_lockdep_assert(q, vm);
> > > +
> > > +	xe_exec_queue_last_fence_put_unlocked(q);
> > > +}
> > > +
> > > +/**
> > > + * xe_exec_queue_last_fence_put_for_resume() - Drop ref to last fence
> > > + * @q: The exec queue
> > > + * @vm: The VM the engine does a bind or exec for
> > > + *
> > > + * Only safe to be called in the context of resuming the hw engine group's
> > > + * long-running exec queue, when the group semaphore is held.
> > > + */
> > > +void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *q, struct xe_vm *vm)
> > > +{
> > > +	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> > >  
> > >  	xe_exec_queue_last_fence_put_unlocked(q);
> > >  }
> > > @@ -851,30 +895,82 @@ void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *q)
> > >  }
> > >  
> > >  /**
> > > - * xe_exec_queue_last_fence_get() - Get last fence
> > > + * exec_queue_last_fence_get() - Get last fence
> > >   * @q: The exec queue
> > >   * @vm: The VM the engine does a bind or exec for
> > > + * @only_for_test_dep: True if context is testing last fence dependency
> > > + * @only_for_resume: True if context is resuming the hw engine group's queues
> > >   *
> > > - * Get last fence, takes a ref
> > > + * Get last fence, takes a ref, after checking locking depending on the
> > > + * context.
> > >   *
> > > - * Returns: last fence if not signaled, dma fence stub if signaled
> > > + * This function is parameterized to cover various contexts and consequently
> > > + * various locking requirements from which the caller gets the last fence,
> > > + * while also avoiding code duplication.
> > > + *
> > > + * It is intentionally made static to hide those parameters externally and
> > > + * limit possible incorrect uses from the wrong context.
> > >   */
> > > -struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> > > -					       struct xe_vm *vm)
> > > +static struct dma_fence *exec_queue_last_fence_get(struct xe_exec_queue *q,
> > > +						   struct xe_vm *vm,
> > > +						   bool only_for_test_dep,
> > > +						   bool only_for_resume)
> > >  {
> > >  	struct dma_fence *fence;
> > >  
> > > -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > > +	xe_assert(vm->xe, !(only_for_test_dep && only_for_resume));
> > > +	if (only_for_resume)
> > > +		lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> > > +	else if (only_for_test_dep)
> > > +		exec_queue_last_fence_lockdep_assert_for_test_dep(q, vm);
> > > +	else
> > > +		exec_queue_last_fence_lockdep_assert(q, vm);
> > >  
> > >  	if (q->last_fence &&
> > > -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> > > -		xe_exec_queue_last_fence_put(q, vm);
> > > +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags)) {
> > > +		if (only_for_resume)
> > > +			xe_exec_queue_last_fence_put_for_resume(q, vm);
> > > +		else
> > > +			xe_exec_queue_last_fence_put(q, vm);
> > > +	}
> > >  
> > >  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> > >  	dma_fence_get(fence);
> > >  	return fence;
> > >  }
> > >  
> > > +/**
> > > + * xe_exec_queue_last_fence_get() - Get last fence
> > > + * @q: The exec queue
> > > + * @vm: The VM the engine does a bind or exec for
> > > + *
> > > + * Get last fence, takes a ref
> > > + *
> > > + * Returns: last fence if not signaled, dma fence stub if signaled
> > > + */
> > > +struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> > > +					       struct xe_vm *vm)
> > > +{
> > > +	return exec_queue_last_fence_get(q, vm, false, false);
> > > +}
> > > +
> > > +/**
> > > + * xe_exec_queue_last_fence_get_to_resume() - Get last fence
> > > + * @q: The exec queue
> > > + * @vm: The VM the engine does a bind or exec for
> > > + *
> > > + * Get last fence, takes a ref. Only safe to be called in the context of
> > > + * resuming the hw engine group's long-running exec queue, when the group
> > > + * semaphore is held.
> > > + *
> > > + * Returns: last fence if not signaled, dma fence stub if signaled
> > > + */
> > > +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *q,
> > > +							  struct xe_vm *vm)
> > > +{
> > > +	return exec_queue_last_fence_get(q, vm, false, true);
> > > +}
> > > +
> > >  /**
> > >   * xe_exec_queue_last_fence_set() - Set last fence
> > >   * @q: The exec queue
> > > @@ -887,7 +983,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> > >  void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
> > >  				  struct dma_fence *fence)
> > >  {
> > > -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > > +	exec_queue_last_fence_lockdep_assert(q, vm);
> > >  
> > >  	xe_exec_queue_last_fence_put(q, vm);
> > >  	q->last_fence = dma_fence_get(fence);
> > > @@ -906,7 +1002,8 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> > >  	struct dma_fence *fence;
> > >  	int err = 0;
> > >  
> > > -	fence = xe_exec_queue_last_fence_get(q, vm);
> > > +	fence = exec_queue_last_fence_get(q, vm, true, false);
> > > +
> > >  	if (fence) {
> > >  		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> > >  			0 : -ETIME;
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > index ded77b0f3b90..fc9884a6ce85 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > @@ -71,8 +71,11 @@ enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_devi
> > >  
> > >  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
> > >  void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
> > > +void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *e, struct xe_vm *vm);
> > >  struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
> > >  					       struct xe_vm *vm);
> > > +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *e,
> > > +							  struct xe_vm *vm);
> > >  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
> > >  				  struct dma_fence *fence);
> > >  int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > > -- 
> > > 2.43.0
> > > 
