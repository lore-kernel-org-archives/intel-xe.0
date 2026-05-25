Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C2CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 19:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E49210E0E2;
	Mon, 25 May 2026 19:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pe4dUlec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F6910E0E2
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779736481; x=1811272481;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tl7m55XymIeE2vD6pmaoohwv4ZzxiZ5wA1L7arlZRik=;
 b=Pe4dUlecnTPxlgFLjbkRqKOyoFvWP/30weI7Xgv9pcDpm+5/you2iFbP
 x9F4QvTI9EJAs5oKnGexnF8/ax+jFm94LW8E/vMhNUcW+gm6eQ8ATNNJ8
 AS6wj00KWrizMEtrjSvKnsX33K5CZmQ9XM/U4dgNr9xyD8l4j1qR9SAVk
 biYruw8gIz96TVpOgwbtMziQ1oV2DI11vpDZvNCe21hbONpJ9yLbNl6a1
 d0rwoCnwbOFOgXINqimqOJblK1wSfPfXRJM8m323H8MDSYu5EQtxdQKGa
 rZu7qHhK1FznaCfUBiN3No7UtsasonX10O3ip4XUunT42b4uV8eCqPDHm w==;
X-CSE-ConnectionGUID: 3rXfym03R3WC/jyojA1hxw==
X-CSE-MsgGUID: Rruoy3mPTg6BcUCbQtq5ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91123791"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="91123791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:14:40 -0700
X-CSE-ConnectionGUID: mOB+Q3GsSI6n+6X0iSxayg==
X-CSE-MsgGUID: w3Y+lHnRQp63K/56nZuP3A==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:14:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:14:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 12:14:40 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edNimx+5N5VCqUJh3HVm3QIvpYIAcv4ozphWUJnNS/cfeEhOu3x4QgDb5JgQ/yfrJncn2U1eXeaGJk/QGUUQ96qGT6Xfd1D7uiNaAuUtIrml7FTklngsp05X7Mv2QDkk5QbX4iJKQmxbrP948+bkCmstIDbgrNyX7CqAY1XhqSPH6fz1FlsSnJoDu/Inbde6c0DE25/+pweAS5qf95SGfTr6rxgj9rPF13BkpdpU0zFQJZYT1BppYx5YbjyI6VZADoErqCLMgwjoKO5J+tiyMIisDlOCqfMkZaLMf8+8LPuCmg/W2ryu0v8pbOg5Yk6o1rK++RlKfmUerA1r0GBqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGtKiQUgUkpzx2fotdZ8SIYwArK0GPd9SgkqjnaSHjk=;
 b=VoHmYzzwVoGrbyyhj5RzKvqSFZWBZQPtLjQ8vLaajOIqeZ+WTWfWONziBzVxhdg4aC2xS/GK8UiGQSrObiW2KR4pMuydC4Eflwp606Y9vQ1FiD+Sr/T/pZKIpw+ehQaOTVfznrlpO88Gyb4v0pEnO8wG+p8YyyyliFyhxQeobPgYMWPy7kBYSyXQogJVtCzTSY/NSmUQmOXEWbx1xYG8PFleWUUzRvjPjfYjyOi8Nues12MqnWDvhNQcMvWmNnLqNZbf7HpN+FBIA108FAUwsJk3fBlA+d6XnJut7N2TGJkXcSRZtpiI54s1xcu6Iv+avis/AgEThxHADtXZTlHJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 19:14:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 19:14:34 +0000
Message-ID: <ec6d0f54-c21c-4b20-81fd-e030a04e0049@intel.com>
Date: Mon, 25 May 2026 21:14:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe: Separate early xe_device initialization
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-5-michal.wajdeczko@intel.com>
 <87bje3ic4o.fsf@intel.com> <87wlwrgvql.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87wlwrgvql.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0209.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: fd37f93f-8ede-48ad-f707-08deba91db14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|4143699003|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: J8uMW1+r9y2t6GKKPykx/IUppZALaRth9Y5mvscnwLrl1nMbh2F/vFDFehtKegUb9h6uiibemsDqmeGpVBfMvoIw05sHGUjTPu/LXtrEf+hivw0asZeJwzjr/TCi1b0D73AU4s0YC9eyYnU/TPJedgCUomzmayJFQT1CIafVCrOyyMl7FrQZ2jMpv4iIKZHdaDWegkbku6mGsNoAvi0EP9zwRqORtLENJ08KbpgtJ1W5WsgQ99KGloeUJuaoTbujUZRU6dLQES1OOGqMF+4Xj+k7WixLScTUZrfRc7vvjMV/UteqZeK70ent35iJo7JhI7yobtQMg48v2vTFAHhhjwxYbyYGbdsVzr/E0nlJHFttnwc+F8wnsH5Szbpo4h8HZjqJ6OjHCTTjtqrUm2Fqab2vKRCFsGCPSE2D3Fl3r2leixgp4NFnMzBRtCUbFS9mPmgIzlT2aTKFFrw1YiCKhAuwK8ej5uUTSHt1vhHQMympE/TOW6SIHW8qX92qGwRPagKk19NcTOu78KF0W06wCfk20weSaa1kxY2W4Ceq0XLRW9wTx/TMaryIfjbhlzgPjnzPHYAdOkJrQHFjkDdHoxqpD6TtAcSPYbh2kJYI8qNcz5sMpmfDbHAm8pwR4H7IzJLtheLwr2krCNQk7EX6as7mdi4UY8o3InMaWDdmU6XD6N1Mwzu4o7A4Tl4ajK7c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnBKUGhTYkFFU2p5S0xrWmd4NlZiaCs1bkVuWFprWXJsdkZwN3dGOUFxeEQr?=
 =?utf-8?B?Rm9BZkIrSktMeGgzWXFjbHFnVVRwSUdjS2NDamxBVVlRVjZNdmhTTUV1RjIv?=
 =?utf-8?B?Y0R3RW9sbGxKODRJNURhci9tRE5WaFVKMUlUcFJVSjBFaEk4OXpWSGhSRlR0?=
 =?utf-8?B?ZkdLOXdKMk5zamJoYXcrbjVqMnJxNFlkbHZRalNGMVhVcjBOZm02c3loOU4r?=
 =?utf-8?B?NFEwcVJHbCtCbHF0RnMxQld0bDhTcU9vM201NVNXRnQ5RjkrcG51OTEwRlh2?=
 =?utf-8?B?Y3VzZEZRRG1SMGZiRGJySWxVVmdYeWZUalI4L1BZMDh3MjY0VHdHNjlKSDY4?=
 =?utf-8?B?NVg5dXVhejZPL25VN0RWUjZtRzRLWVptSVlhbE41djA5ek9Ic2hXUGtvVFN4?=
 =?utf-8?B?cGVtcFVDREg0eTJkSDZNYkdqYk1NZFFMcFVkbUtWeGtmVXIwR1pnNkJpaDgv?=
 =?utf-8?B?anBVbDRhdnhwZlVjdW95bVZ5bFd6WkkwTGQ4NVhaaHBjYWhCK2NEVWNCVG1i?=
 =?utf-8?B?MWE2VjVYN1hnZCtKSGdodHdROHE2UEtpWng3Um45R2VNZEJGRFF3c3VTbWxE?=
 =?utf-8?B?bEpOanBZaFFIY2xKQTI0ZktYYjRYMHhIenpNNzJsMWY5KzNUYXFkQ2FwS0Nt?=
 =?utf-8?B?cjZlSkFEY2NwaHEvMFZ4cmIzUHQ0Y3BxYzRXUjJtWE1scGdOeStUUW5EdVVj?=
 =?utf-8?B?eDVGSlFWaWJVRGVRdDlzRE4rS1lVWTFzdTdvQWxmS29VK3UrMGcycGsvSENx?=
 =?utf-8?B?SWJObm9MaEFualpYUUkwL0M4d1R5UFFkcUR3VjJxMXRRaDB0RkZNaldpeGZG?=
 =?utf-8?B?dDMzeFovZkE4S0owdDRPbVB6aUg0OHhRSG5BVW01bmR2dklTRndKUjNRcGxQ?=
 =?utf-8?B?YWhFWkFDS0N1c0tKRHlrcXlqa0Q3SUJwYzZ4QnFSaCtSaXEwZEh4aHUrSnVr?=
 =?utf-8?B?MDMzNldDeVA4NXdjMXAwaDlKT0JnV3NhMUxqRExuWTkvbjR2dzlGb3A5YUZC?=
 =?utf-8?B?VGFNWjZ5S0FGK0Q5b3A5Q29aRE1pMndUWnUrYlJCekVWSENuWjNSeVdEN0N0?=
 =?utf-8?B?eldWSTVxQXVFVnJIb2JWVkdJVk9PZDRpeFlHSWdCZjVOSzFjYlFoU0t1S0dw?=
 =?utf-8?B?RzZIT1NrNVdjNEFaOXliSzZiYlUvTnQvVURPemUrd0p0bHBNaVBwNGJiNFJX?=
 =?utf-8?B?bUtmVWRObE1xbHk2V0hWNlN4M0Y1RTFtS3dtQXRRUzhwVUlDNW5iTklKK3lV?=
 =?utf-8?B?ZU13Z3Ixb24raGUvMFpSOERMaUI4czdxQ1g3cDdyNG1XVHhndTAwZ1JsRno1?=
 =?utf-8?B?SVk5dzFTdks3ZnBwYVZ5aU8waE8xRnRqM3hHSS9BTXBaOElOQ1gwL2U3cFQ5?=
 =?utf-8?B?YUNtL29uZVZuS1QwVTduSCs3REFJSXo1RndIQ3JFR1hvcWx3TDF4c2pLTTNP?=
 =?utf-8?B?VVIvZUY2QkdnN08zTC9DRXdaREd3ajl4djhNVlFySndxRm9MQjdLTUVQSVlR?=
 =?utf-8?B?VWxXQmJ5aHBLL3pWWGxteHIrMFhCd0pKU2RZTHFHVWk3STZ6S1Y0MVpJUjJx?=
 =?utf-8?B?Z2M3WCtSZTdXS3VMMDRXcmhGWjVrY1l4OHJKZ1ZqYUlpNEZLMlRRa0xZUnIv?=
 =?utf-8?B?MnNJazlTSEVxT1l5c2Uzdm16Ukg3bWpLeTRST0g5SXZ1TnBISVpyV002ZHJz?=
 =?utf-8?B?Uzl5N0xxcFJOekdVZG5xek5CT2pRUmlCcnJEdGdvdnJzZ3NKdnlwWTZtQWhH?=
 =?utf-8?B?dVN5QklrUmJ3N2ZuYzJ2c3VsU3RXMlhxdDdiRFN2N0RxaHNlbFNKTUI4aDVm?=
 =?utf-8?B?TEFJOUlweUxnWDR6NFp5R25xM0pYUThSY1BUNE5VR0xiT1FyS1BDZlRkWG5n?=
 =?utf-8?B?RTd0UFlqRVJXNVByZTI4WlRpYkZMQmJpeFlFZGRjTlNjTU1DNTV3YUhGYVFH?=
 =?utf-8?B?MTBHTXdnWkZDU1BNdUNGMGVldWJDcXRrZUV1SjFoOFNOY25nekVzUjUyOW44?=
 =?utf-8?B?Y3dDZlY5SmxNRXVyc2lQZWpBLzFZSGdsS3dMNVNGaXR6S3Q5MllWYUEwQzBJ?=
 =?utf-8?B?Yk9xa29ZUkNhcHFFQWp0aWdKa1dZY2o3cWk0MXA3b0xtTGlKUzU2UDV6eEJ1?=
 =?utf-8?B?bFVWYlJuazFhSG1PUlJtMGFNZWJHTHJiRzljMytiTXdWZytHa3JZNUF6NVF3?=
 =?utf-8?B?eEMyZEpFQ0JXTmF3bk12czllaDZxdVlHeUlVVmg1c3Q5MWRGdEU1NERpUFFn?=
 =?utf-8?B?Q1BYeWhqOE9JdVc3bTJiNU8yZXZYYkJlUVZMcTVqajhkV0JkWkZHaE8ySTdy?=
 =?utf-8?B?Z0gyRy9tdTdqMmRoL0xpblcyVnJlVjlVQVVYaUhabE9KMWgrYzZXN0REQVpE?=
 =?utf-8?Q?4nKp3fPVYx+rJRfM=3D?=
X-Exchange-RoutingPolicyChecked: DEzOio8gIrUjzCKFkrIP+TfqtoOT5Q26J5pBj9W1bPxMzDV/SVntnEn7eg0iVIgIUC82IH2sedYr7Z8Yb2ysRZIgGVqOPnq72nDUvXIGClEz+0nNbnTj1xxmlPGxDf5XxzweDoNARNL0u+zXR9+Jk/XUAEOb0pIA0tJqRAGGRB/v8gsqhS1jJ9dGtE8VAa3XwH/TALwdLS3pb1ySS3GVofjfcfjrjfdP/1VtYfRP9MWX/hlKqUMucapvKnVtpW3B46UTZTv+/zuXjzcS5L15wO2MTh3pYP4risKhwt5SIKpiLoEMQ+RrEXi0s2Nr4RyLRz/YIL1fFjt3aHiU7QCxaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd37f93f-8ede-48ad-f707-08deba91db14
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 19:14:34.2707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8w3046wrmFCR7h0H29JqEH9B5bfAhyNi7/WtPEhaxDnEWnAzJPfxV2oG/nmzvTJagPSNtu1g9IePi5lSgY66LuUKpwkEZmDff1HxLnijok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
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



On 5/25/2026 9:00 PM, Gustavo Sousa wrote:
> Gustavo Sousa <gustavo.sousa@intel.com> writes:
> 
>> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
>>
>>> We would like to initialize more of the xe_device struct also from
>>> the kunit code, as it should be safe to use most of the generic drm
>>> or xe components without doing any additional tweaks. Separate early
>>> xe initialization code to a new function, so it can be reused.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device.c | 39 ++++++++++++++++++++++++----------
>>>  drivers/gpu/drm/xe/xe_device.h |  1 +
>>>  2 files changed, 29 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index b498147dcf61..7ba407f73a02 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -506,27 +506,45 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  	if (IS_ERR(xe))
>>>  		return xe;
>>>  
>>> +	err = xe_device_init_early(xe);
>>> +	if (err)
>>> +		return ERR_PTR(err);
>>> +
>>> +	return xe;
>>> +}
>>> +ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>>> +
>>> +/**
>>> + * xe_device_init_early() - Initialize a new &xe_device instance
>>> + * @xe: the &xe_device to initialize
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int xe_device_init_early(struct xe_device *xe)
>>> +{
>>> +	int err;
>>> +
>>>  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>>>  			      xe->drm.anon_inode->i_mapping,
>>>  			      xe->drm.vma_offset_manager, 0);
>>> -	if (WARN_ON(err))
>>> -		return ERR_PTR(err);
>>> +	if (err)
>>> +		return err;
>>>  
>>>  	xe_bo_dev_init(&xe->bo_device);
>>>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>>
>> Curious: are the drmm_* calls going to work fine for the automated
>> teardown when they are called from a kunit context?
>>
>> What about devm_* calls? From a quick look, I know that at least
>> xe_bo_pinned_init() will make one of those.
>>
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	err = xe_shrinker_create(xe);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	xe->atomic_svm_timeslice_ms = 5;
>>>  	xe->min_run_period_lr_ms = 5;
>>>  
>>>  	err = xe_irq_init(xe);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	xe_validation_device_init(&xe->val);
>>>  
>>> @@ -536,7 +554,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  
>>>  	err = xe_pagemap_shrinker_create(xe);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>>>  
>>> @@ -555,7 +573,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  
>>>  	err = xe_bo_pinned_init(xe);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>>>  						       WQ_MEM_RECLAIM);
>>> @@ -569,16 +587,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  		 * drmm_add_action_or_reset register above
>>>  		 */
>>>  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
>>> -		return ERR_PTR(-ENOMEM);
>>> +		return -ENOMEM;
>>>  	}
>>>  
>>>  	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>> -	return xe;
>>> +	return 0;
>>>  }
>>> -ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>>
>> So, there are things allocated/initialized in xe_device_create() that
>> get deallocated/finalized in xe_device_destroy().  With this change, we
>> now have things extracted out of xe_device_create() into
>> xe_device_init_early(), and it appears that xe_device_destroy() is now
>> really the counterpart of the latter than the former.
>>
>> I think we should just call the function xe_device_init() and then
> 
> I guess it could still be called xe_device_init_early() for consistenty
> with the naming for the other components of the driver, but I would
> still rename xe_device_destroy() to xe_device_fini() to avoid people
> mistakenly pairing it with xe_device_create().

hmm, but there is nothing to pair really

xe_device_destroy is not a callable function, it's a private action
and likely should be called __fini_xe_device() or not needed at all,
once we will move to more granular cleanup actions

> 
> Honestly, I think I prefer much more a _init_nohw() suffix than
> _init_early(); that way we can pair with _fini_nohw() (as _fini_early()
> would be a bit innacurate or ambiguous IMO).  But that's a bit
> off-topic...

hmm, but ideally there should be no _fini_nohw kind of actions

we should just reuse drmm (managed) versions of all alloc/init
functions for our software (nohw) state

> 
> --
> Gustavo Sousa
> 
>> rename xe_device_destroy() to xe_device_fini().
>>
>>>  
>>>  static bool xe_driver_flr_disabled(struct xe_device *xe)
>>>  {
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>> index 27cd2329b99f..975768a6a9c8 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -44,6 +44,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>>  }
>>>  
>>>  struct xe_device *xe_device_create(struct pci_dev *pdev);
>>> +int xe_device_init_early(struct xe_device *xe);
>>
>> Right now we do not have any external users for this function.  We could
>> keep it static until we get to use them in kunit.
>>
>> That said, I think it would also make sense to separate it completely
>> from xe_device_create(), i.e., have xe_pci.c call the two functions
>> instead of xe_device_init_early() being implicitly called by
>> xe_device_create().  I think that would be more alligned with the
>> function names.
>>
>> --
>> Gustavo Sousa
>>
>>>  int xe_device_probe_early(struct xe_device *xe);
>>>  int xe_device_probe(struct xe_device *xe);
>>>  void xe_device_remove(struct xe_device *xe);
>>> -- 
>>> 2.47.1

