Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C8C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA66C10EE84;
	Thu, 27 Aug 2026 06:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGERYHKA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553CD10EE79
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 06:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787810950; x=1819346950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wgww1ejTp088bIxW0BoTwov0kebrvO03rm70ojoSf8E=;
 b=LGERYHKAE1Zfe8X2hy5v4QWIGgwqID4zRNasKy5KsqZ/lUXlAVHYlK/P
 oHbzVni5uXb82stCiIRMd8COcDhf0pGoDxUvUbbgwSUpHlENU0ARm1g4a
 0/WaagY2/U7p2KKhB6wsjYKcH4J0IAdvn/Utu4SL9tFucbPUpLdSzHaqG
 IbEMSxfO22D5Kz8EwbFb5bFy/c5XKJGiHcJIMjc9YZLac6j1+cbqEOSvg
 tMNUVlMTarwdVtaVZ0TKci6i/APMKNy349Xl4sbZly7r6IP+nvCs0ieIq
 f5h8CPiYor2NgKXNjt/n2kmGVHsO14CzykeRc3EOcmCEQTz4SSguq4UOe A==;
X-CSE-ConnectionGUID: Xw0M2siIRzG+9DPliDqtfw==
X-CSE-MsgGUID: 3Yp8gZolSHyJDtqpnNS6rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98638140"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98638140"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:09:10 -0700
X-CSE-ConnectionGUID: UPihwhTwQcW9ikF/mSxvnQ==
X-CSE-MsgGUID: 4Nl33PyFQ/21GVONzRhQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="271992347"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:09:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:09:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:09:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6N9DiBuBnrKOUkaz3WWa1oHxuisiVMwzswYxrIqOMUhpHqV2rGJ3NQ79AsylbeKXuBn5/W1urQjJ7uo74tRFRhagRIqi7LGtFgqaHyZncJ6rhA4TCJc/msGYuQOlb/UTvWlyJ/IJwcgQCNwVg2MkWRtkJNiIDSpBgwwhrC3RxklbU9lPR0HL4vjY5ch/xX5+UMJSkUOr5pUrlMnNR+7Sp4KJcuajBRMLH6+U2nyh16lg7YHVKh4ZvGgt8BjQwY4xpGdsUywnKPhyCYZCRA+W45KrkoDlKJEsXpvUkMEVTL1NUq7CUkh976CdT8N9ZMwZIPJIp3myf2IJqXDaObW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKZEvO+PZF7omqLrAhjpZwIQPA9L+7Kk7OSfet4LgVU=;
 b=oRrFjUf9u1NJ48mDeOK+71PpDipZ10KiTuhKAYxSKDB4ThLwxWhzdOq9XklqOzfj2ORMOA/ZwGfiMzIZuzpZhKZGJhhEgLtmnEpv+p0wGzwdKjbAUDT6d2c8Fs1RuZ/DF3Q7PXdPwIKMiilFG5W52kbGl/5jKPVtDJG/c51sigJUQ8ZYjU5dUFQ0d7QpeH8Dttm8P+fqzwjLYy2paKaPmmMKg3utEs+Cc2h1/ZuLBwrJo2vDjElbYMdPrW+MeHEDeHNzh/qs9ksNtpFpbaon87EPLE0ZL6+rPCQN2fKAzxnneqaSh3ZH0b0TzyXRqJTUzI2Yo5VNaShXDkqPrRk4XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS6PR11MB9920.namprd11.prod.outlook.com
 (2603:10b6:8:464::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:09:05 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 06:09:05 +0000
Message-ID: <18bdabbf-855e-43ed-ba99-94adeea35a26@intel.com>
Date: Thu, 27 Aug 2026 11:38:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 05/14] drm/xe: Guard teardown paths against purged BOs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-21-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260826135136.204044-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS6PR11MB9920:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f719ae-7987-44e5-4f84-08df0401b2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 19BTtpE5A8UiGtKn4jzj5rGY65gw+H/vKlXnsmsf/e/05Bn1OlZyfmWqWsYnvWBjkl8oJ5/HV5emIM8aESVf21TkrOYXUcMeOq7aewNVLcJDMYe5m/MHKDWYIXiDl1WSp7ByCa33O1bYHh6daBdP11yfKIn31NIzowkwXBGYxfrEtU9lx562/qyE0kLuDJCC2Y4aZNpZ9wVBuzvLzHWLsaTQdKzBlk6cpfW+KquE1yaWhUBlUsrHEvae7WMOkGUi0stZQ/F3LdanlV/KyBlzbFPKdfANvC8mVvyfT02pPPLNkvzISNW4X1GQlXsYRNndkai/fm6X/d2cxIUpU3Fge51g1wDbMTzs4FWVyU/ujVLvzylTWxfyd8WHbu5iJitP4Nr9LLZLl4Ki90sgDg7BhAx1WyNsQRvHW9l3+FqvNoOnv9aXHhxV4NsmHIq37Yrhpgk0Sm6Sy2wPYBf4QUVpKkAydtSJibUkhlruUpEnaRyzQwaacZemqtZduvSQ1Kk75x+4KmeJNM0reFOFLl+eMS3X2fuV+fzRIJ+LiRa12O53pECLxXZhcT90gbErEUGnsA0w9o/KTmSvd2ifmGlnQM8WXZJO39BD4+/uLKlSbO0chlgR2GArI450T9djRY0ksZhLW1iUTmW6vlAtg9fW1KL+GY9QDoqsLbGF0Ugo2Ow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXJVenU0aFFsYjVBNTl4d3RJYTZiTm5YSURTdkt6QkwvQ3V3M2ZFVTNOb2pO?=
 =?utf-8?B?bDRTVVZ2bkJZVzY1QTJ3SzM0RElROU1nK3JPamJCdU1LcUUxb0E5TzZHYmlW?=
 =?utf-8?B?ME8xNXJsaWxnK3ZiSXdJVE1nNG5nWE40cjBZN0wySG5IcVMwdE9IbG84NjBO?=
 =?utf-8?B?aEx3dGgwTzBoKzVEZ0hCMGVwK00zOHZuQTFGWG1XelBaeGx3R2dPMWRsWG14?=
 =?utf-8?B?Tk4xVmttVHNIOVNuU0Q5NWhJVEpqZmNKQkJPUTkwc2l3b0gwRlN2OEU2VGkw?=
 =?utf-8?B?UkF4MUs4SnIwdExpRVdMRUROVHZ3eVFhQ1BFOGFYUVNSZUk1SnhSSnY3UVN3?=
 =?utf-8?B?RlRaRWZWK0ZFc3JYa1NJSnUza2I0aUVyTmV0TG5jcXlBMjVYbTkydkR6K250?=
 =?utf-8?B?WmR4aUNnS3FCcnJwbGR5TFowZm8xemc4SVJxMjFBQ1YvS093SFdOYkNkMEcv?=
 =?utf-8?B?RCtZK1p0Vzg4L2dyVVVsVlFMaXFWV1llVjVYaG0wcVBscDRvOTVhYjB4dG42?=
 =?utf-8?B?MFFqZ1BCcDNNK2xwSmN5MVQzcWRWSTVtWHFlblJWazZlRjJ2SmZldWtJYnYw?=
 =?utf-8?B?Q3pWaUZwcGxBbFdLbkdneGh6R2d4QW16WmRrVWtnSldRV1Z5M3RaRnlVMWdD?=
 =?utf-8?B?M3dwUkRlVUNlQVBRS3pCK09UU2ZNMHFHYktGSHgrNDZyY2IvWHRqV0RDVkY3?=
 =?utf-8?B?ZG9aLzRpc1FtYU5TaU9FTnRUUjdWMzcreHNoVkFZZzVqQ1JxMDV5ZkJyM1l1?=
 =?utf-8?B?QnVtN1VsZzhNTE16dE5tNS9TbW9GOENBd3E5a3hsb1ZLNFBDQ2JTZ2prT2RH?=
 =?utf-8?B?d2lMWmUzK0VrRjgvNW1iWmZuZ2c2SDRJcUtnYTQyemJIeG1ZbEI2b081TGNF?=
 =?utf-8?B?TGNqU3BEUUpnUldLWWdTdHB6VzlneXZWRnE5UU1WSzEvdVpoalJ6OHptK2kv?=
 =?utf-8?B?VTJMSnpFbGFUYllRVkIxUjAva3BFSWh5eU02T0tScmdvK3A5Q3RKV2FUOW1w?=
 =?utf-8?B?VjZzbC9sQkVBb1F2L2gvNEpzcHNzOGQra2oxNHhEeTBXWk1Ma2s0ei9yT0Jo?=
 =?utf-8?B?UENsY2FCczRnMHlCRG05NHNWT1VLVVJqRWtJL0dxbWt3eGc4eTZ4U1ZFOVZ3?=
 =?utf-8?B?SjEzZklSTkxYcTBXQ013VTZycXBwL2pGZUIzUzlUMjZSQkRqaHhSNHFyQ0RO?=
 =?utf-8?B?OC9TZzZWRUVZTnEwdVpDUUJSM1dSYTFBS3NTU2h5T0hFZm9YL1lMMVNXYzgv?=
 =?utf-8?B?MWYvMGRjd01TeWExMWJua1VZS3A3YUk5NHV1cTlGRnNDcVRkMWZ3VXRHWEJu?=
 =?utf-8?B?dVlFSiszRlJncFNzdjNlaE5uYXBwN3NJbzNBWXR5MlZBZERCdVdGZUoycWFB?=
 =?utf-8?B?OUo4TGJEc3czZVhKQjFzZmZJK3lCQVJQdFhhS1YzbFVtNjNYZlBtbE5qYzcx?=
 =?utf-8?B?SnVWS3JZeHl2aEltam5pdkNKQVp0T1FHalF4ODVKaDVMMmlpMTgvZG5vc3J0?=
 =?utf-8?B?K3YvdGZxUzV4N1FYYlUvT2VraitOWS8rN3Juam1PVnZXT09CbFhyeVpKSlpY?=
 =?utf-8?B?WEhXMHVJTjlVVXMwRzNjak94QmN1dm91UEVxSjJLMStoaWhtd0tvSExoTGhY?=
 =?utf-8?B?aFZWQmFySmRQUWpudHVvZlBUVXdibXYrbVBLRG95djFDZDYxaUVkUTlhMnVs?=
 =?utf-8?B?Wi9CR0tBMzhJK3JUS2JZdmYzdmsySkdoV3dueDdVR0d1dWJJYmQ2YzgwY0d3?=
 =?utf-8?B?TnFsSVBoQzJwUDJZK2ZVL1lOaTBRb3plNGZta0pzRWt2YWwraE1UNy9WTkdC?=
 =?utf-8?B?RjQwcUdUckNaU21kK0NaQzdseFM3Y3NLbEVjZE5ZM0tLMGZDNUJiMmRLYUND?=
 =?utf-8?B?M0g1Zm5sUHkrZ2FDNVNVUEpsaTU5eHJqSlBHSVcvOXFETWU2WUUxU2pFMkph?=
 =?utf-8?B?VjMyejZQU25sZ0ludnFWMWhCcDNnZ1lmVjUzSTR1NGFMaGF2aW9EY09UUDRz?=
 =?utf-8?B?NktCY3BaLzBtMHphQ29SWHo5VG9Cay9sRlZhY2pYNjNadVUyd3JVeXZVYXFm?=
 =?utf-8?B?bnFmLy81QStKeGcwd1FaS0ovV1pOalN4d0wxU3NKUUJhZkNSU2VXQ0h6bHAx?=
 =?utf-8?B?TVF1aHBRcFpPTWJPb3cwK0V2Z0Y3RnFDQ2IxRitwWmxzS01NMm4wRCtVNUwv?=
 =?utf-8?B?SG5sWGdOUHZSSEZta0VGa3VhUURLYWYvZ1UzVDhiZyt6Ni9PazY2a3Z1WTdx?=
 =?utf-8?B?elluc1FYR3hWUksyd2Z4Z2xqMklveDVYTThJYm9ZaTNmZ0pqekRXNlptOUZo?=
 =?utf-8?B?L2orOGFpSTJaREt0VE0rLytHOStzV2NPcWxMejR3Q3pzdG1YVURBelBha3c5?=
 =?utf-8?Q?MvO7jwlOG3JUHlko=3D?=
X-Exchange-RoutingPolicyChecked: 0xvxEKR9Tei4Z/83tjccVVpijXiAuD2DlELmup2iSslJ0kVrVaG1XdIGPLsoeaJ6Jd7kasXkUs7kgaCJJxFzxlSP5+Z1NXcgSKQ7YoTDHEBNBV9fW1sfhqJlL/SNoyRiFq0ppB/dud7u4p90JUVFcR6wxvG1yv3UAPvk2GdfGL5rPkvpGcdOjW41bC4LMkpCQDAc4mAUhhvTtdS+vqB6M8MrTwy4MeJTvM8xB15WvQXJofkSLhw7qT3AhEOfqtJa3o258NXVWqcilqtpu2BEt1jsUaUy/b/Z1f/M12GVpqihvZIEDasp5YLdnoOTijsBXlsx/hEVG/hzNt+sixiUgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f719ae-7987-44e5-4f84-08df0401b2e7
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:09:05.6904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJzVGnLGckYvqWm3xGQhTgJC2KMn1abRZQQaWyuWJF+71PGiGBCe42fDcMijhRYrlp2abgM1dlVTS6S/xSXdU1eR1LWHf+plcyzz6M0tISc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9920
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



On 26-08-2026 19:21, Tejas Upadhyay wrote:
> VRAM page offlining can purge BOs that are still referenced by page
> tables, exec queues, and DMA-buf exports. Add xe_bo_is_purged()
> guards in the teardown paths to prevent unpinning or mapping an
> already-purged BO:
> 
> - xe_bo_unpin_map_no_vm(): skip unpin if purged
> - xe_dma_buf_map(): return -ENOENT early if purged
> - xe_exec_queue_update_run_ticks(): skip LRC timestamp read if purged
> - xe_pt_destroy(): skip unpin if purged
> 
> v3(Sashiko):
> - Remove dma_resv is already held
> v2(Himal):
> - take dma_resv lock before calling xe_bo_is_purged()
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.h         | 3 ++-
>   drivers/gpu/drm/xe/xe_dma_buf.c    | 3 +++
>   drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++--
>   drivers/gpu/drm/xe/xe_pt.c         | 3 ++-
>   4 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index eede678ad303..dfcd0e57073b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -364,7 +364,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>   {
>   	if (likely(bo)) {
>   		xe_bo_lock(bo, false);
> -		xe_bo_unpin(bo);
> +		if (!xe_bo_is_purged(bo))
> +			xe_bo_unpin(bo);
>   		xe_bo_unlock(bo);
>   
>   		xe_bo_put(bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index bf0728838ead..5d9f1cd24b7f 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -104,6 +104,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>   	struct sg_table *sgt;
>   	int r = 0;
>   
> +	if (xe_bo_is_purged(bo))
> +		return ERR_PTR(-ENOENT);
> +
>   	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT))
>   		return ERR_PTR(-EOPNOTSUPP);
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 91ed6c0fac84..91e4f3cb5617 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1572,8 +1572,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>   	 * errors.
>   	 */
>   	lrc = q->lrc[0];
> -	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
> +	xe_bo_lock(lrc->bo, false);
> +	if (!xe_bo_is_purged(lrc->bo)) {
> +		new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> +		q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
> +	}
> +	xe_bo_unlock(lrc->bo);
>   
>   	drm_dev_exit(idx);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5d990c1c3740..dbf1aa26a21b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -212,7 +212,8 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>   		return;
>   
>   	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
> -	xe_bo_unpin(pt->bo);
> +	if (!xe_bo_is_purged(pt->bo))
> +		xe_bo_unpin(pt->bo);

IMO, moving purge check within xe_bo_unpin seems better, with comment 
what might cause purge.

>   	xe_bo_put_deferred(pt->bo, deferred);
>   
>   	if (pt->level > 0 && pt->num_live) {

