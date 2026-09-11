Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1250C88E42
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 06:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962B910F4E6;
	Fri, 11 Sep 2026 06:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyy8c1xk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A819710F4EB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789109167; x=1820645167;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+0Cx8giPlKgvVrlIGsjCg0lIBU0bHfZJ8LsCseisAu8=;
 b=kyy8c1xkugvwNpV+jIw2Yz9JY0pHWF2Dsqy5p2/QlOu5DIrQczm2qqWQ
 qthIR7D0J/MDzgkanOFi3qSzg9Yyc3jlwgduItud/8ghr30kjw+1zISKK
 qEPI6erVLMbklU9dkp88lJW9Z3Y2cGtrB3VQInLFyyB98m+YFWLAovubl
 C+g7G3MVaTRhw4oRbjjSie3dh6MLTGuMC+0+k2KBZsZRcea/pqohoPstt
 X5vaxp4hYUFucauwPFuBY80hsh5689fxtWEUxB9PAHbZPnAVgbsDPAxc+
 dzm/jsoY+rUr9ReDS93Khh0V7OWjJQVpBHGXLo8oC8HHCdYWVys5jV4oA g==;
X-CSE-ConnectionGUID: 2xvTxXNsSSCiRCvIV8HWyw==
X-CSE-MsgGUID: oS9GhsJhQYuPWPQ+2165MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89697806"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89697806"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:46:06 -0700
X-CSE-ConnectionGUID: 9PAaDX1dRnGDPRFpe8M0jQ==
X-CSE-MsgGUID: AM7/oi+zQ8uRrlmQvLBhNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="269243356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:46:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:46:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 23:46:05 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:46:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCCsm0xI8ey8+s7mSAuobWi6rEqOodW8GhEbCrKWfifu4Lurz/bivySTGIz1r23gSNEUJHh+IsTsmTDyhIomsgdpGctPybyp+R05Q7x0OGQQrTZkmWXkHo4f0xRj5Mpa+ktCi2PEGbeslxqdrlu+re3MjFQWUED/WGGfrekCjK8Vo8vhncf97EIAOgFsR5YrBc+Z7Ic4/osnnSOlUKJniU2UJbF4BpjxE6Hp6DqMaUKN4WoCtCLkj6XX9o1FdbOOop0RU8UJDHfuF8C1HNfYTbW0YB/vGrpkXYe25+4rR9jvGEsCEyOK7KupmADVw3npClkLYNlpWcmuDgvjIG6JYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOkR0+15UE5EqcUxEeTmbBTzpk1GNu9UwrXyHjHxO2g=;
 b=U386z1FxtABk/MLDDfopir6bgyPHt1FSJCszL6mPCwbgTN1HT0fteG9K3GD6bLosT/n2GOF+m4/zGMFNy/CYxOXXwezKeaMLtPbOAxxBHbjlx9Bvqt7vvysItOsO/5I/5S+OtxA8o7JbUqgPgzXwZRacqL3u/JV0G6tMFdjRNyvMjn9Xdz6PZaVTcQmb7c6YS6eYAo36sVKvc1LqqmrGAmcmt1gDMjObwOclM8IbUhAW43Tzsow9qcgI7dedyt/Ibqv4WtBPSNWYvkdOrjoa7rpc3g/auv1xgzD/WL55+pbG1YPd7mdC5QTcB2SLqaQZ41Nei24gk30dEUDAWIt5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 06:45:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Fri, 11 Sep 2026
 06:45:56 +0000
Message-ID: <f0dd7bd4-c1af-4644-bd20-64d35046b8f0@intel.com>
Date: Fri, 11 Sep 2026 12:15:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-9-riana.tauro@intel.com>
 <c921cf8c-25b3-4362-afba-fa38abbbefb6@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <c921cf8c-25b3-4362-afba-fa38abbbefb6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0272.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: f47ec727-3d58-49b7-042b-08df0fd054df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|6133799003|10067099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: D7tDolRi1PGI4B0opuzETfF2YjPABmZxOdnY2QX5osk5X8QwbryCLJ9CDpVkwI6EYKf+lJ/IlRiqhwD8g40ThFruBWjzr1Bh/q+cu2FrjUef8uw8OyIQITZhFZLjHXKp3UNveiyavAZp/Miy4Rx+B/LixKw/foN7AmotJel7fVh9jQneLnyTlWy8FLM6O/f/GyGcq0NifnC0GY5OQxSsT2svrFEcyrVELQlmzXfEgFEi8wHtP124CalLpuWPcILeKmTH9HWtreHcwTfl2MyLLxh9zL4+vGy8F5RI4FDGA2s6bmimm4iRBnlklbRjxCLloMY78uqGuYmb9R+sRjwD912uGnmeDzpxC6IRFcGMgUZfKK5h+cPqjCfHYqj+aHAHXTGiczP1hXqKquW6CdJSiAy9rHITHX9kAcq9zba1ltG+CMUue8pNqW7gHWb03rmMDgMTEw/dJc8JV9UxH4/iAaDPGTGQeYouieG4JrPmOlx/4oONF30TkDIbPBNgE2IRlJbz2/8b7IWBLaXJUJ05qTmwFN1aXvGZpOw3SaJ2Zo+/WzvFxF1CymMqfWtXf8yIf5wR+Ni9F6SuDtIMC9CNcE03AEk2iRoPhiafZdnz3Y8xxuhpHFOoL4Pwj6aB78HqR+awdEFlRnCMyIoNDztJEPRn+PvdBK+MLmCCHiLWcBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(6133799003)(10067099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGlzOWl2UTJ3TVpzaFRaOEJwNW5tTy9aQUNCOURLaXFpNklscUVMVHZNVDBY?=
 =?utf-8?B?SnFvYlR2V2hlSEFhSGhFM21zWkd5L01NMVV3V2xwOFRZNEJsY3lBdFV6d21D?=
 =?utf-8?B?SUVlemNEbi8zNlo5cEwrWktiYjNVWTBQMmN2aDI4U3MrRkZCZU13TkdyRCsv?=
 =?utf-8?B?cU5Bc1RwdjhDUERxNjRmUzE1bThWQUlvdE9JZy9mMlEwamYwdjF3WHJVb3J0?=
 =?utf-8?B?K29mYTVBdmkzRHlTT0JSWDN5T3M0dHhPMHhWd1ZoR0xsZHBEaCt1K3Mzend3?=
 =?utf-8?B?YmRXdDdZN21JbmlFaVFCNm1rN29ic1lCY3lTNHQvU09JN3VsdEZpMjJSSEYx?=
 =?utf-8?B?SXJycytVN2xsZE1ZZm92T0doa2ZZL0FHOThOcXgwaHkwdUJjSzUwNUVNeUFX?=
 =?utf-8?B?VEdMMk1IUFA5TFgrVkZnOXZ4eE5QdkxDcnBGVzl3bHlnQWtRaE5WRXFEcncv?=
 =?utf-8?B?eGNqNE9Mdm13cWEwUlN3NGFVSk44cENUekpybUliL1FGQ1NiaW1jS2NJRWhK?=
 =?utf-8?B?YzJNbmZZMzZ1RW9xOXExR2hBSW9ITjRSeFBXL3IyeVRINEJLa3ZwajZPL3lG?=
 =?utf-8?B?SE5CY0R5ZTR6MGhNd1JlT3FlOHIrRjB4RE5GMUIwTzFUME9DTmxhU3BFMVNq?=
 =?utf-8?B?TFRiU2ZtMEJHRlF4Yy9xdWtmTENmMHhMek14ZGJnSFdBZnpjWU5BV3NhUVZp?=
 =?utf-8?B?Z0w0NVI2VnRYYkl5Z2s1QTBwdFovOUFHdHpJVjNnVnI1RFl3NUNoZ1g1OTRS?=
 =?utf-8?B?UDVuR3BKM1Zoa2VHeDRSMis1MWIzcG9pbnA1OEx3alIzS1pSRW91bmNBTkhM?=
 =?utf-8?B?N2NoSEpja3EyeTd0bFcrMUV5OWwwaWhKMGE5Y2paTVg1b0hXdVlmOUZGdFky?=
 =?utf-8?B?RnlzbkdONmsydXIvUlNpcTNLUFkwN3ZjRTR1REpERS8xd2pkajZIelVlanpr?=
 =?utf-8?B?QVB5aUpOQkJhbFZmRm1aMTlKWmJpelV4NGg5dmdUUmEwQlhmSXdpZkIxT050?=
 =?utf-8?B?bHVHbm92SnF4dnI3YkJNNm9HdGZmRDMvS01CbUNSWit4ZTlFaVBCVXBQLzYz?=
 =?utf-8?B?d25mUkc2c1hrMXpHRDhuQkRSSXBjYkc1dWwzQU1UbkR0KytwTy9TN0JvVW1R?=
 =?utf-8?B?ampMMUZIUHVOMzNJbFhkT3ZUbDJ2Tm51eENPZWFwa1djOVM5S0hNb2ZmYU9m?=
 =?utf-8?B?c2tCaUkzektGVkJPcVJucDNrOWZZa1JpdU1GemhJalpJSDg2WWYyK2lHUFgx?=
 =?utf-8?B?R0w2WDJkWlliSWtTNk1lcGgvWGg2NG41Zyt2L2h0alZxWC8yR3BvT21vZkxX?=
 =?utf-8?B?cTR5OE9UYmFQSEJUdStqLzYrWVRJUGFaS0hNWW12WCt3b3JkdnF2VFBkU0h6?=
 =?utf-8?B?UUI2ZFUyUW0wZDdlK0ZxdEZ1bEtaYmxIOWZiNjYzeHZvZzBmZlJUMDBKSHI1?=
 =?utf-8?B?VWc0OHpmcXVZcjB0aEUwTVRLeVE1RnRraFBKRlpjUTgvNnYxQWN1VzJTcDBk?=
 =?utf-8?B?ZmxBV08zUTdwbldCT0VzOG1DdmhWVnlBa1ZSSUFGZHZMZG5Mamh4SDdNbDEw?=
 =?utf-8?B?TXJiell5TmhOM1UvTE0wUG1OWnE0ZjhSUVZPZ3VHTXI1SGNXc0llaUFHMWN3?=
 =?utf-8?B?NTI0a2p2ZzFjZU9oMy9PaVdqdkVpMFl3UTk0c1JkKzNzUUJBRGhWNjBqYjFy?=
 =?utf-8?B?bzRFTGs0bGdBUmlPSnJtQ1pIeHdoSmJnT01sdmp3UytCRnlERE1rVjRSNzY1?=
 =?utf-8?B?SVM3VmgrejBxZE5rUzhrZWZKek1MZjZDcUFwKzgvVVpRL0lUbHk2d2RYcjZu?=
 =?utf-8?B?RmFXVXBMSytWWlQ0T0VoeFRWQzBiOG45ckNwY0FENTYvbXpZY0U5djYrUnpa?=
 =?utf-8?B?Z0JjSnN5ZDhndTJGT0EzcUdlR3Jab2xHNEg1cVRVZ2RqSnBvbWJhQmtiazVB?=
 =?utf-8?B?N00wMGZaYjhzYlZRNTNNY2VWaVZkdjhYMUpGV1VEcXhTNnBFVGRIZCs5dHV6?=
 =?utf-8?B?NnloVzBPMUdhUTRnWis2S0NQRThlZzhkOUJsbFFDKzhFeFp3bXovajlhTnhk?=
 =?utf-8?B?S3NudnFseDM5MWlpeXJwT0x0RjlyRmZFKzUvZDRpZW1RZEErZG9jV2xLY3Bv?=
 =?utf-8?B?UHZwT1p4WXVpTlZQcTI0aXc1eDdoc2pTUllKY0hqMEJTVS8wWlVMQlFqNm9V?=
 =?utf-8?B?bjFBbHFNRGtwWVZ1YnZsU0xvWU1VUHpwZTFLSmNubXJ1dDJLZWZoQzhwaXk5?=
 =?utf-8?B?bGtXU2dBMTBiMVp2TFJzS3Ztc0pOTlVSeWxTaDhRYlE1NTFacjVoRHJVNWVw?=
 =?utf-8?B?d3hqY3RuZWxldDRTdWpicWZCT1FYSFRXWmpKUWNTejdBNjVSSFJJZz09?=
X-Exchange-RoutingPolicyChecked: kNvlbBqYGhIEVhA8HXbIyLxUGwA0GvM6Hps28qqkR8+ps7ujKHBAX1GoJMKuEse+lb7AmS6UMLQNhOO0G1n4faZ09CwifwNq6KgI8AUR2YTv+8ZayxdMmIC6ZQVxP/N9jHxd+dBlSSrzqB7EobY1D6RtW9EQWeAtZ2PLbAzUnyTSU9faLDxhLpHLj7cEUmG7SMR8D0KOg1r9JH8rs/sFdCFJyMrCZk2P1fMJpomC3y3oMGile7wEZlElSM2M8GS0wbqCgAk0PlExn4IcprKNLx618K7/iP0u5EGTD2UY94NvtccfcSi44sXGedh53+CMX3NOATUvHvaVan16hdBbgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f47ec727-3d58-49b7-042b-08df0fd054df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 06:45:56.4589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3c3HksykUzJnLqUH1WzotS0m9Cakp8qAL57s0J18vLivtd1TON0RrQQ5Ibw4B8PtfPye1A2KYWaGqJ2McTvJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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


On 07-09-2026 23:05, Ghimiray, Himal Prasad wrote:
>
>
> On 07-09-2026 15:17, Riana Tauro wrote:
>> Add basic support for sending page offline/decline requests to system
>> controller and use it for device memory ECC error handling.
>> Pages that belong to critical BOs cannot be handled by offlining and
>> require a SBR (Secondary Bus Reset).
>> Pages that are configured for log-only handling are not marked as bad by
>> firmware.
>>
>> For all other valid page addresses, the first occurrence of error
>> indicates a poison error and the page is offlined only by software.
>> Firmware avoids permanently marking the page as bad. The second 
>> occurrence
>> of an error indicates a Double-bit ECC error and the firmware
>> permanently marks the page as bad.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: use ret in sigid logging (Mallesh)
>>      remove additional log
>>      use xe_assert (Michal)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 118 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 ++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   3 files changed, 150 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 7a85735c57d5..94ffd0852938 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>   +#include "xe_assert.h"
>> +#include "xe_bo.h"
>>   #include "xe_configfs.h"
>>   #include "xe_debugfs.h"
>>   #include "xe_device.h"
>> @@ -16,6 +18,7 @@
>>   #include "xe_sysctrl_event_types.h"
>>   #include "xe_sysctrl_mailbox.h"
>>   #include "xe_sysctrl_mailbox_types.h"
>> +#include "xe_ttm_vram_mgr.h"
>>     #define CORE_COMPUTE_UNCORR_TYPE    GENMASK(26, 25)
>>   /*
>> @@ -201,6 +204,110 @@ static inline const char *comp_to_str(u8 
>> component)
>>       return xe_ras_components[component];
>>   }
>>   +static int send_page_offline_cmd(struct xe_device *xe, u64 
>> page_address,
>> +                 enum xe_ras_page_action action)
>> +{
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_page_offline_request request = {0};
>> +    struct xe_ras_page_offline_response response = {0};
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return 0;
>> +
>> +    xe_assert(xe, action < XE_RAS_PAGE_ACTION_MAX);
>> +
>> +    request.page_address = page_address;
>> +    request.action = action;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_PAGE_OFFLINE,
>> +                  &request, sizeof(request), &response, 
>> sizeof(response));
>> +
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_log_err(xe, SYSCTRL, ret, "failed to send page offline 
>> command\n");
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_log_err(xe, SYSCTRL, -EINVAL,
>> +               "unexpected page offline response length %zu 
>> (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = ras_status_to_errno(response.status);
>> +    if (ret) {
>> +        xe_log_err(xe, SYSCTRL, ret, "page offline command failed 
>> with status %u\n",
>> +               response.status);
>> +        return ret;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int handle_page_offline(struct xe_device *xe, u64 
>> page_address, bool send_cmd)
>> +{
>> +    enum xe_ras_page_action action;
>> +    int ret = 0;
>> +
>> +    if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>> +        xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page 
>> address: 0x%llx\n",
>> +               page_address);
>> +        return -EINVAL;
>
> IS SBR right behaviour here, if FW sends unaligned addr ?

According to spec, FW should send only 4k aligned pages. If there is 
mismatch, then it could be due
to a system controller error .  That was my thought behind sbr

>
>> +    }
>
>
> FW address format should still be validated as 4K aligned, but the 
> address handed to the current VRAM allocator path needs to be 
> normalized to PAGE_SIZE, because XE offlining is allocator-granularity 
> based(PAGE_SIZE, which can be different from 4K on some archs), not 
> 4K-granularity based.

The 4K alignment check is added because the FW spec explicitly states 
that the address will be 4K-aligned and this patch mostly deals with 
firmware interface. Regarding the normalization to PAGE_SIZE we can add 
this as initial call within xe_ttm_vram_handle_addr_fault if required. 
We can take this as a separate patch . Will reach out to you offline to 
get some more details

>
>
>> +
>> +    ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
>> +
>> +    /*
>> +     * Handle return code from address fault handling function:
>> +     *  0: Page soft offlined, decline to firmware
>> +     * -EIO: Address belongs to a critical BO/stolen area that 
>> cannot be offlined
>> +     * -EOPNOTSUPP: Address is valid and can be offlined but user 
>> policy is not to offline
>> +     * -EEXIST: Address is soft offlined but yet to be offlined by 
>> firmware for second
>> +     * occurrence
>> +     */
>> +
>> +    switch (ret) {
>> +    case 0:
>> +        action = XE_RAS_PAGE_ACTION_DECLINE;
>
> Nit: The action name XE_RAS_PAGE_ACTION_DECLINE sounds inappropriate 
> here, the action requested to FW is to remove page from queue not 
> necessarily decline the offlining, the next error on same addr will 
> show as double bit ecc and we do offlining.
> HOW about:
> XE_RAS_PAGE_ACTION_REMOVE_FROM_QUEUE

Had retained the spec enum . XE_RAS_PAGE_ACTION_REMOVE_FROM_QUEUE is 
quite verbose . How about just  XE_RAS_PAGE_ACTION_REMOVE?

>
>
> Nit: How about Loging:
> FW->KMD(BEHAVIOR), DRIVER HANDLING, KMD->FW(ACTION REQUEST)
> case 0:
> "Poison detected at physical address, page software offlined, 
> requested page removal from queue"
> case -EOPNOTSUPP:
> "Poison detected at physical address, User policy set to decline page 
> offlining, requested page removal from queue"

Sure. Will add this in new rev

>
>
>
>> +        xe_log_err(xe, DEVICE_MEMORY, ret,
>> +               "Poison detected at physical address 0x%llx, page 
>> software offlined\n",
>> +               page_address);
>> +        break;
>> +    /* User policy set to decline page offlining */
>> +    case -EOPNOTSUPP:
>> +        action = XE_RAS_PAGE_ACTION_DECLINE;
>> +        xe_log_err(xe, DEVICE_MEMORY, ret,
>> +               "User policy set to decline page offlining for 
>> physical address 0x%llx\n",
>> +               page_address);
>> +        break;
>> +    case -EIO:
>> +        xe_log_err(xe, DEVICE_MEMORY, ret,
>> +               "Physical page address belongs to critical BO: 
>> 0x%llx\n", page_address);
>> +        return ret;
>> +    case -EEXIST:
>> +        action = XE_RAS_PAGE_ACTION_OFFLINE;
>> +        xe_log_err(xe, DEVICE_MEMORY, ret,
>> +               "Double-bit ECC error detected at physical address 
>> 0x%llx, page already software offlined\n",
>> +               page_address);
>> +        break;
>> +    default:
>> +        xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address 
>> fault 0x%llx\n",
>> +               page_address);
>> +        return 0;
>
> Logically looks ok to return 0 here.
>> +    }
>> +
>> +    if (send_cmd) {
>> +        ret = send_page_offline_cmd(xe, page_address, action);
>
> Same question as above, does failure in send_page_offline_cmd should 
> lead to SBR ?

Any system controller failure can be due to a hang or error in system 
controller.
This is a standard behaviour for all errors.
We request a SBR for response mismatches or errors in system controller.

Thanks
Riana


>
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static bool ras_counter_is_valid(struct xe_device *xe, struct 
>> xe_ras_error_class *counter)
>>   {
>>       u8 severity = counter->common.severity;
>> @@ -368,11 +475,12 @@ static u8 handle_soc_internal_errors(struct 
>> xe_device *xe, struct xe_ras_error_a
>>   static u8 handle_device_memory_errors(struct xe_device *xe, struct 
>> xe_ras_error_array *arr)
>>   {
>>       struct xe_ras_memory_error *info = (void *)arr->details;
>> +    int ret;
>>         /*
>>        * For memory errors, the recovery action depends on the error 
>> category
>>        *
>> -     * TODO: Double-bit ECC errors: Page offlining
>> +     * Double-bit ECC errors: Page offlining
>>        * Poison and data parity errors: Log only
>>        * For any other memory errors, request a reset as recovery 
>> mechanism
>>        */
>> @@ -384,10 +492,10 @@ static u8 handle_device_memory_errors(struct 
>> xe_device *xe, struct xe_ras_error_
>>           xe_info(xe, "[RAS]: Data parity error detected\n");
>>           break;
>>       case XE_RAS_MEMORY_DB_ECC:
>> -        xe_info(xe, "[RAS]: Double-bit ECC error detected at sw 
>> address 0x%llx\n",
>> -            info->sw_address);
>> -        /* TODO: Add page offlining for Double-bit ECC error */
>> -        fallthrough;
>> +        ret = handle_page_offline(xe, info->sw_address, true);
>> +        if (ret)
>> +            return XE_RAS_RECOVERY_ACTION_RESET;
>> +        break;
>>       default:
>>           return XE_RAS_RECOVERY_ACTION_RESET;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index fe6f3658a2a4..20c74593ce05 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -17,6 +17,19 @@
>>   #define XE_RAS_MEMORY_POISON            BIT(2)
>>   #define XE_RAS_MEMORY_DATA_PARITY        BIT(5)
>>   +/**
>> + * enum xe_ras_page_action - Page offline actions for page offline 
>> request
>> + *
>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page 
>> from queue
>> + * @XE_RAS_PAGE_ACTION_MAX: Max value
>> + */
>> +enum xe_ras_page_action {
>> +    XE_RAS_PAGE_ACTION_OFFLINE,
>> +    XE_RAS_PAGE_ACTION_DECLINE,
>> +    XE_RAS_PAGE_ACTION_MAX
>> +};
>> +
>>   /**
>>    * enum xe_ras_recovery_action - RAS recovery actions
>>    *
>> @@ -295,6 +308,28 @@ struct xe_ras_memory_error {
>>       u32 reserved2[10];
>>   } __packed;
>>   +/**
>> + * struct xe_ras_page_offline_request - Request for page offline 
>> command
>> + */
>> +struct xe_ras_page_offline_request {
>> +    /** @page_address: Page address (4KB aligned) */
>> +    u64 page_address;
>> +    /** @action: Action to be performed, see &enum 
>> xe_ras_page_action */
>> +    u32 action;
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_response - Response from page offline 
>> command
>> + */
>> +struct xe_ras_page_offline_response {
>> +    /** @status: Status of the page offline request */
>> +    u32 status;
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved;
>> +} __packed;
>> +
>>   /**
>>    * struct xe_ras_get_health_request - Request structure for 
>> obtaining gpu health
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 66e7cbcc3f91..590dd408399c 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -28,6 +28,7 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_GET_THRESHOLD: Retrieve error threshold
>>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to 
>> offline/decline a page
>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>    */
>> @@ -38,6 +39,7 @@ enum xe_sysctrl_gfsp_cmd {
>>       XE_SYSCTRL_CMD_GET_THRESHOLD        = 0x05,
>>       XE_SYSCTRL_CMD_SET_THRESHOLD        = 0x06,
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>> +    XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>>       XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>       XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>   };
>
