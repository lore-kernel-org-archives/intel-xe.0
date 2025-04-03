Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB65CC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 15:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705C810E9F2;
	Thu,  3 Apr 2025 15:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TM+VRyHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC54E10E9F2
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 15:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743692785; x=1775228785;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4oHGh03U+iJbKOh0CIIHEzzq8rxSk0hKs8Vcgl85dsc=;
 b=TM+VRyHbJ74HW1JOOirMN8A32Nwaej8g2EO7agkouOSjG6XyN8mCCcv2
 6TW9lxpBko+sLzXFi+x2EqPrYFmDU2ypgnmnxsxv4cw6MgdpJu7tuWFPh
 KXzo701LqRqsqL5kr4m8HgT+mji5hiKBrYxmWSsTOSGFaWGN8VyDUYW0G
 JV2qlKHNjGp4lcPgRdJyxEDNMj4WYpZodAR7QBk6Pg+pff1tFbtmZOYqs
 04qoOaVAqCP7I6lqFmqJYBsTEM+MXvIBCMrABomHwIwjlkCHu4vxyTo2b
 Hm7RUmwIo/i7mgwcASxF46/a50h1TFHyrkKrZJemF/1nW39ZXMD+50PHZ Q==;
X-CSE-ConnectionGUID: xgjpuIBkSl+ZS3CvnoYXfw==
X-CSE-MsgGUID: or2cYTcbSmGTuh9JHKeWBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48767064"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="48767064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 08:06:25 -0700
X-CSE-ConnectionGUID: hJqn0uZmRs+Of03GH2SMnQ==
X-CSE-MsgGUID: HnWfkrXeS5yoOduXPeQB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127966761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 08:06:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 08:06:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 08:06:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 08:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTIOAvcjoQVwS1gDy7Htir/Q50PJ3PoWD61PrKlZsGwzrSqnP5PVBto/+flBkE9O5sYbwKj9hu8FGCNf1chInYjiZsJ2eqKBxU7ZDSB9e9Sg9FfOI4Rmrqn6XOLMRoDt6B70k8GTXXVZz8YRtw1BtAgWYiIddfLLQ9hSx9Aq0Jw4j7wEijwUxhc3Jyl8dZuviIuQF7v6LQtSZ/P3QzX8G0hV5OpZZPJ1ocfLh+s1xSM1M0LXS7OEi0hnCjD1afdNDAyxMIkQ7Gr/1PSE3cGWE2uyNfiOAoEEvkFngKlAWLzwD2USZdFQ0T/H1mTSbhljjTUYAUjkCqISy4Hol96bUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQFF07uJacWTHxinIJ1VT/5/ox/1AzM2PQBq+FI3ZbQ=;
 b=ldtwRKhE0ykjHVw9gmT58tqypaOIJRfujE+mmauhgWcEmMnaGtPGXZPs6j/uFypKwa8TRrsGXmbmWiQlwe7/Ua/oTeAbJZYzevOj+DLC/Q8OX5U6iheWVtfRJsAXI3/s8DUx9hFdGZk/4Vt5kfA3Qtz5TzkYzIJiLgHOPDCeyL60zywRQXN5amaP//pCBnKXRjscE0u4cLD5QMzYZkkzL3XpHw8SslqH9YjKkE59ikHV6aE9ImlLXMrEkAYtWZYXCplaryDsrb18IM2tMfVlCfTDY3IHsegWTBohAYhpVDNQibmcX+PJ1iAxoB+HWYcFhM7EhSyhF9kIqMogaoyrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Thu, 3 Apr
 2025 15:06:07 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::cec1:b76:724f:592e]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::cec1:b76:724f:592e%6]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 15:06:07 +0000
Message-ID: <bb123841-e6e6-4c55-9003-2762e078c415@intel.com>
Date: Thu, 3 Apr 2025 17:06:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vf: Don't support changing GuC reset policy
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
 <20250403094141.25941-2-lukasz.laguna@intel.com>
 <3db59050-da84-4d82-8d09-b610397eda91@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <3db59050-da84-4d82-8d09-b610397eda91@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 09865b1d-0d92-4f47-8b0f-08dd72c10f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUhNMndSRmRSV08wT0dPT1RLamo0dGhJNUR6ZHBNK2hCUkI2YXZzSk13Ylh5?=
 =?utf-8?B?YldCWGJrS2tCTmMzL1NkZFF5MmtteDBMUDlHdTNaSCtTK3VrQ1Y5Z0J1d3hY?=
 =?utf-8?B?VENRVjNia1hlQTg2ZXRTVXhnN2pFWXdWQnNBQ1JnQjlQd2x2RkYxZm8zcFNv?=
 =?utf-8?B?SWhNN2hzeEw3Q1lhN0NpeGRqR1BhSENMSThyZ2NENzFCc0VRTFZtdURXRkZo?=
 =?utf-8?B?aGhHYy9sZnU4Q1VxVGdYS1kyblovbnNzeSt1OExBaG5TNmNRZ0NOSnhva1VH?=
 =?utf-8?B?WnlDb000VEEvZDBXc25RbzJwOXVtSVdJTmhKRFdQZTRTRjdFREs3MXVwWTk0?=
 =?utf-8?B?WkJqVTViRURyZ2FOaStEeGp0T2VOZTVsWXpTMllydlBsZGhZb1hQdjE1VDly?=
 =?utf-8?B?Rmt0NGxhemVGckdDZGZyblJHc1d3cUV2U3gxc1dHMFlSRkdHenBUbUhEVGh4?=
 =?utf-8?B?OEExTWZrczZjelhhNlFYWWlxOEY3WldmandsZldQajlnL2poQmFWdi9vRDI1?=
 =?utf-8?B?QmFPODJ3L1dTTTdZZUwrRENrdnVwUk93cG9TYlFOOExXU243MnNab1BKcG4y?=
 =?utf-8?B?OFZKSmdBZVRJdENGYWJ1dFJOYk15QTBwSFJNU2NUV3AyTGJpeHNpeGVQOXRI?=
 =?utf-8?B?aWQrVmFzaGQ5cmUrNWFXQTNsRkVPYW5RUWhwbDhTa1BPYXI4REdrY1JhazN4?=
 =?utf-8?B?V2lmNUp5cUgwUERqTGFqVlUvZFJDbHlhdmxxU2RxcjkwMWVQM1RMbnVzUVI5?=
 =?utf-8?B?WTk1UGdXdW9pL3pRdjdQclFucUpzTDY1d2tUR2Zaa0NnMDhFbVN6SVU2ZFFm?=
 =?utf-8?B?aTU1VTNVMFQwakRjSjkySlBvUC9iSGlQZDhua2tWNTREZVVEa08xYjFrYThX?=
 =?utf-8?B?TTRzaUhqWXdyQVdIM21iTGVBc2d5KytGeEZLVzE5TjBCdzRqWThlUjdlaW9o?=
 =?utf-8?B?R1VaNXBRZEFWbzdkWWtmd2Jkam9aV2VPbi9hYm1hUHZPQmhYWTI5N1ZrWjFo?=
 =?utf-8?B?bHpnQWdOSnlPa3ZIRVJKSGNuWDFoalVRd2dXclkwVXhjUStKUDRBVjM3dk1o?=
 =?utf-8?B?N05tTVVOYm1nM0x4Qmo5MEhiN2Y0a3paWDBvNHRkM1J4UitaVURTSGxpRXNE?=
 =?utf-8?B?WUJhZktWeFZtajhWZDVnMzZTNFNoTXN2V1d5bjQ2RWZEdDdaK2hlMmNhZmNo?=
 =?utf-8?B?dkprM3BCWFBUcWprQ3gySU9SZ05nOXRRZXZhbDFVSEZtNFpjazAyVEQ3NlNM?=
 =?utf-8?B?dGdXYTUzbTNFT3ZuWnJ4VnpyNXA3VkxMOE5kVmttMGNFZTJpRmQwdDE2cnVx?=
 =?utf-8?B?Yk9TSHBDSkUzL0x4T3JwVnNaUUc5dmRWeU1VV3NRMm5PdEhsblRqRy9MaC9y?=
 =?utf-8?B?RFIzTE1Cd2hmQWZjSkF5b1RhZm4vdHFwNStiNDNFV0R3STFkY0VnVW5hVGMv?=
 =?utf-8?B?dFBmNmxWRmE3bVloS0ZwSnlUb0pLaWI0aFR5K2ZSS0xkVmlpLzczN25aeFVh?=
 =?utf-8?B?Zkt4NFZYa2JuWHJWV09wSDNCVi95amdUbkV3ejYrS21NVFZWVnRBT09MSmZX?=
 =?utf-8?B?NDEvNXlqRHVKa1lBM1ZYZXI4VUI2bUVVVkMybTJBQ1dmOTBBRGJPMGVNZTFk?=
 =?utf-8?B?amplOHBQQmxtaEVZUmRCQUdPbUNvV2Q3RFJveFl1MzBobmljeEJsQW53MzJm?=
 =?utf-8?B?cGhpeDU0TWwxWmIzSXowZUFpUnp5dW1aWHBDbDRYWmFEbzNPWmJ1UWxsQXNK?=
 =?utf-8?B?T3RSZ3JLcFpKb3VoWGVlcEZXVEVkQWlWMm55YlhaWHdOeEcza0VCL3pRWG5W?=
 =?utf-8?B?Z0pBbm1ISUYvZzhNR0pJZHZRVTBCTVQzRHBDakpQcy9Ga052UmgyRHphQXlk?=
 =?utf-8?Q?pjLYInGnBTQf2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdWQkovVVp0YURVTnlKbys5SGVjTEdVTDlzbDk4MmhramVkZk5teW9Oc3RV?=
 =?utf-8?B?c1k4R1h5ek00VTY4TUxCK0NUY0pkVXB6cHdyLzkrWkc5OUV0dFkyVEJicFBt?=
 =?utf-8?B?SzlLTGg5MzBsQW9rdTBpRVJ6dEhpbzY5cVRSakVBZHNPYVZNaktYZEc0eUoy?=
 =?utf-8?B?cWFhUGlMeFRTSUgyMm5DTUpnNElUVXFFcE9CZEVmQ3puaHpCa3NsQll6ZDZz?=
 =?utf-8?B?VkpqaDdHS0xCL1Q5WnI1Q2NkY0F5QkI5K2dadkQ3dzF4R29LREk0ZitreXZy?=
 =?utf-8?B?QTloQWJIMEM1SmR1ZFMyWFUySHpoOW8zNWJpNkVva3hmZjJlSnIwU2tiODY2?=
 =?utf-8?B?T3NLQUdpZzlBaDRkQWI4SlRKWUpIWWJYU01ScjJtemNTRVdkSS83WGpSWXRj?=
 =?utf-8?B?Z0NlT1FUQWZMYmZ4MVJaSVhDcDB5RUw5VEd5M0FqL3FjWE9rdmZRKy9OVi8x?=
 =?utf-8?B?cDdqalJRVklqS0p4TkVRSDJTa2JaVDZJRzhCMTFxZm94RmN5QjZIVDJLRksr?=
 =?utf-8?B?WXhKSmpqWWZsWmIxdWQvYXQvWkgycFZ4ekJyeWZVNjFjV0VtN3pocnZQVlZT?=
 =?utf-8?B?aUlkNzJIYTZ6ZzNuVVlEUDZXZDJGMzJCL3I0enFFRURUV1NNcmpYZjFoalB4?=
 =?utf-8?B?NzRYTk05UHR4TzNWMW14RjJhc1ZDQmVUZkNjdm5uaGh4eGY2c1dtWUt4S2hG?=
 =?utf-8?B?M3lTckRaRGxMS2hmOUo4RTE0UHk3c1F4ZldwK1BEUVZxQm9QdE9YSDVNbmpl?=
 =?utf-8?B?Sm8vQ3FsaENENnhHMFF1dDN1andVejl5enBKbjNtZFlNZGNmMGtZK1Q4SHBx?=
 =?utf-8?B?NXZJdGpDbjkxZnQrb2ltZWNVS1lGTlJYcDNQTWpVbVlKejBxUU81Y3p0Q05a?=
 =?utf-8?B?M3VPdUIzSC9WUGZ0VHBvcnNjcEljSy9CMXB0SFc0T1JSVjNSMXdjN2hsVSs0?=
 =?utf-8?B?blk3aks1ZS9qVlFveDEraEF3ZE5jaVNqL0ljK3QzcjNXNGw4T0V4b0xGWW4w?=
 =?utf-8?B?U3pMRnBLb0tVaXdPUnFRN09Db0ZmMkVmbXdybkFpUGU1TSt5NGVCenpGL2xq?=
 =?utf-8?B?SlNGKzkxMVIxVW1RcWd0YitrRnl5YjRYUFpNQklHNyswRy9YRU8wTXhJbE9D?=
 =?utf-8?B?NXJmWVBoSDB3MWhZVFFtUTV2NkI0dWhYYXpib1R6Y3orN1dFRlZFVGQwV3I5?=
 =?utf-8?B?YTQ1OGFUeGV6WFpZSmRUWlFLTmNmNE1RRkJtV3RzL3FDRWw3bk9iTm9TYzA4?=
 =?utf-8?B?ZU45RjJQMkdMTU1xZ2hLZXROYzJYTUtNWXNBTTVGT2IwT0NRdE5mMjBYdDV4?=
 =?utf-8?B?RkM1dE5TeGdpZ3hOb0d6UnV6V3h4L3MvZmZSNG9hN1oxN05VRGliNjlicmY2?=
 =?utf-8?B?N3RpVDZXUnE1TWxyMUVCR2tPQm5lNmNGeDFiV2ZJSkNaRnE1SWp2bEROTVRu?=
 =?utf-8?B?cWloNWw3VENDWEhPbVpMMDJZS3N1Y2hvY3IweVU0RnZNQ0JtckdUNjduck9U?=
 =?utf-8?B?V1ZWZlR2T0VrNUI2d0dLV3lyYWwwTDBLRFp4WnFmQ2pjUmhFek9RcDBrRVJO?=
 =?utf-8?B?eUpaeEpjdVNrMjcrMkdaaGhxSzU3Vm4rZXJXT0dHS3VkTE90OWlVb1grVHRh?=
 =?utf-8?B?UWJ5UXJRQ1c4SmJNM25WeTZJUnJrc3M1VWl1RVdwRVZJU0gwcWpYUkRORUxG?=
 =?utf-8?B?anJPYkdCbjdUdUdOYkd3aER0anRPQldpcVlOdHM2Vk02WTBCRVpyS0VrdjBj?=
 =?utf-8?B?cnBuakNmS0xJL1B4OVkyUzM2am1IVnNKRWgyZmZXNjZBNXVRUkhpMWlwYmdo?=
 =?utf-8?B?N2FDS3ExY3lLa1dxSm9ZdHZ5Q3VxODVBVzJWYVhTZUpVc3RseHAxbWduc1Zr?=
 =?utf-8?B?cGU2QllhYmZNYVNVZVdzTHdQZzlxMkNaN1RVMXZvY0xJaTlnei83c1BMMTFo?=
 =?utf-8?B?ZzljR3REbWNHaGFWKzh1em9sYzBEaGREM3lkT3NCVnNNTFdHR1RXTUd5SXRz?=
 =?utf-8?B?MTJCMjdBaGZ0L3VIbllhSlBtTmVtSlgzVDdUWm42eEJFVGRzRllMck1jZlpE?=
 =?utf-8?B?QVMwMEdpTDdueDh4cFNRSUVIbTJ3NTZBVWFsZ2hLYzJNd0srS2tKTzRna1Ax?=
 =?utf-8?B?UjBpTWRtNnNucUlQYlZ0NnFVZGF5ekkvcENKbTdEcE5LQ2l0dlNTeTNsYjg0?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09865b1d-0d92-4f47-8b0f-08dd72c10f60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 15:06:07.1459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBvtudcS7aWm9bfdwmHtjgZUrA1Y3H+Mww/1BWF/neHKTSz5gud6EIEFlXG5AyfDjKF6NqC7u9eCjyKWHo+t6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
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


On 4/3/2025 12:56, Michal Wajdeczko wrote:
>
> On 03.04.2025 11:41, Lukasz Laguna wrote:
>> VF can't change GuC reset policy. Ensure the driver does not attempt to
>> do so by adding an assertion.
> none of xe_guc_ads() functions are applicable for the VFs by definition,
> since GuC ADS is purely a PF/native responsibility
>
> why do we want to assert just one of these function?
>
> it should either fail (due to use of the privileged H2G action) or crash
> (due to use of previously uninitialized structures)
>
> I'm not sure that we want to annotate/pollute all privileged parts of
> the driver with !IS_SRIOV_VF asserts

Makes sense. I'll drop this patch.

>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ads.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index bee4e0cfe7b8..2ea07d28728e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -990,6 +990,8 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>   	struct xe_bo *bo;
>>   	int ret = 0;
>>   
>> +	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>>   	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
>>   	if (!policies)
>>   		return -ENOMEM;
