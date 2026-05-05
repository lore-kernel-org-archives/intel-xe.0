Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3701EFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 05:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C269210E0A0;
	Tue,  5 May 2026 05:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OexYKrK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5CA10E0A0
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 05:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777957448; x=1809493448;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9P+vacGVUIwuyNTmXg1pHeWn5bavmO7Pt/qjqdRS2+s=;
 b=OexYKrK+0iTZ9OCi1fALaA6HmiyhINoW30+SHQAUC6M63hOEyKJTTJqU
 zatcjUgsommMAxbGFzVooQhqnIeuh+Vw3C9kAEuBNr+6EAb8s3Izd66TS
 C7K+b92a2BWxSzAOAmjaJy4VROylKSV8GHvdL3ASDADU3h3DlnpWX+uRJ
 7l9/7NE9+K+jqPf77zqmVUOYFVjWo6LCtt3i4W43BffY3AYlRgTIiwZax
 /af8xoscbg6t3izPLurECFEhf+pIFM99gYIksDP8f4aoLnWbe/3UMSvuJ
 QMmKPa/0dPzpSvt8XHW5jxixZMj3oO1HTPlPP5iFmDO6ps25rHq1ZVDMk A==;
X-CSE-ConnectionGUID: +YjmxD9AQ0CMlPojySvPZQ==
X-CSE-MsgGUID: geXdnRWPScWOTWwhRepuAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78919857"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="78919857"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:04:08 -0700
X-CSE-ConnectionGUID: LWjGDKyNTUiyzPBHfaQr1w==
X-CSE-MsgGUID: qt7hAMmeTTqBQ9rUPfxLtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="259374999"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:04:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:04:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 22:04:07 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:04:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bn9x8GB5awIhwuNQs8FZ5Nix+fhG4VfADEgYfA3uig7ERB+PXp1uHGHrnDfcwud/jfC4rKYg+rDBprbAM3bCQTYOzVNSuLag8vNyQkdrPUMfSo++N45umQ2gvhf4AbL68V3E107414Ied9NtDBLkLJ3uZ2UydmQUxeXh9Plo9wOYx2UuWVLlWL02/WFny5dhD4qYYe/4NIXeiSPG98+cyepNWITW96GxvZxWhooF4I/l1wd/caBzN72IS8PDi6hPIlHvzonYZ1dWt8vrVUQp3fzrvzB8/X6G+dTbcbrdJvLTwjXNyO/Y/8FFqbtbCjqLTlpAMzArR9OPhcVADcJtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBiBxEbctTBLgU07dOkU7BDlDZC9oBELlwNQsowqfAg=;
 b=WK32kLdHuJ5hKnx7gdYilCVHiaP9F1NxiJf+B57axIpJX1m1h24fjconMExj0ORtrHcHimSPplDMNoMx2QACeIQXVPgrkbObNTgaF66QyBOj3X2OCEiCF0Yp8niCvWmuBi3oT79I4kp08pPvbED0FWaF7gCPdZyPz6J/MTU12mAVt8NlmmMJlLRpTDyikoLTAId0qFZaX0AV4mTrckk5eH48vC8xq9dEvscFp5S3A0ilR1zD/oUl2H3nXwNAUuVxMt4nBeSdFxVWiGfkqCJ2rTWZ3Bj+XRIn3WawH579kakW1RCsiZTksDK8XvvUO2uNiltNqtHdns6xgQk2wS3t0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:04:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:04:03 +0000
Message-ID: <5112d3df-0c6f-40a2-a474-bdb893c0a067@intel.com>
Date: Tue, 5 May 2026 10:33:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] drm/xe/xe_ras: Handle uncorrectable device
 memory errors
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-24-riana.tauro@intel.com>
 <SN6PR11MB3232AC3177251C7384108B53812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <SN6PR11MB3232AC3177251C7384108B53812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: f9449ef2-4dff-4641-151a-08deaa63ba0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: aJb7YYIhqrkrOyvXzYno6MuiSzd5bhisO96k+bb0iLtUKOy1/4vsDso6XXb3QoKGpxbohHo0MjwTxNohTqAum7FEjMuhYH+iInP2zhZg3VEy+4bwRUyCsAhfHwnC/A4/kgWaRaa758b2QFY1/kcr2xCSK+26afJOkp8mDefluewQMb0CPW75mky2Itpoay7kCM22+To/yVnocIzFa7Jubv6Gh26zj2vAEhDiwGdVYyQDbM1OT0e7zdYKSqASIDJA1oNab3sPTJv93zHNjWc6yRlAj+LlAGp2ZNmr7ET5QpW0e5s50cPjILAbjLlINU7I8TjHy0Lu5ZzXtItrHx9tKxDiEqXXHslrtO6jLinZpWTKZaaFTv74vvp4/emr0+slf+FoyddaQJVZvenVdS6kTlrFHlsj9rGVM3DwKj/l+2uFJo0i/BILNoDlRCsofk/8y2fDZE8VTOrerhm61ULlYuZFpGvXsyPLkN0/qVV0lvvm6iIpniSh71At78ZqPYdhZ36x8QUtLrkwifMSJqd+pUyb2wJhqW8IToZPvkLeFL4izp4jwjd5tRY32+FZQz8oLPCJWxLsFjC7EpBqvAr0h4UoRbmbKmjBJcIZLxkT7Xh2KkiyBls5JU+hi6MUygmUALy8qwnIKwBGaVOQfeg5Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1dPS29EWVdZQTVjYVh3RW1ZNTRNcU5sODNySVNtb1kwOFJDRS8veDR1dEd0?=
 =?utf-8?B?amozK0VaRVpIL2NQVnhIRkVjcEQzSW1EaUZOUlUzbmRHRmZXMGluWjUydld2?=
 =?utf-8?B?YmdTTDRrT0dSZUg1elRKRkhLZEFPZW1TSCtISjBxSmt2aFo1UDY3ZkttZllE?=
 =?utf-8?B?N0dnOU56QTRSeFJQNXBURzMzMThhSkhtTU5SWFRmRE5vd3ZSNy8vUmYzMHYw?=
 =?utf-8?B?dlk2UmsvUkQ0ZFpKRXFWK2FjTHluV3pRUDhyaDNSclljWUYzVDhHNmZ1QlNR?=
 =?utf-8?B?WHpLVDdGeWYzZm5NSGR5WkFONXdFUEJoZVkzRzJ1Q25ocWR4MFRaVHQ1a1Zl?=
 =?utf-8?B?Sk5sY3g5UWp2OVd3Mkt3NU5nSVFIMTlCTVRWYWE2VUF6UUZXVmVSek1RbGpG?=
 =?utf-8?B?VTUxUThWbVc5WnR0Y3AxYjAzVWxvc1hSQ29KVDUzeE1PemNodnFYUVU5VmF2?=
 =?utf-8?B?Y3o1a0J0TENJZjFWUEpYeENyeENLZEhRMGZwNlkwME5pZTVQei9jY0Q1OXpI?=
 =?utf-8?B?UE44MEJUZ2loQjJRdU8rM2RhLzI2MzFoN0pQM3FsMEJFczNPR05MVVlrdkpu?=
 =?utf-8?B?TTVOdHdPYjJpc0xPazYyOEhORkZGeVUrdHMyOFlUTFg3eklzRndoVlZ1UE5q?=
 =?utf-8?B?NmR6cSs4ejlvcEp6L0ErTnltS0RJY2RKa21EYTRSYWN0Z2ZueERVZzFzc1N6?=
 =?utf-8?B?ckF0SnBIbGJWRXdmdVFUS1QwTTBQUkNQcTlpaWRMUGtwTjNndlgvUGNSSE1H?=
 =?utf-8?B?QUQvQW1rWEpwdk90MTRETEhYVkErK3dVdkZCczVJWDhkczRXSUE3eEFGZlM1?=
 =?utf-8?B?YmtpL2NjTGwwemk3cWRpbElUVUhIeUQ3K3MwdGkxVW5iVjQxK2EwZ2FPY1pQ?=
 =?utf-8?B?SERnNUFiSzlqYlF4dGlBUVNhcjdQREswcW1LN0czZzlvSDJZR2lweWZ0cUJH?=
 =?utf-8?B?ZGdJaUlJdE9IOGVTS0h3STJ0TERmd1FuODNFc2wrdjlNYTR0bFhHWDgrMXhq?=
 =?utf-8?B?NUxNUE9pdCtLQzJVaU93UlEvTHh1bEVGZ2c1RFlNM0tMY2VSalpHc2VwWm01?=
 =?utf-8?B?TGpReVp6TW5wNnFjL0s3NGtRQ0pqTlBKeGRlZlNDeGRVMzNvSmNRTVV1SjVC?=
 =?utf-8?B?L3BHQ3JYK3B2dlF4b3hCa0p3MTB3SnlmQ09zMXhObzZUUkhrcWVDQzZXMjNZ?=
 =?utf-8?B?bXdhdUxVeCs5bjBKMzRjM084cnhwNU1GMjdtaEZCTFE4VXM1WHhaRmtRVnRP?=
 =?utf-8?B?OGF2NXpWK20xRWVBbDB3U0dRSWFIQTdURUU1UEwyMVpZdWRmTW5nbGxYTWgv?=
 =?utf-8?B?SkYyVm5SNElYUG5rOEoxcVdnRVd6VkVFZ2VGNU1OZ0QxS2NqOWZHU0RBdWZ5?=
 =?utf-8?B?UTBpVDJ1a3gxMC9ndXlBVFdueGVlZTNUZWphRjZyNXBqKzR4Lzk2VHpCQmgv?=
 =?utf-8?B?RVFPWm84NktXN28wVEx3bkZ5VklwcnpYSHVKb3E1NlZjSmtGa3krSkNYOWJk?=
 =?utf-8?B?KzdVUml3aGRyM0dvY2tsbTZXcTdXSGp1dDJjRGVzRHkvUDM0S0U2NkJydzJZ?=
 =?utf-8?B?a3NsUVZHaFFTSGozaXlnVTVnQzZpOS9ZQ1gzWmVid3B3MU83V0dJVXpsNnRq?=
 =?utf-8?B?QXd6NDFJZ21VMHcwUTRFUzV6N3VSK2VsRExnVGlvUmIrUlVURm00amFqVVU2?=
 =?utf-8?B?VUtTdm5abDdhVzBvMTVoaThaTklzR1cvY3Zic3lTL0lIV1ZwVy9lOHlFcS9r?=
 =?utf-8?B?c0RUVGJFZlVQVjA0b2VnNThLT2hObXAyOUNjc29vdy81Z3hXYVhSbW9wVXpn?=
 =?utf-8?B?Q2tHWlFKTFBkSkQ0UXcrdGwyK1FRMjFHaE5JMjl0aVpQZXQybmw5MlhFdEZ0?=
 =?utf-8?B?Q1J3VkNxRFBBdGdVaktjdEg3RWlLSHRQQlNXR2g2aXJUemhaaVlvRFlTQ1FX?=
 =?utf-8?B?cHhZWXd0R2hyUlZLUEszTTZEUVRJNmZCcTRpN3luMzR3c0pVcVEzdU1lVmFh?=
 =?utf-8?B?MmluQVpYMkVIR0JEcHpqakhEeUc1YWpEdU0yODJ6S29IMkFsVkkrQUcremdk?=
 =?utf-8?B?eHNTWDI5QStwb20zWEtDUzNwOUNXNzFKVVlvWGVtckNxWDdESE5vazE4UzI2?=
 =?utf-8?B?bFErd0dvYmxxWFIyU21pOTgzNjAvOVdmak1UbFRVblJiTzhiMkRYYzlxOTg5?=
 =?utf-8?B?VDhxVkxzdXAwYjRwcGhqZ0J2dURZVWV1cXVUWDJnbTlnTEExZWtUNlJuT0dy?=
 =?utf-8?B?MTNoTDBJQUE0c2xZVU5IYkh3WmMrMi9CdGIrY2xSQjVCMDJibEhVL0ZEdUdI?=
 =?utf-8?B?RENlTk4zbVNsOEs2UmNOYXdGbHhqUkdoMU9STGxadHU1c1BuZDNVUT09?=
X-Exchange-RoutingPolicyChecked: N+F6uBy7BU0dVPANenivwskGhlblYZqct02X2YjVUCDNb7BnsIkcZ6TmW1gMt5NvPWzzJK7bTASUW3Z2rvq27H2rqZL0Ymrh11FR/OrIKNY42DPsU3vxqSwBMfRDaCuIveTnIdaZK0R9oX4xcmXecFmk7FVqjk3l5y4ogFgHp/NsN5LsH4LxD6Jv5XDfECO3Xd5FZNjTly7but/FgRI7Fcbr65z6Pu6Vz2rJVTrdYhiuTQICRYQ6Q/6c7VaOm7Q+EBJQfwcOw9b8kU9fzK6jJnkSXGVcGEBRohM0YXDbh70RJ6Mz4F5S+w0kJdOGpUvejZyP/0BapRKuiUo5rPC2GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9449ef2-4dff-4641-151a-08deaa63ba0c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:04:03.7584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQD7bthl6VpgG61AcZ+QRG0pZtvcGGw5SEqr+5NpuwHgcjhG4CV5etsQsNFkaw1Yl1HaBUQ1Wix+Y5rDA7z99A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
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


On 4/21/2026 11:38 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 17 April 2026 14:28
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: [PATCH v4 09/13] drm/xe/xe_ras: Handle uncorrectable device
>> memory errors
>>
>> Add support to handle uncorrectable device memory errors. Double bit ECC
>> (Error Correcting Code) errors are logged. These will be handled using Page
>> offlining in a later patch. The other memory error categories require a
>> Secondary bus reset (SBR) to recover.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> Memory offlining patch will be integrated once
>> https://patchwork.freedesktop.org/series/161473/ is merged.
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 23 ++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h | 61
>> +++++++++++++++++++++++++++++++
>>   2 files changed, 84 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> 5010cf6211ea..347844b3d2bf 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -138,6 +138,26 @@ static enum xe_ras_recovery_action
>> handle_soc_internal_errors(struct xe_device *
>>   	return XE_RAS_RECOVERY_ACTION_RESET;
>>   }
>>
>> +static enum xe_ras_recovery_action handle_memory_errors(struct xe_device
>> *xe,
>> +							struct
>> xe_ras_error_array *arr)
>> +{
>> +	struct xe_ras_memory_error *error_info = (struct
>> xe_ras_memory_error *)arr->error_details;
>> +	struct xe_ras_error_category category = error_info->category;
>> +	struct xe_ras_error_common common = arr->error_class.common;
>> +
>> +	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe,
>> common.severity),
>> +	       comp_to_str(xe, common.component));
> don't need \n?
Missed it. Will fix in next rev
>
>> +
>> +	if (category.ecc_error) {
>> +		xe_err(xe, "[RAS]: Double bit ECC error detected at sw address
>> 0x%llx\n",
>> +		       (unsigned long long)error_info->sw_address);
>> +		/* TODO: page offline handling for 2-bit ECC errors and return
>> accordingly */
>> +	}
>> +
>> +	/* Request a RESET for other device memory error categories */
>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>> +}
>> +
>>   static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command
>> *command,
>>   				    u32 cmd_mask, void *request, size_t
>> request_len,
>>   				    void *response, size_t response_len) @@ -
>> 217,6 +237,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct
>> xe_device *xe)
>>   			case XE_RAS_COMPONENT_SOC_INTERNAL:
>>   				action = handle_soc_internal_errors(xe, &arr);
>>   				break;
>> +			case XE_RAS_COMPONENT_DEVICE_MEMORY:
>> +				action = handle_memory_errors(xe, &arr);
>> +				break;
>>   			default:
>>   				xe_err(xe, "[RAS]: Unknown error component
>> %u\n", component);
>>   				action = XE_RAS_RECOVERY_ACTION_RESET;
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 4f640124f38f..020e3f92a057 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -199,4 +199,65 @@ struct xe_ras_ieh_error {
>>   	/** @additional_info: Additional information */
>>   	u32 additional_info[10];
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_hardware_address - Device memory hardware address
>> +details
>> + *
>> + * Hardware physical address structure for device memory error reporting.
>> + */
>> +struct xe_ras_hardware_address {
>> +	/** @column: Column address */
>> +	u64 column:6;
>> +	/** @bank: Bank */
>> +	u64 bank:2;
>> +	/** @bank_group: Bank group */
>> +	u64 bank_group:2;
>> +	/** @row: Row address */
>> +	u64 row:16;
>> +	/** @channel: Memory Channel */
>> +	u64 channel:8;
>> +	/** @msu: MSU index */
>> +	u64 msu:8;
>> +	/** @reserved: Reserved for future use */
>> +	u64 reserved:22;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_category - Device memory error category details
>> +*/ struct xe_ras_error_category {
>> +	/** @pma_error: PMA (Power Management Agent) error */
>> +	u8 pma_error:1;
>> +	/** @ecc_error: Double bit ECC error */
>> +	u8 ecc_error:1;
>> +	/** @poison_detected: Write poison detected */
>> +	u8 poison_detected:1;
>> +	/** @parity_error: Parity error */
>> +	u8 parity_error:1;
>> +	/** @phy_error: PHY error */
>> +	u8 phy_error:1;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved:3;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_memory_error - Device memory error details
>> + *
>> + * This structure provides detailed information about a device memory error.
>> + * Cast from error_details array for device memory errors.
>> + */
>> +struct xe_ras_memory_error {
>> +	/** @category: Device memory error category */
>> +	struct xe_ras_error_category category;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[7];
>> +	/** @hw_address: Memory hardware physical address */
>> +	struct xe_ras_hardware_address hw_address;
>> +	/** @sw_address: Software address where error occurred */
> Introduced but not used, can be moved to next patch?

We have a error log that prints this in this patch

Thanks
Riana

>
> Tejas
>> +	u64 sw_address;
>> +	/** @log_array: Error syndromes associated with the error */
>> +	u32 log_array[8];
>> +	/** @reserved2: Reserved for future use */
>> +	u32 reserved2[2];
>> +} __packed;
>>   #endif
>> --
>> 2.47.1
