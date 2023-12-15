Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A95FC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 02:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF11C10E318;
	Fri, 15 Dec 2023 02:48:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E352010E318
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 02:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702608497; x=1734144497;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eUZwP5FSqAckiPjq3H/Z+dQaf3V48zj2OzMQKX21bzs=;
 b=HQGocODvo8gnrbAOOCiHLf1MI2Ig3xVsDvF2RsD4bDBd5LzJv+vS8e65
 lnphtQkuQCSOZ23MebYlIb/K2FfKQ8/ceiOXJkJmYQ/ULbOHBEZEVH9OP
 gqiFotPgoBj6YngHeIjtMd/EW0ATWqtKnfylPBeoBGvCbL7l4SOEyYHNU
 jaty2vWPN/CII+R8hEHQ6V618LSl+jwWnRvJI6LmVkcyw2UEmmdxckPD6
 YF5gRS1qhgBAY44u5x/Dlk3Mql9oC/l6yUnMvDp/ak5nUzsaDE4UyXYVA
 kzjefy2HwtiVACvwB3aKkj+JvqKxg2rO/7B7D1euvnKmmo1cgAtU8s4iV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394963040"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="394963040"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 18:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844968053"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="844968053"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 18:48:16 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 18:48:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 18:48:15 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 18:48:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOwDBlKzlelmLuIV9pKYdk6W3DAOR/8TZWiCERMZg9uhKzvDiTugwD2gABT2S3GMsj73Xpa4e7sFCQ7lFnsjRV/K8jxiuuSGzhHhZ5VONChF6xeSCzoNWcSNnZvzcp8F06RJBPSoSV9K1XhZkjrJsUs41DAFbT/JiABo2lvmtyAuoLnO5NB5cJIRKRq7NOeLFkC2eSYTg0FrxQ3mlk1p8qSO2iXcWN1KSVr+25eiIafI1nF6rCnW6T7kQ3/tJhP+nfguh0zTRSidW068+RP5GJks4FuDYqWIR92wSxkeKaNyDS29hRS1GaaZznc89eldBw/ZrdyTYQVmHDNYcAcRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsfFVyfMXPSnT8ED4bpd8J/X+gmOfLkofyOy0QUwnPA=;
 b=YGAUEkRYW62ilydxWf7n+v5L4jqEsIolAzV9+DUCSOnkqq+1i0VX0h6j0QdLdLaxsiIK3Qg/DYMoCmfecIWP8g26v0n3BH8bQwjBduFurEZfMhiUwCj6jmbwIZhsWUE3OPOQwtsmzEPsq3UneidsxXCJjUH71vOx9DimvmWQv6R0Mx7aaClV3iQiPfCWW4dGX+Nkq3/HHcQlXkSg1xhkq0SajOjcPMyzds/uT25XHQ6go4XiO39rQYAtXyPwpaffHJbgWKsBEeZBF5idlGup7Uazs5IwBmnr7xWnjVrLCdUPqRshtInLUADTYRNTmcagAZbaDozDkOJ2XxklafRjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 02:48:12 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 02:48:12 +0000
Message-ID: <b5db65e9-75a3-47d0-bcae-0b29f1d7cc76@intel.com>
Date: Fri, 15 Dec 2023 08:18:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] RFC drm/xe/guc: Add interface for engine
 busyness ticks
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231214113144.251726-1-riana.tauro@intel.com>
 <20231214113144.251726-5-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20231214113144.251726-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 2367aab7-a06d-46ab-095b-08dbfd18479a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Q7lbKk3aJdF9cgIhtx6drmiyeTkfXxQF66W0MRqC84hzDspJzFCsEHP3O/5N5UZJx2VlEPJn4ilzizKukcmqldNAZI/nRt07hF6abFqq+v0p2KrSxkg7cZkqd4dBPzfvHFHsZwIPR6rI3lryFYutiBIZuChxoCe6d0dI4YhFxWqKGsYqGC0ZXczGsiBQsvgTGGDO9tCBcQJuzS2es8kPmbqrIFs31cyW/wtpSLsFCll1JW/KqXZHBWlIFe6nQhwPX0SjjEHgoGkYWPNLKDddH5hbG63W0kwa16L6lF9+BXWHB3wdydBvwRZ0SQO0KAEaU+fbNrHtjCkmAsbEnQYmq6iZtxE5sh/QXXUJRJX/zX5rsM2bCKf6is3i/IhHWTGkEuRPGSGJ36vEq+lKt9cBk9FpwXCwGIDvunzfgen1VYE7RrL1i9zGzykD76/CB5aPniW6TG8CLKt9VXVE0V+Go7dL0fnrfZ5V53qbhP3v+fvOpX0zwCdCjDgWoZHOFRCY8WVtu7GaK2A5PfXYaKOlqMBw4yBZ5psLL8KBuGLJT834E0vk1dxUfTK0XvUbmRLmw2bmDZGYPHRbJXXCx1HFbbxPgBGfLNMliqGBygzi+zBO6VvbL4O8ThYX5bsFn36wjgX/kbHlSOuCkTvBBwfPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(36756003)(86362001)(31696002)(82960400001)(38100700002)(41300700001)(6666004)(6486002)(8676002)(8936002)(478600001)(6512007)(53546011)(6506007)(66946007)(316002)(31686004)(66476007)(66556008)(2616005)(30864003)(26005)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVEwZmFpT2N1QTM2a3FnMXpGVk1BMGZ1RWhoa3Q3eWc0V3U3SmM0MnZUL1V3?=
 =?utf-8?B?MjBZZFJFcW1oQUxndnRvQ2ozeDFEMlBVNmxSdGFuZHN2bW5SNjcwYUxFSmpk?=
 =?utf-8?B?WndBRzNWdDJSZVFrbC9MNkVjNWk1WDZwREFhSGoxNUY0LytnQmVEM2xERzg5?=
 =?utf-8?B?TXNCTE4ycHB4QWIvWGFQcklBcy9hOG91WVIremIyWjZkRm5YWjJZWmM3dnk1?=
 =?utf-8?B?cFVwNjNBVW5sejYvM21LcFVEWStjK3R0S2wxdjdwMDBRb2QyTWJ2RDVIMXgv?=
 =?utf-8?B?VjVwSldxSWhMcjI2ZmdxNDk5SjAvcTFBY1BhWXl3T2JjZkFFNEJQdXlDZkRL?=
 =?utf-8?B?S1J0Z2lETmR4Tkx4akdkd3FKSC8wMklDa0dqTk9UMllkQUhIL3BCbHg2aitz?=
 =?utf-8?B?TkVESDh5Z01NblFpNkhiMGV0aTdwdG5TdjhLOVgyNy9pa2xJVWtLVlNYVWtO?=
 =?utf-8?B?ZGlaWjRZYW1nWjl5WGRWWTY5SVlkNis2R3JkOGtTNy9iT085MUZROWdKTUpi?=
 =?utf-8?B?WUtkWC9ZZy84M0syR2NSM25ybnRBVEpjVVVmVld3ekV1WlBsT3h0MHZocEVw?=
 =?utf-8?B?bEhqcXQ1eWExVUhGb2orQ1VDV2FKK21kS1hOZlNNU3lSaEVjaGF0RHRUQVIr?=
 =?utf-8?B?ZSt0N3FvTW4ySHBRTGxnb01KTWFiaXRQZUF1alZMaEZSVzVsRVB1RVkzVVV4?=
 =?utf-8?B?MVBsWWh5VzZRU21MMUdwdC9uejQwUmZGRkhHWU9RQ0JvS2p1VVowS1FrV2ow?=
 =?utf-8?B?WDhTNklyKys4L09NRFJqTkVBRU5ZUExsR0YwVHF6ZDl4SWU5a21UYzA4NVdp?=
 =?utf-8?B?djNXeVJSWFhPcmI1cElPamlFNzVycm8vWXQ3YXVWMjhMcEtwNmY3OWxUMHAr?=
 =?utf-8?B?Uk1pa1prU3pxR0NrUHMzRm5DVGFISDV0bEhHRTBHR1pRZkczM1B5eFFHNTN4?=
 =?utf-8?B?MnR2a2h2bDhvTzR5dXY0SWlVRXhsVmFsSm5meXFhUFJyTGlMY1lBck5zcXF3?=
 =?utf-8?B?WnMvNE1mdTVzeWJka2VMbWIyUGRVNWJlaGdzMGVjdklmOXlNbVNCZVN2b21C?=
 =?utf-8?B?dlpyN09UV24walFKYTZkcnlYYzBGaDFDVU45QUFjRGgwc3FrMVkyUldkTmtv?=
 =?utf-8?B?eG9ybEVVbFBOZ3Q0dE5qZ1hzVFVrVlJnSVBZWkxDdllrSzdBeTVMUG9yc1Nt?=
 =?utf-8?B?SjdiM0xhR2wvUjNwZlVvL3pRZ1kvTDQxN0dqZmxlYTRGWmEzVVoxdkhnNFla?=
 =?utf-8?B?bFZHdDRxQ0VJZjJ2cVJkK1J2eUlKenVXVzlCKzU4Tmx1M2poRnVlQ1RqamxV?=
 =?utf-8?B?RzZJcmtsVklNZm0zVEVZWmVQWXZCZ0g5UkowZFZ4MkV6TlpoN0UxZjkyOVB6?=
 =?utf-8?B?c2p0RHJIOHBndllxR3duQk42OWgvMDhFUHI4OWFPenJzL0h0RUJGQ2lXL1lX?=
 =?utf-8?B?U3NabHJLZXdCcDVQVGQ1WlpSK0IrUVBPSCtOSzhlMnVhZDEvbklLcy9xRDFV?=
 =?utf-8?B?Q1RheVBSTHVvQU5uSXMrZTFra1lNQ2RhMUk3TGJUdDVMWWExUFQ2UDdqdk16?=
 =?utf-8?B?QVNWVkVKNzBJQjV0ekJnSlkzQVF1WGdRN0Ivb0VWVWc2WDJnWXA2YTNIY2R5?=
 =?utf-8?B?dWtpZGdwVzZ6R3psRmZMenZJR0VPLy9wWjI1Qy9PVnk0UVdSOWdod1ZXR1FV?=
 =?utf-8?B?OG4vMjlGbDJsTHlqcVR5VUN4NUQxVVlTSmpRRE1KNkVKYXdZVm5ZMHlSRnJV?=
 =?utf-8?B?Ty8xdDRjcmNpYytxeG1TVVFZOFBUQ1J2ZmY5d1ZjSXJOWWI3Vkp0ZHhzS0Fi?=
 =?utf-8?B?bUx0a0NZd1lUQmplZkJmU0p2TmExQUJ0Si9Ld0FMV3JGY0I1MTcrMEtUbDZY?=
 =?utf-8?B?L2tyOW1VNkMzbHQrNmNnQ056cVl5dXkwSlQ3bG43Ykt0S0xpdCtmNTlZem9K?=
 =?utf-8?B?dlZlQVl2NUdyaTUvYjFCOHUvZ1IreWg0RHZ1Q3ZHTU9CWTJNcUR2SEZRUVhU?=
 =?utf-8?B?TzZNWEVaWnFEdlRWRTBBTndlYkZFd3RSWUVVMU5hQkNJZjlrY2xjSUpEZXBr?=
 =?utf-8?B?a1JvdllBWnllQ0xvcXFrYjd2ZDc3dy8reVZnK0M4UmtGODJmcVQ5QWNQZG1U?=
 =?utf-8?B?N3lYR2lPUEJGMmlBbjBOTG95ekhKZkhkUCtTY0lWL05lS0pnM3NycFdNcUUv?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2367aab7-a06d-46ab-095b-08dbfd18479a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 02:48:12.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQzRDi2CVCgFN2S/ONgyILwP+ZiqcTtA2xpR6uziRwQjbq4UwgyiRv4nvlYPuSL149JveFF1bMQb/2L22L65zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 14-12-2023 17:01, Riana Tauro wrote:
> GuC provides engine busyness ticks as a 64 bit counter which count
> as clock ticks. These counters are maintained in a
> shared memory buffer and updated on a continuous basis.
> 
> Add functions that initialize Engine busyness and get
> the current accumulated busyness.
> 
> Co-developed-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                 |   1 +
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
>   drivers/gpu/drm/xe/xe_gt.c                  |  13 ++
>   drivers/gpu/drm/xe/xe_gt.h                  |   2 +
>   drivers/gpu/drm/xe/xe_guc.c                 |   7 +
>   drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 153 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  17 +++
>   drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 ++
>   drivers/gpu/drm/xe/xe_guc_types.h           |   6 +
>   9 files changed, 215 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b0cb6a9a390e..2523dc96986e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -85,6 +85,7 @@ xe-y += xe_bb.o \
>   	xe_guc_ads.o \
>   	xe_guc_ct.o \
>   	xe_guc_debugfs.o \
> +	xe_guc_engine_busyness.o \
>   	xe_guc_hwconfig.o \
>   	xe_guc_log.o \
>   	xe_guc_pc.o \
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 3062e0e0d467..d87681ca89bc 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -139,6 +139,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> +	XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION = 0x550C,
>   	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>   	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>   	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index f5d18e98f8b6..9c84afb00f7b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -32,6 +32,7 @@
>   #include "xe_gt_sysfs.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_gt_topology.h"
> +#include "xe_guc_engine_busyness.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_pc.h"
>   #include "xe_hw_fence.h"
> @@ -794,3 +795,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>   
>   	return NULL;
>   }
> +
> +/**
> + * xe_gt_engine_busy_ticks - Return current accumulated engine busyness ticks
> + * @gt: GT structure
> + * @hwe: Xe HW engine to report on
> + *
> + * Returns accumulated ticks @hwe was busy since engine stats were enabled.
> + */
> +u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe)
> +{
> +	return xe_guc_engine_busyness_ticks(&gt->uc.guc, hwe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index f3c780bd266d..5b4309310126 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -42,6 +42,8 @@ int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   
> +u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
> +
>   /**
>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>    * first that matches the same reset domain as @class
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 482cb0df9f15..6116aaea936f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -18,6 +18,7 @@
>   #include "xe_gt.h"
>   #include "xe_guc_ads.h"
>   #include "xe_guc_ct.h"
> +#include "xe_guc_engine_busyness.h"
>   #include "xe_guc_hwconfig.h"
>   #include "xe_guc_log.h"
>   #include "xe_guc_pc.h"
> @@ -306,9 +307,15 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   
>   int xe_guc_post_load_init(struct xe_guc *guc)
>   {
> +	int err;
> +
>   	xe_guc_ads_populate_post_load(&guc->ads);
>   	guc->submission_state.enabled = true;
>   
> +	err = xe_guc_engine_busyness_init(guc);
> +	if (err)
> +		return err;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> new file mode 100644
> index 000000000000..287429e31e6c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include "xe_guc_engine_busyness.h"
> +
> +#include <drm/drm_managed.h>
> +
> +#include "abi/guc_actions_abi.h"
> +#include "xe_bo.h"
> +#include "xe_guc.h"
> +#include "xe_guc_ct.h"
> +
> +/**
> + * DOC: Xe GuC Engine Busyness
> + *
> + * GuC >= 70.11.1 maintains busyness counters in a shared memory buffer for each
> + * engine on a continuous basis. The counters are all 64 bits and count in clock
> + * ticks. The values are updated on context switch events and periodicaly on a
> + * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
> + * a caveat that is not real time, best effort only).
> + *
> + * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
> + */
> +
> +static void guc_engine_busyness_usage_map(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  struct iosys_map *engine_map)
> +{
> +	struct iosys_map *map;
> +	size_t offset;
> +	u32 instance;
> +	u8 guc_class;
> +
> +	guc_class = xe_engine_class_to_guc_class(hwe->class);
> +	instance = hwe->logical_instance;
> +
> +	map = &guc->busy.bo->vmap;
> +
> +	offset = offsetof(struct guc_engine_observation_data,
> +			  engine_data[guc_class][instance]);
> +
> +	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
> +}
> +
> +static void guc_engine_busyness_get_usage(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u64 *_ticks_engine)
> +{
> +	struct iosys_map engine_map;
> +	u64 ticks_engine = 0;
> +	int i = 0;
> +
> +	guc_engine_busyness_usage_map(guc, hwe, &engine_map);
> +
> +#define read_engine_usage(map_, field_) \
> +	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
> +
> +	do {
> +		ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
> +
> +		if (read_engine_usage(&engine_map, total_execution_ticks) == ticks_engine)
> +			break;
> +	} while (++i < 6);
> +
> +#undef read_engine_usage
> +
> +	if (_ticks_engine)
> +		*_ticks_engine = ticks_engine;
> +}
> +
> +static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
> +{
> +	u32 ggtt_addr = xe_bo_ggtt_addr(guc->busy.bo);
> +	u32 action[] = {
> +		XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION,
> +		ggtt_addr,
> +		0,
> +	};
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret;
> +
> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret)
> +		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
> +}
> +
> +static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +
> +	xe_bo_unpin_map_no_vm(guc->busy.bo);
> +}
> +
> +/*
> + * xe_guc_engine_busyness_ticks - Gets current accumulated
> + *				  engine busyness ticks
> + * @guc: The GuC object
> + * @hwe: Xe HW Engine
> + *
> + * Returns current acculumated ticks @hwe was busy when engine stats are enabled.
> + */
> +u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> +{
> +	u64 ticks_engine;
> +
> +	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
> +
> +	return ticks_engine;
> +}
> +
> +/*
> + * xe_guc_engine_busyness_init - Initializes the GuC Engine Busyness
> + * @guc: The GuC object
> + *
> + * Initialize GuC engine busyness, only called once during driver load
> + * Supported only on GuC >= 70.11.1
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_engine_busyness_init(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_bo *bo;
> +	u32 size;
> +	int err;
> +
How about adding guc version check here and places applicable.
I am seeing patch 8 handles version check but how about moving  version 
check function in this patch only. This will also align the code with 
the doc.

Regards,
Badal  > +	/* Initialization already done */
> +	if (guc->busy.bo)
> +		return 0;
> +
> +	size = PAGE_ALIGN(sizeof(struct guc_engine_observation_data));
> +
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +				  XE_BO_CREATE_GGTT_BIT);
> +
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	guc->busy.bo = bo;
> +
> +	guc_engine_busyness_enable_stats(guc);
> +
> +	err = drmm_add_action_or_reset(&xe->drm, guc_engine_busyness_fini, guc);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> new file mode 100644
> index 000000000000..d70f06209896
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_ENGINE_BUSYNESS_H_
> +#define _XE_GUC_ENGINE_BUSYNESS_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_hw_engine;
> +struct xe_guc;
> +
> +int xe_guc_engine_busyness_init(struct xe_guc *guc);
> +u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 4dd5a88a7826..c8ca5fe97614 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -37,6 +37,7 @@
>   #define GUC_COMPUTE_CLASS		4
>   #define GUC_GSC_OTHER_CLASS		5
>   #define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
> +#define GUC_MAX_OAG_COUNTERS		8
>   #define GUC_MAX_ENGINE_CLASSES		16
>   #define GUC_MAX_INSTANCES_PER_CLASS	32
>   
> @@ -222,6 +223,20 @@ struct guc_engine_usage {
>   	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>   } __packed;
>   
> +/* Engine busyness stats */
> +struct guc_engine_data {
> +	u64 total_execution_ticks;
> +	u64 reserved;
> +} __packed;
> +
> +struct guc_engine_observation_data {
> +	struct guc_engine_data engine_data[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> +	u64 oag_busy_data[GUC_MAX_OAG_COUNTERS];
> +	u64 total_active_ticks;
> +	u64 gt_timestamp;
> +	u64 reserved1;
> +} __packed;
> +
>   /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>   enum xe_guc_recv_message {
>   	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index cd80802e8918..4e9602301aed 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -70,6 +70,12 @@ struct xe_guc {
>   		u32 size;
>   	} hwconfig;
>   
> +	/** @busy: Engine busyness */
> +	struct {
> +		/** @bo: GGTT buffer object of engine busyness that is shared with GuC */
> +		struct xe_bo *bo;
> +	} busy;
> +
>   	/**
>   	 * @notify_reg: Register which is written to notify GuC of H2G messages
>   	 */
