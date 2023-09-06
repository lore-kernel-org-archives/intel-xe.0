Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F023CEE14D3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 18:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E78810E6F4;
	Wed,  6 Sep 2023 18:40:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337E310E6F4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694025602; x=1725561602;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gHvihyUEftVb8txUSMBExdRfde6OmEYZNfe2RQ8S16I=;
 b=cJr6DovRojaLnG7d/iYUF9HHCFQIgLi+EiKMPdxZISJQFT7t0wDNt273
 yMzLbGyBlvBtY5egmEZ6TP9BIETJJbZ8zcxJ7PPLspO+09LE7/Jfkd8Pi
 SCz83Q01xJAYxdfvtbQx3ijsj5vJA64Ivj0GEFkv+0uVf+pADOulTituP
 bmO1g6GU5PLgYQz/QFe7PiSDS0oRq2J1xuZ4sHMhtn9utSTYCq2ulCJ+U
 kaMCa5kezwu4GOQ33OiMaybKwfcKFktz5t8CERi0M/w4o9d1rr9W+4C1m
 EQQLr9tTGkDZsDQftpcXUXuMBWxtfPX8bTTv9OcUUrZ50dR8PFFZRwpsx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379862101"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="379862101"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 11:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741664502"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="741664502"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 11:40:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 11:40:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 11:40:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 11:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2hFSNDzVPOtG2R8pXB7S1c9MuksRMJv61IT2cpzxRLlX10IuOTCNAxftvr/BCQ2k6C7zzeNQ7DBRCBXIa8VTJHIu8keOePKZRlZh6VoDkTIbn37+E/AxRi02DBmAON0E5pLbEwlMYFqI4lSgas6X5v0jscFYvYZXX3eLK1Zvhf/bwVrCymo5o4rurkH/ixH5NYHyhw9wvMUh0k8uVH1Owbqir3/95jUJ6cWEo3Cs/wJElU8aIjJmpFiYfFMwmXrOwKW/Uhd7fpq4G/tBEo32uKoognU+n+Vn0K6Z82bUFpbnzsYYkNHPNf96phesw7lGP8DTm6EdyrhCxY0ctYbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIHeqK+pb0MketZc+F7GcYV9gK5VFbrvfR7yhxx7Qek=;
 b=LDAJlBFVIJVgRyTp19zjcJJesOkEtsJJoPBUJFaZZvROKzSebWgIzXemBZBpJsIZ87+Fyla+Pe5F+gd8LdXZ2Ti2MMtwkq8jiLu2I57woxws8o1Go3Kp6ZDCyRPb798tI36tA7akP2t2+ownfLmMRMX1KxbQ1OylugjoNRCvr5xbvHYR1LL5cFg3shj6d1HyyFOlVH+X8D1r5q/4/qxHFBvwXbEA07Ay5/D1nbbfCDBKZYLSLbvcTtjYN5hwq++O61ngmRJx6UywRl2SVXvOZt+T4LhdV/UdOM8I5GH0fGnLab1YCTEVtqCcRiUoDPtjLdldGaM6EWRxyxa/6EFOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7293.namprd11.prod.outlook.com (2603:10b6:208:42a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 18:39:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 18:39:26 +0000
Date: Wed, 6 Sep 2023 14:39:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <ZPjHWcv10MhWgnYf@intel.com>
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e3ba87-96b3-414f-93de-08dbaf08990d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7omzU6ghUtt/946PICr+1IqAKMnQgWt54G13eLzi1FphZM7erqwoLAxpLULnlHh7uiUewa8WPUDSQNK2Yox7szKYCc11iYmWt2vEwnmo21Ihh3qE7Rb0aSokX+OdrPWVdeSbFC+z2MwZbqNE6Hxaqz4HE+42RJNvgT3b8kDXdz8XZG5DFN+tth0o8gtMUH1oU2jvJwDkkE43wHjc8BZ40cnuJXbo2WwtDpXiDotqCwY1bWJlQ3YGFHdD4+3A5TtwupRI4INuOUZzvR8g/83kmxaWHnyf8hu4ZMBfhB0AxcGly9OJu0KHI0eZTAhB+zftKG7s3c5pMAOeYVb2Og85NxQ43OBnMkYBLdcOOsgoF6rYX443WhHfRf4xmhQuyUBEroCGGZNH7cqV0bkaTQITC08ev5e5tg+KEgFYOJrAH2lkteyux+q3C+owAHH1XPXd9wtFy5dq8oJgLxOaavdBdeWNxvCIUasED3+R6yG5PZnG+wzAdZ2YEMMJPOSpZ+9+b9p2bCe4n+S6nu31KfJekqE98SQm/QMTu7RcW9QcdlmGAY8kTrsTfNQS1YnMgbug
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199024)(1800799009)(186009)(2616005)(37006003)(66476007)(6862004)(8676002)(8936002)(4326008)(66946007)(66556008)(6486002)(6506007)(6512007)(41300700001)(316002)(26005)(5660300002)(44832011)(6666004)(6636002)(478600001)(2906002)(86362001)(36756003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fW59KiN2f5p/fr4nTpNkbV59C/paQlMHrbrb9FD9ZpjmYGMmdjvy2yTBbtlL?=
 =?us-ascii?Q?PS6iy/oldP7xJ3O3ew2tncS5m63PEqzvxWVA1NlUqhn+5WfPvez8aqbR7/yK?=
 =?us-ascii?Q?MW2mzyTHRop1SUL8JYqtZ/vwir2jAXwxUEwSxy4qVpWEELX5WUoF8eFVMA4J?=
 =?us-ascii?Q?DPuUcL6JYX1CoCWTah+0sH8CCTHkn1iW0jaa4NWR6nQ2oWGa/ePHKbAMXK/q?=
 =?us-ascii?Q?0NKinpC3TORpuvXvIuckkJ+OS1v2+d/JZldBuA99s8W0Slu9jhkYSYPWZKlS?=
 =?us-ascii?Q?RKYpSnvtlWBNDjSpfy5hp1gxPtBJu3jrZ7TcHY6oK+wAwBpiP0hk2tAaFbyl?=
 =?us-ascii?Q?dv4el6b02T2wh9MXXO3Ssy9f6SRg1VTP3L8jVuQr/dMk2+zJDnr8agvj900B?=
 =?us-ascii?Q?mNPGtA03ffIWLqUVZqz1SUfiOGMTVWrqPYNoc5s5sTvd/h4IyDD9DoWxMnzk?=
 =?us-ascii?Q?PZCfGT+fm3qASkBtbq6VJQPwhd/6MnzqY9vaaiPuoOkpmoVEOUPiq7ZrncQk?=
 =?us-ascii?Q?9QvD1vYLzNANGz2hvwDBahyk3M94IQuS3J5zvb9rc9SqTxlkW9Wu+0b2jSeE?=
 =?us-ascii?Q?AgBt80A6tNuyKfwjamMzC9qzf8SWRnfeJuXgI5NX9ixWXqOCMBiVZb3fj3pO?=
 =?us-ascii?Q?R3jl0mA559DKZRjVjbJTGfsl/0my4MrhXSAuP7w85/2Hb3xXef2+Mlbb1pHy?=
 =?us-ascii?Q?o2+O0oeUP6xjJHXGTY+GgrZPxDZqrVb/FjEcRu6KiU8B9J78an6BEi7fkGTC?=
 =?us-ascii?Q?s7zYwb/VY4aWfLWoxt08/HmQHvi7F0wr8DSXJGj58/eUgQw2FGXaCAcHx5RK?=
 =?us-ascii?Q?NT2IPkzA788PenEDk0KCkEMhwz8xeJ4pP8oxmlAle8vXgC8Y1D++EnypAdyt?=
 =?us-ascii?Q?2gJ3hJ/RMyYObFsvhv/uC5dF/dp6Rh4f0VT4k9zBFujJIBesZ85C3AVJFvfh?=
 =?us-ascii?Q?WsnazL4n9eC+nfQOICvFIXzqTjf5D+2wttK0gbGMGof68FXvnwE6DPpakypF?=
 =?us-ascii?Q?FaabBLsbk+LhYWRggtAhJyB4yfduFtRi/z8wZWCDM6qQNzj0uQUYDQ9AkPPo?=
 =?us-ascii?Q?JjeQSYnDNQlau9TpF2iPVKob/l+CTfS6PGzK+T1IUGsb/+eYi98nk7pIMmLe?=
 =?us-ascii?Q?pCGY3Z/unjy0Lai6Bhmyw4tfxTORzbnvCAESSMFH7F7WrVHvAhYZlHL4OTXj?=
 =?us-ascii?Q?HO6UCUfQBhbQSdyvGKV7L3op+x4cvvgEujMrSSVlNn1NikUtDTRYsf5trPIC?=
 =?us-ascii?Q?l9cG9bzn0rIAu1lUFrDiy1QREiYSFWHPvQ1JKG239lCvg1xi2EavD3y+lEAn?=
 =?us-ascii?Q?TU3zP7jF4bYrUlv84r2olwmPpu8h19ZVlMFlY433udnV0lg7Cg5GKSh/QjSV?=
 =?us-ascii?Q?xMt9xJRR95t6nUBzMfFGk8JdtlzUw01EqeUzxHe9m/cloa+T9RrQ6e8fWjft?=
 =?us-ascii?Q?t3jtfLLbOiueF8/Xa68tSqDa0cRJoymTuV9211JVBNhARJD3HpiwHhRw/6+B?=
 =?us-ascii?Q?9buA7snZ+rBcLm8uRSRfBSUEtQj6M8VO1NYapS+x+ggOdq13T8LYtJW2K8UL?=
 =?us-ascii?Q?eT8U5okOIcL2UH5wxvK5eOqzlVnX9rTu/+1xynNEz7Ep7FNHIfnHZsqdr6p6?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e3ba87-96b3-414f-93de-08dbaf08990d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:39:26.8684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWye3g8sg4Ep0xz88BWdym4XAJLJOz2/NxgrI24EjIOFftS0A4IbpKVCkYDFYM8Is5lK0RrnQuGjt4k4s4RLew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7293
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Print display ip version
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

On Wed, Sep 06, 2023 at 11:34:00AM +0530, Balasubramani Vivekanandan wrote:
> Print display ip version during module load

Isn't this useful on i915 side as well?

> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 60f3474844e2..fc01544346d5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		str_yes_no(xe->info.enable_display),
>  		xe->info.dma_mask_size, xe->info.tile_count);
>  
> +	if (xe->info.enable_display)
> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
> +			xe->info.display_runtime.ip.ver,
> +			xe->info.display_runtime.ip.rel);
> +
>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>  		xe_step_name(xe->info.step.graphics),
>  		xe_step_name(xe->info.step.media),
> -- 
> 2.25.1
> 
