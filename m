Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A73C27C42
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 22:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BB210E3DB;
	Wed, 16 Aug 2023 22:28:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FF110E3DB
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 22:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692224888; x=1723760888;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5RTddXy6upNPKb+Djl9dsjnO3IHXhm2twW9+Y1352ds=;
 b=YK7WPpjsSOxx/W6AU44k2849f9HqKFC/y79x9W2B3Kxnq6bh9fam53ke
 wkYp6TI0WeSUfXwRetKeK4/M8mnXnFbBvUouXsbmHiEvor6yI9huF3y94
 jtDQSIQVD3fmTJnJjpO14gmltrfB8D1rcPHSSKBaAr3yfnzAmYihUPSco
 k9BcYnBoguoMeWtjuCYo1rDaYDdlTLDBZC/cTixCu/nmADAcHUki0L8/4
 lSCKzVjXxAWs/2oJxekYetHGhuWbyaQmkEvJnUeALtutJhJXn8WZj/Y92
 XJ0x9kowgwUMDzus7f9hd7z644DrgkRDmoD+yd7asNe1TEmjC4HTA7jdX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375418961"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="375418961"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 15:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="711272277"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="711272277"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 16 Aug 2023 15:28:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 15:28:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 15:28:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 15:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgOpX9D6zfXnbPKcyDmZ1TL4AQ/I5sbcADQdxiNEIpjH1HLSwVIyrw1XWl8e+Oe7KEsKguMMCCoQ3X0l2JLI0DQtAWqyKUeG0kfXqeIcu1KZSEMD0d4RDHNJWDNk+DhikEUNPwVYDJEbafPqfP7uy4yWcDbUDclt6TcM0YFP7ES7XY1Xx98jM0M1Z2qv/Nryqc0dI8sy1XOsvO2qwnuEU0WaUU5pIyao9DYvW9n1l5KJAbXF0sJ+7yLAV1fMjAOaNJbKhy3TfZJL3ksoMnOwH6PJ+tyfg6X+GZO4BsDyqmCzaSBrHWFdGLFY3BgmBT48/IT1WLL14c77LIzdS3XIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svwzas2KR8ljPQ6TAmoSzH6NaVAkL4E1tXpYryiRRNc=;
 b=KDXe7axsUHOKuD6AuNJ+Sm49Q/XeXo7TYpbUIO2Yv95P65AL9hH6fl9k7u0GKivk6EKp/qcYQZqw1HtwruiAjY1McLPzQMHEzq/YsPozonz+C6t+xaBopV2B0KBpXkZCurRL8kNyvZaa9FOcf9ciG2VPUpjkQt/Y2TSnfVy374pyfqskfoI6UjLNNQten1oGOEHsZa/xFBM/Y8pounlAz5jXJBvuYHhHJhlrMfjS8rI3SomPF5lyT/I36j6LqYFnNo60mY5n6wEcJMvGpw2YkR7G6FhiyttsSRCSriCQGHjG/iRXo8Cn9Cs39g4+EYJORWpv5R3Zhzg6dL1k4HvSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 22:28:01 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc%4]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 22:28:01 +0000
Date: Wed, 16 Aug 2023 15:27:54 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZN1Naiw9LLTxVVLR@msatwood-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW2PR16CA0056.namprd16.prod.outlook.com
 (2603:10b6:907:1::33) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 88997afc-7e7e-42cb-b5c7-08db9ea80c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W3PCC9ps9OMwoo90t3VGo8k9OUnIcD13e2XtdQ1+NZHesMoPriJcg6YnsefAWYOh1HhvAaE+x1mTO0ycdwiBMf8bdMStIqzWCFOdNMq3ve+GrYo2DGnLNfqo6DGhQzCtWldjbGmVYZT8RcdGFjdbj6wL5WVKyFeMMmRcAPApYwEmFUtYuwk/CiyATSGoe0pf24zcw5yLKd00uCIuN1zlxeHtV0dE2YqmNmCyLv0+6dZIUtXMzRScuVHbwK1ZHIsgKg6slOQA3HhoEHu3fM/mBtoJzQWz4Yb2cJBooS3KKOw2I+hrb/IbiHJfQf7ZXJR2S2qJgDU8BPmuqxEc2Z9u8sT5uppe4rCZDYi0sC51eoR+n/4KIWDIwa9T5Dk7BzdUQSY6drTYRPyEMtEgbEmx+cBpmLkTxMN8jj/xa2Lp8GWCQJSajWrFy2t3COfwmBO4xUxYbv3kOERi1QfcTemMY1Ow/ObiwxB7d04Z/VOtEsBTtZ1Gac9YAwJHuO8alZh1TbZqixFghKJtIzQ4PSMtT/lhpxPCASIyeHW+YCuYulHNfxmGIOo7VDRvBvXqYmx/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(66946007)(66556008)(66476007)(5660300002)(41300700001)(38100700002)(8676002)(4326008)(8936002)(33716001)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(9686003)(6512007)(107886003)(6506007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHVsaXVSUERKdUVDbjRmaFZ5WlR4NzBFdWpIaTYvWUdyOXVIa2MySDcxVU1w?=
 =?utf-8?B?Ynk1am5LMFlPWEwvRnBMQklQYkNTTnJYbXlseHVSc21uODJsZGI2YjZWMStl?=
 =?utf-8?B?TlNNcGo2VWdjVzhHZ0hMcU1qSDBtSFBDYzVTdXNXdnRIaFRvNlpNK01nNGxw?=
 =?utf-8?B?RUNRRDlDdi9LSGRrTGhrL1JSUWdFVXlpZW85VWx0aDYraW9WR2RVQ2xCOHRt?=
 =?utf-8?B?dW10RS9Mc1kyMmJBRnJzVjc2blplSU1ISXNLdHMrR25hMU9xOFR3Rk9mMTh4?=
 =?utf-8?B?aFZtZWlCWHYvemNYS1EwNTQzQWRVVTQwcWdGQzBjY3duNlltK1ZVb3RBMTVK?=
 =?utf-8?B?NWZpZHhuN1JVcEJITjUzd0tQZkhXRzR3VGN0eDlub1BsbjhTeDZXdzByRi8z?=
 =?utf-8?B?bEtNOWNvQ0EreFJPSDFQbWxTM1paU3c0SzVHMmJBSUxrMXdUak5xN2loSHRT?=
 =?utf-8?B?bDhUZG5UMEpaODNLeGVoSmNFWVU1dGhxNlR6NFoxQVp6Zm5kL3g0SW1seXhw?=
 =?utf-8?B?N2dza1NmRkZzM1FyQWljMWZVTUQydG1rajcyMTMyNVpkVHZXWEZQTWMyWWFk?=
 =?utf-8?B?c3NJdTlFSVp4cDU4a3dGTXpra0N2ZWs4cDJzQ0ZXVjVibVhmdU1ZVnc2Sitx?=
 =?utf-8?B?NzkvMkxpdW93b0R3Yi9VZFliTnM4dVBnQTkxTmJoWTJ0RHpFZ0ptNHpJZnJt?=
 =?utf-8?B?QjU1bERrZGRwNVJWWUxtVFNBREdiUmhBZEdpd2RmY0pzYUllbU5adFlNNDJB?=
 =?utf-8?B?SjJwWUVidVJFMU1VdHBuSm9SVm9GNUt5dy9ZWlhFQXJTdENkOXhpTFBQTVBw?=
 =?utf-8?B?THprTXlxNjEzbFMycXQ3V3g2dkJrT2syTGczWXNDcHpGakxuWnBSUFlVejZk?=
 =?utf-8?B?WHhrUUFjeUFMdzVvaW41cVdHUi8xZDZCK29SVE9ObXVxcFhBQVBxQ2U1K05u?=
 =?utf-8?B?bzBWNFdpNE1kM01zY2YxVU4rZjZjL2U2MSsybmwrMlE3Q3YrMDVnaHp6TTFU?=
 =?utf-8?B?cE82eFY5VGhtazhST0g0Y0dzQ3hOSXRjNE85Yk9Bdm94SDVZSGUrZDJqekhT?=
 =?utf-8?B?bzNmbVVSUW9XVTlhTDl2WEVEU0Z3M1FtR0lNVVBtQnIrZG05THdod0U1d2dZ?=
 =?utf-8?B?RytzOU5ic2FpTzdjWGEzZjZHRXlWTnlkRWN5SDhZcXNVN0QzM3lEZSt3a3FR?=
 =?utf-8?B?alBwdUwzeUtwQjBLMUJ0NUJSQktjWWhPZ05kbHpHdVNQWkN6VVVIcHdvQkJD?=
 =?utf-8?B?UEYxWENEVjJNNzI1bitEV3lnK3VpV2hZa3dHc3J5NzNnYnF3NkRSYUt3U2Z2?=
 =?utf-8?B?amtiM1pydWp1RnNVUVdJR0x1UldYNFRKYUs3VTh4OXB4blFYbjNFQXh0dFFv?=
 =?utf-8?B?RUZjdU9hdFhtSFhlVXpzaklpOG45ajRuT29HUHRNMzFGNkkvTzQ2K003OTJm?=
 =?utf-8?B?UnV6ak51UVhSbjcyYU4zSGNsTndFS0lDREg4WkNXMDZSWVV5Vmd5YUNUeG5y?=
 =?utf-8?B?MHdYOVJKZkFybWw5b3FVbkxrWlUyQ0tSVHV1cDcxMytxbDV3VmhVNHRzRXZt?=
 =?utf-8?B?ZnU5MUVobktwVlA3NWRCSVJEWGlCdzIwc0xkU3ZuRHdWbHVWRk9UUk9BOTgr?=
 =?utf-8?B?bmdnOEI5a21LSDVsTHNyUlN6aEMzeFIyL3R6UFZhQStpQ0FEcnd6aWw4ckZs?=
 =?utf-8?B?T2hJNkxIK1NOMDRhQUlXQzZ3bUhYSDdidFJ6cmxONnA5MHhVWVh5cHFTbkJT?=
 =?utf-8?B?RUo2RkluUENGYnQwdzI2MUxNb1VxWHZ0dTlRK1dVaC9pVE1mYjU1NkhLLzYr?=
 =?utf-8?B?c2p4ZVVNS1JROTRFdDNmTDVMSGxYY0N1UDVXVWJSNzlydFdnZFdZSUEzQTIw?=
 =?utf-8?B?SUxqTjNHclU5SXZtKzZLLzhWNEk3cDYxWDgyaGZsaGJCTElTbVRqaDRzZXpm?=
 =?utf-8?B?Ri9qNWRnSUZYbEttVTUyUVZ2TGVlcVNzYmZuM05VM2FZcjFmckREaWYxdU1x?=
 =?utf-8?B?dytoSlJFV0prUGV2c1ByOGQ0bDMwNGxqQTdYeTk0UU9iNTNZbXY2ZW56dExq?=
 =?utf-8?B?QklhUzAxd0kvcitCaHNRSmgyNlNGeHFIbkdkTVVlQTJJcmtFMHNSMlkwd1lJ?=
 =?utf-8?B?eDZzYjhReXByOElxYk9ndS84aVIrdzV4Q2dGZllHTW1LYzdPOWxmcHQvcHJq?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88997afc-7e7e-42cb-b5c7-08db9ea80c69
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 22:28:00.5224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0qVmvX9YHZCgrZQPj63B5dWwyEjkEeQKumMSm7WaeRSuFi1zR2Lojp8QXo/2bcdPXRhdFoqwBz5RHYpPxzacrWys6KRPQUP9bJAp//6Jds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/15] drm/xe/xe2: Add MCR register steering
 for primary GT
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:06:06AM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe2 uses the same steering control register and steering semaphore
> register as MTL.  As with recent platforms, group/instance 0,0 is
> sufficient to target a non-terminated instance for most classes of MCR
> registers; the only types of ranges that need to consider platform
> fusing to find a non-terminated instance are SLICE/DSS ranges and a new
> SQIDI_PSMI type of range.
> 
> Note that the range of valid bits in XE2_NODE_ENABLE_MASK may be reduced
> for some Xe2 SKUs.  However the lowest bits are always valid and only
> the lowest instance is obtained via __ffs(), so there's no need to
> complicate the masking with extra platform/subplatform checks.
> 
> Also note that Wa_14017387313 suggests skipping MCR lock acquisition
> around GAM and GAMWKR registers to prevent MCR register accesses in an
> interrupt handler from deadlocking when the steering semaphore is
> already held outside the interrupt context.  At this time Xe never
> issues MCR accesses from within an interrupt handler so the workaround
> is not currently needed.
> 
> Bspec: 71185
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_mcr.c       | 50 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_types.h     |  1 +
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index ad7ae6a28caca..5bc6c7fa4759f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -145,6 +145,7 @@
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
> +#define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>  #define   L3BANK_PAIR_COUNT			4
>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 9eb7a6a1348d6..ef9f4044ca1fd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -181,6 +181,39 @@ static const struct xe_mmio_range dg2_implicit_steering_table[] = {
>  	{},
>  };
>  
> +static const struct xe_mmio_range xe2lpg_dss_steering_table[] = {
> +	{ 0x005200, 0x0052FF },         /* SLICE */
> +	{ 0x005500, 0x007FFF },         /* SLICE */
> +	{ 0x008140, 0x00815F },         /* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
> +	{ 0x0094D0, 0x00955F },         /* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
> +	{ 0x009680, 0x0096FF },         /* DSS */
> +	{ 0x00D800, 0x00D87F },         /* SLICE */
> +	{ 0x00DC00, 0x00DCFF },         /* SLICE */
> +	{ 0x00DE80, 0x00E8FF },         /* DSS (0xE000-0xE0FF reserved) */
> +	{ 0x00E980, 0x00E9FF },         /* SLICE */
> +	{ 0x013000, 0x0133FF },         /* DSS (0x13000-0x131FF), SLICE (0x13200-0x133FF) */
> +	{},
> +};
> +
> +static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
> +	{ 0x000B00, 0x000BFF },
> +	{ 0x001000, 0x001FFF },
> +	{},
> +};
> +
> +static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
> +	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
						^(4200->43FF reserved)
> +	{ 0x008700, 0x0087FF },         /* SQIDI, MEMPIPE */
8700->87FF is SQIDI only, to include MEMPIPE entry extend to 887F.
> +	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
> +	{ 0x00C800, 0x00CFFF },         /* GAM */
> +	{ 0x00D880, 0x00D8FF },         /* NODE */
> +	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
> +	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
> +	{ 0x00EF00, 0x00F4FF },         /* GAM, GAMWKR */
GAM starts ate F000, EF00->EFFF is reserved.
> +	{ 0x013400, 0x0135FF },         /* MEMPIPE */
> +	{},
> +};
> +
>  static void init_steering_l3bank(struct xe_gt *gt)
>  {
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> @@ -265,6 +298,16 @@ static void init_steering_oaddrm(struct xe_gt *gt)
>  	gt->steering[DSS].instance_target = 0;		/* unused */
>  }
>  
> +static void init_steering_sqidi_psmi(struct xe_gt *gt)
> +{
> +	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> +				 xe_mmio_read32(gt, MIRROR_FUSE3));
> +	u32 select = __ffs(mask);
> +
> +	gt->steering[SQIDI_PSMI].group_target = select >> 1;
> +	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
> +}
> +
>  static void init_steering_inst0(struct xe_gt *gt)
>  {
>  	gt->steering[DSS].group_target = 0;		/* unused */
> @@ -280,6 +323,7 @@ static const struct {
>  	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
>  	[DSS] =		{ "DSS",	init_steering_dss },
>  	[OADDRM] =	{ "OADDRM",	init_steering_oaddrm },
> +	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
>  	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
>  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
>  };
> @@ -298,7 +342,11 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  
>  		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
>  	} else {
> -		if (GRAPHICS_VERx100(xe) >= 1270) {
> +		if (GRAPHICS_VER(xe) >= 20) {
> +			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
> +			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
> +			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
> +		} else if (GRAPHICS_VERx100(xe) >= 1270) {
>  			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
>  			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
>  			gt->steering[DSS].ranges = xelpg_dss_steering_table;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 48fd698ff62aa..d4310be3e1e7c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -55,6 +55,7 @@ enum xe_steering_type {
>  	LNCF,
>  	DSS,
>  	OADDRM,
> +	SQIDI_PSMI,
>  
>  	/*
>  	 * On some platforms there are multiple types of MCR registers that
> -- 
> 2.40.1
> 
