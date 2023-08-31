Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF2BC83F37
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 19:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB6110E6D9;
	Thu, 31 Aug 2023 19:52:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF8E10E6D9
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 19:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693511564; x=1725047564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U89SokjHGom6yrcb6u/RVYlp+a1Yjri7wf0AkzUvebE=;
 b=Vpy9CTczsmL8XwEloa+VvJWK8PygG61LHS/t1fXI2V/VJeJvGXbIgk47
 7dlsxzvkmDBgY5oWsxv7CaPxaz/A3wuJF1FU/oAGmAFXlWaTbyNEzqqAr
 sqYrGPX7QNS5uBt48s9eTjBdPp9pvPK+F9eTTAGF0/gzMnwVTSZaKAO2y
 cNWAPIlcbHdwkwIrbQah8hioTVLRXygrye2kVuhso2dA4op4B1R/1qQpJ
 8JPJ+473LyfIAw42X7y71l7FOf5CZood3wIWNCAW57bZtbj3yDTjAMchb
 1zZ23XRQTWn1F7za7tAltWpK10HQTaFkS8AiCLMuDjaqbr7FvUSuQfIQ9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379836971"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="379836971"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805144571"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="805144571"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:52:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:52:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:52:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:52:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmM+fJIrGOR1JtiE8Pj5RG6CujmIFXL+cAGaxZb3UFz0OaSz+hhMN5/RuB/kK2MGZrmL+C0pdTJvjo2K8kt9vWjMhAljW2CUhxk9cEIJraPt7Zpoe9Ja2dHfmpexa1DveSb9oXGviKKX3BVke75061CXrTtaUpZaZP4Vq3ohpOUnHnZ8km8RtaDBYUnFr+2PyqTpvqQXBhCm1nQrj5ycXkaWlKsIVGaFXfaGiDqMSQVoVJx5q9t8rjB9vBUWBmhZ0kDS9vm6yUWUmAvP4pvitg4FrNManzMTKQ5IKmJyTMxUKI9d/+OXlqjjL995Op/CSfEydhcBCBU6S4ZI0W5Rgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2icNBrOSTe5Em1v/7OKKlTJ1skUC/s+mGRICif683M=;
 b=HlLoxZ/oDgnLk/I6h5IQD7hLmNW/POfPr3DnG9cpG4XgZ1QssFkvrmvTV4E/qhhYR0aOCC0iSTpK2udR4qS9QQgiMWTb1NjbqGagVUPba0lbNZZmk40PGmpfizZFSfFnIQaiCsaI7H8Bb/aLC5xjrjYGsmVHlrL1c9WVHg/rKepwAHBT/Sj6qP/O7gjWv6OFPxo1RwvMKUsYrzPWbGtQfMkz4eqR132NPQKF2qCDoeAZXRwrF91PnlvE2TQDjtOxpfin4h/bEBo49G24xvg/pSn3/krG5sAMYTmOiXBd9cABYBJmH6hRfjpil1HMfjLC8XQd7H6yKASN1YI91HpuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5509.namprd11.prod.outlook.com (2603:10b6:208:31f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 19:52:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 19:52:25 +0000
Date: Thu, 31 Aug 2023 15:52:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZPDvcy6oHm+WDtwl@intel.com>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
 <20230821120728.3871527-3-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230821120728.3871527-3-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5509:EE_
X-MS-Office365-Filtering-Correlation-Id: 1660aa5d-b23b-498c-3c3c-08dbaa5bcc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q/CF+633yA74X/Dho/EQY5ZKEyNxk6p1e4LwEMp6yYlgMis2AICnq63eRnJUxho4eyIW4CLtbIyLgWVuoytZZf8hqPCgyBBNchBS9IZorsL7OLFvPdJUKfAFTNxCUSB+RRc3395duCzdQFMjfanz0uemMRu5v96bdOS8umbj+lfBh3o6kPhp7GfPW7pWtrHrYFIuI2pqmzyP7FlJuFHxGAR++GlZZIuzk2dncY0yITtg3E70+7tTLWXbX4goizP7YMaRT0psPyhRQkqox02YpdzpJXdqCR8T5pdIceShvy0BD9mLYHSdKochujRE5PJ57elF77V9LthB/SV90igqOY1sokupStvKArKD1oBhQF1Jvqfb4l6dLsSOGkPtlF5cMlv3XFzppw+A4Lct3qJ26p9ZJSA6TAYBzP85wu8Lk42fRJO7rtDSpQrYSY8EHXqaw3bZ2R4mgCPseSahAcsImq3TdeZeMxbKx7insXUqfAu0zfDC8+qYkgvZPrNo02RVrsjZkPlT4PhmKn7H8uaFrCPcll5dHUZh7M8GmZ5VBrpWCw4gOSu4IwUnNKnnnCy3keQOU1omknyLENZVRItlwLVv2m0P1umffsiGhWg0V7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199024)(186009)(1800799009)(6512007)(6506007)(6486002)(6666004)(478600001)(83380400001)(2616005)(2906002)(107886003)(26005)(66476007)(6636002)(316002)(41300700001)(66556008)(8936002)(44832011)(5660300002)(37006003)(4326008)(6862004)(8676002)(66946007)(36756003)(82960400001)(86362001)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iehGw5RqZp622AfTOWfdhAWspv2ISXMq9QwHzH098PVbz3OmZya55g1+g2IJ?=
 =?us-ascii?Q?DGDrghDXnGXtzgolxUcLv2c73LzmmDt7pqAaLiQ42+FwEgqUFKmVFjSmeYQk?=
 =?us-ascii?Q?FIYJkNk9cAMe6tybIm3+U0mGyNS0C7GFCX4odKUt2dwLKRAUpQpcNdj15dML?=
 =?us-ascii?Q?ZyuryLpCJtsFQoiZKecl2H940NEeEVitU8f7i+XLkXrTXpzY8iHd9bVYQckS?=
 =?us-ascii?Q?W8I47tCZZApn+Y+uHfZJaqfBPEGqt9aEDt9t84coK+cLILTQYmmiVgGn5C66?=
 =?us-ascii?Q?awB/hsqti2LRhFYbv5HN5HcT+s/cORwN2PhNzkxv62bLUnbr2hjRORtc5h85?=
 =?us-ascii?Q?2lDqO/zY/ZNl2g/vl9wLTNe6nEfb56vokPKwA67LA6AmtylBkOCHWlgVGRDi?=
 =?us-ascii?Q?cSXTwWjPeJb8L+JY08ouTwFMGtK6WXdnlastuBylQc0WwV/Snwix/j0L63Iu?=
 =?us-ascii?Q?tu8rii1QS5A+cwlhg35dod+krAaj/ubou56Lq93/Mm7KQ7ZemdVpPU7CIs8x?=
 =?us-ascii?Q?ossKHugETPzCYMiG0T7tfsO6PVBctk2NTxYRVmu5/z6XCOH7tR281Ciskypj?=
 =?us-ascii?Q?x/u9yYhVRw7zeFpqwdOQfbIVHJQblm4V2fSBYlc5SfpmnhNUoVjyjVRLfTgT?=
 =?us-ascii?Q?K2sFmGZljdVIfvCrhllwwy9A2QDxwE10BQUy/KW7qBd0mqI0TJiLTaAQkQsO?=
 =?us-ascii?Q?F8oLqxkoHkyQXZFt3mjJ3PeHbDdfUHbuUk5aqs60XeNpgoYRFIM4vYUyWAyC?=
 =?us-ascii?Q?20iJYY1Jr3rd+kd85uvr/GcK0KxIO59l5efQN1yftvNSgLRAPjS4TMWAmrKu?=
 =?us-ascii?Q?oShocE0Pq8FLrXvue6hvwT0ovXG6BXvBcW5OmmxeKzIdlhRjyBrBlKMEmsMp?=
 =?us-ascii?Q?0l7A+eu3hrjRuU+xTHd6ZUw4J0uwoCS51m3HjAaQyrRfIi1SMpYOD1rQlUD1?=
 =?us-ascii?Q?I6nfmIb5JYfI2iTecQ5xNBcx36D8NIg+FbOthP/f9owmYaq83/xQau2CoeJa?=
 =?us-ascii?Q?2oWEjobrbKiPc6yJoKnRMselEZlq838xViQ9VHdRugtnU30hfwjv0HGSgbbt?=
 =?us-ascii?Q?QsSMNcFgF+liSgz0y/pMRO175H4zV8J0SINEbvDEwEQHJq0DfGokHy8q/KFJ?=
 =?us-ascii?Q?9q2NFuNf97kiaA4P0AX1VbJdrZ8TJx+bGyMs6HkDovpm0cLGFo/K2ny4+a8P?=
 =?us-ascii?Q?rQjNxD72WdpPno23URf4z8NE6MaYrEW6zDd32hwWLfty7yzBFEfrsxTgzKrG?=
 =?us-ascii?Q?bbItOuuHtPnGbok4P/RDRPTVpnpD69TJdHLvvdRGibz5QylFzrUSUo/4LSHk?=
 =?us-ascii?Q?ixjM4YlyH4aSfuaR/5pdvrLN4Jz3PEYU38YF8AUkA/mL0eAG8SOjBRs3qPri?=
 =?us-ascii?Q?9G0LLAkzAVNYvg9XWv7027YvUKdlKSvtMKB61DHYl9h8ZyY5SvU2uGSKLOyg?=
 =?us-ascii?Q?mOTJRBh3JtzGpFCdNQZTjN8h2M/Vs/z6KCi3pBmJNZlxBNZbAcuwFdDt3ezd?=
 =?us-ascii?Q?V8y+ZQ0y9C+ZAKrQQyqG9pAWn1vbShBpD+hKhSIOD22UBJDd4QHxUvLwXUSm?=
 =?us-ascii?Q?OM8VeGbsoVgY5zTOVDeFUTK10vYleFIwhcXGva3BU/cegJGDzdQJwRPL7a7t?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1660aa5d-b23b-498c-3c3c-08dbaa5bcc0a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:52:24.9610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQTCOI+0TwiJ8PfUXT3HO0IIEurT1YcxZ8AmZ6ghMvkXCaS6f4l9G8y3hVguBo1tL5hU+K9H2Wt+vXe70UneOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5509
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram
 fused min, max frequency
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

On Mon, Aug 21, 2023 at 05:37:28PM +0530, Sujaritha Sundaresan wrote:
> Add sysfs entries to query fused min and max frequency of vram
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c    | 55 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode_api.h |  8 +++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index c03bb58e7049..d7e9609c74c0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -20,6 +20,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -568,6 +569,54 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RW(freq_max);
>  
> +static ssize_t freq_vram_rp0_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +			      PCODE_MBOX_FC_SC_READ_FUSED_P0,
> +			      PCODE_MBOX_DOMAIN_HBM, &val);

This is clearly in the wrong file/component.

It looks like we need a new xe_freq component, that then connects with
both xe_guc_pc for the gt freq and with xe_pcode for the vram freq.

> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_vram_rp0);
> +
> +static ssize_t freq_vram_rpn_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +			      PCODE_MBOX_FC_SC_READ_FUSED_PN,
> +			      PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_vram_rpn);
> +
> +static const struct attribute *vram_freq_attrs[] = {
> +	&dev_attr_freq_vram_rp0.attr,
> +	&dev_attr_freq_vram_rpn.attr,
> +	NULL
> +};
> +
>  /**
>   * xe_guc_pc_c_status - get the current GT C state
>   * @pc: XE_GuC_PC instance
> @@ -921,6 +970,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  
>  	pc_init_fused_rp_values(pc);
>  
> +	if (IS_DGFX(xe) && xe->info.platform != XE_DG2) {
> +		err = sysfs_create_files(gt->sysfs, vram_freq_attrs);
> +		if (err)
> +			return err;
> +	}
> +
>  	err = sysfs_create_files(gt->sysfs, pc_attrs);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 837ff7c71280..846c99aba3bc 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -25,6 +25,14 @@
>  #define PCODE_DATA0			XE_REG(0x138128)
>  #define PCODE_DATA1			XE_REG(0x13812C)
>  
> +#define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehp, pvc */
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> +
>  /* Min Freq QOS Table */
>  #define   PCODE_WRITE_MIN_FREQ_TABLE	0x8
>  #define   PCODE_READ_MIN_FREQ_TABLE	0x9
> -- 
> 2.25.1
> 
