Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1A8FF8873
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 15:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63710E44D;
	Thu, 30 Apr 2026 15:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcJ/6eQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D43C10E428
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777563641; x=1809099641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4uRZGpegrvo98fY1gIP/wopLhu5m4gmUOAyVCKnT4iM=;
 b=mcJ/6eQN7QsjxMpehcfkQnIlyssOz+1Hz3+js9wH0UwPlMHAnoMuWY21
 HRGWlE3elWloNvgs3/iN2JrSxpqUU6WX/rj78e/GYvuLZmpoXspdvLL2+
 x6oJhIVHNcvWFV9dfclGRjmsAwOmSj+HWrxuEIdvcvilOXxpyN0UjQhyK
 ElKUW70GXtJfrbho+c1MOU2Cd7qBFQAOSQc0opkrY/jBU5VJU+wC9v3n7
 JcL5Z3ZMuUHGwAaJEXzajnvBrkCsoA4l3DpQfy7uvrxS/ouWRev0sX6+2
 PEvzTZOAbfYL+5JR3zzAnfb6LL9G34jfH0W1OuOMvqC00a2cMvigFGu/K Q==;
X-CSE-ConnectionGUID: 1WO5TSGjRIy8P3A+6Z1CMw==
X-CSE-MsgGUID: oB/K4vFqQUul2+0RZ+sCkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="81095667"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="81095667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 08:40:40 -0700
X-CSE-ConnectionGUID: HSiM4qScQi+XrVmrd6gjzA==
X-CSE-MsgGUID: QwA30ucUSWq8IWJOnTMfjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="258200853"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 08:40:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 08:40:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 08:40:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 08:40:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxC555+/qjg/AzMbHbzCPyziGv1ObGfK3N4cwSPUU6HYicuK1I+H6gkmCN4QlPwtw59bXAqLe8P89d1BS+UQmFRYSOElOjqR3GDODgYezJPJmjg/72kTErJCu8eac74o+CTOdotVpXPy/lNRobbBFkUvikxqleSgbGo1inwAjAsuH0VFNUc2jruZXyxtleMABfEJTCpznP5D9zTHW12XDMlF8IuU7ArE6FsWVAk++mhIox4Lp1Qxc6LXlcFKkLxeP10y8OLD8fYFXzmmRe0C1bqGBV5wr0au9S6JUwv9XDEDY4o4MM7VGBoD3B+Pn/uWZtTnAWNKtJ9lPrSVFSSdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/P1ftks2GgCv/1Lr2kOrynbRN7uqhL44zI95Ndmy8s=;
 b=T43qsK+JmvYkgvE3zWKuZjqf5dZcapJWhl5AGECQAu/4r/AQipo1gBt7GI0+9FIPHXNcmQS4JiDvapRLXGQJUYj2inwBgJi2+OCzbXdVWBJGhnjF8862LHEJapDhQmkKJ+77b5BASuXyp4R2iAWAABW69IkV1knly/LTLkDjx/Fks+ZHygjlq5dWO/iSvGly7heraTAlQJHpEtOg9dsEgRuLc0iakwDAAnZwGxF9TN/OZDTy7OHJSE17wHFJOpejpa51rqhVkTwWcpY/ShBd/nSm24kV/7xszFaNj5x7QQctv+Rn+z+GcVA/UrZSP8XMLzFBAcUQUIg4kCpUF599jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 15:40:36 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1edf:e4d3:91d0:fd2d]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1edf:e4d3:91d0:fd2d%3]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 15:40:36 +0000
Message-ID: <2f319824-aa6e-4ea7-ac0a-4e031f11a1d2@intel.com>
Date: Thu, 30 Apr 2026 08:40:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/guc: Skip LRC indirect ring state size in
 engine state size
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20260430072645.3592885-3-satyanarayana.k.v.p@intel.com>
 <20260430072645.3592885-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260430072645.3592885-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|IA0PR11MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb1a49c-0b95-4472-4a2c-08dea6ced2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: QUN9qqvecQhdb/vZgXJfkMJd9hCZieXGPJKNVAOsp49w3ijBv9TMB5ovcQYohJr1IPLPLY2jBk6NcN8imU1JP65Iq05x+9HXD0KKSDqvyruK0dhDOn/deprJJs/EA/XdOCzlmxviQP+oQ2dU0H2plwWz6rfP/eRd6qY3QIDBSKYo1mx8G6bF9eFBnlvtwSMunMA6SIrOYAP1oaipl66tdhd2S8FC8tZNthEeKWaBasico9VvqF22H3JS7mX+8NF1rQBlnpbR6B2UyJr3352eD09+3mgkmFVPsDGt78TqzZjoGGvvjbdJ1b5E5Cu29piNV2ADzwD+alzsrtDopNQ4X5H13RjWv4hyEfvf3uJwScAxqX2tk5cUbn9v3XVSEK0ZaOWfHdwC46kmBmffYxeuAn4KXBd3ruGgJY0vok1lLDaMLUPWL0m93Qf06b6oEQEudcMeFH0pqOUcRUDJyhLG4aFWE542YPIYjvukxjuikDLC9hbXfnF8BmwTSo9VI75Gz0ngO8DK79LxHjGcjurbyEIkBv3MeT8HIbdkTD0Cabe4+K0aMsmZPxgV590NX+qKg+zwVuxQMjHtFKck4QVwW1kXv3tBRfpv/INIk7AlmorMM+/Tkgm/h4JjlRKdq/8L+X/XlcdLkmzrMyiUA3tlyNL1MADkOkVA0U1QicF7QqnOprmAvYSdI4PxLIHUkFutfTb8ZHFH3fSEir1Tt8hbyi72i1evs/7I2uOzkfVVtHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y21XT01ETDFyaVUwclJ1VWJFbW9yb01zYUhzblg2L2t2eGNUR052Rk9WQmZR?=
 =?utf-8?B?WkZ4aGZNMWxlWDZOaU1jclRVUFFOeGd4V2xDekF1SDluMnIzUmN1Nk9vVnA2?=
 =?utf-8?B?WXVLdzlkWmErTXl5WVJ0OVZnWHg2TmdDTkpyb0RNMFg2d3Q5cGFmN1ZFaDI2?=
 =?utf-8?B?S2xZK2oya1pDOU1KY0ZZWWVBcGpYTmhwZTdHd0l5ckRQcXAyS1NyQzZwVFhk?=
 =?utf-8?B?R05IY1p4QTZnd1Q1bFVNRkRnVjJabWJmbzU0TnpRdzVCVm8zeG9oNWIwYjQz?=
 =?utf-8?B?ZDNwNmk5aUZwcXA4OWd5UWdvZ05uOW1TV0ZjbGJockVKVFBVNG9jdW11UEFz?=
 =?utf-8?B?UGtDZWF5STJBWWRGbjFkNlMzVzNVME1QS3B4alV0eHYxVi9CQzJMT2kySE94?=
 =?utf-8?B?bVhkOG1kVDFTMkwwQ3RNRmMweUdONUE1MWdlQ21SMDlZenBBV3I4ajc1Vm83?=
 =?utf-8?B?M1R1N2pmMDNnUHJObkNHbU15bGlwTTBlZWdDZHV1d3dpNCsybmxQODE3aTMy?=
 =?utf-8?B?cmVFdkhBL2JXRFVtd2dwbkNTdlRFVmJmSms1d3NJOXh2d3FpZzFBZkpkMDdm?=
 =?utf-8?B?SHQ1eUpSYVhlRWNBbmp5dWlQUEVrWUh6WGttMG83NmlFenFFcEUxQ2IyYmhT?=
 =?utf-8?B?b1dHcmJFckpmcjNvWmFJR3NKN294Tk9OV09mWmo5ZDl0MVJvelYvR0FwMnFh?=
 =?utf-8?B?WXd5NXVjMUxvODBTTlNQZXRLU29KS1g1bTNpb1d6MUFud0pxelM0UEloQ0d0?=
 =?utf-8?B?T1V6UDRmTWZKSFgwVnZyMmFHTHNHcU9vOUhOTnNOQ21uOS9pWXNXc2MyUHZy?=
 =?utf-8?B?WVc2QmNPZDZQbWY1a21PZWNvMVJQQjhWTDdTU0NXVS90Q09Mdm83dllVakRo?=
 =?utf-8?B?SytxZ2Qwa243WEFWY1lTY1JlY0xXTk04UVlqdzlyZG9pQ1F1N2dnQk4ybFQy?=
 =?utf-8?B?ekgvVWk5K0I0WEk2MkVLdGNEcU45SWgyMkJ3TnNHZkJreko2RzcwMHpTbE1R?=
 =?utf-8?B?VjJQU3VYUWZZaU4wTnB2VW04Zmg5RkRWQXBwK1k3MlNGWU13MHM1U09NYVhm?=
 =?utf-8?B?SHlYbm44Wlh5SG9nd2FNS01rSzYreWJpYmxwb1VtQXlMWlRjV0RLLzFhMStH?=
 =?utf-8?B?WUYwR1M4Qk9PcVA3aGN2YklxVVVPZzk1R0xXdmlVbDY3UENET3R6c2lqeG5C?=
 =?utf-8?B?VDZjQnpyNG9RK3NVUVg3dko2UVB3SVUwK1RxQm5yVi80aWFMQ0hSYWNVRDJK?=
 =?utf-8?B?YW1vL2lVdlpHL1JnUlZ2Z3JKQXkycit0a0xaNHliWmd3STZKN3hTR0xsTUxW?=
 =?utf-8?B?VzJPZ0o2MEdabGlTUitZREc5UE1xMkVGODV3T0FjeW52RWNNNzZGRjZJdWhQ?=
 =?utf-8?B?UC9Lalp1NkZHWW5kSkVaT1F0OGpxUVZQSzkxSkNtSFZHOWpQRjRTenBOTDYy?=
 =?utf-8?B?U0NtSTRnWHRrMHAzL1RhUmhKSmxMRlowdVpHMHFIT1BVK2R0eHcrbkZTNE5P?=
 =?utf-8?B?WERSZDhZNUNiZDVZU2pCZ3BCVmJqei9TZFpDbU9YNTBmelpLUWF1RVhvVFlU?=
 =?utf-8?B?US9TNXNRUUFCRGFUOEQxNDNORE1Jd0daTk95cWNWR29aMkxaQVFhNko0VTVG?=
 =?utf-8?B?SGttdjZWUmk3bDFjWXd6OGxveXMvc21xYW14bVdodCtrN0NndGdJWVNoKy9j?=
 =?utf-8?B?MVNMQzduQjVWWmJJcGwxbFA5a3B6cE9VU05RMWJSWWdiWjdydml3V1BEN05E?=
 =?utf-8?B?RmppbkRXb2RsamNJa3N3aDZEbW5BQTBCcDlWdnJzdkQwYmFqQ3lZL3lsQUNL?=
 =?utf-8?B?a2I2bXI0QUI2Qm01NGxJSVExYUdyZVlldFJKTXprcTdOZnhRaUEzNTBvZng1?=
 =?utf-8?B?M3ZUSEdINjZ3VTR4UEJPejBLS3BtVlhTZThEQ2JkeFhXcjZKOGlCOUpFTy9p?=
 =?utf-8?B?Yk9vakJ2RjBmaFlrZ1N4VUZCdDZLNTVRN2pBWXlTem54UzhROGdmaTUxRHdj?=
 =?utf-8?B?N0wzdVNDSXhxSjVHaTdTZWVoQm1tNy8wSnNJbUFpK3Rlb1N6cFppUXVnbHhi?=
 =?utf-8?B?NGRLdFNwWkI5cXlLd3lKRFVPRVBtNVUvalZSYjFMRXBRSHU0K2FSOGI2SUJm?=
 =?utf-8?B?c3ZyRW1nK0JEdEk0bTBiaEhoZEhTb1AvYzRxMnFKemxodVlyTUFHSnRGeFBJ?=
 =?utf-8?B?aS8xejJHWkozYk5pQktpR2o4RW5ZZVdyaE81OUM1THhBbjRob2lMeTE3Umtk?=
 =?utf-8?B?R3pjd2pKN2E1eDFYdXY4NkphZEhNZHVWemFiNlZFWHZpTVBac25wMTI5TEV6?=
 =?utf-8?B?L3NVby9OMUlsM004SnVMZGFRZzA0R0ZCdFFUVXk4U2NlMjN0WHZGRzJrVFdY?=
 =?utf-8?Q?pnbnH8OoSHyhOOfU=3D?=
X-Exchange-RoutingPolicyChecked: PwcaEfJAHyC6dMCgU0gYx6J5pIZBE3DE43JYQsPA1FFnSYTUWL5AqPcpV1Pu8Y+lHJbDB+dtZHsFlWS+jDSyNzm8j9voKxhVTPZM620toZaJtTRhGGU1PcPX6xqQ0rJJgVhyTwSMyvYcvhifiN4HnT2DDLP0k1Qr8lDjQBY4E6y41YFmwjyzCW+/K6BX51ofRbiHg9CjkDr/aIZF0CMty+Z0s0hhu0EztYr7pOYCaXWqt6Y7X7L3HDPAgh80DYqKV8UMAU33f1ldp6Z5+jzncICiSaKm/byrxTVPRLvoB03/XwgCFyfnNI+hIDz7G6thhYPw8NW84Fwkv7SYK8yr5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb1a49c-0b95-4472-4a2c-08dea6ced2ab
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:40:36.2314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIqJnc+OWcvXyJ6uvqbdIPsTQXNg/WZWtqy86lskAe7mPok30tF9sv98V8ekO23mXsmEoj6egr8D1czmVBykpi9993sY5UKkCkWVVi8/Ix4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
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



On 4/30/2026 12:26 AM, Satyanarayana K V P wrote:
> The engine state size reported to GuC via ADS should only include the
> engine state portion and should not include the indirect ring state page
> that comes after it in the context image. The GuC uses this size to restore
> only the engine state portion on watchdog resets.

The last sentence is slightly incorrect, the GuC restores what we tell 
it to restore, starting from the LRC engine state. Maybe change it to 
something like: "the GuC uses this size to overwrite the engine state in 
the LRC on watchdog resets and we don't want it to overwrite the 
indirect ring state as well"

>
> Fixes: d6219e1cd5e3 ("drm/xe: Add Indirect Ring State support")
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
>   drivers/gpu/drm/xe/xe_lrc.c     | 10 ++++++++--
>   drivers/gpu/drm/xe/xe_lrc.h     |  2 +-
>   3 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ce651da6f318..1edcc8875d35 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -520,7 +520,7 @@ static void guc_golden_lrc_init(struct xe_guc_ads *ads)
>   		 * on all engines).
>   		 */
>   		ads_blob_write(ads, ads.eng_state_size[guc_class],
> -			       real_size - xe_lrc_skip_size(xe));
> +			       real_size - xe_lrc_skip_size(gt));
>   		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
>   			       addr_ggtt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9db914584347..b83810ff4ff2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -727,9 +727,15 @@ size_t xe_lrc_reg_size(struct xe_device *xe)
>   		return 80 * sizeof(u32);
>   }
>   
> -size_t xe_lrc_skip_size(struct xe_device *xe)
> +size_t xe_lrc_skip_size(struct xe_gt *gt)

This function needs documentation to clarify what the size it returns 
should be

>   {
> -	return LRC_PPHWSP_SIZE + xe_lrc_reg_size(xe);
> +	size_t size = LRC_PPHWSP_SIZE + xe_lrc_reg_size(gt_to_xe(gt));
> +
> +	/* Add indirect ring state page */

This comment might need to be updated (or removed) based on the description.

It might also be useful to add a comment to xe_gt_lrc_size() to mention 
that if we change the size there we might have to change it here as well.

Daniele

> +	if (xe_gt_has_indirect_ring_state(gt))
> +		size += LRC_INDIRECT_RING_STATE_SIZE;
> +
> +	return size;
>   }
>   
>   static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7c975f9e2d9..96d5243b30e2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -130,7 +130,7 @@ u32 xe_lrc_parallel_ggtt_addr(struct xe_lrc *lrc);
>   struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
>   
>   size_t xe_lrc_reg_size(struct xe_device *xe);
> -size_t xe_lrc_skip_size(struct xe_device *xe);
> +size_t xe_lrc_skip_size(struct xe_gt *gt);
>   
>   void xe_lrc_dump_default(struct drm_printer *p,
>   			 struct xe_gt *gt,

