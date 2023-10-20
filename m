Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F9C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 20:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C365610E5E7;
	Fri, 20 Oct 2023 20:31:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47EB10E5E7
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 20:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697833911; x=1729369911;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5C7rYfsspx6YxBCGJO2Rrgf87dN3SwtT1V+o+gpSpDE=;
 b=Y+FTuIzMrosLOBTZ8nFC1sn3dBRx84WJhflwHFBV8q8TzBR98w9D0OnJ
 wPk3sEdZawxabbVc4Nz7yGQ5UZ0fzgjzUkJk3Ub7NI0Rgc5ELEucCExY8
 FmmFIU8okEtCND5TSPIj7hBLmwNn2z3BRW1Fg15MPBlezfeIXQ83TLEAr
 rykGqgvWRIm0oOQ0NkBa0GfNm2e8pFUCMF2VMckKWu/YwPUkOYt6eX1hm
 AQAvcEs8RUpjjOr/3miA8C8gjJbnmkmjdDggJoUzvnI0CuF+k/SJQj+C1
 YHEVUPDydpt0PJGGqYCRtqfTGaYwEqejYmukPGTd1MPicsV6FSS9iCAnS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="366796643"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="366796643"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 13:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="757569573"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="757569573"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 13:31:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:31:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 13:31:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 13:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHlvYylAK5RmW+MBq/vJZMunt3VuJPY69NGauP0vfmyg3QTEY82yo3+SSbMnvgKaTuRyvqLByZCPrKezBL6K97D+Qhp0NyxVSC8MT0nxPGSyeiMN7B6oj4niKkvBTDpX4FChMMic2S91QumfTX6JY8kpWaA0OMIqB+IRrWK7VaiRkOI6EhiVnAKHEzYeX52TRoSIvuJtM1ImCnnGiu7CEL4koHpSPwZNi5VSSz8Osnnxgg+AEtoInEH5mwTIAhEb0kcYDvGjT961ynxfaRrXDh877hPWT5zditLRZDTRFn5jgeoo1BO1e5k5XIo3CElL2D6UNyW4apXQosHKRjasFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uzVwVayk+U+R02KS3T5pOWMM3VXiwye55RMp83gKbQ=;
 b=fPDg7QMsXB4nQN8aT/v3naom20nTiimnrQZsOdunK/bjWgjgpMYGVafvR1keDmPRUGDNVsKYhdW7RwAEqUUabFix5/oBAaFN5ysdO0N8lLNobYEsoTQDqH8Epyo2xdE0bG2oYwUtJDz2yXUTcXAjzJZI4Lr34QI3Ef4/rcWlbJhZ+63K7n9S9WymE56T0boBr22Z1xO8b2bqWk2qwikoKUIPqVzbjMKJIDheu9JaITSzFcUSgZD/yut4x0BhlaqxOcIq6QrR2vRYaY2P721ejzaMAEEIaOf70/PNvOP7YWfBndwT1C+FN6nd72rjaKZ7orRncDRg/UK36fTtGyFVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 20:31:43 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6%6]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 20:31:43 +0000
Message-ID: <f5212ef2-6cd5-4b1a-a1b0-422dd0e10063@intel.com>
Date: Fri, 20 Oct 2023 13:31:41 -0700
User-Agent: Mozilla Thunderbird
To: <priyanka.dandamudi@intel.com>, <oak.zeng@intel.com>,
 <intel-xe@lists.freedesktop.org>, <janga.rahul.kumar@intel.com>
References: <20231020045013.2042971-1-priyanka.dandamudi@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231020045013.2042971-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0033.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::46) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SJ1PR11MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 2601524f-69d3-4be5-fc79-08dbd1ab9295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gURxMRm1JCpXKnMaWXWjgZ2UetUCpaf6qPnQ8rhMBSH2oXykFCW8e5e55mnlZolz7Z/WDzE2Pk5Mak+5T/ZwskY671ghQLdAe40GFStSu/v5xOv8kspHsHdMlCp/eZLvdgccx7WHttOsP4s4KPiJWc9Zr8q1PmqBJL8lL2D/7EyfB1JjDJRP28zB8GAnWPpGlTMfid7tR6Qb4TEOODLBCHIPyHpi3AdGsJMG9K8fTnrH4q13aQaE0XXF9SedjDxl/ywWNXXIebCXMvCsU1zS89XcXheJAh6FeA7bZrbMq3o0g7bvvcWCTjpQPE2nALqMebpYyM3utcKSjFKB9RsCJd9bN+fzPoB0FvteuKvabIPkp6C5QbKD8feOzhRT8Zhtak0apawxxyt/Js5d4un2jiurh7sHIv/eqIJntPIb1DLcx6/jVFL57Nfsug9RVDhrvlW3ykNN0u8/WYLz7WpULSrISxpzDWTEjF54VAoHfK0iUxpqvOYcYorWeGWrAuBm3NO193kj7j59vgyTaKvG7WTFZU/MILhM9s93MFr0uNAQ+EnHgElg2OopTIyIKi8uOL19EBpl9uG0x3jTlJaNX11e6ukoXWkW4WDJxiFMmt6FmEocrpWnHcPIcmtvlxQWYikXdAQCU8F8Zt28bSSeYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(39860400002)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(36756003)(31686004)(6512007)(6636002)(316002)(66946007)(66556008)(66476007)(31696002)(86362001)(2616005)(38100700002)(82960400001)(83380400001)(53546011)(26005)(6506007)(8936002)(6486002)(2906002)(478600001)(41300700001)(5660300002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UitoZEZiL3NoRlN4TnVEYmxJNHpmblJGRjQ0dncvYzl3R0ZRaFRmbFZhOXdi?=
 =?utf-8?B?L3MxTWdGQWZEUVo4d21tdXY2aEw1c2hOZEZqYzB0azdVbFVibnlJbzVTZ0ZZ?=
 =?utf-8?B?MnBlMkRTWDlCU3ZOTGNOY2Zqa0c4cG5EcU5pWlRyZFFPUGVuRkRXaUJ3YXdZ?=
 =?utf-8?B?Y1MrV3dWM0lHK0dIaGh6ZmpUYzRlYnNnRW1kbmtsMTZsZnFwaEgwalR6NUVt?=
 =?utf-8?B?ZDN0US80QlJkeUJXN1pYYkh4YWlVUllqd3IwREdjaTZGSkdQc1daWUxSbEhj?=
 =?utf-8?B?ZnBoVHorcStRN2JWUWREUSt5RFdENmhqNDFRM0xSRDBaYy9LYUNXZDcrRmVn?=
 =?utf-8?B?SWN1QXZaeStaV0xocTl6dEhMWkhndlhHbWhMY05xYVNEMC82Rk1MMjdkc2ZY?=
 =?utf-8?B?OS9nTXM5SnlRcWt4emhVclI2OGlsaVRGZG02K2dhT0FGMTMycmpKa2o5d2ND?=
 =?utf-8?B?V2lKaGpQWnRQRzZ5c1lUY3ZXR1hVSWYxd0w1NU1PMFFoMmZmSXhTUy81R3JO?=
 =?utf-8?B?V0pUZklBQTJVYmp0a3g3Q3VCM2I0UGxwZzdGV0VrQjFSOWVBRlRLTmdIMjJu?=
 =?utf-8?B?K2tQdTBUMnNuL2plTzc1aWFXR1MwNWZnME14aUtXOW81UEZzVklmMzcxSWgr?=
 =?utf-8?B?NkNxQzRaZ3IxdHVuK0k4NVdwUC9NTXQzLzB5a1NuUVZRZmI3ejdOTlVQc0Zm?=
 =?utf-8?B?ZGJyOXh5ekl0Wk5JNDdvVEJpZWNDaDdQcU44UFFULysyc1hrL3gvdjZodndI?=
 =?utf-8?B?aEN4aXY4ZjYxNDBQTE5DOEFxYVlXQnViVXhSdTYyeUpLd1I2K2N6VkZpajZ6?=
 =?utf-8?B?WEVzT2UyQUlnZGlQeVcvZk5uN0JRdjZoTnY2ZVh2N0V2cXpmaVpjdkxPWVRz?=
 =?utf-8?B?WnZsdmE5QlQ2TmhjNDZJM2xpS2lmQkZLYTZ3Mm1MeVJjMTRvYlFEQ0hGZkZQ?=
 =?utf-8?B?bjJObFFsd2JQNnN2UXNXMUEwdW5lNmYweGhoSm1sUHByY0FGQ0NzZFlzTVFa?=
 =?utf-8?B?ZDQ2NStrMExJdlg0NGNPYlJ1NGNlYVYzRVRzSHZ0YUNTcE1RRmNtOTRUWll6?=
 =?utf-8?B?YzFTeVFWbmdOb1R3Q0YxTW42M0VkeU81VVlDZzloU3Y5OG41Q3c4SkVVZzB1?=
 =?utf-8?B?VmEzQ201UUc1ZWUxcGt2aFFFbElNWDZoV2g2dVM1bklZWENXUldqSXAyMU5V?=
 =?utf-8?B?Z1lDb2pJdGVPRzJDOE5mQndxTnF1Sng5Tk02SGxjTG9vM1hkRVBqV3ZkYUM0?=
 =?utf-8?B?TXYxa2hJUURxNVZ0Z2h4ZmNBWmhwRUdwa2dPTnFvL2JzcjNJczcrc1k1L3Rm?=
 =?utf-8?B?MFpRcVkzTjdNa0pzcXJrY0tjODljT3dFK2RPbFFjRUdSS2tkU3BmeE56VHcr?=
 =?utf-8?B?akkralZqdVR4b0ZGUEZDcGc3bUc4TTdxdXFpKzBucTZ6dWtJZTlYNWdLV1pr?=
 =?utf-8?B?L3JrSTA3LzY1LzRrSUVrSy9QUG9STGtTWUFUUkd2d1ZoUy9rM1VDV3hBNFpZ?=
 =?utf-8?B?QUdVeEVpYzRVQ2p1Y20xZGlOWXFpNy9lQjQwYUhON0c4aXVSY0tRWXBCSElK?=
 =?utf-8?B?cDB3V3NIWEQ1YXZRVFFYU2QxajJkUjEwNTBTMmtYZUhKOXZQdm5qOHg5OFI2?=
 =?utf-8?B?ZFdMYjFHYjJSRnpkelV1S054SmNtNUQ2QWhjeTBiMzhmUEJpSllWQ1hMSWhP?=
 =?utf-8?B?VTROSzJrNWJBNFFUZHJDM0ZVdTd6NytKYnBlaGNhblBUYnR4cjJ3cm5pY0FB?=
 =?utf-8?B?eU15NFZhSjNPeGE5UWo2aU10Wnc0WlVpSjdVNTBzYWU2UkdiRWxIY3NScllv?=
 =?utf-8?B?ajFIWXNxbE4rcHorTUhMZ0ZiazgrMDk2SkJhM1dOekkyT3IzeHZGT2VEbWh0?=
 =?utf-8?B?TWluc2tDZ3c0ZDJWOFhQaXNpTkxwVzZWbloxUktYQkxyUFdwZWU0ak9GOVYx?=
 =?utf-8?B?ZDRTVHFTV2NrcCttc04xT291ZTVEcFVWTU9FWERVZUc4MFpYUVVlZURyb3BX?=
 =?utf-8?B?VmduTHJPQnE1cXBIV3R6MUVGSG1xSGVYbWxqQzlETi9hRFNSSE0yZjAwdkhU?=
 =?utf-8?B?Q1o3VGtqbkMzSVQ2dnpzN1FuWE1VaitDdEt3NzkrY05TaVNrb1o4S05RS251?=
 =?utf-8?Q?Yb/CKBosnVuJLMXT+n+v2BWmT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2601524f-69d3-4be5-fc79-08dbd1ab9295
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 20:31:43.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2kyW2bbP9k0hj64TGL2/Trdt0r3rgxXhe2fqffSvw+QJ2WtPtA0hyBXy6a6w1lUmzbl3rIbm89c9b6I0BR8Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6204
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_exec_queue: Add check for access
 counter granularity
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


On 10/19/2023 9:50 PM, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add conditional check for access counter granularity.
> This check will return -EINVAL if granularity is beyond 64M
> which is a hardware limitation.
> 
> v2: Defined
> XE_ACC_GRANULARITY_128K 0
> XE_ACC_GRANULARITY_2M 1
> XE_ACC_GRANULARITY_16M 2
> XE_ACC_GRANULARITY_64M 3
> as part of uAPI.
> So, that user can also use it.(Oak)
> 
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Reviewed-by: Oak Zeng <oak.zeng@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
>   include/uapi/drm/xe_drm.h          | 5 +++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index dd61c4267e24..4fd44a9203e4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -393,6 +393,9 @@ static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_q
>   	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
>   		return -EINVAL;
>   
> +	if (value > XE_ACC_GRANULARITY_64M)
> +		return -EINVAL;
> +
>   	q->usm.acc_granularity = value;
>   
>   	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 24bf8f0f52e8..8b5e7e212f61 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -126,6 +126,11 @@ struct xe_user_extension {
>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>   #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>   

Maybe it's obvious, but I think nice to add a comment here before the 
defines,
/* For use with XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY */

> +#define XE_ACC_GRANULARITY_128K 0
> +#define XE_ACC_GRANULARITY_2M 1
> +#define XE_ACC_GRANULARITY_16M 2
> +#define XE_ACC_GRANULARITY_64M 3

And a bit better to place these further down below, before the 
drm_xe_exec_queue_set_property structure is defined.

-Brian


> +
>   /** struct drm_xe_engine_class_instance - instance of an engine class */
>   struct drm_xe_engine_class_instance {
>   #define DRM_XE_ENGINE_CLASS_RENDER		0
