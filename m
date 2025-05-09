Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C363C3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 06:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469B710E9B2;
	Fri,  9 May 2025 06:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IU1FjTt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C87910E9B2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 06:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746770512; x=1778306512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oNvIFu7CUxTAe6ZHOVrSfiTE/jVqooGtCNIchuU6dxw=;
 b=IU1FjTt/Dhm6s5QQom6uEIxW9TOgfzhLmRVzVu3odhmWE6zvuiEBg+3D
 e9GeoW7ZQ9jbuzZ5tLgU2+ihMgfWIeYnTMJfHQodvyC1IIRdTKFNb7V9u
 Wmhqn8vKoPFZf076c++eBoX/ztm5ou/Y0uraULsY1xJKNtPLvyR2s3G2A
 i8y/JNQIFeG3d3N/fcteuejiOCu6aVrI9ZExn5QtZTbzCLD+n4dSyyBvQ
 uOcce5fgS2A+p5lZyd+z5GmBjZ9DxuOS6PupL1lp/PfbJhzDrfVInVKmq
 4BvRwzCLahD/1cC2YJPUcUH5Ek4ZDjxHu7I9CgT9QP/P6AVp/yfBkkuZZ g==;
X-CSE-ConnectionGUID: uyIpourhQTCgo3PV5YKMqg==
X-CSE-MsgGUID: /c0jX9xVS1WSHmdb61jVRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48500579"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48500579"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 23:01:52 -0700
X-CSE-ConnectionGUID: OpeKdfInQ4W3wLTq8a7OdQ==
X-CSE-MsgGUID: lZjsI7CaR++mST/yE2lBig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136223564"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 23:01:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 23:01:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 23:01:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 23:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLPpvplsmtR1N3uyoErXFd1Gor8pgPr5MfEMaaYxAoSKKlhhXVPq0lbY2TBqkNmeuudVmQS7hi/AqtDluDtWS0uz0JjElsvXP8P5iWKwlKWSIipFiRhr25ROPulB+mA091Hq52ns009WHXXx6DkDEfaniq1ET9YG0daFQT/PkCLHVfdaotQ1stxei+UO4BFB2xUq3IDXINDl3uw/nVl2na3mxzVgCin0W0rRU95oZGHR6ykOeRv8h4wESHQK3bJ+XiPTrly0jBnWMEklgLQJzLGW2r3ZOU9fE7Ca7FDyWx2I5W9eYANc0A6oOZT+6+F1BYzy1DQ8OCQuQCgBJ6DuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGBfkKcAs1KurDY/5xYFEDisqY55ohXhWoPuXKvN+go=;
 b=nE1TRP9iMBKq2TIwr8xA6Ds3bOXDtt1n3TbeIgVxyez0b/cgoBvO8UsKhtYstvlbEgqes47X/ovEsN+qOwWj++CiIpzRrdDe/VyatkRZpeIdgvtOHPCZ3k7wxC2GyEpJba+/9t0hEl+jrjmJeYH9j1poFwOh0YIb4xZHkR+IZS/eHurPMiyvoc+J8YygpmKKPAeZiXURhyBKCy0rda8CDg49msOTD3Z9Z9kEWHHHVixSkWKGV9Gz6ejVJ7puyl4s20HEZWS6j1NFLVAavOdw1dk31fit1kuorkswFjKQiZGK3qxEf15zblVf49Z4e1EQTnWGs+t3zXc4HiwG+FJ3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.22; Fri, 9 May
 2025 06:01:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Fri, 9 May 2025
 06:01:42 +0000
Date: Thu, 8 May 2025 23:03:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Do not print engine reset message on a killed
 queue
Message-ID: <aB2am1IYTbIU6j/u@lstrano-desk.jf.intel.com>
References: <20250508190920.1343610-1-matthew.brost@intel.com>
 <96b700c1-4980-4876-9ea3-62e753f0436a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <96b700c1-4980-4876-9ea3-62e753f0436a@intel.com>
X-ClientProxiedBy: MW4PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:303:6a::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: a0da59ce-9c2d-4b72-a55f-08dd8ebef88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x+HYboOs/hdK8mqeC/SxjfCyc0BDEE5dNl7jymBbc2VMAfvY18fIWlxshlkl?=
 =?us-ascii?Q?xVC/+TbEVlvKePWDFi4KJIo7LnbWKcdX0E4GXC6xDeVVp2fzsCJ8zzWbSDDx?=
 =?us-ascii?Q?n76MuOyPE4oPktXFbt0dATsnFseC+nXBm4NowTUDOuZSpqdBO9MNCRPTpdkh?=
 =?us-ascii?Q?mnBKscS22IXsEdlVx9Xgh+AV+3/g6NCynCM50tx0HIVWolSWTv5X2xqi4kxi?=
 =?us-ascii?Q?8trlobXnFVIDmfS70k6I/lGixbPIlCGGOzyXtNzdOGSkHH+HVGARORZKrCyH?=
 =?us-ascii?Q?86G3iJf8yWm5EgKbaw4hiJ+zupICRxQd/CYF8qsd8/RUbDPT9ZUP/NmsOdze?=
 =?us-ascii?Q?vIQKqY+NTRH+UCTiL1O6rhNqdf/oDKQDWn/suNfeyeQLoSSADQXKMnrUDaGV?=
 =?us-ascii?Q?pnRdwGtiGzaJNLWx1Vquh9BQRkJdc1hYS0QIbyOOv/0HOxWuw9hl0RdrBSGA?=
 =?us-ascii?Q?SReqZHgAiKluww2KRakyu9YScaTbv5qKCY5oxDybCaSwpLqknRB0VL8Wco1R?=
 =?us-ascii?Q?82XuqNH78WYyWj//d9JJEJkbuTnfIsTwLeSXUcHVh8T1JuEwzrnwkI1tKXos?=
 =?us-ascii?Q?C8tHJ73sLqGSoaJ0wV4S+Ofy/tvl9Hto0lQbVFLENt04xcR7VSjHL9VF2KYS?=
 =?us-ascii?Q?MQXk+1q46KRJm8T6QMpYhrQ5DhNC9KNxGHmBKBWlK9Wfs8MBOOu95UFWSMj/?=
 =?us-ascii?Q?Frc76EGxCY0s91DOQ/oXPbz0tF1reOElm98rbdtyakDesOmrWAjEyOUi6oXQ?=
 =?us-ascii?Q?ZIK5tSLoIP/ow7hA25UPdJ4tDajcT2V3hLy5p4SXzOgev+26n/vQ7WzX5rzU?=
 =?us-ascii?Q?xiZPhT1sNSeeamQHONXX4Vc1SiR+JVbtSTR98uP8XL8PNAK9uMVnXXXB4Mpd?=
 =?us-ascii?Q?Ws7bjLEiOoON6vlJowL4Dk+VgDWN8BtPzV3qpvNL9BZ9GCo3gtlgG4r4BNj7?=
 =?us-ascii?Q?T8gaBfCd2BsHW1KqqSahr30szFqJI89ACbVNOxEgNoEX0jfxDMQqo7w/EU75?=
 =?us-ascii?Q?5UBBABpsbL/qOodogvGxB5PzIkk10lyMsWga9DP/IjXIQR68WOR0O3mDQJqo?=
 =?us-ascii?Q?lBQKyBaCPIjf4oTehPZXYcLOvpidvyPJi634lY/08E18Yhs6ZYXR24auiP+x?=
 =?us-ascii?Q?9Pfx3K+O0jlHDYct7z0JV8PCfq+c+tHmuZaE2eArhs/99DSfxTGYYFpLjQ5C?=
 =?us-ascii?Q?UooKD1o1m6S2UM9OuuR1Y8Ns4LkTJ2Qwk2ipit0N0J2cwRqb9HE7rRMnZHdL?=
 =?us-ascii?Q?VjmyECqFitGRnADt0BLUXNcbG4D3zjnKH/a3MNh75k89ayozur+0ue1EdfhF?=
 =?us-ascii?Q?1drTd2AnRKOPk2ckWcFwzGKA68U3IAAYTYtwViXFPpF9XeYVraWqC6vH4zQv?=
 =?us-ascii?Q?pS15GlE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ldeOCZNSFE4goK2OYNvY+My2WaRKns5ZfFK//KdRjl3Avpk7ISIj/UW/03k?=
 =?us-ascii?Q?+8wkTGvLG7z622TrJ8zEBGSYiq6V84bUIYRXOfW68UU/2YYgfw5lnCz4OHAd?=
 =?us-ascii?Q?7JzypJ2d4/S9W40G3luOOs9RH6Zd4gVnXID8QVmWh3LIEDdF6MVPiEZTBpmc?=
 =?us-ascii?Q?OkuWPwyt3qi5xlCEOJwnkTMvhbN3QiagsiS5iJOL80vFKY/XQFBlEXawMavQ?=
 =?us-ascii?Q?QSOZDeeSSTIrVLq/hNQszoWNN32a+ZJcN8qYG+6LjmswMsdybm3jjX53ANsj?=
 =?us-ascii?Q?wJOj4YrnTaWN6lA7ANAMhkLMR/gDobHEmIikbK0GhKfVkAta4h76wJsUIn1S?=
 =?us-ascii?Q?KaFuVmVppS+Tp+Bn9DMwIsHsz0nzWQhKUh9izT8zgqFl84BmP4zCcpa80fSU?=
 =?us-ascii?Q?fwjA4U+hAuZYnprtTDGeCk/OR88nF5kTRyBxunS2/Bt/4vvZ9MhydGzLxVKN?=
 =?us-ascii?Q?mefDjLCGmG6/6KSi5NbMm9x2sTOLmZ8G/X/i/8xgtOtStwqPvzq+NlZCLuhq?=
 =?us-ascii?Q?XwvTtD64MJRvusgp9zDmv3aiN32/J5ajrk2aE55C8whH6fuILUJao6Grg4uO?=
 =?us-ascii?Q?ewNV441iyFm7hNRkA+YkF6D0g/xluFkSXxDJ6VRIkrJqoVJcK9CZmIe+xG3y?=
 =?us-ascii?Q?9ISP3g+KmCZHf29V0zjZiqf8FsfxbJSyyyVNxAwJ/OnFfGRWkIU5aV8CqGSC?=
 =?us-ascii?Q?YRyUrT2hmbYiqxX4awhhKN/alFCd/3jZhgovQyOF7xOKWU8H6F49iNvPkMIK?=
 =?us-ascii?Q?67UqOhahEGrSDBg05N4egWqdjQdO3K3WwU1cxyhNz9jjlPPuOIq1MtkTaT0G?=
 =?us-ascii?Q?y7PiVfwfSP36FEOo7XLAByUB0esYUfNv4xzAWa7CU88El68o3ZvU6ePAoNoq?=
 =?us-ascii?Q?SnmVKj7Nf8Xodc8nTzACpd5FvwTOnnGGTrrJ6xYeeuP5oZMFPjK8B6CdDvBJ?=
 =?us-ascii?Q?ZhvBER4KBb9+nR3Hf8em+CGxVC9N+YPpf75qf/GKDV7rALhEosEcdCwXEQfm?=
 =?us-ascii?Q?txA/Jk3eaWH05zpZYIelToN3r+5eR1HIRb8UxVG4aYTTPa7Cht+Gkg97PZbS?=
 =?us-ascii?Q?j6Jff4p2CL8RvIZPX2iywpATl15ZcdewXBBnuMfbH2Scy0qf4ovp8a4Zatkd?=
 =?us-ascii?Q?M3E7TXIsTEwCvGP9ZmEB34tGssAde5khhQ/nwHCQnjy6JnNEa0LNuxV2ed8j?=
 =?us-ascii?Q?tg4jItuibSeJdF8cr6PtxQvlEKkp6E7fTZE7ZT9B4N0G5fEKymnVFHGE1KBr?=
 =?us-ascii?Q?2TwqxtWHt4m15ln/Ti0OQcbg95hoQ1P4cUFf0BuVau4l/EpOc2Fr524lspw6?=
 =?us-ascii?Q?clTZVQVQpQNR+u/QBoB5R1Nq8k0Ol+2AaiWVMt+2RXkzTq/fBWWCTGQy0X6K?=
 =?us-ascii?Q?8feuW/RahHLvP2pjUkZuTtpGO3k8Ex0GvYjr0zFcw5p9Uqa6hwlSc73jbaQh?=
 =?us-ascii?Q?NgxygU7f+Zb0JXOM5RQS5ElMBxJQjP8A1hMSRgeQDBXOw14AciVyP7+DE3pP?=
 =?us-ascii?Q?TCbL4lX+X8g+gDfdhhL5bdy9OBXUF/WYEM374TSqiSAVPPR1rRIV6TGOtbIK?=
 =?us-ascii?Q?FTLc5psHl+qcxDvD0vx5DjGrdsxWfxb76bwl7H0+aKGVPHw67ESTrBcbPIah?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0da59ce-9c2d-4b72-a55f-08dd8ebef88a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 06:01:42.2680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2oKX9jOJ7qzCeZgbGrNIyJYAT23qoh8tYztftgR598steYqV1BdoinPefubOxEpu8Aiwmn7YLllnv9CUi888w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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

On Thu, May 08, 2025 at 04:03:56PM -0700, John Harrison wrote:
> 
> 
> On 5/8/2025 12:09 PM, Matthew Brost wrote:
> > When an app is ctrl-c (killed) any queues running on the GPU have their
> > preemption timeout set to the minimum value and scheduling is disabled.
> > If the queue has something active on the GPU it is very likely for the
> > GuC will trigger an engine reset resulting in the engine reset message
> > being printed when this is fully expected. Do not print the engine reset
> > message on queues which have been killed.
> > 
> > Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4904
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 369be36f7dc5..efff462ddd75 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2005,8 +2005,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	if (unlikely(!q))
> >   		return -EPROTO;
> > -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > +	if (!exec_queue_killed(q))
> > +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> Maybe make it an xe_gt_dbg in the case of a killed queue? It is still useful
> to see such messages when triaging CI failures to get an idea of what is
> going on behind the scenes.
> 

I had thought about this, should be fine as long as this isn't spamming
normal production kernels dmesg. I would assume xe_gt_dbg would not show
up. I did the same thing for job timeout message in this patch - just
dropped it on killed queues maybe I should be xe_gt_dbg message there
too?

Matt

> John.
> 
> >   	trace_xe_exec_queue_reset(q);
> 
