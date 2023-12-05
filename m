Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC31C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6D510E04D;
	Tue,  5 Dec 2023 21:55:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204AB10E04D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701813357; x=1733349357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nhItlJebFPFTEcSCUUfVKEtER3BL5S9a52IDJvfq1kU=;
 b=TcVljf9TL19TRCf/Ptnroe5VXW0ISaj/iN8Vr5YehzqHdQYYcEyV4eKN
 Kr/mFymFL1zXRnF0gqffuIk21NDWaAPEQRW0U3esXqkktZhislXN6P80W
 eIkAqiQ1Sr98YChNa4MKfZ1l3mYe1/OgdEMr0l6x7rQcBsQP/0yAUCnlO
 014qZpnxg7TsdbWiHEoVAmO1QuUbFLIXJoZny8AtXoV32Wi1L+dZIyAgW
 9HvLQTQS/IU18dP6V7LIXYVqW2KG51bvy/KvleSEFq3mDyv4fcmKK6uFZ
 QJAWZhjJKD4cT1DK3iOTqCadbSEM1JIUsgccYPYLYykIvHCEIwYkbfNuE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7262022"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="7262022"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837089772"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="837089772"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 13:55:54 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 13:55:54 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 13:55:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 13:55:53 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 13:55:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtlzxETcl8ZOP/1quvg6EmCuUIkAUZ+s5YAoMeXsHsK0MSLnqXVxl/AU2x2aGBuJRVM2T/KeM2XJ5tAC98Bd/DkFaiHwqPfV6g3eG/amSPQ8c1El2QQol+VwJ2J6b16Xu25wBsMDf8mLP5PyEeNjO3mlWASyX3pbnn++AwSkfvyijTzyR8X28lyrCmbuZx1H3UYWiOQ/ty0QL4t9tZHRH0UbHd+cEEhk3ghahJ7aLKhq6JWBNXGMZVrCGRo2/AWq24jVoleiJ++wOVmZsWfAmBw2lJK7UNyOSoU7zJldhlbAUXphgCf1dhYXH+u+tcvC6jdVvY1VzUmgAQOfCLL7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcKh+aXPYDeKBHW+R6Q+Dgd5FVqSsH5akVJ34UBS8dA=;
 b=mdkJd5PGpNqdhKsIRnJAsyRH6rW0z7T3tZ8pOabmUL1ih8cz/TJ9WeGOtgzBYooghNO++8ROttAXEMVL7aMTO22aJxlYnzVpy166/d5x3P++r7H1KKXlVjYJDQ+JR1NbO2C3osEH+HkHIcc/6Py9QDaZ++F2Oq7UNVj6TC9wLe/u1AbY9ItB1fCQA6koTDBEin+0pvahz3oYBkPNS1kmRaySpJvqbcD7N70SGVZ4SGyg9XPvpMRxlgMKJ2DjDr1hxvrWMsjWzmoxsk45D7QnUVOGMNVKKQ1qJM9iNtpy53UswTVhflDAJPU1Alt5GUg8Uy58rfQcXyS1CCp+haFNFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5448.namprd11.prod.outlook.com (2603:10b6:208:319::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 21:55:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 21:55:49 +0000
Date: Tue, 5 Dec 2023 13:55:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231205215546.GL1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231205085249.833836-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205085249.833836-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5448:EE_
X-MS-Office365-Filtering-Correlation-Id: 927080bb-e16a-4f6d-f8ef-08dbf5dcf102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PK/ocXUKv6aQw38FlmIaKRGVIgIEaGUcNrIIrDraOiU1e4IsABh308R/M9isPTJVTyn36pdK2QR8zFWPCW5EJP+iPCuJKAeXUzwr/J1+UkGduLbrUnTqlMs9j4JbVl8FXjyJau7rupXy62UfGQxYCongSBa4PhwpMvua8b5dbxbJW61UzDyWxuHrX+3wy8bneTzOrEHF8gwiPWL4x4+vPyS67YszPnyHhWKrazIKiVZam5kZImKgt6+kU98PV3Khf8bOMsq9lm1HkEyd3RM5X47aAafa1ItMTEK8sYECcSyH0+bKyJK/Ln8Ee1avDfgAKLzq3jaUAasKmkKN7w55pNtNdkPVLzcUJ43en7fYUKrLQcZio6YypTJ1CeKTbED1yqeXT1YhBHtoLL7OaMr/lG1XzuruTpNQE1P/5n1ajz2c5eupglkt9y9kUpC67VHFWJ5xFLEmd38bsemkGZHzUh0r1MfLIvSJPUzLQZWbs3zE9igVzUOUw6ZALdyqNdZ9sw6HG0iQn5hXUSrkRJw7EJXQlQSQNwbBNEOwZIF2gPLjxYOWUUm4L7y7pmPgvFox
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82960400001)(2906002)(5660300002)(33656002)(86362001)(41300700001)(6506007)(478600001)(6486002)(6666004)(6512007)(38100700002)(83380400001)(26005)(1076003)(8676002)(4326008)(6862004)(8936002)(66946007)(6636002)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KpXFozQijRkI4DT4MekZ9GUHH7lVgqxxY1bAK1YBMifJ1mTxlVLd/axcJBv5?=
 =?us-ascii?Q?yYRqHikCzJ9GOKvNgiOwUZ90nGcuN5WWB4MWZlLGBdVQMpqQEbGf7AdE2BhS?=
 =?us-ascii?Q?vtlCT7MMv02qi9hL4KophFuaaKt6WC8vQmmRawLRD4iJpXZeKyHsIYhR6sBB?=
 =?us-ascii?Q?OZsqlWhp+GzM+C2bvnjQizKs04j/S4a2VuYS54PAhD3VCGS1bQvorfSIAaNH?=
 =?us-ascii?Q?9wNj+iNe0Rxd0Fj1yI/GwWOCW2q/R/vncH0Zs9Xmg40wG/3kawHkVvXIWSif?=
 =?us-ascii?Q?HpS6BVBfgxAZM7yi2fprRE0zppQn74q5dxZaV4773XK8lRBEgLt3DcqeiXh2?=
 =?us-ascii?Q?NkBXLOb3sVv1Xj43h1SMqpV8PbQ9gWMf1c3xhKMSRJE4tPrkd13tJUrWhPZG?=
 =?us-ascii?Q?Nm/B3OShqW5Av/iEa7dwv4cvLcNXyx9foBFnVf9o1evap1ao+QlbR/LtFWSR?=
 =?us-ascii?Q?LEmFE/pzpEmCQUvdLF4bL8YsJ4o5qzIZpY6UfplFeiBIOjWPMghXTrsSTbPk?=
 =?us-ascii?Q?Vqgu+IsEL0899XhLFxOUHfRzc/d/9m0MIqsSWGSl0V35pYeSlw1lXmvsBf8K?=
 =?us-ascii?Q?7F4G+WHXtSJsmYusj2Zv4DBvCKAvyqoU2xCOcqPiE7kfkmgftxg8PNz2xUL9?=
 =?us-ascii?Q?M3RSWT4o60F7txd75Nveq9Hh8VPA+WsrWQhAn8kn8+jrLpv7STkZhXH1ngNx?=
 =?us-ascii?Q?dFugFm/O/aFk2VdzYLBatskjld8rZ0BBXw56HWdh5jmWpwmy+4FfMcULF3ZQ?=
 =?us-ascii?Q?TzV7dNaNBREOetYaKy9rCLeY/DrquvJW7lPWpV8VLX5PAKw07cq0dQa9bbgF?=
 =?us-ascii?Q?gX3DGS8dwv9bE12EZaU+1Be8eN+7QNWM3xzl7u1oXDqzwGRiel2hgdL9OjEt?=
 =?us-ascii?Q?1cwyUAVaye+OG8pWbo4U3AZkeClOHqouSazKXVUXU/y2cKSo0VApJiOemtAa?=
 =?us-ascii?Q?4VIGIAzl8jDuW9wThTJzfaDqk//9yL4xNJGNBxKUQZLM8amCP4x9Ze0A/wiQ?=
 =?us-ascii?Q?eZQXIT0HSI3uiOQqbZV1y126Extn/ORm/gK9FiCi9/cbJcm3c9/ZpW38mc31?=
 =?us-ascii?Q?3S1/zjTkxLEKhoBFxl2JCs374TYl6cpx6ohSSvdvc8mtpxXKEoJ9TWU8EGLk?=
 =?us-ascii?Q?nghgrjLprfpIi00FvTzR2XYGV/Lql2lvNqz6mFB3iHwLaIj/9NYrNpPIjo2h?=
 =?us-ascii?Q?LXzOwOXxYz0uspR8zHCwRFQwAsdwwB0renS1lX7EgDCNhS1H0Crp5ZyB1rYJ?=
 =?us-ascii?Q?CnY7XB/IiCo+R/pmlk5LJzwZM5d41+L/v/JMJJzeWRfSnp4xSO0Zqu3eT14W?=
 =?us-ascii?Q?MbN8WEajZRVeATvNQOP+m0mgbhPRziHYrSsjOJjGnaXWqKx0YmVKCh3lzIlN?=
 =?us-ascii?Q?I1t8eJmxdhjQF/k98OsXBjRPnNR9h95O2twW6/q9DKxmerLPy8MhvlAfdcST?=
 =?us-ascii?Q?BiUeSlItLSAPYpO24V3VJdQ/e7xyEbjkXpfWzt/Le+AztGnrrLkIzbFfn+GK?=
 =?us-ascii?Q?TTVNGvj2pS+ld7/Hscatyn31rGMKbGjZdHsKOTScrMj73O5WYfmmjm5p4DhV?=
 =?us-ascii?Q?VUlFGmyyaSipJvz2MVJxjXu6UO6g9/BhJUGgzYWCaKEqpKDC1E5LOZmRSGcq?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 927080bb-e16a-4f6d-f8ef-08dbf5dcf102
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 21:55:48.9475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2vaCsIPp6Dt/jP+FAT9egIOZQtacoVyZ1O5mnIhNXukkdZrUQVdNI56gEE/Q+KFyWdtlw43um1GDT3bPrXTUCDV+nf9n9GcYQAw4fRGosc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5448
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 18032095049
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

On Tue, Dec 05, 2023 at 02:22:49PM +0530, Tejas Upadhyay wrote:
> This workaround applies to graphics 20.04 A0 step and on
> render engine.
> 
> Workaround has three parts :
> 1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
>    (at least not right now) since we don't use MI_ATOMIC anywhere
>    in the kernel mode driver.
> 2. Memory-based interrupt masking - Memory-based interrupt processing
>    isn't supported on physical functions, only virtual functions,
>    according to bspec 60352. So this is probably only relevant once
>    SRIOV support lands in the driver.
> 3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
>    is added by this change.
> 
> V2(MattR):
>   - Mention detail in commit message
>   - Reorder bit define
>   - Improve bit naming
>   - Remove workaround part which isnt relevant
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_wa.c               | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 444ff9b83bb1..ecdbc04a2d91 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -40,6 +40,7 @@
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
>  
>  #define RING_IMR(base)				XE_REG((base) + 0xa8)
> +
>  #define   RING_MAX_NONPRIV_SLOTS  12

Unintended change?  Even though RING_MAX_NONPRIV_SLOTS doesn't seem to
belong here at all (it's defined twice in the header, probably due to a
conflict resolution mistake at some point), but that should be cleaned
up independently in a separate patch.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
> @@ -47,6 +48,11 @@
>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
>  
>  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
> +
> +#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
> +#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> +#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> +
>  /*
>   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
>   * The lsb of each can be considered a separate enabling bit for encryption.
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 63bd4bb1af03..4389ce3548dd 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -596,6 +596,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> +	{ XE_RTP_NAME("18032095049"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
> +			     GHWSP_CSB_REPORT_DIS |
> +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS))
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
