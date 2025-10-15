Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF9FCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CB910E8AA;
	Wed, 15 Oct 2025 18:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QC+tDdq6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE9E10E8AA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760551343; x=1792087343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aoQXuxpk2WPVnvM6NaY3j26Wlv17hPiwAe3GyqlDwMA=;
 b=QC+tDdq62ACqYYdqFp0mISXYGxfP2eqxHxx9CN01KJo5yTm2oLTnd9nC
 cmmCivxhbmk9tFzvOd0OiSBystvpNhRQm91DUqj8GpZnqMMH7bGU2svhX
 InjasRmLnBIib7nHVOg9hglYp+kJz5kvRYCF97PSPEqgxoYO5O8emWXYu
 H2GU6SLKANSKsT8/KUexgDm5w8L4D2P+4DOogVMW2uiBlkLSZFyY/6O3S
 oOYd5PTWuI4lCzWXGjnMCKvVdUVITwJYyNqOOKCi4zHgpRPNosjXB8kaA
 KTlrxB1PV0HVk5YFY2JVpSO915HVCOJzzfZsMrtzDJp8ZkPU/R5USsmuv Q==;
X-CSE-ConnectionGUID: 78flb9XnQtC3NgokO0hL+A==
X-CSE-MsgGUID: +XNVvI76QnWeosNOEcWTug==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62885397"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62885397"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:02:22 -0700
X-CSE-ConnectionGUID: UsirKV7QQpKrD6ig1ABgMA==
X-CSE-MsgGUID: kgo332EQRnGOxUM/MuRVhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186496528"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:02:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:02:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:02:21 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:02:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1T8PKT4dyzFnmACGZtc1YER5vNq2S6txVG3yZXkpTyJ4A889oK2iJ1OKkAg2Ip5O7AbkUjf720uht7ryy+duaK4RsZbbutDS1Bojovn4b9KICoImxR9xCbDVphMmgfIJWdB7lC3rfTdGZaP6EWwdA8KNvT+WL69RK/qi+Axs1ix2vbPTCYKXOrpnFgdh/W7FmbkrVGepEvN3h7KkFwzKFChGOtbin3nWDFFdJoK2TaYZrwMEbfSgca8RpI5Ac7zXz6xjEiGdlEWucvbzAgV7v/1yI+T6bQ0T5tzvU8N0+ZQJkmo+Yib/h0sxHToVoaIv4d4tDWgiPASJpUAc6A0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIt2dYTRMN0cyr553Frk3AbXVFMCCFbICucCQKNAHEc=;
 b=wIAEaO01Q033N/mmGSlUkpJn/DaOxsItDb6gn8TDxkR6vZm5MiB/idZB7yT/Trf9CUxVWHzlj2x+fkqkpTFDfV0UNiKosanZqyd1tPwyXU7ypV2ggfwaNWIvH2EVWSaNyw/hRqhi/QXE5zqWaEMfh4pbN9eeuGUGpVM8XnX3ccJGHbM2EF2UBCLQ8+OLgC45gOk1S1RbQEBzkg1nSi80bSLW6Bn6ysp2QvpAxkpWukZnG+scseZb/8qDGonHZfSpulFp/mrtd5rSWvHNOKhXgckOBjzKUIYwqIn7AxlOiAqbHbsGXvKc8fXK4rlnsTV8bTkDypUS/Dth3s8/buKAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 18:02:20 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 18:02:20 +0000
Message-ID: <5dd62ebb-ff5c-4ab7-a7d8-88a191105490@intel.com>
Date: Wed, 15 Oct 2025 11:02:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251014033646.1619865-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e6dfae-6e57-434f-af5a-08de0c14fbcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmNsam5OSUVBU1NVcjVWM2JuMDdTc0pUekFRNDBGQ04yVzFpUkY3YzhNV1FO?=
 =?utf-8?B?b1Z4aS9jS2hpQ3c0MUxaSEhOb2YvaHZZYldldWt4dEJ2MmkxdGdVS0xSK3p2?=
 =?utf-8?B?bmEyZlVvc2VLZzIzUjlKME1INVFDckhnQmlUOVlyb1VYVllidVNML2R2cTEr?=
 =?utf-8?B?ajE5SmNFaHBYZkpud29yellqQ1lvWWNnaGdXOHMzYk50cVR4bEVlTnBuRjNp?=
 =?utf-8?B?VXJBbXAwQ1pSbzg1QW50RmVBZW1MNWdocnIvTTlwMERFRXQ3R1NwVlJHbTRh?=
 =?utf-8?B?aEVpSWw1OU04MFNlbUJwc3VwMjhLa3ZBSGV3Y293WHVLTCtPMmlPQXpNVTBY?=
 =?utf-8?B?WDNPb2JhWkxxYlB0dE1LaHZnM3NiU0dWdzJmVGdKalFra0lseDNyS1R5RjIr?=
 =?utf-8?B?Sk5UVFpoMmFUNFkwaG1UVXMxRlkxallPSXJpMktnek5FTTZQWU1PekNQQWVk?=
 =?utf-8?B?aUh4L05Hak1RTDBBb0RqekxrbUJ0dTlLSVI3YW8rclRTTHVJelZ6MVFiT25x?=
 =?utf-8?B?OUpxMy83OG1HUEEvbUxhT0pUaENqcjNJUlkwRitBRVQ5MllvQS9iRWhuQ3Fm?=
 =?utf-8?B?NEJCbmkyemwxTEU0MkNHMWl2OTlQWFR2OW5zRUtXWGg0d21obWJZMndJUjlP?=
 =?utf-8?B?YXBqbGZkQkJ6K1d1RnZiaHpCYjI0Z1U0T3BBSm1JNko3aFJzVXd3WHBqRHhF?=
 =?utf-8?B?MHZSNWszeGwwc1BzSjJGNlpCTmZUcERjd2tObG1MbG8ycm8reUlObFgydzU2?=
 =?utf-8?B?cTNIR0lsYjdvaWRIeUgyWno5Y2ZyMTRLUmJ4R25lMG41NitwMk0zRGFoM2xh?=
 =?utf-8?B?QWNENFF1WHAvVVdjMlk2M2JsdElaVUx5ZnY5YnF0U256cCs3OURNL2xYOWMx?=
 =?utf-8?B?ZG5JQ0xrN05yamw2RUk4V2N3SzRCbEpRVzZGSkQ3cXBYaE12TXlDUm1Feklq?=
 =?utf-8?B?YlN6RkFROTVpMnRaWHpqZHBjVDR6NTRwSTZZRWxQNFBtZjdMay9pOWtHWUJ2?=
 =?utf-8?B?N3EwTE5CZExLY0tCNmVGclQvUVpCQjlFZVJIenU1NW9wOXRweUhQRkNVMDJE?=
 =?utf-8?B?WDArU0pMSTVmbjVGT2tublFOTkZJTjRVMGFGelRhclkrUVNPdVRaMWF6UC85?=
 =?utf-8?B?WTlFRkY2ZkQxQVVBdnV1NlpCaGY0KzRZcG5HN0ZkTmRxWklmQUQzT0plYmlk?=
 =?utf-8?B?QjQwMGpMSVZpV2V4bUhSSjZjdjFUTnRuMDc5NEdWbmRqd1NXT2FCL05Gbk5Y?=
 =?utf-8?B?WGJ6aWE5MHV4TXppNVZUOFFKd1ltZG1yN3dneW1tbnlFcTNhSTFoaW5WN2Ir?=
 =?utf-8?B?d1pRRjZWVzQvcjhzWHZzZlVZVUpzK1hMaWNkckJBNkFyM0cvam5rR3NIdTZi?=
 =?utf-8?B?M2pUQXhlT2phVVZQb3Z3eXZDVHQ1eU4yY0FlUStlR3EzcWlJcFB0blFTZVBr?=
 =?utf-8?B?anRVTTZtRit1RjBFOFdrYnhiK0VaZkMrMW9ieHo4VS8wUEhqUVRkNS8rbURM?=
 =?utf-8?B?UnRnL0RJS29WdDNqdWRLS254K3hGZjRta3FZcFZ0RkY3YnRYVzJyRDVwRGJu?=
 =?utf-8?B?aWsrTjZDdE5UaGdub2VtV0JieWROa0pUWHVGcnRHUU5TUFJ0bGhrYW55d3Vn?=
 =?utf-8?B?dWludHIrTnhpNUtmTGVRdTRpQ3c0aGc0STZjTEY0SXhUeGFMWm9sM2thbVdh?=
 =?utf-8?B?TWQvNDN5RElBV0t5cjhCaDcyb1crbWlrV1JpTG85OTdtejEwZEI2aUp6WHpY?=
 =?utf-8?B?SU1QSVZzSzNkSURQTGhYbUVFZSsxb3NvVmRQUGozczVBY3d3N1RuZFNXeUc0?=
 =?utf-8?B?SGsyQXFjNTFVZXZHbnNobGRQNFhraWQzbkRzNndCTXZNRGtFSmxQY204aU04?=
 =?utf-8?B?QkU3N3M5Y0hhUVVyTS9YN3IyN2hzUUU4UDA3SkVySG5kUHk4RnZSWStnWUh4?=
 =?utf-8?Q?YVDKnqSQ3BWHRJCDKSTQMrP4csupAPcz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHA3SW5LTzRMYWw3Kyt6YWtZd0F2d0dQa0lhY1NoRlNkN1N0M1o4NXZIWnFH?=
 =?utf-8?B?VjVObzhuWkFwbFV0dmEyd05pN0FMRXdVb3ZKTkpaVTF5VFBicDNXT2RPb1BK?=
 =?utf-8?B?a1BJVzZ0VkJ0N3Y4dXowWnJJRUNMMnAzdTNDTVVpRnYwcVRDUGZFblFaUGJP?=
 =?utf-8?B?TjdSeTIvVUZzWWo1amE1UmgwSEZqaHAvZ2xWcjJsYzVJUHgvUUQ1Sk9DR1Y2?=
 =?utf-8?B?TWRIVjQxL05YWUZkbXo4alpWMVJsLzdPVmN4T2wwV04rdXBLNmVaRmZzdERC?=
 =?utf-8?B?bEhVaVNiTUNoZkRMeVNsODc4b0Noa3M0ZXpmVjBQLzhMbGh3UlIzV2FpZ3d5?=
 =?utf-8?B?R29LNjI2VmNPU2RMTk15SmcweDdrYUJDcXFaNFpGTExWeno0bjBudG1NK0Vv?=
 =?utf-8?B?blIyaHhhY3llZWxDWm5zZDJNSW85a2g3a3kvdytDL3dHU3ovR1VwVk9oRVhE?=
 =?utf-8?B?aVJBeXZJS2EvcWtpRkxreGtSWFJUM2JPQmkwQThOcEVjVjhJYVNYRGFvRnQ1?=
 =?utf-8?B?aXdLNWY1aklVSmU2b1pnYUVjQmwxaUxEb3Q1Y3ZJR2VoSVpoSVhSQ01uSHcr?=
 =?utf-8?B?dmpiaGRwclgrbUJXdkdWdTBicG92SWZaTlJVTmhtYnEwQk1zK3VBQmdHV21P?=
 =?utf-8?B?NjNUK0hhUWJwZFpJU1hlLzFoSjdSYk82YWxvTGlKWUJBNEhZdnFCMmRMbWtX?=
 =?utf-8?B?R3lvUEJjQXlMZ2xSUzFLbnJ4QS8zeVVlUGMwNndreDhHUkRrVjk1NTJaUkhV?=
 =?utf-8?B?Z2NzQzJMYVFnQ1FoSW5USGlNNXp0TGxFZFBXM2ZvaTl3ZnBFOVdmWnlMeE5J?=
 =?utf-8?B?V09oRVg2TmtUM0d4YU1QNzFsWElVYlJ3NjVJMERMbGo1ZzRZczgwcitCeE5M?=
 =?utf-8?B?VXFRck5aT04rbEk3dFJnZ2NieWVHRGxQQnpHWlNVTDMzUzJmeTVvZkIvMjQx?=
 =?utf-8?B?R1RkUFJLcnNnRzgwUE82SjhIYmZxZThnQmU2QnNiVkIySjJ4aUNOWlJXTVox?=
 =?utf-8?B?aWduUUd1c3pUKzNmUkQyL0pTK2hOUEZFeHcra3NLUXhabW1GMlF6b2pJaW0x?=
 =?utf-8?B?K1dEMlpkK012MS9RYUZvTGhySzYwd3NPakpDVEtlcUdobDZib0ZPTm05SEZi?=
 =?utf-8?B?OFFsMWh4MnNBcGFmOC9ZYWFsVW5HWHJBcjNjbWVJK2JUbWFKZTRvLzhmdVd6?=
 =?utf-8?B?SmhneWcwZDQ3V0NCbXdzYVFpM0MxdnZMMzVva1ExRVhMMHBqbXpxempFb1FD?=
 =?utf-8?B?L0twQ3Y4K0tRa1NMZjBReWxrcnBtZjd6QXdJU0dpVGVFRkVwSXR3eWI2d1Zp?=
 =?utf-8?B?YWp2WTNNdWF1eVhLQmkwczFsZFFmaUlEN2x2SCtid1JPUVVheVJNTG11UHNJ?=
 =?utf-8?B?TG9Cc21zZUdXVVB6MEZ4dlFEc2FHQmhqdXVET2F4VWlGM293MXlSeXltaU83?=
 =?utf-8?B?c09oTi9Qa2JhUkFLaUtaUmZMNkgxRVNiUGlBbndEVzNCclhySzJoVnA4WWlw?=
 =?utf-8?B?Z3F4OE5TS3lOMGszWFJBUFhkTUUzVm9oRnFPT2djamhnMHpRRHB1S2pFMFpJ?=
 =?utf-8?B?by9aL3BLc2I3V3A4ZlU3bXZUTzF3MG9zVmk3VG9vN3ZGSFZBVTJsL0M0bTdw?=
 =?utf-8?B?K1pCSjF2ckVaSUViK3VYOFRRbU4vSkZET1BvNjE3ZmlEZDY3a1pXK05EZWlJ?=
 =?utf-8?B?eG44d0xYZURYa2Nnam9WVjJmblBWQnhHQTNlcldVYjBGcVkzT29yMmg0NSta?=
 =?utf-8?B?UXloVk5ZTGFZRmUwVXZkdVJvQUE2dkNxV0hDZXhDYmVUODhRQVB1NXNQdkFL?=
 =?utf-8?B?bzhwS211N0xxeFJpcmptUGtSYTMzZ1lzTEVRcFU0ZS92SmJSRm5xejlGMGNo?=
 =?utf-8?B?ZERud2t4K1J3WHc0dTdHcU5hMnFVMDRVUFZ3RWthZk9scDVWTkd6NnlYellF?=
 =?utf-8?B?aHlkOXRKcXIvLzYwdG05S3E1SGRqOXd0UlhsY01XdVhnTzBIZmFzMk5FZ1FF?=
 =?utf-8?B?WnB1ZkFzMDkzcmNiUk5wSW1HQktEWmRETHluQWcySm5PbUE2c2lYbkwyeG5o?=
 =?utf-8?B?M3FTT0I2dWErRmUxSHMzTVFKellyWjRsV2JQQzRhTHEzV3pYWnczcjZ2cGg5?=
 =?utf-8?B?eHc4K3dTQ3pUYjcyYms1Q0FaakZjdCtQbXNTM3RkRndtVXY3ZVdpbXFzQUJ4?=
 =?utf-8?Q?UDRHQLTsBhfAJWWG0IIlEQY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e6dfae-6e57-434f-af5a-08de0c14fbcb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:02:19.9567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omBAMMTCMVeUkMgpvdQWlHJ1ldOolPgibFIeBOKTe+hm98E2U/LPWX7jM9Ju3rk7b5DPf1nrybZglNiwTHZj+bwjfBluDzc4Boz9reqxF30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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



On 10/13/2025 8:36 PM, Shuicheng Lin wrote:
> During LR exec queue cleanup, if the GuC firmware is not running,
> the driver cannot communicate with the GuC to properly deregister
> the exec queue. In this case, directly destroy the exec queue
> instead of attempting deregistration.
>
> This prevents schedule disable failure and GuC ID resource leaks as
> below dmesg log:
> "
> [   50.242564] pci 0000:03:00.0: [drm] GT0: Schedule disable failed to respond, guc_id=2
> [   50.242568] ------------[ cut here ]------------
> [   50.242584] pci 0000:03:00.0: [drm] Assertion `ret` failed!
> ...
> [   50.244942] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> [   50.244970] pci 0000:03:00.0: [drm] GT0:     total 65535
> [   50.245002] pci 0000:03:00.0: [drm] GT0:     used 1
> [   50.245032] pci 0000:03:00.0: [drm] GT0:     range 2..2 (1)
> "
>
> Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0ef67d3523a7..d2dfbdc82920 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -47,6 +47,8 @@
>   #include "xe_uc_fw.h"
>   #include "xe_vm.h"
>   
> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>   static struct xe_guc *
>   exec_queue_to_guc(struct xe_exec_queue *q)
>   {
> @@ -1060,10 +1062,15 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	 * state.
>   	 */
>   	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> -		struct xe_guc *guc = exec_queue_to_guc(q);
>   		int ret;
>   
>   		set_exec_queue_banned(q);
> +		/* If GuC is not running, just destroy the exec queue as we can't communicate with it */
> +		if (!xe_uc_fw_is_running(&guc->fw)) {

This doesn't cover the case where the GuC is reset after we send the 
message but before we get a reply. There is also already a check below 
and inside disable_scheduling_deregister to cover the case where the GuC 
is not responding (guc_read_stopped()), which should also cover the case 
where the GuC has already been reset. That flow is probably not working 
as expected, so it might be worth having a look at fixing that instead.

Daniele

> +			__guc_exec_queue_destroy(guc, q);
> +			goto skip_deregister;
> +		}
> +
>   		disable_scheduling_deregister(guc, q);
>   
>   		/*
> @@ -1088,6 +1095,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   		}
>   	}
>   
> +skip_deregister:
>   	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>   		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>   

