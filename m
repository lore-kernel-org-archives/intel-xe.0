Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248C6C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 21:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8AB10E795;
	Fri, 17 Nov 2023 21:41:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EF710E795
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 21:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700257303; x=1731793303;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=I80mgr3gpx5DUxP+Va6/OjLcEB3qe1E4t4wtbsviZDo=;
 b=Ei0xxV0MWKwp0/NswQRN1YTzcmywLaU6GGHGjqlp2WT00M1LaiuKnqfH
 qv4EZ8f0m8rLO36M9nNLgPwD05oLLiAvmPAJGuK2CC2y0dHIOTawpY0F+
 NwDjvORwVG54GR4VkGtdQCI4c2eDqjaWQCKH/G63Rt4CK8B67sfj5cUae
 QxdmB+kz6kzwdEbWP7HSaYAg/8j6wXi0um+ajZZzN/QlDc6sUoKnWx+hz
 cHpNKzbSYCpbexRvHyDcmz2cO8EbE+wT+VleOJ005ANlZ5LppaaazIas6
 s9qQDVvtava0Q3ey7p0XW+iOr8Oklum6YnDNlHRfLAOfSij1kpkFwedlp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="390231816"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="390231816"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="7145400"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 13:41:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 13:41:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 13:41:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 13:41:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlCrTrZenQ+kUbjDeP36ioBwyjaM4noEc7fR9BTUOdPGZ7rbJBgUWuy9htnuMcbRClvWZ58whxf2aCSOd1h96DilOIAagKI4qgoxxtPrPLQdYNFxbXKyNh1AgdGyt1XXUiN26u2QmoaSeQJXRVMSODSEHrScEKupW3vWsS54BjYuOuvnJDpqaVW0GBT+j+y8/UP44YDjcIWXIBVwV7pqIt7h5NwdNQXxhtIKhlMHR8+cGWBUxEG3EfKGlSiYaqQsersu0PoD67IH3R98/AiAlLktP155EErBZWNgWvrIg6AJSjzCXX7+QyBXsNyWCozIYn5rKdGDabTupIc9cQ29Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SrPropT9o48n9PvCmZAVjgdsRcQq8B+6KgrZPd4wZ4=;
 b=MHeOelu29Ddxs4LmQupw3QHF51L+0MYjgvzDfGr5BiVzb7NmBsdiz3jLK7SijJFJ6Pb+QIfqqM/Y+TjKhfKPmujfTdwF+g6aMYZVMv/r22pOILrp1Roc53c8QDxtvoPKVafe2WoigTpikZAo4A1YuDo7XWFVVtLFoXfKZh7cQMXk6wUkzBBpAorHX6cUABemlRJoE7nBFsd+Eqosuvc55nIJLUVl9J/g4v6vXKT2kBvsPt6mDd41b1Yg8xFxjB0dVqx3aIanpJH/yi+Rt2295b97S40MXMRZIuzGDbmnnfIC13qGS8t+RH6etJiuDfsyMom+jvJJO8sp/usYpIpsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 21:41:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 21:41:39 +0000
Date: Fri, 17 Nov 2023 16:41:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZVfeEJmfg6NST0LX@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-4-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231116143043.908412-4-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: f3299f3e-180e-4f14-001a-08dbe7b5fb2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXUZz4vLJyskfMNA1LQRI9G+ixF1D3RU9IJEDWHjtZwjJF/whqpUBQ3mEy+unXhK2ZhAdzQjOHhtYXjSa7f+9WfcvChVMEyvQ4OUihesGDjzYn4kAMzvLNM4tePUF+Ne9yGMTYWnrHWI5eenbzYTRCdunZrUzfq7WFuS5KYQ15z8BudUlc9TdH9HAsKuB7QnGlDnvYPEMkS9eNCvsqRx1cBUB8obUBTiMu3g/IuegQMnCXGBI7jkkDdMAM/4900JVq9KvdGLeiYS8usTG2B3JMj79o4ZV8x+w9sXrRjwH8KXo8KyRehoW3pmVzBxI5oUVa+DQV2KAnCT6ffcxAESnD6OYOSLV1iaj0BgIF/56GqGN4wj9BhN6jaeUhwuHoPHnYKTPBzPEXqY61xAzns5D/d4XdJGpuyl7xsEH1PleDoNT3C7wUriS4EwVkxdSTmQd8sl3Ky4ZXzJca8RjVgRW86kK2YA1ve9N7MOi1q4JJ/TJZI6dfN/LkDWRB9B6TlYbSLzAncCplzIgn7xiZoaZSfjTXbhAUmM78sT/K4SmTp97560rYVFHKRrRQ37DF6MkFUgXdO5lx1PGwnaLN4poOQjzsUOQCsO3JNBgRwqce4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66946007)(66476007)(66556008)(37006003)(38100700002)(86362001)(82960400001)(83380400001)(36756003)(26005)(6506007)(6512007)(2616005)(6666004)(6486002)(30864003)(6636002)(2906002)(107886003)(316002)(8676002)(6862004)(44832011)(5660300002)(41300700001)(8936002)(4326008)(478600001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFU2VnkxUlN2R0loK09BdmdKU0dkYUtWNmxGUmdsWW1yRGVzM3lmdWVUNzZy?=
 =?utf-8?B?VVlDZTFqNjUwZlcvKzRuUWhQZnFZOWcxWFUzUjA2Z3FKYmp6eklGMi81K2Ft?=
 =?utf-8?B?NkdWbTZpaGVNNGxKRy9Yb00vWDBQdG9pSUgzbUhtWnJ2Y0l6V3V0cnJpNlMw?=
 =?utf-8?B?NWwrVmVXY1R0VkNtWjhPdUFqSFl4dUJvSTQzQXZCK0Ntbk9ZYWV2UU56YUov?=
 =?utf-8?B?eXdsaU5VYWZEeWFEdU5admI5SHdVU2tzZjc5eDIycWFWTWsyMjA1dk56d1B3?=
 =?utf-8?B?V2lCQWVuYTFKMm9ibERUZWxRbHhyZ01BdWdaSGQxQzF0MDZJdE1BRlpKVzc2?=
 =?utf-8?B?VFJ0TVFiWTE2SDVvQjVqazlqSi8ralo5SjlEbXJkTUprbzNOMXo5N0RYQUl2?=
 =?utf-8?B?ZEJsSzZxVGNTNzN2V21EOUlsL0JRSjk0ajc3ZjRpUnJDdjhjekY3ckdIMHZC?=
 =?utf-8?B?ZklKaXZkUDJXU25Md2J4OVZ4Um0xc0ZoS0V3TXB5bVdhMHA3V3VhNTVGN0gw?=
 =?utf-8?B?eEtoWHZCSldKNnloNm81UloxQWxyZmZTTXJDMzI2eStESTFDcm1tRmJjOEdE?=
 =?utf-8?B?NjZEbE9lUjN0VDlhQndETkZOL3VNYXViRENBdm1TYVFsUm1NMHFIZVdpdlBi?=
 =?utf-8?B?SmNYN0lodVRXb3E3dXFUTUlLOU4xK1NYbFA5TG1wVWNrSFpkL3JTVElOaktu?=
 =?utf-8?B?MnFPWjMxdzZtcS9rT1daRXVCaHIwN1NNT2ZyU1ppUHRSNlQ4QTB1WTFSTlM0?=
 =?utf-8?B?S1JsbGsyblZJUStEbW9FZUlZYXBFa0Y3aGJ3a2hkNldHaDUyWFU0Y0trSjh6?=
 =?utf-8?B?eHFtK282Qm9tVnJHMHdlRlQ1RXdXVFEzdnNPd1Q0VkhmQXMrMCtDSUMrbTQw?=
 =?utf-8?B?YXJIbCtCc3orMS9QR0JJWWNmaEJINEdUMUZqNEtGbDk3cUlQSGF1cytJWjAw?=
 =?utf-8?B?UWxQMXZmNnJNM1NOekpEM3VMY0NPeHNmQlRJUWJYKytXUjUvRXlQNHBzNmxX?=
 =?utf-8?B?QmhZKzNJbEU4dDNDOSt2RXJoZ3cwV0Y5ZElIV1g2Tk9qU2plVmFLek4xc1VG?=
 =?utf-8?B?RVE1dmxsVlJvandybHUycWRDMU5YTHJZaThZNnBFNVl1SCt1SndiQmlzb2ZU?=
 =?utf-8?B?NHk1M2tnL2Ezc21UMjBqa3d2UHFhSVlueU9JenEvK0xxNnNGUEpQaHBYT2ds?=
 =?utf-8?B?YU5rTUZ5MXNsekM3QUkrS3pKZDRqUXpqSkdaNGZTTVJQODQyanlJaXNZd1c0?=
 =?utf-8?B?VENZdXBUWEhPYVdvNDFhTU5Mb2ZrQ3pZb1pwU2E5QUtSN2JobXpET3Riem9m?=
 =?utf-8?B?NTQvbVNVb2g4R2hUZDVTZUZNckRITTVNWER6NnB5TVNwUnp1RUZtcG1TK0N6?=
 =?utf-8?B?amtaTTgwbUh1SkhvdjhGK3VUSWFydTlWcHVyQUdPRkhPc1JIajY5RXFma3dU?=
 =?utf-8?B?SlZVMWJjMzduL0pMT29jVnRTay9nZFI2VTIwd2hVM3c2eUVjVUNPWEk2QTlk?=
 =?utf-8?B?NlNSaUp1TkZqZWJGOVlhT1AzTXRONGZ3Q1BKbUxMbTVNdVljUDhsTmJ2eEdm?=
 =?utf-8?B?NnJzNks3VGtNamZTUVQvZThzK1RzQ2Fqc3dieGxRQUxJMnJCbFA4SzZtR3N3?=
 =?utf-8?B?T3FFS2tlV2hJdEE2bHNDNjh6dUE3OVo4QWtOcURXUXNyczVObHQrMy9BYnZj?=
 =?utf-8?B?enpsci9FZVE0bVVVZ1krc2JZbUIrU3dBUTF6SUkzTjd6c1lGSG9lWUcyNHFj?=
 =?utf-8?B?SC9YK1lGdTIzR09pNkh0SEs5dk1LVUdiRU5ib2l4b0gzalNpMGJHQWZjK0wv?=
 =?utf-8?B?U0t3YWhvNzdxczllTHkxUTloL3N6Sks0T2UvSytqOHc2RTZIaEMrTzk0N0FC?=
 =?utf-8?B?NHdTcm84TkcwM3VPaHR3bXlsYUdPMkxJQy9TdkdWVkl6R1FBYXZDQXlTcllF?=
 =?utf-8?B?U0ZkL0c4Zjc2aHBLVEQzdVc5Mm9uSWhUY3ovY3R3UEJSSzVpWnFrRy93QkJp?=
 =?utf-8?B?Q2hVbjBmMXhCYnRnbUhWZFpRV2svajBxNXBOdlJzemgzbmNaSzJCQTdvVGpI?=
 =?utf-8?B?ZFhzcU1qNlhsSkN5OU42UVlwSzc5RkFZeUk4ZWhrUW9KTUwwalgxVTl5WXRP?=
 =?utf-8?B?TlFwWHY1VDNZUlYxZTg4QzlJblFXTDFNUERYSmtrVytBYytiOFQ2YmlHOTkx?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3299f3e-180e-4f14-001a-08dbe7b5fb2f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 21:41:39.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8ePok2msRq2HmC9selLzB7x+TB9GkxN9jMwd/otr+namhhzE5PluwDg6MGsnb+qaJRzwsUuW7OAIlpOGqhEFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/4] drm/xe: Add throttle reasons sysfs
 attributes
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
Cc: intel-xe@lists.freedesktop.org, vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 08:00:42PM +0530, Sujaritha Sundaresan wrote:
> Add throttle reasons sysfs interface under device/../gt#/freq
> Currently there is one overall status and eight reasons
> attributes.
> 
> The new sysfs structure will have the below layout
> 
> device/tile<n>/gt<n>
>                ├── freq
>                │   └── throttle
>                │       ├── <throttle_reasons>
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile               |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 266 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
>  4 files changed, 296 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a1a8847e2ba3..c02b8e9bd72e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -64,6 +64,7 @@ xe-y += xe_bb.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \
>  	xe_gt_tlb_invalidation.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cc27fe8fc363..296ba9831634 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -457,4 +457,16 @@
>  #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>  #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>  
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..1b64058d9561
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_reg_defs.h>
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Throttle
> + *
> + * Provides sysfs entries for frequency throttle reasons in GT
> + *
> + * device/gt#/throttle/status - Overall status
> + * device/gt#/throttle/reason_pl1 - Frequency throttle due to PL1
> + * device/gt#/throttle/reason_pl2 - Frequency throttle due to PL2
> + * device/gt#/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/gt#/throttle/reason_thermal - Frequency throttle due to thermal
> + * device/gt#/throttle/reason_prochot - Frequency throttle due to prochot
> + * device/gt#/throttle/reason_ratl - Frequency throttle due to RATL
> + * device/gt#/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/gt#/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
> + */
> +
> +static u32 read_perf_limit_reasons(struct xe_gt *gt)
> +{
> +	u32 reg;
> +
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> +
> +static u32 read_status(struct xe_gt *gt)
> +{
> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +static u32 read_reason_pl1(struct xe_gt *gt)
> +{
> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +static u32 read_reason_pl2(struct xe_gt *gt)
> +{
> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +static u32 read_reason_pl4(struct xe_gt *gt)
> +{
> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +static u32 read_reason_thermal(struct xe_gt *gt)
> +{
> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +static u32 read_reason_prochot(struct xe_gt *gt)
> +{
> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +static u32 read_reason_ratl(struct xe_gt *gt)
> +{
> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> +{
> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
> +{
> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool status = !!read_status(gt);
> +
> +	return sysfs_emit(buff, "%u\n", status);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t reason_pl1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool pl1 = !!read_reason_pl1(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl1);
> +}
> +static DEVICE_ATTR_RO(reason_pl1);
> +
> +static ssize_t reason_pl2_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool pl2 = !!read_reason_pl2(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl2);
> +}
> +static DEVICE_ATTR_RO(reason_pl2);
> +
> +static ssize_t reason_pl4_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool pl4 = !!read_reason_pl4(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl4);
> +}
> +static DEVICE_ATTR_RO(reason_pl4);
> +
> +static ssize_t reason_thermal_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool thermal = !!read_reason_thermal(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermal);
> +}
> +static DEVICE_ATTR_RO(reason_thermal);
> +
> +static ssize_t reason_prochot_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool prochot = !!read_reason_prochot(gt);
> +
> +	return sysfs_emit(buff, "%u\n", prochot);
> +}
> +static DEVICE_ATTR_RO(reason_prochot);
> +
> +static ssize_t reason_ratl_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool ratl = !!read_reason_ratl(gt);
> +
> +	return sysfs_emit(buff, "%u\n", ratl);
> +}
> +static DEVICE_ATTR_RO(reason_ratl);
> +
> +static ssize_t reason_vr_thermalert_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool thermalert = !!read_reason_vr_thermalert(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermalert);
> +}
> +static DEVICE_ATTR_RO(reason_vr_thermalert);
> +
> +static ssize_t reason_vr_tdc_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool tdc = !!read_reason_vr_tdc(gt);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static const struct attribute *throttle_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_reason_pl1.attr,
> +	&dev_attr_reason_pl2.attr,
> +	&dev_attr_reason_pl4.attr,
> +	&dev_attr_reason_thermal.attr,
> +	&dev_attr_reason_prochot.attr,
> +	&dev_attr_reason_ratl.attr,
> +	&dev_attr_reason_vr_thermalert.attr,
> +	&dev_attr_reason_vr_tdc.attr,
> +	NULL
> +};
> +
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg) 
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, throttle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt) 
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj1, *kobj2;
> +	int err;
> +
> +
> +	kobj1 = kobject_create_and_add("freq", gt->sysfs);
> +	if (!kobj1) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}

This cannot be right.
We need to have a xe_freq midlayer now and that creates the freq sysfs.
a child throttle creating that is strange.

> +
> +	kobj2 = kobject_create_and_add("throttle", kobj1);
> +	if (!kobj2) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
> +	err = sysfs_create_files(kobj2, throttle_attrs);
> +	if (err) {
> +		kobject_put(kobj2);
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj2);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..48e22f6b6442
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright Â© 2023 Intel Corporation

                ^ strange char here
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> +#define _XE_GT_THROTTLE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> +
> -- 
> 2.25.1
> 
