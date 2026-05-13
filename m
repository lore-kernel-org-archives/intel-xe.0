Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A74CD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 11:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B69910E405;
	Wed, 13 May 2026 11:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcaPECOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9981010E405
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778672590; x=1810208590;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QwvJmoOD/yJB34L5ZANa5VG/yTnxR0XAa5MO+UDvDdU=;
 b=kcaPECOdGwe7D1ROXgd/Ibcaua4iNOboy/7WynguoeLe1zGJWbNHtRNL
 I+AgI+oUZUUnQUvhuLLnH9XlfpeODGFDc9+iYXIvVUsQ1w9hHv0bqxMBZ
 pZcc/PxGBubAp1A94AnTcWK/urXrL59H27Ima4uuRlS/1Hvwu5KaZbopQ
 Rl10vSwtH2xJ6XDklsbPYNAiJ03dlGDZOVDINiFDr4t0M4TYlXmz/js7Y
 MOWXSl0Au3O21oJM34PyW1+eCNlLfgG0iGw4oqKQTxsbRCWSinnRT691P
 ZXe1A2gmk9qG9EOcFmctnK9FgAV1oV5Wticejf8cnrpimT+WakYTW1tqN Q==;
X-CSE-ConnectionGUID: CnposMJMQE66GHtMgvQreg==
X-CSE-MsgGUID: maeIbj1uRdiuUIKq05+4xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78625790"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="78625790"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 04:43:10 -0700
X-CSE-ConnectionGUID: Dd5TO7j0QTmc+Yx3fC+REw==
X-CSE-MsgGUID: ulQXCyFVSFyvxR5BCICGtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="243052014"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 04:43:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 04:43:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 04:43:09 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 04:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEjRAcw/KmKBG0yBqxhGK7l/y3gc5TEensY0ZSM7YIBOB7s1JreQ79qyV+ltcdB9ZPjTkJTsphHKcpDW/hqa57k+6QozwXKU8Lp7EM4i4fOGikagfKdIKHBVUvLN4qMAhQ82gebUwPCox8pNqoRClLphFpWjYfYwRQB+CZpay454V726PwTCR4lt2cZ8qQmcOnLCEnQd+S7Q+cNjrDFiuYkGe1hqFB/W4+K/fxoi4ZNipr0W4uUcx9O/bDQFxNHTujxtlXOnoCP9fagHIK2UohsNxNtXixwurdYWdJ3yqSOBOIAKaH2eBTKR2yqBemCajKGPzi0nTgvZ88v02WNyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMmf4WC/Fc5SEF9T+jgXRxOE9gEAV/1c99iAqL0n9P8=;
 b=iVWHFe9JCOLlGFQrMXBOBDDGzOvqUtpMfieQgiDbvcR1IEQOKIY3Vr1EaGnAgol6/oO/HjrH9sZfyFV4GZhJlJJWZzoDY+TI6YgyvRtnTbKGLwgjbxq/gvQZsRSqMQj4EQ8JSOtXgsHZG4U+awe9IQQ1kpfO6FycUIzi+RLcO3QnDfugPzdU7QW9Wqv3JeHWen6xyh2rtLh5jdH7DyNouIytZyA/GQ6LsCkx5rbl2orGa8eu7PlZ6eS9iQNy7RNZYFoDYBYN8qWoYgiF/2c4IXY34SqtgQJI6d3IyH3RO2XDpa1egtJn9rEGyAYHT/oMkOwt6IfZVd+UqBBtlT3cHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:43:07 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 11:43:07 +0000
Message-ID: <849df415-236f-4587-bdd3-b6bcb2f0c5f9@intel.com>
Date: Wed, 13 May 2026 17:12:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Unify fault injection hooks for CSC, GT reset
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260413045118.548328-2-mallesh.koujalagi@intel.com>
 <1aa068d9-f630-4d4d-b42c-d1937afd3730@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <1aa068d9-f630-4d4d-b42c-d1937afd3730@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0283.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: 078a2c69-38a2-4715-6a13-08deb0e4ccbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: ubMRbHcKAEkieDc12BKS3z/u5Ke/GWLAbYKA1/tBmhqhF5MfRf+0xQ0eDzxfNb2gJgWVhxe1sROQnHb7BBpHlAc1FB5y5nEKfnZOedAycWVa0cG3gF2AgZ8gJUg8SnKuPIDfU89TgHTgNdn1lv+jvySqNCaeESedHSY0kfNR0AJBgQsbRhoebEiitfrNxx3kOAPkazyGyqFX8u1KRsUsis86fAgyixw2IqPDjshFWbF97LmI69dHgPpai9SaZmveOAneEGz8Fb5m3so3LxeZyhhiWh5Jdnr5jG4E0GTs5gkxvPbBsfddBvmusJi1UW7JlFgrCNvpmwgoX4smy49XGCDp4YLvEMvodT/5gRD+xvwwPYHp3/zwP7P3RvaytdcXE4XgPOsF8v7gNjF8qXQAyFFQnMCb4VDqQ4nWqyivPEwke7FTgskVWaY0XPp/lHNAuevV7AaCod+Shx/jYphxwtwWNqzWGH/kZjWHOjhLfOMwxXRWrwpZmeeClilOO9NcuUUrNocnivBurL/rMSRVJA0SdkxA+xC8Z63aVE7C0L8t0it9ItcC+0tlaaTmX4cqfo0z0xhLBQ+8RcnWh40Zbcj2gsxee3Orp1/qpnHXX+qtvhjUGg6HX3BdS5oqJnD+YOA+SDef1sryPQm4EWH/VnqqZQqKFph3+naStYED0CCjBAUH0QFLvBViZSq2+y2i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU9DNko1K0xra1dSUjc4aHV6QVhTMUJ6SS9nOXloaUJPMFVnOUw5enR4ZzRr?=
 =?utf-8?B?WDI1T2JvNjBmeGZtenhsclZXWjhlNGhnaGVDdFk5bFVnaEpSSzRLQVJWSUVG?=
 =?utf-8?B?NE5STU5Sa1JqK2Y4SThjL0hnbG5kc0hsZDVpS1MraVB6czZkdkxGa1dQTC9V?=
 =?utf-8?B?K3FpcnVZVGFMdFN2TWF2WUI2Y3l1cm1uZmlSMk9VYjlJbWZhVUwxaWplR1kx?=
 =?utf-8?B?V25pZjVrbCsraTNtKytVcUpaS0NYMEdWMjhLVmRhTnJoWmpTYk9OV3NhR3pX?=
 =?utf-8?B?QzVYVVlyUGpRT0RvcVdwZUxreExNUjJVZmRDWTEvcUZmeFpvT24xK3lFbjFF?=
 =?utf-8?B?STVjSklDaEhRM3dHby96SStLd3lzOFNDOG5Kb1MzSHdqQ3JUbThFVnhzZG4z?=
 =?utf-8?B?Q2lBMHFIaG9BU0VQamh4bThLeit1TTJySVVjdlE2TTJnSWNteFNxcUhteFQ5?=
 =?utf-8?B?MEp2WklXZWlUY242VnNXL2o1ZmRhcDAzcnlUY0dpNkhFcmRwaXlTdUtvbmg4?=
 =?utf-8?B?Vm9DR3VBOElxSGJRdFJRcDl0Snl0cHQ0VCtDSHh6d2RUQ0VsNXZsa1BndnFu?=
 =?utf-8?B?T0tNSDJBeUxNOGR2VlB5RjliZnI3dGJtakpXRkdiY3RtVkRYTlM2MloyKzdB?=
 =?utf-8?B?U3pnenpZUVhmelRvcGw4Y3R4bVhRQ0tnMHYwQWRNZFRvcnk2UzZRWGlZTWtC?=
 =?utf-8?B?b1RmK2xqWjdXVEx4MGRFYW4yQ2RDZUZUTlBwTEVDMlcvano3V3RCNm5EYVdz?=
 =?utf-8?B?UEhiNFg1enVxNWJOQTd2TmYydmVEenltb1dhT2Y1Y1A0VzRJR3N0dkMzbStX?=
 =?utf-8?B?T3VXenpCZVl3MVg3YThKNkxiRmlzQlpLcDJ3L243cmk4QlRrS1ZQajdnUWlq?=
 =?utf-8?B?eE1mMzhrNWN2cDlVQmJTYWpiZXU4NU41TGNHUXZUNUlmQTV2Y2NwNjNSa2l5?=
 =?utf-8?B?Uk9BZVRXc3RtdzM4UGpXQWk5U080VVZsK051K1JwNG53SEpBdXFlbFZaUjBx?=
 =?utf-8?B?em9tMVJBczlMa0pueHJmeUVVVHIxbU9Kd1dKV21oeUJPYVd4ZGI2KzhqejBx?=
 =?utf-8?B?SWY1L0lkZXNhcURIb3d0UmZieDlxVVJxWmdtQjEvcTZHaDdkcHY4ZGFNVmE0?=
 =?utf-8?B?NnNIcjUyc1NrVDBISjY3S2l4a3ozVFlYQXlESjlaaWdkcFlDVXJHbkRyQk95?=
 =?utf-8?B?aFdTVkpDTG5QV05hcFVtVG05MHhoY3BibGY4U0pvdzJ6b0pCRVlOT3hxYmJK?=
 =?utf-8?B?ZWxCNkZheDdUWksvSWt5V2l4L2lrY1I4ZFpBalo5U2lPNm8zNFNCQ0tHQzZn?=
 =?utf-8?B?MlQwNWRiZzVwODZNaXczZVlKTmJzZEN5cjVVVy9ILzlycTB0bTAvMlNERUND?=
 =?utf-8?B?VW1LMzhtc0IzTjNGRDJWZ0xqaFExUEw4WkZ5eGxSNWlNSExKZThCSlpKTUdT?=
 =?utf-8?B?aEVnSjRiMnh3TWc2K3A5SGxCdE9LVTR5azM1eUNtZlRxWE15ek1zM0tLclhl?=
 =?utf-8?B?eG82UmU1U2NCcHNvZGxFUXYrTXBvcGdaaXY0ckk3NWNrd0NIdmxrYVpYelFJ?=
 =?utf-8?B?UWhrak5OakRvVk1BSWpYQi9Za2lzcDJXdkdmV1lJdWtUK3pXZXZ6VCtCUU9B?=
 =?utf-8?B?Si9pR0xnMndyKzdXR01Od0VDRlgvTld3WEtJejZvTTNaQ0E2VVRCdGVqUW9v?=
 =?utf-8?B?RGV1WkovVmIyL0s0Tk5MVjRUNUU5dVB2Q2RGNktubkQ5c3RzZzZZQ1hoRVRw?=
 =?utf-8?B?MGRnZnYzZ21EUXVXMXB6a3lDYmdiTEtxdW1WekpCV21WdFQrNFBwbVE1eUY0?=
 =?utf-8?B?RWFUbkRxc0c3VmxNTjl0TGFRS3B1QWQ4SFRrQ1p5d1BVQjhxZHhLa3FiTW95?=
 =?utf-8?B?bUQ5L0dhTHlKSU5RWExCcW9DWlgrV0hTNFVWMlZkMUVLb2tydlNOK2R1cUds?=
 =?utf-8?B?VkIvZkVKRElCMXRVUy94TStEeEZPRWNXam81SVlPcnd6czE3aU5mVWE3T2hE?=
 =?utf-8?B?cmxBVXlTOEY3ZURpMW9WVUZzRlRqOFV3bExrYnpDSkY1K01EYktVTWpHWkp2?=
 =?utf-8?B?aW5zQlRlRnJFaWVUSStCdzRKYnJPdWs0UnJVUkt5ZWJLenc5b3Vpa0VSckdy?=
 =?utf-8?B?bURUUkc3d0k4dENBSFc1U2UxdVFpZUFhUDd2Ris3WVRpcFRYVTlSaVI4S08z?=
 =?utf-8?B?MFJsZnJ4blVNUys3dnVWR29JR0liY0xmU2h3M3ZRdGcvakljdHB0SU5yUURu?=
 =?utf-8?B?bmxxWEN4OEluellidGphNmJHc2NtcndmYU5jNGVvSFZOUlZhOUpVRDF1QXh3?=
 =?utf-8?B?T3NGRnhqcFphVHFqN0s5Ni9KNkJZeVAyMVlZSlhOaVE0NE9oZEU4cFZlTEVs?=
 =?utf-8?Q?UGTZTO9TLIBZrvEM=3D?=
X-Exchange-RoutingPolicyChecked: sMu7tpn+dU0YGdtwNMhaJjocSUTB+t2FVeKPnlzzIsYEeiFPf6mT/lqwjZrg+zNb7iyM++LPC77B8xg6fV1eQGQcQh3f4VbcgjsOaJ/TVjKeoUdwB4OO3E/xsCx/L0LptQTfTP4ZyVuLKQ1jakGPQdf6rXwLOQeWdQDap03wEHTpnSodVjHz1aH+dvh03ZB1ltNhIi8I4lIRoJz30tfgaD4ufrQE1mwyLEWGCI4R/0HvytsesSkBo+iDJT1ohrCXKtB8DQLAeshzTKkMahv6HJ8sCmU50dvUZu5Bf5h/Fq431Obvr6L5Lb2ZwQXxRHt4LY9ob93WWj5mv+hjOXtAGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 078a2c69-38a2-4715-6a13-08deb0e4ccbf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:43:06.8972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMLFecYFMVr+N9yKXXbG6x3J2HA+hIye3mbWOKDpn7fu4N4KrTnsJNUK4BECaQLj4vkQkp3UiF/y+wFoBx9YuWmxWcNgsJpGf04rtbNhUDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
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

Hi Vinay,

On 12-05-2026 03:57 am, Belgaumkar, Vinay wrote:
>
> On 4/12/2026 9:51 PM, Mallesh Koujalagi wrote:
>> The fault injection code was scattered: the GT reset
>> hook lived in xe_gt.h as an inline function with its own global
>> variable, the CSC hook had a separate global in xe_hw_error.c with
>> an extern declaration, and each was individually registered in
>> xe_debugfs.c. Adding a new error type meant editing many files and
>> copy-pasting the same boilerplate.
>>
>> Create a single, centralized fault injection module
>> (xe_fault_inject.c/h) that manages all fault types through one
>> table. Each type is just an entry in an enum and a one-line row in
>> a descriptor array -- no more scattered globals, externs, or
>> per-type inline helpers.
>>
>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>   - fail_gt_reset         - GT reset failure
>>   - inject_csc_hw_error   - CSC firmware error
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_debugfs.c      |  9 +---
>>   drivers/gpu/drm/xe/xe_fault_inject.c | 63 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_fault_inject.h | 41 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt.c           |  5 ++-
>>   drivers/gpu/drm/xe/xe_gt.h           |  8 ----
>>   drivers/gpu/drm/xe/xe_hw_error.c     | 11 +----
>>   7 files changed, 112 insertions(+), 26 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 110fef511fe2..affa4d2d613a 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -347,6 +347,7 @@ endif
>>     ifeq ($(CONFIG_DEBUG_FS),y)
>>       xe-y += xe_debugfs.o \
>> +        xe_fault_inject.o \
>>           xe_gt_debugfs.o \
>>           xe_gt_sriov_vf_debugfs.o \
>>           xe_gt_stats.o \
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index c9d4484821af..d0ff603a0b03 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -6,7 +6,6 @@
>>   #include "xe_debugfs.h"
>>     #include <linux/debugfs.h>
>> -#include <linux/fault-inject.h>
>>   #include <linux/string_helpers.h>
>>     #include <drm/drm_debugfs.h>
>> @@ -14,6 +13,7 @@
>>   #include "regs/xe_pmt.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_debugfs.h"
>> @@ -38,9 +38,6 @@
>>   #include "xe_vm.h"
>>   #endif
>>   -DECLARE_FAULT_ATTR(gt_reset_failure);
>> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
>> -
>>   static void read_residency_counter(struct xe_device *xe, struct 
>> xe_mmio *mmio,
>>                      u32 offset, const char *name, struct drm_printer 
>> *p)
>>   {
>> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>           drm_debugfs_create_files(debugfs_residencies,
>>                        ARRAY_SIZE(debugfs_residencies),
>>                        root, minor);
>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>> -                      &inject_csc_hw_error);
>>       }
>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>         xe_psmi_debugfs_register(xe);
>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>> &gt_reset_failure);
>> +    xe_fault_inject_debugfs_register(xe, root);
>>         if (IS_SRIOV_PF(xe))
>>           xe_sriov_pf_debugfs_register(xe, root);
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c 
>> b/drivers/gpu/drm/xe/xe_fault_inject.c
>> new file mode 100644
>> index 000000000000..775137930135
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
> s/2025/2026?
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/fault-inject.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_fault_inject.h"
>> +#include "xe_platform_types.h"
>> +#include "xe_sriov.h"
>> +
>> +static struct {
>> +    const char *name;
>> +    enum xe_platform platform;
>> +    struct fault_attr attr;
>> +} xe_fi_descs[XE_FAULT_INJECT_MAX] = {
> Nit: Rename to xe_fault_inject_desc or something?
>> +    [XE_FAULT_INJECT_GT_RESET]    = { .name = "fail_gt_reset" },
>> +    [XE_FAULT_INJECT_CSC_HW_ERROR]    = { .name = 
>> "inject_csc_hw_error",
>> +                        .platform = XE_BATTLEMAGE },
> What happens if a fault injection type is valid for more than one 
> platform (but not all)? I guess the platform checks will need to be in 
> the handler functions instead of here?
Thanks for reviewing. Yes we can add .platforms = BIT(XE_BATTLEMAGE) 
more than one platform to handle. I'll share details in next revision.
>> +};
>> +
>> +/**
>> + * xe_fault_inject - Check if a fault should be injected
>> + * @type: fault injection type to check
>> + *
>> + * Returns true if a fault should be injected for the given type.
>> + * Controlled via debugfs fault injection attributes.
>> + */
>> +bool xe_fault_inject(enum xe_fault_inject_type type)
>> +{
>> +    if (type >= XE_FAULT_INJECT_MAX)
>> +        return false;
> Do we need to check for CONFIG_DEBUG_FS here?
Since we are handling CONFIG_DEBUG_FS in header file 
(xe_fauilt_inject...h) so no need to handle in this function.
>> +
>> +    return should_fail(&xe_fi_descs[type].attr, 1);
>> +}
>> +
>> +/**
>> + * xe_fault_inject_debugfs_register - Register fault injection 
>> debugfs entries
>> + * @xe: xe device instance
>> + * @root: debugfs root directory
>> + *
>> + * Creates debugfs fault injection attributes for all supported fault
>> + * injection types. Platform-specific entries are only registered on
>> + * matching platforms. Skipped for SR-IOV VF devices.
>> + */
>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>> dentry *root)
>> +{
>> +    int i;
>> +
>> +    if (IS_SRIOV_VF(xe))
>> +        return;
> Looks like just the csc_hw_error injection has the VF check currently, 
> not the gt_reset one. Was that a bug or intentional?
Good catch!! will handle properly in next revision.
>> +
>> +    for (i = 0; i < XE_FAULT_INJECT_MAX; i++) {
>> +        if (xe_fi_descs[i].platform &&
>> +            xe->info.platform != xe_fi_descs[i].platform)
>> +            continue;
>> +
>> +        fault_create_debugfs_attr(xe_fi_descs[i].name, root,
>> +                      &xe_fi_descs[i].attr);
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h 
>> b/drivers/gpu/drm/xe/xe_fault_inject.h
>> new file mode 100644
>> index 000000000000..958213fe2eaa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_FAULT_INJECT_H_
>> +#define _XE_FAULT_INJECT_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_device;
>> +struct dentry;
>> +
>> +/**
>> + * enum xe_fault_inject_type - Fault injection types
>> + * @XE_FAULT_INJECT_GT_RESET: GT reset failure injection
>> + * @XE_FAULT_INJECT_CSC_HW_ERROR: CSC hardware error injection
>> + * @XE_FAULT_INJECT_MAX: Number of fault injection types
>> + */
>> +enum xe_fault_inject_type {
>> +    XE_FAULT_INJECT_GT_RESET,
>> +    XE_FAULT_INJECT_CSC_HW_ERROR,
>
> Nit: Can we name these as XE_FAULT_GT_RESET and XE_FAULT_CSC_HW_ERROR, 
> since they are type of faults? Also, maybe have a 
> xe_fault_inject_types.h?

Sure!!, will update.

Thanks

-/Mallesh

>
> Thanks,
>
> Vinay.
>
>> +    XE_FAULT_INJECT_MAX
>> +};
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +bool xe_fault_inject(enum xe_fault_inject_type type);
>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>> dentry *root);
>> +#else
>> +static inline bool xe_fault_inject(enum xe_fault_inject_type type)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline void xe_fault_inject_debugfs_register(struct xe_device 
>> *xe,
>> +                            struct dentry *root)
>> +{
>> +}
>> +#endif
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 8a31c963c372..7cbb9c3c2dc3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_eu_stall.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_execlist.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gsc.h"
>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>         xe_gt_info(gt, "reset started\n");
>>   -    if (xe_fault_inject_gt_reset()) {
>> +    if (xe_fault_inject(XE_FAULT_INJECT_GT_RESET)) {
>>           err = -ECANCELED;
>>           goto err_fail;
>>       }
>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>       xe_gt_info(gt, "trying reset from %ps\n", 
>> __builtin_return_address(0));
>>         /* Don't do a reset while one is already in flight */
>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>> +    if (!xe_fault_inject(XE_FAULT_INJECT_GT_RESET) && 
>> xe_uc_reset_prepare(&gt->uc))
>>           return;
>>         xe_gt_info(gt, "reset queued\n");
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index de7e47763411..c7278247215e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -6,8 +6,6 @@
>>   #ifndef _XE_GT_H_
>>   #define _XE_GT_H_
>>   -#include <linux/fault-inject.h>
>> -
>>   #include <drm/drm_util.h>
>>     #include "xe_device.h"
>> @@ -38,12 +36,6 @@
>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>   })
>>   -extern struct fault_attr gt_reset_failure;
>> -static inline bool xe_fault_inject_gt_reset(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&gt_reset_failure, 1);
>> -}
>> -
>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>   int xe_gt_init_early(struct xe_gt *gt);
>>   int xe_gt_init(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 2a31b430570e..87b2a2cc0ef7 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -4,7 +4,6 @@
>>    */
>>     #include <linux/bitmap.h>
>> -#include <linux/fault-inject.h>
>>     #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>> @@ -12,6 +11,7 @@
>>     #include "xe_device.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>> @@ -25,8 +25,6 @@
>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>   -extern struct fault_attr inject_csc_hw_error;
>> -
>>   static const char * const error_severity[] = 
>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>     static const char * const hec_uncorrected_fw_errors[] = {
>> @@ -160,11 +158,6 @@ 
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>> XE_RAS_REG_SIZE);
>>                            pvc_master_local_fatal_err_reg : \
>>                            pvc_master_local_nonfatal_err_reg)
>>   -static bool fault_inject_csc_hw_error(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&inject_csc_hw_error, 1);
>> -}
>> -
>>   static void csc_hw_error_work(struct work_struct *work)
>>   {
>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> @@ -509,7 +502,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>> *tile, const u32 master_ctl)
>>   {
>>       enum hardware_error hw_err;
>>   -    if (fault_inject_csc_hw_error())
>> +    if (xe_fault_inject(XE_FAULT_INJECT_CSC_HW_ERROR))
>>           schedule_work(&tile->csc_hw_error_work);
>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
