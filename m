Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A043ACAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 17:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5496610E18F;
	Mon,  6 Oct 2025 17:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvOKEvyW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB77B10E18F
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759772188; x=1791308188;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ylfDJrESJBFlUQOxSZc8cSVXzVhrsAcJN+dWeCiVQY0=;
 b=IvOKEvyWq/g2NclIeipkZtwqtaA08VzuK2JSdjT7aMLS24+4+b0XSviw
 HbhLxC5Jna0SFO/4vUGeFUQSP8T7sldlVyEe8dpMsu1IMx6RZnvJJhRzj
 L5oO/Gvh9MzDeM/YsH8lknpfI+9Y0ExCevyOP4zwC7UajX7vexdzqiIZZ
 ojFxOEo/zp81R74Alv8FF1q898OqRpi+lciL9jbKB0Mrm8qc2wrvy7ujl
 7pLToZrfncj1UgyDL3uxxy3t04lTDysGceN6heIMfOQ9/iX1hVqne+tNK
 OV+Lp/sRxoIoOttq4lTSFW52clCFqaVwib1xYu8yEPigXgQenjQwizKRs w==;
X-CSE-ConnectionGUID: uzz+7sZ9SWmUefj+BhGntA==
X-CSE-MsgGUID: GszH1CypQ56Hw1ZRMWf2rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="79600786"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="79600786"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 10:36:27 -0700
X-CSE-ConnectionGUID: dj9/aesTSoqA4HK0jdNj8w==
X-CSE-MsgGUID: NDIdK08uRNm9qapqZyPHpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185214470"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 10:36:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 10:36:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 10:36:25 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 10:36:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeRa9Uzux1BZi1R5ZthwxVvr44XnuoL+zFKcEsvku12Dk5L8WTM9+GgpWCraNd8/dzNM9TZ/tEuKMdBI0svuEwaidC9vPLpglsUtoMSD46JkHfojiMS9KZCYjnrkmWbvbCArB7+ykzDHSVEbVrwzD77K9Xdy0oK4BKTpDsvVwudmugLMztjRBC8YB8ePEB4ukUxUnv+zV3+1mxkK9RBiQbfWEzPWLdlVCpKvIhDb5aRwzx8G6kn5BIbZDqItp/1+jrPJfSeUOiDB3Fg2+B0sKPPTbw5X7K+Rd5uR1Cz4UBxccioVKMq6T9ZSk5ZbeYgrIPqrk0HQs3Gz21v2NvABDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg1KF0tco9o36fRnjLJ0LbUHcRfR1Y0Ayjdw6DNbfY0=;
 b=kSmBHBEN/6O4zqcheM6FzS+hAeFDYiMvbEJvKH2UXcbzzgXqECcWD/q1hr64eyBOLnKSxOf1bm6P9Awxc1R0g6q2c6d4JbczwcaDpR4jJ4uQYCDkBV9O95VMEzh9nrfcX7kq+aJptteZXtLXU056eVLO0BonDWt8ZN6oUVJoAtrqRemw0KS7nh9p9gmss8u8IqkJG78mySC9M8CvGSE8CGe9BUkDJIIxyi4Js+wnTPd9qxtlMIvqLnGUESMm+BRM7RldKrHchkyNYW3QUspM6e2MVNLjpqRLvxo8RK/zeh/1irUCIITo6c5NI9WuXhpAmBcg3OmYLCM2X28rhE2Hcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 17:36:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 17:36:19 +0000
Message-ID: <0225b5af-481b-47ee-bd68-1e88f0b4569a@intel.com>
Date: Mon, 6 Oct 2025 19:36:16 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Improve_reading_VF_config_blob_from_debugfs?=
To: <intel-xe@lists.freedesktop.org>
References: <20251004162036.1800-1-michal.wajdeczko@intel.com>
 <175960430071.5798.10186927488506032335@6aec98b87f92>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175960430071.5798.10186927488506032335@6aec98b87f92>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 043dc170-0a47-4a30-de72-08de04fedbe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUFEbFV5U0tzcHloWnphZ0VtWklLUzYyZ0FJWThEbjBIL1laeGhneFVlNTl0?=
 =?utf-8?B?VGx1bEd4c2tkVEZzcmNyN2hVK08vSkdoTG90YWUwTmFEZ09XTC90Ukp3OHRo?=
 =?utf-8?B?S1R1MnY1OHl6MmxoYWZZWHEvcGRsUUVTcFZTd1RWbDhYYzY2cXVQYXgwMXVE?=
 =?utf-8?B?UGQxc1I1UGdZOGRBL2hOa2lUK3dkVVE2elhYRFNaNi83S0J2RGpFd2hwcGZt?=
 =?utf-8?B?ekRFVDNPekVXYmd4UVVKUzhMNElyMGoybGZ0SUx3dzB3eXBRMEQ0eXNiQVQ4?=
 =?utf-8?B?V1hwS2U5OXJwR0hvVVlXd3V3OVk3Z0pKeFFRcENTdVZRS05vMzN1Z3ZBMFFL?=
 =?utf-8?B?NjdFZEZIV0drOW9VeUtzUzU2V3R0Tmo0Tyt6bld3eTZQT3N5RTZGUUh0YktM?=
 =?utf-8?B?UE5jczFQRFp5U1pNcElLVjBuZ0tRbURtSEFMVFVGcjNiUktwVWtTNlc5ZXk4?=
 =?utf-8?B?NXlBTkxRY3VpQ3FMUkhDS0M4S0I2bm94QzE4ZEtsYjdEZ2JBanN2V21NWkl1?=
 =?utf-8?B?WlFuZWV5NS9tUnlRQktYUUF1ZXVBTXRFRm9vUFM5eDVDRnRZa29EeTNoWDhs?=
 =?utf-8?B?ZE85a1B2QzBWYWhlUDZ5OVg2WHdaYTQycEtQalB1YnFTYllCSk4wMnN2VWwy?=
 =?utf-8?B?eXAyTjJaMll6b1owK0x4UGdBK2FzcHlaaStwbzJlb1h0dXpTNzNzQnM2NlNC?=
 =?utf-8?B?Rk4va1U3WW1MRFFNVDZhRVVXby9TQ0VCUlRvWmE5UEdoVklGdUd4Q1pNWDN6?=
 =?utf-8?B?Z0VyelUzOGQ5WFJWQ2sxVjhRczI1YkdhTnNSbDdTUlo4Z2xocmErYzdtZzkv?=
 =?utf-8?B?RHIvYjB4Y2prcU9Wb0hrZzdUVldEWkNqWDlpUE9PTS9vZE9MN0hEd3hpU1hx?=
 =?utf-8?B?Rkg4bmFTeFlwcVlSaWd2dFpRek1YNDRxYW5yZ05YT2FmUWdCajFtMnBCVHBm?=
 =?utf-8?B?Tlp4R1p0QXpPVGNMMjhTOUdnTm5jM0FBTjU2U1k3S3gxSmFtMnhOc1lwMXBV?=
 =?utf-8?B?ZVVXQ3dCZUJud3F1b09rYmhralliajExbW15NzJyOXFGejAvL1dha0dILzdr?=
 =?utf-8?B?QnJnNEphK3pFa1AwdjI2Z3RVYzd4RldDTGFiVHFCQWhLUHNnOU5vUEMyb2J4?=
 =?utf-8?B?QUg0bm0xdVc5ZDU1cXkzSjFZeXpUaC94YkpQa2hINWRoYVZQUmJicW1YRW16?=
 =?utf-8?B?UjNFVHFZTzVoQk8xL3puOUtYbW1Fc3BUS1oyajFicmRtNnZxS2JSZkdkN3Ni?=
 =?utf-8?B?ZS9wdzJSWDRXN2U1NWRJV0pIWGY1ZWVzQUdqRGdVQmRXYlRZMWt3WlVvOE5Q?=
 =?utf-8?B?L0RRNUpsYUt2MnRGcVJQc0RuQ0paeDE5K2pRNHUrWlhkUkRpWmQxWFN2VjFC?=
 =?utf-8?B?YiticEJKSTh1cGFENlVhNXNNZloydHZhN1pCT3A2MUVDbStuNGxOUjR3dldh?=
 =?utf-8?B?blU4WVdKckFvdUZPb25wWlkxeC9EbnYzTHNSbjMzcG9hZXZIbmZhaDZiNVgy?=
 =?utf-8?B?ZDEzZUtsOFNoZklUSGJJR3JVdFh1alVLZkV6VVplZmU5cG5GeEpiSXpmdVNY?=
 =?utf-8?B?ZzZXNW16TkpJcnYvTFh1UHFObGE2THJ5NU8zajliYW5hb2RuclFCK3pJMUdK?=
 =?utf-8?B?N2l1bnUrcUtNZTF4emNRQVZGekppTnZYdnFRRjJmcHdWa0l0aUxYbmZHTkdH?=
 =?utf-8?B?ZGtsekxOcDVoRk5TTjBZNFZiT1NUbTAzbmoxbzNtWXlPQmlsaUpNSGhFbjVo?=
 =?utf-8?B?Z1U3RHAwZEVPYlRHVHROenY2TXE4aGNuZTRWem5tUVhMeER2akJZVWVqeUhN?=
 =?utf-8?B?WE9LK2swN2k4SWYramxmY00yTUthc1dyKy96eEtoS3BSY0g3MCtDdEJkQVgz?=
 =?utf-8?B?Ykl4OHNtNVMzNFphU1RDUlQ5UExkUHovb21aNWRCZitIN1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEgzRVJ3VGJSR2VhZm4vTlhmbWFoTzNialYwVW5ObENUZHFDaWNoSmN2dHYw?=
 =?utf-8?B?b3pDQ1pZOVpWNnBYRDR4U3JVYlEzdjZyUGIvWmVBOEV4T2hHbEdPUzhJOEw5?=
 =?utf-8?B?S1Q0dHliZzJQcWdwUkhFaXg4Q3dkeWFRUXlIb3p4NGlYWExsTElGaGthbDY2?=
 =?utf-8?B?K29JZFFCNHRvUXlMOXRZN0F0TnhINTkvLzRndFRES0p5VXF0bjk2a3JsVVYr?=
 =?utf-8?B?QnhWVmNJSVZkMEJJdVA1eFIwNnFxbDVFK3ZlVlhIS2VheFYxU2tNa0NnOGND?=
 =?utf-8?B?Q0NSTDV3eGIxdGU1VU43UG03VUh5WmRHd1dGeCtGdnE2KzIyWks3cm9JUWxw?=
 =?utf-8?B?WFY5Njk3SGZZUzh0bG9CTDRKTi92b3d2VW10R0EyWDduLzFORkt1VmthK3JF?=
 =?utf-8?B?Kzd3WVhFeE84ZkV5VGN1OFk0dnpqYUw1WWZ4M2U4L1BCbWFGMGV5NjdJWFNo?=
 =?utf-8?B?VHdvV1dDL3ZHY0g4ZUVnZVFSaDN3Q0UxS1ZoUjg0cWZtSkwxQXAvdnhqdjdP?=
 =?utf-8?B?WlI1UW5oT3B5TE91aXdQYmloaHg2VDN5THBFMHgybitFOXpsblA0K3hyNUk5?=
 =?utf-8?B?OGVORjlZZm4vaWlReXNRZi9nTVY4L2RGQzRYditvbnlETnE0amZ2cjhFY0cx?=
 =?utf-8?B?YlFJcVlZUEUrRGVEVHIxNEJuaS9jZU0xakVVUDdBR0FZQUw0WGpBTFFxUUhK?=
 =?utf-8?B?ZkxNY0xXd0Q4UFVJV2tTYXUwWGtURXB6RUozbUFNb0VlT0phUnlDZEJ4V3JM?=
 =?utf-8?B?QXlPc3lhbThyY1ZIMlU5ejBMTllCQzNXb2pEenZiWEVtZU04RE1pMnljQzRp?=
 =?utf-8?B?d3JITEZBVFRocXV5UGVRK05TWklvUGd4Kzh3Z2NWSnBIMXB2NjNPaGVmQkNT?=
 =?utf-8?B?cmp1cVR1VjVkQVpDbHN1SkhZUVBxVmkrVE5MZ1BHbTgybnd1M0w1c2p5eXVo?=
 =?utf-8?B?VnVwTTJKZjBoa3ZvazlOKzFaNkZoNXkyNjAxa0xYejc5Szg3Q1ZnMk5DUUY1?=
 =?utf-8?B?bGdXc3NoZytWRCt0Q0ZtTktaOGpYSDI5OWNWWUpuZzE2MjFIREk5Q3pFTGVP?=
 =?utf-8?B?NDBBMW5tMy94NEk0SWlHcUJCSnlES2UyMzJJTExDNXNhYmd3ZHIrWXhkejRD?=
 =?utf-8?B?d3FPaithOFN5WEFnNmpDcDlBcUxpK1Avd1AvZmFjQmNMN29YZVA1SURYSHla?=
 =?utf-8?B?NW5hQmNGT2dlV3NwRkU5c2FSYTdWSDNkMVlZbWRwMWF0VFJPdmxsRFRablJu?=
 =?utf-8?B?TDdOVE5MMVRkTmJxSDVZaTVad3UrR0h0ODVpRHVFdldMV1RBYksrNjkyaXRZ?=
 =?utf-8?B?K1FMaGNPaEpQNWk3YmVlNVBGM1FUYVpoYlN5eXlEbW5YVFJKRVVBT0hPLy80?=
 =?utf-8?B?ZHhMczZsVFJqTmJTc3RvSjFmWU4wM3RCNjNZWHI3VkljZHVpbndIbFlFUDlV?=
 =?utf-8?B?SklrTERMMk4vZGdCYndZV0s5QTg0Tnh4bE9KNm10RzdLQ0I0Y1pEMUlIcmYy?=
 =?utf-8?B?T2lPL1pDVzhUc3dCWEY4WFRvRDlHTHpBK0JPSVg5QW9yRmxjY1FLRjhHRURO?=
 =?utf-8?B?MG1qaEVLcE5IVTJ6Y3l5eDAzdzhoNW5jYTJNMExYeWY2VDBvc1ZRb01pcERV?=
 =?utf-8?B?bEZaQ2tyZkdHTXJnMXRWMlY4eG5uYWFsbHh1M29lYTFsN05XeG9wdllmRTBw?=
 =?utf-8?B?OS9IaVI0MnFFdlhxczloYmpHTWxHQmV2UlcxSzJKZEtNU0V4L3FMcGJLQ3I3?=
 =?utf-8?B?UHd1emhLbGcvTjVHMkYrcUxJNS81Qjk0N2dFNXZjS2d5a1ptYmdWTVYrSUxl?=
 =?utf-8?B?VHV5bEIzNDZiNHhwaENzQ2pGdUlCbGpOdDRoSXJNdnFEU2dSTzBQTlh6KzJH?=
 =?utf-8?B?bkJGTlM3UVFWM3drVnk2aGJWcGhCSmh2bjZDU21YOGhHNlp6YVR4L212VUhT?=
 =?utf-8?B?Z0NLN3d6cG1ZSDdIQ0lTa2FPT09xZC9wVTNld0tmM0VEaTRWVFc2Q0NiTGZz?=
 =?utf-8?B?cERMNmZ3RGhkcUl6K1I5dC9nMU9DUGc2SmovTWNGVWxMNlFBalJxYjVnQ3oy?=
 =?utf-8?B?eVpiOG5XbmxqMjhrblh4QkhoR2c3YnhnK2xjWWRkQTcwTjNHaWV1cDJTRm5y?=
 =?utf-8?B?aitFTkdnYVhxRmZvbGdnNkt6MWlZTWZWTXkvbUxZcEFkVlRYUjhFeEE1UEhR?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 043dc170-0a47-4a30-de72-08de04fedbe1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 17:36:19.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPckBUsb2BmJwdfc4B5YfBRvIWHhfdGgj774IizvpsQ+6+vDdPaEBMM7RC6tZWMkmBJLg7E0dNHWs5ROca21b7nRrMGJdIrLM2PJe6+3dTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
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



On 10/4/2025 8:58 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Improve reading VF config blob from debugfs
> *URL:*	https://patchwork.freedesktop.org/series/155416/ <https://patchwork.freedesktop.org/series/155416/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155416v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155416v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47_FULL -> xe-pw-155416v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-155416v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-155416v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-155416v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_pm_rpm@legacy-planes:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-435/igt@kms_pm_rpm@legacy-planes.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155416v1/shard-dg2-435/igt@kms_pm_rpm@legacy-planes.html> +15 other tests skip
>   *
> 
>     igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-4/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155416v1/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html> +1 other test dmesg-warn

unrelated

<4> [251.875848] xe 0000:00:02.0: [drm] Tile0: GT1: GuC load: excessive init time: 542ms! [status = 0x8002F034]
<4> [251.875908] xe 0000:00:02.0: [drm] Tile0: GT1: GuC load: excessive init time: [freq = 100MHz (req = 800MHz), before = 100MHz, perf_limit_reasons = 0x9C009000]



