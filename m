Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8429FC88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 08:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405F310E264;
	Tue, 15 Sep 2026 08:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyG7ImGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D610E264
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789462742; x=1820998742;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UZEMQ/4jSAcnhi3VJgo109adhPz/qSRLDQygvh2xztg=;
 b=hyG7ImGwLI8HRngMu5afOFdMMrlQgqGq5eLDmiqDBELecCufhi4cVR06
 Mjs8t6Nm0itLvMtFgmqnA27RmRV0Z5SwHfEpGOIaBWzyJ4kMCb4nWjvLn
 hAcB846RWlu4nUvZtBU/vGrLq9sWj/hoR/iey/1bgBJFA5lVL7QNiKZnG
 NkBwOLxopBwDvPV+J5iiiZ2Ccxw1KSycmooK7wyQJ9Wr964+v5L3Hl+TB
 No3aiZEU+s251OCvwkqum9fIHlT3mrUTvBvJzXA/8mEwSv26B++SWS34A
 P3akLKUVefL1bbuBo5mS9EFyDNAskN0MJ9pNcAHDKKmjy/RJ/KcLLl0Xd Q==;
X-CSE-ConnectionGUID: nWNEvTD5SxuHtlWNpTNn+A==
X-CSE-MsgGUID: BgSt74tMS8yO8aqy0lZfGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88955215"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88955215"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:59:02 -0700
X-CSE-ConnectionGUID: ut5MsU7QRWaUo4B3RaPpBw==
X-CSE-MsgGUID: kECdLw5ARNCaiJ6susyMqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="268621773"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:59:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 01:59:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 01:59:01 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 01:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kwxx3YGJUvuqTGAHTAPt3X9BPDPTpV4fdOq3yetC6kbyZj6twuwL5CSXwxjRChhkaUi4fdVoyxncRYLxcPhBvIPRDR+q3adETrA0A2mQu/XCLyQzGXybAxN+B695NAdZcImnJMdITid+ckxLTLNc81iiqMgLFJ31YrtnUTT1qKxnUE4Se+lUafFYPWgoUjqbk3rD4rZCZKqtRumH3eOYWLJBaajfpx0rpc/rqSMjZGfGwgT14rt6RH9bj5NquojUq/ZHU3PDc4lk7kNdCuochpifcM4vcLr5iL3cYObLyv3wfteqT0Oqf8dPp7scHBzHaPKc/AUS2aD2r43/o16j1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36MdV0bIu2H0578PD+0BsXmhGmpUD/H2mP+R5oa9vbA=;
 b=e5kfsabEUgvRwNd56lpH9RS97iG5WJTRJRLuR/febFjdL2nH9VZYyo9x29xLMyP+rJ5jdQQGsyP6ulATEB8F5314U8cBFp7337fjbfkFKHZmwxTawoPMt5iWZDyUrB/DHqLiMDvCaAxlZjj0eIXLToTJk6zHENee3rgMK8PmhyL6xgg/wDhN+J0FkGwv7uhbYgK/0UdU+P49wQ9r/N8zqviMg3FEsnH1nnlJcBQFBEpOYK7RlAHEatKZQ8++dx0nMWf6VZYYZSlFsdEB3kmUeG3diS8jsVHYpEeE3w0PsQc0thqEzkAjzKHQDu9bGko8g8/q851mKL73uBX2JTpsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by DS0PR11MB8163.namprd11.prod.outlook.com (2603:10b6:8:165::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 08:58:53 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 08:58:53 +0000
Message-ID: <cd1da898-c2ff-412c-8e87-5d7b59bd42a8@intel.com>
Date: Tue, 15 Sep 2026 10:58:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/guc: Use different error codes for GuC load
 errors
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-8-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260903233958.475162-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0065.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::27) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|DS0PR11MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 1713ca5c-9485-4d74-ac05-08df1307910b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 8XscpX3MiDHKYi8UsaRSESv6FJjzFb0kalcquuOuVkHxULA7kCcDxSdxRQ6sTbuMrs84lLNZg5ulMdazgB8KOlYlW6cqgc4GrfLxn/DBHfA42PUDc0tZ2CcShR17NFSAuYEESWqqsX7rSULosEaXPyHadyiOmhxEmsCyKa1x9Azx4eOE73TxWepx8m79m2Aiu2uQNwGMqF/CAMsg6/w5xsWBKmWjhcd1nU3z2QPH+EXsmehs6NKnD1KMmUkTS2HSNSNAWQ/wQtSwfcPh8MCQx1RwWyjrqHOvfrxAXM0ZwxHg89HakHXwAtRXIMVILOVpoTDQvZDiCPzc1FyWpDWfFZdQ8TWcgbQYD1HJ0I8OfqHIfBay7FfukeeCXdqinQQfXnlkkPCABhyN42HRXuSpG91botJEkSj1FydPODg0HgNEp6ZB32rVX1LAOxJYN9jKJpdkLj1nNdyhMHiHcYJQXycV9rQSfo/dkAUIOhce+MzRQDvfShIYR4xmhurNyhyNyLrBAsLECA30XroHlYzi+meAfffz+xxNy2NEBltdk1eK6ggehCJ3c7lPr6NeWXGqgOM4O/lAmTqYKzxT4lHBiv8aoe4cRIe8j39IXVwui0P8IZhj6RMvqCkVdDLTfkGfY1i+tLuqjM++sBfjUrT8QBEgk28K9p6PodaAXhToSd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHBHSUxobCtENGNFeUF4RHArNTJkSUs3cDM4QUpQWlpHamdWTVJrb3RIWHFs?=
 =?utf-8?B?ekVJTnpUbUQ2eEUwTTJyb0FHeTRpS2NUaEc4eGQzS2thallqTUNWQkIvaTJ5?=
 =?utf-8?B?clByZmFCQnhsOCtzUTRwakdWQ3F3SmRVMzdrck9vTVpmVFNVWnMzamgreWdr?=
 =?utf-8?B?MkVOSU1uUElTVUVpSkFiYTh4K04xcFhSYmQzVjZIbDhqc2p1UXFreE1hYlZN?=
 =?utf-8?B?UHZIZW4vL2oxcFQwWEx3dGFtOTRPam9CR2QzanMzOG1HTGxuV2cvSm9FRjV2?=
 =?utf-8?B?M2RuTU9DQUxjZXEzeGNiU1BUOU1vZG9FU2pnM29kdEZ0ZytxV1YzY292VjJi?=
 =?utf-8?B?bC9zUzJ0SDc3a2c1eGQwQmZZR2MrWTdkdktLNFhmMmJEME5ubVVuclZBN2lB?=
 =?utf-8?B?aC9nVmZLSjR3VDNENUdvSEwvcGt3ZStDUVpoY0dYeHpvSnhIUHRONDVncGU3?=
 =?utf-8?B?Vk94TnB1K0oxZmx4TXNYUlA5Z1hvUndsckc2OStMSHFsbTdnZG5kdmsvWDRy?=
 =?utf-8?B?K2tudkU3dHVnY3FLb2RwZDR0Z1VpS2tvb05YYWx0eHVBSGYxRjVuejlQcDZK?=
 =?utf-8?B?YWx5MXhnc2VjVzdnYzVnQUpvR1VYcXNzY29RTTFCNVI2NXFJRUFxTHdnd2Qv?=
 =?utf-8?B?UWw3ZWlORmxSc050b0pFRGk1US9DdWRmOWd6eWxaY0trOHpsQ2tyZVlPUW9k?=
 =?utf-8?B?aVdyWjhjakRGOW14Z0g3S1BsWURuMkNxSTRxUFJZa05aNXpHMGpkZ3J0YTY2?=
 =?utf-8?B?ZHk5WVY5KzBiSG5JVWsrLzhVaVJzN0ZUK2tJRUw5WUpzT083YjA3aUU3NU1k?=
 =?utf-8?B?eHdxSEJBUXhDQU1MTE9QTDk0WDJ2NTE3cGMrM2NSekFkOUdGZFdqYUc2cGF0?=
 =?utf-8?B?ZXU1RjZrYXdrWHA0cndXOVBuV1F1eWFtWXV3VFhtb0lrdGpDVnlweno3NFZ3?=
 =?utf-8?B?TFMrZ0FKWWZRVFdCdVNuS01GNUlIZEFYLzJySzZxeXdaZzB5Y1Fsemwzc2tp?=
 =?utf-8?B?eEZhT1p0OVpNL0dHYkk3T293dmZ4Y2hTcXZRd0t2MENqUkNJN21IOUtQTGpW?=
 =?utf-8?B?cWQ3eEJaSnh2YTM3dXNXbzg0WVVVbHFSeGtNMmVJcCtqblpTRkhDNDI0OTBQ?=
 =?utf-8?B?ZHo0YVF5OVpKNFF4czRSNWYrM1RhcUtNY0dMZ3NtMk9PMytGN3JTb3g2WkdO?=
 =?utf-8?B?allVOG1HdVVGZTkrYlU5UVV4WXA4aGROTlFtV2wvQVQxRW52cWZvZWQrUXFX?=
 =?utf-8?B?dUY2Sm9xK2xIVUdxWlFPdklhMWlZcG9DZ2ZyRzhCZnYrUnhjVERlNUd3b2VM?=
 =?utf-8?B?QXFDVmh0MTVBSkQxcjU1MTU0eFFsV21KemZ2TXZtS0J2YWZ6d2ZWdXF3VDA1?=
 =?utf-8?B?STEvNzQ2Tk40NEJ6WFBib1hPUUs5d0RuaCtJTlFYc3NRTVYrQzQ0WUludGVk?=
 =?utf-8?B?cFRjWmJNdzhHZmJ1QWlDdjBIR0RCQXhXdnhhQmNCT0dDQzg5ZUdoWXVzT210?=
 =?utf-8?B?U2hITW5JbGo2N3N0Smppc2crU09sRzdCd0JZNUxiak5WNzRYMDVUbVlTT20w?=
 =?utf-8?B?UjZnQkRnRUVmVFNxWGVzWVRGaC9QQ2ZQL213Z2VtM1RzNWt5dFppdHFkb2xN?=
 =?utf-8?B?UWwxL2QrL3FBemJrMnRrSzV2VG1DR0REcjljMjM3dUFMYTZRZUU4Si9pM0Iv?=
 =?utf-8?B?ZTRTV3JRZUpjWlkrYzJWbVp1cjhBeGFjM2pjY3REZFJ0TDlIbnVZZ0JlWUd1?=
 =?utf-8?B?Skgra29ZR3JMZVBtczN5Wk92R2ozd2puaDhKQTEvdmI0bmxlUDJQZ1pmU0lR?=
 =?utf-8?B?ejAra3JkK2lydVZyOHdUUmhicUJEZXFZUDNIQkwzOWtXcjd3V3d5K2JrNENN?=
 =?utf-8?B?OXptNThsOEdTRmZTTGRsczg5Ri8wKzg2TENxeEg4WDBvRmxSRUFIdTdybTlD?=
 =?utf-8?B?bERlMFpTYnhIdmhHa2paNTI1QjhVR3hRMVBmcXBRU25peGtMWnVSU2hjakY2?=
 =?utf-8?B?ODl5ZDdBODNzM1ZiSkpIRXVETXhuR0dmRVc3LzNDd05lZ0JGZGtydUR2MGdQ?=
 =?utf-8?B?THd0RXdyNVZURVJRWTIxWVBhclZZOG5lZDhLQTM1ZDQwdkxyamxDaXJIMUFR?=
 =?utf-8?B?eStzTXUzVm8wVjBockx6NEtjZEVpNlhPc2NLVC95ajd2d0hHZldXL2VnQmlp?=
 =?utf-8?B?TU9rUzFmL2R1VVgrMHpOTXcwdTdjRGVFSWhQbGlUanFneTE4SGVxemFoNFQw?=
 =?utf-8?B?cGdzODdpcktOdmlKKzA4MGlkRXFoVWoxRThvNU1HMUJEcGlzcmdXaGdOYXd3?=
 =?utf-8?B?R1VKb20yQUpOUmpGVy9HdERJS3U5ZTNJUURpMEQ0RVQ0RExtdGc1M2diSmw4?=
 =?utf-8?Q?urhV87GD3vpN8WwI=3D?=
X-Exchange-RoutingPolicyChecked: bgFQYH6wCQomz0mbi/iqdwM4NsSdrS73vIAUPGPAEGbAQlBMELjvFLUBfsCPk/evkabkfGHI/+eD59X9Tc2nD+nH+I77H9VYusoRms+2J0i54EI9I5dNwgI9MS+XEtAWxdVUigfwp/m0B8fLXnB5xi0Q/n+z6rB252eJaGbeuzoY+2yShhNKy2DrnnHqk/OW0yHvhnJNhgA3qNotycAMm85ByP18AGPoEeNN91RBOct183jokMa818Jgmx3XelrKtJbxqm8omQZAFWQu6xRYhUzBvMThC3/LHNnvCJCQ3w2zzZM7tTkf0ob5u+taTnTHqemd/AXbOnJZ/WlbosH0qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1713ca5c-9485-4d74-ac05-08df1307910b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 08:58:53.0300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qITcGpacYsDV77KLWmgznaqb80SfUHiV8ZwFFLIOWrnDRoXFK0fyqC99lAfkX0CXd7nH78Q9qjVJ4HuWUhCY8wM5V4bcG5j1Nh2uSRl3FRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8163
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



On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Instead of always returning -EPROTO no matter what goes wrong, use
> different error codes based on the error type.
> 
> v2: split to its own patch

nit: you can keep change log under ---

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c7f8bbd4cb92..5285d4cecbc8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1144,8 +1144,8 @@ static void print_load_status_err(struct xe_gt *gt, u32 status)
>   * Check GUC_STATUS looking for known terminal states (either completion or
>   * failure) of either the microkernel status field or the boot ROM status field.
>   *
> - * Returns 1 for successful completion, -1 for failure and 0 for any
> - * intermediate state.
> + * Returns 0 for successful completion, -EBUSY for any intermediate state and
> + * other errno values for failure cases.
>   */
>  static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  {
> @@ -1157,20 +1157,22 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  
>  	switch (ukernel) {
>  	case XE_GUC_LOAD_STATUS_READY:
> -		return 1;
> +		return 0;
>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>  	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>  	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>  	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
> +		return -ENOEXEC;
>  	case XE_GUC_LOAD_STATUS_DPC_ERROR:
>  	case XE_GUC_LOAD_STATUS_EXCEPTION:
> +		return -EIO;
>  	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>  	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>  	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>  	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>  	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> -		return -1;
> +		return -EINVAL;
>  	}
>  
>  	switch (bootrom) {
> @@ -1184,7 +1186,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>  	case XE_BOOTROM_STATUS_EXCEPTION:

nit: maybe -EIO to match exception from GUC_LOAD ?

>  	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> -		return -1;
> +		return -ENOEXEC;
>  	}
>  
>  	if (++*tries >= 100) {
> @@ -1197,7 +1199,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  			  *status, ukernel, bootrom);
>  	}
>  
> -	return 0;
> +	return -EBUSY;
>  }
>  
>  static int guc_wait_ucode(struct xe_guc *guc)
> @@ -1213,21 +1215,21 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>  	before = ktime_get();
>  
> -	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries), load_result,
> -			      10 * USEC_PER_MSEC,
> +	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries),
> +			      load_result != -EBUSY, 10 * USEC_PER_MSEC,

nit: I'm wondering if maybe this "10" could be somehow derived
from the GUC_LOAD_TIMEOUT_SEC ?

>  			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
>  
>  	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
>  	act_freq = xe_guc_pc_get_act_freq(guc_pc);
>  	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>  
> -	if (ret || load_result <= 0) {
> +	if (ret || load_result) {
>  		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
>  			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>  			  xe_guc_pc_get_cur_freq_fw(guc_pc));
>  		print_load_status_err(gt, status);
>  
> -		return -EPROTO;
> +		return ret ?: load_result;
>  	}
>  
>  	if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {

just nits

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

