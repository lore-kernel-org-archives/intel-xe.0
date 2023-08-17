Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1DCC64E96
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8254310E090;
	Thu, 17 Aug 2023 20:44:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A3610E090
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692305088; x=1723841088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sFnXzOo8sMI+Uzun/7L5e7zj+UMItdwLBn01B+pUKy0=;
 b=B1gTbjlQ6gc3Wsr/tmNRxbAEUxsp3eRTjhgfVauY+ElBj19YvXNZWzZ+
 c68kHaMmBri51yHdw32XNKtUhFKrftBzpG/toxLd+S+AcsUISfXgXEho2
 OlEvD73rziUy05XfDMGq6aKdRtmUjmiZ08PSEu5Fgv2lJTEeiZ6eegxHz
 pNy8Z3Ui29C89p5t13I9eRyTuLOZY0tBQfsTKgJvL/NMVi0V2f6+oAvCE
 XozQ/nsoaeC2SztuOdmsGzJOKnF4+5ZNxBNGZUNJCtZT8sDtfKCSfIaog
 y2bERsBWciloPwR17+1+Dgf08BydVrqikiB8hVnE6MdOhYLfFOOMmNWOS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="353235227"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="353235227"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858360024"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="858360024"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 13:44:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 13:44:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 13:44:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 13:44:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 13:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCd9unPHK9QLjbJdZwL7UAzFX0/UHUCMSeYHwFdnJ11YotgbGkkmxru32zKzm3CInSPv8gAgvU3TEaWd0E9Ttro5SXc7If05dmbRpUBCua8oixHkL3i3C2ccb1gISV50LMkw/qlw/GCNYWVOCK3gisHk9NhHrRxKeK0zK+sc0L3/lOmBd80XNv1fBRSDEnGy/ZCUZIMrfd1Zqac6Rgqq7pqvYszudx57wSpOywoxfErYV4ulieDFQ+OgnECVSVFooV9MhFx3GozLRUmzU9mGDj9+TnWevZyYwaO2mzGL8GZFS4hzBkY/0L3NQcEIFx5xAG22IbA14BUNA9YVZuY3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSbS12o9AXMEIhqu+u9o6H9JhYQMQtf45y6svbt+fog=;
 b=B+rve+A/J8hG2zrw2fERffqfLeo2KTzqAk6Do1z5m0dq+rGNEu/mLcQC7Ns3p13GjYn/KuKqrf9TIeQk/bCgiqDttROgxBtHhqHusI4+simE8wk1zcaHgl4stPhaWVMY8ZpPxuGSo07fjX3egNZeJaQFb0as/bZLn2kMuMmSsjhXmb+xyoCxxQKzhlm+qRlWqKqpJ14PFRonjj3fWQRz7doK/LmHO4MWrPnAi66rHrMBTuxDp5XeX7zMRCBHEGXfZbmnPPoCGdbOTMP9dweFl/CRFeUjR/Dgz/m60NZWO2VIxIxyqKtP43kp0PfzG2s+VbIoSHZ+MgnKMFV66rtfBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.30; Thu, 17 Aug 2023 20:44:45 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 20:44:45 +0000
Date: Thu, 17 Aug 2023 13:44:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230817204442.GF3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
 <20230817201831.1583172-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230817201831.1583172-8-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 924bad9b-0867-46cd-958a-08db9f62ca33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rGu2cUgNRog+wmvak0JD3jNTRD5TPfxZG1sCfzgGvPiJ/fNORYLTouN3pgECYIgCQRILJaQcd9ZfVBepFMrDAGoqdVrIqKK+q4lUP4kuH+L4sqNX1P/y3MKCspmiC1nF7Mwj9WT9wk3wbv6NSqJT9HI9Tn5utPp10NCv9UB7J7FjeK1FEuE0DqWX1o6FIldgkVUScvSIirSg0uGWPixJ3gUGtC1opToENMx9Adl9y7dmYZW9XYwqe2koGT10irgB47IZhyL0sHu1sJRgMg2FyX0651k3tw2du3TDfMnmvk8jctWpS5HjlEqvQ8VqPmvTjqMsqv1z7OomLBcrlI+6lHq2VQacLrXHWT+xnMdeY5+IMVY+GbF++X3ey2Db5MTRuPb1f0OvNgREavhsq2USiwpXpLhfCWKXALxd/bdZsm5kmoi35UGWpO0EtF9mNUc6FjNIfywnUgmDYE9gkLDGNPz3zzanpl2EzbgEW7GPYUlVf3UT+Tw/a1/qrv+PlWJghOyQXo92yxWEDLIuJi6ZCf/T2f6XjAlOwrwM1PTUKt9Y/DQQTL/rp/9KDnAr8wQz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199024)(1800799009)(186009)(33656002)(83380400001)(316002)(6636002)(66476007)(66946007)(66556008)(26005)(2906002)(82960400001)(1076003)(5660300002)(6506007)(6512007)(6486002)(478600001)(6666004)(38100700002)(86362001)(4326008)(8676002)(8936002)(41300700001)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5YH7A4e6Grkbk1clCyVt6CjAFXBF1sLFElk+DI2rutzeNny7i3GMcTQFGdG5?=
 =?us-ascii?Q?wm2Ghv5OFE3CWUyD3mnVB4QLoM3np3HVxk8I0EMI7ELS+tCSlzUyHdqkW4zX?=
 =?us-ascii?Q?I2ujFIYxngWZJUYNHzbgerj7HV/GaG9hy6D5A8OL8JXf/gsYAISwMjfxBdtW?=
 =?us-ascii?Q?IdX6d65fFafbgfxYreMgm9vOrpWIM91kqZQbOdgmYgqLYuej84ZEl2eqp9qh?=
 =?us-ascii?Q?/FJ35VVpTXwzit1u5y0cGfEZcMiYMZ16w8BwGKA1Q2fbIhGPTYacN1ikIxbj?=
 =?us-ascii?Q?B/9Bwa5Ex6BnBEHuDW4dObcxQSuMenWlyD+xc81QDHyXum2604LLj7hvlCjD?=
 =?us-ascii?Q?ZsIDVVNxRSevqqHRkAiBdteWQxPXzQrq3U41IWrnkCL0F8c67zHraoAFplb6?=
 =?us-ascii?Q?L8dMI52dytuKlf04g3C+rt3C21r2Iq7u13TaEhj8poxg98zW5L+LY3ZcbCME?=
 =?us-ascii?Q?GBwsZbP7Irp/s23rrIJJiO/aGXfPFcaNSz7TNT7BLIKMmrtrq1atraOXBuLE?=
 =?us-ascii?Q?IRDiWp6NYTB8Ys9s1rSzB+DRqnk3SJiYodNlPUkE/JmDJ22kBK7unQz3CaNk?=
 =?us-ascii?Q?QM+WzBG4ZMjUwDZBh+4ajLXZzdzpLQS1Xt3BrbmpPL54R7LskQWchQAKSw30?=
 =?us-ascii?Q?OKvapN6PIINuHF803Sg/g4MsMPukp5fDazPYcJRFb4xzXAN8r2tS+tQGsspq?=
 =?us-ascii?Q?wg0luZqJWyn5nmAskPDX8mdU/KzpUdERTYy1ZYN8AG5U89oy1jM7LDEaib1L?=
 =?us-ascii?Q?uwJBF/TiaCzO/bmL9cgBbqtKU7p06P1LSBggfZDpwMm31kKfpxtzzxuzbwy/?=
 =?us-ascii?Q?8KcIlYwEToHma/TOD+LK5gkkyl3KbBq1TgX8wgPCM3P6l/qOLAucfeRaSXxL?=
 =?us-ascii?Q?uyk3DDRNcGpoqMcR08wB6k7aiE9oLN4PxXIFaV/nNdpzb7S3oLNAHZr2HkGD?=
 =?us-ascii?Q?BZWgVumsBeQyNih9FXR8SxfjB4cd31WVQGd7+hnHikCRcDV4RHcbwYDXlaiG?=
 =?us-ascii?Q?8yHUXhrOF/O5XbjlGeZlrySW/2kWrmZGUjHfnoSEc/+O4LhvDBy9MMm4j/Gf?=
 =?us-ascii?Q?YE2vD8h5Ds61mhsRTGV3dYRPdljzvJUTdGoTRUb2AceV3Q3DTTfo8Y55PCJH?=
 =?us-ascii?Q?wa+KVKLO9gZYaOFBGWCRimh451MiahSCC6oWO5dew3hn1xoJRxKtlSWyQHyq?=
 =?us-ascii?Q?qOtNqsXMtKG/1Ln0awxl9Ki3klkgUPFBnwS2TSkEBelrnQghqZSEwcv9rPjY?=
 =?us-ascii?Q?/CGW9B++YQ5AoWMl3PNMwAPAcZ1SaWm2kpbXsCiA44sd4UhO1/zA/ovuHi9T?=
 =?us-ascii?Q?BMAmqk+YldO1f9sje8/hU697ycqWqWdt++4w6A+cobL4cS1UazfLp9F47sXy?=
 =?us-ascii?Q?Q7e1aZmojAG0eEEeTBpaeHguOmus87Apy1G6tLuyPco4F211FgerPSNQcypm?=
 =?us-ascii?Q?ONsK3EDQdILCgLgoi37NzIH7pN2M2MCEhova0s9Rye7YOBpV88EzrgajfOlf?=
 =?us-ascii?Q?PB4LfyTjnIKRrnmvRzsSlcFZV4lDdLE4NMfs9mUV7Cb5UvyQ1xcso5GAvulF?=
 =?us-ascii?Q?R+DohfI/foy3q4rb3AZ4NDnEHwKkH9JdOMPKc6Sz4LdNPhJpVSOG9VpZhop6?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 924bad9b-0867-46cd-958a-08db9f62ca33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 20:44:45.2347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWrr9V+ZxFYfyNOaROy8ut8GKiVJxhzVkjmegf6zoF0FOjn3N3iAx9llHPk8q9QaYo3U45u1GiuWMOSTak3m+JXGxuz9GrCq5j160Aq4Prk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 7/7] drm/xe: enable idle msg and set
 hysteresis for GSCCS
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

On Thu, Aug 17, 2023 at 01:18:31PM -0700, Daniele Ceraolo Spurio wrote:
> On MTL (and only on MTL) the GSCCS defaults with idle messaging
> disabled. This means that, once awoken, the GSCCS will never signal its
> idleness to the GT. To allow the GT to enter the proper low-power state,
> we need therefore to turn idle messaging on. As part of this, we also
> need to set a proper hysteresis value for the engine.
> 
> Bspec: 71496
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 17 +++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 79873bf64e8d..f012a66cb3da 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -22,9 +22,13 @@
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  
>  #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
> +#define   IDLE_MSG_DISABLE			REG_BIT(0)
>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)

Nipick:  might be best to put the new bit at the bottom since these
usually descend.

>  
> +#define RING_PWRCTX_MAXCNT(base)		XE_REG((base) + 0x54)
> +#define   IDLE_WAIT_TIME			REG_GENMASK(19, 0)
> +
>  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>  #define RING_IPEIR(base)			XE_REG((base) + 0x64)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 81281e9c02eb..cd0ac3ce5abf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -339,6 +339,23 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  					   ring_cmd_cctl_val,
>  					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		/*
> +		 * To allow the GSC engine to go idle on MTL we need to enable
> +		 * idle messaging and set the hysteresis value (we use 0xA=5us
> +		 * as recommended in spec). On platform after MTL this is
> +		 * enabled by default.
> +		 */
> +		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
> +		  XE_RTP_RULES(PLATFORM(METEORLAKE), ENGINE_CLASS(OTHER)),

Although this change wont' be inherited by Xe2 IP and beyond, there's
always the possibility that this Xe_LPM+ IP might get re-used in another
non-MTL platform (e.g., some kind of refresh platform down the road).
So it might be best to still use an IP version check here to cover that
case.  I.e.,

        MEDIA_VERSION(1300)

> +		  XE_RTP_ACTIONS(FIELD_SET(RING_PSMI_CTL(0),
> +					   IDLE_MSG_DISABLE,
> +					   0,

Rather than FIELD_SET to 0, I think it would be more intuitive to do

        CLR(RING_PSMI_CTL(0), IDLE_MSG_DISABLE)

here.


Matt

> +					   XE_RTP_ACTION_FLAG(ENGINE_BASE)),
> +				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
> +					   IDLE_WAIT_TIME,
> +					   0xA,
> +					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
>  		{}
>  	};
>  
> -- 
> 2.41.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
