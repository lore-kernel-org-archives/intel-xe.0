Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39BFC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 12:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F8D10E34C;
	Tue, 16 May 2023 12:00:57 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4E410E34C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684238454; x=1715774454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xvurBZuf5Ixg4rUIiQh045kgRBZZAQpyYCnEZDvRsQo=;
 b=Yj26WksYctlRUWKcLZwBXS+CQB5ZBvs5Ff4HBeo/aH2f7DodGHJWwKKh
 DXLy1Qh/KqWGCznyjp8z0MOI2xPVBpL8nQKgy9UKzj2t8WxMOZhJYETnk
 cYzzyYVpxRLxZwVRJfSkafHnjC1zhQqssk1RiewUlLFx54cOyjkmsNZm/
 2B/RnCssWfcQtcodPrQVAOVet+z84cQSMuD0ZfQkSeJsHQzIrMUR+WSdV
 qAqCCKMZVd/0JumJKlsvr2Yf05broTB+uCSLSNondbXrIdLUyN/sMqeH7
 ZgDYeNBQUUYhAYvX+fhGZ7sfNMLhTQRmoLbHb6h2xxpeo+CqiaXN6rFxe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="417114130"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="417114130"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 05:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="701319980"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="701319980"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 16 May 2023 05:00:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 05:00:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 05:00:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 05:00:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 05:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUUkeGfnlzpbIakoJUIe/AUqRXqCpFThqRonSfAIWTrMB0KUfxwzUVmFV6eXSY+mgH+iw035VqjXR3624GzkLWEOpy+vG/IgAFszDVX8Du3jYe3M9gkK+Izttttw2aoXh/QfQZ/F1+aslzdxCVDGiolOrzBnamGt+l6OMcYQl5C1a6ObOzltCR5yfbVSDG5VnnrE4YzRN79gL/gJFtBHKIN6MxmqPqXL2mPS3/dvxJN4jMjA5Ztmn3ooUCg1++JSsJW8fiL7Sd9GAQ+32DIrSFI7pZR8sLv33GPEa5xSrkWUoZW3iR7ejph203046rTzeeuV9wxf7Z/O3F5+UeNRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztNUBh9WO2ed92XfqIWteZpqoDiXW3RmNeLp9xMUaWg=;
 b=YF7BXQcjbVawSUKcFmt80krEALYqNRrxekAlkxcVmpbWYPE5RZSeehcVAU8RDIYJUwP2eF6OCfHqdY76IfUN7XB6bGG4sdDSa13aEeahgN5RdSAsWbTdPyU7BpCU9mekzKQVgk6ayRVv+vYaBSCcujzqm7enlh3iqgY2Ulb2DyQY737w5f3SvvKLpiAU/eIYrq1eqparltnF4fkDmixGAgXG8yJFpRq8Mz13GzPBQNQcX5WSuzymH/dJTknd2lA+K4Ho/3ZxY/2WfjsM8M66rSXZUGs09XVGR1ldOk/EsOlNLl1FNOqgiMETbaB8UMHp9l45T6wrgwrq5LmNd3QOGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 12:00:50 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 12:00:50 +0000
Message-ID: <e8a5ab45-03fe-3149-f09a-d03f5acb99f3@intel.com>
Date: Tue, 16 May 2023 17:30:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230512052050.1308879-1-riana.tauro@intel.com>
Content-Language: en-US
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20230512052050.1308879-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::22) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|PH7PR11MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: da55e02c-e35e-42b7-8df2-08db56053100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b2+A8dNAh2agqd4jfPCAZEVOo0gogUA8+iq4H7bWapVSkA3hvyjnRUtZXst8AITiQSE3SNQ56tulin+YiivhGnQKHbGRIDdaSSjoXVRT5vjKmbvs5IH2PGxTV2AK18YwidupQejcLztgzj6euHUmuUgCWdk/AW3etbSaADyuGB9Oeij6pSVHmfjR5rc+q/OwX+8b5/XzWZKh1M2cyzBR3iqIvr8QOAwx3a8i/Mn8hU44c+ogfOUymXu5NhGiRRp7jaM/QvjrWXxPW3erDV0TyoOAxlbCMTDIblWKsWJp1CS40mI72QhJiKOMgfvzmUI2k7+UEv3ZH7qUkngCf8/cyVeQav2IU8FWbHn4sJLO0FwzNjbpKoanvaVVHx5LmkyYepEk4m8dDwusnyza2vmS7HlF10ihcvUuOZKHiwPZh8Xv5HiZVWkI27CTxg++gzAfr4P5gZTlRI5RIk3zrA/Fsi1pZwaJK/DpyxHngnTLhKfjtaURkKilXnxlOkBv/2+V6kCWuVRL1SielZ8JT76SYDty1f3O1ZzgabnWNsumsV5UT3swe5ETgXajz0H9STZ2bp+PdrBUWEV/QluebcRK+T2z4+A67gkydue1AONERarJ3xR/oHggRQ01PsWg0zNwzCxtbLPy0UAVXYW7KFyD1K61Ol7EOez+yLalynE7qUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(83380400001)(478600001)(6486002)(6666004)(2616005)(6512007)(6506007)(26005)(107886003)(53546011)(186003)(2906002)(30864003)(36756003)(4326008)(38100700002)(66476007)(66556008)(66946007)(82960400001)(41300700001)(5660300002)(8676002)(8936002)(31696002)(316002)(86362001)(31686004)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkVMcEtDaThPVXlKT1drcnA5cW1pR09Eakl1ZWpMWGpNdTNQeHdMT2EraFMw?=
 =?utf-8?B?UUExK2IxU1R1N1FVbmhHU3cza0dmSGZ3SVJYWW9YYUc4KzB4RWx0OVdBcGJP?=
 =?utf-8?B?SjBGNDh4QTJSNGpVQjlML2FlRFh2bTNSS2d1Wlh2SGM4VmUxaUxXdTZqM29n?=
 =?utf-8?B?U1dOTU5wMHVOMTVuSlV0UUk0dU5Va3B6NEhnUjdVQjJtM0N1b0xwUVh5OVNC?=
 =?utf-8?B?R1V1Q3pwb3dpOU14UEdQcURvaDluTW82NkpxWE1RU3ZDQnR1UDQ1SG1yTUVr?=
 =?utf-8?B?cUVjbFNoWjhtQ2N2QlcySU9pZkx1U1ZWZ0Z5ZnJVRk9lNnZvSk9IRnFYaUg1?=
 =?utf-8?B?WjZxSTBldXgySWFObENEd3hLcUZlWnJYUUc4T09jdTBuZ2c3bDAwNVRPN2w0?=
 =?utf-8?B?ZFR3dXhDcFY0ZHZKL2F5MXVHR1kzcHZmck5ZYkcrNW4rQ3JuR2hpSmVxYWJi?=
 =?utf-8?B?clpnNjlsY0RpNmE1RlJlczczejJsNmNBV0R3Vi9sQ3lWK3FHTVo1cnN2OG9N?=
 =?utf-8?B?alVrMk51R0ZMNVRxQisrUFBrV1dkbUx1OXA1eC9zRkNTZ0ttTE5HUnc5eTgr?=
 =?utf-8?B?djBjUngxd2RsVGpZbkRrQUFlcUF4ei9Ha3RDem9KY0VjVHRvUmlTemN0TjFv?=
 =?utf-8?B?bEtqVUxqNk9LVzZtbEJZNTRkQlVjNXpFbXdRY01Vbk5PTFoyQ3BLblhZMlF6?=
 =?utf-8?B?MzVoOVd6Ym1MWFdpMXN2ZHBUdURMRFpXOXo3bjlBL3N0clZxamNGeUF4RDRO?=
 =?utf-8?B?alpVQ2haS28wcDBLeUdmRE1lV0lXelBSU0ZhZnk3MlFDc0NsSWF4cS83c3I5?=
 =?utf-8?B?alFKYmtySTdVSGoyRytnS1FHY0lIdmIwa0pyWHdrTzgwR1Z1T2FEeDg1eUQ2?=
 =?utf-8?B?bDVXNUVTMnpvR2czUmJGRit3WDFTU0daTEIrK29RQ05ZSGM0UHkwNStmUG9T?=
 =?utf-8?B?ZnZQOTF0VWtGOThWbjJ1ai9mV1FVdkxXY0t4MDk1RWZ5WWE5eE04Y0Rwd2tp?=
 =?utf-8?B?ZzZFcTIzZCtjRHVLTTZ1Tks5d3NuNzI1dnZJVWI0eGtGaUdsL25JNUtFS29a?=
 =?utf-8?B?U1pXSFBNUDFDR3V1cGhMWFgrWUJmZyt4M3RxMjNGcmtrVStkdzB3bGxJbUJ0?=
 =?utf-8?B?T3FscnFNdE51dWR5MUo4cTZUa3FocWxpNE9waWFhZU5HTmYwMG5RMDVhRjhL?=
 =?utf-8?B?WVZjSjZybWQ1SUVpU3BiTzJsYnUrQjBnSnZNcitQcStENmJUVnJjdkp3Zy9l?=
 =?utf-8?B?ZnNGdGZ5R0syWjdWd1l3S2kyZjcwUkkrcEtmTUo4cXNXNURla3R4b1VuZUx1?=
 =?utf-8?B?TGJTV0MyL1lRL1BYakRQcG42TWFhZnZ4QVBpdVNuSWF6Mjh5elhMWXA4Rm9k?=
 =?utf-8?B?bzUzR05kbG9PQ1pTNFpaeFBOZ3JueXRhcUJSb0FsNGZVSE13ck4yNzdFU2tB?=
 =?utf-8?B?bDZqL0NDTnlQRlkvTFByQkdnajlna2RIdUdoZGx6Zkgwa0tIN1VGTGV1QWlV?=
 =?utf-8?B?OVRiOXNWRjF1ejdJVDdia2VLRDlLMEpyZjJUSlFaZE5nYyt4SU1pUmpMRy9p?=
 =?utf-8?B?eUVHN0F6V2ppcDR4SHorRnZ6Z3BnL2pZdTAvRklDV3RiKzJGNnU0WVpaT2hD?=
 =?utf-8?B?eFpERnQ5ZHN2WW8wUldWeFA4cW4vNEdkNlN0N3VNYUVkWUdqcEFwZ2ltM3ZK?=
 =?utf-8?B?RzBmUnRrcmllc2xBaGlmLzBnQmFqeFYwYmFGYXQzeldXVGlUWUlpRlJUM0Y5?=
 =?utf-8?B?bGhVVWRBMkM0UWxZbnNKdmh2RVpxWTlXV01JWUFvbUtSU2c3VTZGTmpESE1k?=
 =?utf-8?B?V2ZRK3FmNG4rVlhpR2lldjNDT1ZxeTlkMjQ5VlpNeVJTRXVtNzg2TGhaOFox?=
 =?utf-8?B?YlFxb1cxMEtsMTBPM2NrVjhkRVZRV3lIK1d2LzBLOTZ3c1RKRkNPRkpQZkpP?=
 =?utf-8?B?M3A1QTlhVWdpN2pkdEl4dkdjL0QrZmYyRkxLSkJmcERBdWhlOUVsVitySnZn?=
 =?utf-8?B?aVBGc1Z2V0twN0dzVzNJNTVJeDRuak10dlY3RGV0SEYwdmhMV0I4bTZYVHhU?=
 =?utf-8?B?YkYzRXJqbkF2QjlQamp5c1c4TGFIMGt6dmJOR01BS3hiVkpFWUVZZTB4Qkor?=
 =?utf-8?B?U0Yvc1NmZ3ZVTmNCdzlPZ2Z0TjF1YmdESjFRcU9LMHdYa0p6SFM2RExLaWt0?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da55e02c-e35e-42b7-8df2-08db56053100
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 12:00:50.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WWUDzKI8QLNuCkuqVrO9LUWf9TBJ+ga//KldkrBKCMfBZMXCFXFJVIyx+kT2iIapaK16C4qPuUpWCGi4yJjLbNX1hZwyR0+oYA2SwXSwAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 5/12/2023 10:50 AM, Riana Tauro wrote:
> Add a new sysfs directory under devices/gt#/ called gtidle
> to contain idle properties of GT such as name, idle_status,
> idle_residency_ms
> 
> v2: abstract using function pointers (Anshuman)
>      use device_attr (Badal)
>      move rc functions to guc_pc
>      change name to gt_idle (Rodrigo)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile           |   1 +
>   drivers/gpu/drm/xe/xe_gt.c            |   5 +
>   drivers/gpu/drm/xe/xe_gt_idle.c       | 134 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_idle.h       |  18 ++++
>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  39 ++++++++
>   drivers/gpu/drm/xe/xe_gt_types.h      |   4 +
>   drivers/gpu/drm/xe/xe_guc_pc.c        |  87 +++++++++++------
>   drivers/gpu/drm/xe/xe_guc_pc.h        |   5 +
>   8 files changed, 261 insertions(+), 32 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 84ad0e949044..93bec17ee0de 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -44,6 +44,7 @@ xe-y += xe_bb.o \
>   	xe_gt.o \
>   	xe_gt_clock.o \
>   	xe_gt_debugfs.o \
> +	xe_gt_idle.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
>   	xe_gt_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0d4664e344da..9e1f7343f256 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -18,6 +18,7 @@
>   #include "xe_force_wake.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt_clock.h"
> +#include "xe_gt_idle.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_pagefault.h"
>   #include "xe_gt_sysfs.h"
> @@ -381,6 +382,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	if (err)
>   		goto err_force_wake;
>   
> +	err = xe_gt_idle_init(&gt->gtidle);
> +	if (err)
> +		goto err_force_wake;
> +
>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>   	gt->info.engine_mask = gt->info.__engine_mask;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> new file mode 100644
> index 000000000000..0060d8584485
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include "regs/xe_gt_regs.h"
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_guc_pc.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * GT Idle:
> + * ================
> + *
> + * Provides sysfs entries for idle states of GT
> + *
> + * device/gt#/gtidle/name - name of the state
> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
> + * device/gt#/gtidle/idle_status - Provides current idle state
> + */
> +
> +static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct gtidle_kobj, base)->gtidle;
> +}
> +
> +static ssize_t name_show(struct device *dev,
> +			 struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
> +	ssize_t ret;
> +
> +	ret = sysfs_emit(buff, gtidle->name);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(name);
> +
> +static ssize_t idle_status_show(struct device *dev,
> +				struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
> +	ssize_t ret;
> +
> +	gtidle->idle_status(gtidle);
> +	ret = sysfs_emit(buff, gtidle->state);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(idle_status);
> +
> +static ssize_t idle_residency_ms_show(struct device *dev,
> +				      struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
> +	ssize_t ret;
> +
> +	ret = sysfs_emit(buff, "%llu\n", gtidle->residency_ms(gtidle));
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(idle_residency_ms);
> +
> +static const struct attribute *gt_idle_attrs[] = {
> +	&dev_attr_name.attr,
> +	&dev_attr_idle_status.attr,
> +	&dev_attr_idle_residency_ms.attr,
> +	NULL,
> +};
> +
> +static void gt_idle_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type gt_idle_kobj_type = {
> +	.release = gt_idle_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static void gt_idle_fini(struct drm_device *drm, void *arg)
> +{
> +	struct gtidle_kobj *gtidle_kobj = arg;
> +
> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
> +	kobject_put(&gtidle_kobj->base);
> +}
> +
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct gtidle_kobj *gtidle_kobj;
> +	int err;
> +
> +	gtidle_kobj = kzalloc(sizeof(*gtidle_kobj), GFP_KERNEL);
> +
> +	if (!gtidle_kobj)
> +		return -ENOMEM;
> +
> +	err = kobject_init_and_add(&gtidle_kobj->base, &gt_idle_kobj_type, gt->sysfs, "gtidle");
> +	if (err)
> +		goto exit_kobj;
> +
> +	gtidle_kobj->gtidle = gtidle;
> +
> +	gtidle->residency_ms = xe_rc6_residency_ms;
> +	gtidle->idle_status = xe_rc_status;
> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +
> +	err = sysfs_create_files(&gtidle_kobj->base, gt_idle_attrs);
> +	if (err)
> +		goto exit_kobj;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_fini, gtidle_kobj);
> +	if (err)
> +		goto exit;
> +
> +	return 0;
> +
> +exit:
> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
> +
> +exit_kobj:
> +	kobject_put(&gtidle_kobj->base);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> new file mode 100644
> index 000000000000..ac0ab970a3f7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_IDLE_H_
> +#define _XE_GT_IDLE_H_
> +
> +#include "xe_gt.h"
> +#include "xe_gt_idle_types.h"
> +
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
> +
> +static inline struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
> +{
> +	return container_of(gtidle, struct xe_gt, gtidle);
> +}
> +#endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> new file mode 100644
> index 000000000000..bc9c59249b6c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_IDLE_TYPES_H_
> +#define _XE_GT_IDLE_TYPES_H_
> +
> +#include <linux/kobject.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_gt_idle - A struct that contains idle properties based on gt
> + */
> +struct xe_gt_idle {
> +	/** @name: name */
> +	char name[16];
> +	/** @state: current idle state */
> +	const char *state;
I would prefer this as enum and while emitting to sysfs will change it 
to string.
> +	/** @cur_residency: raw driver copy of idle residency */
> +	u64 cur_residency;
> +	/** @prev_residency: previous residency counter */
> +	u64 prev_residency;
> +	/** @idle_status: get the current idle state */
> +	void (*idle_status)(struct xe_gt_idle *gtidle);
> +	/** @residency_ms: get idle residency in ms */
> +	u64 (*residency_ms)(struct xe_gt_idle *gtidle);
> +};
> +
> +/**
> + * struct gtidle_kobj - A kobject struct that connects the kobject and xe_gt_idle
> + */
> +struct gtidle_kobj {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @gtidle: A pointer to the struct xe_gt_idle */
> +	struct xe_gt_idle *gtidle;
> +};
> +#endif /* _XE_GT_IDLE_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..90b2d34efe5b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -7,6 +7,7 @@
>   #define _XE_GT_TYPES_H_
>   
>   #include "xe_force_wake_types.h"
> +#include "xe_gt_idle_types.h"
>   #include "xe_hw_engine_types.h"
>   #include "xe_hw_fence_types.h"
>   #include "xe_reg_sr_types.h"
> @@ -287,6 +288,9 @@ struct xe_gt {
>   	/** @uc: micro controllers on the GT */
>   	struct xe_uc uc;
>   
> +	/** @gtidle: idle properties of GT */
> +	struct xe_gt_idle gtidle;
> +
>   	/** @engine_ops: submission backend engine operations */
>   	const struct xe_engine_ops *engine_ops;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 72d460d5323b..e83283cbcb00 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -14,6 +14,7 @@
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_gt_idle.h"
>   #include "xe_gt_sysfs.h"
>   #include "xe_gt_types.h"
>   #include "xe_guc_ct.h"
> @@ -40,6 +41,9 @@
>   #define GT_FREQUENCY_MULTIPLIER	50
>   #define GEN9_FREQ_SCALER	3
>   
> +/* Multiplier for  RC6 Residency counter in units of 1.28us */
> +#define XE_RC6_MULTIPLIER	1280
Keep this in gt_idle and initialize it in gt_idle_init()
Br,
Anshuman Gupta.
> +
>   /**
>    * DOC: GuC Power Conservation (PC)
>    *
> @@ -76,12 +80,7 @@
>    *
>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>    * all platforms.
> - * Xe's GuC PC provides a sysfs API for Render-C States:
>    *
> - * device/gt#/rc* *read-only* files:
> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
> - * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
> - *                  Prone to overflows.
>    */
>   
>   static struct xe_guc *
> @@ -580,11 +579,41 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>   }
>   static DEVICE_ATTR_RW(freq_max);
>   
> -static ssize_t rc_status_show(struct device *dev,
> -			      struct device_attribute *attr, char *buff)
> +u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency,
> +		     u32 residency_multiplier)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	struct xe_gt *gt = pc_to_gt(pc);
> +	u64 delta, overflow_residency, prev_residency;
> +
> +	overflow_residency = BIT_ULL(32);
> +	/*
> +	 * Counter wrap handling
> +	 * Store previous hw counter values for counter wrap-around handling
> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
> +	 */
> +	prev_residency = gtidle->prev_residency;
> +	gtidle->prev_residency = cur_residency;
> +
> +	/* delta */
> +	if (cur_residency >= prev_residency)
> +		delta = cur_residency - prev_residency;
> +	else
> +		delta = cur_residency + (overflow_residency - prev_residency);
> +
> +	/* Add delta to extended raw driver copy of idle residency */
> +	cur_residency = gtidle->cur_residency + delta;
> +	gtidle->cur_residency = cur_residency;
> +
> +	/* residency multiplier in ns, convert to ms */
> +	return mul_u64_u32_div(cur_residency, residency_multiplier, 1e6);
> +}
> +
> +/**
> + * xe_rc_status - get the current Render C state
> + * @gtidle - xe_gt_idle instance
> + */
> +void xe_rc_status(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>   	u32 reg;
>   
>   	xe_device_mem_access_get(gt_to_xe(gt));
> @@ -593,37 +622,33 @@ static ssize_t rc_status_show(struct device *dev,
>   
>   	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>   	case GT_RC6:
> -		return sysfs_emit(buff, "rc6\n");
> +		gtidle->state = "rc6\n";
> +		return;
>   	case GT_RC0:
> -		return sysfs_emit(buff, "rc0\n");
> +		gtidle->state = "rc0\n";
> +		return;
>   	default:
> -		return -ENOENT;
> +		gtidle->state = "unknown\n";
>   	}
>   }
> -static DEVICE_ATTR_RO(rc_status);
>   
> -static ssize_t rc6_residency_show(struct device *dev,
> -				  struct device_attribute *attr, char *buff)
> +/**
> + * xe_rc6_residency_ms - rc6 residency in ms
> + * @gtidle - xe_gt_idle instance
> + */
> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	u32 reg;
> -	ssize_t ret;
> -
> -	xe_device_mem_access_get(pc_to_xe(pc));
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		goto out;
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	u64 reg, rc6_residency;
>   
> +	xe_device_mem_access_get(gt_to_xe(gt));
>   	reg = xe_mmio_read32(gt, GT_GFX_RC6.reg);
> -	ret = sysfs_emit(buff, "%u\n", reg);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -out:
> -	xe_device_mem_access_put(pc_to_xe(pc));
> -	return ret;
> +	rc6_residency = get_residency_ms(gtidle, reg, XE_RC6_MULTIPLIER);
> +
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	return rc6_residency;
>   }
> -static DEVICE_ATTR_RO(rc6_residency);
>   
>   static const struct attribute *pc_attrs[] = {
>   	&dev_attr_freq_act.attr,
> @@ -633,8 +658,6 @@ static const struct attribute *pc_attrs[] = {
>   	&dev_attr_freq_rpn.attr,
>   	&dev_attr_freq_min.attr,
>   	&dev_attr_freq_max.attr,
> -	&dev_attr_rc_status.attr,
> -	&dev_attr_rc6_residency.attr,
>   	NULL
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index da29e4934868..a6abac189c8a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -8,8 +8,13 @@
>   
>   #include "xe_guc_pc_types.h"
>   
> +struct xe_gt_idle;
> +
>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>   
> +void xe_rc_status(struct xe_gt_idle *gtidle);
> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle);
> +
>   #endif /* _XE_GUC_PC_H_ */
