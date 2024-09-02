Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033DCCD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 14:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C268710E31C;
	Mon,  2 Sep 2024 14:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yb4xJh5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3094C10E31C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287105; x=1756823105;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sfTDRxy2P9wfXonk2A0rafMCs5n8XydmcLWVCHVqpGU=;
 b=Yb4xJh5mobJTbKuBk2l5hkTNe7dKs5WUK80DlSH90Cz7ISFd3QbgBwwQ
 mXepWGjVKx1e0WWbKyk+b+B2Xc/vogpvCGlLKo9OMpKOUGyJqWAkGw5U4
 JaTex2iZqRuLYTXEQgLFay9qbF8iP/fkb3Ngz7F+9tqsAW0glOnG0S034
 +docYjn7NtA9ynz0WQA6mO4ewA2SKGsT0HhRpzNa5+dkVcZSbkqJwvbnu
 bWqiyH2/Ax1DqaqlTZkBFEQXnfnnAxyDMgQjaEDt1exLz6WsHe7/aPNXb
 /zj7TJTLAejz+A2VzBwZHNGpELb6uVcGQ61DOTZ1SkHjuzBGO0nzRoeP1 g==;
X-CSE-ConnectionGUID: 8+mMhKOvQQqVDaSRqpq5JQ==
X-CSE-MsgGUID: 9q47e5THQIaBNcZqAkLvDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="46392953"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="46392953"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:25:04 -0700
X-CSE-ConnectionGUID: URMU+49IRKufP3dTXG2L9Q==
X-CSE-MsgGUID: guTHbHZuRYyR3/xF4E4/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64981293"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 07:25:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 07:25:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 07:25:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 07:25:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qo797bJEv91YfSzHRoY5ZnCOh6jGSc1FOO0aqbao0YdOVqTm76gjsuTXlzK4ApoYvjbN/fmB3ZOis4LQt4rZXJgtLo1RrkbjYYcOnHJgpZoyAG9feVUtqBpa4VAM5THKK6UXTePCBx4WXPw+nsMpNxTBRgysBI3+nluA51F9isDLZwdowQr25FyMygirkKZeD+azKQcD8rFtYekbwFX3UXUS1C47JAMDKwBF7hJUjz0vqUvmPg/MSkkOLQfFKy25JXJgLJrgQK7T+FSh5d5/+USGKj+y1h3Fu4jikLRx1P3b9kIOSUebr3iFU0H+RfL/sie4Sq9Y++dlUng1zn3ntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSywDUQOEuBjbsxzBfp+idaalAIY+GPwVJZ8TJYb8WQ=;
 b=XTZsjBfi9p9paZ8R3ANScB9JOxNHyOkKStoCLoGItGxcLX+kHBUPplSojkEY9EQ3JnZARFByrFHI+8Yg96d8agcgjYzSHltVdO3v7aw1Jok1dXj4Kqz0krr+z4k+GkNnA1CAxRMh1pKSHYtEcXioT+8e8VuzJ1YQpknzwvKI6S3benTojkXKf9D2m39MV/xtdBNObJ7OQGygaR9yKykMQsnMEWh+A2Yl2eA4QjOfgk6h8ZZcAheFrkt6HJqbtIM8BA49N3N51oZfd6pF3IbZP/nmA3s4DQnYp7SVUDTrZoTTQGbrsMZ0GhK6Cxny52QiYrHi47fPSh+XvL5AQbcVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 14:25:00 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%3]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 14:25:00 +0000
Message-ID: <ba2e7fdc-1b13-47ae-8d0d-028d4f444c7f@intel.com>
Date: Mon, 2 Sep 2024 19:54:48 +0530
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules for
 i915/Xe Driver
To: <intel-xe@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
Content-Language: en-US
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
In-Reply-To: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To DM4PR11MB5293.namprd11.prod.outlook.com
 (2603:10b6:5:390::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5293:EE_|SA2PR11MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7964bc-a524-4f68-091a-08dccb5b0739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmdOeWhYNEM5VnJRR2FWeW5NejFEZXdqZTZYN0Q1aGkwRGpMZUdIaHhpdmdF?=
 =?utf-8?B?UXFHZG1NYmRhaFFuemdwMW5semxaOWlKM0M2cnoxMG91T2ZiTHhoQ2hwU2dC?=
 =?utf-8?B?VkE4R3RZVTcyZk02OWlHS1R2TCs5MGFRVGV4K1QwOVl3TTkzbVZLOFRTV0da?=
 =?utf-8?B?YTBudWg0OTdPVGorTTYyWkpKZHZQbVc3cVRhRU1yYmlsWU0zWkhRL2pURUk1?=
 =?utf-8?B?QzErS2diL1A0c2wyQTgvVGF6V2Y2Y2s2WmIyRXdlbnZ6a1FPc1RQNjlhSVZ4?=
 =?utf-8?B?V0htMlBzVE1wdVdSRVFGY3VzSmE1d001NXMvbzUyZGFaTks1c2FhMTBUS3pG?=
 =?utf-8?B?L05WbVVTMU9BaDZ0SHhVSUhIZkhrRFVFamhmVUNqdnN6aDNsWnJXR25mRm1k?=
 =?utf-8?B?dTdKajBOTmVhRUVyUGhFK1BGSVkyZ01TMmZsUnJadVV0bXVUMDdHUVB4WjZs?=
 =?utf-8?B?RE9BWld4MmlhZVBiOTJKQmxpNFA4RlhZdXBEK01kdm1lS29CQWlpanRyYk10?=
 =?utf-8?B?em9NR2tTTXlPVWw5aU1uUjB2NWVYL2NlbnFOZ0VLNE1jNEpHdUFHUzlvMkQw?=
 =?utf-8?B?eFJXUGZvdjdXaXNFMXgrd3FmRm01TUVwYXVQa2hLYVNMWFVDaXpXcC9RQVV5?=
 =?utf-8?B?WDRKWU5mZFBGbkN3U1dKS1Z2VU9veHdJd2VFRFF5cENFL1NYU0lhMjl3cU5T?=
 =?utf-8?B?S09kTUw3bDBMQU9FbFdsS2svSDMwUm5MbUh1Z05xZWJ2ZEFSTEtXa1FBaHFL?=
 =?utf-8?B?RG45TXlwWkEzN2VqWlVTbG1wM2ZHN09HV3ZPRVFYeWhzOUdadzhoQmdRSng5?=
 =?utf-8?B?K2UxNlRUc3FvcGZsY1lhdlZkaWZPUGl2Z1VVQkFYWkN5QkxZZ1U2bEZuWHow?=
 =?utf-8?B?UDNRMTFGcG55dHRLMFlzc1lrVXNvUjFGSGt5ZklJZ0VEM2RLaFpmL2t1cmE1?=
 =?utf-8?B?SlJHa3ZUM2YzQkdFeEVGdEcxcHFvN2lzYVdsRkd0cXBwQkZGRVVvU2dydkp1?=
 =?utf-8?B?LzBhaVZVNW05THp1OEpTSFJxN01vOTdTSi96NEFLNXE4MFo3ZkNIRUNUM1I0?=
 =?utf-8?B?ajhZajQrK0ZWbjAvOXdZWHpQYno1UlRBdzRGWmN4VWl4K2tCZCtWbXVoc3pE?=
 =?utf-8?B?bFF4NkR3NFA2ZnNoTU1YTGhlTDlWdVBsaWNQUW9tUXI1RDFodW1kOXVrSWtH?=
 =?utf-8?B?eDcwZ2pDUXNIaUNNWDFoWmdhMy9JNzVvMlI2M3RtczJ4R1NGQklwQWk0MmhQ?=
 =?utf-8?B?Q0FUR1pFZ3lEL1M5WXhJK3lZWVU0elhJVkp0QnkzYnlxZzJWcUdZbEZ0aU1t?=
 =?utf-8?B?eXM2NDdFSTRlUDdramdGYm5nVkhmeUVIWDhyQmI3UEt2MEFNRWo5aVZ0clJv?=
 =?utf-8?B?eis5ZnhEcUVTaUZndlpHSXNPbkVXYnQxZElaOFZ5UVN5cnFneko2cXczVU9m?=
 =?utf-8?B?bzhCZVRQT09NZFJpbmZwdnFZdEJ5ZEpwM3UxQktJNnQ1MXppMEQ0S3NWaTVQ?=
 =?utf-8?B?VUZ2VGEzNDJjYytuU2JlN0s5ZDV6SDc5SWV6VDVUUmF4TWNwK2dkZnBhYngx?=
 =?utf-8?B?SlI3Zmw2dHprSjI5Mnc4WWswbTRHYmFkd3lrNGJMMGNVM29DMnd1OXlWZmZQ?=
 =?utf-8?B?UkFlc1ROUE15WHVKOFpCcXJnTzlDdmVWZS9uZGMwS2w5VmYzenVwZUtGMW1H?=
 =?utf-8?B?M2ZxaTBxVzlQc0JRZXlXMC9ZbmZEdVVIdHpkNlpIcWk3NEFVdVpFb2NJUXdy?=
 =?utf-8?Q?D+jzLEAi2StYMZexYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2llVWcxeVkvOHJaaWNyMDZ4YTBkUnh6VThEV3Q1VFhaQnd3a3ZqbHkxdnVr?=
 =?utf-8?B?THlFckRqeXBDQkJIcUtnd1ZDdnlMSFBmYytpbm1JV3NwNWo5eEFaYytMVXNa?=
 =?utf-8?B?cm5EZXVscExsaklKL2JTWFVmVTQ4ZG93QWl6bUM4aFNtd2JIT2Y5K3VFRjR0?=
 =?utf-8?B?MW9WUldTWmhuY3k3QzNCNnRRUDRmVHRhZnJjamtrN3hNcVNUaDBGTityRURJ?=
 =?utf-8?B?Z1d0RHJuUWREUmJVYVRIV1M3UzdFcW83dTU3RzQrOGJMUWlZOFBOR1JHUUI2?=
 =?utf-8?B?a1VjNklNZmdCdXg3YithSnF2TVlBMVZ3eCtXeEl5djlVQWpETDR5YlVMbVZv?=
 =?utf-8?B?Y3Jsc3pSSXNpaU5sRGRzakY2VEdlaVI1V3kybEtPOWNkc0wrSXdGTUx3NzBC?=
 =?utf-8?B?blYydTArOUFwU1ROZ29tVWQ2T3F3ak1MTHZtR3l4ZFB6Tkg0czhuSXJyWEZn?=
 =?utf-8?B?WW1VaTNicmh2cDMrRVRFRXQrK3R4UWJPcGRGZlN4WTdDaHN0dUNMK0YyZjZk?=
 =?utf-8?B?NmJWc0xTZnBCcHNtUSs1Wm83SVJiZHpmZmpjd0tHOEJJUjE1SHVINUJWOHpz?=
 =?utf-8?B?RDVrVldQdjh2V3JDV3NJUnpHeWV6MCtQNzNQOVNJNXptTjJwRUI5NGtFTjhu?=
 =?utf-8?B?TVV6c0lkdWd3ZVpycmlkZHJ2SjY1Y3N3OURQR0lmY2kyelk3d2J3Y2I5TjlD?=
 =?utf-8?B?Z2FWZEdCQU9ka3dzc1Q5Rno0YUdTR0NBN3FTb2dId2dXYjByZUdWSUV1ZUNT?=
 =?utf-8?B?YnpWYzRjOUlxOEVaU2R3RWdLc1V4RTZpQ1M1czRudzRrTEozazVyaDZ2RFZw?=
 =?utf-8?B?V29JRmd5djBjbXdtbEFXT0tMNkw1bGNVR2NNWWJsWXNsdERTRURuMHQ0NnBj?=
 =?utf-8?B?RTRXeDE3SGJHK1FTZmswVFdoM1dQYmdNcDZ5RlJ5M3hpTkZXVGlBeFRoWTh2?=
 =?utf-8?B?dEwySStZWkpUdnUvU0tqWXNxcSt1Q1drYkNkRnpGOTY1NVhYSVo4WE9JYjZa?=
 =?utf-8?B?S09DZXBRaGlHT0Zpd2NHc2p4N0pDMmZZUlBIU0prUFBWZ1c2ZkwwdjFIM0I3?=
 =?utf-8?B?R2hua2Y1aTF3K3ZMKzRqSmhRbGdTVHhaMFFERkRkN0J4YXEyU3VYMUdvVE1B?=
 =?utf-8?B?dUg2Z3loQnNqYUk5cE9TbW9VeUJVWGJWNGFkQmRPam5Hc0lZdWJ3ejhJcE04?=
 =?utf-8?B?bWNjUDlGSFZKTWZzMTNmUlh3TUw5SDhOZnYvaXZlQktSYkdHMHZTaWcyVUxN?=
 =?utf-8?B?TEFxVEFBNk1FQ1FHV3hldnRXZWdsU3RHWkNRVVZmOEFiN0hpRm9xbEFhK0Z1?=
 =?utf-8?B?LzJnbGZCOGo2UUhQdTljbENXYTJvdHpJaUVsS2svRnoxemdqVkZLd2ttSXp6?=
 =?utf-8?B?WGlTcWVwNWF3bS9PaUxQU0NXNWdWRnZKWFRLRGIzeEFVeHZoeU9ZTEl5eXpj?=
 =?utf-8?B?cFJwL05xY3JMeWtiOGVid2kvWklkZlVnQ3UwTlJGdUJDZ1RnQ2x5bmVWaWFK?=
 =?utf-8?B?RGYrd3Mza1BhVzJoSUFCSHYyOFVMN3dJZkRKL1pUSU4ybktLL21DZkxMUWpO?=
 =?utf-8?B?ZHNONHdLMWlocFFJSjgva0VETEJkWGRUeHZPeWNYUG5qaG1Tb2U3YmZJRFZr?=
 =?utf-8?B?TC9mT2RhYnhrZFE2YlZ6NXVTN0ltYmJlVnhEUU9uQWE2YTN6R2lZM0VGMXVZ?=
 =?utf-8?B?c2diOHh6L3BPbWFVdVMxdS9WbzMzd1NtNGlnNDNUMXMydzdrZFVGaHAxUDhR?=
 =?utf-8?B?cjNRSTZGUjlCQ2lLYkNnc3FMTUQzVDZkcUZKYUpPZkp2SGJ0TTEyMkJIbURz?=
 =?utf-8?B?M0R6cTBtSU9mZU1KUFgyeHZsV0ovdG1VMC96dzV1elUzWHZCMWZXZ3ZRRWN1?=
 =?utf-8?B?SnIrM0dKVC9Fa25mZ0g3djd6SkJ5cHN5NXFkMVNsbFRNUzJFR0tGTW5mSFFq?=
 =?utf-8?B?cG9nR0Y4Zm5oNVk5Q2xFbWhOK01ZSXV0ZFdNVlpoMVhxbWdpdkU4ZFlYM084?=
 =?utf-8?B?T2J5cnhqdm4wNzgwWHAxU0laNXAzSmM0NitrZEtuaXlJdFkwQXJqdm5FQ0VU?=
 =?utf-8?B?Nk1kTjU0cjNEdU94c0V2TDJqZENIYkJvN280MDZwUy90MWdvV250cW8zTmts?=
 =?utf-8?B?NWpEbnVlSXVFc04rdnE2T0hCTTZsVUE2VVJlN1Z4dHZhWjN6bzB2WW1VUElQ?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7964bc-a524-4f68-091a-08dccb5b0739
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 14:25:00.6870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EK8euX7+sBvhqchz9KFEV8ZuVhpD4tEgXAIuNrCbJvbtZLfY1GfxnT2uNqM9OjxeHUI8TchaXmFxl0ZsZPq57dzIgk9RloGxvW1MuiSBB5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
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

old patch: https://patchwork.freedesktop.org/series/137343/

On 02-09-2024 19:40, Bommu Krishnaiah wrote:
> This update addresses the unload/reload sequence of MEI modules in relation to
> the i915/Xe graphics driver. On platforms where the MEI hardware is integrated
> with the graphics device (e.g., DG2/BMG), the MEI modules depend on the i915/Xe
> driver. Conversely, on newer platforms like CLS, where the MEI hardware is
> separate, this dependency does not exist.
>
> The changes introduced ensure that MEI modules are unloaded and reloaded in the
> correct order based on platform-specific dependencies. This is achieved by adding
> a MODULE_SOFTDEP directive to the i915 and Xe module code.
>
> These changes enhance the robustness of MEI module handling across different hardware
> platforms, ensuring that the i915/Xe driver can be cleanly unloaded and reloaded
> without issues.
>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_module.c | 2 ++
>   drivers/gpu/drm/xe/xe_module.c     | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
> index 65acd7bf75d0..2ad079ad35db 100644
> --- a/drivers/gpu/drm/i915/i915_module.c
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -75,6 +75,8 @@ static const struct {
>   };
>   static int init_progress;
>   
> +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
> +
>   static int __init i915_init(void)
>   {
>   	int err, i;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index bfc3deebdaa2..5633ea1841b7 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -127,6 +127,8 @@ static void xe_call_exit_func(unsigned int i)
>   	init_funcs[i].exit();
>   }
>   
> +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
> +
>   static int __init xe_init(void)
>   {
>   	int err, i;
