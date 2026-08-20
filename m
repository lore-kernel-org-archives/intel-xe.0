Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416EFC5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 10:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70EF10EFC1;
	Thu, 20 Aug 2026 10:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWsg6x7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC21610EFC1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787221709; x=1818757709;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lsnbty2jkIngN5HiQcec+OcOhZrCL/uAdX7kcznuxFQ=;
 b=ZWsg6x7U5rEhgb+O2dZRcGD8HtLITUCcVBtTx0q4HqATlD8i33qTts1W
 8ZT0S85hJhAySSKOQGBTWJ+xeaMb4k0mjPkTHBqMWDMfxUMbqlKl3lvTf
 QEm5bYonaQC1F4KbVatlrOwITwca8dmQ5KQC9vg6ZIgL2xHMAFFXziESu
 WlX2gd+0nGte0GhhXaajdNu9M1WkkCEEInhGkMtc5IV4N+uEviA2YnZX/
 IeeGEm6BmP3iKJWeAPDlVPKTMEE0iPDhhe1OjnTzn6j6GR8PD+bKZZWvG
 Q2kLcbTAH5Q58k3xTILxrZQY2aFo80lO9YuJWe60qOP2Z7tEnemf2UrqA w==;
X-CSE-ConnectionGUID: S6W5kCbaRc+9t9zSGyN7cA==
X-CSE-MsgGUID: 6HIz2UY+TiyTtY62r2cG+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87958911"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="87958911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:28:29 -0700
X-CSE-ConnectionGUID: qyYKWAsLT9ea5ss+RFat5g==
X-CSE-MsgGUID: maCKUrSaQcCbNF9wBJE7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="289457043"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:28:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 03:28:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 03:28:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 03:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJo09oEq3BB5jmz8t9AkqaG87Wx96mzaDWR+ccZUhi6gSFLM5AuQypNiu2to+rKICDi4izKrDyML0lVUqy3xUcHlgkFPGYHt+ljipNAzhnTZfqyvV+bPpWkiUzEmuuz+VHwTBiZ5EQdLzq7nPz444ppDwoICCRx6xk8vMbIr1gw0SJQXkh4/DdLaRpULHZZphFsg02vM0sZRg8A76yK2DivmcA6jrV+W2b8YFmd8grDWNFRPrOO48JjCE/17O5I1Wd95IUZwgD0ONOpLdVvBPhibjxF8WMrfXW0ihGbElk+iIRuV6i+wrrdJsrs4qdr5tgFDmkgb15a5GSvcXxlAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9TR2CVZ4JthV2wZhGTpACGVeb36vXtFzE7caGsl/vY=;
 b=Lr1KqyaF/LFJ6WtHa1LiP8XZ/5tWPlRQuS+DpBSs6aLmIJ2TSUMnkqXvaoHKnoASz7bVVFCihzL4z2fXmSAkeUIu4NyuK8dp/pRjnf2+GWPuKaRY3kHmoK9a43dPZhp5a81fUnW7pz/3NmRG0dUYlKhb74zIDePKYK7gAXTOLfrYnrXfQ3dSzCgjmHLR70IkzmUSuJIhck0yRcJlICQOykdmyNuRohvo3fv4s2DllF5Rv3iOHRBuA7bsPQ4v6wD1pRDuWAV6G/wqztNLF8VoJX2GNnUF7f98ZJ6evhYtqGO7guXt6idB1GAxR0NkyDvbsWdxwijOsOrmNC8ovGcYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY8PR11MB6914.namprd11.prod.outlook.com
 (2603:10b6:930:5a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 10:28:25 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 10:28:24 +0000
Message-ID: <3a0fd8de-6e2e-45d0-803f-a0274d4630ce@intel.com>
Date: Thu, 20 Aug 2026 15:58:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/pagemap: Add fault injection for higher-order
 RAM folio allocation
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260805231041.3791771-1-matthew.brost@intel.com>
 <20260805231041.3791771-7-matthew.brost@intel.com>
 <bc7357ee-e7f2-442b-a367-b3be2be6559e@intel.com>
 <aoam2CCqmye2vWxF@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aoam2CCqmye2vWxF@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: c32cdf71-814c-482a-35a0-08defea5c40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|4143699003|18002099003|22082099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: ohssOvEGjxqmU7XJMdF5t1xbeSvptB9BmArcZEXb5GCSAThus8+Uyq3AA2OgKf5WZlBZcNz9/yowBZJOBy//vyJLioFOIFYDhpdOOKu5qrrqqu7KMLq673UbPYmMOUEc/ZaRwzui/NncGB3Za4daMdkTg8G/d1uBDbBDtPwygi0z81uH0fRZ8VSd+lgpYoh+WmNK0FCKZ7cSN5BS6Hay0nSu5fZX+l1KQK1xLAOZadJYXsBWbcgg9cKKflDUag1rQ1X2bGqqXDoZb1CNFN62Rlj/WE3xBV0izRP1eH1LFoIDTmjWX6Leo4t8gj1cry4AaBoY1+I92Sa+Dh9ifSI3yPW71hmU00z/7M93SqaFVpQUWxnQ1MsWY4EXX9W6xevKVRw+zma50DVhjrGQ7B13Nj9AlhQxOyV+7JUOEdqfGgWq7zLRCunE4G7qsQjrY8Z6/UE+rlGOxvtG6xtcMIRDbvsZeeU6U+lDuZ1/+3yIogh6JIOyzBTgU+IYvVKrF8var7XNF17+OVnGtAmdmDm60PohS5gBHA+h0jbn6s7CDcr4uUSSOrS4KkwDWYUi09nqVpvFHhtwUR5F1g8UluCanWxdfAhG9ZHsFOscwGso8XoSVFdwLgOvCa412rcrfHHgOaz5aNiPyU2S3YO726kLBQNEXe3Xt4ha1gu8+ZIB+3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yjc2QnJUK04xd2phNlhEZXk3NG14Wno3K2xrM29oNUJqWXF6aHN4RHNKVkpi?=
 =?utf-8?B?d1hMOXFKSjl4cFdSb05YZ0VyOEdKZURQdG9DMW5LNHRrWW5RSDB5OElBRnF6?=
 =?utf-8?B?UmpWUTJQbDhlTFhwNU1OSGRBemppZlNjV1lxWm9RWDVpNFQ2MUpHT2JmVnIr?=
 =?utf-8?B?MUlhMEF1UHRrWDdpV2Q5OUQvSjJ3MkxKWXdKaEpOSDV6ZGRxUGViS28xQkxQ?=
 =?utf-8?B?Sng1VGY1amo2UmN3SnoxZGhkT3hqdDZaVHAySVFUTGJad3lvUWRaZVBHYkxE?=
 =?utf-8?B?SXA0L1V0OVRUS1FnWFo0TW5iNFJ2QlhGMHB0dXlSSjNXQWV6UmhrZEIycmdM?=
 =?utf-8?B?WHdvT0lrZ3VxQXhXREp1c3d1bU1uOHNEOFcwWWFjVVZ0aGxSaWdGMk9iRHJJ?=
 =?utf-8?B?b0dXSXVCRjUxWktKZCtsdmoxYkluNUpjbWRtOHl5cVVvcGswcnljNlgyVEt1?=
 =?utf-8?B?dkRSV2VIeGtYci9xbkQwbTlzRG45WXY4SmppSHJDUDFRemx0SkdDV1Z3NFdz?=
 =?utf-8?B?a1pMZkRTQWZ1STVLREpzbG9SVVBQMVJnbjdhUmdrN3pCb0ZFR0ZDTWFERDhP?=
 =?utf-8?B?QVpCZkFkUEg1eUpmeHRJeVE4OGYwRFZUb2xQcXdrRmRMaVZRMlF6YVNSM3M0?=
 =?utf-8?B?T2N1MStGUDFmN21zMFI3TlVleWlIeDBteW9vMERnbTJXNFhaZFY0SEhoeG10?=
 =?utf-8?B?bVFqN2t4VEZMQWs2ZVVjd3BOOTlzSkVSNC9uSWR6UjIvZGJPdUFVTHU5WFdw?=
 =?utf-8?B?VEU4Z21ETmZsRGE1UkRreDBJQzY3VU1UaDRwSkJ0R2paR3RYUWtvNTI1ei9w?=
 =?utf-8?B?d0d3dFQrMC9zZ2JvRTBMUU9wZFU3UFBtODhycjk2V214R2QrcWpPekp1U3gx?=
 =?utf-8?B?cC92cXNYeHVubWFmQ2tCSG1GeHdmMFhWOVNUSE9MRzJVTTlYSDBuMmoxMjdp?=
 =?utf-8?B?dyswLzVGckZPMHowQXBXMzJ2WmhPZWtVU1JjNGdGMWIyVGNETk9YcE1nbk80?=
 =?utf-8?B?Y2FKZ2xMNDZDSGI3dUtOWkVyc3lCME1LSnRaR05MelM4VHBETWRybXhDMjRB?=
 =?utf-8?B?ZlduYnMzd2RXWlkwVklNQWFDVy9mL1ZPcUJTVkhycjNqSXZUZjVGYmlNY3Ju?=
 =?utf-8?B?Vzh2ZEJDMXVIbDhXOThjSWpmOHJKZjlGSTIxeHVVVVZNTy9aTU5QUHdnU1Fo?=
 =?utf-8?B?amxhTlVZM2JhVHhVM0E4ejlxRUlic1NPYUVqSyt0RE5rTS9LcWhWTzFDSE5B?=
 =?utf-8?B?TnRGeENHSmhMUy9BdHRvd3V1eGh0R01WakVrUHJkOFJsQm55Z2NIVUx5cStt?=
 =?utf-8?B?MEd3MFppV2g3bUF6VWUvQmxwS1JMekd3RUlpVlEraUZ3MzVZOGtXVW8vWm80?=
 =?utf-8?B?U0dmRFgraUs5b0RPYmNSM2tDRE15U3kySzJocm5jaXZ3SlNyWkhLUkcreWZQ?=
 =?utf-8?B?QnhUSXRjWlhZWkhvQnRoRjRETTZ5dEE2STFQNzBRMjhpMWhqQzJDZUpFdVho?=
 =?utf-8?B?Yk9MTTc3dVJiRDFENUh1dVptVEtETnIwNEFPcEJiS2VEckQvY2F6ZW5YTnpX?=
 =?utf-8?B?UitCSEhSSHRTLzZCcDZuaVE4VWM5MkRCV0JaTHp0d1pidXlrbmF0aTVXdHd1?=
 =?utf-8?B?akhsR05DV0pyM2NLU2NGYVZKNWJhdFlCWXBVM1J0WWhoMllMMmtZNVNGRlEy?=
 =?utf-8?B?WGtyRHJpMlhCWnEyYmF3ajlzMGwzb2orWlVYNzBoNUdxc04vYjdTREYwSHFF?=
 =?utf-8?B?NHR5Q1pJY3pobDRnUnl3U2tWZXBOdW1PeTJBalM1OGQwZVlkc1JSamlhQ0R3?=
 =?utf-8?B?QWhycHUrQW5oclZHcVU4ZnNkbFAxUDJXNHpjWHJ3VkE2TFlZMzFaQ042aE9U?=
 =?utf-8?B?N3c4S1ZjaFJuRDNXRm1mYXNaVFhjSHFJNmRTK051dHpBMDJacXRrSytlc2gz?=
 =?utf-8?B?WnczRjdFSFNSMjdOZWM2bjlqaExLTjBEL2VxSlZ5NmJQV212VklDVU1qdSsr?=
 =?utf-8?B?TFBIZThhR3RoWDhlckZPb2tHL0pCTlpZcThVOUYrK1dxTk1EZUJkRDRjam9K?=
 =?utf-8?B?SldkNGZIdmR1UkdEdCtOOFNaRjBlbUc1WUo1eXVUMXdrZmF0SFNQb2Y2L1gz?=
 =?utf-8?B?RzM2SEY0UXpRSG0yUHpjN1ZOcmhJemhpaFVFSTZyV2ZzNEt5bkR0aUdRdG4z?=
 =?utf-8?B?empCTGlMek14VUxaZllpQjVPRlNYWXBtbWxOWDRiUFhmVDBqbEtaaE96NGNa?=
 =?utf-8?B?QTMvK3V4ekxkbngrWVUrNFhTZElrc0twbGJTK1pOYjk5VThKZ3lrZnZmMWxJ?=
 =?utf-8?B?UkxGNlhTV0V6S0pOaVZQQy9NSWJmbWM3bEwxaXJMWHZzQ0cvZ1RTbkM2OEJO?=
 =?utf-8?Q?CyjLcVdq3yOEBH1s=3D?=
X-Exchange-RoutingPolicyChecked: AG3lV4dGsSXbkEXDbKmgW14qEQl72ZFdfyXiNS4iyfs7NdLA12Ay/wMOuXWSO6v/WQQdOV6aCBP7O94ZmRQjD10BtIVjzacIwb0p9okhb1OKuLf8qPo9fFTRSX2tKrWN/HD0i2TP4zFV0v/u3Wk7fqymymqsUrjv2DADT9rXwKX+ZopRprOie7RbIt/ijm5F4m9FDmyuJOlnOUZghw/k5YNj6L+REbc8aTNmCJbFxtCQJnfbzz5EIwfBOBFjC4Rm6ZzzJ7j1tt2js3l8qAF5VpxNN/L83RkkCq+I4TzUHA06h7W8Nz2CAnEGvrBIRlUaqGgCafGM/nqpTilGGgvdzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c32cdf71-814c-482a-35a0-08defea5c40f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 10:28:24.7285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lQcKOfkNOIZp2S05kCA5TEo7pNfcvKKb8IYY6fU29zmvvCWQYQ9R7w4/pyQadzvPSjR2hSw4yitwJjBFNYZhhvZS1Fjlbqv8aAaicQTRio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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



On 20-08-2026 12:33, Matthew Brost wrote:
> On Sun, Aug 16, 2026 at 08:44:21PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 06-08-2026 04:40, Matthew Brost wrote:
>>> Migrating a device-private THP back to system memory has two distinct
>>> paths in __migrate_device_pages(): the fast path where both source and
>>> destination carry MIGRATE_PFN_COMPOUND, and the fallback path where the
>>> destination could only be satisfied with order-0 folios and the source
>>> THP therefore has to be split via migrate_vma_split_unmapped_folio().
>>>
>>> The fallback path only triggers under genuine memory pressure, which
>>> makes it both rare and awkward to reproduce, yet it is the path where
>>> the interesting refcounting happens (the CPU fault holds an extra
>>> reference on the device folio taken by do_huge_pmd_device_private()).
>>>
>>> Add a fault_attr, modelled on backup_fault_inject in ttm_pool.c, that
>>> forces the higher-order allocation in
>>> drm_pagemap_migrate_populate_ram_pfn() to fail so the existing order-0
>>> fallback is taken deterministically.
>>>
>>> The attribute is exposed at /sys/kernel/debug/drm_pagemap_fault_inject
>>> and requires CONFIG_FAULT_INJECTION_DEBUG_FS. With
>>> CONFIG_FAULT_INJECTION disabled the helper compiles out to a constant
>>> false and the injection has no cost.
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@kernel.org>
>>> Cc: Lorenzo Stoakes <ljs@kernel.org>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: Liam R. Howlett <liam@infradead.org>
>>> Cc: Nico Pache <nico.pache@linux.dev>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lance Yang <lance.yang@linux.dev>
>>> Cc: Usama Arif <usama.arif@linux.dev>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-mm@kvack.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Assisted-by: GitHub_Copilot:claude-opus-5
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_pagemap.c | 36 ++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 35 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
>>> index 51c6f12e4256..6ae8c9aa36cc 100644
>>> --- a/drivers/gpu/drm/drm_pagemap.c
>>> +++ b/drivers/gpu/drm/drm_pagemap.c
>>> @@ -3,6 +3,7 @@
>>>     * Copyright © 2024-2025 Intel Corporation
>>>     */
>>> +#include <linux/debugfs.h>
>>>    #include <linux/dma-fence.h>
>>>    #include <linux/dma-mapping.h>
>>>    #include <linux/migrate.h>
>>> @@ -12,6 +13,27 @@
>>>    #include <drm/drm_pagemap_util.h>
>>>    #include <drm/drm_print.h>
>>> +#ifdef CONFIG_FAULT_INJECTION
>>> +#include <linux/fault-inject.h>
>>> +static DECLARE_FAULT_ATTR(migrate_to_ram_fault_inject);
>>> +
>>> +/*
>>> + * Force a higher-order destination folio allocation to fail in
>>> + * drm_pagemap_migrate_populate_ram_pfn(), exercising the order-0 fallback
>>> + * (and, in turn, the THP split path in __migrate_device_pages()) without
>>> + * having to drive the system into actual memory pressure.
>>> + */
>>> +static bool drm_pagemap_fault_inject_folio(void)
>>> +{
>>> +	return should_fail(&migrate_to_ram_fault_inject, 1);
>>> +}
>>> +#else
>>> +static bool drm_pagemap_fault_inject_folio(void)
>>> +{
>>> +	return false;
>>> +}
>>> +#endif
>>> +
>>>    /**
>>>     * DOC: Overview
>>>     *
>>> @@ -960,7 +982,9 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>>>    		if (order)
>>>    			gfp |= __GFP_NOWARN;
>>> -		if (vas)
>>> +		if (order && drm_pagemap_fault_inject_folio())
>>> +			folio = NULL;
>>> +		else if (vas)
>>>    			folio = vma_alloc_folio(gfp, order, vas, addr);
>>>    		else
>>>    			folio = folio_alloc(gfp, order);
>>> @@ -1554,6 +1578,16 @@ void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim
>>>    		kfree(dpagemap);
>>>    }
>>> +static int __init drm_pagemap_module_init(void)
>>> +{
>>> +#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_FAULT_INJECTION)
>>> +	fault_create_debugfs_attr("drm_pagemap_fault_inject", NULL,
>>> +				  &migrate_to_ram_fault_inject);
>>> +#endif
>>> +	return 0;
>>> +}
>>> +module_init(drm_pagemap_module_init);
>>> +
>>>    static void drm_pagemap_exit(void)
>>>    {
>>
>> Missed fault injection debugfs removal ?
>>
>> Sashiko flags it and looks valid concern.
> 
> I checked on this and kernel wide no code seems to undo
> fault_create_debugfs_attr on module unload, nor is there a function in
> linux/fault-inject.h to undo all debugfs entries setup.

I believe the cleanup is done via standard debugfs_remove_recursive via 
passing the fault_create_debugfs_attr dir or parent. Here we have no 
parent so

dir = fault_create_debugfs_attr at init

and debugfs_remove_recursive(dir) should be sufficient during 
drm_pagemap_exit

I assume not cleaning it exit might leave the debugfs entries incase of 
module unload.
  >
> So IMO this is either everyone is kernel is doing this wrong or this is
> a non-issue. debugfs_create_file kernel doc seems to indicate all
> debugfs enteries should be removed with debugfs_remove though (?).
> Either way I'd say this out of scope for this series.
> 
> Matt
> 
>>>    	flush_work(&drm_pagemap_work);
>>

