Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958B5C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DAE10EAB4;
	Fri, 15 Dec 2023 22:40:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A9710EAB4
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702680041; x=1734216041;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iN9dmiv+Zhx57Dw2UWNdDMwihrFyielA1kk3E5P0NQo=;
 b=YH5PHmV/JuqolVZG2E4SdBrtEWKquf4NdpJXjMe8QijWfGIUDCbnWUvV
 kSNlaykyR65be4Vru5l+Yuyx9EVFfPco2YqVYP49FRLbXBbVxEuLyXHjR
 kdKjYzsaNoICsWo/Ul1vKRGFhaqTmddMAbUhl7sytx4gTC7EkbiD2YNEb
 bL0fbeRpa5Z2wNhdGhX4A21zX381vLtC/rbFkBKHNiKGzkzebR5hnbItC
 +jmLLuNy8dHnVDAHQZqLp6j+qJBZ+389C1ub+rhhmvtqaIApx7XCVQ/dF
 uDsmRk1LrPzfDnl9MrQtr1GmjF1WyIA2qnkjtO+QPdBFIfvEo/8IP6zcT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="16892403"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="16892403"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="768145332"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="768145332"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:40:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:40:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:40:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:40:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:40:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWiW0cmKc7WwHHVZ7WlbvN88EaqsKW1yrBH1qYg+pW48GqUTXv6Qr29mtZgQ0alTQ7j7Ryo5eAEx64JVnh7LRVeBHwPapy1MWn5TaZECK8Jz0LcqIDv8Ilu6keNFgt7EUo74yZYPFtnUg3MIFKz4sCttjiM6t1mdfbX7r6hnvH/hPYMYaCtJNjbLG/XQ2RtmZeGiC/W9q//YTvmfyJMz3mfwUPcoyRbBubGs0ZgE9e/aipRBDItSP/o9w9RAGST10GVsDDCYUrs0S+1La3W8IX4IMqK08QskcqonYVTgu3ZNuERyqJzVEQpVTNlQq3E0yuDNaijFkaoXPWdNeR8Fpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9Oas808NPiE6PA2VA/m2k6nTiyX7fGGrkn5GehzyjA=;
 b=ZxdjOOcLEJJ9FpfAa81drKSY0IIk51IFB0pqcudamUQZLqfgC3B48mjEGcQ8/0Jggrppb9nLNuliijVlHXleb0uQeN76I+NZtsVeHCXstDWs0IG6mshiBRYUynAr7pCEG0HNFz4UNtssO9tZociAP1VnYFRZ3MYsVWSoTs3MRBw4qp66VdNxw/mgnVP7yKsXlxsrdnjrc5lUBHDVMgHPZhufpQ+zYMuF39vhqgd2a9ve0FUfkcO0FhFRZibIQS63Ss+9cipkpnbPYgzvuA1yKwr5xCw/GSJc6mXphYAsySFTXv8Gfiq21KWb18sAnJmQvOKnc0k6WJlU46oTuQJ4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 22:40:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 22:40:37 +0000
Date: Fri, 15 Dec 2023 14:40:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 10/10] drm/xe/vf: Add VF specific interrupt handler
Message-ID: <20231215224035.GB1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
 <20231214185955.1791-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231214185955.1791-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: b1476e1d-8373-41b7-89cd-08dbfdbedbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AWqfWd1BPYQ4NPeFhhkCviQ/fPsbbN2qML9WCULkiNsuDpSGTjSEcqGdIOwMJwL2IRD650Mv+TVYPVgnPYXkBS42l8WBwPYjKRUmji9lNmgQDjoYk9aC7lIGfTGbDBe+JbN/qt/ynmYW3fiv/+gYatBLm97BXuv/e1lo9gOvJyVQqx3FADlfJcm3o+5UGO5AkGLxZtqt1q6rO2wQpcArhtw8zJSo45sL8wANKoGYhHYVseGcownYBvmOBZ0hINFoCKhXbt0gbJvjh+YWG79LKEYPizhQSzsgmRFCc7b0XlX2+ADHg3W2llJ615GKGnhlLydpM/V/4Rmwx0KtJkR9DNg7iqcTkP/9erimoIK/kATXNgYaGzfk76G1+iljV3Mwq6IRQvzsUwzD9SEEIY6Jl0pXelV094qF4TY7JmR/mkfsMSVmbFpW+XI326AS0sKRzaU6R76lbCKGAiVWFp70mVUt35F2xkU5mYDt413THm/ixmvXGXPFM0F0kVJjfOLNERyQT57sX9/J/Mz8z7FuSFVu4ZJ/ASZHyNxpmL31nf2QO/ORaYXjdkzCcOMf52QW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(26005)(1076003)(6512007)(316002)(83380400001)(5660300002)(4326008)(478600001)(8676002)(2906002)(41300700001)(6862004)(6506007)(8936002)(6486002)(6636002)(66556008)(66946007)(66476007)(33656002)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sv2NB6omsUY8eTGkhc3XV24B0PSlaDsPfJsn3wiWa2+Et/bw9T5FLbE9Bx2B?=
 =?us-ascii?Q?yyWzgOSHM7tcRdorp4Ge3PKda0q/9Bqa7EbT1DNtIIxpWYAAV0W3WW4La34T?=
 =?us-ascii?Q?WjOQ++nwqVpVZflJH5UoSlQazhwRc3HsSrxnJYJL85bxKwWKn7lxbo2zADT8?=
 =?us-ascii?Q?zVNwfo3iunpL6nakLoA1/yeIwwa1NJ7RGAtuQG70GfnjtKOPdeZ1pZxOB5cj?=
 =?us-ascii?Q?ngV/AnrtMfNwhrb0ijJSamjkpVKUGVw74ehgeNVS4NGb5PWHZdYzMSswqPfK?=
 =?us-ascii?Q?SYxUMLfAA/SGeFrLlPdKc7KaFhWtVeCmR5WpAqLQrLt7IsxG2BHz6JSKVECY?=
 =?us-ascii?Q?GNl8H6z0zW5/B4yySv2fUq62yDLVncMYkn3PK+SLXP4a89mprmP3KbNvmTf7?=
 =?us-ascii?Q?pYZJ26pT5uR28rgfxU5V3Ez+7N3hPEsMh+RyhJzov5BXY9Od/2HMiToyfRDP?=
 =?us-ascii?Q?wgfsIuuC/2LGx6ntJhUuxl2gc/BwqVBB7WbHgyiOoKC8CTS3n4aLFrEXqBr4?=
 =?us-ascii?Q?wTsanXoftSLWRwnihVxpu6SCLX7YDQ1lZ8tRlu8OnpFk0OLoNm+wG+3coYjH?=
 =?us-ascii?Q?tFaoy67rHSTg4Gnyb90U5L9fZAPm5x+zAeYnxJ5b2l9Z3vLz8UFeB2WP7ObP?=
 =?us-ascii?Q?0VMM66JmfPDGhk/OADtM/DIx13tYiSXeVaMsA2l9I7tBWLsdshKjwM6U/p8r?=
 =?us-ascii?Q?PbYrggcmBfyLaPOFPL15ZKLZ1EXzawKcnenIdccVvE0TscJHcSktWgf3zk9c?=
 =?us-ascii?Q?1Sp41NbmsQBJyUlWZ9TH1sYe0YcKeZmIDkte9Ubpvqey4FLPFyYJIrXWRvCf?=
 =?us-ascii?Q?vHw/GKK29TOpuLqPn4fghBf+z7a5td+6qX8PleHHKQAYsohILYRxiUYYKKJ+?=
 =?us-ascii?Q?nZAQIhHn+vzQRM1L44lhjLgZXcRT8wjXX00Moqx9GC71cdcRZKLGayDkra+i?=
 =?us-ascii?Q?1UbS6yZlX+9HHSPhwHmXkFm2gT9/qq7JjUC6DATwL0OejIIfsIYvFyzGKd10?=
 =?us-ascii?Q?E83Psu1B/DoRu6WiCqUkDMxy1sEX5iH54j4EyVhqJvqb9/zScTV3mU9Eh6bS?=
 =?us-ascii?Q?IUGAFG5zvddOfkRPZLWrXxLU+qOtZpj/LrBzp9lV1bzNmxJeIcJP2j4zVdiw?=
 =?us-ascii?Q?P3y8uqvPey9mD3IlW/PLrORi6oqWvDo/8LeIBmdyBWh7BrPaHZrrvsksJ1H2?=
 =?us-ascii?Q?ZfvRQHbVLUUKel6/J9X/Z06upAf+kaAKOO4x2/qcgPnschGCPCnaHgasx7bT?=
 =?us-ascii?Q?nIb7rK7Dk0Ra61tMJlEaXJwuLiXq2YT7pIb/eKNlTu73nTpSx/j+yuZZyoYK?=
 =?us-ascii?Q?sNBCqtbBg03qE/hTle/EORpOGCdzuxiCVDpGjq5JZXyn5eAw1J/ZRJJ3Jn9q?=
 =?us-ascii?Q?DoRDUh1I2jf5gCj2swdWanmR94jwPoOVftnTfR6b70kkxL6AFVxEFxNbNWTJ?=
 =?us-ascii?Q?D7wQ4BtMoQs8BYD9GVLdpfcbXtaeL2eRs9LLoYyel+GREtOnn8xeXIRIswG3?=
 =?us-ascii?Q?PElbvfdYlpyMZPP4cJnyXz9M6+SUoigCaQQ1KahGeUTMZLd2d4hOQuqKf4DC?=
 =?us-ascii?Q?nNidyj6zwSzh7/aCBKGB5tuDUCjid2s8hmRb7weyAYokErB5oeKPdd9Yojd9?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1476e1d-8373-41b7-89cd-08dbfdbedbbb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:40:37.6265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEN4GQdTKSfcUnkvxf1UAOqLsJ+viGoTLjuhwczffOjHePG5veAuW8uCZXq6wGLpxDrNymuo/irkwrz+6H+cJxLwTPnmNKUIAc6orqyTiv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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

On Thu, Dec 14, 2023 at 07:59:55PM +0100, Michal Wajdeczko wrote:
> There are small differences in handling of the register based
> interrupts on the VF driver as some registers are not accessible
> to the VF driver. Additionally VFs must support Memory Based
> Interrupts. Add VF specific interrupt handler for this.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 71 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index d1f5ba4bb745..907c8ff0fa21 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -17,7 +17,9 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
> +#include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  
>  /*
>   * Interrupt registers for a unit are always consecutive and ordered
> @@ -498,6 +500,9 @@ static void xelp_irq_reset(struct xe_tile *tile)
>  
>  	gt_irq_reset(tile);
>  
> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
> +		return;
> +
>  	mask_and_disable(tile, PCU_IRQ_OFFSET);
>  }
>  
> @@ -508,6 +513,9 @@ static void dg1_irq_reset(struct xe_tile *tile)
>  
>  	gt_irq_reset(tile);
>  
> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
> +		return;
> +
>  	mask_and_disable(tile, PCU_IRQ_OFFSET);
>  }
>  
> @@ -518,11 +526,34 @@ static void dg1_irq_reset_mstr(struct xe_tile *tile)
>  	xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>  }
>  
> +static void vf_irq_reset(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	if (GRAPHICS_VERx100(xe) < 1210)
> +		xelp_intr_disable(xe);
> +	else
> +		xe_assert(xe, xe_device_has_memirq(xe));
> +
> +	for_each_tile(tile, xe, id) {
> +		if (xe_device_has_memirq(xe))
> +			xe_memirq_reset(&tile->sriov.vf.memirq);
> +		else
> +			gt_irq_reset(tile);
> +	}
> +}
> +
>  static void xe_irq_reset(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
>  	u8 id;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return vf_irq_reset(xe);
> +
>  	for_each_tile(tile, xe, id) {
>  		if (GRAPHICS_VERx100(xe) >= 1210)
>  			dg1_irq_reset(tile);
> @@ -545,8 +576,26 @@ static void xe_irq_reset(struct xe_device *xe)
>  	}
>  }
>  
> +static void vf_irq_postinstall(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	for_each_tile(tile, xe, id)
> +		if (xe_device_has_memirq(xe))
> +			xe_memirq_postinstall(&tile->sriov.vf.memirq);
> +
> +	if (GRAPHICS_VERx100(xe) < 1210)
> +		xelp_intr_enable(xe, true);
> +	else
> +		xe_assert(xe, xe_device_has_memirq(xe));
> +}
> +
>  static void xe_irq_postinstall(struct xe_device *xe)
>  {
> +	if (IS_SRIOV_VF(xe))
> +		return vf_irq_postinstall(xe);
> +
>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>  
>  	/*
> @@ -563,8 +612,30 @@ static void xe_irq_postinstall(struct xe_device *xe)
>  		xelp_intr_enable(xe, true);
>  }
>  
> +static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	spin_lock(&xe->irq.lock);
> +	if (!xe->irq.enabled) {
> +		spin_unlock(&xe->irq.lock);
> +		return IRQ_NONE;
> +	}
> +	spin_unlock(&xe->irq.lock);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_memirq_handler(&tile->sriov.vf.memirq);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irq_handler_t xe_irq_handler(struct xe_device *xe)
>  {
> +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
> +		return vf_mem_irq_handler;
> +
>  	if (GRAPHICS_VERx100(xe) >= 1210)
>  		return dg1_irq_handler;
>  	else
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
