Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172A3C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 00:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E070B10E14B;
	Wed, 13 Dec 2023 00:51:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357310E14B
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 00:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702428710; x=1733964710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=93TU+e5VmC2q69Ko7k2SuGZsVAQkAg7gGyNowsT6/9M=;
 b=JGnKA5luUOw1c3fjv2w+a1K2X6+bsIxeBtZ18+B6V0JfQ3/NfzPlId0r
 wqm2KQ7eHToakI0RgBTOSqwWioj+ElQQottuMwgsBRpZ6PMqPpZOBWzex
 dVdgtuazUEvI3lxtpJW50aHBZ8mAq9wr2DvxeyA7kOU35zCe10uKQUiih
 TKaUE60DNH3ol6x4/bNVzMa3efGGebIApl0yfbnUM7+TIBkjLbL/sLKRF
 sn/3jrQx86p80RZrPtNGaAyHsYhJQgQxFBGLcR5sHI+3EuOrHFAKO1vpc
 EAJszTrLzE8CyKbLyW7f30OdF7D5U6R87Qz8QGkyEb3OBbM0l0oR4uI3b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="392070803"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="392070803"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 16:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749904077"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749904077"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 16:51:49 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 16:51:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 16:51:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 16:51:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 16:51:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTGP49Z4aAqyBFdHJKN6rubujlisXRncRIvm+ZBT2v0Y4LRRdIW1k+8h9S9tRbsG8qiOtHXSrSH/O1HTdklQgTLaZX0WSPoQA/mOXulheRv2vNLJg/Osnw2/+Uab0GFNYR4XoqnXDzAvBc63uqNsz8HgtyrEXBFe4LPRozM3gdbHZRPwc1utiKjr1cjKuwdxvdoMT9JHn/s+ArR/82xxvsOk1NBBzY1PP9+cBnSGHOAGy/HCQJmDyFWKJFhwaNAU+VSKcoE71VxWuq6S7Pao7FIazMywcz382ZY3A0fbjXNsCLfUDWse4CtaEH9EkLFgOYspqrX6DkyxqhXLNf3nBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkBlKd+SfgkNlcgx93ef1xLD+isFf6Mqea8PTOAS4yU=;
 b=Ay94Q5gd7Ft/cQ/CARpseWtBuybcF3oMMTK1Uyn4/F0BQEnMdIDJqqXSxCvi7AFDGhKbJMdtYJQsB54kRnwnF18Iik8+Sd6dqE0fEpDfyUkemgnaT6uz/Dor6t9g4z5QCUWGYN69Y/6ebqA0MNWs5Kewx0F0LEA2Jf4x390y53pDqJvjWFZm6AEYOWZpq6tvZ8WPx/QXrz6DM8gGbePsk/Cv6t5fzlOsLx/aGmbQk/rOUngJIb1u5OHfiancoNta5Hk1N91lYGfciDFebBP3JYDR/hE0IgI0TwC1OdwOpQ6JZWtLlO/H0vDBh5XwnHcXaU6TagNVMc0SvjnMxJGdSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 00:51:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 00:51:45 +0000
Date: Tue, 12 Dec 2023 16:51:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 08/10] drm/xe/vf: Update LRC with memory based interrupts
 data
Message-ID: <20231213005142.GO1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 00613e2e-db5b-476b-e7d1-08dbfb75adff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0h+VreqLfSyWN6isECWL8tYlMRhY7yztp5IgiV6tCo8Rm/IGYFPyLHVXpzcKKgDAcwNSxBebG2NLT9iWwKngS20MsP9hFZVpgYJt4xjngCyDt/xNW7slDfzzfXJCvhZFFvUqoprjclaOndBemeM/7b8Bl30/QTBy6KbCP6XBOD7sXepPAofpwdUIITDXHSx7Y5wfmCf2mWnhTmjN8Kw4pK8Ln0uwMgIbqjVvDhqQ/H6GemFi7F+ji11szT9pYP7f4L3Js1KvMq+ueCaSSBxdLidEtcSEKjPMFXnhJyIVLYgIp7Ls3+irfNDzt70v1+0wfoV43Ti1xtscMKU1kchht7lryhZDin5DzhNpWIehdkGLN1Tmcfvzh6j0+TQBU6H0VsXfGDzqPMpBynntToL+Mswgd3F3VP8JfPnYknuox6uodljeuieHdNCSy5Olll7Q+DpwY3YGQrh7Bn7ikmkqQdJtDavDcMq97tYCyF3Kec4NQtoVc5nfPTyqUCVsWjlSWz6Wq8biRlDcISQVHrzfzmai0gU5PQvHqPAsh2TN1tX0iMc/6wigmHoexaIsKkn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66946007)(6636002)(66556008)(66476007)(82960400001)(86362001)(33656002)(83380400001)(478600001)(26005)(6512007)(6506007)(1076003)(6486002)(316002)(15650500001)(2906002)(38100700002)(6666004)(5660300002)(4326008)(8936002)(6862004)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7vQ2p3XKb/IPMBMOJaHUSsScViGmnf2rIxRnU9Bd+0ZmHZkMSG3lVjknmkj6?=
 =?us-ascii?Q?M6LFcP5nG4Y0n/lN5b/l6783KNkKIFbLuNn05+AIPrkDUquXJqlHwg4OpxLz?=
 =?us-ascii?Q?A3MKwfuiJ5A3+wyoaW5JCD3aRx9mQK5VL384S4Ppumy152xqs5wqfYguBfeP?=
 =?us-ascii?Q?hiJn8/SjurCbJjxDLSLcp1OjUtumCys4yTM8Csq106YzBmnIdray67QpNVPr?=
 =?us-ascii?Q?UGmOHZf8ANJayFsFZzoW4VWJ9ZnEJphiWdWSvQdUBVAF8s0/LzuFET7PbG82?=
 =?us-ascii?Q?8OqgOdEjUkFlLlnTsahcjcJQ1vtUgZIjxtbgJC1XEBsgdAH7ajLxL8GfKS2m?=
 =?us-ascii?Q?6hrdlMQ7Y4DeQmf0n2eo0fnDUvXtOeb+WbCTL4udmPsxAbMRPp4QGJJeipxN?=
 =?us-ascii?Q?EPeQOmsq7ocZr8XZc4/SWOglxuPBuQd/ND3B4NZ+/2BQZkC070jUAzfNCVC5?=
 =?us-ascii?Q?WRa29WVPmfC6vNNG8BNoWCv6j8NWyfzvBZ87YQELV8HiyJBo1ONhx8RYeNDJ?=
 =?us-ascii?Q?r+jjj/JHf/748kAb8sfwWu9MguBXLHExY1kAAF07IXnEoQ7/Y3y4kdEXDzVM?=
 =?us-ascii?Q?w4rrRxtv4H82br2F2BX/5MRvzgGcVDRemDRMD/ryQ4eNhV3sVXZVTkyoSf7h?=
 =?us-ascii?Q?1yPlJTynE8I+KCwXGgs26RKLeTWEH0DS0Ozy3D4Fb7pfmMOz+sacG1aKxDF6?=
 =?us-ascii?Q?hAtuVS7Jhi3bqLAivMC7x1/ri4upKYMp/jy52v9Bf9ocWqgUpsa7+idyRvIN?=
 =?us-ascii?Q?1mc4m5ir+58xu1riMz0bymA3AO8mrndZKZLpoRQmQujQTdoSgWLgCt1MH+4v?=
 =?us-ascii?Q?J4WXiOeWoBkJYOAFqbNGtDinek1Wn2krpchRDzVbL8TIixhtwoOTgGDCl76k?=
 =?us-ascii?Q?4YmxuvaJ6Dqmg0WTxql5H/wdjyf5X4KDZi8oB+g/zTorThSlm/AXXAMWUCR5?=
 =?us-ascii?Q?5sbF8roOAwRK+GfCpTf4clKbaFoL103g8NPGGmcIwpnoSJ+Mp2p1T2lHOxHz?=
 =?us-ascii?Q?Vam1t4j98EQHtu2JxPFTgkWAC4Gflk0a154+WQybeRXhWUKBgO3w51JLCcr1?=
 =?us-ascii?Q?LO33/f8fIJ+nwYbNrYqARPEETQw6rVB1xtEeaMl3k9dzAXQl51E64orAkeV5?=
 =?us-ascii?Q?jPmXsqwsr1KAFRo36a7cDP48qJcrGhKKlazDl2dTW8B+LorTz5qeGZsuWZwj?=
 =?us-ascii?Q?OUyxOEXum5RZQ+DgmCGTG5ryrQ5fmyYRBnC3eP9vc2c00z/lu8s++BV+kZdW?=
 =?us-ascii?Q?YifouL418hEODNCflV9V4DeuAcN3itauRM0mtCW2hG1mS78RDVofDSBYRBKo?=
 =?us-ascii?Q?D+ciqTHujvcc7cdBsOU5KcfEHFV7XbasWe9Z0b4Vr8anODvAo8L8UbJMM9EO?=
 =?us-ascii?Q?kK1AQR3WxfOfxalVLo/vonwKNx21QKRCua30rCg5sxygOffLBJ63B/r9o3Q2?=
 =?us-ascii?Q?/P7chV8wNulTQApWEKBBR0h/NFuHKFS1sVMEqmt/HcTlAdRjbieFKwcDOmoM?=
 =?us-ascii?Q?dlcNHSigxP+N2bDPX5PL3Ms2NwRcVb0/Veuw7IzBwJmTvvmMHcj0DF2FXc81?=
 =?us-ascii?Q?IAh84fJontkjLAKOKye2rzovHCTXJG4695s0R+tmHjBkJe7T3uYlYhGFgCP0?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00613e2e-db5b-476b-e7d1-08dbfb75adff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 00:51:45.3255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0N0IzPF3qFQBbsE68zs6ujQ3ynvKxJVO9KS8Ic60sYTr/Vw0Bm6jmkuhCKT1TOH7+Qv3ZIgYlnckDb/TGhSW+c6kJV5dsR42gw0KJzg4mGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 10:00:52PM +0100, Michal Wajdeczko wrote:
> When Memory Based Interrupts are used, the VF driver must provide
> in the LRC the references to the Source and Status Report Pages.
> 
> Update the LRC according to the requirements.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index d6dfbd0bdc70..4101558f01ce 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -21,6 +21,8 @@
>  #include "xe_gt_printk.h"
>  #include "xe_hw_fence.h"
>  #include "xe_map.h"
> +#include "xe_memirq.h"
> +#include "xe_sriov.h"
>  #include "xe_vm.h"
>  
>  #define CTX_VALID				(1 << 0)
> @@ -534,6 +536,27 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
>  	/* TODO: Timestamp */
>  }
>  
> +static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->sriov.vf.memirq;
> +	struct xe_device *xe = gt_to_xe(hwe->gt);
> +
> +	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
> +		return;
> +
> +	regs[CTX_LRM_INT_MASK_ENABLE] = MI_LOAD_REGISTER_MEM |
> +					MI_LRI_LRM_CS_MMIO | MI_LRM_USE_GGTT;
> +	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
> +	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
> +
> +	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
> +				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
> +	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
> +	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq);
> +	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
> +	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq);
> +}
> +
>  static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
>  {
>  	struct xe_device *xe = gt_to_xe(hwe->gt);
> @@ -669,6 +692,7 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
>  	regs = data + LRC_PPHWSP_SIZE;
>  	set_offsets(regs, reg_offsets(xe, hwe->class), hwe);
>  	set_context_control(regs, hwe);
> +	set_memory_based_intr(regs, hwe);
>  	reset_stop_ring(regs, hwe);
>  
>  	return data;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
