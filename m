Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D0F606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V3ncj7Sc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0023610E74D;
	Thu, 29 Oct 2026 08:29:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09255112075
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793262538; x=1824798538;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5HGrVex6EREXO9izMkwzBfK/RY1ZoATUw8Uo6vU8ZkQ=;
 b=V3ncj7SclG0pQTtc7P+mjw8DHBCOMrsXQPhmMh8ZD/cGgX4BYq58V0xP
 +wk4DMdufWWTadDHjOMPrraqd5xd6WIdH+Cecd0Rc+6ybkyEhhwVHBJf5
 ile5TJqhHQpvZ1wVxz9rskmtZJya/86fG1TP2BOE30sTgXGtQ87uWME/d
 oZa6gJsDA6qiVIFBDhpurkCMX3flXnj5FRF61iafARvM47f0yBHw20rRg
 xfS0L6SGaBX+MPMhLMVan4IDsRc3B0Mz0I9mf2JYYCAcm2/l2DR4NYbyY
 HE/kUh04NvJ3nd2xLqW/xYH1nFUdPgObIRIiSr4xWyDYzKVBJzBgnizB+ g==;
X-CSE-ConnectionGUID: MHNN8r7CSRuL8uwTCq8HVg==
X-CSE-MsgGUID: kfnWWxnxRuuoR+G1jAVfFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1881293"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1881293"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:28:57 -0700
X-CSE-ConnectionGUID: CcMBqYh/Tymgy1947T+B1A==
X-CSE-MsgGUID: U/BODCPVS6WTZbY2g9pKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6895055"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:28:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:28:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:28:55 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3wGgrEfViHe9SPk2BnS2MiMzDz/Hy+pVIG0tXKN0BH1D9cgE7QqKFL/nM5YruBaLEP2ju3MmpzO3zXyvrGRUS6bIFGponbZc4QIF5DWJzxgtFeZ4bc/S563jYGjtD1r+AFijsyoy+m3SoJyz+FI5BUlHSQKUwleslab3hz85vKnedhf06n2SL56ap1tjGXvmDpfN5eSEkolS5wTqEQEEXgg84vuqQpzBmYjgWPRitpV1ISTi73/tPh2j4dVF+IP3Mtz4ysh3HSlB5Jy0W7O+2JTp7eCTAms7D0n7yZcJmR8XjIAn4zXulKmgxPFOrEyeqDc89HGzbj/sCKYp9T84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HGrVex6EREXO9izMkwzBfK/RY1ZoATUw8Uo6vU8ZkQ=;
 b=h7HES0nbSsr0vpqyTMmGfDU3T9Qy1zR+3nf6tTyn8xmIO4CusjbcxBTO6I8ScOvtYfkwltfYpohgViQg5ttEM1U+F4I5ADBXBJu0NCS4K8+lM6Og9vkePQzBLSclS7eEjxSbuyanWwDkbKme+x32u7h0jJ8YHV27Fwbr/OXa3uu+SJ0sei0rkWAulAFq0GcJDiccsHHXlITjABQSBnIg76tCEaNQqsrGVa8hoyCaArHNXWJ/MWDJi93biLY+qwhclg+kUUa/TTJdO1pQKbRHde+CzW60G9g7VWNAD44ccuaR3VXPiQZ/X+IxCl4sCcI4NpMORsSSz53uJTs5gQ7RKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:28:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:28:48 +0000
Message-ID: <c09aff2b-7a95-4030-9880-4a2a53b10e43@intel.com>
Date: Thu, 29 Oct 2026 13:58:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/xe/pci: Add upstream switch port lookup helper
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-17-riana.tauro@intel.com>
 <auIgkNGz2oliaZGD@zenone.zhora.eu>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <auIgkNGz2oliaZGD@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6a936d-fe23-4257-2065-08df3596a750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4uyV/rpTs9PnfaYLmbsWVfI/LS9s0iYLZ7aGzSMiraUr4pVQp6QY9DuG7BMg9xA04gDAufeIgdlJHEn8sk0ug1IATdT1GQxuU4m8OLH3pSpGo4lYz4glC7eauHxAD2rwoUUrtQX86dux7SJPpGWUwMYzKzt1N9XEagWHnS6Bo2CCQ2Yem0yFd/V3+FS6CH06EdcmCtrfiou2b0CYZD/dCzfG7H42WuYhglAkhLNne+hIVJzMeCaJ1kUIx41EaKvcVWmWAJ5HSxEjaGf1+aK9yt+m1e0/eexZPucTTfJvARdyK0rEsveXuDHzdHSHcvfcEsq2Mx4lvfUCTJEYAtKJv0xy1kiECJLWGzkV9mwTS9Ucu79ETaYUDiLI2KlWtNuYiPBePNFKETPjaHIOFYPcsT7ah1ZX93FipbSOf2HqDXjnLR8gMSHmfdwv8f8ji7KgT9Cciqx6qg19Ew5MYpNU9u/WvagSM6BYgkYpaGR5y+a+C0c0Izx0ngLrwzTaksldoWC+0FzCYmBmvW1IdTmkI+YhUij3uKbXNy3arS40D9+/AeehmCJ1KxIYsiN1gQtA4BczGsF6w+zRJ+fGwMqfe4VKNqidqgaINyw93mqRyPv0lWmYbJWGyDtfLtLs+aFkK/AvQ02O0b97B+wH1ib8xUqbcYMtFi2qgfW0YjHFaWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVhMMm5kUStvcVhma3I1aTZONjd4YTZ5TWNsN3NMR3NtR3lhckxRMmF6ZDhV?=
 =?utf-8?B?QjB1MURLNnBmL2dRNWxKeVBYeHhneDVyYmhXa1JuVml3a3hLWUhWYTdOVHZU?=
 =?utf-8?B?eitTMUY2V0VJbVd3ckcxNHFTOGlLTHFpUktQY21hcTFJQmhSczdXUHpiNDFs?=
 =?utf-8?B?a1ROZWJCU3ZVVHgrR21FZit2YjB5S1pzTG5HWjMvRHArdDI3Tmlybkw5VzNn?=
 =?utf-8?B?a3lYYmVnOXJTSjNtZ055eVE4eU1pY0RqdVVvQ2VZYTdFVGxqdDFqM1pmM3lu?=
 =?utf-8?B?VWtwWGtmOWNwNFJSdjA2ZC9tNFZxOVFLN280UXQ4UlpEYnVvN210SFZ0YUdJ?=
 =?utf-8?B?THRPbjVwMzdwbkpHL2RGS1JqUTRoUjR3SHBTT1dIOVQ0UWdqQzJEdzR4Ukw2?=
 =?utf-8?B?ZlZMSkpFckt6QTJBWmZLa2t4MEpma2haQUJZL0RoVDc1alVlR0loTldIRXl3?=
 =?utf-8?B?aHFhUnQ1cVorNWUycmFyTGNMTTZuVEFYeEN5YzFEUHBoU0d5azVodTMrNEVa?=
 =?utf-8?B?R2RSWFJ0YjBFZlk4L3VrSjFYa0xFMFljdHhFMFN4SlB4QWlxM21nVXRPclJv?=
 =?utf-8?B?aHNzckFpWHhqWndNYWhQZ1VIQjhabkh0Zy9iUjBYdElZYVdUbHZNSURWekxB?=
 =?utf-8?B?MEZNTjIva2hYVmZIV011OFJQUy9sczFjTkdML3FjbEI1bktHOVZpS25UWTJD?=
 =?utf-8?B?Yks2NlZpVFo1cVlqcjFzSkluSGNub1JDcERXNkNrMDlsRFlTMFc2TUlUSldr?=
 =?utf-8?B?M0krMCtEbkNkN3pBUlJQRHBxSnFhODZTTFJOaTVibFU0VUxFMkxCdGcxOVhD?=
 =?utf-8?B?dWNnc3NZVk8wOHlaY2p0aDhkU2ZDS1RVSDRtWm5RNXZCeWQzMW9OZWZsNnpY?=
 =?utf-8?B?dzdsV0pWSUdCdmlkTXFHa1NyUE9JeklSRm40b05qQjhpSWNsOTlzeW1ucU5Z?=
 =?utf-8?B?YTB4RHN1YnhYeTBLRUcwazNReW5yUUEweFpLRmdYYms3KytsYURNNmRXNmpy?=
 =?utf-8?B?R1lUendGMW5sckJGK2doeHRXL3hpaU1kWmZ2d0VTWTZBUkEvdFRQVmZCV2wv?=
 =?utf-8?B?SHdxYmUvK3ZMRCs0dEdmc2w4azlweUtSdVJTb3IzVEdaeWF6WG43RVpwZEo2?=
 =?utf-8?B?VDFuZEp2Y1dZNFBTUVdVbWh0QkVqdFV6NG91YWp4S3BKdm5tdE1USGJWWVNS?=
 =?utf-8?B?SWJTUnBzcXpWMTJUMm55L1FjaXVqNnFCNHRMLzJveVBJRDI5K1dkV0MwcGd0?=
 =?utf-8?B?cnZIN0l4VlBIYnl4UU05VGhLVWpyNHRydUZCU01sdTdNUFhUTTA1WU41dkI0?=
 =?utf-8?B?TisyOU0xSGRrbG5idEUvem8zSWxnVGdEZW9EQTJZWVVrMUxmUVgzR3puR2hI?=
 =?utf-8?B?Q1ZoU2o0MkZiRVFRU2M2ZEppT25wZHBlZWJDM1gxRnhvYTR3VzFyakFOMVZD?=
 =?utf-8?B?OTBiTjBnZTR0UHpSNm9iRG1pbU9qZm1qUTVmeUNWQnFCLzJCeDMxQ3FWbXcv?=
 =?utf-8?B?VDFlc2lzMS82SXlwcTJPUG43V3p1VWtPZ3Zud0pBYm9yK01JaHFpc1I1UExS?=
 =?utf-8?B?L0JDc0dKellXUVNDRmxla1QzUjNGMjJpd0xOcXkzMk96RVZ0YUhld2dBZURs?=
 =?utf-8?B?SmVCYTlOaGhOUzBhZndzM1pxYi9ZcWFCZW1ERk9GTW5oQ1pXam1MWlFOTEM5?=
 =?utf-8?B?Unh5L2ZqQzFkclBGYmR5VGJzeEtNdVBUcFJmWlJOMkFTbWtlaGJGWEdFb0JH?=
 =?utf-8?B?T0Z3QkNVTUJNbS9pYVdNbXY1VEUyZVNhYmhTV0hZbDRkcVBhTDVWeVR3TWtv?=
 =?utf-8?B?WjNDbmU1V21OVFpYaGZrVy93U1pkSEVQWkk4YVRtQlVJZDdxcW42ZlEyUmRr?=
 =?utf-8?B?LzQyWTUzeENaK1MxdTVlNXZ1bkdwL3ZHVS92QnZPdS9HeTNXR0c1dUpOWUJD?=
 =?utf-8?B?UzlSZTcyaVJoR0JDekpES2FmRlYrVVQ4TnBqMXhlL2plTUQyTm9aTXpmM2Ji?=
 =?utf-8?B?V0tUb2VCN3Urd0FKdUZQaU5meHdmT2MwVFA1ZnFlMlBwZHJSWFJmTTZqUmtz?=
 =?utf-8?B?RC9GdDA3YlhyYTNpLzVpb25xbWhzcS93UHlsZTJDSjJQWHQ5QWJwUDUyMURx?=
 =?utf-8?B?K0xsVDllWmltOEtTV0dJVGR3cUhSYzdjUGJ2TGJsdXhGRG00dnJpWG5LR1ls?=
 =?utf-8?B?RHVmWGg3dWlRVXFhamNZdENEU2RkR0t1TUV1a2tpdHlaREFZeDFXQk1DejAv?=
 =?utf-8?B?ZmlYNHdNNm9FdXE5NkwyVG4zWG1JRGc4dlQ0MS9VSkFCQ1YwVnl1ZmVlemda?=
 =?utf-8?B?WmtvUDE2d2JxZGxTemlGU2EwSnQxZGtZdklIVXJjb0JJTGs5eXJ5UT09?=
X-Exchange-RoutingPolicyChecked: UKh/nQPCWT88FIlAA49oEoiNgR7DWXCLm2au33CS/2ykBVHeNV/tp5pUzXBnjB0wshY99krW6c2qZU9DiFifqN4g1OlFBnpgCXQlqrViqnz5w/0VCWxvnKZYGhSOPT5qlFbvydpOnlHR0ovn4+FGAGHL259st+JiN2q9ng1JXUxzbWPFi/yL+7mstLlIgkH4x0Fk/axR+gHewHAeGj1EnSTvksE5gfh4NSkrIM5Vgdo3IhYK0GtbZpfnuWZUgJsXUIvAulyQi4rZrYwlU2QrpLNxP8t2fQQ5QTmAiRhlCEep384+QEBv6guAP+DVVAIv6zEcoOj8Ate/THH2EM1NAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6a936d-fe23-4257-2065-08df3596a750
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:28:48.2386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dNpBkq6Lnb6DIpJdLP8JL/rNsjHwQyDw/uw3rIkTMnfoUOcBLyVixUo9zRW9qs3z/tTikUTglKTouBWPyNkbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28-10-2026 21:49, Andi Shyti wrote:
> Hi Riana,
>
> On Mon, Oct 26, 2026 at 11:35:05AM +0530, Riana Tauro wrote:
>> Move the USP lookup logic out of RAS code and into the PCI
>> layer so it can be reused by other callers.
>>
>> No functional change.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thank you for the review

>
> Thanks,
> Andi
