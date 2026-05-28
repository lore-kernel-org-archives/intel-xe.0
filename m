Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E053CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 18:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F1610F44D;
	Thu, 28 May 2026 18:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3WYr0XC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907C910F44D
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 18:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779991821; x=1811527821;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TizkO328XaH/CSPUMdMBdwLXL0a1nA2bBPC/uYrSnjw=;
 b=T3WYr0XC6gF+zK9ADhsEh33jFSY49653yQaDRgMGzBpTeY68l7av0oyL
 vFoytyLHLxuLU0P5jW8pUG2fM4JUBcRNGmUvmeypYUWPqnZzWcZOMiQRK
 2viX9CbSmrVq7ubff0vTg2VyIi96VxQ4t2DK+ZUg6ck29mNC39Q3Vqxew
 3A//szaelIpH5K884R/cr0fxHLuL91pcTqO+2j4i4fpFzVZHWDUvmkfX/
 YPVPnP7/wRjj0nks2W9XJ/TBqS/UiFNSHFvlZSO48qH/49/FHSbbfNhF1
 tKht8HHZF/jcYHKEstBpWevQ5WHxKfpIEbU5GuNGqM4U/wLS2p2cqQYo2 A==;
X-CSE-ConnectionGUID: MBi7zPoaRyu+w6PxgWXNrw==
X-CSE-MsgGUID: QixD6b7WRUibKqYdsiIXJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91411718"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91411718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 11:10:21 -0700
X-CSE-ConnectionGUID: rTjZB6xcSfGVfFr3MuvE5w==
X-CSE-MsgGUID: 8YB04nJwTn+V8S3XQa7kfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="240065506"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 11:10:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 11:10:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 11:10:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 11:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3VWQRclONoAu5nNd9faj4VbXnWcHEJEjCCQwb3KDQzZ1fGdi0ROvPID89VoIpQI/8nPKJrnreE6VSvJi9AMHPOYXNkUKtDxezJYRjZFxEkKUHsdAJLLuEDnmxTX2gpT5oTy66tToEyJn1mvBVBkg4KdBdr8T+2CJWsnLLlta5ooGdl7PkUKK4cvVPiCnJyrjJwvehtnGV3vDPpd48ntwrfWtMOyOTXKja9jjNC+BRmcFTX5lZ3Y2FIdykPIBZQ9RzYGQtaSM7gyqpcqJ4SUu9zZc0up2GYfxVPpv1RW9D1jD9sKC5cYLVLBs1ijJyEDOOL2Bk2CYdei82SFXfYuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dD5mf5TkXQMsTIpXsolNXWD8wutAzOaxY0NHXuMvmss=;
 b=ozD60LcIEsEiRySW5+tMyDgloXVK2wIpr8nkgg72PjPErZTZXVl4PGc4m7n0XzZwDXAOv5C477bggwMlBLf9uJLe6+F2gNsIdMO7H7RGGlWPAKoKLw9D0ZsnMuGLP4C13J0UoUHxhMSG3Zw+PEUSMcwqKph0C9SVsFOooFzeRsHKYp/ZF8LNfJ3ULEmwtlc2l8DQXD9skRjINfdH4ncGFp3gD3EqnJcNZ6G6XRk4Fac9A9fW4XZ65D02hda/50VrrVqC8m5QFrh/aPPX4m5R/QKUch2i5TkOJyn0spUYFWr3tM01H34jqDPhZrJj9tLQ9VOgUfCbf5sExNpTCr/W8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ5PPF1611BC49E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::812) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 18:10:10 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 18:10:09 +0000
Message-ID: <e7c802f2-a310-498f-8926-e6c73f512f64@intel.com>
Date: Thu, 28 May 2026 14:10:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
 <20260511194924.2016315-2-zhanjun.dong@intel.com>
 <a6a6e2a8-876e-4112-aab5-094a57270072@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <a6a6e2a8-876e-4112-aab5-094a57270072@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ5PPF1611BC49E:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a9674d-9794-4989-08f0-08debce45acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QWloJWpNi1QfMdKujwIT+3Mz33je6ibFgBEhEc+EeHd149h9O7WArapIoURI1wAkAEeSYU/5eJn83mPoTZrtOaEAlhenzSomdTBH5KdwjD6LJWT5iSwEB62liSo+FjClxVVd1PWEJtU9ak6WR1wp1XqNcM0bH6JYVu5kKUCMEZdp7iqo45HAc0JT0W91KwKRAINXrOp0ipx0jLijAGSV5bDAjy8WHlsDDARzR8n8nwH3128cL9OkEuJi1TO+jdP0dr8t+hONS+6Lp25qfH5C2Vq3WJsuVvTJUZHKj2lVL/GPXD384nH6WQH57zHR6Twg+oyx2Mo2C5IC91L7W+a/Ygfy7OPZ25rPtptUzLqg8wLDHe5UGCPG0GiM6kk9fOChKpBAZ2ADq7de7RIo7SrFQXTyReRlygS+vHqz+/fj6oOnlfH0eooO9s0Niiri5aRlF5FAiDgvKZxOzfQ2c9yBcePJ7mOR1mkFEKHQE5QhnnAdL5cQWc77l90HVLxPYg/TjsP5xJ81FRhRR8vKRy0LQ/rfTq6b9U9L9h/7xvgBuFlZGd9qBdOYNofuuRwweVYxF3JaIUy/WJdN/rpvSMQMl08Ny2O8+kG8iYeeRPD1Nyn+iiox0wejrZPX2u0ZCuA7y5TTOWjxM7F7IOpTWcCl8pziFFDOd4Q0THnGD8kG3qgqKDZx9qMZEAMJduZKXub6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1zM2hiY3ZsRXVyalk2bEZIUDRVODgvMXF2azczL3dId1FDSldyWnpJb1N0?=
 =?utf-8?B?cDM1QndES2I3dWRMck5SUE1UVFlWWllTaDR5MDlMWWtiZUVQSXlWcXdnQk9t?=
 =?utf-8?B?K3dneCs1b2UvRWhxL2lQdWxqdFJqbFVKRDhYNHh0bFBSRldJdGhFUmxGWDRv?=
 =?utf-8?B?WFA3UUROQ2o3dEJJMm1QVlFHcXUxYVRjTEozYk5STWlhRkxsZDVHZlpWNWs5?=
 =?utf-8?B?clFqbTEySEJCQzRHS2tydU1zdndTZ1lLdXpwMWwzcERXK3hSeS9Sdm1Ea1FD?=
 =?utf-8?B?ZHMwc0J4OXBTN3ZmKzBqeEQxbmVOczVwbnljdkVjWk9VOGEveUp1U2MxTlZD?=
 =?utf-8?B?UjZpZjJvbFdHQkdFRkQ2NHdHNERWMnMzQUtXMFFPRWhKVEhUWWV1UlZpTGRN?=
 =?utf-8?B?dWcza3E1cTd0YkJGam9PbHNRaVVqUmJSb29DMUhheDE4U0VnVXUvcXBWUHBU?=
 =?utf-8?B?enRJdUYrQ0dqWEIwaXk0dkpEdlViQ1ZsVE9OaUo3NTFvR3REcXBTRXJFc1lC?=
 =?utf-8?B?WWE4dTMycnhBK0V6UUtSQmxjQ1ZjaWVrNnVFTE1aS1dxY1ZoQ1ZIT1p4RVJS?=
 =?utf-8?B?TWIxTXRLcGt2SURmb1NKUy9tbmRyYnUvblJYMzNhYm1JWldXSGRUVFh4bHhN?=
 =?utf-8?B?SmtSV05nZUwrckcrOEh5RHpETVhPSndIaUpDQ3pWaVZTZ0xZamNHTmNMVC85?=
 =?utf-8?B?dFdRZnREY1FZZHZUV2RDQW52K1M4YkZNbGhXZHFBUzlQL0wxMDQwYkJsejRF?=
 =?utf-8?B?Z1ZPTEgra0U3MWNoanJvbTBRbDZ2NHV2WmtsNlQ4dWlTSysvbjR1UWNtWjRF?=
 =?utf-8?B?OCtkUUdMNlVHRHdseFFaZTUxTGo3NlRUODVwbFZTYUJXS0RBb1hBcjRFSjRI?=
 =?utf-8?B?WU1MSnZsMWVZZXBtV2dGeVprVVRhUDU3WDFCenRQS2dnWVVtSFR5dmNkaFRT?=
 =?utf-8?B?SjhBMDRMMnc1KzJTNkZJR0ExZXoxcTBzYWVrdk5Xd2dCM1FFa0I0M2Qrbmcy?=
 =?utf-8?B?c0JieHlPbWQ0WGFIMWhuZVBZQXJTMXBiMXdrRExJdWt1SDYrTlJ0Ylkrc0lp?=
 =?utf-8?B?bys3Qi9oY3ZaaWU3MThaNURIN2wyYVdBRTE0MXJLbHljUDU2RWNoL2xIMEp6?=
 =?utf-8?B?cTNDWS9LWC9PdjJHMHlKcE9PbVNmZjRPdGppdFZHV2ZnbzIzalNsaENoTFNq?=
 =?utf-8?B?bkVRcWsrbmt0VHQ1d0VxV2Q2VFgwV3RhREpkcVh6NWxSWXAvZEYxY1hxdFNy?=
 =?utf-8?B?VHZCajhOb20yeTdNREhnTVRPVTlpNm5uVW9qNUo0cTRXS1hRWE1pRVNmS2Ux?=
 =?utf-8?B?S1hFRXYxUm5VN2VKQjVhVVRPZ011aHZLdWhIT1VqSXJNeTY2UzlDMmZiSlBm?=
 =?utf-8?B?TlZsbmtuU0NISE5hQWdKSVlHRE1FRjhrY0luMXVvVWwwaXFWSUpOZCsvTU0w?=
 =?utf-8?B?K0tlWStCZ0xNUWpMYzJ3QnZLR3kvWHRsc1hPbTIzY1lTazd6VDB0MUtGdU9w?=
 =?utf-8?B?RFNtYWRuSFN3TzlhemMyajRpR3RqbjlXdC9NOE1ZUmRvSGNBU0RlVlJKK2FD?=
 =?utf-8?B?dHdoRFJUbTNmeUJib3hmTkZicVJkM0pacEFKL2E5dmdSYnNQK1c3MnhXd2pU?=
 =?utf-8?B?N1l3K3FNYXBhd3hpKzF4MGpkQkdIL29xb1NvMnkyUXl2eFp0cGJvWUhJcWRR?=
 =?utf-8?B?dTdlSTVydS9nNmJiK01uOEMwOStUUXNEY09QK0UwaTdKVEIrQlREYUE4RERI?=
 =?utf-8?B?SjZtTUtzQjdTWldOb0RRZUZBV29yd044OGtwOTI0M2tRMXFuNHQxZUxIQkNy?=
 =?utf-8?B?MTYrc3VRbmFDT3lUbTJtTlhwM2JDdEFuTjlsTFBhU2c4RDhLcHArdVFUaFN3?=
 =?utf-8?B?NEQ5VUJlS29IT3dDV3UrOFFkMS9HeGJLU2QvMHJ3TDNNNXcreElDYm51V3R6?=
 =?utf-8?B?RGUwQm9FQUpBUDBFU3YwakVRQks4SmpWdWxKc1dvY21lZ1NlUVFNajFzV0RY?=
 =?utf-8?B?Z25KN2FMSjNVOHVNWkN5OHBjMTM1Zkg0VzR3cXRKelBONHNIbUdSNGh3SlB6?=
 =?utf-8?B?R2hpbEp4SU5RSDhVaThadU83SHErL2FGd1JXVVNzNktsZjlXdnVYMHp5ZjJX?=
 =?utf-8?B?amo0UkJIVW9MSDlGUXdFZk1oU0lYZWVBNUpvcDR5RVFhd3YyS1JLeis0dGdy?=
 =?utf-8?B?S2R1ei9SV2QxaERBcGxQVk5NL2JuWTBOT2UrRGtWSkFia2l2T3FCTkVDYWFV?=
 =?utf-8?B?QWRJbzFqYzVRRXZUQm5kUFYxejFDTDlIVVhpdzROaUEwdVphdHVzS1A3Qzdu?=
 =?utf-8?B?ZTFCUElnMjhNZXRIY0JGOWtydUc3SHFmQ2IveFNEbFYxb0hoUUozdz09?=
X-Exchange-RoutingPolicyChecked: F+AmP9lXHB3tztm9u2gDetVXltEtUrLYlBYbC1UOY6XSri0GHlAn7ChdBIjPvUE7Zpn/y9chzt6jgOxaAWD6+aBNAKXgBjvjfmFKIVKBxTXimrV72yrFEjfTfbfWbVb8eJoqACyzpgJLzyzvpBqJDfdu72OwrDcbYgDeGedfrVldY/k3Z0SJB4NG4HZvkfYlibPJheaDFiIk1DHnUfb53wf9Z9qfG9ZQVNpfcrK8S7Of5mHzUAlFTib0I6GSEcgIqe6G2gjgVGLhzErzBn3UE2H0bhGoaImOUi+Uu3cMv9KAeu+/5MipqYZUIoUuPWOQYX760Mjga9BRTQZ2zKIKQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a9674d-9794-4989-08f0-08debce45acb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 18:10:09.7865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVXi1jL9Xccw2UrrFrRyQazhPshtO5Gooq7wrQxH5iBynIo0DNMx62Ntypgth6WPLNz3moe5Na7Vk5DbyPvUzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1611BC49E
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



On 2026-05-28 1:51 p.m., Julia Filipchuk wrote:
> Minor comment for consideration. Changes to printing, stream compression look good.
> 
> Should replace 'pr_err' with 'xe_gt_err' as we use elsewhere. With this change.
Will fix it in next rev.>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
Thanks for take time review it. I got offline review comments to have an 
kconfig to control this feature, new rev is on the way.

> 
> On 5/11/2026 12:49 PM, Zhanjun Dong wrote:
>> Replace the raw ascii85 dumps of GuC log snapshots with a
>> zstd-compressed ascii85 stream and reuse the same helper for CTB
>> snapshot output.
>>
>> Use zstd streaming with default level-3 parameters and an estimated
>> source size of 0 so the compression workspace stays bounded even for
>> multi-megabyte logs.
> 
> ...
> 
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 4d7dcaff2b91..a6fbd7233c09 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -33,6 +33,8 @@ config DRM_XE
>>   	select ACPI_WMI if X86 && ACPI
>>   	select SYNC_FILE
>>   	select CRC32
>> +	select ZSTD_COMPRESS
>> +	select ZSTD_DECOMPRESS
> 
> Decompress is not needed since we only intend to use compression. Possible that
> both are needed in kconfig.
> 
There are 2 zstd error related functions requires ZSTD_DECOMPRESS, maybe 
I can only output error code rather than error string to avoid select 
ZSTD_DECOMPRESS.

Regards,
Zhanjun Dong


