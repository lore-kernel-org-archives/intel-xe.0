Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1FAC61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 10:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A2510FA91;
	Fri,  4 Sep 2026 10:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdXKKr01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821F910FAA1
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788518974; x=1820054974;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bxecJl1hK6GgHwwANXGty0/TVzFjHkoFMDQYhWZ8P10=;
 b=FdXKKr01WjWXhedpud0P19qO4YKDwy/ZYBMl/f/mDKCHjl4QRP53DzkG
 7zfTJSaZDHGcjHMEvvHF2NdtdJr6eh5CwOADVIoxoRTosqphQev59dYrl
 9xTt9yDsgnlEsQwfkdyz1YPrbncQ7KIV8Wa2Wi+t8yjHf44BvXOe4/Rt5
 kIdlXQ1mSSE0zfk9Umzcz3TRV9MlXURuKCK9RXgQuzXLq4Ak5oDpuCgjz
 rr4H6e1H2lDRmg5n9Axt38ODRWlX8XI+Y760bANi1GTcaB1oixdsux0mw
 13wZAWhtUJYSmteutGmwDTJN1qQUQnQMzlQc8EJ9mzR6hz/BWOJzX7NRc w==;
X-CSE-ConnectionGUID: gBxMwTQHSriJCXJ7X+zjUQ==
X-CSE-MsgGUID: halGP/tbSpyELZZdT7nuJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76573527"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76573527"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 03:49:33 -0700
X-CSE-ConnectionGUID: NW1ZG3c/QWm30VOtWdZjDA==
X-CSE-MsgGUID: iGTqOcEAQ6WTDCd8xjyLZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="308223104"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 03:49:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 03:49:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 03:49:32 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 03:49:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWUNwvWnQekSqf52hF/7qs1hdFo998ndKNPRpX4H2qZRmQzbg7S3pudXgu1NR9EebiHoQUTHVFS9Mad2O3rL8VUR4JTdHg1Migiit0pdIpUN1R2h/6gQA15+v6+uSo4J1v6eFb8D6Y3tlZkSdnjvJT+zoQIC/aQ8ZZgYiRPrtv5M//HZKQnWRca0stKByM3ssXwDeRuU5kNDWQYDSFKnXuVIwQRAO8mCJYm/QRQv1WCBKQ3hvOPstvTm5tZfY4baXxpGvKNzkZmV9MYOzNzxy9wQ8vqB2ci4YHYnhj4iire/6H0ssZpGWYcYbTlPwNRTYRUBiJiI3AOZIjxdxMBybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dzcbm7wpLP5lf2NPsKWZXvij9L6yTIvE+llMO5kt70=;
 b=AAQKMh/Kp9GsjM9CC85x7gPviHWVPjt9Frmvr6c9ns64UGn0TlT8pDZ7vVocV1TslRS0VfnEo4aGg1j9tdyfrSU3lJrdQWhqEHAX9KRMvAggVtdmRkl2Ev84smwWd9GQMWpms+FAsVIdKraP9rXnZL8oEqLujIkYohb8BIRS2MGnau8fxupaR4zFsHtNOCpdFfHtBvJHAEDRfSyuYYk5jnxSuNFfzPKDal+h+Lz8qkFlbCIOdxOf1PkhJzhtqxPPqZkHvseWm4qz5T0BHy0uP3PS0llsOI0pXMzKgtWM2KhVEsynQ4yczmeAeRknd2LPr+X6s4NgpqZ7x6ZInXJPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS3PR11MB9621.namprd11.prod.outlook.com (2603:10b6:8:38f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 10:49:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 10:49:25 +0000
Message-ID: <e995702b-794d-4b02-b84c-dbe9952d80d9@intel.com>
Date: Fri, 4 Sep 2026 16:19:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <tejas.upadhyay@intel.com>,
 <himal.prasad.ghimiray@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-10-riana.tauro@intel.com>
 <39420eb0-d81b-441e-84db-d832d796e18c@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <39420eb0-d81b-441e-84db-d832d796e18c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS3PR11MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: f7fb8b14-add6-40c3-907c-08df0a722f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: kGHLkqlwjqpOC5IW7LUP9siNl/MxmUtBDyC0HVMeAxbx1R1fFS8jM6BRIoLSogt5TB4tR7PmgvZqe+69N5+umE3rQVjfW6YCioKbkcSKP1GtvIWrmRc/rULXzSGTft/28Mdrm9/W4zAXXZchmpQbEYzJw+zsRLwKofCHibwGX2VSHk+lTAEbj/zqJkoAHtktFAJBfrXtzisLLEoG++0qHQm0skNSiMQKyIIlKJWwnjvLC+4yJidWqoAJ0MEh2OS+HpBn+3Oj7sTa1aK5RCiDyNUZg1Wg1+TXDsoTFES442t6yRYTAtim8l/adbVXE1ncRMJby6RhQiVWvF1hc7Gj+0lJp2DZrQ7hbi628Pfey//dIHGngyuFJN76aWfvKMnprwLTDFJd6FX3ehMKDkYIeiImfkU2sYuxAplCQvu3MTss1HNzHcgfkzTEgVpXQSAom7t3DV0WGNpskdS+RjITsLFVPkO8/PFJ1GwfWi3lF587f9zZHRYdcmel/+0P5MlMP1M48P9Bhf9rvZS+0T7WpjRj5Us1tpFr527nL9MhLVIDMGw8GAV69TYTmcjIsAhrjmpA1yTIjjS9pjwCdZGE7wstB47snLI0E9X1Q5PJDiN8knvg1bcNcl8F87OtgMfa7juKq7JRSGm6f3QjF3fI034yCZ08Mdy5mZzSg94rqd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T29NNnZBMzRRVHVyTUJBU2tUeGFyTTI1N0hVbWJWTGRiaU8zZlJVUSs3R2l4?=
 =?utf-8?B?VUhwVFB6VGREMjlGTWhaNGlWOU94S25rNDkvZ0Jhb2V2WDRyYWErV29tM3dq?=
 =?utf-8?B?cW1pNEpGNHc1R0hIeDZ1aHR3b2lnUWpvVG5vN0JtbVVLMTNvVjhkU29SUlh1?=
 =?utf-8?B?T2tuc1YxbTkrTlBEVGh4eEdmVmh4Rk1MQmlXeVZXQkhOMkRzZXFUaS9heTIz?=
 =?utf-8?B?NmhRRkFwMFBZV082cDJMREVtMW5YRS9Rakd2SXhoM3k3RXA5WUt3VUpjVm8y?=
 =?utf-8?B?Wlp1OG5kNXVaUkw4R1RJcFV5ZEhrby9oS3p4MkRGTnhPSVUvVUc3YTM2MzZr?=
 =?utf-8?B?UnRzRzUyNnVDZHNwU1hEUXdiRmh1NFBTa01XUUsxNEZtVnlaNDRZV2gybXY0?=
 =?utf-8?B?cFFIRW03eStQOVZnQk1zNUNpRVhybU5kNkdUMlBkcTdrZUJ2WW5iUmpGbEFQ?=
 =?utf-8?B?R3NJK0NkT2QyKy9Ub0pqSTdUQ3NQZnMxQVVQS3BqeGNQeGdJNTV5TUcvUzdW?=
 =?utf-8?B?K0JlS0p4d010bXZYMWRveGFiMlZTZEVrWVVMQ0J0WnBxUUtscFVrcG5OVVhB?=
 =?utf-8?B?U3lNdGEwNkhHU25QemJXYmZkZkw0ckVqWGU0dFhoT2pqS3hhRFJJc2ltWmtx?=
 =?utf-8?B?T05WaWVSOVZDN256NkZxMkJYbDM4QUo3M1pzMlpDVThxQVp6Si9UbWFVcm10?=
 =?utf-8?B?NVhnV1I0RndhYjNrWDRtZ20yQi8rczlXMXB3YjlaVXh1d1NybWM3b1VvUlVY?=
 =?utf-8?B?RHhyaGx0S2VRWGpucXF2ZHM5OE1rNlNkQUczTFNaMHJiV1ZqUjA3MDJOb055?=
 =?utf-8?B?cG5ZaHJ0Snh6RFpJOFl1TGo4ZkZZWm0xMW1uMFhQOGlDV1FldzI4allTMWpD?=
 =?utf-8?B?VCs0WjdQb2hXdi96cHNFb21iNnRIblpzdjdjby8vQm03Zit4RDM3ZlhXM29M?=
 =?utf-8?B?OGkzaDJ5a0JlUGZsZUh3ZzltdUMvcWRQVWVUVGg5MVlPb1RsUEtaZVBhY1c4?=
 =?utf-8?B?OHFFcWtNOWFSZDdHMlpHUENrbHlqQmFvTWFNSFhUQ0o2MlBqK1pEM3RiNG1L?=
 =?utf-8?B?bFlibjZuRzRKb2VtVTdKSGZjTzdFRGhaeWRwZkxVWm45NkUrWDFYWFp5VlZn?=
 =?utf-8?B?c2Q4RTFvdVYzZm5HeWEvNG5DbUFDQldlTnNhVS9KVkxOajJadVMvc0FkWTh0?=
 =?utf-8?B?Z3dYTjdxY1ZOWVlLM3VlNnJKcE04TWgzLzQrRUd3TVZ4cEIxZGs1MU5FVzhq?=
 =?utf-8?B?eGZaeHIzZTdXZnBwN3ZkZ2xDWmFPUGRubG10SmtBNU81NWdJMnJFQmlxR3da?=
 =?utf-8?B?d1djZzRHb3kvVXc1Z0p5N0Y1VlllR1F3YW55S1BCY3h3Tit1MkNNd2gxRWY1?=
 =?utf-8?B?ZFhPV3FKZUJaRHlLOW5RMmVUbmM4RWNxZUZ2MUNwSFgyNTVJbzNFMmQ1VjlN?=
 =?utf-8?B?aUNWSHhHcXZmL3pFeE1tYXMrZHZUMVdmdmZwVGdoalI3THpuVVBEY0YzbmND?=
 =?utf-8?B?U210ZGljcWdSZHV3bHlKb1BmRTJkb0dXTzludjJZVXdlSlVjSkZnV09ON1Ey?=
 =?utf-8?B?VWs0M1ZkTDk5NWUxQUg4TFRyVlg2SjNDTEZRUnZ0RlpTSlVDcEpEZ2x0U3lG?=
 =?utf-8?B?WWhvSlpvS2pvamdQcjVpbTZwMUxjcnRDZFI1MGtXSnNjaENuRWZKR0daZVA0?=
 =?utf-8?B?ci82SkYwRC93ZXhPUTFqQVFnSHNYVDZ2Sm9zRXIxQkFmSm14YW8wTWppZFA4?=
 =?utf-8?B?UnJGN0QyZldxZkVGT3hxU0piRmtVVi9aaEUzbUthRE4wWFRsU1UzK3FOUDBE?=
 =?utf-8?B?R2N6MTNJeFdsRlFveGpaQ3Y2VzM1N2cwWXhTWTZkbUwrdUhtWXVaMXdQUkJR?=
 =?utf-8?B?amJsb24zZkhYRkxQK25oOTQ1aUhJWWEyZlBQUzdGMkZjY1VGZytSSlkzZHRC?=
 =?utf-8?B?bHpZWEt4elo1YW1weTFTU0dRMkpySUs2dWx3WnNUcVJTaytWL3kzaTZ5eFpV?=
 =?utf-8?B?b1JkSnFVNCtiMFVmWkRTNUgwZ09PbExPL2ZNOEt6V1FndFcrZ0txZ1NDVlh4?=
 =?utf-8?B?c0tpM20rM3l1Yll3clVOS2ZFVmt0Lzk0a1pLdEhzYndmTG03U3Y3bDBUZzhX?=
 =?utf-8?B?VHBSTlJySlh6bDV0Q3pJL3FMNGRlM09EUzc0dFg2VGc0U2FZd3VNZVY1WTlr?=
 =?utf-8?B?K09KZGVoZG5mNmN5UzNQN0xBNFNzK21TdmNUQ2NKYkdhYkZaVHR5b295NlZs?=
 =?utf-8?B?M3liT3dtUFZFaHVZYU4wZVNPTU5qZ0VDMXZ4STFZN2lkVHgzVENPcXdpMzgz?=
 =?utf-8?B?eUwxbmlnbWZCS3k2VDBoaFV3T05pdUFxb2tFZEhzMnV1blFPNDMvUT09?=
X-Exchange-RoutingPolicyChecked: wFn+JfjJFzRtyK49xYyUzsWoslxZhNHxtOj3fNcFVlyUYBhqARtsmD3Xay3hcU5TcJprg86wbzRhqbmfrlbeL2cG+XLSWXED7ZJ/EEyoxOlynKbC46bIrig3pgZY8nAJi4VtkRcoup8+kS6YR8K41tQmCnwaD8ji3cS3YGyxVBbe2yVP8aiuTY/HvF6Xusut8zjwrj1nstsSkIdPYYlQs0icTDTGDtOCnirBoIzSXbljYxNkfQufDmjSCAaAMAvEpEMgKAJgWeR+c4yzXKJL7e5vpLQWmWdNovnCyTXtssjuE88ksIg+Oz1Cjgw2mIg/VrJiLIEmg+4e5EdieBGnpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fb8b14-add6-40c3-907c-08df0a722f81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:49:25.0870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sMoG/s9yyLfLfDfLFTYYboOR3HELTmYJZfgUvcm5lYGKmW+iqPgN1l5B8CC61atX+plfU0Swaxly3IjTR8I4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9621
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


On 02-09-2026 15:26, Mallesh, Koujalagi wrote:
>
>
> On 25-08-2026 12:06 pm, Riana Tauro wrote:
>> Add support to query page offline list and queue from firmware
>> during module load. The page offline list command retrieves pages that
>> are already offlined by the firmware. The page offline queue command
>> retrieves the pages pending to be offlined by the firmware.
>>
>> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 99 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 43 ++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>>   3 files changed, 146 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index c643c7137a42..441462a36dbc 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -328,6 +328,102 @@ static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class
>>   	return true;
>>   }
>>   
>> +static void get_queued_pages(struct xe_device *xe)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_queue response = {0};
>> +	u32 count = 0;
>> +	size_t rlen;
>> +	int ret, i;
>> +
>> +	/* Supported only on platforms with system controller */
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> +				  XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
>> +				  sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_log_err_fatal(xe, SYSCTRL, ret, "failed to get page offline queue\n");
>> +			return;
>> +		}
>> +		if (rlen != sizeof(response)) {
>> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> may be use errno -EPROTO?

This is consistent with the rest of the code in the file

>> +				   "unexpected page offline queue response length %zu (expected %zu)\n",
>> +				   rlen, sizeof(response));
>> +			return;
>> +		}
>> +
>> +		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
>> +			handle_page_offline(xe, response.page_addresses[i], true);
> Silently dropping errors from handle_page_offline (). Should handle 
> errors.


The only errors are critical bo's which won't be possible at boot and 
system controller failure.
System controller failure could be due to multiple reasons and it was 
decided that driver need not wedge for this on boot.
Any missed memory error will be reported again as AER

Logging is already present.

>
>> +
>> +		count += response.pages_returned;
>> +		if (!response.pages_returned)
>> +			break;
>> +
> To avoid infinite loop due to bad firmware use flood limit right?

We do have the below

>> +		if (count > response.total_pages) {
>> +			xe_log_err(xe, SYSCTRL, -EINVAL,
>> +				   "Pages returned from queue exceed total pages %u, returned %u\n",
>> +				   response.total_pages, count);
>> +			return;
>> +		}
>> +	} while (response.additional_data);
>> +}
>> +
>> +static void get_offlined_list(struct xe_device *xe)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_offline_list_response response = {0};
>> +	struct xe_ras_offline_list_request request = {0};
>> +	u32 count = 0;
>> +	size_t rlen;
>> +	int ret, i;
>> +
>> +	/* Supported only on platforms with system controller */
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
>> +				  &request, sizeof(request), &response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +		request.index = count;
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_log_err_fatal(xe, SYSCTRL, ret, "failed to get page offline list\n");
>> +			return;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> may be use errno -EPROTO?

as above

>> +				   "unexpected page offline list response length %zu (expected %zu)\n",
>> +				   rlen, sizeof(response));
>> +			return;
>> +		}
>> +
>> +		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
>> +			handle_page_offline(xe, response.page_addresses[i], false);
>> +
> Silently dropping errors, need to handle?
>

Same as above

Thanks
Riana


>> +		count += response.pages_returned;
>> +		if (!response.pages_returned)
>> +			break;
>> +
> To avoid infinite loop due to bad firmware use flood limit right?
>> +		if (count > response.total_pages) {
>> +			xe_log_err(xe, SYSCTRL, -EINVAL,
>> +				   "Pages returned from list exceed total pages %u, returned %u\n",
>> +				   response.total_pages, count);
>> +			return;
>> +		}
>> +	} while (response.additional_data);
>> +}
>> +
>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>>   {
>>   	struct pci_dev *vsp;
>> @@ -923,6 +1019,9 @@ void xe_ras_init(struct xe_device *xe)
>>   	if (IS_ENABLED(CONFIG_PCIEAER))
>>   		ras_usp_aer_init(xe);
>>   
>> +	get_queued_pages(xe);
> Better to handle errors rigtht?
>> +	get_offlined_list(xe);
> ditto
>> +
>>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>   	if (ret)
>>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 2fac968879b6..cddcfa656d9f 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,7 @@
>>   
>>   #define XE_RAS_NUM_COUNTERS			16
>>   #define XE_RAS_NUM_ERROR_ARR			3
>> +#define XE_RAS_NUM_PAGES			25
>>   /* Error bits in IEH global error status register */
>>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>>   /* Device memory error categories */
>> @@ -280,6 +281,48 @@ struct xe_ras_page_offline_response {
>>   	u32 reserved;
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_offline_list_request - Request for get offline list command
>> + */
>> +struct xe_ras_offline_list_request {
>> +	/** @index: Zero-based index into the offline page list */
>> +	u32 index;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_offline_list_response - Response from get offline list command
>> + */
>> +struct xe_ras_offline_list_response {
>> +	/** @max_entries: Total no of pages that can be stored in flash */
>> +	u32 max_entries;
>> +	/** @total_pages: Total number of permanently offlined pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of permanently offlined page addresses (4KB aligned) */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_queue - Response from get offline queue command
>> + */
>> +struct xe_ras_page_offline_queue {
>> +	/** @total_pages: Total number of queued pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of page addresses (4KB aligned) */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>> +
>>   /**
>>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 3363f48da2b7..194ad3ac3da2 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -27,6 +27,8 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>    */
>> @@ -36,6 +38,8 @@ enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>>   	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>>   };
