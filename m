Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA19CD4F25
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 13:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E1A10E43E;
	Fri, 15 May 2026 13:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3yjx8NL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B2B10E43E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778853139; x=1810389139;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8hg2f7fgHNm9n7m25V2tKBneueG2hkD/CPscUlSoJfc=;
 b=S3yjx8NLke++R6GGOOtNabct4zTyivq6UsYqBBRPOLP1IPUTn+975a3G
 kI7tAnuY68qphSMrPtT5YUbj2KoyLw5zvFfbepEtL6Erd3DWXnik1FxFS
 B3QvdZXNHu7DxA4J/bfqUu4z3eWnRi7pbG9kgi2hUJbYAcXvcHcfjtCMv
 jGZLe/NXk+rtkGhk855aqAK1ga8L+Me4cGEzf3JD/OSItD6PjMVqSJe1C
 6jK8ehviTMU8E6/dkKh40/a2eh7WOcEABEXdEQtnRyhhxitr8Bjvf4yEQ
 hv3EiKsk7VlxRKoGdWq8D9DQMJURflhH2Y5+mFClojq5iHHvipRIV0ZKN A==;
X-CSE-ConnectionGUID: sJvG9h2OQfqsrqLNao5jFA==
X-CSE-MsgGUID: CgGbWrSeQuuShLbZfR9imA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97235649"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="97235649"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 06:52:19 -0700
X-CSE-ConnectionGUID: 9wqFfURJQKOvFaoTpHIY8A==
X-CSE-MsgGUID: +RwZuDhSRVWWAhdJftzLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="243047159"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 06:52:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 06:52:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 06:52:18 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 06:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+2+A9h95Xa1jktVpLX2xRqY/g4gMHDH4utBCt9s9cPUdAckVeRsGk5lhEOptDtld2QWfYFuOw9HYWih6ZmTMyQNFwog+/7NDf/incZkiTpGJu1WZHE6LBw2UvlGkhJ3BElX50E2CEF6PZXFNE+vyzGemzCnWOWWQI/0k6R3qIYVPPG9MDwRsRm6u3yoRXXj8evuTGsBnb2e4W8kVvkSw2YnnRyD79aKDOnIAGT4eW8UgzYmMj41m+vXNAFv8OE1HSSm+Obfg9PRxYfbxl/JA5MNIq/Ceay9vrzMI1++ceuIlU2i7T/GwQf63kEktXy0rS00t1jMY1H4Gqu+zKbwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NdTtvXAa9cH71HG8kel5pbLWaGBH4SYhlKqAzIOiFM=;
 b=D/C+zz5eyKkZDPRynX4Ko8SJIzHjDGz65ubzDAx/4Mb+QeJspcPkMxbFiwP1r93w7p1uePoj0bBY+Eb75TRGGammyWuXCnYejC/p/wLNScf0xD4COLzFzzh9aji4hXdm0sygJoTwwQmmQgAq6f4c5/P7B+2mdLSNY1PJo4wjo0sgTqnQ6auvq+QgDelsRs7YxaDfD1tmlIdidR1YUYX1h2PaxPqAWYKhg4VvjYcDArQR/seteVOUXppZ5YdI4UHgGV5g80woVi2QXR1K2lT7Gd+gDRlBl70yOVZNRZj142AFX4ILUw2Xr6WgGNB3U5l2nHWE87WVvKMFmMjI07KkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 13:52:12 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.20.9913.012; Fri, 15 May 2026
 13:52:12 +0000
Message-ID: <ccec0071-5a99-4822-9344-96b79d987673@intel.com>
Date: Fri, 15 May 2026 15:52:08 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Fix_signature_of_print_functions?=
To: <intel-xe@lists.freedesktop.org>
References: <20260514155726.7165-1-michal.wajdeczko@intel.com>
 <177884599193.75062.4714606030804476512@5ab824fced77>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177884599193.75062.4714606030804476512@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::34) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: f50d8d9f-74dc-4d6e-3f48-08deb2892a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|11063799003|4143699003|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: r2qzPEHg+DIsJ3ur7VXyBFTJWiIMplACUX/WAALZYasEf6nkSdgKNGJcUbRoeI/7t1kixSh2wtQdPx7qrOcrZYWcLRr1QQyG5aAgbAKsLTMCfxltDan+mjYn/WL72VQaO783tBeTymkqTNOQ8PwPxoO+aS94tIHReMPwHPQfuAY9Rtpt95lKseeXWb/8RARhhMyrE50YJ0N3Q9ACuuykUJZmkrTojx3m1YNr6KbeZwJxHZ9z1W7tGMZ0AwPkQMrn9LS40ZbJ67Y8xRJPlncgO2JfVcWHuAh0C7ikpWmNfHYgA9g6FrEq67y1LRUo49P/Ai0uo99jrEVcFAczXoN4dUlqKkk5xjFq6gvBNcZX8XRhAYRiq1JjRgP3ly/VPZDNNQPiSsjb4jQtnwaRahQmn61tOK+k0oFpGhw0oSLK97/bqpL/z9ux7/+1hBrxkSCPFLbShAvbfToeUde4sI3fzi7b4ywRDLfa7svfj+5eS+FXBWc1c6TmYGlhenR5Uues7bsW5xz/90wsK0nm9yXuPFrZm1GUFvZMVoFPDxSv2otKS5A0+56wQzqBc4e9ZWKOKZOPYQZPKuEF8rQjGOsPUisfVXxQI0amg1SoYOudBuV33KqNVFw5sxJ0Ymmu7AF1sA2SytjtYK6jDh33yNwdVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(11063799003)(4143699003)(13003099007)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTMwNE5PV1F3VkZLV01FNU9TUkg1UlZueGE0UW8vWWw3U3FBZVZhWjlwaGxr?=
 =?utf-8?B?WHlOcmJjT09CR1FNU3BDRW1yMUhpRThOejF0QUowRDAzdWY3M2lXZVUxYVVl?=
 =?utf-8?B?UEJub3dOYlpoNnFwWGh3eTk4MWJwNlUxeUdmU1pTbnpmMFZKeFJZK3ZsbkMr?=
 =?utf-8?B?Lzk5SGk4c00vSFpsQzI1cDhSblVFNEoyL3hjeXJDbkpRZktrNVMvYkxUZHZp?=
 =?utf-8?B?bW1GZEdhM0M3bDM2RHR2TnUrYlBOZS9BZjNyZXdUTHZDdWFsZXB5NytET09k?=
 =?utf-8?B?bGliamozTjNRclhzNkYxcjhiTzg2c1ZwQVdBekhqZWwram9KWHQ2M1pObW1p?=
 =?utf-8?B?WStvZ1RmdlhhN2RHc1FhSkg2eENNSUx0VnZVQkZKSmJmcHRTY1UvQnBRbXU3?=
 =?utf-8?B?amR1ZjI4ZUEvMFUyTlBURk1yRXVNZFBBVmhVNkR5cDRZOHBiZUI2RE9XTyt1?=
 =?utf-8?B?ZzRpNjNCYVB2SGl5MlU2bVBTRjdoajZFamdwUXBWRE9iaWhIVGN1alMxYnBI?=
 =?utf-8?B?Sm81Q25yR2Q4UXpHRjlRVDJrMWVZZDJvK2pYaFl3UWtndEZoOFBIYmNpT1JQ?=
 =?utf-8?B?UVRBNXpiRytESE5jdGtXSFY2Y3puQnFsekFiVzdxclNqcHVWdGZOTXN4eTdr?=
 =?utf-8?B?Tmh2SzVkelhsUHdqMFJEZXUwVGFKNlVHWUNRRW82SGpvS0xNUy9jcmZMeFVm?=
 =?utf-8?B?L3VXMkMxNzNONjJPRjBWOUNXdXZXYzA0OE9iNjdodm1SbGtQWXkzcE4vdWs1?=
 =?utf-8?B?Vi84SzBUYlRNaW9aU1hGVXc1dG5sZVUvNTNmcU1kVDRoTFBXSVBtSXVBNTNj?=
 =?utf-8?B?bGFEa1Y5NG1DSUVzcmNmZHBEeTY1b29aRW50aWdVSlV5bzNVbzRpYlBFL3hJ?=
 =?utf-8?B?M3M5eThyd2kxdGgrOHorK25rWFhEZUo3L3E2NXBBMWV0eXBPSjBRREJHanFY?=
 =?utf-8?B?VFcrVmNJOWFiSnRHUGoreVZqWFRFNmt0dlVPRG81UHhBUTFQSDlKWWFWNmta?=
 =?utf-8?B?VmRZV052SW5tT2xJT3NteXJUZWgrZ3c3UElPcGViTEdNMm4yV3I5aUpnOHJy?=
 =?utf-8?B?UHRwZXAwbW8vcnNMQWUwTVRoMnNjbUlWdnFPZVl5S28xbUw5VERMSGlUYU9q?=
 =?utf-8?B?cHZid2xOU3ZLZis2YzBTbVQ3ZVZzRGEzWEZpZWtMTWh5QVZMWkJyaFlocW0x?=
 =?utf-8?B?WHFGMWRKc3ZjYjRhaFpZMnAwUC9iR0xpWk5FbndxWVhKaCt4MmNUTks0VGV3?=
 =?utf-8?B?bFpSY1QwV2JVOHN4SVFYMGFrQjllRDhqTitURDZHKzlQcUh1YzNUYjQvcHAz?=
 =?utf-8?B?UE5RN2ljYVlMekNIazZ5OElIcXB3MWJ4d2gvaW5UZHZDeFU3V2ljNXc1MUh6?=
 =?utf-8?B?VG1WckpNek5FOWlGMSs2S2FXUDJyTUN1QlJNbm9XOE0wQzNqZW5DSUd1b2tm?=
 =?utf-8?B?KzZPVXVZc0pMRlpRVTA2R2Y3aHFKQmIyUXpjaUM0UEpmd1c1WlYrK2x0U2Y0?=
 =?utf-8?B?cGJYR2JXalNOTTZxbVovRmFSaS9uZ3hjNHBkcE9uNlVQa2hUS3RoUEEwVEdQ?=
 =?utf-8?B?VnllSlAzMGlOVnBUanA1aXNyQkRrM1hpMGxWZmt3QmpvWGZIakN4UjNaYmpF?=
 =?utf-8?B?YWQ2V2ZPc1cwaExsL09NVytqS21HZ2ZGK2N5d3B4bTJnNEU3NUpRQitQZjkz?=
 =?utf-8?B?alloemovK0V3a3YzK09VNUIxaklSRXU5V0RiRm9aaUJubHhFaDFNVWV2d1dI?=
 =?utf-8?B?WG1mekNQeE9NTmxDSllmOHMwbXNQNk1icTRLZWtCTWcyZ2U3aGI5blVWeU9v?=
 =?utf-8?B?Q1lSN2R6Rmxla1lIQzd0ejJqczhFek1mVXhOL1NQOUQyRitPVFBTeHVrVUJo?=
 =?utf-8?B?TTdoNTFyT2V5TUtlUWlIV0kzYklBdXB5NVpwNFhmRFd2Uld3UmdEbEhTNDN0?=
 =?utf-8?B?RFh4cmpUTWYxRG5LSFZXRHBJSjZ1dVpqam8zR09KcXRVMUhLeXhIVUl2UGVI?=
 =?utf-8?B?VlU2M0Vhd3loVmxQUzZLR1E5cFFZSHNSbDlMRGozMGhRRWE4WHkzOVFrZFYv?=
 =?utf-8?B?bHo4TjBHelk5Q09QaTZlYVFuVXdWM3VBSDJZaTRPclhoY2Fab0tvY0VBRXFY?=
 =?utf-8?B?RHBvSENkMm8vVzdKZlJSa2VONHhPUTM5L09jYU81N3hkUTFwc3ozY3YzRHVE?=
 =?utf-8?B?QWFSVWVJeHFyNDlPc1o0ZmRnUVQ5bDdiMFl1QytsZTVja3dGRk13S2JMYnNQ?=
 =?utf-8?B?aURxSCthUUpoZVc0cHVVbXNJWUUxei8wOVhkZmdjanQxT1hWZXJaTGpHT3Jn?=
 =?utf-8?B?UXhwQ2c5dHhSY2xoZ0pqblJlN3pyclgyK0hCY3J6QVNmWUg3MmkySkhzWlBY?=
 =?utf-8?Q?PBy6cSgZ/ks9TzE4=3D?=
X-Exchange-RoutingPolicyChecked: G0LQEhs6tp7A4CTIytgFW5QtuxsD8kxkcV71TDyOjzTnqd2f2/rx7SLXng21q1ZZUhKVY9hVgh5XCDsfSqnyBB16lEU72z1U5U/6ArXX0s77msKaDW/EduUHUCCl5hzcvu5YsSiLVpi1qm8CZwM5cqTiObUuqlwc/J+rpydTB7qs03HCuNd54e69xUq4AhFsRoCvqvMNnz7zAjTbA9bleohthUmknhWqcf3QsLXimbqVnVFYJ02V+6B3HoqqjSlx6ifAdl8jt/zgjKe1aLCVGwBaCaXuE+QBNNAsfpnY4Ny1erxHMR3m1LR+DGIHbnvyrYqJzi9nsttm1mQdWixVjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f50d8d9f-74dc-4d6e-3f48-08deb2892a2c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:52:12.2151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvBKCduJxb2XemEieGH8A55sO0g42hi6/WUw1ZHoCYWk3s912IDEhsqGYUy5DWfRHUAj3zTXQ1Z8TXvk/cx8vnq6MVNopjhxw+MpaIzlZDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
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



On 5/15/2026 1:53 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/vf: Fix signature of print functions
> *URL:*	https://patchwork.freedesktop.org/series/166583/ <https://patchwork.freedesktop.org/series/166583/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166583v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166583v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88_FULL -> xe-pw-166583v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-166583v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-166583v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-166583v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_module_load@reload:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@xe_module_load@reload.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166583v1/shard-bmg-2/igt@xe_module_load@reload.html>

unrelated

<4> [152.912942] xe 0000:03:00.0: [drm] Tile0: GT1: GuC not ready after disabling idle flow (GUC_STATUS: 0x800370ec)


