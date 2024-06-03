Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8F1C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 14:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B751610E2F0;
	Mon,  3 Jun 2024 14:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhuRpXcQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8254510E2F0
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717425385; x=1748961385;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fXAaLSrsOJTb0cKezTDZgJMH+CTT1s9GS3Tbi9gyaw0=;
 b=lhuRpXcQQx89BdNNrXJBbsF0X7N26kx0+1aYtQ0aiWIeSKCtGvbQFMRv
 +JlM9f2812uTO0fk4gdYnRr/vDudWkOHw6xoKHo90KBLCqAahYSiDxeTK
 cWqxsJY4y5rsbHZurl8zJqgb2QttDq7B7S96A2uA8Q7y7jcK4L+NrEEwx
 NZ/hsJKLRjzi6bMO22/n2BjGDW+d4ht8c9iz+eHj8SFOfjWb2N1qNeiyJ
 ZRVHKIuSGI8hQgv7N2mFicm2001Q5ItxgtUNJz9Q5YheeyoZ9voGyW+Of
 1MqLPXJlHQ36sQQjnT5ZBGImIv+8v9p2WK+wSDmd9DQFDC/+GsIocUoVh w==;
X-CSE-ConnectionGUID: ve+qIwRIQ/6LGHcg157jrQ==
X-CSE-MsgGUID: sfWdhBa9RJCpy1CBItc4CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13792653"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13792653"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 07:36:25 -0700
X-CSE-ConnectionGUID: TeI9DUHfRSCt5nxedB/x9A==
X-CSE-MsgGUID: MpSYtC2lRkOZhFsn/z38HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36918543"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 07:36:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 07:36:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 07:36:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 07:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKKmYlD9fe7n47FSCqP6kVCQTVNdMt2ygSVuJKkk8e5VAEqePTcfn71Da2l2h5AoEt/M+9T38RXBHDZ4xoO+OH+krtJinNdtVmGzxsoholPLpuZ0WJ+aH8Ts5ps5BnT9hLvu15EXA9x1LEQPy1q8GxTrBELFY/voFDPIdAGiiixyk4g+LX7xvd+NiRwZHupicWKYxw8gYQ+6GuIL5L4k5SRK6+f+6+b/VxoZUFd9perluDccn6xfoxvjBoHl7aownto62Mz4oh8Abho7d9VNAMltn0OZrJRpmwv9dzfgnYY0RFXZCEnKFu4MAfMHU006IaAVOEzUaTxDxigBGuQ69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqbAbDDVbxTh78RC7AAG+MI6RTcMCZzcf7xTnOkt9ek=;
 b=YU8NN1mgvRyi5YCdfgECOl39u9jTTFosxD1kaGdKljpK+5/vANBJV2oSgQ0RhPDUfuFB9aP2IrPs3Ogq8VC+8w8k7mjRiulILK00yxVoIM0JIzzzAbN8wj8B9161k9rWZK5syh5N4asXul9lQ8xLskZVPqpOxthYIR6dfjgf4+MltsQCk+T8jnfq3ELRw7W1d5M6j2G1TbWJGQJzazQPUJGcZg7hdX6Ceifzlml/7NZm3QnkFmikftOMXT9Ro7XI3g+zHUWDGiOXaZsggblMD8sdPzHUO3Y1fHrbGZHEwkj5VqmKH5LnqVfOjmi2xDZ6+mp6fblgtLZKXp+paGTMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7287.namprd11.prod.outlook.com (2603:10b6:8:13f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 14:36:21 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7611.016; Mon, 3 Jun 2024
 14:36:21 +0000
Message-ID: <fa3468f4-691e-403d-a2a5-f2bb4d02312e@intel.com>
Date: Mon, 3 Jun 2024 20:06:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
 <20240603090147.1098639-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240603090147.1098639-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 3440569d-df96-46e3-2068-08dc83da8995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3lyNGpSa0R4cURPUzZweE9LdGxENURxdDI1NXM0Mk1uVGhIM0RqT0RsRGZ3?=
 =?utf-8?B?QU5kWVI4cE9XMW00MTF6NGg2dTREcGJhbW9jUGV4YXlrMkJadjVDOWF6dml0?=
 =?utf-8?B?R3dRRE5admxZdkVGQTBIUS9xNmZSellQU3hXUEdOTTBESTJGMGtPMGRYQ2N6?=
 =?utf-8?B?ZGcyUDE4SmQydDRUWFhXa09iRmRQbmcvaDV0ditDNERyUk5PWGQ0V2d3Ylla?=
 =?utf-8?B?MERKbVdQUi9KZlNqUUVnTE91a2hndUZDL2Exd3RRQjBKdFhueGw3eDJwUHli?=
 =?utf-8?B?Tm55S2tsNERoRVV0ZHZQUTAwZTFRczhZaTFQTWdtTGFtRzlPV0gvaGFIL2M4?=
 =?utf-8?B?a3FVUGtXVkRMR2EyMkxTaStBcmR0T1VLSXp0VGNhMHd2Y1lTOENOMmhxem1u?=
 =?utf-8?B?dEhVTk5MY3F6SnF5NERpaks1dWhQWU5BUWpkSnZ4OHZ1ODhBR1F5cnFIbytY?=
 =?utf-8?B?S3VnRFQzVXg3UkRCeittamo3NjArdHhEZTdQSnRmRGpNenBxRFJ5RmE3NGRy?=
 =?utf-8?B?WU1GV3BvVVB3TVBFQUhLczFMN21Ld1I5NUJhRlZESTI2cjFGbkVZV2NOclZx?=
 =?utf-8?B?WkRTaG5vVzVMbUx1V3hmY2oyTmxsK1BaM0oxVDJDalNyMHZGMG81dFNROGs4?=
 =?utf-8?B?QUdaOWVmbUN0Z01CR0ZDa2VIQldJb0NvU1JYU2xBYmJiNkZiU1cyUE12aENm?=
 =?utf-8?B?dWlLWThYaGgrWHIrWHNUbHFuYnpMNDFBRS9JdVROQU94Y2djeWtJTWlFeXp1?=
 =?utf-8?B?b09haS8zNHREemZzNzVxV0lmdzlsUVJ2dXFQWFhJamx5aDU0c0kxM3VKZjJ4?=
 =?utf-8?B?cjB0cSs2OU14MEk4aTF6NGRmVGtjSko0U3JxVVZ4RE1kYWRrTVBKbGJWd0VQ?=
 =?utf-8?B?OGtoOGM4OU51VFk4RFhyaEpSY3V6UEhkYmdRTUN5eEp5bHdzL0RSWDRjOTA2?=
 =?utf-8?B?WkdLa2RTNHpqWkxGUTZOcnVlR2hUS3IvNUpEekRZREt1ODMrS3U0d2xaU2xh?=
 =?utf-8?B?VGJvNnV0dE43TWR2SkNabDhDbXQrTWJkSG1xK09CV1R0Z3lOMEZRVjVZN1Fz?=
 =?utf-8?B?TTkzMzU4dnd0V1V1TFFKanNkUmZKNm5ZWXNhdFRmUU9rb1IydlpRT3ZtdXBD?=
 =?utf-8?B?WnpqS09ONjlXWkFIdlRJZVRnOGloc1llTEhKYWxkNHorblNSd0I1NFdtTG16?=
 =?utf-8?B?NjdIVGxqM2pvS0ZHRHR5c2JQd1lSZkszbWxyeHhMR1pzNjhscEpuYjdwcml1?=
 =?utf-8?B?a3E4SWk5bzBJK2daOFBZVWgvOWJ0SjR6YmNLRW1nV20zTzdoWXZ5Q0FVSFpz?=
 =?utf-8?B?cjJWQ2wxZmJ6STNQZlA3VFRNY3FWdCtXUFlpUEF6eHZrVE0yYUlZSm5hWGR3?=
 =?utf-8?B?SDFpMDVLcWw3RUVQRnk5Ung0NktVOWpXR05LTDg5OWY2enV2TitTcDlLYXUz?=
 =?utf-8?B?c0NmQjVWVmhscmVNdDFqcEJrUFZxMUkxN1Y5bWpmV0F1VEJIamVScnBoVDZN?=
 =?utf-8?B?MnkxK1lIV2U3dVBvN25ycllDNzVrWWlvcjNwVVpGVlcyNnFDMHJUSWsvaS9L?=
 =?utf-8?B?Z3hEalRhaTlVVHNRbUdEaVJCWGJoYmIxbTU0TkhvMTRHenVIdW1lbHZoWjdy?=
 =?utf-8?B?K3A1VW93bDlORzlrSDJiVzV0aW1vcXJVSWxPWXgwTHFIZHFwRHRUakd1ak1S?=
 =?utf-8?B?QVdUN05DdXlJdnlXc3pHNGNTNTZRZTJaOEQrZ0tEWHVrQ3JYMmhzQ0t3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEhGcEFwK1IyZndHSGcybTBad2RNL2hvSzB1OXJkZ2EyeW9ROUZOdFlyVUxo?=
 =?utf-8?B?cDk0NGlQT1VjbC8zcWFOU01CZ2ZWVGk0VUNRZ3JEdi91b0ZhL0tjOCtVNmVi?=
 =?utf-8?B?YjVBbU5sLzhiNkVhMi9CZTYxV2t0S2FubXU1R3ZUMkZySXpER25FUjB0OTVs?=
 =?utf-8?B?UVBnb1VWVDd6WjJRWkE4N2l1Ym5yZ2VCQkRZSVdsS3BLWG4vSTF5aGxKR2Ez?=
 =?utf-8?B?b0U1a0pkS3RVNFp6bHd4dEZuaEk3ekVteVVsaGZNNjRmdWFVMmNjVXVuS1Rh?=
 =?utf-8?B?dDNOR0FXajNQYnEvRDQxeUpQbkJPd1Y5UVY0cHVpOUE1OGQycjdsTEloSlp5?=
 =?utf-8?B?VGRQS2xsdG5wV0Nrd0YyOEhVUmJVSGJTZGpVdGdHaXVmaGxZN3N3eEZWQzhS?=
 =?utf-8?B?MTFhdVkwbnRSQTNSUzIyODNCZEtBdVBvOHBpbUwvRTVBTjd3aWFXMWtNVzM0?=
 =?utf-8?B?NG0rczhZRVpEakc5WmlyM1VXSzgyT1crWnRkRjkxSjdLMnhvWUh3eDBNUURx?=
 =?utf-8?B?WjNDdzJhZi9rVWVic1NvUStKcWhmT1gxd2p0bU9ySmZ2YzBVTVcxelBkT0J5?=
 =?utf-8?B?UW9NWUV1WG1JRTk0Snp3OUJFejY4RTRHdGJsUXNjSWN1TDhscTBiZ3ZTbTVu?=
 =?utf-8?B?azBOV0l4VG9yK0htd3lTVm1xL0xCSlU2UG00Q1dnQW5BdWZ4MjZlZHlqZzVj?=
 =?utf-8?B?MUNtUkhIR1UvUi9leTFKK1ErSGgzT0UzRVhma01TWnpQSlNtMWFLc2lnaElU?=
 =?utf-8?B?WjVnUC9vVXRQOGtUalR3Q2dmeXJwZklGMXFnVEc4ZUVxQXpzSlRmV0UwZVlp?=
 =?utf-8?B?bStRUjA2ZGxVdzN2SHpOSy9pQXM1L1dpT0tiaDlVS1dSTGt1OTRoTmtEYitK?=
 =?utf-8?B?MVZQRFliQm5Tc1lNdHpQbCswUi9KbTM4SkFmU2ZYWExpczBqc0dpeFlTTTJ3?=
 =?utf-8?B?N04vNktkNGkxcjJFTG9zM2xrZGtQdHVoaE91Q25jNTNHTGozRlY0SVpCd0c3?=
 =?utf-8?B?dHhHMWlwcnlKRnl1UEI0aGh5UVA1QS9YT24xTjNsSDJTaU9xaWR2bXA2M1pG?=
 =?utf-8?B?YnFFRjRML1RqbTVObTNCVmpqK05kelM2N0dUbWVwbzI2NmhxaEZCR3NLUHND?=
 =?utf-8?B?aHkwYXdOaFA1NC9MMU5RU2RGZnVYRWo1bDRZUWhURnZEdGU5NkVwSnhYV21M?=
 =?utf-8?B?VkZMa3lvRnBLT2g0cXcwZE9oYUp5eFRKSEI2ZHJNeEF0ekRRNWJpN2pqNllI?=
 =?utf-8?B?RGFGQXRiekk2VEhkUjJrT3RvdVJnUWpwc1JXb2tMTHVSNmNKWjJYdnBLVHNG?=
 =?utf-8?B?ejZNdWx3cGhtMHdBd29oQVFEcitPa2kvRlBBU1hYM1owRHJZVTh0M1Z4ZWwv?=
 =?utf-8?B?ZHFDdXJTRUJmRHJYWmlPU1NRQmRhWGRkYXQ3U3RDM21CMkVaYWUvNTZzcjJF?=
 =?utf-8?B?aTdPOHdMOE9aT2pxYTNUc2xDd05tRk9TWGhScjM4Uk9wdEozR25aRnlqdm43?=
 =?utf-8?B?cmdDMXFkT00zWU9ocXR5bVlhdVVJd0RFTzQ5ZEdaa0ZNNXVNd3E4dGlzQ2pV?=
 =?utf-8?B?V0F1dFNEK0VuTWpEQXhZWW1GVGxKZENySGFkSXFXbXNZTWhwVnN6WGJHNnNi?=
 =?utf-8?B?MWMxODhjQXNrcXdFTEJxRExSalNUYVhQMi8yaU5iemhucWhxQkxmSmwxYzFM?=
 =?utf-8?B?MHBiQ09QSCtZQlZDTTRMT0FNQTBNalhkVXpmR2w1bFgyNWpWTzhjZHdmdEc3?=
 =?utf-8?B?dHBiWG1Pb2pzL1JmdnhoMTZxbjlZVnNqK2ZqQy9UdjlvVEI1RTU0ZTR4Ykdx?=
 =?utf-8?B?VTF1bnh3VXZOclVscnJKdkluSERYN0gzcWg0Qi84ZXR5UWd0elczK1NMcXdP?=
 =?utf-8?B?TEFkUlBWUm1QeXd6VTBqMytyamJWZ2RlRGFJbjdaL2xoRkFnc1l0UXFDQTRl?=
 =?utf-8?B?WHN3V2FSbFd1ejdBUjZsOTQ5NFZWMkxkbjgxYmRiMkttQmpMYnV3ekhhaWx5?=
 =?utf-8?B?V2crMHRMcHArbWFKeno2VHBkQmQ1bW03WVVPUUd2WkpFblFKeGFLb0ZyditG?=
 =?utf-8?B?QTJSa2RkUzlicmlBbmJFejlYS1FBOVJKcDh6Yi9FRmVIVHQrckhKZkVwRmJh?=
 =?utf-8?Q?8UTyibG/HKyQ9CCRGXC2O0xQq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3440569d-df96-46e3-2068-08dc83da8995
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 14:36:21.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSTyiZs7ExsHhmAjw5m/n33k++/5pB+8ELsPTjF8iL2/ennq9toEH7utfOcPpH9Ilxxr6M2stF1dAL+Eaji/Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7287
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



On 03-06-2024 14:31, Himal Prasad Ghimiray wrote:
> xe_force_wake_assert_held is designed to trigger an assertion if the
> provided domain is not awake, which works correctly for individual
> domains. However, the assertion condition becomes incorrect for
> XE_FORCEWAKE_ALL.
> 
> For instance, if we assume all domains are in sleep mode, invoking
> xe_force_wake_get(fw, XE_FORCEWAKE_GT) will only awaken the "gt" domain.
> Subsequently, another function needs that all domains are awake and
> utilizes xe_force_wake_assert_held(fw, XE_FORCEWAKE_ALL).
> In this scenario, the condition will inaccurately return success because
> fw->awake_domains (0x1) & XE_FORCEWAKE_ALL (0xFF) will still be 0x1 and
> Ideally it should have asserted.
> 
> Make sure that the assertion condition covers the wakefulness of all
> initialized domains for XE_FORCEWAKE_ALL.
> 
> v2:
> - %s/supported/initialized/
> - update commit message (Rodrigo)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 83cb157da7cc..a9b01d7ede44 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -32,7 +32,12 @@ static inline void
>   xe_force_wake_assert_held(struct xe_force_wake *fw,
>   			  enum xe_force_wake_domains domain)
>   {
> -	xe_gt_assert(fw->gt, fw->awake_domains & domain);
> +	enum xe_force_wake_domains is_awake;
> +
> +	is_awake = (domain == XE_FORCEWAKE_ALL) ?
> +		    fw->initialized_domains : domain;
> +
> +	xe_gt_assert(fw->gt, (fw->awake_domains & is_awake) == is_awake);
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   }
>   
>   #endif
