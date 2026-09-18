Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD5DC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 16:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D939110E09B;
	Fri, 18 Sep 2026 16:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdl6wLBl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5763410E09B
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789748609; x=1821284609;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JWptcu0YM514cL7+oJqI3HGSC9EVYkM/YrbkqG+mFVI=;
 b=mdl6wLBlbavFr9B4CR7AA1iQtdzjlLZewY8nPdR/qxDukm54ovdyAKbm
 tS5gHks6vssHfyWpecgyBHobqWvNcd9VOAd77iPEPKKuEj1povNd5tfUH
 cPJnbQu965yvcPabk7NYUOLsHdejUd2+U+K6XW9cE7tNAsuoSk6AaZCBS
 Bg4Fe5jlwSttACJmUdLYWrcE/YVd32m7zVw75u2jgysk0QeiY4PMZIE9R
 zvR04f/uWTsxybyZnbgBThlEgOPwYolgU+c76gZB3D6GzNNJhq//+JICk
 7Ujhtbbu97fARgtKPduE5opC2kr9BoRWq18oV4w+5sNp9CBI52kOuGchq Q==;
X-CSE-ConnectionGUID: AdaxmTksRlyyKIKgs6Namw==
X-CSE-MsgGUID: 8hy9XouFR2WB2uEZcHYh3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="773953"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="773953"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 09:23:28 -0700
X-CSE-ConnectionGUID: b+K6FKeLQ36m2gi9Dr4mBA==
X-CSE-MsgGUID: gSZAKh4WQdOBzBy3hblNDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2705816"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 09:23:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:23:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 09:23:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teHA226baSjii3kaGiuxwQFiy4YMhDy97Wo0FMRgrU43wgOXDAUcu8f38dwzab5WSAbOaKVKI3q0FQHTI6L5pTj/PXxcz59hDfrS9yW3zy+v5p7dJDyywjKtyNA5Nkrt5iHK4rNinHJVmMWni//dSuuv1X+kE++O9NiJ6ee3sMsunngkM6VBx/oDpE/bm/25iwKN8KrrlTP1dWu3neYzeNDH1rZNYhRQsxr0dEVSF/t2fV9VmIrY5zyCQMZ9qHFVcYow35ZGd3c1C81fi3V8+eqcnAKj7V1hao3Jdw7Z17+RT+nkOKiVQeikIP5VjadsLkUke1VAsDnNRCs6gQ/4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOXouL9dkuhSQGzpEMvNoO+jut09LlxG9PrOatjmAI0=;
 b=XePJX8iYpc3H0s3/IrxfAysgdNbfKNs0/iOOKIjnXYXMxFRBp9ua95EZ52c5Qzw5G/oZlo2R0MJ6sXdM0q8pNn0LKSc3pNww8hyVbX4DWSdHdMW7KBVFLFfHjIARLj2NRYZbKWUFJ260GjkVNng+A5lcdARyYzHmXPI53P3RA6uB2yCUPqc6cnoPUWMdlKQxNWyxeGVXY8zqvv2DdX1vnN0FFGcIFGMFN61imK8N2TQ95gT7otK0L4utcUtZ6TF9jE/dgNtxy/LAfb3Srz5iIrCZj4VI2Kpgwrau5Q1ePdFf0rUqp7+7XW4tUBSmzcpsaO1H/vH2AF5eWe4rpBFWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW4PR11MB6863.namprd11.prod.outlook.com
 (2603:10b6:303:222::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:23:24 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:23:24 +0000
Message-ID: <e10fc1bf-2dbd-44c4-8b5d-81b7e5877513@intel.com>
Date: Fri, 18 Sep 2026 21:53:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Demote uncorrectable local error log to
 info
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>,
 <zhanjun.dong@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20260917135310.3590412-2-varun.gupta@intel.com>
 <f49686d7-826d-4715-b04f-8818d6efc8d9@intel.com> <aq1MOCcJoTYCMToP@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aq1MOCcJoTYCMToP@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0295.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 20665e44-ef38-4384-1ca0-08df15a12984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|4143699003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 1X0ufHgOtukPLIkAihbvPDkPhxqJdbDsoo4zE5OoAwIG8E82SpMKfiFpKa4F5claWPChgb3TQfS/xbTBoHq8UvTM/RpK5I1BoqtnTW8EN80mQUxBnUY583jd973o4HcTS235WOToMJt5Xp6cvWnuGPSg/EBn+WCIKiIKutWcH7eRdZpcvw5YpRrsFn8umBOiOPR6uEmLjwhD5NM/47UrQX7xR1s/xySJJgKg/mSDdNNh1dDumfPK9/B3DMScRsu1K8TVtU3TAixHVvC3SLeBTBV25Qb9f+rEtJ4FrEkpE88dIhWlRYMOPpYhsgYOKq2epMXipvwDqMbCOrhqiKhyKqaBitfeOzYjMkd2k2he6q1iMN46pNfoZuQxjbub8TFn7rX67b/fVeVlVy4y3V3KHUgAGWZOavvyykTS8TytURm6+fgp4A8U3hK/1uQtTgomGAi2sUUS8Ih56HNhggLLEcRrnq80Pd4zJMCJ0gCiNbmQnoeBVr89sj5kGfMt7tPKHW4nZCwqfdml4awEufKzvSSuxvrQTgNV9bcPdFdAi4/+BkIL6mKCU9JYx3hgMCa48Q+hAH4/EqOxyqlwls8RDh86GSYjzZaWnEPFcu1C0uR5aBP5AB1wrsMFMcj51tdmwlx11D3aLfgorjoWYQzf6aDHP0CiGcQiLkjrbgDZfbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1owSG5HUWR1S1pGQzBlWUd2aHpFQSt3WVJocXBsSGlqQUZFajhwQzVwejNa?=
 =?utf-8?B?ODBwSW1raW1laVhsS2JZS3V1bWhYREszcjkrYUxsMTBMejRCU1pqTU1oMkxj?=
 =?utf-8?B?T2VjRk9mdEkxNWVuUnUvWjVOdnI1KzZ2ZGtpaENrV2lia0xtRTg5RXlsay8x?=
 =?utf-8?B?ckk2Um8yWVNKdTB1aTMvM1hObHlhOHdEWVFDQWF2Mll3QzBhU0twV3lTSGdF?=
 =?utf-8?B?aVRYaHNFNGUyaUpydkNOcmZQVmY3VHdKTnV4aUxwbDZvWTZvWkZ4VEVwdlBq?=
 =?utf-8?B?clUxaEZGNVo0d2M3RGhhNFhkVUh4R3NjcllEWnQ0RXdmTmQ1c0c0MWRCbGQw?=
 =?utf-8?B?cGFXTzNpOXpRVEhaVVlyV0M2SHVKMVBxWXZhZXhNSmdJOXJxd2QzcXdwV01u?=
 =?utf-8?B?eU5MRFlPT09YSzBtWW9qNjRFV0JOd0Y0ZEx4SndiTWpsMzBrK3VYRUZTSUQ5?=
 =?utf-8?B?SisyaUc4b3VzeG5FY0RGanhucXEzc1VEdDRmSElnRkJyYjRmN2V4YWtyTUtV?=
 =?utf-8?B?Mnh2RGg5YmFpaVNqTHpkRXhCT292SkpBY2VONTlqcEZuQ05UeFl3dnJWVUdl?=
 =?utf-8?B?MVdaL1pyQ0lobWlseWE1bytKWmwxUVVRYi9qMk9tUkpWV0pNUzVYNloxczhO?=
 =?utf-8?B?WmxHZzAxK0g1YlpiMTcrZ1FFejRXRm9XWHRVWERpaWRZTHEveW5kdEQ2K3ds?=
 =?utf-8?B?b2l6dXpobVM3K2VNVFJ1eE0yV2EycVZEWElwNFdQYnVhNGQ4QW92SEs4SmNE?=
 =?utf-8?B?Ymk2M2MvTFpGd2dwSVp0b0hPYmhaMEY4MGU3UjJEUTh1dG9qSnBKN1d4ZUFk?=
 =?utf-8?B?a2F6Y1NCOXJtMkgwQVhHVzVTdXRMVHF0SHdudndTcEV4M0RPNnQ5NHY5dXQv?=
 =?utf-8?B?VHJSTHhYd0YxMVdJNldBc1VJMEFJSzNlc3U3QklZZnNpODJ0emUvQWM1d3Vj?=
 =?utf-8?B?L0l3YnVQZFVkU2JuaS9YT0x2ZmRRYUhVc2V1SnMySGxUeFpKV1ZQdTMvZlBz?=
 =?utf-8?B?Z2RYQy9FVW4yWXZqdnFaN2sxNnk5ZXc3TFA0WVFTZUczRDIvb2Y3aE92Y2tn?=
 =?utf-8?B?QXJXMDk0cG9SZEh4R1N2dzdKQWgybHRxcXFhSWRkU1pVV1hCZktyOE02cnlt?=
 =?utf-8?B?WGg5bHVrYlFrSGNXdEpRWngzVEprMHZpVnBZdTZZbkpYWkpTY05wREd6N3k3?=
 =?utf-8?B?TkpWeTIxZFRaS3pMYnlkTjhjMnUwbklpekxsMW9tNEN5Y3AwRy9RUCsvL1VH?=
 =?utf-8?B?SXRNK3IvYmhPekJjanhQZ1NsdDZ3dmRLNDV3NE9QU2JITElrMmc1bGdDUVd4?=
 =?utf-8?B?dEt2enlhTjF1SU5RK3NtNFg4TThodk5FVG9heW5jOXR4MVV0UzJFU0NNU2Ft?=
 =?utf-8?B?dHJjWTY0YjVERC8vQzJaOGY4bDFHSmVndmFmUXhVSWowOVZxMmtzaE5jeUVI?=
 =?utf-8?B?dHdZN3VRTGhQdGdaMUxCVjNKSSsrcjlGbTVNaWhWNng0NTBWS2dGcy9FRDI1?=
 =?utf-8?B?ZHNDYU9neXhrZ2pYbTBKbStrWkNBQjNrT2JjU0RnTXU1MWx2S3BaT21oUWJt?=
 =?utf-8?B?Z2Raa0Z3eTFWTERPbkRZZlJxdWNac2ZmUFpJaDYrUXo5ZTZrQ2lVV0drN0Vi?=
 =?utf-8?B?QnFEQVo5Nk15SnFHMDVBQjRaWmpkamsrbmZ3OG9UdWxsTllBOXduRi9LWGR6?=
 =?utf-8?B?cWtaMWRiVFZjY1pleWJsa2llaTdkMkRLMGdyY2M3M204RWs4OVNXUDRyeHVi?=
 =?utf-8?B?ZjZtVXdPUmFwdXRwWTZhOEVwSkM1Wm5YSE5VaWlyYmFabW5sUUFnQUlqTjky?=
 =?utf-8?B?enlLRSt3bXdEcDJmVHlleVF0aWNnUkJMZVdKM1l1UEt2MHh6ajY1bjkvcS9F?=
 =?utf-8?B?UXhxTEFNUGt5SXh1YnJUTHFKcVhWeHY4dWdYS011THFzcXcrK01DRWVnQnZl?=
 =?utf-8?B?SnJkNVhMb2Z3ckhOTWR1aW1ZTG92L2g0ZFBTUDVVelVWZTBnMjh0WEhZYXNC?=
 =?utf-8?B?Y0hyeDBKejBOTUhjQjhvL045UnNXUndEc2pqblIxOGxNdE9VanBCaEhwWnBF?=
 =?utf-8?B?cXA5eStBY0tENStPYnI5SVJXTDlUZVF2SVlDSitLNFZ5Q0k2OVZ6bzI4WGFx?=
 =?utf-8?B?VVpvZ2o4bmlYZG9aWDhiTzRoTzdjL0FBeWpiQnlXT1pxNnZqbkEvU09wcWlk?=
 =?utf-8?B?Wkl4dFdUa2RnbmFKZGYvSFBtT2RaWlRVY2JBRXhMMi9oL01zK1VpNnJGZk15?=
 =?utf-8?B?UmRYS0dQSDRVUWMzdnkwVFN0dVVOajlqMTJVN0hFNmpqTXBPZTFScnJ2V0s4?=
 =?utf-8?B?NmhSWEZhSmJjd3ZYVldrZ0kvSjBkSzVvVUZ1TFA3b1k3NlBZV2xSeWgyQ21r?=
 =?utf-8?Q?2Oalin6PVoyGu6U8=3D?=
X-Exchange-RoutingPolicyChecked: nvtrgTrHM2npAxcQu3ukMDC9PzHrHeyOl3fvRukwjz7n71DEZjBbVs0fQN+ldluyPANfBThklznKv/uGYqsP3wi5aRyx+KNgh3wgVge3sGdy/tL+fwf01BKyoCztItRuQF5qTlS7DeKpchM/YPMt5cMIuUsCe0btXIEMdgX6lSaMqZ79OGBZ+MCorFrEo3Qq9hiA3fwLiOUoHqzO++qw+O82pq0zzuKib7WBEj3QfAHugGxma8UZGSfY6Q9nEGTBz6uMwzM50RUXt5ypv3O4FFqszvfjtzn+kmjaeIQjPCZQ2BWiYMG1xvwMOnliMFAmRsTg6ZaLRRrUIhGH8Mb/qg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20665e44-ef38-4384-1ca0-08df15a12984
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:23:24.3987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2+wPGbzeRPxOpqRCXG8sxFnfLq7TqTKY7zulRQpMSEAZob8OlJBFBJlD6VnnwfrjSnMc1ap0OI2NLscqPn904GSGZmc217uew44L2EqlnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
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



On 18-09-2026 20:05, Rodrigo Vivi wrote:
> On Fri, Sep 18, 2026 at 09:50:48AM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 9/17/2026 3:53 PM, Varun Gupta wrote:
>>> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
>>> local, queue-level context termination rather than a global device or
>>> driver failure. This can be triggered as part of expected recovery flows,
>>> including intentional fault-injection tests.
>>>
>>> Printing this at ERROR level is too noisy and causes false-positive
>>> dmesg-warn failures in CI. Switch the log level to INFO, matching the
>>> adjacent CAT error handler.
>>>
>>> v2:
>>>    - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>>>      (Himal)
>>>
>>> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
>>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index f3ba8abfc228..6144a1767f10 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -3487,7 +3487,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>   	guc_id = msg[0];
>>>   
>>>   	if (guc_id == GUC_ID_UNKNOWN) {
>>
>> btw, shouldn't we check for guc_id >= GUC_ID_UNKNOWN?
>>
>>> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>>> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>>>   		return 0;
>>
>> if GuC shouldn't ever pass invalid guc-id here, as spec says this action is for:
>>
>> 	"Notify the context which caused an uncorrectable local error to KMD"
>>
>> then IMO instead of ratelimiting this error, we should rather escalate this
>> to -EPROTO to force the error dump and reset from the CTB layer, no?
> 
> Himal, next time please do not rush with committing patches like this.

Hi Rodrigo,

The intention was never to bypass review — the comments above came in 
after the patch had already been merged. Going forward I'll leave 
patches in for longer before merging so there's adequate time for 
additional review feedback.

> 
> There were 2 unadressed comments in it.
> 
>>
>>>   	}
>>>   
>>> @@ -3495,9 +3495,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>   	if (unlikely(!q))
>>>   		return -EPROTO;
>>>   
>>> -	xe_gt_err(gt,
>>> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
>>> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>>> +	xe_gt_info(gt,
> 
> Again, this is a no no!
> 
> This is not a CAT ERROR that is expected in any page fault caused by the user.
> If we hit this case it is a guc identified uncorrectable error!
> 
> Only come back with this idea if we can really justify why you can demote **all**
> guc uncoorrectable errors to this.
> 
> The errors you mentioned in the commit message are not a good reason and should
> be handled by the testing tools.
> 
> The patch was removed from the drm-xe-next. Please get back to the drawing board.


The reason I  believe info is appropriate here is that this is a local, 
recoverable uncorrectable error: the GuC reports it per-queue, and we 
already contain it via xe_guc_exec_queue_reset_trigger_cleanup() (i.e. 
we handle it the same as an engine reset) rather than treating it as a 
fatal/global device failure.

That also lines up with how the RAS layer already logs errors. 
xe_ras_process_errors() reports all detected errors — including 
uncorrectable ones — at info level and lets the recovery action do the 
actual work:

xe_info(xe, "[RAS]: %s %s detected\n", comp_to_str(component), 
sev_to_str(severity));

So my thinking was that a recoverable, queue-local uncorrectable error 
fits that same "report at info, recover via engine reset" model, as 
opposed to the fatal HW error-vector path in xe_hw_error.c which uses 
err_ratelimited.


BR
Himal
> 
> Thanks,
> Rodrigo.
> 
>>> +		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
>>> +		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>>>   
>>>   	trace_xe_guc_uncorrectable_error(q);
>>>   
>>

