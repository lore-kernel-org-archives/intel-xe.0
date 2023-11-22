Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA21AC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 19:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C1010E0AA;
	Wed, 22 Nov 2023 19:38:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C43E10E0AA
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700681886; x=1732217886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=saV9Vb68aqgveHjZz1GjqJcofQyvaVPdaeVlGwVwpfU=;
 b=GSh0EX8sGFk9KHBkt0mccOeMIYK1cWTTTvUDGKp1hnA4zD0Q2BLxWRIb
 icCJAqVPC/NxzNpjGETv6F+dBpJ9uSlmqOizdquNAWeYq5IR2VBPLDmzc
 OGm29aM8l3J92Khz4PDjbgnTzdB3Drt7y+Qw0ay7yDdPzSZTipmwHQoO4
 ZaviT2BhelAb61zNKAFTvjH5AmuySYsCcLxwxmPkeLbwhHuaVI8FLDpPq
 G3LVVVd1QXeqVsO+k1UhN6l6xGOFsBww5ISmhsVWQryDdwmCNqEvoC++1
 T9t5eVB3ogO+RuTpI1pd4thHhflm2DdPJNCXDsswH3v8NZZRtfOAtUSBA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389287788"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="389287788"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 11:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="15403977"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 11:38:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 11:38:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 11:38:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 11:38:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 11:38:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dT69Iqtg8OqTywX452+VLCNAEUIJf0a24akQbQrw0EBIqJOLMDxJj2Dfrq5GBbinl+bxOGaoa2JTHKvOPL7RguRDT+YCWroUoMRlzjhbJlh+tzv9P3/BGQEepwRp5UrKd3e+9u/0q322Nbrgarj2K15LmweBdAZgt9w7X5q47lrOnEMa+5bkRMyOzPjspAJH5jHQac2kaYb4oXySQFgp3anFLGxUbypEW4CUFpSXk84wBoxq/CSOqOQk5actzN/L6gQ+NwpRY55Zfb+qDhlBS8SkqfEbkcBiePekmOYYP7+qGfqokXtQnfJ51Pj3NKMVBAVdiyEs3AGQvkBxSA+BLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQF2ODHDqnsnfA/CVQvzQCoypEegdRWcN3Rw0tZyjdo=;
 b=KXfJZNcZXrlzVAE8TC9lP1twjsV8ko3P7kejCdDR/JalROlQP58qR9TVjVCm5Dp9VrZ2eMH/PM7MZpaCIf9t/9Wjf5ZFEsknpyrDE0l7k9Wfz8DqU6zwHyUNwLgpuuqSGmLqalMMzOvnOr82vgbZM6/QWJZuQp8ketJxP96m67+P9ubP8TMTOVIvbjWpmRfXXVQMvCvxq3exICRO/LqNHNmClxF10/MWn53frylzxpHV4fkHR+yxhdEPrkqKzG5wGWDxZJJDRPxCFo1La4rFxXtZvylEJ9jiD+f43XIE0YjvonuZxpBO7nDRrYvnL60fKumZwA5Q5Dnxkuo4P0wdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 19:38:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 19:38:03 +0000
Date: Wed, 22 Nov 2023 11:38:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20231122193800.GO1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231115073804.1861-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115073804.1861-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8f777a-cc54-4c59-c0e7-08dbeb928ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4ClAiXgofhcwn5pU0PmhnDP6MX9nWsaLom6hTJ/UjykHeLaxCrSMKF4oLDmMww8bmgi/u0lyEmGlbt22pDVxotusH7s1oDp/3LOvjix0dejR1i5bptvhp4jKTNhkDYBbvljWyDGIBuw35sSAyP4xAXOGumS2shIkaSY9KI6SoR8Z1f8/hlEIA8W+lRmRjv23bDu+mYJC//Bbe2UZdIbgbDKt5mv7xiYFfZBFJA0rCnvWMIIdI38Tu/sDZM1TwZyqqYu9CDDkGqxjaOgnHx3GTdCYXfr6IV8IRwG1rahz5CjPLz7nC3dwDnxnYAMDqQ5N2k6kzrxEyin1uF1qfpgXfHlOq7TTpL5nofkv/qx5fPWHLnQGARMUQiMPSWLSGFUxTcwDeKweMf2ZwzbFLIoh+ZySKaCv49vZOgsWvU8yHlvqmcyFxL5rTBa57PpVYwSxNInEFrRbPe6YQb+MFiyk06OQF9i6ZN/H4LTkd81ZFId+hUWUKWSwXP2SVb4lYIxZO62JGro5wIJ/9w67f6gXjPJzQM/cnnLdQDvEy0GEt/aDI22D8fR4ne1Rp0GpPss
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1076003)(6512007)(6506007)(26005)(8676002)(6486002)(478600001)(86362001)(2906002)(8936002)(82960400001)(33656002)(4326008)(6862004)(5660300002)(41300700001)(66556008)(316002)(66946007)(6636002)(66476007)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SVljJWSN2kSYb0+PScqB4VthL4ED4SQjlBklKUnMf0xkrTG7eDg94QzInpsR?=
 =?us-ascii?Q?nZLmYEJMeRC2eCqJv+3+sUZ5mNA4rCUnDr1TCn+Ryf04z4nZJBu15kQnZhKp?=
 =?us-ascii?Q?+4c8c3XT8GeqckxzehxGZrExPtTsrKn44ZAW4Qk2XubBAikXuaF/F99ajp/h?=
 =?us-ascii?Q?PnKS5bBIIr3hdOcbVnG0aH7MVHGwwD7wEEsyjKW6ibGUCvx4u67MBdA1TzP0?=
 =?us-ascii?Q?DPZbP03L0S/euDzamfFcXI3jlGloAnEcxrmbkY+e817+M18P8blNW8rBDojZ?=
 =?us-ascii?Q?3Y3xgBc5o+pg3OOxGIMlvM08YWe4F143osRLsC60vVmj8vmQrPKkGfxepi25?=
 =?us-ascii?Q?wMTuFbPLuDRV+juYHPS4YsVO5xuoEARoZ244IcxUMa5N8mNhuDlhYR4yO+5P?=
 =?us-ascii?Q?ubIOAx8F9txKUNL03K9WNeHj8DbmOcENIy1F8CzEp6SV18ObZbv9vm34nN+Z?=
 =?us-ascii?Q?lOh6l9skDkccm8DW3cxk0JqvEX+wfvoajtlOlTeZLdwSRtyFmfUQXfcCLdFW?=
 =?us-ascii?Q?UeBuzeTWqRUbijuTUdMrRyv+jPO5CdbT7cXvgEycRIZMzo1hOEeVRTAaddQC?=
 =?us-ascii?Q?RhllpTP5ZQWdGZgFu3qFKsxMWDBviuOZEnVCkvtvaZdEa2RB6zlpVpxw8u1u?=
 =?us-ascii?Q?IB/mHrb8U0INBucvAdYy2ai2PgCEvcmeQhZKAOkyvh9zdVlHUSplL0tU+kPL?=
 =?us-ascii?Q?DdbfcULV3/3ZSGjbD0t1M547pw9lQ9UlMqUgn0X/uGQn1ruI0xDMUkEUbP3q?=
 =?us-ascii?Q?7NCaAIWiZyJ+nl5Gp/S8U9gpcW3UKy3CyNt1LzfWcMdnoPyd0yAhYHs4VUfk?=
 =?us-ascii?Q?K7u4shXdSlc5xolFXWhd4kDy99nQzLE4JrpXEAK5XoncmP5ZX84LnCyx0FZX?=
 =?us-ascii?Q?lSxmgQqYUWRUGkDxTqjwRLtx9FI7OQ2mf2/+onnmVVJJyr9nS+zt8E2DD+z7?=
 =?us-ascii?Q?43j04iriqBJVQhPPmmuLPKfjWuXo7Fbq2V+SBnr2c+2yCR1XkMsAAQrenp1C?=
 =?us-ascii?Q?WOI2xTMICcx1TMIb6LkX0bD2s5AlkNNonoD7sKpf+18eAtkuiAB9xWprOlmg?=
 =?us-ascii?Q?5UiLJZlCgm5WfmuXPxhP5GxaYFdmBpmTMdrVb1N7Ea+YHJWFrlaa7qXp3taL?=
 =?us-ascii?Q?+DdMlJZ1gU+o1xOLq4hTbdHiQ1mZrD+PQ+4Ol10Gl+mkhUjONJdt9aQWfOxC?=
 =?us-ascii?Q?JMvFUZlt0SslEoUKih03SfGPPGhmpUUnIobxX8TDuS4JCou213XTkF3EaVtd?=
 =?us-ascii?Q?+ADAQVlTorZvR3dqNXkY04qiI7XZvzzPNbgljh6plWdLVq7R9l3V/BKK+rW2?=
 =?us-ascii?Q?kL74ENP+umttWRzx1u+HIEw1luxD0K8MsS9Odc9T/h+x7m4AxJp5u48TMv56?=
 =?us-ascii?Q?/GWLfonBLxTuEFRS47mYJ60jrSc+4+kLkZfIUSW4jc+qJRo9XQ7O6F1BJSuz?=
 =?us-ascii?Q?coWZDetA06tGxXZBAaTF6mJ/AA9T3nIbPFDDACdES50MPGs6ftQTE5IzoT7X?=
 =?us-ascii?Q?FdbpRowovsZW+DP8+BptApUDCyC+R0HeSwPcqUkAUl4F5L/4eoFvXpI0SVXW?=
 =?us-ascii?Q?JVTkvZyMmuhKXx4Ukewua4roO0xfX3U+iCRoQsUJNYfIXP7ixWiaO16OJaW/?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8f777a-cc54-4c59-c0e7-08dbeb928ab4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 19:38:02.9373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/utNvqabGiZYSOMAE95nlGIfStdnOmDAYRq4+AWB0l1MxmGzYPGe8ixAtLwlrhWyUr5JXscSGGeYlTMvObowFR8T1wcD9ttqgd/xjw62QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add device flag to indicate
 SR-IOV support
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

On Wed, Nov 15, 2023 at 08:38:02AM +0100, Michal Wajdeczko wrote:
> The Single Root I/O Virtualization (SR-IOV) extension to
> the PCI Express (PCIe) specification suite is supported
> starting from 12th generation of Intel Graphics processors.
> 
> Add a device flag that we will use to enable SR-IOV specific
> code paths and to indicate our readiness to support SR-IOV.
> 
> We will enable this flag for the specific platforms once all
> required changes and additions will be ready and merged.
> 
> Bspec: 52391
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.h       | 5 +++++
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 3 ++-
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index c4232de40ae0..54694f98c91a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -158,6 +158,11 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
>  	return xe->info.has_flat_ccs;
>  }
>  
> +static inline bool xe_device_has_sriov(struct xe_device *xe)
> +{
> +	return xe->info.has_sriov;
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index be11cadccbd4..f2ba4f746fa2 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -253,6 +253,8 @@ struct xe_device {
>  		u8 has_llc:1;
>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>  		u8 has_range_tlb_invalidation:1;
> +		/** @has_sriov: Supports SR-IOV */
> +		u8 has_sriov:1;
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
>  		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 682ba188e456..c1c8048bbc0f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -60,6 +60,7 @@ struct xe_device_desc {
>  	u8 has_heci_gscfi:1;
>  
>  	u8 has_llc:1;
> +	u8 has_sriov:1;
>  	u8 bypass_mtcfg:1;
>  	u8 supports_mmio_ext:1;
>  };
> @@ -532,7 +533,6 @@ static void handle_gmdid(struct xe_device *xe,
>  	}
>  }
>  
> -
>  static int xe_info_init(struct xe_device *xe,
>  			const struct xe_device_desc *desc,
>  			const struct xe_subplatform_desc *subplatform_desc)
> @@ -578,6 +578,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.graphics_name = graphics_desc->name;
>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>  	xe->info.has_llc = desc->has_llc;
> +	xe->info.has_sriov = desc->has_sriov;
>  	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
