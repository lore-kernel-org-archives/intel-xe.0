Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B50C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DDA10E32F;
	Tue,  6 Jun 2023 11:27:22 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B2510E32D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686050839; x=1717586839;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hbkPUpS58lb2xZAqyE2MPD4zv4Q6AR8ii6GPtrYMsVc=;
 b=bF41d0SM0GDeBFn4GR5EZopoPMe07G+y7pJMw/qXW+F2vSddBLSqPpIO
 niAfEiGYvfgnUhl2wKPNFesCFrBQXCT4soeReLoJb9a/ipXTNpFeGO0f2
 aBIdQuC713yLCLkegFQx+UMO08pDrwC08mdlwgYv0gygSkqjWRFAXQdgi
 L27c2jreDJo5ynDriMeUk7WygcrN101qauK1LE9xX1oIAuSBMR+VI+Rba
 qd0aBDs2sP+HttIGXv6CqVIsdWYDCLyEOr8rqKyMIZ6dFlZU3IucYrn4K
 uet548SpmdIX5RHxMZDNwBb1nTD2x+plRH47k12xD4Gxknap9j5l249s0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359096200"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="359096200"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709043447"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709043447"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 04:27:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 04:27:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 04:27:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 04:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdNi9l8FXsTJtQdM1IQMWfZzw3SykAusyTA2QPOewyVDBoaywE28Z766Z7JQ05XEM/yAeEHblVmuTnDfh2DxwOuOKK4anzc8Ilm/RbpbVGX4d5CUWQTomn4VauFz17JzBZs0WStaru66Bm2npbYp4HLgM1NgIraxH93m46H9W6NMqd9mL+oAFhyQk6d3aoiRJkSo4RFoTOS1D7r8BO0J3IG0Q3ZhhDW3jhaZhEAlJybNvYkm0cZeyF2ISwPeLw9vWevtLCDGfAduTVdOjB/tXlrSL7P+qL2pPwJIFszbH2sYzlpnfJrwVp95UR9ILfafuLGW/pLhbGt++pjYrwKOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scOGaPrNFtq7/vDCFRFUEP1OSB9ItHHviRwXHdgKUBg=;
 b=GU8a3sjTnyyf3iBZP1HCsRaTz6uRSrZKA7fGEqv1rqh5KhAMhUE9GY1sb2OS10RmMT98RldK1B3gOVxImG4TRGTx+IhVCUbssl4HfkcNAdcpTxRFU5vYtG2ZmzVve0kefesbmOz5mkxStObGmNKiFokp+afp0D4pNW+Lay5MITur/0mmQ0dI4u4JTyyQsyORljCGFbMEz4gNPLNjAy5LPbab174ACDUtlB0UVyKNBZcHHv/kw66g8taCgn1e3UPDmDLd1uxKtdEzXsrCZEhZb47y2A9zq0/G2na2cmcbf+Er7Ky3oY1Dk8AyFB/X7My//0P5HaXvMiTZV3/uPvXmuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 11:27:06 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 11:27:05 +0000
Message-ID: <95127d43-2eff-22f0-8678-1e8bb17438fe@intel.com>
Date: Tue, 6 Jun 2023 16:56:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-2-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230606111255.2072426-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::17) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CO1PR11MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 977dd28e-065c-4c67-669a-08db6680f509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NtNUXyblAtlMQHDYPYDjY8P8qugea/3PX5TDIauvnj5gZJyW1DHyqzNzyYqHo9qzegM5MzB65R8t2PJZWa+0H+ZA7imVyZSW2UECS0F6/Y2pJYSVpsPm2u0TPCb3JxmO/YVDK77GoijZ19+jGi/6n6bi9CG11GO9LEGKAyeUKN3+tSd6ws71XYP7GE0V3nTNIjXFlLHKvLU68nvRbhXpzm/Czg37cAqUyHIjoAYLg4iBY2DPuMVUUQtT9nkErZzhZRov/Cc39p6a4ggB12m2VsKBz/+tfQAruRmO6KixwY/cldAU5FLRj2lqdPz8zAl8bLZRZZxhEy7g0w0w18EieqK5ZApdIppVvB4GvPpmPTA0EslcDuqE0FeYBTY0P+aUJrG4fTypSq4W6ryq98G74vlCMADYGNzJner5G5wjs1kmmId6jMHDmvhxnyujNAxFRjtTGri3q6E8hCTwUfbCwStyXh8zbYOF4u/zCRFOytR8X0UNkvgFurXd8QwICpa418Qfp54ivvNH+lDs+dy54UL/rKuO3NA/+TFhVQwMNekUwIyUlQzTJBifGOuJCdPVZjqhBAXR7y0VDSZ6CUgOBUn7oGYCgQQYAtwgh7QpSmvvBpX3nild83NijkZuZZ+++ML+fptUYCCTW7EZoTWOyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199021)(86362001)(83380400001)(38100700002)(66556008)(66946007)(66476007)(6666004)(6486002)(478600001)(2906002)(186003)(36756003)(2616005)(8936002)(8676002)(41300700001)(316002)(5660300002)(82960400001)(31696002)(31686004)(66899021)(26005)(53546011)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDFRTFdHS3llaXdpMVh0cVk5bmFOTThRZ3QrbmJMeWhNODdjc1FsTUw2V1Nk?=
 =?utf-8?B?ekFBY1YwcnVVenhuZjNXV3JzVjlqSjlDNUxTVEJlR2gybDlEbEVtZWFlWldW?=
 =?utf-8?B?eUlHVkwzTDZMdVRKZk9BdkRSbXZZM25ET2llcXUwbENmZlNyY1hnZkJ4bzBp?=
 =?utf-8?B?dUVPbGhucUl0NnZ6ZGVuWUVvQWx0Tmh6Q04rdUdWa3ozWE1XVkhzaGxVRUhn?=
 =?utf-8?B?Um12dlY4NVp6ZUZJY1N2QWR5YnJDRmFoQ200TWdGL1BQMFBUTlk0YjI1b1J6?=
 =?utf-8?B?VDA1bCtXZFkwMDVJWmZHN0RBcXJlQ0c0TTNzaFBZOUNEekFKSE9lelV0bEpu?=
 =?utf-8?B?SlJBRHUwQmJMYStVc04zNXhSb0tKOHJrcmQzOHNZR2gxQWErSUJpcU5XaTk2?=
 =?utf-8?B?aTF3aHZYa3lTaEhVb0UwbmtpWC94RzdZdzRHNWNQUWNTTHpySGhDZkdtQ082?=
 =?utf-8?B?MWxNeXMvTVhNdWZ5d0pKWjBEalB1bTRBYm9iVHZpcSthTlhvR2FIaHBFZVo5?=
 =?utf-8?B?TXdJdHlBK0ZKN0pxK0dRUElXbzNiazhTWTM5M3MwZTE1VCt2ZlYyT29rdzlx?=
 =?utf-8?B?MUVkeDdOQ0UvUzNnYlpaUVlhM0dZNkpFaDZxdGd6Z3RaNTVrOExnbkI5TDg0?=
 =?utf-8?B?Z0RiZ280ODZ3M3B3Y0xqL1ZORGxUSGtNMTRRZ1hYb2pweFh6QzNxakU3bFpD?=
 =?utf-8?B?VmtJV3N1NWhuVkxqeExFcnpnYUtQeDlFTWg4T1RUZnpRa21qdEVzUWxKMWNQ?=
 =?utf-8?B?UFlxbDJqcFh3Rkw4YTczTkJqS0FST01FMTcvOG42SDZuS0RYZzljejlMcHB2?=
 =?utf-8?B?MTZpTmFyRHBZc2FsZHdPYUZ1dzNoM2k1Z0hHZnc0b1ZTTFQrVmZ6eHdPYzN3?=
 =?utf-8?B?LzFvRGhaZW54SkRLSWNiYS9ndFNGTjhtcWdCWjNYTFNUcUxFVnRmSDZqT1hv?=
 =?utf-8?B?RXF0YlNmODFHVURlRW9uNy9iRXpTa3laWXZmMHppemlpOVdOa0syUG5NSE53?=
 =?utf-8?B?b3BzK2xnMWsyNE4yN1FPK1VXNk5heEZwYVB3SWZtRWhDeDVMcUF3bmx2V2dR?=
 =?utf-8?B?NUx4UGFWY3kwL0xua2dwNUs3U0lLWHRHelR2dnlhbTdEY25SODRNbE5NSGh5?=
 =?utf-8?B?SVhZY0oveHRoUDVMaFYySkdob1ZRQ2ZRbmc3VFJCYm14S2dkMmduM0JOaEFp?=
 =?utf-8?B?TXhDVFIyQnFFRUVNZENtM1hKaDk2NG9UT0Z3Qm9ZeGY1ZllwQWNLY0ExQzJp?=
 =?utf-8?B?c1FuU2NlcDVsbDlIVFZKejUyVCs2V01UYzNpNVhLbkRmc1lLYTVOd2dkY0dB?=
 =?utf-8?B?QWpCamY5L0RoTE5mNUxnNjh0cjRySGtjK2R5Y2kvUUxLV1VHZDNsNGZRMjRJ?=
 =?utf-8?B?WjNGbGRReTdPNUhlcGp1T3NUZnFXL3BKTlB2LzR2REc0YUdwbkhqc2hSWlU1?=
 =?utf-8?B?aGNZZ0lTUHNpdVVTa01IUENXK2FKckwxV3NZeVROR2VEL3Y0bXVUSGxHZUlR?=
 =?utf-8?B?ZGtVMW1YT1ZrUCt4OUZpWHNEN3BqN0RQbkc0RmlHaWNzQ25NdnBGdkJnUWhC?=
 =?utf-8?B?MGJQOGI2QkdPMk1sWFMvQmRuY3FFdmVQa3FZOFVwQXZ1VWU0MTF6VEZFZXY2?=
 =?utf-8?B?YTQzTXppZC9pU0NRMFJpQU5VRzdIc0s0NGRYZUEyQVlXekdOcElBWVpGREl5?=
 =?utf-8?B?ZHpNbDh2NWF2OEdEZFAvbkRaWmgxQjRqUC9sZ1R0Z3VDdWY0NUZueGRQU0k4?=
 =?utf-8?B?cE90TFY1bWlQcFZPNkxMVDVsRWxybnp3eXh0SHFWaWRTcDVTYXB5WnFZOW5B?=
 =?utf-8?B?R1A1MjJuU2hiUTVGMmJhVzlnQTFvcGd4QmJEUFNreEtxU3FROHhxYkphSjRv?=
 =?utf-8?B?V1dvamcva3lNM2JLM2prYTdtRUFKd0MxY3M2MmhMVzJFazJadUkxMnZlL0Ex?=
 =?utf-8?B?MGd3UUpRYVJNcEVoUC9ULzZQSHQ5OXV1cUFsdzFiL3FCUFlGVlU3VnZLVmtD?=
 =?utf-8?B?czBOZGh0cDJmVW1TL2xkZmpqN0E5d2tKREovcWF6YmI4OGE1cmxyTzFSR0FS?=
 =?utf-8?B?YkN4d0JXeW5vRTgxMXVvY3djOTJ3TUh1RGNJTUYyZDNoYURnMXprUk9wbTdR?=
 =?utf-8?B?T1dLSnV5cXJBbUJ3MW5nV3BhTjI4MVJiYmxxempJQy9pSU12OFhYc0FmamNq?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 977dd28e-065c-4c67-669a-08db6680f509
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 11:27:05.9176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pt55LVPi4m15ce+lpToUYc1iH0PBCBrbxGPiRHUksnxXJlOLB8Vup1PpNFruLJ+VaOuP9QZBNL2/Zmyuu8SScuBJoxHqEOo1+HSN8vE3GcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add sysfs entry per tile
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 06-06-2023 16:42, Tejas Upadhyay wrote:
> We have recently introduced tile for each gpu,
> so lets add sysfs entry per tile for userspace
> to provide required information specific to tile.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_tile.c             |  3 ++
>  drivers/gpu/drm/xe/xe_tile.h             |  2 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c       | 58 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 +++++++++++
>  7 files changed, 113 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f34d4bdd510b..41a6c0d0dee7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>  	xe_step.o \
>  	xe_sync.o \
>  	xe_tile.o \
> +	xe_tile_sysfs.o \
>  	xe_trace.o \
>  	xe_ttm_sys_mgr.o \
>  	xe_ttm_stolen_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 17b6b1cc5adb..db61da4d6212 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -150,6 +150,9 @@ struct xe_tile {
>  
>  	/** @migrate: Migration helper for vram blits and clearing */
>  	struct xe_migrate *migrate;
> +
> +	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> +	struct kobject *sysfs;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 6414aa810355..ac70486d09c3 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -10,6 +10,7 @@
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_tile.h"
> +#include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  
>  /**
> @@ -142,6 +143,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  	if (IS_ERR(tile->mem.kernel_bb_pool))
>  		err = PTR_ERR(tile->mem.kernel_bb_pool);
>  
> +	xe_tile_sysfs_init(tile);
> +
>  err_mem_access:
>  	xe_device_mem_access_put(tile_to_xe(tile));
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 33bf41292195..782c47f8bd45 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_TILE_H_
>  #define _XE_TILE_H_
>  
> +#include "xe_device_types.h"
> +
>  struct xe_tile;
>  
>  int xe_tile_alloc(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> new file mode 100644
> index 000000000000..821bd49de277
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_tile_sysfs.h"
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_tile.h"
> +
> +static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type xe_tile_sysfs_kobj_type = {
> +	.release = xe_tile_sysfs_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_tile *tile = arg;
> +
> +	kobject_put(tile->sysfs);
> +}
> +
> +int xe_tile_sysfs_init(struct xe_tile *tile)
> +{
> +	struct device *dev = tile_to_xe(tile)->drm.dev;
> +	struct kobj_tile *kg;
> +	int err;
> +
> +	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> +	if (!kg)
> +		return -ENOMEM;
> +
> +	kobject_init(&kg->base, &xe_tile_sysfs_kobj_type);
> +	kg->tile = tile;
> +
> +	err = kobject_add(&kg->base, &dev->kobj, "tile%d", tile->id);
> +	if (err) {
> +		kobject_put(&kg->base);
> +		return err;
> +	}
> +
> +	tile->sysfs = &kg->base;
> +
> +	err = drmm_add_action_or_reset(&tile_to_xe(tile)->drm, tile_sysfs_fini, tile);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.h b/drivers/gpu/drm/xe/xe_tile_sysfs.h
> new file mode 100644
> index 000000000000..54a2ba8ba533
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SYSFS_H_
> +#define _XE_TILE_SYSFS_H_
> +
> +#include "xe_tile_sysfs_types.h"
> +
> +int xe_tile_sysfs_init(struct xe_tile *tile);
> +
> +static inline struct xe_tile *
> +kobj_to_tile(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_tile, base)->tile;
> +}
> +
> +#endif /* _XE_TILE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs_types.h b/drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> new file mode 100644
> index 000000000000..75906ba11a9e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SYSFS_TYPES_H_
> +#define _XE_TILE_SYSFS_TYPES_H_
> +
> +#include <linux/kobject.h>
> +
> +struct xe_tile;
> +
> +/**
> + * struct kobj_tile - A tile's kobject struct that connects the kobject
> + * and the TILE
> + *
> + * When dealing with multiple TILEs, this struct helps to understand which
> + * TILE needs to be addressed on a given sysfs call.
> + */
> +struct kobj_tile {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @tile: A pointer to the tile itself */
> +	struct xe_tile *tile;

why do you need to define a separate struct, can't kobject be part of
tile struct itself.

Thanks,
Aravind.
> +};
> +
> +#endif	/* _XE_TILE_SYSFS_TYPES_H_ */
