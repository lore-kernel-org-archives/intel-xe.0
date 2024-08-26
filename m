Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A382BC5472C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 21:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED2310E142;
	Mon, 26 Aug 2024 21:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3gwy/oK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2AD10E142
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 21:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724709369; x=1756245369;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vecv/uub83yRL5GvLiZDvCNdD6I06DQuYvEjuN67NvU=;
 b=C3gwy/oKuh6lPoNPUlmLhJx1yDpyf/8pmQ6pqwXubp586rmEl1hj7Aoq
 SzWx2LdQlvlQJT3uQpVoSYnyRGrTlME088MNPnLHL1V7TQoCUimdNOyYv
 YKDKisgN+eXDQ38ICrCIxqwAvkfps89C+GzEjzrEGp/kwAXRNOTtySIe/
 VM8Rr7ryTwmAD/Rsz/I3LNoDUYHNtKBRzjz+D3dwuB4PRtTPG3uCZCZ5K
 j9+tF4iJdPcnASTr7gUnIttSuRCAScBaaj15OddwMBVhoto+qnz+f0RrY
 F2CxYfgyxA5yVxDVzcShDJjKiWQU4DRIIBGvMrbsXIzGeAwbBqJ37p/rK A==;
X-CSE-ConnectionGUID: IDH8E0bARKS/aRV0SXOfNQ==
X-CSE-MsgGUID: fHJBxKyoTOCTF9p0iVFOyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="45676475"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="45676475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 14:56:08 -0700
X-CSE-ConnectionGUID: feq2KWHGSFGg9LAVZ/YWXg==
X-CSE-MsgGUID: wyEUmgx2TO+TNmrBAhbL8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="93443129"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 14:56:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 14:56:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 14:56:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 14:56:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 14:56:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhxNXg5Km/x+ccYmMEeFJzX4TrVTX6Eww0z/0gXbo2/cfc1uoQzykmsfaZ3k8Didnq03jDUYvZ/ayDDz60T78m/6VH+nVBVRI8IVDKYGJGSETd38E+miFcERZM2ixpP5iFwSYGY2sPP2l7OWJVGOnYFUOlUubiL/OuuvKMGVFOIJHODilEExW9EWEw24hXVJ4LFhRTtIR75OmvPfM0mGtBgq7YJb394MRYm9+3pK1JqBMLoQuR53eNPWhy31axpVpz5IifSguS9IoDf4RcE9I+0AYJq714oY1UEL/mrBGvA3hnLs75tBugoP65B5XugyIaDf3103JDTR3znaVg45Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiDE9yAhn9NLhnMyLmOX+hEbULLo1BdOLFJCM6Ju7TU=;
 b=NM6xahxKkgVEf5UYqjsgRyyn3H4r2hnnVr+h6su39eNjMXRTjZd0FJuqH0KibQYw2yapWrqj2w2s6X4fo9xhXj1LimnJVB5qowp714egGRMpbrgjt3tPu65Hbtnj4ZI+s6fgh/xaRA1Gen63q4XHoesrAC5V7QgR1bLn4OoPyZERPI7uC7xgaKavbaB3HC9cuDo2tglO/d1NuM+ijpjwtA6dygP5RenvhgwipEUwepr8sLwogkt2kSUXFuypE2uI5JHBYkV17F5MrxOLDcwbOoYTkUcq3ZQf2WrM1xDX7Dg1diqpwpReBWn3ro7rYMoubKoqTsIRhIm+Jy2f6PJ2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 21:55:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 21:55:56 +0000
Message-ID: <f6ba89a9-b12c-49fb-a8f7-fce51daee2a2@intel.com>
Date: Mon, 26 Aug 2024 14:55:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] drm/xe/pxp: add PXP PM support
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "John
 Harrison" <john.c.harrison@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-11-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240816190024.2176976-11-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0004.namprd16.prod.outlook.com (2603:10b6:907::17)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d13b7e-dac2-4c7f-5b3b-08dcc619dcb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ci84a3d5bnp5ekU1UFBFWURDRCszbkZOcEZxaVhwd0FtQk1FR21BdjQ3cWsx?=
 =?utf-8?B?dFhIMXRKVkR4cEgzdXpDS3ZIeWkweXZKdk96WW1Pay9iZExOR3lGSEgya28z?=
 =?utf-8?B?SXZwcUNKeUx0Vmx3UTE5U3NlUHRiN0Z1c3FzY3h0a0M3bFQwY1FDTkdRU3h6?=
 =?utf-8?B?a0x4NUhNUFFxZ01qYkI4b0c0dCtqdzBSSzRoTjNzYUtDMDlGRmU5UGNSMHhn?=
 =?utf-8?B?YU8wd1NTN0llY05GTkNCbitrNkdkaVpGdGZGWmVLT0dSaDZMaTJ1OE5nRzNl?=
 =?utf-8?B?MkFMOEhvU29nSHh3Vjk3UTU0WkZCOS9ZcDZkblZhdjVaL25tU1lERnZ3djBD?=
 =?utf-8?B?aUg2VGlPUlhGdHhVTlpqQ2w4RTJ5THEzY0loUW1zdGZ6YkpwaWt4bW42UjM4?=
 =?utf-8?B?ODN0U0hmc2YySzR0b1M4SEZjbjNJcVgyWUk4dXRuRGhmSnlxRk9kT2EwbVR2?=
 =?utf-8?B?Y1RPYldVMUZ4NFdPcWZvdlVkR2pPbHkvWk4vSFg1c1lzemtxa09OaHhqdVAr?=
 =?utf-8?B?dXR0aTJNL244ajFhb2hmUXhQZ0FHLytKQUpzamFzWktkeVVpVmgzeFBFV0Zx?=
 =?utf-8?B?d0oyZldReDVKcTErNnpDUlQvQml1bDJ4cnBqQVlHSmtwV0V1dUVsSUcvRjlC?=
 =?utf-8?B?RHRpOEhpaFlGUU5NZnFnTjBRdXBuZXgxNjI1RUd1c0E3ZlpHUzE1SEtwdWM3?=
 =?utf-8?B?WUtYZ1h5TXFtVkJoRFhyRHR2RUcxc2VjUTFETWFOenVocUtRSnpFanNNMjg0?=
 =?utf-8?B?NVdMQmJjRmN1a3RCdU1TZzVGVFNzbHNEWDJ4dmxQQlBKbXk0bUV3MGk3cUpT?=
 =?utf-8?B?TTdsY2pkU2VqZVdqcUZqcE5pMllnd2J4TmExaXZxRGt2d3podFRGclQ5R21B?=
 =?utf-8?B?eko2c2hwK2JzMXR1ZG0vMHdoU0hrZG83c0FyVUQyMGR3OHRZcTRtOHpDaHM0?=
 =?utf-8?B?dFNiazdhaWthSFlMWHVyRnRWZXc5RWZKQnM0aVI0M3FFbS9aN254RG9sZ2Z1?=
 =?utf-8?B?L1hKblRyOXRJTXpoQWVKUDU1U2xETHl2V2ZGUis2QVhQSGVab251Z0pBZmpM?=
 =?utf-8?B?Z2ZWL0Q4bG12cUpWdzZpK3p5TjdIaGVtMHdFdWR3U2lJYlZGbHkzRS9hMU10?=
 =?utf-8?B?RHZoekN4SmVvV1IxN0hDRWhTNWJ0bmZ2cTJZdnUyUkNxb2hpWHRLaE0rK0VB?=
 =?utf-8?B?NENlbHE0UEdNa0RBSWJ1MURuaWxWclZ2ejAyOGRnenZlVDh1eHZNb1BweHho?=
 =?utf-8?B?Y1NWVW00SEw2ZVV2MHMxWW04eEdEV0dSYU1nUFJmZU1CRWFnZmtDMjlhMVpX?=
 =?utf-8?B?M3ZDMit2Rncyb1oyREN6NmM0bk1JUGRNUWJoRVNHbGJuWUZ3aGVyTkc4b0ZM?=
 =?utf-8?B?d09GWDVHZDhRUE1IWitGa1ZoTGM0LzBlYWJjcmpFL1E3SXlmRmkzblM4S0tQ?=
 =?utf-8?B?Qzl3QUYva3JPSVpOUGxWSHNtcGw5SUhERCtER2xTbXhWNUJIWjg3T2pObzhz?=
 =?utf-8?B?MHhob2VSMFdhQzJkWmgvOFYwWUs3VHE3TUFxMVBuSEJIK0VaUTRKc0FNU2Rr?=
 =?utf-8?B?Mi91SVdXZzFadzBBWklZSkFUZWpWc3o1U2taUmxxVE11SEw5NU9YWEdkN3Jz?=
 =?utf-8?B?Y0NLYXdJcUcrK3h6alN0d3NFT0NTUXBHUUpOQXB1elZKRkh6YXVBR0RkUnNG?=
 =?utf-8?B?NUJKNDcrUUpPNTQ2aHQzSjdQbDdGTGRPZGlweVpYeW92aTFJU3VsTWRTMjAz?=
 =?utf-8?B?dzRmYldVNXUxdDV4M3BiNmU4ZUs3TDdPUGVneno1bHhwUkd4aXFLeU1oREh6?=
 =?utf-8?B?YUIrQ0ZuSEpsMXVIV3VjZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3hvWmRLRkxRRGJNUnhXVWRvMml1bTZQOWxrVXM3ajJjZFRIdWZ6QmZUOW4w?=
 =?utf-8?B?L3NPbzNYNmdlSXRFcWFFODZubVZicnl0b3k4cHJ3SjV5QU53eUsvZklqR2Ra?=
 =?utf-8?B?R3UyTjUrY0xtWVREamZtdkh1VWJKbzh6VTM4ejlVUzliT08za3VONCtVbVlM?=
 =?utf-8?B?WFRUNDFKSnpkSlRBM0ZvMjhCdHpLTTl5VGlvSmtOVzdvS0UzQVc1M0tnUFBR?=
 =?utf-8?B?UDhNeWxGa2pmZXduMGxnWFlhUDkrM2xlTlo0OEMvV0hldklMYUFoVloyZGJM?=
 =?utf-8?B?VE5EZ2oxQ1ZmMkFZZWY3MkwxQWw0UThIdlhuUTlEaTBjd1p2RmE3R0M2Vy9O?=
 =?utf-8?B?ekZEZGM5cTl5NGNCTGs4ZDlXVXJGL1BhdXgvaWpKSDIxZUtjbS9XSk5QK0xn?=
 =?utf-8?B?ZFBsSVR6N2tYcWlHZERMQlNJK3FwUndlWlVMY0JkdkR2VTlrak9XTHVDWk5Q?=
 =?utf-8?B?ZzlBalM2ZFhHMWpyYlNHVHpiU1JubVlBaXFOTWJncmRHdnNiMlJKTXV5c1U1?=
 =?utf-8?B?bDIrUHBsSUltQnFmQW9DZ3JUbDZMMzBsRmhTN3J6aktTdjZjMzhyNm0vc3M1?=
 =?utf-8?B?eTRBZklYMzRoZ2JsUTVXcU5DZGdERHF1VnR2TVJybnYvdTBuWkM2dUxvTStk?=
 =?utf-8?B?NEU0TTloeWtobmdubDd2Rmg4WEovc0ZIUkpObEVRQ2NBd2I1MEZ3MkhqMjEx?=
 =?utf-8?B?eVUxVFNqYUlqOHFqU2xDM09lREM4UytJY3YyeXB2OXE2aTYwWXUveisyMXNP?=
 =?utf-8?B?Rm9xVTBvZGRkc2xMUG9YYjJtOU1kdDBldUZHQ212bmlSQmNOOEc5YWZlN3Az?=
 =?utf-8?B?SDNEZEJaenc3aGRtK1RoRVNld25hSkcwTkp4K05SZURqTFZ0ZW93M3c3SnV5?=
 =?utf-8?B?aTlsSnNJZWVxRkF4NXZpMnJmTXF5N3ljdUdNOFRIb2hFdXVXVmJzNE5CL0pF?=
 =?utf-8?B?b282MnNZMFMydjR3c2xacjkvcmU4WnZ5eHV4Zm5LL055eThBZjRiZHU4NlR3?=
 =?utf-8?B?M1JNWmprVXUwTGlKMUxFQkhjSnNBNDlCRVVRWTI4OUZDOWJGSml1TGpWNUJu?=
 =?utf-8?B?eDJSTCtsUzF1QitNczQ1MXkzZVp6c3RBMnQ3b1BaNDZzMjZ6dFhIR1VUUngr?=
 =?utf-8?B?NHNubVhybml1eHhHTHN5RUxNMWVVS1B2dm8wdU0rSXcxUWh1ZXF2YWdhMGpy?=
 =?utf-8?B?eXVBeWxSTE12Sjd5bjdRR3E4bW5kVmhHcDR5Y29hREhwQXF3czdxVEdFcWpM?=
 =?utf-8?B?V1lJS0hmRHZST1dsR1F2RWdNTFhXYzJ0c2dLMm1EWjF6VllVL3VqNDJnbU12?=
 =?utf-8?B?SGErUGNXMGxIZWs5bXhIYWo4TDRpUnY3dWkvMFJhK2o5am9JblRzK29DU0xu?=
 =?utf-8?B?dEEybjk0QVBTc3plYVhrWTY5bzdRakd4UDNiLzUrVUp1eTFYSjBZazJYNlJo?=
 =?utf-8?B?TXY0cUkvU2piVFdQRG1HT2V1WkgxanBMVTV5YzVYKzB5c3o3M3EwMDVkSlJC?=
 =?utf-8?B?VCtTdW1PVUxHaTNHUFIrblpHbERCTVdvVHdtR1VwcVQ0dVdKQjJSek9yWmk2?=
 =?utf-8?B?bHAvbUEyRXZnSk41eTdTQUxUc1grZlNnOVB6ejNSNHFCc3FsdXlIVk9TekVY?=
 =?utf-8?B?bkJ4a3M2azZRQ0JjV2lBT1ZydFQrUmZydEpTWE1aK2thNFRHdDN3Qjh5T1hp?=
 =?utf-8?B?UmpwbkNkNVMxVTB0R0tSazkrcHovbW8yYzlBamVuM1lLQU5nNzRUYkduOXVM?=
 =?utf-8?B?a3c0dXVTeXArdDlUMXd3dWw2OFlNbmh1SWR3dTduSHQ5ZjV3UEFwc2M3UEVG?=
 =?utf-8?B?RDZxK0FrMWwyTHdNTTRsSGxXZjdlSEhjcXhGZHVwNHRnaEJ1V2JJcmdJdi9D?=
 =?utf-8?B?TmRUa1R0OTJraE15TWVYVjJ2cFZxR0tqNGxQNmJweVg0cUJwNjBUTUZRU085?=
 =?utf-8?B?QytxTjNoem5EaGJ3TnJUbGQ1RTkvZXRWZW9McjM3akU5V3FvRGw4K0tiVmQ1?=
 =?utf-8?B?bGxCSnp2R2JCcGtSOUExc1dJOTZvQzVoaWc4Zi9VQXNhUjVlbHRsQ3JlS0pt?=
 =?utf-8?B?S1NCWTlscURHY1E0TXdQd3NhbEE0TU9TZDY1Tkg1REVJNGZIa3VpUi9xUTUx?=
 =?utf-8?B?ejA5TEdlQUNjWTFhRm5IekJFWUxnaEFJTzVjNFZGQ244bUFaU3lJVGVqanQ3?=
 =?utf-8?Q?6g3skJYCNZN4c1e/3/JrSXI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d13b7e-dac2-4c7f-5b3b-08dcc619dcb3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 21:55:56.0831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYUWNsIjkrnoyLYKnsL2+s5VUJf1dhNtBwsYSeBR/4c4CMdTd+yjSZ8dJSuaXyLUQrGmV+p/2UsEIRGzrFMnUG/fw/t+UmSHJDmyapZR2Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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



On 8/16/2024 12:00 PM, Daniele Ceraolo Spurio wrote:
> The HW suspend flow kills all PXP HWDRM sessions, so if there was any
> PXP activity before the suspend we need to trigger a full termination on
> suspend.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c        | 42 +++++++++++---
>   drivers/gpu/drm/xe/xe_pxp.c       | 92 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h       |  3 +
>   drivers/gpu/drm/xe/xe_pxp_types.h |  9 ++-
>   4 files changed, 134 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9f3c14fd9f33..1e1f87ec03a2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -20,6 +20,7 @@
>   #include "xe_guc.h"
>   #include "xe_irq.h"
>   #include "xe_pcode.h"
> +#include "xe_pxp.h"
>   #include "xe_trace.h"
>   #include "xe_wa.h"
>   
> @@ -90,22 +91,24 @@ int xe_pm_suspend(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Suspending device\n");
>   	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>   
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		goto err;
> +
>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
>   
>   	/* FIXME: Super racey... */
>   	err = xe_bo_evict_all(xe);
>   	if (err)
> -		goto err;
> +		goto err_pxp;
>   
>   	xe_display_pm_suspend(xe, false);
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
> -		if (err) {
> -			xe_display_pm_resume(xe, false);
> -			goto err;
> -		}
> +		if (err)
> +			goto err_display;
>   	}
>   
>   	xe_irq_suspend(xe);
> @@ -114,6 +117,11 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   	drm_dbg(&xe->drm, "Device suspended\n");
>   	return 0;
> +
> +err_display:
> +	xe_display_pm_resume(xe, false);
> +err_pxp:
> +	xe_pxp_pm_resume(xe->pxp);
>   err:
>   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>   	return err;
> @@ -163,6 +171,8 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> +	xe_pxp_pm_resume(xe->pxp);
> +
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	return 0;
>   err:
> @@ -356,6 +366,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 */
>   	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>   
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		goto out;
> +
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>   	 * also checks and delets bo entry from user fault list.
> @@ -369,23 +383,30 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	if (xe->d3cold.allowed) {
>   		err = xe_bo_evict_all(xe);
>   		if (err)
> -			goto out;
> +			goto out_pxp;
>   		xe_display_pm_suspend(xe, true);
>   	}
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
>   		if (err)
> -			goto out;
> +			goto out_display;
>   	}
>   
>   	xe_irq_suspend(xe);
>   
>   	if (xe->d3cold.allowed)
>   		xe_display_pm_suspend_late(xe);
> +
> +	lock_map_release(&xe_pm_runtime_lockdep_map);
> +	xe_pm_write_callback_task(xe, NULL);
> +	return 0;
> +
> +out_display:
> +	xe_display_pm_resume(xe, true);
> +out_pxp:
> +	xe_pxp_pm_resume(xe->pxp);
>   out:
> -	if (err)
> -		xe_display_pm_resume(xe, true);
>   	lock_map_release(&xe_pm_runtime_lockdep_map);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return err;
> @@ -436,6 +457,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   		if (err)
>   			goto out;
>   	}
> +
> +	xe_pxp_pm_resume(xe->pxp);
> +
>   out:
>   	lock_map_release(&xe_pm_runtime_lockdep_map);
>   	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 640e62d1d5d7..78373cbbe0d4 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -137,6 +137,13 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   	if (pxp->status == XE_PXP_ACTIVE)
>   		pxp->key_instance++;
>   
> +	/*
> +	 * we'll mark the status as needing termination on resume, so no need to
> +	 * emit a termination now.
> +	 */
> +	if (pxp->status == XE_PXP_SUSPENDED)
> +		return;
> +
>   	/*
>   	 * If we have a termination already in progress, we need to wait for
>   	 * it to complete before queueing another one. We update the state
> @@ -181,17 +188,19 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>   {
>   	/*
> -	 * We expect PXP to be in one of 2 states when we get here:
> +	 * We expect PXP to be in one of 3 states when we get here:
>   	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
>   	 * requested and it is now completing, so we're ready to start.
>   	 * - XE_PXP_NEEDS_TERMINATION: a second termination was requested while
>   	 * the first one was still being processed; we don't update the state
>   	 * in this case so the pxp_start code will automatically issue that
>   	 * second termination.
> +	 * - XE_PXP_SUSPENDED: PXP is now suspended, so we defer everything to
> +	 * when we come back on resume.
>   	 */
>   	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
>   		pxp->status = XE_PXP_READY_TO_START;
> -	else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
> +	else if (pxp->status != XE_PXP_NEEDS_TERMINATION && pxp->status != XE_PXP_SUSPENDED)
>   		drm_err(&pxp->xe->drm,
>   			"PXP termination complete while status was %u\n",
>   			pxp->status);
> @@ -505,6 +514,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   		pxp_terminate(pxp);
>   		mutex_unlock(&pxp->mutex);
>   		goto wait_for_termination;
> +	case XE_PXP_SUSPENDED:
>   	default:
>   		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
>   		ret = -EIO;
> @@ -648,3 +658,81 @@ int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
>   	return 0;
>   }
>   
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return 0;
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	/* if the termination is already in progress, no need to re-emit it */
> +	if (!completion_done(&pxp->termination))
> +		goto mark_suspended;
> +
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +	case XE_PXP_READY_TO_START:
> +	case XE_PXP_SUSPENDED:
> +		/* nothing to cleanup */
> +		break;
> +	case XE_PXP_NEEDS_TERMINATION:
> +		/* If PXP was never used we can skip the cleanup */
> +		if (pxp->key_instance == pxp->last_suspend_key_instance)
> +			break;
> +		fallthrough;
> +	case XE_PXP_ACTIVE:
> +		pxp_terminate(pxp);

We don't actually need to do a full termination on runtime suspend, so 
in that scenario we can switch this to be a simpler marking of the 
queues as invalid and then do the termination on resume. This also fixes 
a big in this patch with the submission code trying to take a pm ref 
noresume from within the rpm suspend path.

Daniele

> +		break;
> +	default:
> +		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
> +			pxp->status);
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +mark_suspended:
> +	/*
> +	 * We set this even if we were in error state, hoping the suspend clears
> +	 * the error. Worse case we fail again and go in error state again.
> +	 */
> +	pxp->status = XE_PXP_SUSPENDED;
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	/*
> +	 * if there is a termination in progress, wait for it.
> +	 * We need to wait outside the lock because the completion is done from
> +	 * within the lock
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		ret = -ETIMEDOUT;
> +
> +	pxp->last_suspend_key_instance = pxp->key_instance;
> +
> +out:
> +	return ret;
> +}
> +
> +void xe_pxp_pm_resume(struct xe_pxp *pxp)
> +{
> +	int err;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return;
> +
> +	err = kcr_pxp_enable(pxp);
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	xe_assert(pxp->xe, pxp->status == XE_PXP_SUSPENDED);
> +
> +	if (err)
> +		pxp->status = XE_PXP_ERROR;
> +	else
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +
> +	mutex_unlock(&pxp->mutex);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 2d22a6e6ab27..af32c2616641 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -20,6 +20,9 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp);
> +void xe_pxp_pm_resume(struct xe_pxp *pxp);
> +
>   int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 1bb747837f86..942f2fa40a58 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -24,7 +24,8 @@ enum xe_pxp_status {
>   	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
>   	XE_PXP_TERMINATION_IN_PROGRESS,
>   	XE_PXP_READY_TO_START,
> -	XE_PXP_ACTIVE
> +	XE_PXP_ACTIVE,
> +	XE_PXP_SUSPENDED
>   };
>   
>   /**
> @@ -111,6 +112,12 @@ struct xe_pxp {
>   
>   	/** @key_instance: keep track of the current iteration of the PXP key */
>   	u32 key_instance;
> +	/**
> +	 * @last_suspend_key_instance: value of key_instance at the last
> +	 * suspend. Used to check if any PXP session has been created between
> +	 * suspend cycles.
> +	 */
> +	u32 last_suspend_key_instance;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */

