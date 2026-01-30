Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65746E6BF2B
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 16:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E72B10EA12;
	Fri, 30 Jan 2026 16:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDiafju7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D4D10EA12
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769790516; x=1801326516;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EEtv3Dtc+vPD5BQ1iEvFXWYbGRZP1XaWnRS/hSaWVRw=;
 b=WDiafju7joKye/fnnMpECNRZ8ABMd01PQesASqTR8QVg0QUTi6TUAZE9
 dwV+0mKaZPrc7fgwSc6iQ95p6a2dptLZHKknOLNwdOuefH9Axh+SCZ2vY
 WmPiJe/WGmLaPCYIPEExDu0mA3DQ3NGxv04mqtj9A73togbU/qFjwmSVx
 GnziS0ZdDnJ1HBER1uDG9lAj/xNnezWZeNxsNIBy8FkZM6Mh+7t2GojUz
 C2EtzCSJ4ddgsvmozvoYiGizt89ssfl+YhcX4IvZlmBiCs7LD04lHVT3D
 ZyS/WUK7OdBAvpA9rf1PpF70Cro0tuWOhqAismW+/ghNmUcM3hwixGFn+ Q==;
X-CSE-ConnectionGUID: ZJdyroMGS3u2zU9ptKNegg==
X-CSE-MsgGUID: 2roxsqiCTG6F9/J0BvCEnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74666060"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="74666060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 08:28:35 -0800
X-CSE-ConnectionGUID: E927gY6XQx26Z3YcVwdRwg==
X-CSE-MsgGUID: sY8RSUEVR3Krsi4Z7D1HDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="231816753"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 08:28:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 08:28:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 08:28:34 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 08:28:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R341245EiOKw/J6eBODC0Ep/RpDmIQQl/oP34cVPnB6mOn07SOzzIvlnuaTBPo48bqr9KDJJ0yPrGOXJC7rxJ3tP7Om3ABezWJx6rEAeSS/gv8L1S8sgObBJhJakM0GAPzaXHMbQdifQZ+2tMhMLQ7y3npkeBMloUG9SXv9G80UCFgMe/2MChE8ZJTBchDGklU6A80my5w6E35hp4ZFtYS0Q+I5fGg+PbwVxNXNp4rdh+mQpT+CNS6joVHWWOg8isWcA6z1eiP+teaA926gnmewezCRPt5EE7AUOloem3YXmORe7dGjfP0FawyxR44c/Mfbd2rObrYaREikueHexoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuiPDj1XHaozBx7CE8bGHZML7KBsOjS7Dso/RmACoGw=;
 b=HNButacmC9FYBwUL2uIyOdKNx5Is3mh1G8ZCshJJzdzKVsoUcdsh2ZZi9gh4NLbMj/EIdXIAPZdB8A1ZgYSWO16NW+3FKRQ+60RN5ux8PNUU2WvmjaXbj0s1KwfG0EV9a4VK/xDnrSUtN2GF5UOYWoeqHl+IXayUMphl1Ti0iRjJ7F4rVoWd63DoeRNsWvLqRp8jr2U47Pfqz/QkkNHjEkPxgVAvJf3ztsPTigB4ZjXGQuKO6GtuY4qqObcJ1IcKwf2t3wqzuavubVyNHccBc6mVdMb7CHoJv4o0/j2wU9vGAZLCdcbf8uh2HLFIAkpoJGErh44TWkRsGGWbQBpvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by PH0PR11MB4918.namprd11.prod.outlook.com (2603:10b6:510:31::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 16:28:32 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 16:28:31 +0000
Message-ID: <bb7e21c8-8fb3-4081-8a64-ddef60bc48ed@intel.com>
Date: Fri, 30 Jan 2026 21:58:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uapi: update used tracking kernel-doc
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Ulisses Furquim <ulisses.furquim@intel.com>
References: <20260130125105.451229-2-matthew.auld@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260130125105.451229-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::13) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|PH0PR11MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5c994d-b571-4e47-4055-08de601c9b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkRaaUJCYStwOVkwSGRDY20vYmsyeUU5N1czd2FKeTNkRWEyU2VKT1I3UDJL?=
 =?utf-8?B?cXQyWWVJdERqRmRhelR6MU5wSXJpTUpWWTBLaE9ZczZnWFBUeUZSYjhUZ3RZ?=
 =?utf-8?B?R2xIdk05STdITFg3MHRnMWQyNHA3S2h2QXY1K1M0UjBiMmJuSE5tRzZWSEkx?=
 =?utf-8?B?bDdBVFZKdnMzOTBhNjNMeWZBTCthTnBUOENaMGNQcG9PaEJRVmFUNTJZbnJz?=
 =?utf-8?B?U21NdDVIblRxS2piYVNjV3ArdklHK3g4d0hDQTQwZWE1djFyZVErY0p3RE9U?=
 =?utf-8?B?LzhsTG5nc0RxMmZYREhUeDdXeXdHN0JvUWNzb3prK2F6a2VnU0tFVlhONzF6?=
 =?utf-8?B?L3I1QWNTN2UweXlERnlPbjVHeU9zcVdMVFRwUmhwazFoNWo5eDkwdko3TytP?=
 =?utf-8?B?cTd6Z3JGdFFMRFJIYnFrMEUrWjR6T0gzc1oxUnhzSkVRakJSN3Q4dDVEeGJS?=
 =?utf-8?B?bkllWmhpMy80Vzh4YXBuMjdDQ1RuOHZJc1ptRkNPSEVnTE0vTVIyYm5DSUxY?=
 =?utf-8?B?Qk1TYlRaOXdHWE00bWJrd1loQ2ppem00NkI5QndadVE4VGk5Q1hkNldvNVFO?=
 =?utf-8?B?TXNqbzV4Z21yM1FJQ050RmNhOU5zMDBJV3JUQ2dHMlA4cXNZRDVySDZ2bHRP?=
 =?utf-8?B?SmVlWHFFUVM1cjk0Nmk2UUxUaGVIRGdlR3JMVzkwNnExK3JPY0NoYjVmVXVv?=
 =?utf-8?B?UXYrS1ZJZU1PRTFINVZYSDJzZDNqVkM3Ui9pZlF1L0pzQm1Cb0IvbFora09t?=
 =?utf-8?B?VjJ0TkJFNFpsc3AwVENLQXdFRlArUzhBTW92ZVBrSXQwWnByRFNRaW15aTJa?=
 =?utf-8?B?ZzN6ejdQdW9ES2FTUnlOTGRjaHdjZjZDWmljK0laamU4eWlRMUxuRmF4cUt1?=
 =?utf-8?B?dFdJYSs3NC95T3R4RENta1BFazZoMm5HM2kxUzJ1aFRhTVUvWlBQYk41akhK?=
 =?utf-8?B?MUtnKzk3ZzhYcmQ5L2tBZzlBazlGQzF6QU1uak9ReHNDT0ZJd1VLYTUwWmt3?=
 =?utf-8?B?ajVmR2hiLzNlWlliY2MwWE9Lank0QWZGSHhPNDJRb3EwTUhpYys4UUFoWnY5?=
 =?utf-8?B?UFprTkEzSDQ5R2hQRHpYcGxhQ0VCcTVtb3hUTGoxSTNCQ2FSMG1aR1ZveGU4?=
 =?utf-8?B?MlhrY1ZWVEtacjRCcFp5VS9kWURDRUFXUmJiM2tQeG5aU2pNKzFleVNpMGY5?=
 =?utf-8?B?d1F3OXBmSXNMc0l5cnRaeDBrVHhPUGpQUTdTVFBIK2VlZXQ1Ry9DRXozZDZW?=
 =?utf-8?B?VW0rTURzbUFaaG9CZXhOeG9TdnJsaVRQNitPYU9kWkFQNWR5SXZwa0U2SHFl?=
 =?utf-8?B?em5qUmlvOE82WGVEOVQyU1YvVTNid3AzeUJzVU5NSVJXK1R5MWxtdXZQTGRI?=
 =?utf-8?B?Q0xmNFRNRFhlZE91dlMwblV5aDdEYnZXZ2RNRnZUMUlhREtBWU53a1RWS0Vq?=
 =?utf-8?B?YUdEbXVMMEw4UkttejlCRUJpSStiaWNMMHFHZ1lPbWFUWjZKYkwwOHNMMDA3?=
 =?utf-8?B?ZTRabkhjYURRSUdPYU1ya2tra1VPZ0VXNU5mWW10MlZiNXVXMGJSenlhMTRz?=
 =?utf-8?B?VEg1SUxCVlM0NWhkdVZ1MTZ5QWlXS2Rlc1J3bkFNSVdtYVV3R1MrS1N2S0E0?=
 =?utf-8?B?cG1wR2o0aFB3MHo0R09JRVl1UTc2em5wYTBKR2RZLzRKSm55d3MvR1hKalRN?=
 =?utf-8?B?YkFRZmIrOUJuN1V4RnlwWUx3TlJYOHFQSysxcFZaQlBycW9NZzBDa2ZqMEVs?=
 =?utf-8?B?NTNidjA1Z0JjYk5OQjZ5RjVENUhnL0hLenJGcDAyNzRNaFloUEJPWlJlM2NY?=
 =?utf-8?B?Z2JBSG16UG5XaWtJTjNKaVJKTEJEcndaSjl1dDBqRWxsNUloSitsRFhPRERi?=
 =?utf-8?B?ZXpMemJrTUhMS1pnVldZTlRqZHNjVDg0OEZQdnVYVEx3Qk9aZGFQaDRNaUlY?=
 =?utf-8?B?RlNnQUwzZUQwQm91dXFPRTkzZTlISmU5bnR5YjFGK3hvS3JPMU5pdkcwUW8y?=
 =?utf-8?B?RUQyMmxhUHUzNENlaFdkZmpTdzFMNnIzaXRLU2NRcFQrYXk4ZkJGdjhGZTFL?=
 =?utf-8?B?OWl6cnpJRS9SSTR3UXdTKzZ6eFBacmlRZEpnMVdqeGd4cC9DVC9sRnRoTEd1?=
 =?utf-8?Q?5F+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2laTDhoaXZtYWEzMXkwMjFTR2pWbSt3VThMUm96VkU1ak5HbHBIVXVvQ0tj?=
 =?utf-8?B?OElNdDR5MFV4WlhwSWNpSW9JU21TWVV1QXI3V04vRnRhamdodSs1enNod1Ew?=
 =?utf-8?B?ZW8wUWpsWkpINEtQbW1sNVQ2NXdkdTNCNnFaYXZiRGVYdkpOSWxhcytHZWhj?=
 =?utf-8?B?MXJDc1JsVGw2TTVKeFpjMHR2eWNuQlFxdnc4VlhQVUp0eFpXUytnQk5wbURK?=
 =?utf-8?B?V2ZiZ2N2L1JscUM0STZoQjdPcWcycGtaN0RmTGZTMWtQTlU5aEFQblIvTDha?=
 =?utf-8?B?b1N6QklnTnFDZm1uU1ZXWmRqZzBIaklKR2ZISUluMDR1S2U4amVYSytJNE1U?=
 =?utf-8?B?VGtJTUVFQVpaQlYrdHNmL2IyVUFhWGNTLzJqTllzMnR4eDA2SXc1R2hqOFcr?=
 =?utf-8?B?VXNhSFU2RWk2S2dDTVR3NWcrQjZoczFOL2NHRFNnYk5OMnFvRktPQnJ4MnBu?=
 =?utf-8?B?SVh1NUp4VjNWdlF5WmpicUpqd1JEcFVwU3dwWisxYTdpbWVvZXBEMU9QeU5V?=
 =?utf-8?B?K01IZER3SnBnMWtNckVOTzFwY0R0TTdpUSs3Zy93SUU0UmVtQTd1VUlJWXBO?=
 =?utf-8?B?dnJCY0JjTi9wdFVQSmJwbkJabTlFMVJSNjlZMzdIVjlKaHp5NCtrckxDcDUv?=
 =?utf-8?B?UldBTGgvOXREOE9KSk8rZnkyMXNTUjRlTGt6cW9CaVRwZG5xcmFoQXR6d28y?=
 =?utf-8?B?SXIzb1FMb2NLWWEyd1pnMnl0aE83LzJQNGIzb09STXpEUGJiMmJHWVB0b1JR?=
 =?utf-8?B?WFduVkpNTHhGSUZ6R1IvNE5SMVZvTVQ3ZW5tdEtYblErTnd4QnVBN3FsYXZm?=
 =?utf-8?B?TXh4ek5jUHN5ZFc4d3JjbFBuOUFrYk9QTE4vVG1LUUR6RndQMzZyRHdUVHVX?=
 =?utf-8?B?dU4vZkpGMjdxYkJDQlQyUWNQc0ZtMUJEN3NTbE5NN0Zqcmg5UE9jQWNKWUp2?=
 =?utf-8?B?NFp1OGtLanBuZ2NXcG56K0V1SnpLbEtndEZIdm9VZXZTK0dKY1FJRW1hU0g4?=
 =?utf-8?B?czhNSzF1M2pIRWI1K0xjNS8yeGFQSkZKRWpEalo2YjQ0M0NnYkI4aGNGYzZr?=
 =?utf-8?B?ZEFQQVVwczBoanhTU21meHM1eFMrcllTTTJVNU8zQU9UVjJaWEV1bFF2M1lK?=
 =?utf-8?B?S01qaVE4WUVFaWE3OUhVVkNJRUNzY0RoWXVxN1l2K0RKci9iU3dOVmhITDEx?=
 =?utf-8?B?YVlYU1ZoRmtsUDZTMzlrK0JMcnFvMnZDNUFHdW9mMkhERWw2Mk5qaFVPOXJi?=
 =?utf-8?B?YnR2bFl6V2JyOUVuV2JHWXJuWkQxU3RUV21PLzlZRUcweEt2c05sbkMwWVU1?=
 =?utf-8?B?ZHM1MEdmZjRpTElvT0lBblhvUDQwSXZ2M2hWZjJSd21rWlo2QklBZjVjdmJk?=
 =?utf-8?B?R2dvTTJCK3ZqaTI2N29HbmFLMVZLWmtaZEU2Z3o5NmNKMWtwamRQcys1Q0Uz?=
 =?utf-8?B?SHJpWnl4Rmc3QjZGYmNvNkRWMVB5aGZBaG1aYVZSU3lpbG1LeTBtb0hvbHhM?=
 =?utf-8?B?VUlBUE5lb1RwL2RnRGMyUDgzem91VkdWangzenJ1d2x6ZHN4UHFTcmlzNVY3?=
 =?utf-8?B?bzRINkhwaWNaOG5DNm5wTUxMNHZtZDZXVzVzZWppUTYycWJuZm1VZ2U0VEhj?=
 =?utf-8?B?TTNVSUdKYXoxc29nZ2JLODAraVpkQ1YySlByRE9MeWVsYy94dUEzY0E3ZUUr?=
 =?utf-8?B?SVlHdzVWUEF2MCsxYUliWVpocldOdmZvZWxZWm9Ha2ZTclIvejkvT2tNNXJJ?=
 =?utf-8?B?VTlJTFRkNWtVWVZQN2tCdUZCdHQwcEYzR3FMOTdsL3pyejRISGEwUHB1cmpQ?=
 =?utf-8?B?NnVhSGF4dFpTbmFGVnNwVTd5Rlo0MFdUWmR0VDk5MTM3Nmtrd00vODkrbUJP?=
 =?utf-8?B?ZFFsOFVzYU41aHRUK1IxSjNIVUw5QTd2VHc5MnI0OFFtdmVraDkxOW1Cb2tP?=
 =?utf-8?B?c2wzaGFzTHRrV2duRk80QnJaUWpzT09NRVIvdVc5dVQ1a3YzMkpITE5BcnlE?=
 =?utf-8?B?bjB3QWNwdU9zeEs1NURXeGNzcXF1dFdGcnFUYzRGajZ2U0xJcWY1QWNZcmpa?=
 =?utf-8?B?L3JaYTNFM016Z0NmbitQZWllU1J1SXR0OERoUWNjZ0x0M1dVNG5Uci9kbndr?=
 =?utf-8?B?a3paSXN1ZDhHQzEySDFrVDcwUlgvRHg0d2luWlMxYXVMMkRhajhqQjZNL2g1?=
 =?utf-8?B?ajJ6eUo3MHdDRnVPSnRGSDYzTTg1TTM2VE56V1JlbEx0MkJzSGlsZXNIMzdj?=
 =?utf-8?B?RjFsSEJES0hPODB1MGpYYkhYRHJ4alRvWFM5elFZTjA5SzFaOWhDMUdYMmJZ?=
 =?utf-8?B?RmQzd3d2QW1iMDVXM3UyRWZuWGxweHZKUGx2OS9iLzgvdURjN09zeXcxc2pk?=
 =?utf-8?Q?l4f8afbCMnbJ3quA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5c994d-b571-4e47-4055-08de601c9b4e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 16:28:31.8070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc2Uu89xg9P9WE8f1FLrtGjf5Ace1vScUZ4kev3iBaWTPLuEpdxS2a+7VXPsuH0cglXSVprpQZSNw47uWa+0S14GZb1mafvI4uu0LbmNvOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4918
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


On 30-01-2026 18:21, Matthew Auld wrote:
> In commit 4d0b035fd6da ("drm/xe/uapi: loosen used tracking restriction")
> we dropped the CAP_PERMON restriction but missed updating the
> corresponding kernel-doc. Fix that.
>
> v2 (Sanjay):
>    - Don't drop the note around the extra cpu_visible_used expectations.
>
> Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
> Fixes: 4d0b035fd6da ("drm/xe/uapi: loosen used tracking restriction")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Reviewed-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

LGTM

> ---
>   include/uapi/drm/xe_drm.h | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 077e66a682e2..c9e70f78e723 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -335,10 +335,6 @@ struct drm_xe_mem_region {
>   	__u64 total_size;
>   	/**
>   	 * @used: Estimate of the memory used in bytes for this region.
> -	 *
> -	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
> -	 * accounting.  Without this the value here will always equal
> -	 * zero.
>   	 */
>   	__u64 used;
>   	/**
> @@ -363,9 +359,7 @@ struct drm_xe_mem_region {
>   	 * @cpu_visible_used: Estimate of CPU visible memory used, in
>   	 * bytes.
>   	 *
> -	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
> -	 * accounting. Without this the value here will always equal
> -	 * zero.  Note this is only currently tracked for
> +	 * Note this is only currently tracked for
>   	 * DRM_XE_MEM_REGION_CLASS_VRAM regions (for other types the value
>   	 * here will always be zero).
>   	 */
