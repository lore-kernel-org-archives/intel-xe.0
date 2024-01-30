Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2112C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 15:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7CF10F8FF;
	Tue, 30 Jan 2024 15:48:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CA910F8FF
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706629686; x=1738165686;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/Plzb2uBbnG4pHay0Muu6FbfcvE970TTz9WFPAWc7Aw=;
 b=c4G+/Tr9FvpmfiPQfe93Q//OfuD+my/lEXFoetV5rBXEYZ9C84lVKh0C
 cMKHNOEgau/RF6hOhi69AW+uRK304LX8BVMVpogBTIPNErXWc6/2mmROp
 pPhraTRXx64pMI/CLMQJ4ZSaPiojeOHUritL7TEIriNMHZV15oE8irdLW
 Ugv78ISsSv1y8S3P4w4QDkPDV0sskhmj5oKfmWc6XZwMyeMTOTSpAhmwy
 KBK+wb0FoHuKetCCXH2Uz1t30UuU3H49z63w0LgC3aplKZgu+M+sj6obf
 Gpz9ooVGXqIpJS74hWCO9JY0Vsv1A1Xts/j3I51JrINDGp7l/HC0tvfd6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402939850"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="402939850"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 07:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858520426"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="858520426"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 07:48:06 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 07:48:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 07:48:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 07:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVbmsiye7ha3XARs93mHWrNiFI10e/P5k5uSWDXL+/9jRP2EsOOkC1usGrB6LV2sxm3AE8nT6LcZKSjMhDBKrVAg9A8S9IHaydVY+udEUi0JpytXT3B51f2c8Y5S9icoSyQY+sCrJ3MG7nW/jOsh+jNmtcbNcQl13ISnS5ccGNet+FFxVKZdGkemgfKH7ckt8vl3ZFeT+VG1zh+wQHZUoE3jBcBSWjOBXTd6dQnwGZGjj+qIlCxjJ28WHWvzpfYrOluqPxy96uhzj82BT82+2BKaLv3clvZhSyHXPvVSoUNJK2KqOJF8qiVBzN4uiL/bFe5J0aJT39g2dIDYLVLwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36CaVmDQXmIxtETZ5KFXI3DVco7D4H3571gxe8dgwGQ=;
 b=oEhgkXP+FsmiD5aOq3HikAH5wc4lB/FDAC/+YCE+rW/xXfvHiDLHAoEA5MKyr1NiRl7iJ3IGidDqm4Vdau5FmtTY/5og4BTCi6YFnXLkfIXdHtvT1dFUf81WqapB1tgCy4dUjQGRXpIos0gqIeq3t3twPK4StsJaDaqxAF7TDe3rU1uRMCynzgItakuvZL/qGTO7lBLj1Ofq76nGMQFfgMmNn4uNQAGzDl2+bMx8/H3LPM533Il/77/pMpkl/dDqEvcVx22a8RNAEeR3uNqLxCvfW4wYayqyqPMylEtRUY2U4WTOaAXUWA0SaAagHGyDLDnfDOsEUSmrTr3VEm/GNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Tue, 30 Jan
 2024 15:48:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 15:48:00 +0000
Date: Tue, 30 Jan 2024 07:47:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Add functions to convert regular address
 to canonical address and back
Message-ID: <20240130154757.GP5506@mdroper-desk1.amr.corp.intel.com>
References: <20240130135648.30211-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130135648.30211-1-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bf9e50-718e-45d2-6108-08dc21aad61f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExZhr6MgvmS+N9v4vtjwnp8g5dk1lVMi9LbcETn3eD3eYBlvBUSS88oqB+PUCL6drgocWnM+PjjDVaZgJsuytdV/mWkv6Xar1gCpKw3TysR5JmVyCiY0DyIVIN981WN5zeAJjiu1XbGc54J+CMco+2UbHePpzYR7dQfCYnxHsLAmPGc15goP3BvPa5+svqRNbHwt6+PXIlXtTU+lgSn6JgYYvtFUAqAoyhxDWKfsX6m2RLnO7ihxFAo96/EgMELkjO6yHMjYgSWt/w9JMXSkuz+iPpwTvVtszsZAiH87o4ojIgoifDcfrdE68U3C+kg93MgrPDz7FQYvt352LH4A4pwkV76X+uNsMyuRhXwnyiTUsplR8STl7cJ0zJgX+qq5Udqn32LTR2UG9prJs3+uYAiFFh7iqDxXAzjB7/icu+afnHmBFhxdsXsp/+/unz47nUFmSiN3TogR2hutDnoJG/fuWjdurDxdld6gquBiKo4+fpC09RxRQ3HRj3erKH/jHlz6x+XX2ifji52F0AFqvvBXf6VloBLmWGDVZiTcNqLJ0cXAR2d+GkZEbKXJV93l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(6512007)(6666004)(6506007)(1076003)(83380400001)(86362001)(33656002)(82960400001)(41300700001)(6862004)(5660300002)(4326008)(38100700002)(66946007)(478600001)(107886003)(316002)(8936002)(6486002)(54906003)(66556008)(66476007)(2906002)(6636002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Mm15jIzESlHceu97TjDjU8NIGlX6lVBPLEWm+LncOhm/QPl0kmbOUWTng3?=
 =?iso-8859-1?Q?qksqJWwZfjMoyL3iO0maoU6LqXW39tSYlYyMMoGxVandkK5gHYnE1hDzUC?=
 =?iso-8859-1?Q?kypeuKAOkFr9prfIntARCHNIW5lrb9XhoNK8PULSlUieGF1M0cJruWuFun?=
 =?iso-8859-1?Q?+AXiTRDzKNuec7DX+pQ8/bm+yFJaq6WQtvLiz9+7urhiglVmjQMPP+pSSX?=
 =?iso-8859-1?Q?MsRhmYckvqshyjuzQsK9yOxqSRQHYSsD/t0EQP+oKBkSPYgFsuE+5kN5A6?=
 =?iso-8859-1?Q?nhZCbHebunSTboFhM+DjfyvuOo6AxPY70oR3ty57omByDv11IvP78bEniQ?=
 =?iso-8859-1?Q?gW/VOo6zzs7BUGgDV1fTkk1GFCgNgqBStXlNwC5poZtAgMXD2/16m8EDts?=
 =?iso-8859-1?Q?79x7ahw9zpvJpYQkY3QVLyz3V0i32k6zpXDka8gdsWDxRtVFy0Rr0aDWAf?=
 =?iso-8859-1?Q?lPvFFinm4pR1eaaY5fl2XaXFE9ZsDcGtYfZmzM668kKClN4WgGl+0YtEnM?=
 =?iso-8859-1?Q?3oEZgLKbb7nSGH2BIlxKA8agZB9WFRc1CzKeggCH90n61mxgD0G8G+uFCk?=
 =?iso-8859-1?Q?T/rPlzU6N5xdCN2VIg8IGbuh52WL7W8BO4jn66XAVHfthvuwPy30OIxV5m?=
 =?iso-8859-1?Q?2HtpWjLW+3IOMLHzKiiChbBMPk3U7Fte8tlJNhAhZG5XYASjM5q7EQzDrc?=
 =?iso-8859-1?Q?M1kyGK+RP7tXksJYzRFiCPoVdqrxvCXFoy8StMRj+MrpmTB454SloRw/J0?=
 =?iso-8859-1?Q?q8fNQd8gOq0QuHj+XbqgGWsYOaxltFDp90uNvgjv9fr+OBkzHQGrtFdH8r?=
 =?iso-8859-1?Q?8lPvUEMjdeW75uR7bAUKUDoc16SlTbRhpnvHrlbuGD/rZIoPtL18vS0AaC?=
 =?iso-8859-1?Q?wQ4t5AZo1j6c6sNfhWDq3GQKHi4AC22+rx9hAMe37e/OfAV5Ml5ShDqlca?=
 =?iso-8859-1?Q?imxRCGGvSgXFsRYE4B7zA0q5VWEpMphnw3nEU/ZhF0D6Z7rff17cH9yEac?=
 =?iso-8859-1?Q?Grr7DXyd/z+Z5rq/qLYGO+3zRzhVQliB4ViH8VkNcsFB7CPxM71BJ+3vEX?=
 =?iso-8859-1?Q?GFEaV+qtwsH7xSomiIa9kni7YG/lDuLBNSf52rIJz/pg16Eh2rHjYlfoXE?=
 =?iso-8859-1?Q?kPUGjD+L/1nNWlVCFg+qSX7ZnaWO8OwzJlgHv9EeHF8bgZSaZSNNNspBXR?=
 =?iso-8859-1?Q?9SNp++npCd5Wt7NNyDHGQR0adGmk7hbrLlFOe8HRPaFI3d9cvVZw8+SepM?=
 =?iso-8859-1?Q?K0zMZ4rur6QSbhYfE6VN46AuRUKC3xjkGZMn1o5BRMZA/D6RSglInonSkq?=
 =?iso-8859-1?Q?kJChmQFo58I3TZ1jWqM8Rqz3uB/g0p6UDhEz0G8XujGZwq4PlYj40T0VDF?=
 =?iso-8859-1?Q?sxgiMa5opA1d4NGe7gPbp5Ao0DDWLDTY2FhedmSZMqoCId6QzzaM22axkh?=
 =?iso-8859-1?Q?VmBVLSurDXJyHN8Yc0a/RhFWedY+ljcsRhiGrw1++MQ3q6fWTrZDP/Yz1y?=
 =?iso-8859-1?Q?BL1LAGdX4/4aSO3LLJPW74cKAkeJmX9mI9VvNvGOe+ryoz3rKEE6rrkxJF?=
 =?iso-8859-1?Q?5tnUYWiTZcHr1t29lOje/shF2pzPjjaRl2Cf5omSUSQwlotmQHhfTZCYAv?=
 =?iso-8859-1?Q?C4NRiBD4SWRXQ0vjaFVujREBVFcxfyxT1FUIfB+EDawhH2PjK4FaVBEw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bf9e50-718e-45d2-6108-08dc21aad61f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 15:48:00.1836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHd7vfwRiasWWpzhVZIZ2YZc0ulQqrQ7eJ0A5237QaQx3A/t8SojAOQIEsteX+XD8irZwAMNLN/U901UQ5up3wCkwwrVdLzNQjzQdaya4sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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
Cc: Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 05:56:47AM -0800, José Roberto de Souza wrote:
> Some instructions requires canonical address like
> MI_BATCH_BUFFER_START(UMDs must call xe_exec with a canonical address
> for Xe2+).
> 
> So here adding functions to convert regular address to canonical
> address and back, the first user of this functions will be added
> in the next patch.
> 
> v3:
> - inline removed
> - rename highest_address_bit_get() to ppgtt_msb_get()
> 
> v4:
> - use xe->info.va_bits instead of xe->info.dma_mask_size
> 
> BSpec: 47626
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_device.h |  3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6faa7865b1aab..8e8567e06f0bc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -747,3 +747,13 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>  		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
>  	}
>  }
> +
> +u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
> +{
> +	return sign_extend64(address, xe->info.va_bits - 1);
> +}
> +
> +u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> +{
> +	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 270124da1e00e..462f59e902b12 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -177,4 +177,7 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>  
> +u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> +u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> +
>  #endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
