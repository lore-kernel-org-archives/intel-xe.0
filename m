Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895DDC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 14:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4993A10E410;
	Tue, 27 May 2025 14:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvz4n+sw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3A610E419
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748354473; x=1779890473;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zIucvuTIm4bwiDQLWqZQA01tvLCrCxDOVMMFXA88sr4=;
 b=cvz4n+swE9DP/i3ru/doduCmRUyc7j1iqfSZp443NIxyjgo1hu4wlY6D
 n/5b8Phu6Ua1LMvylTI1S/H402dliBcYEqyW1ktNTXRU59GoMhIgRUNyV
 sxNFmezJkq1lUY589FX4Sms62LPlTFADmBeMBSTjuBfULb2aNf0qS0WSD
 M/ohxUzbMXOEBdxhNnnsZdw9uALh0zVkAirkArXlGzf9KatXZWQLbBToj
 8hw8zA8y6bXnsSspDmcza9FQXmOiUaVjSEyDwmknKCnq49btvuUjqfiOO
 rtY3YB40iFz4zYBinjriCyx+TDZnQHEE3cplbk00771ArmeBrcXycPVe7 g==;
X-CSE-ConnectionGUID: br+2ilVXSUuiYvmid8x5JQ==
X-CSE-MsgGUID: sEZwPg/rQPyXA4WhvPCfLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="37969691"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="37969691"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:01:13 -0700
X-CSE-ConnectionGUID: lG57x/YNTrGIXNgRC7BjWw==
X-CSE-MsgGUID: y5gWrZL2TfWLDS+Ku+5VGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143792673"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:01:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 07:01:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 07:01:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.83) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 07:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgESwIpfDfeKs6AKrOjj0eruTdVcw9cUgGEu+jw/oHS7h4k0AZIKyF5JPwUhdoiN088/JeTitqxtcH3y1CoEXilov34nAjzufMkOf9b5a4g+hIS0cJgzNADfm9G9pKFfBB2t0Ewbz51PZdk9ys3OnUEaAbqOGUYA3INHrgIOdYAeEsenmqroJkFm9Qmu6FQYkrt/o5yEARLPqzCzOEuJAQB1WB8AUNtSJhtkUSIXbQMHnrxAZa4SuyIa6RMgb3QW1dcumkOilWSLcjEVkyiWUIJ1xglc483L1t1gRy4efoJXzsAQ/gd1174k6RV9xyde034qkzDo9MRbn6E+Q72G9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Dcgi/9KNU7xkBWZP8AqqdL7UP4RoekR+tBOHq1oYbI=;
 b=PMz5x2Ow1srsw9dqu98iV1+TSHri86M4Fw8rTJf60KMJrlspJoHbR2ckP/Q8SqfNqbID1Zv/52QJvCT3IH2YNN/65/sC34KuyCvFYyn1TvUahqYNgLin2lr80uroGUovBeo+YsyKyPBaMGiIi0H5w/UsDzgPocae8w2BxuKw4T/k0LqfALyjSlV6YksrTBx4n95t/QMae8FSbrksaNvcwuWU+YXKOAt52uR//DNkuBkSUx96m3OzoqlHq3x0pcz72lzuPtR0u7VXyz9GFjZGLCCB16VBWXzfiqMQixFS+77JI53JERDATUdWuDJFu4jBkUkCfoQDNwMIKpVjWWZTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by DM4PR11MB8201.namprd11.prod.outlook.com (2603:10b6:8:18a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 27 May
 2025 14:00:40 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 14:00:39 +0000
Message-ID: <b13e747c-3659-4b2c-86dd-f868bb47401b@intel.com>
Date: Tue, 27 May 2025 16:00:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: Jia Yao <jia.yao@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Brian3 Nguyen
 <brian3.nguyen@intel.com>, Alex Zuo <alex.zuo@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>
References: <20250523150418.168362-1-jia.yao@intel.com>
 <ea09cbd2-5752-4a19-ae5d-68f88484dfa2@intel.com>
Content-Language: en-US
In-Reply-To: <ea09cbd2-5752-4a19-ae5d-68f88484dfa2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR03CA0100.eurprd03.prod.outlook.com
 (2603:10a6:10:72::41) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|DM4PR11MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b205e6-b308-42f5-b408-08dd9d26dcd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnJMc2ludGVXL1JZenFycEhrckFoZE9Qd0kwTDhxTWxtY0hWVXlrTkdVNnpm?=
 =?utf-8?B?R1Flazl2ZlJWQUtMOS8wU2RncWJ5b0ErbFRhbU0vVWxXSlZTY21GeFBUM3k4?=
 =?utf-8?B?bDZKRFNTU2lRcXd1cE9VQUlCbWNLVGJBV3lTajJVWVBtMTBMdThnN3NDeExO?=
 =?utf-8?B?VjJrRTBnQnAxUmNQQzBhdkVzeURYVVRDYnRhVlVyN2ZMMTNKc3RBRXF2SmEy?=
 =?utf-8?B?YnloeE5Qd3ZUMXFScUJ0THU2YitCSERuS2lvdDhjMHJIMWtMUW1odjBaakJj?=
 =?utf-8?B?a1lSTndkMDJGUWNxUlJQWUpKSEZQL0QvOTg5SkxJL04vaitrVkJBdjdzL1Yz?=
 =?utf-8?B?b2JGSHlDOHRwbkNzc1l2K2dhdzRuQVoxSG5TV1JkYkk3UHZseUlQbnBKRks5?=
 =?utf-8?B?cVJwWCtqTEJXa2JoSGRPcUZvZEFKYzJlODUwbXVNVjJLa2xCcjU5MjljRkpZ?=
 =?utf-8?B?aWIvWDBXMUtSaHN1RzN3WS84b1h5bkJPNHhyTG1ubk9zUVJ2ZWduZk9WdVcx?=
 =?utf-8?B?dTRGRDhIUW1UelBZbGR3Nys5QUpXV2h2aEhuU1QxN1JubmlMVjVlV3pqb0pp?=
 =?utf-8?B?VXQ5V3RzanFySmdIUm5obEV3V1g0QW5obUorMzBBVDlaL21VSlBsUVVBdklp?=
 =?utf-8?B?SzRXcm0rd0VWZ1BqMWQ0Q2p1MmN6Rk51blZGOXNEU0hPWjdTUU9EbG5RVVRG?=
 =?utf-8?B?QitqTXF5eG8zR0FYNHlPOGNmOG1rRWNyVkdZR3p1alpuendkOERyOFZvN2VY?=
 =?utf-8?B?dXhBWUtyYSsvOHdEdTJkY2ZSUjNNMTJ2V3R1Tlg0QVlMYU5JQ3lVS01BdXJr?=
 =?utf-8?B?OUQ3K0RYclhBeTZMeStRbmFYNmVMMEsvUW5CaDBZNlpJeFB4eXB3VzJKeVBP?=
 =?utf-8?B?eTgxYnZuQ3NZTW9JK0x2djBNQ3ByTmJJRzZiOEl6NlNFRTFFM09CYTFqNys5?=
 =?utf-8?B?Rk1tYTZpRjg4VkJ5RWRYd2xUejg3Vk40QWZBU1IvNDB5eS9nTGxsL2NqVHJq?=
 =?utf-8?B?ZGhMNlJpL2VxYTRhSUx5T3A3OWNoRlhOeXlsNW5YVHBtaDYwVVZ4K3hBV1ZN?=
 =?utf-8?B?ZUVXelZUS2dCRnEyYURaSEtzRWJHRFdJRlJva1pCVmRkUE4rK0JGa1cySlVx?=
 =?utf-8?B?UkQ4dnZ6ZjNreFB0VHBJVGxwNVpRYk55NkFkZDUvVmp4TzRGVTNFeW1aYkpr?=
 =?utf-8?B?LzhzNmNhQitZRm9ZdlBCQitMLytOKzFRenN6N1V0OU91OWJ5KzFESDVGRTky?=
 =?utf-8?B?eHA2a0pKYjR1ZnBVZ2JlaXE3VTU4aWpvQzRUemFWMVFQczRYU2d2M25SR0xw?=
 =?utf-8?B?S1FrU2dBT3FkcTRwSWVxTTNycmVpQzY5MGoyQzJEREdiT2VadHBsb3JyZzFU?=
 =?utf-8?B?dkFJbnN2OUE5Ymg0N1dWZFg4THF3S25uTFZmbUYrOHRnVFczdlhhSmdDSFBk?=
 =?utf-8?B?Yng3U2gyTTJVTWZqUUEwYlYvNzVVelJ6K0xwNjBzNWNDZ3RwR1puejdzNTBS?=
 =?utf-8?B?RmxraDE0b3FVQUZRRlpGZDVxWThnRmRVYUhIMkxNVWNjZ1c4azNGeVJIQzUv?=
 =?utf-8?B?UnM4dGMrcFB6VHR2YUZXUlVUeXEyZzlFYW11elVpU3Y3VU9ScjNVRHJsOFR2?=
 =?utf-8?B?SUdpU0tUZ2haN1lIRC92NEN6bHQ0ZTBrWDhGLzAzYzFWK3lBZkJxTlNub2N6?=
 =?utf-8?B?REhNaUVsODF1TUV1dmx6WXVFazhQZ1NSK1RRcUpHN25HUnB5ZjZaWUZlTFd5?=
 =?utf-8?B?cStyTi9TWDV0Rmx2SElDZnI0N0lmYWlLUlBuVXpVVGRPTFc4OTJ3RnF5ZHZT?=
 =?utf-8?B?ekMwZ2hsbGdycGhzNC9wUDhrU3hyaHNiNFRQRFR6OHA3Z0x5V3dLZG9kSGwv?=
 =?utf-8?B?cld1NnVLNC84VU9BVVhLUzhyMzluRzZpMVZiWEZ0REN2L2l2UnZXcllrK2RB?=
 =?utf-8?Q?/HktMi8gaZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFkrK24ybVZtK0taRnovMXZHc3RNYVpWbnE0U0tBVEFVMXZxSFU0ank3VFZk?=
 =?utf-8?B?K3JhenFqeTJXMXhmZkFXREZ5SWhDalJIUWNrVHpsNTVNdGN3WTkrelhaZnl3?=
 =?utf-8?B?dStnY29oa3FQVlJQWXVmelNtK2UvOXJWZGkzUy9IMURGYTMvVWF4bHptTmov?=
 =?utf-8?B?L3c1a1QrYUwveHIzcThCVUNZSzVnQnM1enNFOFdoNEtkZk4xcm5KMkZDc2hN?=
 =?utf-8?B?UThaZlhGZDJIYm9zTmZiZ2piRm5NMVAwR2FGU2FOY05HVGFLMFVCelkwN0g5?=
 =?utf-8?B?d0F5V0wyYUxvR0YwL3pRZ2p1aU5ydXU3clhvbmU1TS9kaDhzcTlvSnpGMUhV?=
 =?utf-8?B?elBQMTlhc1AyN2h0WTgwb1ZxNjFIRGRXWnVxS3lhcCtEbzZvNTRlcDJveENv?=
 =?utf-8?B?cDZMNXA2WkpkSDBSZjRWUURVNTQ1RklndnJoSG9ReXFoSHI5ZHhkY0tqVUNV?=
 =?utf-8?B?WktrR29tNUh1OVA5S25qTWJtQUNuaE9Ba0M5dVVjSDZ3c2pEL3NCeEIwRlh1?=
 =?utf-8?B?ODM4VmQrZDhtZ2p1MjdIUmpJajRHK2xKNlZHZWVzYTBacWN3VDl2amgrdC85?=
 =?utf-8?B?V291MWdvWU50bHZSdktBblZEb0pzQXoxYkk1bzVROTBxTmhQRXlFS29sL1lX?=
 =?utf-8?B?TmJwcDJsc1c0TzFNSWxyeTdKRElYQ2QrREwwaTRHUmZFZE0rai83ZXNCTEo4?=
 =?utf-8?B?RFc4SVdTZTNLSTlNcHA2QSs1dGFudktoMFZVUHhYcDR1aTFYZVN2TGQ2L3cw?=
 =?utf-8?B?aDdmTUI5c2FKcEtQQjZzbzc4UCtaRHB1UEJZYi9RQXo0SERRWGM4VUkrdUdB?=
 =?utf-8?B?Z0dxWUZuZnlWQWNVOEdxbGJHc2c0K2xSRUxaWFV3Y2o4K2puK2FGWVhLWkR2?=
 =?utf-8?B?a3Zad3I3MXBOUlJoRzRIZS9EUUwvSFNTbGZua3VFL2hQckd1eU15Mk4yQU1G?=
 =?utf-8?B?UEdUMXZJOWlaS0JUVjdhU2tObU1xdmIrdWNIVHRrNEhqSDNzakNKQTFlRmRT?=
 =?utf-8?B?S094WmFlY3RHVzExd1E2ZjBNUy96Z0tuRzBaSzduSk5kUjR1anRpY1lpbDNu?=
 =?utf-8?B?aWhZVWV4YVIvRkxoYVExZDllZGJIa0hKMWVBQXBoek4xTUJscTY2MC9jYllF?=
 =?utf-8?B?ZGEzRGZxbGhxYWlybmFkSW54WnN2REk5ZS96cUY0WjZKSjNMb013ZEdyVmE5?=
 =?utf-8?B?VW00aGc5STdOWWIraXJ1V2R5MWcwVmFvSHZSRis3OW9aSFEvUUJTelphWHVk?=
 =?utf-8?B?Y0xXVTFYUzFIVGNXRW1Ea0pKcEFIb2NSUjZNTWlUaUZYSGJrNlErWGFkTW1i?=
 =?utf-8?B?QUlrN3pvRzZLNWJMSkhZRG9FYzZwUDQ0TjEyU1B3Z1BTZHBDT1pIRnJyRGJU?=
 =?utf-8?B?Mm5EbzN6L1Y0emNFc0dPR2ptbVlMb0VTa01GSXAzc0hPdUJ2Z0xmcTdyN1Jh?=
 =?utf-8?B?UjlaaEdUVWt3WU5JWVNrNXhPRkhIbjQ5SlhNODdGTmRxdThhdGFvT01Kb1Uv?=
 =?utf-8?B?d2JEMnRpaXJtSW1Gai9Tb1pycEx5OXBnbzB6V2J2Tk84UVViZFo4eDJCcUgz?=
 =?utf-8?B?VmFuYUZDTC9mK3pHRHBWMWorZE1KUjdmWXUyUldvTTRUT0xRaHhVaWwwb05y?=
 =?utf-8?B?L1I1eHJkdjFTMDQ1ekFHNWxVbkUxTFpFZjc3aml6YTB0QjdQekJXRjN1YTdR?=
 =?utf-8?B?RXdiOWkwSE8xYVMzVkY2eERxY25kanhMVFZBMnkwNEorNzBuSVVaeGxtZFVU?=
 =?utf-8?B?bVdySFNxZlFJdk9qT0tNc3dWR0NWQWFCUm9YU3VzYmQzYkVzUURwOXhxWk9j?=
 =?utf-8?B?K2Z6NU9vWmVwaFVBYWJmK1g3bVFibE1Dc3RRUmQ3TytXRjkvM2tBQUpZL1dM?=
 =?utf-8?B?bTN2azBKNkRVQzlBdG5vNUNpQ09tdHFmTnVDYUdhd2lET0xjaDErUU1PYStU?=
 =?utf-8?B?TGZ1eG9vcGUyR3p6MGZHbjRoR3hyM1BRVEtDaW16NXJoaHhzbzdQRlZLNk9J?=
 =?utf-8?B?RGZGMDNOS3FMSEpFL2dRMWc0Nkk1Q1NheHZSc0dVQm9NUG54dFBMUU5LL3Jp?=
 =?utf-8?B?RjR5R2grazFGZmVKclcyTzdwd09tc0dQY0ZuRW1wY2tLSTlINEsvZVJUY1d0?=
 =?utf-8?B?VXFkUjlEOUpTUndRek9EWHE4OVpMVjNDU09oelJzQ3YxeS9YUjAxUCtRUWxQ?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b205e6-b308-42f5-b408-08dd9d26dcd5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:00:39.8679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEyU6zqJn22JxD5dCF1l4JkRf9xBOUp29heMu+/Y/09J08waXLEz9i8x7N7w6GOYtGEOjx6Oo7mUEULZA2W1q94pLONlR2ch7CCj2HZCmzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8201
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


On 27.05.2025 15:07, Maciej Patelczyk wrote:
> On 23.05.2025 17:04, Jia Yao wrote:
>
>> According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE.
>> The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
>> condition 2 * x + 1 <= 0x3FE must be satisfied. Therefore, the maximum
>> valid value for x is 0x1FE, not 0x1FF.
>>
>> Bspec: 60246
>>
>> Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM 
>> support")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
>> Cc: Alex Zuo <alex.zuo@intel.com>
>> Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> Signed-off-by: Jia Yao <jia.yao@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 8f8e9fdfb2a8..be8f05574850 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
>>       XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
>>       /*
>>        * MI_STORE_DATA_IMM command is used to update page table. Each
>> -     * instruction can update maximumly 0x1ff pte entries. To update
>> -     * n (n <= 0x1ff) pte entries, we need:
>> +     * instruction can update maximumly 0x1fe pte entries. To update
>> +     * n (n <= 0x1fe) pte entries, we need:
>>        * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
>>        * 2 dword for the page table's physical location
>>        * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
>>        */
>> -    num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
>> +    num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1fe);
>>       num_dword += entries * 2;
>>         return num_dword;
>> @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct 
>> xe_migrate *m,
>>         ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>       while (ptes) {
>> -        u32 chunk = min(0x1ffU, ptes);
>> +        u32 chunk = min(0x1feU, ptes);
>>             bb->cs[bb->len++] = MI_STORE_DATA_IMM | 
>> MI_SDI_NUM_QW(chunk);
>>           bb->cs[bb->len++] = pt_offset;
>
> In xe_migrate.c there is MAX_PTE_PER_SDI with proper value and used in 
> similar MI_STORE_DATA_IMM context.
>
> Even the comment for MAX_PTE_PER_SDI is similar to the one above.
>
> I would suggest to use this define here.
>
>
> Fixes my issue with xe_eudebug basic-vm-access test therefore for now
>
> Tested-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>
>
Pity, but after all it does not solve my issue.

Sorry, withdrawing my Tested-by.

Maciej

