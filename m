Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B936C3ABD7
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 05:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB7810E1E9;
	Tue, 17 Sep 2024 05:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f84l9saJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C6610E1E9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 05:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726550693; x=1758086693;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X17MOrZHO8mnVZVAwdxmVE21gDad1BCcDElTGhs/pPk=;
 b=f84l9saJqzVC+C3U2sXYYs8xgL+e1EGe5b/Y/UpWM7eFC79rzxeMUgYD
 li4nOne6YRT1L8p7YXEB3DxoyAbVpiXF0ApyaZzoMUJatRA7uY8G24+vc
 lLZwbILw36u2JgQg+sRkyTj/6gkzekp7NVz5D1C7oawZHbHTbwDoChn1d
 VTgN2kLhQeizMJ/Na/Td8DSA18yl7AoTa7xbKzMIQavzD70ZrJV+j+SJj
 rU8oS9bee6mcrHzmCKFpVQIZWIVh45VTDGRhhCf83laefluHQ9+Q0+LTM
 xAEgaT+TJYIS3Ie2j70HdAn0OwdMK8W7ByzKXxm/t/S13Kjcs2Rjv7gWl g==;
X-CSE-ConnectionGUID: 7n5+lu0IQVKeaveJ1uJ9pg==
X-CSE-MsgGUID: CNQVhEgaQvCjwF/VbDd9TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24880912"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="24880912"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 22:24:53 -0700
X-CSE-ConnectionGUID: 9nJ3degrQNahyW7EEk09FA==
X-CSE-MsgGUID: Xfsuw2zKQXqaGTmhbPjPRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="68714365"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 22:24:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 22:24:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 22:24:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 22:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbeIIFLb0I8n21zGmbhj1dtRnTXbtKbACsF32GEZW3z6OEeN0Wqlp8IevhPbW13Dhwo6y30Ett79JZgrwLX7K6dCxnmRV6P4uZ0FyyZXk54jfUgZBikXkwcqhPNj5Z2pUjhxHtlfXM87LYspO5tZ5lCkqNaX99kzRffOEimlhK9kTOe2xkcVEVmQVyGgoYLS7ni0LrlXbDOHM/+5C8S3LaVuu1c7dUUWSnJRglX3Tp1tlytcIWOhSTk7xkAnqx6uoX4RsaFC7tpGzRD4zFOyFUfn91Aprf7C4/iiLOdJToRHLTAH8xobsTtVH89g0wLsopARsNyKGEOfwWvq20Qdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EC2cdB8Tec80+gUWN9jd6rXFL5AXk9g8Yuz9zVpP+0M=;
 b=Euj/PDAEckfstswNtJaFABSWwljYIvX7vt3dsa72W6WAvi8EF4Nw/h04vbCIZn+2ynujFFOPMxBERKHvp2FxwUA+uQsDIlatMMc/l/85N9FKCfNg8u+Wbhsv21UI+ap2XR9XG0Gx3H5qDaExJg39RWOgyTGn4+/ROpCNcAXZWpKZ8Ew4k8ewALiuwFAKRoY/6A09gwTebJxpw2Rmyyn3dLpyar9t+9bCuynm0vUEdKEuXiJzVsb2FqhejKITdghldhBcRp9mNNYovzRAHNKh5v4JbAsbjxAKtx8VMQTeG9cOtLLvWTIF6x933zI/ik3qU24fmx9D6xNHIvW9wp6Feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA0PR11MB8301.namprd11.prod.outlook.com (2603:10b6:208:48d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 05:24:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 05:24:49 +0000
Message-ID: <b188eb23-921b-4885-aabb-89cb206ec385@intel.com>
Date: Tue, 17 Sep 2024 10:54:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
 <fdf3d4ea-dacb-48e2-8b20-a4fd6fd73e00@intel.com>
 <c93e3fcd-6648-4a07-8645-6e10310f0b41@intel.com>
 <326ecbd8-e5cb-40f5-b1d4-987339f49c6e@intel.com>
 <c22e92d9-7606-42a3-8442-88dcbbc92a19@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <c22e92d9-7606-42a3-8442-88dcbbc92a19@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA0PR11MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: ca69fcf2-e0ca-4599-31ca-08dcd6d90ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHhxR3N4bGdNS0lSc2g2VHk3cXo4UloyMWZjcHJieVg0c1dxWXI3VFh3alQ2?=
 =?utf-8?B?SEZYeHRCWk9vK0xwMXNDNHY5WjV1UVVXR1doNlFjMWo2RE45UHlCQmE1S0ZW?=
 =?utf-8?B?MG0vczU5bXF2endXSWVmUEQ1NnFkTFA2NkxqS2QyL1pCaElvMXY1bXhzWDNH?=
 =?utf-8?B?NnNTa0dsYmN5VHAyUlRzOFhJOW4vVlNyVGZ6RitKOEdTWlVYeHlmaEE2aUtK?=
 =?utf-8?B?NVF5Ti9VYXlPWmVmMjNWVTFjbEJSTnZlR2FaS3dwekwyQ3kvQ3RoVWhTWFQ5?=
 =?utf-8?B?Umdyb3YyT2ZZNkMraHlPQU5lUG9EcGZBQVlOcGR1a2wyTzNtbThMY09nVlNX?=
 =?utf-8?B?cGEwcnRSc1hqMmYyNjIvdUQvSHAzbDNDMFJTamFQc3JtTG9kRmRGNXNnK2dQ?=
 =?utf-8?B?ZFNZQjMzUGh1T1VqTkVlbmxEOUJhay9Zbm9wRzlVd0dNenR1SERrLzBLbzM3?=
 =?utf-8?B?UExMb3NCOUphY3FXN1d6OTY3a2JYNHdoSXlGNFdpQjcyY0xkUW1KUEN5ZVNq?=
 =?utf-8?B?VEJqSUtGb1VOb0UwcmVqMCtERHZZdnVjRWRCYWpiWlZTalQ3TXpNQVZyK2pi?=
 =?utf-8?B?TDZOL1BHWWVNNDRhSWdTSGRxRnUvUndHcm1QZFlYOGxDNTYvNjV4ZDZDK0Vm?=
 =?utf-8?B?aEdFUlpMellpVi9XUDZHVG50N05YN3lIZ3o2MnBpL0hDd3BBdzZndWxnay9U?=
 =?utf-8?B?SENqUEIzYndtemRRcENkQWdoQkh4bWorL1lNREdKK3BIc1hQTFJ2ZFByZzNt?=
 =?utf-8?B?REU4VW5IczBoK1hWQXBtVmJjR01xem45TFMrUWI1cG1VSHpvTnRvL2hrWVYr?=
 =?utf-8?B?ME9YU0NEWVFGejMvSVg0Qm5pYi9qYVkzSk9WZUcxTy8vQ3JQUk1KaUlZVENZ?=
 =?utf-8?B?NW9tMkRXTGs3QU5aZjRhOWpBU0V2WXdoUDEya2I1NFg0M0pEanZjK1lIdE5S?=
 =?utf-8?B?SnBicDZSczBGbnVlQkFsTmdOY2tzd1NwaFV1dFA1U0J1UENiS2NDVUcyZE9h?=
 =?utf-8?B?aTFlZzBmaWdKNkxMZW5taFZzdnNGSXBYRnhaWFh2WVVtUVlpWWt4aVFuNmsw?=
 =?utf-8?B?c2pBUlY4OUlVRjN5Z1dUVE16TjF6VjJsSTFSS2Qxdk1FcUdHQVphS2wwbjY3?=
 =?utf-8?B?eWtvaFp6ckk3WkZTbnJTUGhSMGNMT1hRQzhmWWdNblBheXhKYzNIME83N2Jo?=
 =?utf-8?B?Z1hoNmNTNTBnVURzVG1PeVJMWVYzRzZzakRFNEZ5VGdSR0I1VDdhREhpamlh?=
 =?utf-8?B?L0RhdlpXVkFXbm1ONG9BYzFpL1pibk9WRDJnT0tuNHNWeW9OdGEvZEVtQzYw?=
 =?utf-8?B?d1FZQ1JvR1N6N0QrNnNJK3RveVFKVmFCUEYrZjJkRU5lb3NKcjMwSWlRRC9R?=
 =?utf-8?B?SndVMGxKNEJaaU02bnpja01JTElBZkJtM0k5cGp6TlZjcUtQWUUvQm84Nktj?=
 =?utf-8?B?Ni9iWDJ4MG1oMW5sSllSYVZFQVlrYkluV1U2amtZWk9oRXM2TnVKUFRXSDBL?=
 =?utf-8?B?dmhZZkhGM3AyOGwxYTBXc2U1MTIwN2U0OUlNUE03bnlldHp5UkNlT3paYTU1?=
 =?utf-8?B?ODJHWEd3K3N0cFVaMHF2bDBaeVJzVzZOaFRWQzdUOTJPODBsT3A5VUpqNzFX?=
 =?utf-8?B?N3lwekt2SHVobWN3SUlXcnMwazVWUHhrWkpVaC9SeGF0a05Pb1NGdStwMXYy?=
 =?utf-8?B?YnJFN1BUVWhzSFkrYzZ3eEljQjdyMURaQkduaVk1aUlHU1NVdDVTNUJKY0x5?=
 =?utf-8?B?ZGpwVlk2R2hLeDc4eE1JVXBjNzB3M2grSERvdG5NdUhkUFdGM0JGdE9mQUJ1?=
 =?utf-8?B?VjZEdzMzWURycUxtNnVQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzhnYWMvYi83Z0N3QXplZ09hK3pRQnpWWERmZnpzeEVOTkZvOGpWS3ljU1ho?=
 =?utf-8?B?Si9oeGlGa3IwUDJyVXFZZWVQQkg1b2tCOHZHOE9vcTFPS01MYkpmVjYrMHhi?=
 =?utf-8?B?U29sa1pCUUtPNmpOMFNsZVZpNVYyZ1NjelB3ZkdOUEVmQWRXYnN2WjhqeDZY?=
 =?utf-8?B?ekhrVDFMRTNBYnFxUFlWNW1Ob1RWRGFnSEhVcjBnSWw5VDNSOC9obU5OQWFW?=
 =?utf-8?B?ODRGNzlRbGJYVksyUUJJUXZVNXVJZnhoNURPSjFRbHlYTE9KaHhRQkZYejJJ?=
 =?utf-8?B?NmVzZ1Q0akdJMmpKRFpjbVQ3Y0dsblhUNEpEaWxEZTVORmt5NDJnTCtQc3RN?=
 =?utf-8?B?ai9KQ0ZXcllXZG5Yc0NuZEZZb2RNR3N5d1VQcmh0amZVQWVIWkZwYUZwWk5p?=
 =?utf-8?B?cTlQcnZ3Q2ZKQnMwQUVMZzZUWkdFOGl6bXlmR3drMEhUOUk0dWtVTEhrc2Zk?=
 =?utf-8?B?M0hIVE4wTkp5TnRwOEFpQnh0aWU1eHNqODRLc1dkWGhqbm9pZ3JKeXlPR2Zr?=
 =?utf-8?B?QytaZC9iT2I3cndrcTVBRmhtTE16dHM1QUIxS3gvSllmakdHRCsxQ3p1a3lZ?=
 =?utf-8?B?NEY4Y0xPdVh3VHpObnc1RGxqUEJhVElzTG5mN3BtaEJJRytCYmcrb2prRmVk?=
 =?utf-8?B?aEdnZHc3clhUWHdOa3RVcHFEaWRYTnhTeHpJTmRrK3krbDJVUzB0c0ZHZHJl?=
 =?utf-8?B?WWI4R3ZIQ2NZN3l6SFRXUXBWbjB3OU4wWnJFUUNsZTJTQldsWVJtOGZLRVNB?=
 =?utf-8?B?cjhXY1l1SU5qVjBaQ2RVbks5Y1NPNFBXL2dkVGRJb2tJVENJNWZqVENSTEpx?=
 =?utf-8?B?UjRwYTg5cXl5R1ZQeHpQYTRlMm9vczhWeDcxNTZtdXRWUXZEcWdTR05zMVFR?=
 =?utf-8?B?c09sRTJ6NTdoRTYzc2FMbDRKdXN2djlYV1VETUhUK0tLMFVnQXZhSGNBZ0w1?=
 =?utf-8?B?ZWlyRVcwcGxuQ1VibDZOL2orR0hiMEJhTDBkbUd4bU8walYvR0xMWDlxSHp3?=
 =?utf-8?B?VnFwMDJDWFllemtXc2RlQ1FYQnhPVkxtMWlBVS9QdExzNXpRdGNPTXhuM1Yv?=
 =?utf-8?B?UnhoK2JPRmJrcW5FNkJWL0ZUd2tCbERSSk9CS3paT2tLRUFXYStuMU83UDVR?=
 =?utf-8?B?RGxxNkptQm9RazRqbDVBU0FhREl2emNqL01MRVNOQ2lVc0U0YUV6b0ZWWlRD?=
 =?utf-8?B?RFFUS3lNWVk1SHR3TXlaNlVoNHhrUE1XRDdHK0J2UUxIc0xaZzYyQ1lHSDkv?=
 =?utf-8?B?VUFnWFYzUUhnUkNYSTJRejNDdDlZbmVqdjBXZlZJQlNLYm83NTFuaFlGL0FN?=
 =?utf-8?B?ZmxFRk04SlN0UTh0bkUvcFlWS1UrNzJ5K0d2TjdBQ2VFL0hSbzRtbTVWZHA1?=
 =?utf-8?B?Vi80WXEySFNYVWtBWEljR1hvRWlsQXRnaENEREtOemJETlVEUFc2OE1mdFht?=
 =?utf-8?B?WVdZRTF6WnhlUGprZ2dBSW5CcXIzdzhzQURPTDRIclU5TVVyQmJlZE4yTEJp?=
 =?utf-8?B?UTlHaHBUTW0rbzhaZUREc1p2NjhZR0JuY0VZSGNadS9yMWhwL2RUS3NBVXJm?=
 =?utf-8?B?cmkrN2dKb1pjOFdHM0RwcnJHM3AzL0o1WGFNaXhxcUx0NWttTlpkelIyeVRZ?=
 =?utf-8?B?YjVneThBVUNsMmpkcFoveGFxNFF6bWNnQUhqYk9pd04vYXZxdFJJVS9IcTZV?=
 =?utf-8?B?STFMM2V4Y0JOZThHajQyNW5jUnAxaTlIVTJWNzNSdldTTFVZQ3RiMnFjWDBB?=
 =?utf-8?B?dkloblZEUlkwaXhnRXdBdS8xUmM5ditzK3JQS1p0NzR0dzlWRllsWHE2R2No?=
 =?utf-8?B?SlNPSDF5b210U3Rpd0JESG9reWltdnowbG9PaDhMUDBHWWZvZzgzK3krMHls?=
 =?utf-8?B?b2hVLzgvQ1F4MnZyU1ExMnpiUE5RSEs5a2swaWlVR1BZKzhJcmNpaTZNUVda?=
 =?utf-8?B?d3hiemM1b0RzcDZMZm04dnNEYTUxM0xVWG5ab3BrdklteXJpZHhYaDJHcFVS?=
 =?utf-8?B?ZkJ5c3pTdlZlczBuZ2NvY3Y5NXZaV3JLSXlZLytkQldLRWZpK3Q0QzFISVlz?=
 =?utf-8?B?NUFjRFhyVHRiWmRIWkJYS04wVTRwckpzSkdMTktQMHl6SHNNNVF1eGtuc0U4?=
 =?utf-8?B?dURQMThodTRueEF5NXY1ODhOYWJ2VFJab3ZZUE91TFAxUEpmL2FmMXQraXhW?=
 =?utf-8?Q?O8F9odor9T326IR32A+sVA4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca69fcf2-e0ca-4599-31ca-08dcd6d90ceb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 05:24:49.5730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy9IQWpVekwcfcwHN2VrX5K2+UcjqI+XfVgtoLsRAHn+oPYt0rIgZ6/YTkzb8ZZk556jZBNmm2Y5b6b5ZUEiQDB0t0SYgfg2+36QMcsSTVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8301
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



On 17-09-2024 10:51, Nilawar, Badal wrote:
> 
> 
> On 17-09-2024 10:22, Nilawar, Badal wrote:
>>
>>
>> On 17-09-2024 10:18, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 17-09-2024 00:12, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 13-09-2024 00:46, Himal Prasad Ghimiray wrote:
>>>>> In case of xe_force_wake_put failure caller just calls XE_WARN_ON
>>>>> and continues. Move XE_WARN_ON inside the xe_force_wake_put() and 
>>>>> return
>>>>> void.
>>>>>
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_device.c     |  3 ++-
>>>>>   drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
>>>>>   drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
>>>>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>>>>   drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
>>>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
>>>>>   drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
>>>>>   drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
>>>>>   drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
>>>>>   drivers/gpu/drm/xe/xe_pat.c        | 30 ++++++++++++++ 
>>>>> +---------------
>>>>>   drivers/gpu/drm/xe/xe_query.c      |  2 +-
>>>>>   drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
>>>>>   drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
>>>>>   13 files changed, 59 insertions(+), 65 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>>>>> xe_device.c
>>>>> index 5edb1cf51ea5..cce754801e8d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device 
>>>>> *xe)
>>>>>           drm_dbg(&xe->drm,
>>>>>               "Flat CCS has been disabled in bios, May lead to 
>>>>> performance impact");
>>>>> -    return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    return 0;
>>>>>   }
>>>>>   int xe_device_probe(struct xe_device *xe)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/ 
>>>>> xe/ xe_drm_client.c
>>>>> index 01f643f6aaba..e5defce08281 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>>> @@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer 
>>>>> *p, struct drm_file *file)
>>>>>           fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>>>>>           if (fw_ref != fw) {
>>>>>               hwe = NULL;
>>>>> -            XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +            xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>               break;
>>>>>           }
>>>>>           gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>           break;
>>>>>       }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/ 
>>>>> xe/ xe_force_wake.c
>>>>> index 73d37e79da9c..01b8bfdd748f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> @@ -11,6 +11,7 @@
>>>>>   #include "regs/xe_reg_defs.h"
>>>>>   #include "xe_gt.h"
>>>>>   #include "xe_gt_printk.h"
>>>>> +#include "xe_macros.h"
>>>>>   #include "xe_mmio.h"
>>>>>   #include "xe_sriov.h"
>>>>> @@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct 
>>>>> xe_force_wake *fw,
>>>>>    * and waits for acknowledgment for domain to sleep within 
>>>>> specified timeout.
>>>>>    * Ensure this function is always called with return of 
>>>>> xe_force_wake_get() as
>>>>>    * @domains_mask.
>>>>> - *
>>>>> - * Returns 0 in case of success or non-zero in case of timeout of ack
> 
> Instead of changing doc here, its better to add final doc here itself.
> 
>>>>> + * Warns in case of timeout of ack from domain.
>>>>>    */
>>>>> -int xe_force_wake_put(struct xe_force_wake *fw,
>>>>> -              int domains_mask)
>>>>> +void xe_force_wake_put(struct xe_force_wake *fw,
>>>>> +               int domains_mask)
>>>>>   {
>>>>>       struct xe_gt *gt = fw->gt;
>>>>>       struct xe_force_wake_domain *domain;
>>>>> @@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>>>>        * in error path of individual domains.
>>>>>        */
>>>>>       if (!domains_mask)
>>>>> -        return 0;
>>>>> +        return;
>>>>>       spin_lock_irqsave(&fw->lock, flags);
>>>>>       for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>>>>> @@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>>>>       fw->awake_domains &= ~sleep;
>>>>>       spin_unlock_irqrestore(&fw->lock, flags);
>>>>> -    return ret;
>>>>> +    if (ret)
>>>>> +        XE_WARN_ON("Timedout for domain sleep acknowledgment");
> 
> Move this warn on to patch 2/23.

Sure.

> 
>>>>
>>>> This looks good to me. There is no need to propagate error if domain 
>>>> failed to sleep, warn on is enough. Additionally we should see if fw 
>>>> domain ack bit is not cleared due to PCIe read completion timeout. 
>>>> i.e. if mmio read for fw ack reg returned value 0xFFFFFFFF. This 
>>>> means device is in bad state. In this case should consider putting 
>>>> device in wedged state.
>>>>
>>>
>>>
>>> This seems to be good check to have. On cross verifying, I see 
>>> similar implementation in i915. If you are ok, How about taking this 
>>> as seperate patch ?
>>
>> Yes, i915 has similar implementation. Sure, lets handle it in seperate 
>> patch.
>>
>> Regards,
>> Badal
>>>
>>> BR
>>> Himal
>>>
>>>> Regards,
>>>> Badal
>>>>> +
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/ 
>>>>> xe/ xe_force_wake.h
>>>>> index e17fe316dc3c..c2c729371b2a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>>>>                   struct xe_force_wake *fw);
>>>>>   int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>>>>                      enum xe_force_wake_domains domains);
>>>>> -int xe_force_wake_put(struct xe_force_wake *fw,
>>>>> -              int domains_mask);
>>>>> +void xe_force_wake_put(struct xe_force_wake *fw,
>>>>> +               int domains_mask);
>>>>>   static inline int
>>>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>> index b0126daee359..5f5760b60eac 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>> @@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>>>>        */
>>>>>       gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> -    XE_WARN_ON(err);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
> 
> I recognize the logic behind implementing this change here since it 
> won't disrupt the compilation process. By relocating XE_WARN_ON within 
> force_wake_put, it's more appropriate to introduce this cleanup in 
> respective patches. This particular patch will solely include the 
> alteration of the return type and the documentation.


Thanks for the comment. Will limit this patch to doc addition and 
changing return to void.


> 
> Regards,
> Badal
>>>>>       return 0;
>>>>> @@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>>>>       if (IS_SRIOV_PF(gt_to_xe(gt)))
>>>>>           xe_gt_sriov_pf_init_hw(gt);
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> -    XE_WARN_ON(err);
>>>>> -
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       return 0;
>>>>>   err_force_wake:
>>>>> @@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
>>>>>       if (err)
>>>>>           goto err_out;
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> -    XE_WARN_ON(err);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       xe_pm_runtime_put(gt_to_xe(gt));
>>>>>       xe_gt_info(gt, "reset done\n");
>>>>> @@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
>>>>>       return 0;
>>>>>   err_out:
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       XE_WARN_ON(xe_uc_start(&gt->uc));
>>>>>   err_fail:
>>>>>       xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>>>> @@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>>>>       xe_uc_stop_prepare(&gt->uc);
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   }
>>>>>   int xe_gt_suspend(struct xe_gt *gt)
>>>>> @@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>>       xe_gt_disable_host_l2_vram(gt);
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       xe_gt_dbg(gt, "suspended\n");
>>>>>       return 0;
>>>>> @@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>>   err_msg:
>>>>>       err = -ETIMEDOUT;
>>>>>   err_force_wake:
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>>>>>       return err;
>>>>> @@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>>>>       xe_gt_idle_enable_pg(gt);
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       xe_gt_dbg(gt, "resumed\n");
>>>>>       return 0;
>>>>> @@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>>>>   err_msg:
>>>>>       err = -ETIMEDOUT;
>>>>>   err_force_wake:
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>>>>>       return err;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/ 
>>>>> xe/ xe_gt_debugfs.c
>>>>> index 86146de1d31c..2ecf3c87c6b0 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>>> @@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>>>       struct xe_hw_engine *hwe;
>>>>>       enum xe_hw_engine_id id;
>>>>> -    int fw_ref, err;
>>>>> +    int fw_ref;
>>>>>       xe_pm_runtime_get(xe);
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>> @@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>>       for_each_hw_engine(hwe, gt, id)
>>>>>           xe_hw_engine_print(hwe, p);
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       xe_pm_runtime_put(xe);
>>>>> -    if (err)
>>>>> -        return err;
>>>>>       return 0;
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/ 
>>>>> xe_gt_idle.c
>>>>> index 9af81b07ab7a..1a7ee5681da6 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> @@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>>>>       }
>>>>>       xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle- 
>>>>> >powergate_enable);
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   }
>>>>>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>> @@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>       XE_WARN_ON(!fw_ref);
>>>>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle- 
>>>>> >powergate_enable);
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   }
>>>>>   /**
>>>>> @@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, 
>>>>> struct drm_printer *p)
>>>>>           pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>>>>>           pg_status = xe_mmio_read32(&gt->mmio, 
>>>>> POWERGATE_DOMAIN_STATUS);
>>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       }
>>>>>       if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/ 
>>>>> xe_guc_pc.c
>>>>> index c7a00565216d..27ad412936f7 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> @@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc 
>>>>> *pc, u32 *freq)
>>>>>        */
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>           return -ETIMEDOUT;
>>>>>       }
>>>>> @@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc 
>>>>> *pc, u32 *freq)
>>>>>       *freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>>>>>       *freq = decode_freq(*freq);
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       return 0;
>>>>>   }
>>>>> @@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc 
>>>>> *pc, u32 *freq)
>>>>>       *freq = pc_get_min_freq(pc);
>>>>>   fw:
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   out:
>>>>>       mutex_unlock(&pc->freq_lock);
>>>>>       return ret;
>>>>> @@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc 
>>>>> *pc)
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>           return -ETIMEDOUT;
>>>>>       }
>>>>>       xe_gt_idle_disable_c6(gt);
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       return 0;
>>>>>   }
>>>>> @@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>           return -ETIMEDOUT;
>>>>>       }
>>>>> @@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>>>       ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>>>>>   out:
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       return ret;
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>>>> index 80e5c4ef86ef..8d7d9e7ade51 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_oa.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>>>>> @@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct 
>>>>> xe_oa_stream *stream)
>>>>>       xe_oa_free_oa_buffer(stream);
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>>       xe_pm_runtime_put(stream->oa->xe);
>>>>>       /* Wa_1509372804:pvc: Unset the override of GUCRC mode to 
>>>>> enable rc6 */
>>>>> @@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct 
>>>>> xe_oa_stream *stream,
>>>>>   err_free_oa_buf:
>>>>>       xe_oa_free_oa_buffer(stream);
>>>>>   err_fw_put:
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       xe_pm_runtime_put(stream->oa->xe);
>>>>>       if (stream->override_gucrc)
>>>>>           xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt- 
>>>>> >uc.guc.pc));
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>>>> index 96d5ec1fbbd9..4372dd727e9f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pat.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>>>>> @@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, 
>>>>> const struct xe_pat_table_entry ta
>>>>>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>>   {
>>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>>> -    int i, err, fw_ref;
>>>>> +    int i, fw_ref;
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>       if (!fw_ref)
>>>>> @@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>>                  XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>>>>       }
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   err_fw:
>>>>> -    xe_assert(xe, (fw_ref && !err));
>>>>> +    xe_assert(xe, !fw_ref);
>>>>>   }
>>>>>   static const struct xe_pat_ops xelp_pat_ops = {
>>>>> @@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>>>>>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>>   {
>>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>>> -    int i, err, fw_ref;
>>>>> +    int i, fw_ref;
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>       if (!fw_ref)
>>>>> @@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>>                  XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>>>>       }
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   err_fw:
>>>>> -    xe_assert(xe, (fw_ref && !err));
>>>>> +    xe_assert(xe, !fw_ref);
>>>>>   }
>>>>>   static const struct xe_pat_ops xehp_pat_ops = {
>>>>> @@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>>>>>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>>   {
>>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>>> -    int i, err, fw_ref;
>>>>> +    int i, fw_ref;
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>       if (!fw_ref)
>>>>> @@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>>                  REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>>>>>       }
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   err_fw:
>>>>> -    xe_assert(xe, (fw_ref && !err));
>>>>> +    xe_assert(xe, !fw_ref);
>>>>>   }
>>>>>   static const struct xe_pat_ops xehpc_pat_ops = {
>>>>> @@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>>>>>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>>   {
>>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>>> -    int i, err, fw_ref;
>>>>> +    int i, fw_ref;
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>       if (!fw_ref)
>>>>> @@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>>                  REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>>>>>       }
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   err_fw:
>>>>> -    xe_assert(xe, (fw_ref && !err));
>>>>> +    xe_assert(xe, !fw_ref);
>>>>>   }
>>>>>   /*
>>>>> @@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt 
>>>>> *gt, const struct xe_pat_table_entry
>>>>>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>>   {
>>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>>> -    int i, err, fw_ref;
>>>>> +    int i, fw_ref;
>>>>>       u32 pat;
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>> @@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>>              REG_FIELD_GET(XE2_COH_MODE, pat),
>>>>>              pat);
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>   err_fw:
>>>>> -    xe_assert(xe, (fw_ref && !err));
>>>>> +    xe_assert(xe, !fw_ref);
>>>>>   }
>>>>>   static const struct xe_pat_ops xe2_pat_ops = {
>>>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/ 
>>>>> xe_query.c
>>>>> index 7c866b736f00..df7bdf3822cc 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>>>> @@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
>>>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>>       if (fw_ref != XE_FORCEWAKE_ALL)  {
>>>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>           return -EIO;
>>>>>       }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/ 
>>>>> xe_reg_sr.c
>>>>> index 6ab6a48b1d29..874523f22f56 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>> @@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr 
>>>>> *sr, struct xe_gt *gt)
>>>>>       xa_for_each(&sr->xa, reg, entry)
>>>>>           apply_one_mmio(gt, entry);
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> -    XE_WARN_ON(err);
>>>>> -
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       return;
>>>>>   err_force_wake:
>>>>>       err = -ETIMEDOUT;
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>>>>   }
>>>>> @@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct 
>>>>> xe_hw_engine *hwe)
>>>>>           xe_mmio_write32(&gt->mmio, 
>>>>> RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>>>>>       }
>>>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> -    XE_WARN_ON(err);
>>>>> -
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       return;
>>>>>   err_force_wake:
>>>>>       err = -ETIMEDOUT;
>>>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>       drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/ 
>>>>> xe_vram.c
>>>>> index 3b5256d76d9a..1384c97a75c2 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vram.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>>>>> @@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, 
>>>>> u64 *vram_size,
>>>>>       /* remove the tile offset so we have just the available size */
>>>>>       *vram_size = offset - *tile_offset;
>>>>> -    return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>> +    return 0;
>>>>>   }
>>>>>   static void vram_fini(void *arg)
>>>>
>>
> 
