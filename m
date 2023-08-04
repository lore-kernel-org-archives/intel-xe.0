Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167D2C00528
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 13:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9106310E6FD;
	Fri,  4 Aug 2023 13:38:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454A710E6FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691156323; x=1722692323;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mJovRHVJHJzti4KExAooMZ06Q/ZWP7l4VLGk0GAGAIg=;
 b=dF2722tAIDo9fIo4UBIw9H+qLtsqfZTLvkVde5ak2jfMyz3mFHA0RTv8
 4+C/dGCbgn13Ra7fwThl6ADyYfy4NZ2b0DnBcLjvpLTVhfesTeBPXiLeB
 VAg3uYbp7m7DZl1cgr1NFKMK4rmErvBS9DXlNYBS1bJIBCwVxvGsPZzWF
 mxgbsCoV5ytA9F/mXndF6TN4fSlos+7dU1tEUYJDlfH+dJ4bSg0XSqA6t
 xnZDBpTP79Q98VqM89MsdYAUWGMWOk3TSjijtAaWrplwQmgttd+pj3+sj
 qqAdYUP8C7iyCLysmI0FWITtZytIDeWb/ZyDZKjK7KRVjvagzUTT400XL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="436475752"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="436475752"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 06:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="679973660"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="679973660"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 06:38:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 06:38:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 06:38:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 06:38:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 06:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS9V1ZeWeBxvx2IIFZcI6OrSZpwOwcUDJ78n2ArYE/YN9YLylIRqEmIDU2PPIaLe70asUcEJYhFrjWElapymLYPJr1gz5SyzSfQYEnM2hKm86AUe0elEt8vlKb31CFUy5Zo3gTl3a3FMm/r7TNqtjfpZc72WufUyoHSHmnxVXrj0iPus7vJNCxcbctRwUi4SghZg8CZylLOjxWG7ZZ5m6N1n5Tz96KrCVsPyH7iD54XRaxbsbhyOfOduOb9dpPsc8HePCxeCx2m5b8J5oyIX2GFwsR6Siv35fDlCVIYJmOBd1qgTnqQ2yUMKNHvwperYuzpmLij7Bu97/g8zLhtMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64hM/D0xsJZxXGVU6ZIWCQ0Fu0wF/umYKM3QQ6VVRi0=;
 b=IkRFdrs08SCzq7QKdZ394sYA0V2THX1/Vfdyfchh5t90tQO68taHcYwB/sF/jLR02KrmuFGBpiUdYCW+FNLME9jB1ixWRL4p/m1pnBLibJ96G6HMkCuKQ2rXRqDXzS6FZKesjD0GYux8+jW9TBYD5dA0sDwsfCdNMMU4kw7xHzuBwlkz96ki8QVV5oZ7zvJkriO14L570CU+g+iwzccHBKxB4YRq24Mb4B2+YYH6q5emucUgo6atDyVEmMGLgEypvW3U0rTVxzlDMaNgRMq+Mqvtbv74nSeoEh+mBHu/5+C1YtEnJA9gESvypPXZMjsTtE2JSVhz8JscfEHv50hw6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 13:38:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 13:38:39 +0000
Date: Fri, 4 Aug 2023 13:37:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZMz/KtftMF/5Cd1u@DUT025-TGLU.fm.intel.com>
References: <20230803173849.285599-3-matthew.auld@intel.com>
 <20230803173849.285599-4-matthew.auld@intel.com>
 <ZMvytzGNetQxODNL@DUT025-TGLU.fm.intel.com>
 <61193ecb-9f6a-500c-d084-cb9df4ddd4db@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <61193ecb-9f6a-500c-d084-cb9df4ddd4db@intel.com>
X-ClientProxiedBy: SJ0PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:a03:331::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: 19430e6d-2ea2-4d1a-6d10-08db94f01c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x5yrbB95KPx5AHqRPcBSUKee6NPPHTQUyAtcAM1/PbiJhv+p2yS5aLtMEX90sGKgSUrt0CWspA2NMkoJyCFK7elO42KTIlTOxAmIUuPYhCMjVeA8rOIHQ/WpAtmsMxedxkZXZ0WIxTFzOZs49K1GxA0hPkmefYVI0t+YpXVbePGPdM6GFmwieW3xUu73VIJIEfWkkZ8rcR7fanZxpNl4cWTck/cPBletFMPdp/VD2jbEJeB1dYxyjcDy6YFlNCu2soztwaPDPlaKHZ4VWBg0Z9dfb9b/2wBptJD9xCaB9fTWXibseKQEV7b0b+ijpH88Eu9CDeXdUn1eddhRVprshxSxDuXkFYXyeEyWeRFElkuMA6l7VfvqHcIIvHJELU/JIVvGT3KW1A039PHJlOQX+iFfVFT5hyz/2BxnG3KeGXL2u56vI2QL5/6ftehJy5pdcoOZzqkoY43mgBTtWHQ0VwYV9mANvXtWBfEcqtFsPx6MCvVGsjeFqZuetfE3QX/JNlWPA1PH89WLfAg5lSCmoXyeisUq+ys2BdFnlaMnnfSAKrB4AkJoM1uFK7kbW7dn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(186006)(1800799003)(6666004)(6486002)(6512007)(86362001)(6506007)(26005)(53546011)(83380400001)(38100700002)(82960400001)(5660300002)(41300700001)(8676002)(8936002)(6862004)(4326008)(6636002)(2906002)(66556008)(66476007)(66946007)(316002)(478600001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qrZc6SyNgPfj0CRXSBc4KzaCxPZaeFJC+k1xeeld91MD3CpZm13jEPyyqtdT?=
 =?us-ascii?Q?xk8zwSrJ+fkzl0AoV4q2MrEaGC3IBRok5jOjzE3LSeObo1UsJWlD3Wo5Z2G7?=
 =?us-ascii?Q?ZrNCRM35bKjWaiBx5uZAUYWp4DhnvSdzYSaE9NlGrV4K3agX16zew0yGRACg?=
 =?us-ascii?Q?1QQrvuKZWZoeKHOVF1l0UtaDm4d/c/uMPAEKVF/zfHIwXnpZAdGxyu5yZJr9?=
 =?us-ascii?Q?TD3WcG1fGU1JXR9fnGxNOg6/7R5ftxiHtIzFAWd7A1GDFMkiIG0OkYOx4MD0?=
 =?us-ascii?Q?XQ9t22uauhjwxcjx0R3XgYKjs+Teha01x8AZgKuxhkh/XYr5hvVFZZilqLAU?=
 =?us-ascii?Q?dxNqp3KFboc5+PHMWgQIuwHxOLD4bQ72xo5Fn9/2/3BtEYzBpeY7+rdwfwSw?=
 =?us-ascii?Q?HvlTOg3uZMa68GWTLEpIIME7IToQkJAD94WGNz+tV/6tUtPKgvXeJ3r8P5hd?=
 =?us-ascii?Q?KCRy3wOJkvcW3WTDpEeCnJL34k4/beBs7X2Hq3l57GsJdfIab2PAc6VS/ARs?=
 =?us-ascii?Q?Etk48H7gXILQqMPJyCQ9T9GuJWr/37MAmfZ+ZlorfxMV6xiEQTXh1y2EMVOJ?=
 =?us-ascii?Q?pExeaA0I2G6t9+3is6WCl8YPJrRg9XdHYK8Bu6pF0wmYwFawYp7X51qCyuvC?=
 =?us-ascii?Q?EmvrLUuWg2YGqaY48dMYkJo4AHy7B1CldYF3Fda/XmS1DdTUHWT1lThisku6?=
 =?us-ascii?Q?2rpRSRlwn7N1TOklRA3R7WbYLubzTzythzbJ4ccHLFj9rDjQSIAQd+3ogfuv?=
 =?us-ascii?Q?pwPsxJueX6qgj4iV0IQVdViXlpLnujaB8NuqvfUe5OT/YtRv6N+EsM6Ono6B?=
 =?us-ascii?Q?DMq0rs1p35WNYXXaOzI99I3l22swsC2hI9kH71pzzGPHbuxuLE6UBYD6kNWO?=
 =?us-ascii?Q?1YxB3QlXgHdBOoHBzsRtw+8IXhaX7u0rYkHhUwNsc/hlgJYp5Vln6n1HXXSS?=
 =?us-ascii?Q?pZHxdnUr5lQkVjrk6Iaxwa3Xcxju1M5zmr0MG84OhB9guYzKEjB9UGDWpXVx?=
 =?us-ascii?Q?GstP3+vNanxXO6eGel95TLbXbew/mxOWZscqdRPvyQI01ZPY0RO7BP2vuk67?=
 =?us-ascii?Q?OfWLgvPZFDmX13CEcBzD8RXK6bLV3e1cq46i9kJS8mnHIJgkQSoIzgdKtEJJ?=
 =?us-ascii?Q?jn9DtZ6czD/SiL8HbwyoxYzstduSuqJc/JQmhiK1caA+IiAarewgIo/OZnrN?=
 =?us-ascii?Q?ipLTtgNNt83y/wfTpDp4zRY9V9yX1troozf5mqXCg8d8UosX2EvQ1c5HNVvk?=
 =?us-ascii?Q?RDCJixYVVfhOvwcKDBuwLX7RMOZnr+zeXXsivU9loh8Cmh4N6tpYZJvvBqmO?=
 =?us-ascii?Q?er6gf6v9qxlrNAVq7RYRzEoXj9sEUutrC9cIyrJsHdVOqmXvwrh7s8gEMmMz?=
 =?us-ascii?Q?OOYMaoVu6LkcXZYbHrI0Py9/0QasrfBKBJwPR6Uov8IL7B9F+JxSX/o9YgUc?=
 =?us-ascii?Q?wiWfnMYYNI2r51Yj29QmZKsSxVq+pMHCgWlfXYKSCE6bjQuTIPA4Lx/n198v?=
 =?us-ascii?Q?Hsju8uP9kBnS79j+cxpj754aWBKUrpE/358Va6pFG2YJ4zrz1aYdeNWW8Skg?=
 =?us-ascii?Q?rNBDnEV663guDTOAPxW5Kvdg/4sBHZcjS0gJq9qlj9FKJBmyIZHVVpZIs7Op?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19430e6d-2ea2-4d1a-6d10-08db94f01c92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:38:39.6778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oy0ygAdCMJ8xEKzs6KRr6csOi2oXnbLaD1Wi7oCGWmo4XpnkxCcNU5fLhIMmupI/kWeIv8wgOvAG01Kq0yZ/1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/guc_submit: fixup deregister
 in job timeout
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 09:48:30AM +0100, Matthew Auld wrote:
> On 03/08/2023 19:32, Matthew Brost wrote:
> > On Thu, Aug 03, 2023 at 06:38:51PM +0100, Matthew Auld wrote:
> > > Rather check if the engine is still registered before proceeding with
> > > deregister steps. Also the engine being marked as disabled doesn't mean
> > > the engine has been disabled or deregistered from GuC pov, and here we
> > > are signalling fences so we need to be sure GuC is not still using this
> > > context.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_submit.c | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index b88bfe7d8470..e499e6540ca5 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -881,15 +881,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >   	}
> > >   	/* Engine state now stable, disable scheduling if needed */
> > > -	if (exec_queue_enabled(q)) {
> > > +	if (exec_queue_registered(q)) {
> > >   		struct xe_guc *guc = exec_queue_to_guc(q);
> > >   		int ret;
> > >   		if (exec_queue_reset(q))
> > >   			err = -EIO;
> > >   		set_exec_queue_banned(q);
> > > -		xe_exec_queue_get(q);
> > > -		disable_scheduling_deregister(guc, q);
> > > +		if (!exec_queue_destroyed(q)) {
> > > +			xe_exec_queue_get(q);
> > > +			disable_scheduling_deregister(guc, q);
> > 
> > You could include wait under this if statment too but either way works.
> 
> Do you mean move the pending_disable wait under the if? My worry is that

Yea.

> multiple queued timeout jobs could somehow trigger one after the other and
> the first disable_scheduling_deregister() goes bad triggering a timeout for
> the wait and queuing a GT reset. The GT reset looks to use the same ordered
> wq as the timeout jobs, so it might be that another timeout job was queued
> before the reset job (like when doing the ~5 second wait). If that happens
> the second timeout job would see that exec_queue_destroyed has been seen and
> incorrectly not wait for the pending_disable state change and then start
> signalling fences even though the GuC might still be using the context. Do
> you know if that is possible?

Typical once a GT reset is issued the pending disable state change isn't
going to happen a the GuC is dead, rather guc_read_stopped() is true
which indicates a GT reset is pending in the ordered WQ and it safe to
immediately cleanup any jobs that have timed out. If multiple timeouts
occur before processing the GT reset (all of these are on the same queue
so have mutual exclusion on execution) that is fine. The only way the
first timeout can make progess is the GuC responds and does the correct
thing or a GT reset is queued.

Matt 

> 
> > 
> > With that:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > > +		}
> > >   		/*
> > >   		 * Must wait for scheduling to be disabled before signalling
> > > -- 
> > > 2.41.0
> > > 
