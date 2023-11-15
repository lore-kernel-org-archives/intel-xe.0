Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1A2C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 21:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC5A10E273;
	Wed, 15 Nov 2023 21:47:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E681010E273
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 21:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700084820; x=1731620820;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C3arEszewaERDGiilung2pqugKgyWS+OV3wZUGgVHqg=;
 b=jhRvG6q3vlXgjsnNFXCMDfxjx+qrGmXx0j6jfW1R4byU6L933vwnAvQk
 b12385/qVzqd0QjMvlJidukkS9Na6NAsM2EhaUzVzmYXqcwCRcyQ45XxL
 QS5g/Pj+1wCBkjLAZtq13xg4ruzHdTYndT974Ek/apSxcg3x/umJK8/SM
 ZAEdOXlGZL33wCrcZvas9p4mJE68ZGvGNNC8Xm4KTU/+dvvjUryMpBilo
 9XheV0AARWAf8q+FpgfJinMrT3IiPmjJZkdAio6Ho6qXwSKxDlB0AACrB
 2kPK08Ya8uqug6oXGnelQmzQ5KrZW593sjd6dTDQuJY69Xf6YUi9KShMI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4081240"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4081240"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 13:46:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="13335522"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 13:46:59 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:46:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 13:46:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 13:46:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AY18h4UGJXLQSI4VXrH/Qh7j6pqflRQYpyAZ2hlvzu0xv6OnnJKfOna/yELNgd8F16cpJzeRcqkXBvmJvffcGXedfKzJU6/qU+uCTHov7qP3MbbDbFLvWDQcYT9LWs4uuT4N7hkluAxSPc18RAeyd1bGbhAwJhCul3UQA9q0GxG83LYsq6wXEDjcHLjMSrBp1h5qsMpvbKhMWfY+UaTnOxbQjgzlf+YGMpRAuQLfF+ZDwtPlrE10uenKObmCTYwj/N0XmwLk6d85xTxUvMnHO2fdGB9Po9/gkC3bgcZgxILtxybmZ5pLDiu7HneMEEB8bIA49bC7/P7h0p9sE3f1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qBesxjwO+R2XEbwDvcYirbgs4uP+utpCaqNTnIUdRQ=;
 b=YLBR7uDgtcdKoEW8DJhQBaB8vceazN+cR7ShfJGXXa0DM9xPUUVuDt9COFMo5aBF1ZvcGbP1eyoXHEIAIO/rsKt5EL3Mv4lv+PmQWSYdJzo7Y5lftWuqxCAewBYgZIC9pYbKX2C1tNuwVu9BapE/0gTv50i+MsXEmI8ZjTXj8rkhH0sO8jgnMNFTztTy1FyQ/RLdN9LkHNiR1stP9YFcMRP+5IxyLOAV/p3iW4TWUgZ5XukMUApO09TZnipLqayg6cBDafJVz5geQYkv91Xvor2YW1Jjjhmh5xZyBiBn90Mi7i8XC930hFWGRxNGkCG0KNYKDhG0sMpQDHXZHWvyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8220.namprd11.prod.outlook.com (2603:10b6:208:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 21:46:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 21:46:55 +0000
Date: Wed, 15 Nov 2023 14:45:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZVTZkzEM1VXwGCZY@DUT025-TGLU.fm.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-11-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-11-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: a958a471-a668-40fc-8f49-08dbe62462f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFomZ+t9KDdSYOFixK4ETgbNAxkxKfYQfsUgYWefvRlbeqeiin7a6JBO5chfdNVdcktKOncZm9tqxx95MfCiTyNct6q9nQj+IWyLOlC5YLQSPyTgDguRoOMzHM4xwj4UXEkbJUQWqZjytoOJdQ7B0y95EuT4Aqvi4LOzQAAhfqn9aQ/s/eG49jYrrasUOVqxeBbSD3BcGcJ0hUFEI+mGjZST3gF32hBLfVYCJh/DbrEqmF5xsxqmc8g+PMXUQSAINFfRFPjaJywmnSGohpmj8WCAxncp9HbV89f5cfi4OhJBLSzLD6bNYAQLihhZfWPxVdD23hIX84npCuF4LqLpY1c3STVxR8Y5G8kqa2i2s+5xpoN4i4ople9NBmZAMBg4gYHzvPLz8nOmnWsqp3mOMVM1umhU00kIaM/X/HZ4AD8Ks9TTImT7kge+lZ21NrhHYzhkAsbvr/85BgamFBGn7hBJkrWuMEgFPM2IBLCFnqxGhTkjt+7VfcIS9we3VU17NbQe/iAnT560XgKr8haaHCgwhvNTSUj55sk1vqP6dU24f3UA4Z0enyo8o+MVUMMK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6506007)(6486002)(86362001)(6666004)(4326008)(8936002)(6636002)(478600001)(316002)(6512007)(44832011)(66556008)(66476007)(66946007)(54906003)(5660300002)(26005)(2906002)(6862004)(83380400001)(41300700001)(8676002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am10TkFvY2QvVmQ2VFVGOVY0a3VpMEpIYUdoNUk3NklTaGNmWTJ6dUF2U21z?=
 =?utf-8?B?VE9VbnJsMnNPYU83amNiTk1wejlYT2xVcVBqUkYrSFNUdUpMc0tGbnJhZ3ZW?=
 =?utf-8?B?UEhJbHlKNzFDcllRYmtuSzlUUWFBaHNsQWQrbGJpdzljSWNlRlg4RXJNVlFM?=
 =?utf-8?B?b3dmcUFodXd0REYrcXhUZDZtNUFYRUpQK2haeXg1S25ycENqbXBEVmJEOTQz?=
 =?utf-8?B?SDl6OHRzcVA3US81VUVBQTBhSE1PUDdTOGVLb1NnV0V1dytBOVZQTFJqMXEr?=
 =?utf-8?B?UHJ5c2IwWnR5YzNYSkhXRnZwbjl3Y3NDQkJ4V1kxT29IbkJwU1pDTWh3MHVB?=
 =?utf-8?B?ckRVblNVY0UvM0VMTTErY1B4dVFoSE9jNWZjWk9xeU96aEZvdnN6cmt0UWhT?=
 =?utf-8?B?MEIxcXpQQVVVODFodFpUVGN5Y05abndPRjZTY1ZySEZjNitqY0NucjN0VjV1?=
 =?utf-8?B?Z0pCSFV2aEdXSWNUaGJDZDZxWWZwTGtRdXEvdHRqOUhmVytta0YyeHRBUWtw?=
 =?utf-8?B?VjhpbE96eDhhRjFZMjIwWFdUL1kxSHVHM25XQlZyUHFOWlFFQldLZjloSVBm?=
 =?utf-8?B?Z1oyVTJjK0tYVXBMUW9PVFJBb1o4Sm5obFpZMEJkS1JmTGF0NGJOMmJWU0JQ?=
 =?utf-8?B?SWRKM3JBSnFEN1BxNFNhcld3STF4ZnJwMnJlL0FKUTRzKzlQZzhxeFAyNHZ5?=
 =?utf-8?B?cmZsUWFzeVI1cVFxT1RiOStTZWo4S21ZTHpVL2JpbWp6Q0xRdXdrK3RtaXZs?=
 =?utf-8?B?THVVb2RVMDlPd0Rva05qU2NZTlA3SDE1d2NSeUdpSDZtOTMxTGUwNTBrZEpy?=
 =?utf-8?B?UEVlNFpFeno3R0R2T0JLSmJicGlrcUZZdkhEWEo1Y2JNd0t4eGxwSEhRVnJk?=
 =?utf-8?B?R3RxMmRGeGIraTdONndtanp5eFVaK3JtZzV2WEpETlI3UzYyMmh5SE1qTFky?=
 =?utf-8?B?MUZzemJvRWJPMXVzdk13UmpHWDV2YXRPUU8zR2NZWm8zZS84cml6bGc4WURJ?=
 =?utf-8?B?NlNpS3JYWEhDMTBCTGdvbFQ2ZEMrNmZIYWxWVjhJaVNMRFRxekE4VUFlM200?=
 =?utf-8?B?MHVmbjNkcE1lRFBkcGVDcXl3S2FlcUplVkYydWlHdXlKV2hSUHlPTmMyMXVn?=
 =?utf-8?B?R2dMMDl4dThmeEV4V3E5dTdFZ3VGS1Z3Vmo0VDFjOVRXaHFGMk1JdTg2S0t0?=
 =?utf-8?B?bkRrbEtUWG5WNWtaVzVPWUJDRUNDYVZSTjRXNTZ2YlB3eE93MmlyRDJseEp3?=
 =?utf-8?B?dnJKRnoxdkxrMlVvMUYwNUd3U3B3ZFZvSlhJald0Y202SzVJaXBGa3R3c2J2?=
 =?utf-8?B?RjlUeHFMZ0xPOUR4Z1ljbXRFTWNucmUvbnRpb1JMZ3gzZUxrYitMdkMwVzBY?=
 =?utf-8?B?VTNyRG0vRVJiNFhRQkFCMFoxeWI1cWVZVWtTZUdHKzUwT2pNV3lFRFFWQVIy?=
 =?utf-8?B?SkxvSm93Vlh6UEdnUjlORmRDUDM0bS9Ed0FYNkNGVkpuMEtNM3IwaXpQNlVi?=
 =?utf-8?B?S3lwNk5BS3VrMGM3dHVBL3JuclY4Z0dvM1R2VEx3eXVTOW1GTW9NVEY1WkZu?=
 =?utf-8?B?enhTTWI4S2x0dmdHMmJxNXlZQmE1aXRkc2paSzRzWjV4UDBZdkJDR2g1eWsz?=
 =?utf-8?B?MnNnNXJnN1FyY2tZa2lBRjgzdkp0dUwzQ0p0dlRFdDhxNWFIWUtIeFFhOWFt?=
 =?utf-8?B?dHpERDJ6WXBBTUJYV2FEMzh3aVVnTU95SUs0L0VqbUJZcnJBV0FJb3VmWGZ4?=
 =?utf-8?B?WXVwTEUvOElVdGU5QUdmamZRaGFoSDZwQU5UUXJhcFM4UjRWOHNEWFlBQ3dE?=
 =?utf-8?B?MlV5Tkc1bWxiaTdvalZwc2kxK1BjYUtnOUQ1L3ZvcEVUdmI3Ung2ZnZvN0ta?=
 =?utf-8?B?bTRXbTJHczlqd2xvSC9OVERuZUw0QWk0ajRTSGhzdHJuOGxuMHcwVnN4L0Ix?=
 =?utf-8?B?UExvUy8vKzRKckFDMk5HVkpGbndNcWdLL05lVTgrdHQ3WW94TkFHV096YTBS?=
 =?utf-8?B?ZExlb2Vsdi9GZUtKN3FBdXpiMW5LVS93OEU4Y252NEM4ZzdaRkNJZkxxbkxJ?=
 =?utf-8?B?bVNFNitjZVhIS0Z4WHVtVGZTUURpbHJDbnpoQ1hXd3pKeHp6cEpvdytMdjNJ?=
 =?utf-8?B?QXFqYWdaaDQ3eEJHU05VUGZha0FISHV6RmJjQVdLTjRvalBkNDdhemdqZG9I?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a958a471-a668-40fc-8f49-08dbe62462f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:46:55.7482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi2RyG2+ue1rc0VBXxcBVZh8mQ+xV4JZ8/Hlj+2S8uPdtC8hqd2pADUZZeevzzmGLbnXzZ4jH7rWLnqRa9i4Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8220
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 10/20] drm/xe: Don't "peek" into GMD_ID
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:21PM +0100, Michał Winiarski wrote:
> Now that MMIO init got moved to device early, we can use regular
> xe_mmio_read helpers to get to GMD_ID register.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_pci.c          | 35 ++++++++--------------------
>  2 files changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cc27fe8fc3633..6b195115564ce 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -38,6 +38,7 @@
>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>  #define   GMD_ID_REVID				REG_GENMASK(5, 0)
> +#define MEDIA_GMD_ID				XE_REG(GMD_ID.addr + MEDIA_GT_GSI_OFFSET)
>  
>  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
>  #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a1026b7ee4727..a6c08577b01d2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -21,6 +21,7 @@
>  #include "xe_drv.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
> @@ -441,29 +442,6 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>  	return NULL;
>  }
>  
> -static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
> -	u32 val;
> -
> -	if (!map) {
> -		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
> -			gmdid_offset);
> -		*ver = 0;
> -		*revid = 0;
> -
> -		return;
> -	}
> -
> -	val = ioread32(map);
> -	pci_iounmap(pdev, map);
> -
> -	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
> -		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> -	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
> -}
> -
>  /*
>   * Pre-GMD_ID platform: device descriptor already points to the appropriate
>   * graphics descriptor. Simply forward the description and calculate the version
> @@ -495,9 +473,14 @@ static void handle_gmdid(struct xe_device *xe,
>  			 u32 *graphics_revid,
>  			 u32 *media_revid)
>  {
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	u32 val;
>  	u32 ver;
>  
> -	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
> +	val = xe_mmio_read32(gt, GMD_ID);
> +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> +	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, val);
> +
>  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>  		if (ver == graphics_ip_map[i].ver) {
>  			xe->info.graphics_verx100 = ver;
> @@ -512,7 +495,9 @@ static void handle_gmdid(struct xe_device *xe,
>  			ver / 100, ver % 100);
>  	}
>  
> -	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
> +	val = xe_mmio_read32(gt, MEDIA_GMD_ID);
> +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> +	*media_revid = REG_FIELD_GET(GMD_ID_REVID, val);
>  
>  	/* Media may legitimately be fused off / not present */
>  	if (ver == 0)
> -- 
> 2.42.1
> 
