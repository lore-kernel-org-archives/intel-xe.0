Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC19EB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 21:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D2D10E3E0;
	Tue, 13 Jun 2023 21:39:53 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B4610E087
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 21:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686692390; x=1718228390;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2M9tsBJhRJ8NWIPUamUueX0YE9lVbFpMOVrkEA9wLV8=;
 b=f+K4gcZx1B5bKf+2W6hZKSGOUI8W+97pQ/w+eP9oa7opE0K8PaF8RM0i
 aUbOV+cExnz6C8frTaO39oRBVcDbxj5uh2w/LrNLOXQbQFWtnuy1u7te+
 /p1XcGVapJBqFpt8Rzf7Od6eBTc6OBRzImIJz5IUYxgyrLtFJICjQh/h/
 xbqqhSt7kzpHguvX8K/6nEVr1Xpuvpitv/4egjXUv8g6Q5JQB4/vBiAKC
 flNr3Ch3eT5rpCrDDgDyFRlxi6Ons6XhvdCvFFgg/IIRpoRXzPQL5aYvT
 w4IRERg1DHRmXy+ruy4EVzdU1sun8es+w9BJWqiwkoIxJ1VXrRXTAo23t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="355957131"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="355957131"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 14:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="689174979"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="689174979"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 13 Jun 2023 14:39:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 14:39:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 14:39:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 14:39:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 14:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvDEHovqi9Y/n14gcPMrIPPMSseuG9WKUSi9+IMhDA5rcYEGFnaSwql+IgeI4g1eUaifER33WCHawZI/SgaVpS3JxRhNCz4iY38TKupDu7Y66AZ6ExJ6acqGtcScVn5k28/rbrFpo2I6J37lrmB8He4nR0tWPdvvMMjVqs4gmfvVeuFr+Q0S62Mfkyt94wxPJ0QDT2sAlTIsAa68Fr3XcyQ0TLTkfIAJ+xVeUJ9xHIlDUK6A7TYS+BoZfO2KW8o1r4XNy2SodrX8nETh8CGFeyL2RobleDIbx4r0TnUdNoajJbfpR2WU96O2xa9YgNQ/3WqBxHMzqfCRRQzd2xFtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44hiBRAOIsVCeQkMdaToBqEiHi377YuFQQbpqrIcITM=;
 b=UMNt4r9VQeAn6vUmUxrkWdbzDhfQPTrn79QBec7Tr5KYSnxXMtW81T0V9Gy6Lx2u91eQnw4vjWHFBlkqf68lb84d4ZQt0lElTNcpYNk5hl58rHElSGAMctL3nKgW1VIZrIQe0PU9paBmGL/Mm2cMlI8ay0zGoM/v4sXnt5V96qRQr/14BOC2UBG5TJkQrUrheFyvFsx79LgBTy05hW36h7ov9r8YR5TL8613+kaO3oLhJl0BpaYsUj4GUpIjGeZzFcLZYRNN9Lr98bSuuHiowZ43BS2hcS/l3W45Zb1w9HQY194cIsatPdeCVWhrSDnZLqfgDRCw1PlOA5ORF00rWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.43; Tue, 13 Jun 2023 21:39:45 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 21:39:45 +0000
Date: Tue, 13 Jun 2023 14:39:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <20230613213941.GH6953@mdroper-desk1.amr.corp.intel.com>
References: <20230613094232.3703549-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230613094232.3703549-1-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 99da120a-4009-4faf-0d24-08db6c56b40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOWv8YaxnQTJJ3nsyeA4+v/CZbu3mXwkAIKYlD799KZZyQ1RLmWxDsU9/v0HAC6O3gwOoAWkdZrPXun8dkwNCLmaNJfBif7TZ2GtjjgOGCIUJCIe0wCxN+TXjpAQSrbH7IBqNVUD6HW0n8s0yzUmYlMFEQHPIx3+yl/9sWEdOOWSmNBR1JAamssF4CEnbJCVKroZ6xjQf4FkB3PKVsu2g7tEDBbV1FP4GG/QJNH9nVdPW7W9Pq2c88Khota/dC7R0y1zAbeMxXoy3yOUWU95t2tOxhp5I15LYruMG1zMaZ+RpA49+Ooivaj6rvuuCZCcRu8WPlSjzy3OW5EaWLprF6xvtU3sKsXZ/DnkWmLEAhX/utix7kr0WRWn+FGbuGKqhMeVuEN//MT24OMx9MjE16MKJ1nyLi+kgHsJhKwlDjbUUnc8WQAzlqmijF+AfroHfqjMv7uqOB3lVxy54iq1w55LpRYh12jh/gRVjp/zwh7kGDM0WhCeD8Y13BGuVteqKUlq1sCTv8g0jmeDTg5n2IUbIz83vuBX4c3nzT/ZSElUit0iW701MduAlOA8TR0V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(478600001)(41300700001)(6636002)(38100700002)(316002)(66946007)(66556008)(6666004)(6486002)(2906002)(66476007)(82960400001)(6862004)(86362001)(8936002)(5660300002)(4326008)(8676002)(33656002)(83380400001)(1076003)(6506007)(6512007)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rzHrt/774/PUFhffnq3j803zkLIYNycHeD2+LzubhN8/xBJGWULbEuHDwq7G?=
 =?us-ascii?Q?rT1S09An8KzOQZTqaF7CAfsmu+33JA4uss8squDyyXoWZXI72kT+9fX1t0su?=
 =?us-ascii?Q?jGM75htY7sly0N99x1yApV+np/2agU4RefkbzqpoqIVG/iWg44U4JRinYyc+?=
 =?us-ascii?Q?eNH7vnw838VPitqxvuRWGRfmMGSkozQWx9SEyYCFmthRukTcecVv8rEkyCk7?=
 =?us-ascii?Q?z6H1m+pVqJWz5dyLKbR51xjdK6AxElnjR/NnEw68vbIEbLWEo7SIIDpQ2WeI?=
 =?us-ascii?Q?wbnI7QRQ2Ss3ojogXmt9OiBxdr2xfJvxLDI3lH0hQEQsy/O+NOOuUaF0Jxsx?=
 =?us-ascii?Q?8aVJe5z+xMeyE+x2cimlqkg6aDvTOlWHLVjVr2HL07dNiHWp1ABOIgcJjBV5?=
 =?us-ascii?Q?f3kIhO9t6I56iej1scNXoNlMvI1s/M3aMbg8/BjWLU8rT0ZBGo4Z2ABGw65R?=
 =?us-ascii?Q?W+xkizJrAWcocdWkahMpQ4FRtmVwwNd46dW71b7ppxvzZM4IGEYf3PcT5hOo?=
 =?us-ascii?Q?NUNnSkGvSPCSjj8tTFjfUaKcASeBxaUPFjGngyU4WMhszLDPj3dkrwPEtSnu?=
 =?us-ascii?Q?tEVM+lkzmW3NAraIvG4QySfgAhjK5+CjHmvTFm4at6NeJDh2BeYgvBRM1FTM?=
 =?us-ascii?Q?Xxcc56KBd0hE86doNEu9f1bR46BW1W3m/T1qjE/7ZFosfUfVrJHVMsBcANqr?=
 =?us-ascii?Q?Kzfs1GFn9kiGyAzhsE4I+ZxRF4X3hjWpGCoxgz7bWYZUMlxmFguoQNw2H3yy?=
 =?us-ascii?Q?Fp69AOWjvr5YHqkORWVVsjbD0mTD0z0vuFGfjNOOKSzjw4DqX6RNiGaiVZUW?=
 =?us-ascii?Q?CWJO0HoH7L296AnrpT8n45x04A12eByWGAsl6mJvVZ1PgFD8FKVxx42RHdCb?=
 =?us-ascii?Q?JFo4KRUMXmip1ASPO15LoLXWFKIvri4xZd/ZkTObXfCWLhOjSCQOlytPOGX4?=
 =?us-ascii?Q?bzwfAWybO2Q6y5gmhCdkm8ZolxzCG0nUWCa+IITk6djVnrj2gDfKWzxG0FF9?=
 =?us-ascii?Q?seUhAFW4YXcNVcRJUAHM12KxxGtpR2KMd4+sX1g5n1V/bfwF4+TFRCEaqo4E?=
 =?us-ascii?Q?uUiYczcfS036LCm9PQw3V2YW+r4J0tLQ0703Z/EevvV7Y9Rw+KczIQJgr6+X?=
 =?us-ascii?Q?hF7cvI2JScoXywFvNlLfeA9bE7XbE7yFIbcr5dB3Bxfawp6hja4LfYrdbmeT?=
 =?us-ascii?Q?Z3f/igUIglil/lUKDNlu6V9k4Ow6CbGZhgLDDl/Lz/fAXixvkP/pIIEiVDpm?=
 =?us-ascii?Q?nhk01CbZiEEdC4Z+ig73wDJDbzIgvXwD7BZVN6tVxPhg2omWr6YZKJglydk5?=
 =?us-ascii?Q?0fKIcwcSc175MRGsHYRyHYcBre1V6xb0kngRPzemujwJUwzHE++Q2PhuPV95?=
 =?us-ascii?Q?1u7aUKlK6nVPXoU8rHC9eu9w1eTSPML0/eHgH1+5mUeoDdu60VOhMRDppVms?=
 =?us-ascii?Q?cdn3mB2Mbw+kNM/l/8TndJzSgKjGQ+mpzvLFqEbRF/SIXyxz8jrTW+D3nQeM?=
 =?us-ascii?Q?2jix0DjGn+qEszmDi2KElQJUIWB8BJyTBIkHx5xbexMHT5WNxWmq9titp0gn?=
 =?us-ascii?Q?ZETPe1kN1BUJhgjYH+1jJq3MrSXGca4s1bUObWKYtinSYRKNmYN3uUYz0xnv?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99da120a-4009-4faf-0d24-08db6c56b40b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 21:39:44.9988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UU6r6NG2EinobBBDHcRnzbaT8vK9TnuuikukqT4ofpm2C9D5Q15Cy+0L29WjKh3X+d7bog0o2X+skXOoKsMzOKGLYenvnkAoSwT4KZj/qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe : Fix GT looping for standalone media
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

On Tue, Jun 13, 2023 at 03:12:32PM +0530, Riana Tauro wrote:
> Currently the id of primary gt is set using gt_count and not
> the media gt.
> 
> set gt->info.id of media gt using gt_count
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index bd1f59b49928..2991cf5365d5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -590,7 +590,7 @@ static int xe_info_init(struct xe_device *xe,
>  		 * up with platforms that support both together.
>  		 */
>  		drm_WARN_ON(&xe->drm, id != 0);
> -		gt->info.id = 1;
> +		gt->info.id = xe->info.gt_count++;

1 is always correct today since MTL is the only platform with a
standalone media GT, and it's a single-tile platform (so the GTs are
0/1).  This will also be true for any future single-tile platforms with
standalone media.

If/when we eventually have a platform that's both multi-tile _and_
multi-gt, we need to decide how we're going to identify GTs.  Since no
such platform exists today, we also don't know for sure whether every
tile will have both GTs, or whether only some of the tiles will have
multiple GTs.  It's not clear that using gt_count++ will necessarily be
the right thing to do; maybe we want to make primary GTs 2*tile and
media GTs 2*tile+1 (i.e., intentionally skip IDs if some of the tiles
have both and others do not).  We may also want to adjust how we
approach GT identification in the uapi in general --- maybe we don't
even want to give GTs a global ID anymore and instead want to move
toward identifying GT with a (tile_id, gt_id) tuple where gt_id is an
intra-tile number (i.e., 0=primary, 1=media).

The current GT and tile series aimed to just preserve the existing uapi
without changes, and using an ID of 1 for media (with all the FIXME
comments in the code) does that for now.  But sometime soon we do need
to make a formal decision on exactly how we want to work with tiles and
GTs in the uapi, going forward and that needs to be something that we
loop in our userspace partners on; we can't just make the decision
ourselves on the kernel side.


Matt

>  	}
>  
>  	return 0;
> -- 
> 2.40.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
