Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5884C5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 05:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6676110E0C6;
	Wed, 19 Aug 2026 05:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyw+p5E0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548CA10E0C6
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 05:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787117379; x=1818653379;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=m2K7v5MuJmKU8Oacp3oOhnb7AJYVTOo3YICCT68HoZ0=;
 b=eyw+p5E0FsgvXL0JKy2M7srIkOOtsZ5ND9Q3BhjwNUcss5+HTdOm6z+R
 yMaOrxbytAu2rjsFmyvj7IP7KnfoYe3rQl52JUUw35M5xPXWRyjP6m1ah
 IFCn2J95OzsQfUwx7/XMvXf/Ha63r3zLdbTdOXoIfZSwA//sD6C0ESrSr
 9v5Za0MRRqFP5VZsvA10CGrO/O+KVyOu0qq3X+RaIXBCS4RQBxkVMyb/6
 ijJkPx3ykM0SEhB+pAwOWutziEgTOtmbJ0kVKDwvWdHbgLIYS/N2uOspe
 pSAGABQ432kdYBtR1MrTfrCGEEglwuGEIbtxqY8Ffv2IW0zbCqBbPWqQ5 Q==;
X-CSE-ConnectionGUID: B8XvPWh7R/GPOrsCZkOLMA==
X-CSE-MsgGUID: +dEm16qTS6a1/8wbgTrsGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87682849"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87682849"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:29:39 -0700
X-CSE-ConnectionGUID: Z92Sn5qXS12wEJpltStlVA==
X-CSE-MsgGUID: k16xwQzVTCqSX5IGFp5OLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="267399662"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:29:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 22:29:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 22:29:37 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 22:29:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZ3yXx84kGh4lkaTD9fJ1Jg1McpsxUpimCGsiV5/q5e4d/+CNhv2BPTvrgif3nYWpF+09Vg8jvZ5BdhXn+A2XrPC5LENh2i7nuGltZmbHni/B4pH4h/4mGOJCvr1+6in3mQwHDI3n7w0zhgvtZZHKhq4ZmECQQA+Yrnx181GVUHFwiGcr37g54J2zrBbMGPUJ7H58Is4JYEu/1AcGC7+6VSBQeMsVzRlwNoSiZUzKMVONTYcZchSmIOh6m5V0fuwVMszLfG8WU1aVXNQS+gMqPSgTbRdmb3pYGPcgGUM9J/LClXNS7Fy8n7juEDBLLAn+GZRY7XnCZwJQ11l8t6nmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIKYAK3xy9xnuHB3V0ETSNa/lSD9mZFpTpl0g4RBwJM=;
 b=RwNtKq6cwS2WZtATGZFogtSunPsSdlms0qhqmEXxghXs7DpeEaCWSOHiE8PNcdJoFsQ6YYCqZ4KR9/nSNSc0lCJGG0XQVMDsKWxNPx6dV96hU4Uqz+xxDxzpv6+V/6YHOD0QQ1yryUkV1ImIAGnXmsUt53ST8HpKNxCf53elhWvKHpu77H/19Cz15RG6G/ruQTUjqSK0BhiwHOj0tTfuVF60TsH3/UmNERTquBMB0ejZtJD5kgAJYiX1LJ6m8K1Nk88fqiZakwN0/Abj71JfD4emxxcA/dmnXmaXi5emYq2WWuqfoBCOOt6ciV6gcJYGh/VxcSNaSqzJG63DvBwxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Wed, 19 Aug
 2026 05:29:29 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 05:29:29 +0000
Message-ID: <11b9d99a-0263-4a28-9288-67a16d145f3b@intel.com>
Date: Wed, 19 Aug 2026 10:59:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: rework exec queue teardown PM/unplug
 handling
To: <intel-xe@lists.freedesktop.org>
References: <20260811133753.1742666-4-nitin.r.gote@intel.com>
 <20260811133753.1742666-5-nitin.r.gote@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <20260811133753.1742666-5-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::7) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 410bdf82-1082-4561-500d-08defdb2d735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|56012099006|6133799003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: TV1Rx3O6jdVGQtPFBfDoryd0nGubaDTgFwP5hr9Jh1yVKRMAbEyRjXZZdgx16YjLvTNkrGUgHguuDlXg/xQ/C6g7K4g4phgwih9NOGhTg0uxRrdeUof6KGHvmRpNAJhFOzN98VWxteCYjLsNSe9WrxiMMHod6fD+i/ZMbEu9TYKIdufWr6mwSCBMtA7c/BLqfl+JzuJ96EVaXR7E4YLfL8frDfcY/f7Nr9vV6UgnxPhYu2z2DdxdLWr6A+xVJgulSvN65FkQ1KS7NFkC0yiV/exK1asW18nd4+LdlctgD8KR7QQOm0orQxNcqHT5pFRGeatvZ6L2icIvoOHhz3cqJvO8MM7DXFRk4/VRQvFGRzSt+3FULO+4RrZtyeJxeRLJZlDDVpw6A6rRm8phmO0+9IMizkae47Y15VGfTas6uyLyGg4T+mJjTPghBhebwKiRwrowHH1TTgM2xqfSidvV73ua4N0eTc9OoCafpzP2t/vjYeS874njZoLFvkiNoUfLLfrPojX6USVGUwxRRMSPoXqUUEwtt+ZaHJttr+2N+oyf8JkygRRyb6q6AlpP7DsUGMiIhlVkiwcKmszS4Z+1n6F4Px1awhLW1cK/n4q+pXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(6133799003)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c21BZHBkc2pFd2NMbVIzbnhudDZUSmwyWjNPeGtRbjBwbUZ4WjY2eHgxekc3?=
 =?utf-8?B?UEE0VkwxV1gxZ0xxVTlXQ243QTZWNVNqQzBCaDJmd0cyc1Uydnc5czIzZ21D?=
 =?utf-8?B?N21jUFAybjJ3K1pBTTF5NFhvdnhjQ0FXRFc0VzdtREJUYXZmcWxCZzhVTFVm?=
 =?utf-8?B?bXFTeWRmMENTV3NwRlBGWlRwbi9ETWc4QTdBZ3RpZWpVcS9xN3hEa2tNbk9v?=
 =?utf-8?B?Umg0WFE4OGFyc1ZOOCtDZFF4MDFCbHphUXUrV0U4MDJnOG0xQU94YlpjNVor?=
 =?utf-8?B?QVMxc1BwbzB3d3RNZVROT2FBdjk3elhQdTJsQkFMc0pGMVJITThEazBKYW5X?=
 =?utf-8?B?NTNqTW4rOWVZbDc4K21jSnNqYk80T2F5dzUzYkRnT2JjWHBpdGF4TmFYbFlN?=
 =?utf-8?B?VjNyVGpjcGphNWdYUE5qUU5mRVZCbkpMV3V4bXJHczB2THYza0pwdDV3NGI4?=
 =?utf-8?B?RDNEQklnNTR6Z01BWUpSdDlKOU5SeWorNmg2aHliakd5Q2dNVWJ3cHNmVk5P?=
 =?utf-8?B?bVVnWWlyS0lyR2ZKSDBlZk5kSWZzK0dTNVN5bnNuOUpBekZmMDBHZW84aGJx?=
 =?utf-8?B?ZmpYVjEwZkE2MWE4MXo0NUV2VVJVYTVCRlVVOWxNbTFSa2Y1MUUwUXVreC9n?=
 =?utf-8?B?NGdTZVN0eEloMWo2aVVmaFJOZ3VnOUxrOHJkKzhmWm56QzlSV3BWa3lycUlX?=
 =?utf-8?B?WjhhUmVkZTErVlZCSmZiU2tRZm5VOWNkOWRaVmVoZ2VZenVtNkx1bm8yR1ZO?=
 =?utf-8?B?VDc5SThsYkJxU1ZCRWpvTFV1RWRScFBWNkRjMTMwVFcwNG1QVnhQSUsyTkVP?=
 =?utf-8?B?QXlSenRmRGs1Mm11UnM1ZkdpRjBabzY0aTdic0l4NWZkN0NPYW5XQmVTSlZ1?=
 =?utf-8?B?ZGE2Q1FrdUlWY3JleEZaa2FKM00vT1FmWUlNOHBsZ1lqSkorU1d4c1NKNVI2?=
 =?utf-8?B?WnZNakNGTEpRalhLSGVUbXJRR0RMamFxK2tkeWFsOGU2Tkg0dVZuVnlZZ1Mx?=
 =?utf-8?B?aHNHN1lhWDgxMDh3YmVMZGdZMXIvcWNVOHAzWlZEaG1vT0VJdXZSdStHbVcr?=
 =?utf-8?B?Uk5nRmw0REx5ZXBGdG5RekVkcjR2NWt0aFY4dTRLSTN6S2NHKzVhVnpCRGR0?=
 =?utf-8?B?VGhsUi9TeDNZMmQrUW9KR0d5c0JTT1VhdmlMOFQzQmVycFNsVSs3emNMOElv?=
 =?utf-8?B?dXh5dC8rbUV0Wk5DRUVLUUxiOFkrU3gwMkFrUjgzdEJOZ0tVaFZjTDdKZnZ5?=
 =?utf-8?B?SERXMFBEbmoydHRNVU10aDdBQldEZ1R3c3NOV1BIcUMwRWZSSzd5bTVxQm5s?=
 =?utf-8?B?Mjl1QWhOOGhkUFhCYWpBaE1RY2ZHcmJGOWRudE4rVk1vVlpqdENGSDkvUEJE?=
 =?utf-8?B?RjhQRnQzaDdzdUQrb0NtTkFVcFpDaUs4OW96Q28vQ0JsVnZFc1BlM25VMjNP?=
 =?utf-8?B?c0ZMdTZGSlcxczBIeEF6QlFQY3Q5WVZzTGhuWUNLZmF0dlNhM3JsSzVOVHVv?=
 =?utf-8?B?VFNXT2ZLZHRMeGF4bGszMUZmV0I5THYveDMxWmtRRDZMNlAxRDZzSmtKdzdE?=
 =?utf-8?B?ZG1WcjY0MFA1d2pVaVIveVYxYlo2T2luWmhmWGtyN2NxNHhFTi96T243U3Jm?=
 =?utf-8?B?WlVTbnR6cW96WVl1U3ZxMmFINzR1RjRsUkdvSVJqWWo0NGpaRlNjcE5udjlj?=
 =?utf-8?B?ZWJtOGdrQzQ1cUJlYnhPb09BaE9BenZGZktqUnFtWFd2MjljYUVuT2ZVYjQ5?=
 =?utf-8?B?ckM3OFhzZ0wyaG1DeWlDYU11SG1PZGxad2RlZ1hKUlNJcjNGaHNSYWpuZTAw?=
 =?utf-8?B?ZmYweUw4cEFUeVdDT3VueThQazNBUWk5U0N0U2wyU3RKWkw4ZWZHTnZBQ0Nz?=
 =?utf-8?B?TDFRQ0xSL0o3WlNkcnFWU3M4dTZFVUJmQWF2TWRQQU5GUjROTW1UWHdKUmpD?=
 =?utf-8?B?cDFpbzMxQ2ZrWnlCbzU3L29pZU9tRUYwZDI4SjFZdTFOVG9VTnVVWmlGS2ti?=
 =?utf-8?B?OTE4SzB3Qk5jSnpEWHlESGIrRk1zTXZ1a1pUMmdZN2FIT25WOHVGZHd5b0VH?=
 =?utf-8?B?SE1EN3l5MEVodjBaeE5DQlVSK1ZOK0FFSTBZVlduT1pPUlM3TzN5SGdMUmNT?=
 =?utf-8?B?dlplYUN1dlNKdkZVbzVZNGxhekM4WEZhUXFEdXBVamsvdXdpQkY1WEdRUlVv?=
 =?utf-8?B?UDN3SkdHRytYa3pTRmNQbnY1dFhNVWNSL0U1aWRHV1JlbkdGdTVlT1phd2NR?=
 =?utf-8?B?VkdNV1EyQXQ5ZWg0SHUzdnpsbEZCTXhEYmh3NzRtSXBSSE55M0Q1S3ZVZ2ZB?=
 =?utf-8?B?SGRYMnF5Z1crdVRINWltbUl4ZTdzcFhiSWtmZEo1Ly9Wam5NbjZ6UT09?=
X-Exchange-RoutingPolicyChecked: Q/xojBzPqpqaqy026huGUg9erj96I6yc+vvoImVm1YaKZKGOQZql1qAWBa2nCos2FUv7WUuqjDPY9JRDRnVxcaB06jz38kzbnYd9KC+yC7NO1IhTQl/d0hYz3R8XRJZjXzfRqIGY0TiQBR2IPOoh6leNDIz1TGZrzJ9rkPtGVp4j7XYuy1o5XEB38Aoy48BiRsP1ESM7m3LELxG4rnxJB3Uc2r4L9VUdQOzWK8BEeZd8MfJ3JCPN0w1p9eM2vd+DiMpGXA85odhJCtgdBV5tixgB7EEHuhASA8z/vCncMdBe6LgFuR0towkMhCq3to6OHqIEWnY7MeJHov8qRPMo1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 410bdf82-1082-4561-500d-08defdb2d735
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 05:29:29.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnCKtIjST/FmyRogTRV3mitGYHrR4ZNZI/TYTnL7a0auI6dVQV7UzQ8NCPc7qptduPWnb5G7DOm2p93YzrbC4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
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

On 11-Aug-26 7:07 PM, Nitin Gote wrote:
> The core_hotunplug "with-load" subtests trigger a "Missing outer runtime
> PM protection" warning when an exec queue is torn down from a deferred fd
> close after the device has been hot-unplugged:
>
>    guc_exec_queue_add_msg
>    guc_exec_queue_destroy
>    xe_exec_queue_destroy
>    xe_file_close
>
> The reference is not actually missing. On unplug the PCI core disables
> runtime PM (device_del() -> __pm_runtime_disable()) while the old
> drm_device is kept alive by the still-open fd. Once runtime PM is
> disabled pm_runtime_get_if_in_use() returns -EINVAL regardless of the
> usage count, so xe_pm_runtime_get_noresume() can no longer observe the
> held reference and warns.
Tested-by: Varun Gupta <varun.gupta@intel.com>
> drm_dev_unplug() always runs before runtime PM is disabled, so gate the
> message submission layer on the bound state instead of the PM reference:
>
>   - guc_exec_queue_add_msg(): only take the noresume PM reference while
>     drm_dev_enter() succeeds and record it in the message (MSG_PM_REF), so
>     the put in guc_exec_queue_process_msg() stays balanced.
>
>   - guc_exec_queue_process_msg(): re-check the bound state and skip each
>     handler's HW access once the device is gone.
>
>   - guc_exec_queue_destroy(): always post the CLEANUP message; the cleanup
>     handler issues the deregister H2G only while bound, registered, fw
>     running and not wedged, otherwise it tears down on the driver side.
>
> Also document the post-unplug PM-reference hazard in
> xe_pm_runtime_get_noresume().
>
> Observed with new IGT core_hotunplug subtests:
>    igt@core_hotunplug@hotreplug-with-load
>    igt@core_hotunplug@hotunplug-rescan-with-load
>
> v2:
>   - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
>     and instead exclude hot-unplug from the WARN in
>     xe_pm_runtime_get_noresume().
>
> v3:
>   - Rework the fix in the message-submission layer instead of touching the
>     WARN; gate PM/HW work on drm_dev_enter() and route all queues through
>     the CLEANUP message. (Matthew Brost)
>   - Prove the root cause (runtime PM disabled on unplug, not a zero
>     refcount) and record it in the commit message. (Matt B, Raag)
>   - Also remove EXEC_QUEUE_FLAG_PERMANENT flag in
>     separate patch (Matthew Brost)
>
> Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 98 ++++++++++++++++--------------
>   drivers/gpu/drm/xe/xe_pm.c         |  5 ++
>   2 files changed, 56 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9036f89dff7d..80b69f7d0dc9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1812,32 +1812,15 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>   static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>   {
>   	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
> -
> -	/* We must block on kernel engines so slabs are empty on driver unload */
> -	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -		guc_exec_queue_do_destroy(q);
> -	else
> -		xe_destroy_wq_queue(&q->guc->destroy_async);
> -}
> -
> -static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
> -{
> -	/*
> -	 * Might be done from within the GPU scheduler, need to do async as we
> -	 * fini the scheduler when the engine is fini'd, the scheduler can't
> -	 * complete fini within itself (circular dependency). Async resolves
> -	 * this we and don't really care when everything is fini'd, just that it
> -	 * is.
> -	 */
> -	guc_exec_queue_destroy_async(q);
> +	xe_destroy_wq_queue(&q->guc->destroy_async);
>   }
>   
> -static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg,
> +						 bool bound)
>   {
>   	struct xe_exec_queue *q = msg->private_data;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   
> -	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
>   	trace_xe_exec_queue_cleanup_entity(q);
>   
>   	/*
> @@ -1850,10 +1833,12 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>   	 *   it is safe to directly destroy the exec queue on driver side, as the GuC
>   	 *   will not process further requests and all resources must be cleaned up locally.
>   	 */
> -	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
> +	/* A wedged GuC won't answer the H2G, so tear down on the driver side. */
> +	if (bound && !exec_queue_wedged(q) && exec_queue_registered(q) &&
> +	    xe_uc_fw_is_running(&guc->fw))
>   		disable_scheduling_deregister(guc, q);
>   	else
> -		__guc_exec_queue_destroy(guc, q);
> +		guc_exec_queue_destroy_async(q);
>   }
>   
>   static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
> @@ -1861,12 +1846,13 @@ static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
>   	return !exec_queue_killed_or_banned_or_wedged(q) && exec_queue_registered(q);
>   }
>   
> -static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg,
> +							 bool bound)
>   {
>   	struct xe_exec_queue *q = msg->private_data;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   
> -	if (guc_exec_queue_allowed_to_change_state(q))
> +	if (guc_exec_queue_allowed_to_change_state(q) && bound)
>   		init_policies(guc, q);
>   	kfree(msg);
>   }
> @@ -1904,13 +1890,14 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
>   	__suspend_fence_signal(q);
>   }
>   
> -static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg,
> +						 bool bound)
>   {
>   	struct xe_exec_queue *q = msg->private_data;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   
>   	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
> -	    exec_queue_enabled(q)) {
> +	    exec_queue_enabled(q) && bound) {
>   		wait_event(guc->ct.wq, vf_recovery(guc) ||
>   			   ((q->guc->resume_time != RESUME_PENDING ||
>   			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
> @@ -1934,11 +1921,12 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>   	}
>   }
>   
> -static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg,
> +						bool bound)
>   {
>   	struct xe_exec_queue *q = msg->private_data;
>   
> -	if (guc_exec_queue_allowed_to_change_state(q)) {
> +	if (guc_exec_queue_allowed_to_change_state(q) && bound) {
>   		clear_exec_queue_suspended(q);
>   		if (!exec_queue_enabled(q)) {
>   			q->guc->resume_time = RESUME_PENDING;
> @@ -1950,17 +1938,19 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>   	}
>   }
>   
> -static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg,
> +								  bool bound)
>   {
>   	struct xe_exec_queue *q = msg->private_data;
>   
> -	if (guc_exec_queue_allowed_to_change_state(q))
> +	if (guc_exec_queue_allowed_to_change_state(q) && bound)
>   		guc_exec_queue_send_cgp_sync(q, 0);
>   
>   	kfree(msg);
>   }
>   
> -static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
> +						  bool bound)
>   {
>   	struct xe_exec_queue *q = msg->private_data;
>   
> @@ -1969,7 +1959,7 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
>   	 * CGP update + CGP_SYNC (re-applies the current priority from
>   	 * q->multi_queue.priority).
>   	 */
> -	if (guc_exec_queue_allowed_to_change_state(q))
> +	if (guc_exec_queue_allowed_to_change_state(q) && bound)
>   		guc_exec_queue_send_cgp_sync(q, 0);
>   }
>   
> @@ -1982,37 +1972,45 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
>   #define OPCODE_MASK	0xf
>   #define MSG_LOCKED	BIT(8)
>   #define MSG_HEAD	BIT(9)
> +#define MSG_PM_REF	BIT(10)
>   
>   static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>   {
>   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
> +	int idx;
> +	bool pm_ref = !!(msg->opcode & MSG_PM_REF);
> +	bool bound = drm_dev_enter(&xe->drm, &idx);
>   
>   	trace_xe_sched_msg_recv(msg);
>   
> -	switch (msg->opcode) {
> +	switch (msg->opcode & OPCODE_MASK) {
>   	case CLEANUP:
> -		__guc_exec_queue_process_msg_cleanup(msg);
> +		__guc_exec_queue_process_msg_cleanup(msg, bound);
>   		break;
>   	case SET_SCHED_PROPS:
> -		__guc_exec_queue_process_msg_set_sched_props(msg);
> +		__guc_exec_queue_process_msg_set_sched_props(msg, bound);
>   		break;
>   	case SUSPEND:
> -		__guc_exec_queue_process_msg_suspend(msg);
> +		__guc_exec_queue_process_msg_suspend(msg, bound);
>   		break;
>   	case RESUME:
> -		__guc_exec_queue_process_msg_resume(msg);
> +		__guc_exec_queue_process_msg_resume(msg, bound);
>   		break;
>   	case SET_MULTI_QUEUE_PRIORITY:
> -		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> +		__guc_exec_queue_process_msg_set_multi_queue_priority(msg, bound);
>   		break;
>   	case CGP_SYNC_MSG:
> -		__guc_exec_queue_process_msg_cgp_sync(msg);
> +		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
>   		break;
>   	default:
>   		XE_WARN_ON("Unknown message type");
>   	}
>   
> -	xe_pm_runtime_put(xe);
> +	if (pm_ref)
> +		xe_pm_runtime_put(xe);
> +
> +	if (bound)
> +		drm_dev_exit(idx);
>   }
>   
>   static const struct drm_sched_backend_ops drm_sched_ops = {
> @@ -2137,10 +2135,16 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>   static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
>   				   u32 opcode)
>   {
> -	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> +	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> +	int idx;
> +	bool bound = drm_dev_enter(&xe->drm, &idx);
>   
>   	INIT_LIST_HEAD(&msg->link);
>   	msg->opcode = opcode & OPCODE_MASK;
> +	if (bound) {
> +		xe_pm_runtime_get_noresume(xe);
> +		msg->opcode |= MSG_PM_REF;
> +	}
>   	msg->private_data = q;
>   
>   	trace_xe_sched_msg_add(msg);
> @@ -2150,6 +2154,9 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
>   		xe_sched_add_msg_locked(&q->guc->sched, msg);
>   	else
>   		xe_sched_add_msg(&q->guc->sched, msg);
> +
> +	if (bound)
> +		drm_dev_exit(idx);
>   }
>   
>   static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
> @@ -2182,10 +2189,7 @@ static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>   {
>   	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>   
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
> -		guc_exec_queue_add_msg(q, msg, CLEANUP);
> -	else
> -		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> +	guc_exec_queue_add_msg(q, msg, CLEANUP);
>   }
>   
>   static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> @@ -2650,7 +2654,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   	}
>   
>   	if (do_destroy)
> -		__guc_exec_queue_destroy(guc, q);
> +		guc_exec_queue_destroy_async(q);
>   }
>   
>   static int guc_submit_reset_prepare(struct xe_guc *guc)
> @@ -3296,7 +3300,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>   	trace_xe_exec_queue_deregister_done(q);
>   
>   	clear_exec_queue_registered(q);
> -	__guc_exec_queue_destroy(guc, q);
> +	guc_exec_queue_destroy_async(q);
>   }
>   
>   int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a5289a9df8d2..f517bf453b54 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -905,6 +905,11 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
>    * break scope-based handling, or when the lifetime of the runtime PM reference
>    * does not match a specific scope (e.g., runtime PM obtained in one function
>    * and released in a different one).
> + *
> + * This helper assumes the caller already holds a runtime PM reference and
> + * only warns when it cannot see one. After hot-unplug runtime PM is disabled
> + * and the check fails even when a reference is held, so callers that may run
> + * after unplug must guard it with drm_dev_enter()/drm_dev_exit() instead.
>    */
>   void xe_pm_runtime_get_noresume(struct xe_device *xe)
>   {
