Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA63C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D9510F2F8;
	Thu, 13 Aug 2026 12:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFAmWLFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D54210F2F8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786625113; x=1818161113;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HKpvmdcxpKbIIb7QDkf4szh/MvuF48+7XaqF6ZBcdoI=;
 b=mFAmWLFhyBYV/jqj7EK5cdZOHaYSc/Sq/Yc0JAO75nvHHNDSoFnPT5p4
 imqLUTCSMs4+FLGAV/V8IVKgfPNNEau3N4RcE9AAYgYorTr3C0n6TYSH9
 Y8YdeguPzD3d0uERVTa8FzbaWupjTQlbB3vJ3CRQ1DAlBAkxrA9rWGugZ
 p0faav5OFY96kcU4WoYAmlIoxChwK85WBBNpFhrkqEIWAmklZcz6V0/oM
 6bg1zqfo3XNIhLMpxrvN4RwKXNF/h5WbnNhaZ/oWJH2fuRGiXz5puHZtZ
 rKI6Zvkc/5mMf9/ecO++HFtAjM6jKFLKg9rTO8nXsxqkurZOyWm90ceN/ w==;
X-CSE-ConnectionGUID: cCLhr8hGQ1WKoRAfGHTEhA==
X-CSE-MsgGUID: SfzQHI0HTrWCkGVtKx0Tqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98712379"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="98712379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:45:13 -0700
X-CSE-ConnectionGUID: J/pEFgPVSqm73M7iKoBmDQ==
X-CSE-MsgGUID: VOG/wZ3KTDGsKEVAwS5oQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="269125512"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:45:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:45:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 05:45:11 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BK5dQwXPWtOwNBGTv6ZlGpkDpFQxhnN9aaW4rP4kCC5EyVGekOEZu7ZqBMmAjtQ/jk1cYfuo4Pd6o8ktLJS7fobGG+Mb+DWK93tRqcikoOTy6ajngY6z52CpNnm7yccaK3Nb8SiGU1k8qanYREGWsdlaFKMjV6tl6M/0lgM5cXTKyhJ522StcewHi3z2dCwVZu4QmHl/XNbTvvav0F+oSq4rR1KmeN0IzD4qDlXqvHUxiZNyxZw3yRNhNRJOOqn7+7f49fSJyLCm53yLeCNBmgzMRJPrwYzq5tW6TQ6D3cilkDMmgCfL9dxug6InNANsXlMR4R53C8OmyVQshheEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFQqcZgLaxZeNGpDIugBatb7Sb05Oz9oGwlR0se+xYs=;
 b=EFS+viMASrLjlLQsAEi2jYjy1mxPG7S8+ywKt3EB6EfWCl5F+uHE/R8hYPymM8Ze5uDv5yiCLYzn77qMmaVZGXN3mH7TBu0KwLHutoK88lFMJ3kpB/djjhW6zREyxgZtz17qWtaR7HfVtdK0JOKsNCCSpzuh4iylmQWIqNtHdnh7xyFddhsUuPdG9a3b+8EXc6baTCDkyKPrwzkb5gtkAlNnkk2i3GuMpgRNc6WvtctPRd81kJZImSOCBnzq+ovmWHI+wri1cME3jaCdLrc7p5bTSBY+Zteb2zb3j95AxEYOMyNIw8HDf7K+P/W/VvBe1qfxziMywc5zGxyrtug7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW3PR11MB4748.namprd11.prod.outlook.com
 (2603:10b6:303:2e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 12:45:08 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Thu, 13 Aug 2026
 12:45:08 +0000
Message-ID: <8b6a3d8e-1d0c-426a-841a-66961d855471@intel.com>
Date: Thu, 13 Aug 2026 18:14:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 09/14] drm/xe/vram: Add VRAM page offline fault handler
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-25-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-25-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 300fb215-cf63-4404-d410-08def938b518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|6133799003|5023799004|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: Vo4BxrAhhPriHr2Ywe484CF8xFKWw9AgPXByENoz/o2sR2FYvusju1e+U/465vW7oq50iKKAfPk6PDUlCzYQ5oNHvYY0ESA6XCQrKTyru/xCVFqtGzhmA9it4ZEL9YEUwLmUO/gpw1uGcePiPyNBojvpl78pcWSVi1ZpQtRuMy1oBT4cb0ni7Yk/rRfunzJQ3XrtFpbx1ozd2u8IFlryHlnvKL/fTeCf1G8P7IYjFMbLzNa4qW8X/vjOL1Y8Ln+UABEhR3IeOz7tnZx9iVM1WJIwRnyM0VrLwlj6bh7Af7NV3j68ojujcMlN8Z2SirOma6aWzDumHGL72NT0jHXXX/E5tDp/Ldk6qQJUgCVIqB4Mq+Z4qlxAD9b2UX+5VX0+5eUCy1iw87U3WK8llaKaQTXLvIw8uGGnLmEWvjL16f4H1RCDjEs5qfjX2sc1u89U5rA2n+pBCmCxem8ZF3SbpQN7McUb9okSuSm0C5G+gqpOJIXGDJE235xTQQRH7KbwQdR3iCjP/7yj2wedye5ZuX0uD6eDUJZXC6O4LA1MrFatJSh1ESCizwV1ePFEWLNLhIDWtirvRvgkXFgiNgkmr5mHxQvBOE2hOg+2O3pxDkiXSPwJY/xXBdVuCmd+97PJ9t1A/nH2WeA6WxlzIdSb7SgCB13KZLe03zoSONNdqw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDdHK1VtVElFZmZYVjEyY09BR0ZsaURVWVIra1lMbEhOQmxSQXV2dytzckxh?=
 =?utf-8?B?ckJQd2YxRlh3UWlUNkF1UUYrYytlVHE1QmRGbk8zbVRieWxaVjFCeDdNQ2FU?=
 =?utf-8?B?R3FkcnYzUC9ERWxCRGI3cGVRZ0lUNUlFWHBzMXpENUNhd21wb1ZkbHQ3ZjEv?=
 =?utf-8?B?cC8yQ2swN2tRRXdPYXRBWkRNZEhXOGhRUEVjQjF4V0pRNzdkOE1UTXhGazYy?=
 =?utf-8?B?QWMvTVpGMmJEdllsWHo0MjhvaWxJazNtWHZpY3BZTTFWWll0RHE2WmhoVXJO?=
 =?utf-8?B?R25EODh0bU1xSjdXWWVNekYweHBucUlyUGR4V0Z0dmp4ZXV3alphNFlDS3RN?=
 =?utf-8?B?QzU4MWN0Q3dsV2RtdzZkdk1TMDZUZ0grSXF4ZHZuY0ltbENUN2ZQZW15VXN4?=
 =?utf-8?B?NFJmT2hZNEI5Y3FGQTJITHlyU3Y2YUFWUExJSjdIYWkwb0xSaTVwYngrNXNC?=
 =?utf-8?B?OG96R21uNmNsQ3VKWnJVcTlreUNPS0ZwSS9BK3JJTEQ3THpPeDgycVExSFVJ?=
 =?utf-8?B?VEUxNXNPS3ovRUQ2djJVTFRjSDBaUWRqU25IM3VBeXh2QjZISEZ0a2owbm9D?=
 =?utf-8?B?cnJWNUJTdmhSUkZZMWZXTmMrWEJZeVg1anZkTDdPd01vc0ljQmp5d3JTV2F6?=
 =?utf-8?B?NUZ0QjZwTFdocWtrY3lyY0s5S1hkZzl0Wmt0QjVGWDRXLytMS2ZKN3FUNWFK?=
 =?utf-8?B?a0VCeUVQNlJXMzVaQU5pZDhrVGkybU1EOC9TUDRWam9sZ3RUQS9lN2RTVUZi?=
 =?utf-8?B?RkVEakJ4THRiRjNBVkE0REdGTGdHdkxBQWYvTGZoK1JMNjFIbHo3K2VXWkl3?=
 =?utf-8?B?dDUvTEtKc1daQ2w3RWFtVnprL01JbDN5ZUtrcDNGZUdKTTc5UlFOd29VYlo1?=
 =?utf-8?B?K2sycUdNV2k0MnM3VFY5dWxZSzRRR3JUb3hjazIwd2VPcXhTSU9ET2lwcDZO?=
 =?utf-8?B?TVEzZGQ5VmRTVWVPS2lZVWpLMFVldnBVYlQ2c0RyMVlzVDZRZnRZYTBlUHRw?=
 =?utf-8?B?dHBPdTdwdXhpVWdYcWRDb1JXOVdGNXBvbUFDQW1wSXlTVmd1Nm9LQ2NuWkZ1?=
 =?utf-8?B?NXB5Q0VycGQyVDlJTjVNVU56M1YyUWQzQUtvRmZ4RGkrUTVUdUt3b3U5RXR3?=
 =?utf-8?B?NzdsVkxyZVZ4KzBIYmw2dDRTWWdrdUhEdTRaWDBtTW9zQ3RHN0tZNTJOT2pM?=
 =?utf-8?B?R09LOS9rU3JyNWs4OEM1dWIrajdKZUQ1T09LM1VEbnk4WjZYanV3Z0NJeVFG?=
 =?utf-8?B?Z05RaXlCeHkvcC90NFhmUXVqWGU5UFRvbXFXZzlKMEpNSk9lcUNrMzRUT3po?=
 =?utf-8?B?aWNnZyt4dG9ldVlPRVd1RG5Lc3g2eENxZXZTYTRGaUt6Y0JnWktPREgzU1Qr?=
 =?utf-8?B?dVJHVTg5Ulltb0tsNm1oREVIWFQxQzdGbXYrRW9BN1RVTVlybnFYcDFpRWpl?=
 =?utf-8?B?REoxR2loUTdlcE90TGVlaXg3NUVKS01BYUtuSk5IY25MT0lIcDR4ZGdJTGJi?=
 =?utf-8?B?TGtaQkJhN2M2ZU9VR0xQTnZrazZLOVZ4eXZHY0phNUMzbytoa3hJNG5SMWlh?=
 =?utf-8?B?cFAzbEdma1g1ZkJWbDZwRnh2QjFHS2dpQ3IrdEtLamZPeGcvVGMzODdpQ25Y?=
 =?utf-8?B?dUVvR1VQZW9OVFVnUGMzeVRSNFlVdldPdFl0aWhHWGE3cWZ5Y1B6S0xqZm1J?=
 =?utf-8?B?TUZIL3dMZkN6aFp0NFJkd05LZmtTcldmbWhtQXUwSnYxWWVaOHJoaElUSHo3?=
 =?utf-8?B?QWhxdERwaDVMc1NXLzF1VmZDSnFyZmpJaGkyUmRzVUhWVnVOREp6QUZDTXZk?=
 =?utf-8?B?UDdIOUFPWHp4YWpBMURhNXY3MXE3a3BaKzBKdHZ1UVNrRVVjNzVOcFo1ZTA4?=
 =?utf-8?B?RzFlRTV1bnlDclhQd0c2WWpQdlAwS1BLYUhyZVBkK1Z2eTh0bWlpWGFYbnJa?=
 =?utf-8?B?eXZhenFtTVcxVzBCd2VEajhEenpyTm1sZ3Zqa0NKQWY4elFDWGhHVEhiY0Iw?=
 =?utf-8?B?cGpXajJoeFhLOTdNeXF3MFJTRG5WdkJKVmM2YWFOOWxWTDBWdWJxS3BTd1dQ?=
 =?utf-8?B?dWNKZmJjK1NXMmQyYzd0aDhpWU5aRnJkTVZUcVNKMGQzQU5OYWlVSitPWUo1?=
 =?utf-8?B?L1A2SmJ0bmIyOFdlaHUxQURxRUZyT0xyRXU4cXVXVE5Qa3ZCZXNEUVBvOUFS?=
 =?utf-8?B?cGg0RGJTN0JTVGZYUVVPOENDTTl2a2ZkZGNMT05lbTRYSE8xYy9MbVpzK0I2?=
 =?utf-8?B?UVhPUDNQVU45bUZLSVNEU1Z1Tm5JQS9BNGRuczl5eEFwRW5GVnBYRnplYVo2?=
 =?utf-8?B?SVhzb3VxdmMyTmVHL0NYbkVEM09laXM2RzFQU3JVQlhUTVVVQXo3SmljU0RN?=
 =?utf-8?Q?mlnvx6yRH22bmYp0=3D?=
X-Exchange-RoutingPolicyChecked: MLIz6+Ge3UFXPCcmkT7/MgqP2YLODTlxtMLN4KywCetct6K87Adxw+7rR3yGY62h2iKKqGFpc6dctruBiMlmIMc3fyUfMrLaNfDK/a8DTorzFlt6ecoUy89lx63SW7hd2t8nyzVUlltXzzMSF5vNt/LY6jwhglPsvjExC8dE3xOKO2677uJumN72LDJOv/wTltJekBUVRaDU18X7+i9lg3t4EONJrz06s9Qk9967lOuBYDVAKgnPJLkm3sWerEd0TzlzFU25tX191/GLX5zwsuZgIiXRq0L/+me8ql81gTLATM1lACbB2dKWOWtNLe25gK2BP7sD++zgFkZ2pGsFRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 300fb215-cf63-4404-d410-08def938b518
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 12:45:08.6711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0RFUnK1JxepHtiMbV0/1KxeVBElnirzBhWmlZT9tzWJHrJmICIoF2KaJzsSxMne99qkOUvD+rDKCozCJuPw98+ROtSPcsKAGSMXIL0oW3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> Add the core VRAM page offlining logic to handle HW-reported faulty
> physical addresses:
> 
> - xe_ttm_vram_purge_page(): Purges the BO containing the faulty
>    address. Bans the associated VM (if page table BO) and exec queue
>    (if LRC BO). Moves xe_exec_queue_kill() outside xe_bo_lock() to
>    avoid AB-BA deadlock with vm->lock. Uses READ_ONCE(bo->q) to
>    safely access the exec queue pointer.
> 
> - xe_ttm_vram_page_already_processed(): Checks if an address is
>    already tracked in offlined_pages or queued_pages lists to avoid
>    double-processing.
> 
> - xe_ttm_vram_reserve_page_at_addr(): Two-phase reservation that
>    first queues the page, purges the BO outside the lock, then
>    reserves the buddy block. Handles both allocated (BO present)
>    and free page cases. Returns -EIO for critical kernel BOs to
>    trigger system reset.
> 
> - xe_ttm_vram_addr_to_region(): Maps a DPA to its VRAM region.
>    Uses GSMBASE MMIO register to detect GSM addresses (returns NULL
>    for reset path). Returns ERR_PTR(-ENOENT) for addresses outside
>    any known region.
> 
> - xe_ttm_vram_handle_addr_fault(): Entry point called by RAS.
>    Returns -EEXIST if already processed, -EIO for GSM/critical BO,
>    -EOPNOTSUPP if out of bounds.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 297 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   1 +
>   2 files changed, 298 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 2813ae68325e..370bcf50c7f7 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -11,9 +11,14 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_range_manager.h>
>   
> +#include "regs/xe_regs.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_exec_queue.h"
> +#include "xe_lrc.h"
> +#include "xe_mmio.h"
>   #include "xe_res_cursor.h"
> +#include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_vram_mgr.h"
>   #include "xe_vram_types.h"
>   
> @@ -518,3 +523,295 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
>   
>   	return avail;
>   }
> +
> +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> +{
> +	struct ttm_operation_ctx ctx = {};
> +	struct xe_exec_queue *q_to_put = NULL;
> +	struct xe_exec_queue *q = NULL;
> +	struct xe_vm *vm = NULL;
> +	u32	flags;
> +	int ret = 0;
> +
> +	xe_bo_lock(bo, false);
> +	if (bo->vm)
> +		vm = xe_vm_get(bo->vm);
> +	flags = bo->flags;
> +	xe_bo_unlock(bo);
> +	/*  Ban VM if BO is PPGTT */
> +	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		down_write(&vm->lock);
> +		xe_vm_kill(vm, true);
> +		up_write(&vm->lock);
> +	}
> +	if (vm)
> +		xe_vm_put(vm);
> +
> +	xe_bo_lock(bo, false);
> +	q = READ_ONCE(bo->q);
> +	/*  Ban exec queue if BO is lrc */
> +	if (q && xe_exec_queue_get_unless_zero(q)) {
> +		/* ban queue */
> +		q_to_put = q;
> +	}
> +
> +	if (bo->purgeable.state == XE_MADV_PURGEABLE_PURGED) {
> +		/* Already purged by shrinker during unlocked window — nothing to do */
> +		xe_bo_unlock(bo);
> +		goto out;
> +	}
> +
> +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> +	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
> +	if (xe_bo_is_pinned(bo))
> +		xe_bo_unpin(bo);
> +	ret = xe_ttm_bo_purge(&bo->ttm, &ctx);

shouldn't we pin it back incase purging fails ?

> +	xe_bo_unlock(bo);
> +
> +out:
> +	if (q_to_put) {
> +		xe_exec_queue_kill(q_to_put);
> +		xe_exec_queue_put(q_to_put);
> +	}
> +
> +	return ret;
> +}
> +
> +static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
> +					       u64 addr)
> +{
> +	struct xe_ttm_vram_offline_resource *pos;
> +
> +	lockdep_assert_held(&mgr->lock);
> +
> +	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
> +		if (pos->addr == addr)
> +			return true;
> +	}
> +
> +	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
> +		if (pos->addr == addr)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{
> +	struct xe_ttm_vram_offline_resource *nentry;
> +	struct ttm_buffer_object *tbo = NULL;
> +	struct xe_bo *pbo_to_put = NULL;
> +	struct gpu_buddy_block *block;

nentry->status is bool why assign enum for it ?

> +	enum reserve_status {
> +		pending = 0,
> +		fail
> +	};
> +	u64 size = SZ_4K;
> +	int ret = 0;
> +
> +	scoped_guard(mutex, &vram_mgr->lock) {
> +		if (xe_ttm_vram_page_already_processed(vram_mgr, addr))
> +			return -EEXIST;
> +		block = gpu_buddy_allocated_addr_to_block(mm, addr);
> +		if (WARN_ON(IS_ERR(block)))
> +			return PTR_ERR(block);
> +
> +		nentry = kzalloc_obj(*nentry);
> +		if (!nentry)
> +			return -ENOMEM;
> +		INIT_LIST_HEAD(&nentry->blocks);
> +		nentry->status = pending;
> +		nentry->addr = addr;
> +
> +		if (block) {
> +			struct xe_bo *pbo;
> +
> +			if (!block->private) {
> +				/* Race: another thread just reserved this block */
> +				kfree(nentry);
> +				return -EEXIST;
> +			}
> +			tbo = block->private;
> +			pbo = ttm_to_xe_bo(tbo);
> +
> +			/* Get reference safely - BO may have zero refcount */
> +			if (!xe_bo_get_unless_zero(pbo)) {
> +				kfree(nentry);
> +				return -ENOENT;
> +			}
> +			/*
> +			 * Critical kernel BO? Best-effort check without resv lock;
> +			 * worst case a concurrent pin causes reset path unnecessarily.
> +			 */
> +			if ((pbo->ttm.type == ttm_bo_type_kernel &&
> +			     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> +			    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo))) {
> +				kfree(nentry);
> +				pbo_to_put = pbo;
> +				drm_err(&xe->drm,
> +					"%s: addr: 0x%llx is critical kernel bo, requesting SBR\n",
> +					__func__, addr);
> +				break;
> +			}
> +			++vram_mgr->n_queued_pages;
> +			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
> +		}
> +	}
> +
> +	/* Deferred put outside lock to avoid recursive deadlock */
> +	if (pbo_to_put) {
> +		xe_bo_put(pbo_to_put);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +
> +	if (block) {
> +		struct xe_ttm_vram_offline_resource *pos, *n;
> +		struct xe_bo *pbo = ttm_to_xe_bo(tbo);
> +
> +		/*
> +		 * Purge BO containing address - reference held from above.
> +		 * Note: brief window between purge (freeing blocks) and re-reserve
> +		 * below. If another allocation claims the block, buddy_alloc fails
> +		 * and the next HW fault at this address will retry.
> +		 */

I dont think we retry here. Fix comment.
> +		ret = xe_ttm_vram_purge_page(xe, pbo);
> +		xe_bo_put(pbo);
> +		if (ret) {
> +			nentry->status = fail;
> +			return ret;
> +		}

Nit: I believe better to try xe_ttm_vram_buddy_alloc here. even if purge 
fails.

> +
> +		/* Reserve page at address addr*/
> +		scoped_guard(mutex, &vram_mgr->lock) {
> +			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> +						      size, size, &nentry->blocks,
> +						      GPU_BUDDY_RANGE_ALLOCATION,
> +						      NULL, &nentry->used_visible_size);
> +			if (ret) {
> +				drm_warn(&xe->drm,
> +					 "Could not reserve page at addr:0x%llx, ret:%d\n",
> +					 addr, ret);
> +				nentry->status = fail;
> +				return ret;
> +			}
> +
> +			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
> +				if (pos->addr == nentry->addr) {
> +					--vram_mgr->n_queued_pages;
> +					list_del(&pos->queued_link);
> +					break;
> +				}
> +			}
> +			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			/* RAS will send command to FW for offlining page based on ret value */
> +			++vram_mgr->n_offlined_pages;
> +			return ret;
> +		}
> +	} else {
> +		struct xe_ttm_vram_offline_resource *pos, *n;
> +
> +		scoped_guard(mutex, &vram_mgr->lock) {
> +			++vram_mgr->n_queued_pages;
> +			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
> +			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> +						      size, size, &nentry->blocks,
> +						      GPU_BUDDY_RANGE_ALLOCATION,
> +						      NULL, &nentry->used_visible_size);
> +			if (ret) {
> +				drm_warn(&xe->drm,
> +					 "Could not reserve page at addr:0x%llx, ret:%d\n",
> +					 addr, ret);
> +				nentry->status = fail;
> +				return ret;
> +			}
> +
> +			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
> +				if (pos->addr == nentry->addr) {
> +					--vram_mgr->n_queued_pages;
> +					list_del(&pos->queued_link);
> +					break;
> +				}
> +			}
> +			++vram_mgr->n_offlined_pages;
> +			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			/* RAS will send command to FW for offlining page based on ret value */
> +		}
> +	}
> +	/* Success */
> +	return ret;
> +}
> +
> +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u64 addr)
> +{
> +	u64 raw_offset = xe_mmio_read64_2x32(&xe_device_get_root_tile(xe)->mmio, GSMBASE);
> +	/* force a 4K (4096 bytes) page alignment */
> +	u64 gsmbase_dpa = raw_offset & ~(u64)(PAGE_SIZE - 1);
> +	struct xe_vram_region *vr;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	/* Addr from GSM? */
> +	if (addr >= gsmbase_dpa)
> +		/* Return NULL so the caller can request reset (SBR) */
> +		return NULL;
> +
> +	for_each_tile(tile, xe, id) {
> +		vr = tile->mem.vram;
> +		if (addr >= vr->dpa_base &&
> +		    addr < vr->dpa_base + vr->usable_size)
> +			return vr;
> +	}
> +
> +	/*
> +	 * Return an explicit error pointer so the caller knows the addr
> +	 * is invalid and should be ignored, NOT SBR.
> +	 */

we are changing err to -EOPNOTSUPP at caller, why not pass same from here.

> +	return ERR_PTR(-ENOENT);
> +}
> +
> +/**
> + * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flaged
> + * @xe: pointer to parent device
> + * @addr: physical faulty address
> + *
> + * Handle the physcial faulty address error on specific tile.
> + *
> + * Returns 0 for success, negative error code otherwise as follow:
> + * * %-EIO - critical BO or address outside any VRAM region; next action is reset.
> + * * %-EOPNOTSUPP - log-only policy; no further action.
> + * * %-ENOMEM - allocation failure; next action is reset.
> + * * %-ENXIO - address not found in buddy; next action is reset.
> + * * %-EEXIST - address already processed; no further action.
> + * * % Any other negative error - next action is reset.
> + */
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
> +{

assert addr is page aligned
  > +	struct xe_ttm_vram_mgr *vram_mgr;
> +	struct xe_vram_region *vr;
> +	struct gpu_buddy *mm;
> +
> +	vr = xe_ttm_vram_addr_to_region(xe, addr);
> +	if (IS_ERR(vr)) {
> +		/*
> +		 * The addr is outside VRAM and GSM.
> +		 * Log a debug message if needed, and safely exit/ignore.
> +		 */
> +		drm_dbg(&xe->drm, "Address %llx is out of bounds, ignoring fault.\n", addr);
> +		return -EOPNOTSUPP;
> +	}
> +	if (!vr) {
> +		drm_err(&xe->drm, "%s:%d GSM addr:%llx error requesting SBR\n",
> +			__func__, __LINE__, addr);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +	vram_mgr = &vr->ttm;
> +	mm = &vram_mgr->mm;
> +
> +	/* Reserve page at address */

s/addr/addr - vr->dpa_base ?

> +	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 87b7fae5edba..d5392beff30c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -31,6 +31,7 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>   void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
>   
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
>   static inline struct xe_ttm_vram_mgr_resource *
>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>   {

