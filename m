Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E587C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C068610E00B;
	Wed,  2 Sep 2026 16:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tpv5PIbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E17510E00B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788365495; x=1819901495;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gSMNI4ncywrwvqwLU0/710IqHc6NjrGKjvy77SBtRPo=;
 b=Tpv5PIbu9oxmTTKhJWawzY8ZdKluLpap9L0nQCOzO9oC7s9hUlphynoN
 mg+7FSKkK65Y9/tV7KY7S/BuOcXoAuNhh9pMc0cz7rrgfJ/awCvXBGRJJ
 3498ndy4tBZTN25+49Ub4PgKy7wOnIJHVbd1S0ykpkeEZhhKv0YvM/dtl
 UjTZbHF921l+eNZZTvAIjANit2TP+FWJUtI/g6IBj3G1cNymv3lnS8q6S
 q0Wwr2CgKpGHWNmA56dI7sAQff3tCQLYYDaISbJLVF4crjdzMvFl18n7I
 jFS0j486E6StzTEYjI6/rQ9dTojayZOjQTf81wuMjVGdyDLXX3vqoxcDf g==;
X-CSE-ConnectionGUID: ld+rsjlsRAu/St32FOm6RA==
X-CSE-MsgGUID: bo8W93dAT/ujQx4afnbJOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100183632"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100183632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:11:35 -0700
X-CSE-ConnectionGUID: iHj2/3V5TfeKRCzT14R1Uw==
X-CSE-MsgGUID: pZtmPrkyQhSpPKiQLGh9Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="272960669"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:11:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:11:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 09:11:34 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7BD4NlQI6Bf7Z/yOkKQAxeHNXNKoQZaGYVg1oeW7rcjrG7++nSoxe6jsUIOA86TpxxBnlJ+GnAdnKhUaxU87tV+9TcNH1OJA7ZHHMxTMvYIMXPAWPL1f7eglfcgqbakOB3cmYOLPKieyOQc2BVbKzTjqKx4t8sFCCOEKKTJ0t/PRPWzY+GblQhAYI2VJBBwQNDCyUve0uVen4+omi7vN4lFvhCR/d5d+RpOArlcuMg6tq9EDdVOTbKx6/r9O+yx7+imSEY5yVKULlTLBvIFaK/v/OHC5fQ25ChUZXvjdTihcN+3cv7HnPnqH/F3tPY78KowqmDA4LfoVwZt6vqvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5uPdyPQCtJCpaUCbjsIBTsaE9QQtrhNpNPt1dZSl8o=;
 b=hxyUizzES1V3M1WqQdfNDZEGNFr9zXyChshMcQBWxe7zLqcMpacCJNPtOPFVvf+0WSlCxKSFQRNUilNosfhmGZGgScJcKJaSOFTfH5XPPJAwCgcCSMtKPnXSYvfLscAEGjaG4anxGvPnNZtIkpiAXeBZCkBZkr3zfVZLENFgUIiQ6y4zoTYLaImDDY9dfsR2iyvO3X7a7h9lGjLORnmSEFcitaIVB3IKU/ILZEzUAw1zS9cgon+KYhdeUCFoju/FXflHWLxuCd0SIL+zxYAGiZbHIC/M2zJ3Ua0iQp6PijOd7i6bHDnKp9zLcBASaiwvX92uTdNZ+JE0X0fWn4v6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:11:31 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:11:31 +0000
Message-ID: <0ef3ec26-7426-42e1-95a1-532dd5cffed4@intel.com>
Date: Wed, 2 Sep 2026 18:11:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: <intel-xe@lists.freedesktop.org>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-9-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260825063615.3697317-9-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::14) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: ac078508-5bdd-4f45-98e1-08df090cda13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: kejzrpAQQR/Po3xUgTzKFL0Bifz+M+DRj7xyeI8ES5792uOONNAZbxSnbU1MuuLGZI87kjmQxBy3lbVYi45e4auxqiCxi2IAF6xZBLSXJ8WxKY3Ca0lTt20Yszt3Yc22/aZDNx7jDDZ3Heq2rqRgoQJQFPyrFPtON6HwxZ7DKqzr6QKAqkxb1dfZucltaGqLI+7balHcRKD9SHsjwLgleQkHs12N7mfiLEnR+vY0IXx1cjWgXQEYULmhgCi92geiaIOqsYoiF84pmikO64FsltYgyIuoq0Gb9DOceos683EzMkJw2W/bbXZW8cWDI4G1HkJjRTvvMNlWZUGFxJt43oKeXUEsRdnoFnm+9zIZZDeVf81Mf8zd8HKK9p7+Z7xNBKmxcYsH2yTHoNGrV6/OQiSwksc9S/+iCL6Q7canhf706TT9d6HBh4A3xZ2Dz0JY4EiEeL1TbzBEbcl23Zln6qs+PwjiEEu+SBINmDGds6d7lZVR8b108brLuCWNs7tD+SfwHJRG0pADv68wwKgSWiGdQpffs9i9BO8pm0pCHfl4spVvVh8XOHLhGaHQF7yaVL7rA0x4n8fzeaVJfLYcx7Lzq8S4OS85rxeMiuXkjmB1+T1nKPFCxmJU0ugUg8edCHckdmmB7eNyh3GI7cZigEihLmm8FZjZf9/x8jkGdWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0VZM3RFSHlJcG82dmJXWVk1U3hsUWlCRjEvdFZnbkNuNDZGTUVkeWRhQVBy?=
 =?utf-8?B?dzVPa1lPL0pBZ1BLRzRwQXdCcG0yN1RWM254cUhMY1JFZFFjZHV3NUhJb0Mw?=
 =?utf-8?B?VS9yajRDQTFIczNzWnJ0TXZveFBDMCtHaTFCYXdzenJrb1JtR0lVRlUyTklz?=
 =?utf-8?B?RWR6c2I2MDhIQnBHZEliUGVhOWQwSE1BMnk4MGFlQ3d6Tmx1RGE4RXpEZTNJ?=
 =?utf-8?B?WlpXQk1KVVR2dUc5YnhHVTNHNXRoeWhTY3pFcEtEUnVEbG9jV3JKd2t1SUNh?=
 =?utf-8?B?eWJSNnFsemNBZjZTU3VxV1AyU2ZnL1pEZUtSa1ZtUStZZmxJVlFFTUZSb2Nk?=
 =?utf-8?B?bVlrbDZsM1pyY2ZoSkZueGhqYWNXcnlBODRZSlBnVnA5ZW5LRVBqWWNORkR4?=
 =?utf-8?B?M1lVWWt0Q05HSFB1amJua2NXWFEvNmxQeGlodGgrNlErUEV2b1J1K2ovQndK?=
 =?utf-8?B?aUlCOWdQWjJ2NFhKUjBsL2syRU1GR1UrZFNBUnN0cG42RDZDSDhxc2FZMDNv?=
 =?utf-8?B?VmVIV1lCWlo1OHlQdi8rM2FNQ05nVmNOWi93V0xaRHJqd1ZLblF6N2FFaDRH?=
 =?utf-8?B?TTFnemtJbTk4ZEpyZEEvZXhtMmhKVmNLS29UNnB2V1kwbVU4UjNNMnlaUVhx?=
 =?utf-8?B?aytkUU1BQXFnb3NMUUh5QXlEMHRJOGQxVVlKV1VUOUR5bVpWR3hUOHUyaDZ4?=
 =?utf-8?B?NmxhcVd3MlZSQkxZN0xrWUVJZ0NETk1Vb2YzS3BEdDBvdU1sZzNGTkt3aWpQ?=
 =?utf-8?B?alAzTEEyZUpmaC9aNmNXT2orcXFKWUwzeENNMTJBYkNQSnVJbXlMZC96Qnl3?=
 =?utf-8?B?RzNTa2pCQkJybHUyVXlMTEZmM0dWRVBWdEhBZGY4YTBmaENadnlsOVlGS2Vu?=
 =?utf-8?B?RXVGZHFXVnFFVE02TGF4bDdCYTJuamo3V3ZyZXZLRGpYMmdWYjhqeTJCWWt2?=
 =?utf-8?B?QkZVL3ZEYUtpL3VmdUZESDZQejFXMWJOOHp5NGRPQWRkS0xyaUREb00wQ2ZQ?=
 =?utf-8?B?MHBaazdwTkY3N0E2ZURWSWovMTljSGpidzNFQ1FzVHBCajV6R2pXQlh5Q2R5?=
 =?utf-8?B?ZVNmWjFzUms2QVM2dzFUUmIyU3VTNkxuOUhuTDUwb3NSV0NWWlNZdzdEQ0JZ?=
 =?utf-8?B?eXQycmFMMC9FbUxraytYbW1xNzV5Ukd5YmJZSmR1K3JwbGRpV1RRbmg3c1pz?=
 =?utf-8?B?VmhCZzhoYlEzK1JkcFlzMUcydFREbzRlSm01Yk5xTHBGTlM5cThUbitRRy93?=
 =?utf-8?B?Y09RQmxHRUR1V2FTRkNQVUdYaS9ndk9UOFJGN1h1bWlrWE5ua1h1bTBHL0ZX?=
 =?utf-8?B?YUc1QVlKRzlMMVBnc0J0U0ZmYkxDaXQvZ3RHQVNtZHY3cFRTSEZVNGZmUXlO?=
 =?utf-8?B?Y1hVM2tvZ2g1TnhYRE5mbEdtQzRucFNyMGhtd3Y2TUovOERKbkZhNjR5dmYr?=
 =?utf-8?B?bmNOdERMeHN3S2lFYlpXMUcyRjhuaVZhakhyWkMwK0drYkF4ajNCVXBrZ0c3?=
 =?utf-8?B?S1VPTmlTdzh4Q2Urb1lwSHZCbFlFd1B5NDdYa3Z1N3ZBcytvWWhXV0pRbW9k?=
 =?utf-8?B?cDJWK24vbFVLdlRzek5HRTcvcXJsbUdreThkRlQ4L3NvSER3V1lydmR2WDlt?=
 =?utf-8?B?SEFoa3BiTE9DR2JwZ01YbkZZbUs0L1NZei9JM1NMSnNiL1NGYUZXdUdNRHJi?=
 =?utf-8?B?YWU1RVNPQjdtUmxobTZJTFNMWldmRWlWWU1mWngwMDc3aFBJSEgrejNZQkUv?=
 =?utf-8?B?dVJyMFJwSjlTeVlSL1p1NWlUWmZnU0tXUDdaTlBqV0tWZ2xTaGdDSWNCN1R5?=
 =?utf-8?B?OFdqZWhkb1JTZWhZL0hoQm4zbkFXTjRNWE92NVg0ZHlyNFNFanNGMzBpNjVU?=
 =?utf-8?B?RmpCVEloK0wwcDFNcDhndHlsSFJmclcySHpvYXcvemFSeTVpSTBUZ2cweFFo?=
 =?utf-8?B?ekhYUDhKSXlpT3hoNTNJamdERmh6NDZ2MlJJRHJJK0xBWXVaRk9xd0hYTzM1?=
 =?utf-8?B?VGpzWURvL3lMRVhwUEh4UHFrSm9UNFhOQkZEWkZRMnlweVBnWllPZXNHVVdw?=
 =?utf-8?B?cjR6WDYzWnMwa3EvbHovY21ZQ210WFkrYWRVR1JiWmxDSGl5YUF1R3Q5ZHpy?=
 =?utf-8?B?UXBpMUNNbEpwdjYrS0h5b2NOSmt3SmJvZG5jTnQ2OU8zSXhoOXlRdHAzV2tV?=
 =?utf-8?B?dEF6QjJidjlnQ0NzR2lBNDZjQmtoYjBvd1pnemtLcVZkRmJVQmN6V01mekFS?=
 =?utf-8?B?b1VGOWdXQkcxRExLcE9qYW1XY2FSNkxUUGNVY3lacGZuNHJHOTE5OFZhaC9X?=
 =?utf-8?B?Y29jN250Uis1WTJJOTV6YTZLVFBKcHhwb2JKWHlQczM5T2NDR0luQTB1bFZJ?=
 =?utf-8?Q?s0cCR0rzaPpmgEsI=3D?=
X-Exchange-RoutingPolicyChecked: oB/NOpgGXqM1IUMa7e4XdyFjiWm/H65IygPTbb2aFt3u77fLwOyUSdE5V3FtSSk5W9iJWYgQCWBZau96pOFdbBJR5o5r40j2dEY/thdYTSBWT3qj+uVaks6gxJvZIlvyoXxDiqwPLM0Y2x9jYe3Zt5NaiNhMSN2ihCs/r1IknuvoNZ6q2jfFGoX5Ht9BC+ADPgHKfsfF+U0rgC/2OgeekRykb7SxH9hixXqy1vF8X1fyyqUpU1yK+ceBnGFzPGCGjnuKZjfaA0VnH2VScWG3h3cDt9BmBLBTz+UmLVgtChS+gHtnLYfiCULOd7B2LgUDTimn476VfmdF9YBqLBuKtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac078508-5bdd-4f45-98e1-08df090cda13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:11:31.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIsOseHb9jLpxEDFI4I0BHqoHsyUdHKi6rszFXraQSqWC3eVgQ3VoH1vTPyz/abMsG33yVzlxb5wNqXHd5zRS3OBvQZQaUKhmc9A2vWuc7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
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



On 8/25/2026 8:36 AM, Riana Tauro wrote:
> This will be integrated with the related address-fault handling flow
> once this patch is merged.
> https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/
> Sending for initial comments.
> 
> Add basic support for sending page offline/decline requests to system
> controller and use it for device memory ECC error handling.
> Pages that belong to critical BOs cannot be handled by offlining and
> require a SBR (Secondary Bus Reset).
> Pages that are configured for log-only handling are not marked as bad by
> firmware.
> 
> For all other valid page addresses, the first occurrence of error
> indicates a poison error and the page is offlined only by software.
> Firmware avoids permanently marking the page as bad. The second occurrence
> of an error indicates a Double-bit ECC error and the firmware
> permanently marks the page as bad.
> 
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 121 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>  3 files changed, 153 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f77531..c643c7137a42 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include "xe_bo.h"
>  #include "xe_debugfs.h"
>  #include "xe_device.h"
>  #include "xe_drm_ras.h"
> @@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
>  	return xe_ras_components[component];
>  }
>  
> +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
> +				 enum xe_ras_page_action action)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_page_offline_request request = {0};
> +	struct xe_ras_page_offline_response response = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	if (action >= XE_RAS_PAGE_ACTION_MAX) {
> +		xe_log_err(xe, DEVICE_MEMORY, -EINVAL, "Invalid page offline action %d\n", action);
> +		return -EINVAL;

this looks like our programming mistake, shouldn't we use xe_assert() instead?

> +	}
> +
> +	request.page_address = page_address;
> +	request.action = action;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
> +				  &request, sizeof(request), &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_log_err_fatal(xe, SYSCTRL, ret, "failed to send page offline command\n");

what about moving xe_log to the xe_sysctrl_send_command() and use:

	"Failed to send command %u.%u (%s %s)\n"
		group_id, cmd_id,
		group_id_str(group_id), cmd_id_str(cmd_id)

> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_log_err(xe, SYSCTRL, -EINVAL,

-EPROTO ?

> +			   "unexpected page offline response length %zu (expected %zu)\n",
> +			   rlen, sizeof(response));
> +		return -EINVAL;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
> +			   response.status);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
> +{
> +	enum xe_ras_page_action action;
> +	int ret = 0;
> +
> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {

hmm, can FW really send us such a broken address?

> +		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
> +			   page_address);

shouldn't we try to log/print other details from the notification?

> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * TODO: Call function to handle address fault
> +	 * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
> +	 */
> +
> +	/*
> +	 * Handle return code from address fault handling function:
> +	 *  0: Page soft offlined, decline to firmware
> +	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined

maybe:

#define	EADDRINUSE	98	/* Address already in use */

> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline

#define	EPERM		 1	/* Operation not permitted */

> +	 * -EXIST: Address is soft offlined but yet to be offlined by firmware for second occurrence

#define	EUCLEAN		117	/* Structure needs cleaning */

> +	 */
> +
> +	switch (ret) {
> +	case 0:
> +		action = XE_RAS_PAGE_ACTION_DECLINE;
> +		xe_log_err(xe, DEVICE_MEMORY, 0,
> +			   "Poison detected at physical address 0x%llx, page software offlined\n",
> +			   page_address);
> +		break;
> +	/* User policy set to decline page offlining */
> +	case -EOPNOTSUPP:
> +		action = XE_RAS_PAGE_ACTION_DECLINE;
> +		break;
> +	case -EIO:
> +		xe_log_err(xe, DEVICE_MEMORY, -EIO,
> +			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
> +		return ret;
> +	case -EEXIST:
> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
> +		xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
> +			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
> +			   page_address);
> +		break;
> +	default:
> +		xe_log_err_fatal(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
> +				 page_address);
> +		return 0;
> +	}
> +
> +	if (send_cmd) {
> +		ret = send_page_offline_cmd(xe, page_address, action);
> +		if (ret)
> +			xe_log_err_fatal(xe, SYSCTRL, ret,
> +					 "Failed to offline page for physical address 0x%llx\n",
> +					 page_address);

there are 3x xe_log() in send_page_offline_cmd()
do we need yet another one here?

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>  {
>  	u8 severity = counter->common.severity;
> @@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>  {
>  	struct xe_ras_memory_error *info = (void *)arr->details;
> +	int ret;
>  
>  	/*
>  	 * For memory errors, the recovery action depends on the error category
>  	 *
> -	 * TODO: Double-bit ECC errors: Page offlining
> +	 * Double-bit ECC errors: Page offlining
>  	 * Poison and data parity errors: Log only
>  	 * For any other memory errors, request a reset as recovery mechanism
>  	 */
> @@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>  		xe_info(xe, "[RAS]: Data parity error detected\n");
>  		break;
>  	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
> -			info->sw_address);
> -		/* TODO: Add page offlining for Double-bit ECC error */
> -		fallthrough;
> +		ret = handle_page_offline(xe, info->sw_address, true);
> +		if (ret)
> +			return XE_RAS_RECOVERY_ACTION_RESET;
> +		break;
>  	default:
>  		return XE_RAS_RECOVERY_ACTION_RESET;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 99b2466e2062..2fac968879b6 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -17,6 +17,19 @@
>  #define XE_RAS_MEMORY_POISON			BIT(2)
>  #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>  
> +/**
> + * enum xe_ras_page_action - Page offline actions for page offline request
> + *
> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
> + * @XE_RAS_PAGE_ACTION_MAX: Max value
> + */
> +enum xe_ras_page_action {
> +	XE_RAS_PAGE_ACTION_OFFLINE,
> +	XE_RAS_PAGE_ACTION_DECLINE,
> +	XE_RAS_PAGE_ACTION_MAX
> +};
> +
>  /**
>   * enum xe_ras_recovery_action - RAS recovery actions
>   *
> @@ -245,6 +258,28 @@ struct xe_ras_memory_error {
>  	u32 reserved2[10];
>  } __packed;
>  
> +/**
> + * struct xe_ras_page_offline_request - Request for page offline command
> + */
> +struct xe_ras_page_offline_request {
> +	/** @page_address: Page address (4KB aligned) */
> +	u64 page_address;
> +	/** @action: Action to be performed, see &enum xe_ras_page_action */
> +	u32 action;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;

if this is a FW ABI, then please move it to file in abi/ folder

> +
> +/**
> + * struct xe_ras_page_offline_response - Response from page offline command
> + */
> +struct xe_ras_page_offline_response {
> +	/** @status: Status of the page offline request */
> +	u32 status;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;

ditto

> +
>  /**
>   * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>   */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index d0341538ad05..3363f48da2b7 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -26,6 +26,7 @@ enum xe_sysctrl_group {
>   * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>   * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
>   * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>   * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>   */
> @@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>  	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,

ditto

>  	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>  	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>  };

