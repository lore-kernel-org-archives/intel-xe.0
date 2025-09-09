Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA8CA1016
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 01:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2D710E0DB;
	Tue,  9 Sep 2025 01:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDjyIOYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE09A10E0DB
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 01:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757382841; x=1788918841;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8AUnCW+BTkpiZuq+bVytWxS5TadPmux2jh0prL+Ue4c=;
 b=bDjyIOYLLQv+SdqlbE4n/RMXp1k0uLEuI9LWL+m05y+J8HXlUqNH+4mG
 iwXQK6QIN259CtMTIEFiOueuGsYwV98BDOvN0l9MQwQ198qKnYLvgCtsM
 USTvB+SgIuD9GWeLmj4wWpTgUAOIk+amI+EkVg8dOywwnFnqpMr96b1Cj
 GR03wCiRZcPEonI0lDpxjLYdKDsNoHb1KtSNa2KKrQZbKNziCnUNgURxZ
 PNPP6VMel77OGEpN4NyxWA8MhZAljte/L1h6BErCWaBDPHQTKyEGu7aG5
 XMBNf2ICLQ2qhj6Cu0vET4VJ70fRB1Grvb93b0b1KvthSzMHy0/DgAnnG Q==;
X-CSE-ConnectionGUID: IBCUv/RiQnWJc419NrmeFw==
X-CSE-MsgGUID: 1rI7s5rZS/qvKAguQXwZAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59763542"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59763542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 18:54:00 -0700
X-CSE-ConnectionGUID: i+ZQep51R/qIu4btIWqt9w==
X-CSE-MsgGUID: Cyyf4CQpRP63jjl2DqQWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="173746226"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 18:54:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 18:53:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 18:53:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 18:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5pgt1nFkFQTctTy52VekJ7M17PZ2su2V5kVYnwkxFwKUhl00xpR71AMbQl6DEAYtcn8F3JQt+Zx4SkaIefNBEysFDNoxU1k/Q715SLETTYSGWm9FREic4+uny3lsxlEnoval67aJZjJPcRfdDwyoDyiIgX+w069gD82I4nu+qQGyRoFqSat7qwdOpg+mPS+FrbR9N7AkU8yf+hgdrf1cO3M4okWcjblsvsPNDn4RF4f2CsulKLlO1uVe0XbfRCKmD/bFowrAHntxyEvcfYtwA97gCduA9seU4DMeIbdjVk4dCQpbGWcQZ8QWAlQY11jOJ1/hBEU884LYX3ok4ooqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtfNniDnVFqpRrz0MeoNOu0EHTY5dJjOIRCTYV8J4J4=;
 b=OAOrlOydM+d/9pM42MGTpTojMrLPWu0uKyERP/0hRyhscmefAaxHS1iv00woYW/LXd5Rn2ly5etjtKOikxWM72s/TUTUbwdSJRZkN12YkSMgPI1XbGsfsFFpK05odLVzR26aMBDxwaOqy26SVCkzyK9bujecab0ovAPv/WCOZdTqQ+ytNpUfTRfZm8twJFg3hz+SeR1uVgJ5ByshPHA/NGGykP/zzpmDiusRctiGGSVt+e5NwlYd8Zi01tdGD/LJERrHejbg5BvyQKE53UqRpFL9EnNph6/hmAL+gVgwuJGzgSmbuHQimjg0k0sgAP/Ga4amWMdRVtjdgo0fDfuYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 01:53:58 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 01:53:58 +0000
Message-ID: <bc27ab49-4f77-4f45-9475-64190f70d9b9@intel.com>
Date: Mon, 8 Sep 2025 18:53:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Set RCS/CCS yield policy
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
References: <20250905235632.3333247-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250905235632.3333247-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0328.namprd04.prod.outlook.com
 (2603:10b6:303:82::33) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ddf3e0-1ab5-4e44-0d23-08ddef43bd78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDVoTzVxN3JYOGxnYTJpQTAwQzJSVDZ6TGdubzBZOEpTT01QSnlURGtUR1dP?=
 =?utf-8?B?bjFtZDBnY1FZSzV1eGVKT2RJSFkycG40R1pzdmRDdUdZUDBHRTFadjR6eE8r?=
 =?utf-8?B?R1NzQkpLdlBGdVJiWmJwbWh5a0FpdDI1NHozMFVZdDdNS3hBOENyNGt6cGR0?=
 =?utf-8?B?V1JPNi9vL2VRcUhycmRobVFReDVKeWRpZkczMDFHdlFVQ2hXaERLSGdkaVd2?=
 =?utf-8?B?OFBBdEN6THpJc1BFRDNhS1ZIQTRaTzRnblR0Vkh4d0FWbnUzdUxHTGcySi9R?=
 =?utf-8?B?Q2FuaG9IRkpGZmQrNlJLZFdOVWZYa3V6cFpwWEpnUmxkYjRHSDEwUGFQSWk4?=
 =?utf-8?B?aTRIejN3YVR6KzNhR3NKd0d5VFMzdmEyZHRwVHZ4S2QzelFTeXVwUjVSOSs1?=
 =?utf-8?B?eGU3Wk80c2M1RVVLSHhqT2dUQ0VkNDBoSEEyL04xVlpZQmN1L2VXcGUrc3ZO?=
 =?utf-8?B?OTlxWkRWME9qbWcrS1ExMktrQ1JlVVg2Tmd1dTlndWd1KzhGVytFU3I3MlNT?=
 =?utf-8?B?TjVZc2N1Z0NwNnAyREQ4c1JoWWIvbGRwY3pnYnVDWjRNS1AxQUFac1dYZlpW?=
 =?utf-8?B?bWVDdmYrbEhPYU9zVXlBK0w2TGsyQXRYN0JKekU2ditBRERmWXQrMFJKWG5t?=
 =?utf-8?B?dGkzVEFnS0lWcTBSRXo2M3Ywd09VbUdpcG1DZGxDVVNqdHlSNzhjV0N0MHgr?=
 =?utf-8?B?cDRqUkNVWlRua2N0cVpWOVVOM2diUDBmdlc3aGJDOTJxWTB2cTRSU3RZd2hk?=
 =?utf-8?B?aTVaRzVQYUl5VGh1TTBQaTdnSXd2TGRmVnZNWEd2dHdSY1gwUExLN3VNRlpF?=
 =?utf-8?B?ZnA0enVTcHd6NXpEcWRvS0w5WitwZDhaVEM3OWZKY0FUYzcwRGFLSjNMNVZ5?=
 =?utf-8?B?MFMrZTBoVFVxV0FSSHNaVW53U2pZdWV1UFQwK2VNQUgvMVRsa0RjdWtrRHQy?=
 =?utf-8?B?aE1hN3NkaTBBNkFRRkVlZ0Jmb2ZVNVNwTzJZU2RheDZlK0F6NURPVGE4ZjdT?=
 =?utf-8?B?Z01JdFU4V2hkZUlKVXhMSUNIVWFXTWd3WWdyNXZUbXd3SUZJMVUyVUNxM0g0?=
 =?utf-8?B?Y2UwNG5rSTc2RXBmdDd4MDlvTExVMkdFdHFVa1JKdnRZanRaSzEvdmpXUnBP?=
 =?utf-8?B?MWpQb1dnS3MwVzljTTR3NEZ3dS9qVkMzYXJuVWFGeUtKYWlKcTM1eGk5d3hm?=
 =?utf-8?B?eTV5aWxGQnd4MVBLdTFQNXN5ZGdpR2FPZnliS0d2Mkg5V1dYWkRJR2F3SnBt?=
 =?utf-8?B?eE5janR2Q0wyV1MwTHMvcTAvY0oxWVhxbWFydDVUc3NiTGpIaW5ta2ZRYmV2?=
 =?utf-8?B?OXFXUDdQc3E5MmdSamJ3T0lrcjUxSHV2UEJNNWpSYjdyZTNqVktuQTVPZkRH?=
 =?utf-8?B?TlMxZ3ZVbTgyTlVSYTlHV3Q5OE1BRkE0WjFhdFlqeldwbHpYbzJqT2xhcHd5?=
 =?utf-8?B?YzdMYzNmQkd1eGhuaFNPYkU2OE5RSVVNeVB6aEM2aytpNjJqSzBrQXFveEly?=
 =?utf-8?B?R0dGRmJDdndVeFhiZ0ZidG4rcnpFeGdXNWl1dDBZejZpVTZxTjBpRTBJTnl5?=
 =?utf-8?B?TjhCSk0vdUZHM1FSNnRtVkxMaEZ4cmtNU2NFK0t0dW9WL2ZvMHo5VFNEd2l4?=
 =?utf-8?B?TExLQ3dEVVFDQkVCOHdHMnNZa1pyc2NnYXhldkRUN1lhT1hWYkk5RStuV1kr?=
 =?utf-8?B?bHRkWnpMRFFtTW5PKzkvNW9DTmM2bHMvUDRYYkF2TzRkUWpyNlNOYlUrNWlI?=
 =?utf-8?B?QjI0b0hKODZxbmxBemZidWxTNmtqdVdBc0h4V2E5cVh6R1F0Y1IxNkNJSHVz?=
 =?utf-8?B?WkI2STJkZGhwcFd0dHZNZ0M5elZVOS9jYkpLSHV1Q2xvY2FHSSs3K0NPN1BU?=
 =?utf-8?B?cEQwT1ZtSitSSEZpaTJiUUJiNDZ1UTYvTGgrUFI4NU9MbFBzY0g0YnlKNlM3?=
 =?utf-8?Q?SeO4uGU41Ig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlJFNk9LalpjM01oWHpLc2RDWnV0WnVUZnlrWDRNRW52VngzZlVva2R0eUFx?=
 =?utf-8?B?QVFiZGxtUnJnL0RMSlNQNXAzVGkxbngvUUVnQ0Nla1dDLzkxTS8yRFExOCtY?=
 =?utf-8?B?RnNDSnE3YmpyTnU2Z1ZmZ2pTMjI2bUlTRU5Zb2Q1MHd6RWJrS2dVSWhZdEt0?=
 =?utf-8?B?cjBYV3Jzcm5jQWZXQlFsNzBKQXZwa2RFZU1sb2JpMUQyZzB0VXlieGc5bUkz?=
 =?utf-8?B?Qkd4aDI5V3QzMjVNS1NCZ0xQZ3VJR0V4VFp1WHIyQ2I2cWoyUWZGVk5vOGUw?=
 =?utf-8?B?aHNTTmNhRkJYT2hwaUE4VUtYbnc1MGZKZzJPVjdTYkxleWlCSEEzaXlZL3VM?=
 =?utf-8?B?Y3NMQk5hVWJFMklNR2lPTHB2dVF4M2tZL1F4NmtWclFmeXRXWVZjazkvL2Y0?=
 =?utf-8?B?amtLekNTb3Y1L09oQXJQdDY1QjQvRVFlTnV2cStlSjhxcWxtTXl2NFRad1Zu?=
 =?utf-8?B?R0lyUU1pVG5xb3VkOU9XREFWWVhncStIc05YalVkdzhVUmxoYjBmMXVKcTRV?=
 =?utf-8?B?eEpvMGxOYnJWUmJhUmJBWnEzMmZjZG44MjBuK2czdkNwRi9UYXdRcjRlSTlT?=
 =?utf-8?B?MFFiTWlwT0NXTDNrNmR1WmVoQXp5eTRBYUIrQkhrcUhHODNueS9jbmdwUVh3?=
 =?utf-8?B?b1lZcWZqbTBJbHd3TUFrMUIzblRmbzh0Vk5tajVHUnFuSHJJcHlCWmR5aUgz?=
 =?utf-8?B?UTljekN2eW9pa1ZhK25oVnpsQ2NuWDMvSUNwcHJLbC95WWx0Z0FESlFwWXpz?=
 =?utf-8?B?MFVCMVVIRDREN05PRFpNUWRZY2gzeG11UTRJWXEzaWZCcS8va3pRL21EQXBQ?=
 =?utf-8?B?TG4wSHMvMTRxNUEzNXNOdHNHYlYzZHorbVl3WnhiVVp5QnRiSk8yTjFyY1R5?=
 =?utf-8?B?Tk1oUjlFUEJHckZmc3VvTXF5eFVnNVlIaXp5b0xJc1gwNnM2YSsrblhQRUlE?=
 =?utf-8?B?MHNScjJUTU4vbG9pU21jT0JVVUtUY25iTk9VRHYzQjNjKytUTnRQWXpobndk?=
 =?utf-8?B?ckhhb2V6R3RCSHl6eTQrMnhoMjVxbjl0YkVVZEc2dXhLdXovUGNtaUNsdHg3?=
 =?utf-8?B?ZGJOY1BCNWgycDZLcXNVQzBaVEU4VkRnN3V2T3lUcVJBZUduUVJhN004SDYr?=
 =?utf-8?B?Y0NLeWJKakhTZWNmdGpNYkhFUThuQjdVZ1dsT0NnMUk0eW1KTTB1bGVDaFY4?=
 =?utf-8?B?OExXdkNPRFNrczc0RUJHMWVVMUFFWi9xRmZjVnRndHpjR3VtSlJVeHFyMVpp?=
 =?utf-8?B?T0wwdUZkWHdQU3I4bU8yb1FHb0tMREJDSXIybWY3Uk5TOFFoMXdrTnFHMmtp?=
 =?utf-8?B?NTBYSG93RG5FNjYxbmd5RHFNeSt5UVRON21wbXRMZktRdEtFT203bVU2aDJC?=
 =?utf-8?B?Z2p5OWYwbTl0ZGhQQ0FTNG0rcnRhUnlKSFU3RjRJaVJzcmxEZDNOV2JUY0lL?=
 =?utf-8?B?dlY2ZFVGdFFDL2c3N2VBY3ZIazhZUkhuWFN6eVhYUm1hUk10MC9oSktubzMv?=
 =?utf-8?B?NGpXV0Y3R3JCK3c4VlpsWFZMTnYrdXlkMHRnMG1UYjNOazM0dWhVZnVHdjdF?=
 =?utf-8?B?Yk50bzk2Q24zRUFnWThmOGJ2RHRGdFpkekRmY2RzM0ZBNVk4bnpvUkF4WVJn?=
 =?utf-8?B?MGUrcTlQL2x0QTVhcTdBdjFMV0hoNjhSWjRPbUR2bGFQdGM5ZnNVTmhzRTBw?=
 =?utf-8?B?WUdDTURpMkFldkUwckdFYWNjdmt0TEo5OGFkTDlwbUtzT005NEFvbEpMQzd3?=
 =?utf-8?B?ZUtHL2M2VVdPZ2xYY2VQTWRtWWpYQkk0VXBjNk1kSTIzZ25CRkQ4OXZxTVR0?=
 =?utf-8?B?eldMRmErZnVLU0FyZjBhTmpMcVNETngyUjZkV01Za0NtTmZuTlpuMHBBa2FR?=
 =?utf-8?B?NnE0N3ZtNWJ2bENVQXYxTnl4OHlvM292L0I5Q2x0MjBJaGYzbzdqTXJlRkk3?=
 =?utf-8?B?M1JqTysyVm1lc3ZUdXpYQXdOZmVnRGhPSlJVRmRXbkNZVnN6RUtoaS9OZmxZ?=
 =?utf-8?B?SUNhREVRSUlONUE3Q1B1Y2l5Uyt4K0x2SHJnMU5HbnJDS0hqaEgyd2hLRkh4?=
 =?utf-8?B?Rnh3a1JJNTV1UkNOVkZyRCtNL3pHL2ZOS0dhZGpQSnVCRm1JM1lrOThyVkVZ?=
 =?utf-8?B?d1doY3hmc21FYkNEZDRMNGJDdkU2OFJXanhYNTd0UmNuYUpkci9mNW83SXBy?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ddf3e0-1ab5-4e44-0d23-08ddef43bd78
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 01:53:57.9423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndHejY2cuLk9peRh0v93IAc2xfKej5MMD4XaF0LJlTBsYsHR/lhjgSwoKxTtC+ZLAFqDDHD6nbgTKmNmwP4q8qSD2awLxwyxYrb3iKXXwTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

On 9/5/2025 4:56 PM, Daniele Ceraolo Spurio wrote:
> All recent platforms (including all the ones officially supported by the
> Xe driver) do not allow concurrent execution of RCS and CCS workloads
> from different address spaces, with the HW blocking the context switch
> when it detects such a scenario.
> The DUAL_QUEUE flag helps with this, by causing the GuC to not submit a
> context it knows will not be able to execute. This, however, causes a new
> problem: if RCS and CCS queues have pending workloads from different
> address spaces, the GuC needs to choose from which of the 2 queues to
> pick the next workload to execute. By default, the GuC prioritizes RCS
> submissions over CCS ones, which can lead to CCS workloads being
> significantly (or completely) starved of execution time.
> The driver can tune this by setting a dedicated scheduling policy KLV;
> this KLV allows the driver to specify a quantum (in ms) and a ratio
> (percentage value between 0 and 100), and the GuC will prioritize the CCS
> for that percentage of each quantum.
> Given that we want to guarantee enough RCS throughput to avoid missing
> frames, we set the yield policy to 20% of each 80ms interval.
>
> v2: updated quantum and ratio, improved comment, use xe_guc_submit_disable
> in gt_sanitize
>
> Fixes: d9a1ae0d17bd ("drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 25 +++++++++
>   drivers/gpu/drm/xe/xe_gt.c               |  2 +-
>   drivers/gpu/drm/xe/xe_guc.c              |  6 +--
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 66 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h       |  2 +
>   6 files changed, 97 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index d8cf68a0516d..1baa969aaa7c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -117,6 +117,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_ENTER_S_STATE = 0x501,
>   	XE_GUC_ACTION_EXIT_S_STATE = 0x502,
>   	XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE = 0x506,
> +	XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV = 0x509,
>   	XE_GUC_ACTION_SCHED_CONTEXT = 0x1000,
>   	XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET = 0x1001,
>   	XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0e78351c6ef5..265a135e7061 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -17,6 +17,7 @@
>    *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
>    *  |   |       |   - `GuC Self Config KLVs`_                                  |
>    *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
> + *  |   |       |   - `GuC Scheduling Policies KLVs`_                          |
>    *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
>    *  |   |       |   - `GuC VF Configuration KLVs`_                             |
>    *  |   |       |                                                              |
> @@ -152,6 +153,30 @@ enum  {
>   #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
>   #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
>   
> +/**
> + * DOC: GuC Scheduling Policies KLVs
> + *
> + * `GuC KLV`_ keys available for use with UPDATE_SCHEDULING_POLICIES_KLV.
> + *
> + * _`GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD` : 0x1001
> + *      Some platforms do not allow concurrent execution of RCS and CCS
> + *      workloads from different address spaces. By default, the GuC prioritizes
> + *      RCS submissions over CCS ones, which can lead to CCS workloads being
> + *      significantly (or completely) starved of execution time. This KLV allows
> + *      the driver to specify a quantum (in ms) and a ratio (percentage value
> + *      between 0 and 100), and the GuC will prioritize the CCS for that
> + *      percentage of each quantum. For example, specifying 100ms and 30% will
> + *      make the GuC prioritize the CCS for 30ms of every 100ms.
> + *      Note that this does not necessarly mean that RCS and CCS engines will
> + *      only be active for their percentage of the quantum, as the restriction
> + *      only kicks in if both classes are fully busy with non-compatible address
> + *      spaces; i.e., if one engine is idle or running the same address space,
> + *      a pending job on the other engine will still be submitted to the HW no
> + *      matter what the ratio is
> + */
> +#define GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD_KEY	0x1001
> +#define GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD_LEN	2u
> +
>   /**
>    * DOC: GuC VGT Policy KLVs
>    *
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 34505a6d93ed..3e0ad7e5b5df 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -98,7 +98,7 @@ void xe_gt_sanitize(struct xe_gt *gt)
>   	 * FIXME: if xe_uc_sanitize is called here, on TGL driver will not
>   	 * reload
>   	 */
> -	gt->uc.guc.submission_state.enabled = false;
> +	xe_guc_submit_disable(&gt->uc.guc);
>   }
>   
>   static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b3a6408a5760..ab1cc11a208c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -888,9 +888,7 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   			return ret;
>   	}
>   
> -	guc->submission_state.enabled = true;
> -
> -	return 0;
> +	return xe_guc_submit_enable(guc);
>   }
>   
>   int xe_guc_reset(struct xe_guc *guc)
> @@ -1602,7 +1600,7 @@ void xe_guc_sanitize(struct xe_guc *guc)
>   {
>   	xe_uc_fw_sanitize(&guc->fw);
>   	xe_guc_ct_disable(&guc->ct);
> -	guc->submission_state.enabled = false;
> +	xe_guc_submit_disable(guc);
>   }
>   
>   int xe_guc_reset_prepare(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index bfc061da8f93..e377ba3a39b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -32,6 +32,7 @@
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_id_mgr.h"
> +#include "xe_guc_klv_helpers.h"
>   #include "xe_guc_submit_types.h"
>   #include "xe_hw_engine.h"
>   #include "xe_hw_fence.h"
> @@ -316,6 +317,71 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>   	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
>   }
>   
> +/*
> + * Given that we want to guarantee enough RCS throughput to avoid missing
> + * frames, we set the yield policy to 20% of each 80ms interval.
> + */
> +#define RC_YIELD_DURATION	80	/* in ms */
> +#define RC_YIELD_RATIO		20	/* in percent */
> +static u32 *emit_render_compute_yield_klv(u32 *emit)
> +{
> +	*emit++ = PREP_GUC_KLV_TAG(SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD);
> +	*emit++ = RC_YIELD_DURATION;
> +	*emit++ = RC_YIELD_RATIO;
> +
> +	return emit;
> +}
> +
> +#define SCHEDULING_POLICY_MAX_DWORDS 16
> +static int guc_init_global_schedule_policy(struct xe_guc *guc)
> +{
> +	u32 data[SCHEDULING_POLICY_MAX_DWORDS];
> +	u32 *emit = data;
> +	u32 count = 0;
> +	int ret;
> +
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
> +		return 0;
> +
> +	*emit++ = XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
> +
> +	if (CCS_MASK(guc_to_gt(guc)))
> +		emit = emit_render_compute_yield_klv(emit);
> +
> +	count = emit - data;
> +	if (count > 1) {
> +		xe_assert(guc_to_xe(guc), count <= SCHEDULING_POLICY_MAX_DWORDS);
> +
> +		ret = xe_guc_ct_send_block(&guc->ct, data, count);
> +		if (ret < 0) {
> +			xe_gt_err(guc_to_gt(guc),
> +				  "failed to enable GuC sheduling policies: %pe\n",
> +				  ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int xe_guc_submit_enable(struct xe_guc *guc)
> +{
> +	int ret;
> +
> +	ret = guc_init_global_schedule_policy(guc);
> +	if (ret)
> +		return ret;
> +
> +	guc->submission_state.enabled = true;
> +
> +	return 0;
> +}
> +
> +void xe_guc_submit_disable(struct xe_guc *guc)
> +{
> +	guc->submission_state.enabled = false;
> +}
> +
>   static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
>   {
>   	int i;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 6b5df5d0956b..e20ccafdfab5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,6 +13,8 @@ struct xe_exec_queue;
>   struct xe_guc;
>   
>   int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> +int xe_guc_submit_enable(struct xe_guc *guc);
> +void xe_guc_submit_disable(struct xe_guc *guc);
>   
>   int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>   void xe_guc_submit_reset_wait(struct xe_guc *guc);

