Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE558C197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 17:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C0310E0DE;
	Fri, 17 Nov 2023 17:05:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B88510E0DE
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700240705; x=1731776705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=riQ5OHCq+w+LM3ZckfCM2K3PZQRleHp5L+PPvuuCfdY=;
 b=nOcXLc5/1qXz1NuVohx+MFqxus+g8tfKrUP84eWxk5Q5eGhdIIwInZVX
 eYaiObGhbXQi9QYjYnAXYldaoKd/ljDKaaVu6kGHpCR0QuQFNbrX3D+US
 guHlmhVmybzTj52TpQ7bBIGPhSoz6TEnukPp1W2T9D00C6Sm8rXBctV7y
 sujx4b1IYr299G6v3hNMeoxN2X8VPgLWTGFKKi+1Bdmav0Cdj01R2IAs3
 w9DujNybArlokFk4hfHRqVOKdvagKCoW0IpOELggkj+If9XkFZf5me3ep
 8GzDJU/oI6qefHOJIJOJAM/1hQKTUY5GYrH9+xIwOBj6Sq/ZzSRlALrRn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="395259097"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="395259097"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="715581052"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="715581052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 09:05:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 09:05:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 09:05:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 09:05:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PynCJcAnCm5CDrndhVIuSYF8ZZk0eAiwDzXuIW6z8h8R1RO18mT/+thhk/2PrATrAEgaux7NbD1UNRbEVTZLKft9rP2uWHOM9LuwSA3Hu1UHtLJoqdhA03/4BtqGMuKRIS2D37rnd5UjWK1Sgk0k/EZVIzscApufczztnugYVcU6riIPVUE2fAE6bNGdMJ+faxwHmN7k33odCRz+AT838Z91izTacwaG7wDTizmm7eKVDab4WdOuJnrAQ9o337wIJSOhY/GGcyyRHA81uCXj4L2a63bg0gxt9VempQOiWwlcwY2gnWP7q2f7fKr8l1iLd0nzJtJ5bukpNS7DxVm5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnUAo6D3Nns/2lOyl8stVDxqxjOkc+ity/tmNb3i3zc=;
 b=ZadQxZgfnC0u4wX497eX20ua1ekkTk08AfKhRSQeuBU2Cdk2VtVuktQm1BCSC4xVsGKau+Lgz2Wm2XT/RDIwkf8uBhjng5OA3JaRGGs7i93qS1Wm9UBcJbpR7mO2fl5x2jz3GY58JL4uIlliYfIFmlfJMlyR1PJfGjxfTQH3xNNAtSf6wDZSJ4NjAmBqchv/n+nZhvX9mBhtrSjhCx/+cAHsOcGaRZJjZ8yHapZnesoTKJMp5wRCYVnFap5bWJP6ISKjH5xBfmorCxJ6FAdJL/Ky76UWekcxhDKJkIjkD9fYV+XzfsRNCjwR50rU79fErkqAwSCFc0eXIwS1AetbEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 17:04:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 17:04:58 +0000
Date: Fri, 17 Nov 2023 09:04:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231117170456.GW1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231117121301.3443217-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117121301.3443217-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:a03:167::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ba0052-583f-41e2-0176-08dbe78f5479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntTAOrYFYCZt3tmoVS9vUHiDApCBU0WUXB0U2VogI28rheO8ERKEkSWGSdVVuy28/syByLICVZG66bzHkXKlORbhm9zatcBXqnS42xTfN0pP59wm+cvDTJy+ETE3uDWEchXa5Gh5V4NwSWTybhkAiNeLr60B0raxKiZ26QhkP+d3aioY9tu2lH5KLcwTKGm6uoAyeSDkebisBS2gserEKJbv4AdXGJO6Sb16QkeM2M7XerB6WX1FgRA94TF4+igZH4b7QyDSpedW+dt7CaOdCsl47QVrzV8pLQebevZZTFoOqoip5QJS5yt1nkT5MddshfSdthGkiyqFmRa+IxTEhrBivzlEpxVTmzOVlwRWt3rKPKItGTLz45mgr5JmsbkPc1M/kawgndCY6y8PiRwmaZa3GLbDB0lVvEUUUxyhiU5BZlGPTQIdJiz15GC6nsZSNSpvPcTE88fRL6PINl2+de92nihEkb6E8/ImSpyQ63MTCwfPkR/C8IqCN8aFQn1isrvkLRzEzXgH7PJeqdg/PHbGOPP0dnbDsi9pRcqTomUSsckJX4CNU2zXbqHAViBL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38100700002)(82960400001)(1076003)(6512007)(6506007)(33656002)(5660300002)(41300700001)(2906002)(8936002)(8676002)(6862004)(4326008)(86362001)(66556008)(66476007)(66946007)(6636002)(316002)(26005)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u4VqQ+CJpcAWqDF209vVWlIT1iWT1nzVwm9C1tNvZo1dkqZkkcbmbgWXvod1?=
 =?us-ascii?Q?yPW636qlsoLUxIqeS/6vze8PYX4yIf1EUKfXcHQVeRH1/YRunoCTpMaH3Sjj?=
 =?us-ascii?Q?NcPf0LMTK9x3Vv3wFb/Gm/gsuP9GHVoJWTIMFYrqrPCkOcy1i3n0hkMAAHa+?=
 =?us-ascii?Q?h88RzGMyDPbqI4VIT51JGeZoC/r9jwFgsl+vtGNWiQib9+9+zQLmKsmdOQq1?=
 =?us-ascii?Q?eKD3yxDYo8z0Mjlh7/lb98hXUBBlyoPHqII+5yHpnjadBBKOP4TSesmKi3e9?=
 =?us-ascii?Q?GnMNh0yyFwo1Q6oOP6pCLfFobV/Yx4dZmroaDtGl5kGzCUyFCmAvsr8xJk7+?=
 =?us-ascii?Q?s9Jq4O4An9NJiSRSGhvSpS1Zr3ilCVdhghfhaDApVdk+fH8hcZvNqPTkZSQc?=
 =?us-ascii?Q?PQ/U3Yl89KNtPP7FoHsuoEVQTjsAR84MHv3gde/5+8Qwk+yvVIL4sona7WVo?=
 =?us-ascii?Q?tyDw88Q4NUgFGcHZsCjrvGlfLUBqON+H4LyAUO/6P1CbL+hKV0RzDKscm12r?=
 =?us-ascii?Q?ZslwW3NmWaOHLSdaaX3GBYHtuUlThDuNUTrmMxq1sf4yDxCB73t/Ru+p5SwX?=
 =?us-ascii?Q?0lxvR/HpMEg8qJMDmz1DHg4HGCPpZ5LmUBllrUOTLv5Pq2Vt+l8hgCR1nnBG?=
 =?us-ascii?Q?Mz6juxWDfdTzC8oAOW3LBVS1hHi62FCOMe1rogYxjLr/X4geKkuExX5xEqu2?=
 =?us-ascii?Q?rzl1+P/P41YAJbehYgxXG/7nm2p8ZPrWIsFQWQXxbGc86jEgouG3HhiW8GbL?=
 =?us-ascii?Q?wWIlqkBAkuVL+xM4/udKpWp1CYzt6kEfYkPDKgaajvXEJ3XmNJexqw5K6cEO?=
 =?us-ascii?Q?r+04qinzeir11px0eP9PN1nyoT22jp+hkxNRxtnHKviuh8ZTEnyd4dovIa+b?=
 =?us-ascii?Q?oiDSsQEh2Uwxnf5DyIriAjAO4frhpCMwGW5K3wi30QBiAcEgfuGaYTpZOit8?=
 =?us-ascii?Q?KhD8n5L1giF844B8a2f76fZm+3ynwu1TjxH7VihIffWrV1IZIXe8PwB8sBUX?=
 =?us-ascii?Q?sfhotPK1bJqPxQLFOuuRkOUMeSF6GZ0aDcyjHMlowgDkA3Q+1LyWYPjQxuAp?=
 =?us-ascii?Q?CUpXNbcBb7JsSKHFo2iWrHQXneiMKWUsLCSAIidHdJYoaD6Xv12PWvQLjIiR?=
 =?us-ascii?Q?JRxwmEkbQg9ILcivRJT5ftsncxGj349LpL4L5KyhmPDrKCe9hj9CHg7DjS4x?=
 =?us-ascii?Q?L0f3Ac1KbVwhebkdnuYlgYzHWiUO2LvYRS01XVzn+JOPx65+kMMqclSFpy24?=
 =?us-ascii?Q?HuDPFOk12ZSEEipTDO81+SqWbTKZuvQwC5jDlTLDmS0rdrW/xO5ZtJ6pW2+H?=
 =?us-ascii?Q?e8lc6ymn4HjSSI0CD6xg+zlTOcGyU/+3jLXhMoXBaEnTFG3Mpq9LhUpgHoT5?=
 =?us-ascii?Q?MJ3Ced1AujHV1nSwVRn0DK90nBIoSniWhqf1WilHSZ6/jXJsSfkVJ7j72F4Y?=
 =?us-ascii?Q?w2d/aao3knmcv5AmnTzjyH7D2bqsAyg72jGNm5mgfiZTQeTol/KgoKF8MyJ+?=
 =?us-ascii?Q?vbpewIpW+MCLwSlAfk+jXO6KUA5DSZ85FRrwjgbmw5IYdKetBDsao8Hnj542?=
 =?us-ascii?Q?UiSe8DSwwGmHHgc+xoprPol0eYAN2gww0h3W/s7uiexOT2oG6T79gGBSaaC8?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ba0052-583f-41e2-0176-08dbe78f5479
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 17:04:58.8514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL0musy8W/m3rEMkp4uvUKUDlc0/Y6EExKstdtKjfWXxLZngtjr49tJaqTMwgrtAQs1yRt6OJU0lcNySJGKGSHkP2SRsGZOMFD8gsCVbjjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5902
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 14020013138
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

On Fri, Nov 17, 2023 at 05:43:01PM +0530, Tejas Upadhyay wrote:
> This workaround applies to Xe2_LPG_MD A0
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cc27fe8fc363..5c497a10f9d7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -93,6 +93,9 @@
>  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>  
> +#define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
> +#define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
> +
>  #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index d03e6674519f..67a6cb5086ab 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -272,6 +272,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {

According to bspec 65182, this register is part of the RCS engine's
context so this needs to be in the lrc table, not the gt table.


Matt

>  			 SET(XEHPC_L3CLOS_MASK(2), ~0),
>  			 SET(XEHPC_L3CLOS_MASK(3), ~0))
>  	},
> +	{ XE_RTP_NAME("14020013138"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
