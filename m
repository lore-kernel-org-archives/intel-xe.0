Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61968CAC590
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 23:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C96A10E507;
	Tue, 17 Sep 2024 23:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUaVqfSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD5810E507
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726617022; x=1758153022;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=opg9/aGgmkYtR2z3yWl3XgOpBUeMdSupvfizBPAMpgo=;
 b=TUaVqfSUMhueXBTF7TcHawwzWKa9I6S9HfgTaZ2n6xgC28/vxNte8M55
 EhmuCUwtxO3JCdjvV6/3m0zKclMJDMfXVC6hbx6Pub9I8ESJpWJW1BOsK
 IX/59xV6/ElU139eA+jc2sJNEGj12/ouSm5I2WxjcP71PpakAcP+aBGiR
 PRY6fyKELdSdx9PouO1BOlIuZTv4OrHU+pihRkwWaIzlix+amvawVqYc5
 3J/8/MHdYTodVsIZRC6A+gow0t6qvnxp/3T2qZnm7UlJxc8cPGh/Jr4LE
 KYIPbuj03nFfzlIKcK6T2U4+r8IdfqIh1N1RHXGFipHyFN9ZPiGV11JrJ A==;
X-CSE-ConnectionGUID: PM21OswLTRm6az+vvMIRPw==
X-CSE-MsgGUID: RRnMpl3QRFOzAbxp6wygJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="42979442"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="42979442"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 16:50:22 -0700
X-CSE-ConnectionGUID: 1S8iC3IeT+SHX9Cyb2nOpA==
X-CSE-MsgGUID: rtZ5f0MpQJOTchxzXAyb/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="100042894"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 16:50:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 16:50:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 16:50:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 16:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nipjtXr04uMfu9ITXoTRSOwUXwWaOnUh3CaE/DXmPA9kuCIsKZYUa92GhBNLHZxzrRiwMOgkDd6O/P+H+b+KG9s99UJNhYJL11APTZHvrkKU6ZDLPZqU2erVnDrL1Q1poUTNOHQkkc0FZW4QPUJjjFwTqKbZ9q956hykuI+8Gucu2tfo4p7bPBjjfOl7vkkPGA+Lpqx/E1v8YJ7z5UjKX+HD86rLpdtnSeKyqNYDJpmgM1qnWI5oBjdfzEQMh5o/AEg3rSJ7AeJmPi6ZHGkkmisXqCpSBg97ePNeVGUyM+5Z7uL4ShJC4XIDpQCP3+m/BTHOOEIsrpsSu1uv87DmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOgpW1NOCyRK/o5bbOFS6OIW2AaUeW76I/e6wRNXxKY=;
 b=FwZ0Lre3z0nerqkK4A38JfRgiIgrX/aqG+LoS7fTHJz9irfcN+KeXoXtH8yKA4ByjjgmaspU2Qb9qR4qSGtB526YGNnOMYWDsx5JQk8/z0cGg+hH3GUnE7ZdBz3+r7x0RpUb1UbubivsiVP7j91uOxDcLltow9Q+i0RlAPL0eI+MYd1gcob4DCvZ0DgICMpQcxg0oU7gJucNAC/sHJNNTfIJS3A5rEgeHJ7u0ZrsoB0oQMqHgRAuwFNZbr2Wh4kzPuBXNcKoSHHGRdm8VcMtgCjgxt+vC22CHg1frzk7WQdjHSuqVW123mv/Rn08Q343WPaWyKvyD2bxtcJi7Ll11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Tue, 17 Sep
 2024 23:50:16 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 23:50:16 +0000
Date: Tue, 17 Sep 2024 19:50:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/display: Remove i915_drv.h include
Message-ID: <ZuoVtXdBHIgYJsam@intel.com>
References: <20240917203243.659393-1-rodrigo.vivi@intel.com>
 <172661231507.1023959.10309409058123998282@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172661231507.1023959.10309409058123998282@2413ebb6fbb6>
X-ClientProxiedBy: MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e6b509-2e3a-4196-1900-08dcd7737ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVVERUd0ZTRNa3FOZjdLdmwwa0R4eUtqeU1MdGZiUm0vZWR3eGpBb2dkTHBk?=
 =?utf-8?B?M013K21kTmNZR1lRR3U4UUVqV3NJTUNncGgwZG5DenhRU1Vsd0hBL1dUYndK?=
 =?utf-8?B?b1dVUUNpZUp6WDh4eWJhMWZvcmd0cDRWY2RpUy82TU5EaFdrU0JWSnIxQW0z?=
 =?utf-8?B?YVQrNXhEbGlMdW4yTzJKSWpFbU5zQVdjczBYK2ppbmVuK29WSms4bS9Rb0VQ?=
 =?utf-8?B?QkQyU0ZKSVA4MEREL2pHVEZnVGJIbDR0KzlPNFJZeTk4bVNHeFgvRTM2Ylky?=
 =?utf-8?B?NDNvZ0NoU2c1UFBaVWFlQm5nbnRNUG9mWVFPaWFFOWU3cWhvU0JSM3p3TVYv?=
 =?utf-8?B?TE5QeFNoNHJhOUVPSlpTUVRSZzZCVmNjZ29JN2JyK29RdjEvay9XZUpnbGlv?=
 =?utf-8?B?UHIzTlFLZUFBbHJkNnRhYzFBeEhBQnVXUWVRMG1aUkpkenNlV2ZERzVvR29R?=
 =?utf-8?B?ZmErZzNXMWpKdGVRb2wrdUpOQTlqRnlrRXhNMTEyTFVJSkhGRXpyK3hTRVRy?=
 =?utf-8?B?THZycWhtM3VMSWYvaUtsc0I2Z1g4enFaci9DRGtkc3FQWGRvMEVUMCthYXV6?=
 =?utf-8?B?L2lwVGlSWmxqRGxLRW96ZDdGckQ2cGxNTTEzd0RNcSszVXQxWi9aMzkwZ2tk?=
 =?utf-8?B?US94ZlREcmZESnRMcVpJeE1CLzZ1QzB2c3kvdUFUYjNkV25HdXZqeksxdUd2?=
 =?utf-8?B?VzhYU0xTWW81UzV0YjNhU3BXN0NxdVY5OGFUek0zcmpkaUdua1FPSGExWWZy?=
 =?utf-8?B?QkZmR3pUYlZVa0dId1pOb0dvckZRTVQ1UGtNc2xDQitDQ3dqYWFWeWtnWDFX?=
 =?utf-8?B?ZVFsMXZZSCthMmVsNVNKMXh1Z3owTUhSWGpQM0IvTDg5RFcxNldrRVltckJI?=
 =?utf-8?B?ZWJVY1VkNWZJckJGRzVmVExYOUhtTXo4SW1uYXBSN0xrZVBMTU1xZ3dNcW93?=
 =?utf-8?B?aTR6eDRWbDdHVk5GODkyM05YTGpsSDBVWi9mU0Z2WDlmUWZuNnFwOEh2Nlp6?=
 =?utf-8?B?UkFRaTNiMjlqVk1wK0VNWlB2QkR4ZUdtcFU4OGN5V2NZdzFSSDZPMFVvNy9u?=
 =?utf-8?B?RjNPbDZ3cTBNUUpxTjBIQmJKVzI3eWNGRVkzbDlmaGZhOHh6dHE0d1h0Y3Nq?=
 =?utf-8?B?R3cyWWVtRHJjNHphWUgxKzg5bjlrSVpCdlQ4WEZOalBvaDU2NUhldDhwZTd0?=
 =?utf-8?B?bXNhTzI4aUsvUmE1QTJJaWc2ZTkwVW90TUw0QmtET1AyeXhuTTdacW1ld3Ew?=
 =?utf-8?B?ZzhHWEliL2hYK3NETFZvMERHSFU5WHIvM0hGNUFoN2dINTE5b3FGMnAvemNN?=
 =?utf-8?B?aVltVHQ0Mm1xRFp0R053Njc0V2VpQmdMZWlJRUJyaWsweW5Bajd4SUlSdGlu?=
 =?utf-8?B?MHBSVVhOdDdZaW1LaFYyQUhGemlqQy9lUkVDajEzUnczR0lqWnJFcWdCNTR2?=
 =?utf-8?B?RVNVNWJxeVlJY3ROQm1ONkxSS2oxRWVuTWlVSE1HZkFSam1KMGExY0tRY0c4?=
 =?utf-8?B?MjdjNDI3Rml4Z0RoWTlJSTVBS2FJalBjdlM5aEgydnlxcW5oZ21FT3hsWWhu?=
 =?utf-8?B?U2t5YlhxMk9CRlQ2M0tMY0Qza0VaTmFnaitnQ2NwcXloY1paLzM5ekJoWGFJ?=
 =?utf-8?B?dkxUOURCUFVmNVRXTUZ5WVpKY1dOQXRpay9ORHYzUm1UVUk4NXRsaU5UNlFa?=
 =?utf-8?B?N3BpSlFRc1JXRklCVEN0OGVZOGdlRmxkdENBdyt3Q1YvUWd0KzRYeHJPTHBy?=
 =?utf-8?Q?wbexHEulkrE0W7137U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEZsNjdFcVladmp4ZERvWXA4ZjBYdktIZCtFeFd6aUZPczVCZWR1cUlYRGl0?=
 =?utf-8?B?QlpNdytpcHVzWml2ZTU3YzlIS29zeXFVSHhTTmlLT3o0cHZoanFtdVVsMTNY?=
 =?utf-8?B?WTRUSE1PMXIzbVB6Ujg1eU9hejFQSXl0bHhQSXgrRzlmTXBpdDViYm91blo3?=
 =?utf-8?B?ektLYVUzVEs1RkVSTlIvWjc5OS9VS3FxY2ZVRmFEazd5QkpzM1puVlJPRUNC?=
 =?utf-8?B?M0o4TXdEWk1kUG9NRTlLUDdCRzk5VEZseEw4alNISEtFbklRSGFidTIzRjF5?=
 =?utf-8?B?UCtLMHZ1SG5ZWjFGRHc5QU1CWE1MandobEFveFV2TWgzcHZRTi9Gdm1Tb29x?=
 =?utf-8?B?Z3hJbmc0TEdXLzJIVUt6MXlpVlBBWURRQk1xYkYwZkZ3ZVowVmd2VWJCMmhh?=
 =?utf-8?B?SEx4QjUyYXJaRkltVzFVUnZNUXdLZ29RYnp3eEVOY2ljNHAwY3VjazRHcEFL?=
 =?utf-8?B?bUh5ZmlIelBwZHYvT01VZ2VpTEltSldkd0F1ODVPSXMyUHM0bWlKUEprS1Ni?=
 =?utf-8?B?dmRDL0RCK0RsMDlFWGpySnBBMEdCWGczZmRaM1Zic01vV1hUZ1AwMGlxZmt1?=
 =?utf-8?B?UjJuYzlMaDcvS2tKN0Iyck5KWk01Y2x5c2x4SnFGdTBZWEt2ZXNSZ0JLNk1z?=
 =?utf-8?B?Q1F2djRFUXJ6bXV3aStrT3lYRS83a0ZOSXpxbG1ySFBxYVpucGdhMS9DZlJM?=
 =?utf-8?B?N1hVOHcxcUdQQ09OTk81VlNmQW9ITy8xeE9NNm1GSUpxNHhacEtmS1p0TWoy?=
 =?utf-8?B?THZSenRVMDNiajJGM2g4NkJyUG0xOHltZ1F6Ukp5RUVGaEtHcXk5OGg3SDZo?=
 =?utf-8?B?WUVLUlNYaTdkT3Jxa2FkYXE3SG1iMDBlK1ZEb0VVR1pYSm1hVFprTnRxakds?=
 =?utf-8?B?dTFhYzNiQVNVdFJRSTFUSVFMeGN3N2MzYVBzL25ua2hIVFMxRHB2clNRNW5R?=
 =?utf-8?B?UmN6ZFVORUF4cEFGNnQycnhkODJ6MnR5MDg4dE16VkdRbGR3VTZrUXRJdWFt?=
 =?utf-8?B?SVRSdnA4SEU0WTZRWEgrOHVhNytMOFRXdXpPeU5Yek9CN2xaZzVCVk8xZmRS?=
 =?utf-8?B?anpWenZpYU5vQVJ2QXhwK1FmeVV0L0d1ZjdBdDlFUFpXV2VvbHQ3WjJYd2dM?=
 =?utf-8?B?bHk4NFNoMmdGaUFIUVlBQlhBUUluSzhIYkFpNVlmYmNNR3ZSRFZkY0xhL1do?=
 =?utf-8?B?SXBMY2V4K1BiQW13WjNEZjZ1d3RkaUwxdG5TODM0cU10Tys0OVdrd3BiNUlx?=
 =?utf-8?B?WllUMHRXUUkrWWI1cHhCQnVqWkdaeXJBeWx1ZW4xUUtaWktDQmVBQkp6dUd3?=
 =?utf-8?B?Ui95QWY1L3lNWjd4TDFhK243endlNmtlZ0lQL0FhdTdJR0p2WUFVWGZhTmx3?=
 =?utf-8?B?SFNnYTBhU3Q0NTk4UXlLbDFjdno0c2E2dWtlMUR1QVY2dWlGem1jVWMrTm1Z?=
 =?utf-8?B?TjdJUlhTbzBMWXVnZTd5LzYyRldSVGVYS2prRHBvVHJ5UnNZUStGeTM1TGNl?=
 =?utf-8?B?YTRiMklqN1NRV2lqZFRMV2hNSGNXcmtvdEMrcHBQWnZFNG05djRNTExTNkFG?=
 =?utf-8?B?NEt6Wk9jREZtbmZiN2VXcXM2cytTYnZTZWhiWEZSZjkraFlOSStXSmljVmF5?=
 =?utf-8?B?cE1BUFZvZWUwYnFHazY1THl2c3lGeG1uMTVveGdFbmtWa2xla2FrQ242ZytQ?=
 =?utf-8?B?UGxyVURHOTJCR1V3czN2Q3p4bGJDdTRGam9SYm1SNEsraFAyUmV1dFNXN0tL?=
 =?utf-8?B?WFV1WkpnbThOdENUeWtqdjNtK3FqTkhiVUlmSndlWko3eXNRcVVaNGN0a2E3?=
 =?utf-8?B?NVJ2VGxWV0J6ZTd0eGdFN0M2cFFPcng1WjBPNDc2OVlLVGEzRmowS3Q0K0Iv?=
 =?utf-8?B?aVhCQTNTRExHTkJzeTBuZXUvQ2lyMnVzK2FJVFdQcmhrWGM4THF1WFlteWZQ?=
 =?utf-8?B?YXZzTG9iRmQ5NFZPc3Ryd1JTUjRmOXd6WStVVFVQUkw4NkdVamxwM3dhQUpV?=
 =?utf-8?B?YzB1MHVneitqeTJ5akxuaytQNEJyMlFFY01HRVZ6ekl3QkJJMTNFeXpza1ln?=
 =?utf-8?B?NU9pRHRVL1FkMTBTT0tyd3ZualR1MzllaTlOMFJKNlBIeWw0V2FxMjcxL1VN?=
 =?utf-8?B?QVZ1dmFoamIyTmZNbHhtVFAwUkJRdmdVRk9XZU5rM2tYZUJVV21VczNIY25L?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e6b509-2e3a-4196-1900-08dcd7737ae8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 23:50:16.6565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44R91cwTOt3zUKHZAfeHvgyKutM09dbpMDnEAaLvGMhAXmVBgJGJWsrBFTmZ9IwCw1dMIPnJlz/baseEoWmufg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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

On Tue, Sep 17, 2024 at 10:31:55PM +0000, Patchwork wrote:
>    Patch Details                                                                
>                                                                                 
>  Series:  drm/xe/display: Remove i915_drv.h include                             
>  URL:     [1]https://patchwork.freedesktop.org/series/138784/                   
>  State:   failure                                                               
>  Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/index.html
>                                                                                 
> CI Bug Log - changes from xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3_full 
>                              -> xe-pw-138784v1_full                             
>                                                                                 
> Summary                                                                         
>                                                                                 
>    FAILURE                                                                      
>                                                                                 
>    Serious unknown changes coming with xe-pw-138784v1_full absolutely need to   
>    be                                                                           
>    verified manually.                                                           
>                                                                                 
>    If you think the reported changes have nothing to do with the changes        
>    introduced in xe-pw-138784v1_full, please notify your bug team               
>    (I915-ci-infra@lists.freedesktop.org) to allow them                          
>    to document this new failure mode, which will reduce false positives in      
>    CI.                                                                          
>                                                                                 
> Participating hosts (4 -> 4)                                                    
>                                                                                 
>    No changes in participating hosts                                            
>                                                                                 
> Possible new issues                                                             
>                                                                                 
>    Here are the unknown changes that may have been introduced in                
>    xe-pw-138784v1_full:                                                         
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Possible regressions                                                        
>                                                                                 
>      • igt@core_hotunplug@hotrebind-lateclose:                                  
>                                                                                 
>           • shard-lnl: [3]PASS -> [4]DMESG-WARN                                 
>      • igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4:                          
>                                                                                 
>           • shard-dg2-set2: [5]PASS -> [6]DMESG-WARN                            
>      • igt@xe_wedged@wedged-at-any-timeout:                                     
>                                                                                 
>           • shard-dg2-set2: [7]PASS -> [8]FAIL                                  

nothing that could be related to this patch

>                                                                                 
>     Suppressed                                                                  
>                                                                                 
>    The following results come from untrusted machines, tests, or statuses.      
>    They do not affect the overall result.                                       
>                                                                                 
>      • igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:  
>                                                                                 
>           • {shard-bmg}: [9]PASS -> [10]INCOMPLETE +2 other tests incomplete    
>      • igt@xe_evict@evict-mixed-many-threads-large:                             
>                                                                                 
>           • {shard-bmg}: [11]TIMEOUT ([12]Intel XE#1473) -> [13]ABORT           
>                                                                                 
> Known issues                                                                    
>                                                                                 
>    Here are the changes found in xe-pw-138784v1_full that come from known       
>    issues:                                                                      
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Issues hit                                                                  
>                                                                                 
>      • igt@intel_hwmon@hwmon-read:                                              
>                                                                                 
>           • shard-lnl: NOTRUN -> [14]SKIP ([15]Intel XE#1125)                   
>      • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>                                                                                 
>           • shard-lnl: [16]PASS -> [17]FAIL ([18]Intel XE#911) +3 other tests   
>             fail                                                                
>      • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:  
>                                                                                 
>           • shard-adlp: [19]PASS -> [20]DMESG-WARN ([21]Intel XE#324)           
>      • igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:        
>                                                                                 
>           • shard-lnl: [22]PASS -> [23]FAIL ([24]Intel XE#1701) +3 other        
>             tests fail                                                          
>      • igt@kms_atomic_transition@plane-all-modeset-transition-fencing:          
>                                                                                 
>           • shard-adlp: [25]PASS -> [26]FAIL ([27]Intel XE#1426) +1 other       
>             test fail                                                           
>      • igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:  
>                                                                                 
>           • shard-lnl: [28]PASS -> [29]FAIL ([30]Intel XE#1426) +1 other test   
>             fail                                                                
>      • igt@kms_big_fb@4-tiled-8bpp-rotate-270:                                  
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [31]SKIP ([32]Intel XE#316)               
>      • igt@kms_big_fb@linear-64bpp-rotate-180:                                  
>                                                                                 
>           • shard-lnl: NOTRUN -> [33]DMESG-WARN ([34]Intel XE#1725)             
>      • igt@kms_big_fb@linear-64bpp-rotate-90:                                   
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [35]SKIP ([36]Intel XE#1201 / [37]Intel   
>             XE#316)                                                             
>      • igt@kms_big_fb@linear-8bpp-rotate-270:                                   
>                                                                                 
>           • shard-lnl: NOTRUN -> [38]SKIP ([39]Intel XE#1407)                   
>      • igt@kms_big_fb@x-tiled-8bpp-rotate-0:                                    
>                                                                                 
>           • shard-adlp: [40]PASS -> [41]FAIL ([42]Intel XE#1874) +4 other       
>             tests fail                                                          
>      • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:          
>                                                                                 
>           • shard-adlp: [43]PASS -> [44]FAIL ([45]Intel XE#1231) +1 other       
>             test fail                                                           
>      • igt@kms_big_fb@yf-tiled-16bpp-rotate-0:                                  
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [46]SKIP ([47]Intel XE#1124 / [48]Intel   
>             XE#1201) +2 other tests skip                                        
>      • igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:                    
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [49]SKIP ([50]Intel XE#1124)              
>      • igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:         
>                                                                                 
>           • shard-lnl: NOTRUN -> [51]SKIP ([52]Intel XE#1124) +5 other tests    
>             skip                                                                
>      • igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:                
>                                                                                 
>           • shard-lnl: NOTRUN -> [53]SKIP ([54]Intel XE#2191)                   
>      • igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:                
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [55]SKIP ([56]Intel XE#1201 / [57]Intel   
>             XE#2191)                                                            
>      • igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:                
>                                                                                 
>           • shard-lnl: NOTRUN -> [58]SKIP ([59]Intel XE#1512) +1 other test     
>             skip                                                                
>      • igt@kms_bw@linear-tiling-2-displays-1920x1080p:                          
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [60]SKIP ([61]Intel XE#1201 / [62]Intel   
>             XE#367)                                                             
>      • igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:                        
>                                                                                 
>           • shard-lnl: NOTRUN -> [63]SKIP ([64]Intel XE#1399) +7 other tests    
>             skip                                                                
>      • igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6:      
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [65]SKIP ([66]Intel XE#1201 / [67]Intel   
>             XE#787) +13 other tests skip                                        
>      • igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:          
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [68]SKIP ([69]Intel XE#1201 / [70]Intel   
>             XE#455 / [71]Intel XE#787) +3 other tests skip                      
>      • igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:                             
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [72]SKIP ([73]Intel XE#1252)              
>      • igt@kms_cdclk@mode-transition@pipe-d-dp-4:                               
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [74]SKIP ([75]Intel XE#1201 / [76]Intel   
>             XE#314) +3 other tests skip                                         
>      • igt@kms_chamelium_color@ctm-blue-to-red:                                 
>                                                                                 
>           • shard-lnl: NOTRUN -> [77]SKIP ([78]Intel XE#306)                    
>      • igt@kms_chamelium_color@gamma:                                           
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [79]SKIP ([80]Intel XE#1201 / [81]Intel   
>             XE#306)                                                             
>      • igt@kms_chamelium_hpd@dp-hpd-after-hibernate:                            
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [82]SKIP ([83]Intel XE#373)               
>      • igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:                            
>                                                                                 
>           • shard-lnl: NOTRUN -> [84]SKIP ([85]Intel XE#373) +4 other tests     
>             skip                                                                
>      • igt@kms_cursor_crc@cursor-onscreen-512x512:                              
>                                                                                 
>           • shard-lnl: NOTRUN -> [86]SKIP ([87]Intel XE#1413) +1 other test     
>             skip                                                                
>      • igt@kms_cursor_crc@cursor-random-max-size:                               
>                                                                                 
>           • shard-lnl: NOTRUN -> [88]SKIP ([89]Intel XE#1424) +1 other test     
>             skip                                                                
>      • igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:                     
>                                                                                 
>           • shard-lnl: NOTRUN -> [90]SKIP ([91]Intel XE#309)                    
>      • igt@kms_display_modes@mst-extended-mode-negative:                        
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [92]SKIP ([93]Intel XE#1201 / [94]Intel   
>             XE#307)                                                             
>      • igt@kms_flip@2x-blocking-absolute-wf_vblank:                             
>                                                                                 
>           • shard-lnl: NOTRUN -> [95]SKIP ([96]Intel XE#1421) +1 other test     
>             skip                                                                
>      • igt@kms_flip@2x-flip-vs-panning:                                         
>                                                                                 
>           • shard-dg2-set2: [97]PASS -> [98]DMESG-WARN ([99]Intel XE#877)       
>      • igt@kms_flip@flip-vs-absolute-wf_vblank:                                 
>                                                                                 
>           • shard-lnl: [100]PASS -> [101]FAIL ([102]Intel XE#886) +1 other      
>             test fail                                                           
>      • igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:     
>                                                                                 
>           • shard-lnl: NOTRUN -> [103]SKIP ([104]Intel XE#1397 / [105]Intel     
>             XE#1745)                                                            
>      • igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>                                                                                 
>           • shard-lnl: NOTRUN -> [106]SKIP ([107]Intel XE#1397)                 
>      • igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>                                                                                 
>           • shard-adlp: [108]PASS -> [109]DMESG-FAIL ([110]Intel XE#324) +4     
>             other tests dmesg-fail                                              
>      • igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:           
>                                                                                 
>           • shard-lnl: NOTRUN -> [111]SKIP ([112]Intel XE#656) +18 other        
>             tests skip                                                          
>      • igt@kms_frontbuffer_tracking@drrs-suspend:                               
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [113]SKIP ([114]Intel XE#1201 /           
>             [115]Intel XE#651) +3 other tests skip                              
>           • shard-lnl: NOTRUN -> [116]SKIP ([117]Intel XE#651) +7 other tests   
>             skip                                                                
>      • igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:      
>                                                                                 
>           • shard-adlp: [118]PASS -> [119]FAIL ([120]Intel XE#1861) +1 other    
>             test fail                                                           
>      • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:          
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [121]SKIP ([122]Intel XE#653) +1 other    
>             test skip                                                           
>      • igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:                            
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [123]SKIP ([124]Intel XE#1201 /           
>             [125]Intel XE#653) +5 other tests skip                              
>      • igt@kms_invalid_mode@clock-too-high:                                     
>                                                                                 
>           • shard-lnl: NOTRUN -> [126]SKIP ([127]Intel XE#1450 / [128]Intel     
>             XE#2568 / [129]Intel XE#599)                                        
>      • igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:                        
>                                                                                 
>           • shard-lnl: NOTRUN -> [130]SKIP ([131]Intel XE#1450) +1 other test   
>             skip                                                                
>      • igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:                        
>                                                                                 
>           • shard-lnl: NOTRUN -> [132]SKIP ([133]Intel XE#1450 / [134]Intel     
>             XE#599)                                                             
>      • igt@kms_plane@plane-panning-bottom-right-suspend:                        
>                                                                                 
>           • shard-dg2-set2: [135]PASS -> [136]DMESG-WARN ([137]Intel XE#1551)   
>             +1 other test dmesg-warn                                            
>      • igt@kms_plane@plane-position-hole:                                       
>                                                                                 
>           • shard-lnl: [138]PASS -> [139]DMESG-FAIL ([140]Intel XE#324) +1      
>             other test dmesg-fail                                               
>      • igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:                   
>                                                                                 
>           • shard-lnl: [141]PASS -> [142]DMESG-WARN ([143]Intel XE#324) +3      
>             other tests dmesg-warn                                              
>      • igt@kms_plane_lowres@tiling-4:                                           
>                                                                                 
>           • shard-lnl: NOTRUN -> [144]SKIP ([145]Intel XE#599) +4 other tests   
>             skip                                                                
>      • igt@kms_pm_dc@dc5-psr:                                                   
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [146]SKIP ([147]Intel XE#1129 /           
>             [148]Intel XE#1201)                                                 
>      • igt@kms_psr@fbc-pr-cursor-plane-move:                                    
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [149]SKIP ([150]Intel XE#929)             
>      • igt@kms_psr@fbc-pr-dpms:                                                 
>                                                                                 
>           • shard-lnl: NOTRUN -> [151]SKIP ([152]Intel XE#1406) +1 other test   
>             skip                                                                
>      • igt@kms_rotation_crc@primary-rotation-90:                                
>                                                                                 
>           • shard-lnl: NOTRUN -> [153]SKIP ([154]Intel XE#1437)                 
>      • igt@kms_vblank@query-idle@pipe-d-dp-4:                                   
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [155]INCOMPLETE ([156]Intel XE#1195) +2   
>             other tests incomplete                                              
>      • igt@kms_writeback@writeback-pixel-formats:                               
>                                                                                 
>           • shard-lnl: NOTRUN -> [157]SKIP ([158]Intel XE#756)                  
>      • igt@xe_compute@ccs-mode-basic:                                           
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [159]FAIL ([160]Intel XE#1050)            
>      • igt@xe_evict@evict-small-cm:                                             
>                                                                                 
>           • shard-lnl: NOTRUN -> [161]SKIP ([162]Intel XE#688) +3 other tests   
>             skip                                                                
>      • igt@xe_exec_basic@multigpu-once-basic-defer-mmap:                        
>                                                                                 
>           • shard-lnl: NOTRUN -> [163]SKIP ([164]Intel XE#1392) +4 other        
>             tests skip                                                          
>      • igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm: 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [165]SKIP ([166]Intel XE#288)             
>      • igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:           
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [167]SKIP ([168]Intel XE#1201 /           
>             [169]Intel XE#288) +2 other tests skip                              
>      • igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:                       
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [170]SKIP ([171]Intel XE#1201 /           
>             [172]Intel XE#2360)                                                 
>      • igt@xe_gt_freq@freq_suspend:                                             
>                                                                                 
>           • shard-lnl: NOTRUN -> [173]SKIP ([174]Intel XE#584) +1 other test    
>             skip                                                                
>      • igt@xe_live_ktest@xe_dma_buf:                                            
>                                                                                 
>           • shard-lnl: [175]PASS -> [176]SKIP ([177]Intel XE#1192)              
>      • igt@xe_module_load@many-reload:                                          
>                                                                                 
>           • shard-dg2-set2: [178]PASS -> [179]INCOMPLETE ([180]Intel XE#1195)   
>      • igt@xe_oa@non-sampling-read-error:                                       
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [181]SKIP ([182]Intel XE#1201 /           
>             [183]Intel XE#2541)                                                 
>      • igt@xe_pm@s2idle-vm-bind-userptr:                                        
>                                                                                 
>           • shard-lnl: [184]PASS -> [185]INCOMPLETE ([186]Intel XE#1616)        
>      • igt@xe_pm@s3-multiple-execs:                                             
>                                                                                 
>           • shard-dg2-set2: [187]PASS -> [188]DMESG-WARN ([189]Intel XE#1551    
>             / [190]Intel XE#569)                                                
>      • igt@xe_pm@s4-d3hot-basic-exec:                                           
>                                                                                 
>           • shard-adlp: [191]PASS -> [192]ABORT ([193]Intel XE#1358 /           
>             [194]Intel XE#1607)                                                 
>      • igt@xe_pm@s4-multiple-execs:                                             
>                                                                                 
>           • shard-adlp: [195]PASS -> [196]ABORT ([197]Intel XE#1358 /           
>             [198]Intel XE#1607 / [199]Intel XE#1794)                            
>      • igt@xe_pm@s4-vm-bind-unbind-all:                                         
>                                                                                 
>           • shard-adlp: [200]PASS -> [201]ABORT ([202]Intel XE#1794) +1 other   
>             test abort                                                          
>      • igt@xe_pm_residency@toggle-gt-c6:                                        
>                                                                                 
>           • shard-lnl: [203]PASS -> [204]FAIL ([205]Intel XE#958)               
>      • igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:                   
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [206]SKIP ([207]Intel XE#1201 /           
>             [208]Intel XE#944)                                                  
>      • igt@xe_wedged@basic-wedged:                                              
>                                                                                 
>           • shard-lnl: NOTRUN -> [209]DMESG-WARN ([210]Intel XE#1760)           
>                                                                                 
>     Possible fixes                                                              
>                                                                                 
>      • igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:      
>                                                                                 
>           • {shard-bmg}: [211]FAIL ([212]Intel XE#1426) -> [213]PASS +1 other   
>             test pass                                                           
>      • igt@kms_big_fb@4-tiled-64bpp-rotate-0:                                   
>                                                                                 
>           • shard-lnl: [214]FAIL ([215]Intel XE#1659) -> [216]PASS +1 other     
>             test pass                                                           
>      • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:                   
>                                                                                 
>           • shard-adlp: [217]FAIL ([218]Intel XE#1874) -> [219]PASS +2 other    
>             tests pass                                                          
>      • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:  
>                                                                                 
>           • shard-adlp: [220]FAIL ([221]Intel XE#1231) -> [222]PASS             
>      • igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:        
>                                                                                 
>           • shard-adlp: [223]FAIL ([224]Intel XE#1204) -> [225]PASS             
>      • igt@kms_cursor_legacy@forked-bo:                                         
>                                                                                 
>           • shard-dg2-set2: [226]INCOMPLETE ([227]Intel XE#1195) -> [228]PASS   
>             +1 other test pass                                                  
>      • igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:            
>                                                                                 
>           • {shard-bmg}: [229]DMESG-WARN ([230]Intel XE#877) -> [231]PASS +2    
>             other tests pass                                                    
>      • igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:            
>                                                                                 
>           • shard-lnl: [232]FAIL -> [233]PASS                                   
>      • igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:            
>                                                                                 
>           • shard-lnl: [234]FAIL ([235]Intel XE#886) -> [236]PASS +1 other      
>             test pass                                                           
>      • igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>                                                                                 
>           • shard-adlp: [237]DMESG-FAIL ([238]Intel XE#324) -> [239]PASS +1     
>             other test pass                                                     
>      • igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:                    
>                                                                                 
>           • shard-adlp: [240]FAIL ([241]Intel XE#1861) -> [242]PASS +1 other    
>             test pass                                                           
>      • igt@kms_plane@plane-position-covered:                                    
>                                                                                 
>           • shard-lnl: [243]DMESG-FAIL ([244]Intel XE#324) -> [245]PASS +2      
>             other tests pass                                                    
>      • igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:                   
>                                                                                 
>           • shard-lnl: [246]DMESG-WARN ([247]Intel XE#324) -> [248]PASS +1      
>             other test pass                                                     
>      • igt@kms_pm_dc@dc6-psr:                                                   
>                                                                                 
>           • shard-lnl: [249]FAIL ([250]Intel XE#1430) -> [251]PASS              
>      • igt@kms_universal_plane@cursor-fb-leak:                                  
>                                                                                 
>           • {shard-bmg}: [252]FAIL ([253]Intel XE#899) -> [254]PASS +1 other    
>             test pass                                                           
>      • igt@xe_evict@evict-mixed-many-threads-small:                             
>                                                                                 
>           • shard-dg2-set2: [255]TIMEOUT ([256]Intel XE#1473) -> [257]PASS      
>      • igt@xe_exec_reset@cm-cat-error:                                          
>                                                                                 
>           • shard-adlp: [258]DMESG-FAIL ([259]Intel XE#1962) -> [260]PASS       
>      • igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:             
>                                                                                 
>           • shard-dg2-set2: [261]DMESG-FAIL ([262]Intel XE#1069) -> [263]PASS   
>      • igt@xe_oa@mmio-triggered-reports:                                        
>                                                                                 
>           • {shard-bmg}: [264]FAIL ([265]Intel XE#2249) -> [266]PASS            
>           • shard-lnl: [267]FAIL ([268]Intel XE#2249) -> [269]PASS +1 other     
>             test pass                                                           
>      • igt@xe_oa@oa-exponents:                                                  
>                                                                                 
>           • {shard-bmg}: [270]FAIL ([271]Intel XE#2723) -> [272]PASS            
>      • igt@xe_oa@privileged-forked-access-vaddr:                                
>                                                                                 
>           • shard-lnl: [273]SKIP -> [274]PASS                                   
>      • igt@xe_pm@s3-basic-exec:                                                 
>                                                                                 
>           • {shard-bmg}: [275]INCOMPLETE ([276]Intel XE#569) -> [277]PASS       
>      • igt@xe_pm@s4-basic-exec:                                                 
>                                                                                 
>           • shard-lnl: [278]ABORT ([279]Intel XE#1358 / [280]Intel XE#1607 /    
>             [281]Intel XE#1794) -> [282]PASS                                    
>                                                                                 
>     Warnings                                                                    
>                                                                                 
>      • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:  
>                                                                                 
>           • shard-adlp: [283]DMESG-WARN ([284]Intel XE#1033) ->                 
>             [285]DMESG-WARN ([286]Intel XE#324) +1 other test dmesg-warn        
>      • igt@kms_big_fb@linear-16bpp-rotate-270:                                  
>                                                                                 
>           • shard-dg2-set2: [287]SKIP ([288]Intel XE#1201 / [289]Intel          
>             XE#316) -> [290]SKIP ([291]Intel XE#316) +2 other tests skip        
>      • igt@kms_big_fb@linear-8bpp-rotate-270:                                   
>                                                                                 
>           • shard-dg2-set2: [292]SKIP ([293]Intel XE#316) -> [294]SKIP          
>             ([295]Intel XE#1201 / [296]Intel XE#316) +1 other test skip         
>      • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:        
>                                                                                 
>           • shard-adlp: [297]FAIL ([298]Intel XE#1231) -> [299]DMESG-FAIL       
>             ([300]Intel XE#324) +1 other test dmesg-fail                        
>      • igt@kms_big_fb@y-tiled-addfb-size-overflow:                              
>                                                                                 
>           • shard-dg2-set2: [301]SKIP ([302]Intel XE#1201 / [303]Intel          
>             XE#610) -> [304]SKIP ([305]Intel XE#610)                            
>      • igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:                     
>                                                                                 
>           • shard-dg2-set2: [306]SKIP ([307]Intel XE#1124) -> [308]SKIP         
>             ([309]Intel XE#1124 / [310]Intel XE#1201) +3 other tests skip       
>      • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:  
>                                                                                 
>           • shard-adlp: [311]DMESG-FAIL ([312]Intel XE#324) -> [313]FAIL        
>             ([314]Intel XE#1231)                                                
>      • igt@kms_big_fb@yf-tiled-32bpp-rotate-180:                                
>                                                                                 
>           • shard-dg2-set2: [315]SKIP ([316]Intel XE#1124 / [317]Intel          
>             XE#1201) -> [318]SKIP ([319]Intel XE#1124) +7 other tests skip      
>      • igt@kms_big_fb@yf-tiled-addfb-size-overflow:                             
>                                                                                 
>           • shard-dg2-set2: [320]SKIP ([321]Intel XE#610) -> [322]SKIP          
>             ([323]Intel XE#1201 / [324]Intel XE#610)                            
>      • igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:                
>                                                                                 
>           • shard-dg2-set2: [325]SKIP ([326]Intel XE#367) -> [327]SKIP          
>             ([328]Intel XE#1201 / [329]Intel XE#367) +1 other test skip         
>      • igt@kms_bw@linear-tiling-4-displays-2560x1440p:                          
>                                                                                 
>           • shard-dg2-set2: [330]SKIP ([331]Intel XE#1201 / [332]Intel          
>             XE#367) -> [333]SKIP ([334]Intel XE#367)                            
>      • igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:                             
>                                                                                 
>           • shard-dg2-set2: [335]SKIP ([336]Intel XE#1252) -> [337]SKIP         
>             ([338]Intel XE#1201 / [339]Intel XE#1252)                           
>      • igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:       
>                                                                                 
>           • shard-dg2-set2: [340]SKIP ([341]Intel XE#455 / [342]Intel XE#787)   
>             -> [343]SKIP ([344]Intel XE#1201 / [345]Intel XE#455 / [346]Intel   
>             XE#787) +17 other tests skip                                        
>      • igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:           
>                                                                                 
>           • shard-dg2-set2: [347]SKIP ([348]Intel XE#1201 / [349]Intel XE#455   
>             / [350]Intel XE#787) -> [351]SKIP ([352]Intel XE#455 / [353]Intel   
>             XE#787) +21 other tests skip                                        
>      • igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:                 
>                                                                                 
>           • shard-dg2-set2: [354]SKIP ([355]Intel XE#787) -> [356]SKIP          
>             ([357]Intel XE#1201 / [358]Intel XE#787) +62 other tests skip       
>      • igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:          
>                                                                                 
>           • shard-dg2-set2: [359]SKIP ([360]Intel XE#1201 / [361]Intel          
>             XE#787) -> [362]SKIP ([363]Intel XE#787) +76 other tests skip       
>      • igt@kms_chamelium_color@ctm-blue-to-red:                                 
>                                                                                 
>           • shard-dg2-set2: [364]SKIP ([365]Intel XE#1201 / [366]Intel          
>             XE#306) -> [367]SKIP ([368]Intel XE#306)                            
>      • igt@kms_chamelium_hpd@hdmi-hpd-storm:                                    
>                                                                                 
>           • shard-dg2-set2: [369]SKIP ([370]Intel XE#1201 / [371]Intel          
>             XE#373) -> [372]SKIP ([373]Intel XE#373) +7 other tests skip        
>      • igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:                            
>                                                                                 
>           • shard-dg2-set2: [374]SKIP ([375]Intel XE#373) -> [376]SKIP          
>             ([377]Intel XE#1201 / [378]Intel XE#373) +6 other tests skip        
>      • igt@kms_content_protection@legacy:                                       
>                                                                                 
>           • shard-dg2-set2: [379]FAIL ([380]Intel XE#1178) -> [381]INCOMPLETE   
>             ([382]Intel XE#1195 / [383]Intel XE#2715) +1 other test             
>             incomplete                                                          
>      • igt@kms_cursor_crc@cursor-onscreen-512x512:                              
>                                                                                 
>           • shard-dg2-set2: [384]SKIP ([385]Intel XE#308) -> [386]SKIP          
>             ([387]Intel XE#1201 / [388]Intel XE#308)                            
>      • igt@kms_cursor_crc@cursor-rapid-movement-512x512:                        
>                                                                                 
>           • shard-dg2-set2: [389]SKIP ([390]Intel XE#1201 / [391]Intel          
>             XE#308) -> [392]SKIP ([393]Intel XE#308)                            
>      • igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:        
>                                                                                 
>           • shard-dg2-set2: [394]SKIP ([395]Intel XE#1201 / [396]Intel          
>             XE#323) -> [397]SKIP ([398]Intel XE#323)                            
>      • igt@kms_feature_discovery@display-4x:                                    
>                                                                                 
>           • shard-dg2-set2: [399]SKIP ([400]Intel XE#1138 / [401]Intel          
>             XE#1201) -> [402]SKIP ([403]Intel XE#1138)                          
>      • igt@kms_feature_discovery@dp-mst:                                        
>                                                                                 
>           • shard-dg2-set2: [404]SKIP ([405]Intel XE#1137) -> [406]SKIP         
>             ([407]Intel XE#1137 / [408]Intel XE#1201)                           
>      • igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>                                                                                 
>           • shard-dg2-set2: [409]SKIP ([410]Intel XE#455) -> [411]SKIP          
>             ([412]Intel XE#1201 / [413]Intel XE#455) +3 other tests skip        
>      • igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:           
>                                                                                 
>           • shard-dg2-set2: [414]SKIP ([415]Intel XE#651) -> [416]SKIP          
>             ([417]Intel XE#1201 / [418]Intel XE#651) +19 other tests skip       
>      • igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:                   
>                                                                                 
>           • shard-dg2-set2: [419]SKIP ([420]Intel XE#1201 / [421]Intel          
>             XE#651) -> [422]SKIP ([423]Intel XE#651) +26 other tests skip       
>      • igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:                            
>                                                                                 
>           • shard-dg2-set2: [424]SKIP ([425]Intel XE#658) -> [426]SKIP          
>             ([427]Intel XE#1201 / [428]Intel XE#658)                            
>      • igt@kms_frontbuffer_tracking@plane-fbc-rte:                              
>                                                                                 
>           • shard-dg2-set2: [429]SKIP ([430]Intel XE#1158 / [431]Intel          
>             XE#1201) -> [432]SKIP ([433]Intel XE#1158)                          
>      • igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:     
>                                                                                 
>           • shard-dg2-set2: [434]SKIP ([435]Intel XE#1201 / [436]Intel          
>             XE#653) -> [437]SKIP ([438]Intel XE#653) +21 other tests skip       
>      • igt@kms_frontbuffer_tracking@psr-slowdraw:                               
>                                                                                 
>           • shard-dg2-set2: [439]SKIP ([440]Intel XE#653) -> [441]SKIP          
>             ([442]Intel XE#1201 / [443]Intel XE#653) +17 other tests skip       
>      • igt@kms_multipipe_modeset@basic-max-pipe-crc-check:                      
>                                                                                 
>           • shard-dg2-set2: [444]SKIP ([445]Intel XE#356) -> [446]SKIP          
>             ([447]Intel XE#1201 / [448]Intel XE#356)                            
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b: 
>                                                                                 
>           • shard-dg2-set2: [449]SKIP ([450]Intel XE#1201 / [451]Intel          
>             XE#2763) -> [452]SKIP ([453]Intel XE#2763) +2 other tests skip      
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d: 
>                                                                                 
>           • shard-dg2-set2: [454]SKIP ([455]Intel XE#1201 / [456]Intel          
>             XE#2763 / [457]Intel XE#455) -> [458]SKIP ([459]Intel XE#2763 /     
>             [460]Intel XE#455) +1 other test skip                               
>      • igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b: 
>                                                                                 
>           • shard-dg2-set2: [461]SKIP ([462]Intel XE#2763) -> [463]SKIP         
>             ([464]Intel XE#1201 / [465]Intel XE#2763) +5 other tests skip       
>      • igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d: 
>                                                                                 
>           • shard-dg2-set2: [466]SKIP ([467]Intel XE#2763 / [468]Intel          
>             XE#455) -> [469]SKIP ([470]Intel XE#1201 / [471]Intel XE#2763 /     
>             [472]Intel XE#455) +3 other tests skip                              
>      • igt@kms_pm_backlight@bad-brightness:                                     
>                                                                                 
>           • shard-dg2-set2: [473]SKIP ([474]Intel XE#870) -> [475]SKIP          
>             ([476]Intel XE#1201 / [477]Intel XE#870)                            
>      • igt@kms_pm_backlight@basic-brightness:                                   
>                                                                                 
>           • shard-dg2-set2: [478]SKIP ([479]Intel XE#1201 / [480]Intel          
>             XE#870) -> [481]SKIP ([482]Intel XE#870)                            
>      • igt@kms_pm_dc@dc3co-vpb-simulation:                                      
>                                                                                 
>           • shard-dg2-set2: [483]SKIP ([484]Intel XE#1122 / [485]Intel          
>             XE#1201) -> [486]SKIP ([487]Intel XE#1122) +1 other test skip       
>      • igt@kms_pm_dc@dc9-dpms:                                                  
>                                                                                 
>           • shard-adlp: [488]FAIL ([489]Intel XE#1204) -> [490]SKIP             
>             ([491]Intel XE#1201 / [492]Intel XE#734)                            
>      • igt@kms_psr2_sf@cursor-plane-update-sf:                                  
>                                                                                 
>           • shard-dg2-set2: [493]SKIP ([494]Intel XE#1201 / [495]Intel          
>             XE#1489) -> [496]SKIP ([497]Intel XE#1489) +2 other tests skip      
>      • igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:                        
>                                                                                 
>           • shard-dg2-set2: [498]SKIP ([499]Intel XE#1489) -> [500]SKIP         
>             ([501]Intel XE#1201 / [502]Intel XE#1489) +1 other test skip        
>      • igt@kms_psr@fbc-pr-dpms:                                                 
>                                                                                 
>           • shard-dg2-set2: [503]SKIP ([504]Intel XE#929) -> [505]SKIP          
>             ([506]Intel XE#1201 / [507]Intel XE#929) +6 other tests skip        
>      • igt@kms_psr@fbc-psr2-sprite-plane-onoff:                                 
>                                                                                 
>           • shard-dg2-set2: [508]SKIP ([509]Intel XE#1201 / [510]Intel          
>             XE#929) -> [511]SKIP ([512]Intel XE#929) +9 other tests skip        
>      • igt@kms_psr_stress_test@invalidate-primary-flip-overlay:                 
>                                                                                 
>           • shard-dg2-set2: [513]SKIP ([514]Intel XE#1149 / [515]Intel          
>             XE#1201) -> [516]SKIP ([517]Intel XE#1149)                          
>      • igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:                       
>                                                                                 
>           • shard-dg2-set2: [518]SKIP ([519]Intel XE#1201 / [520]Intel          
>             XE#327) -> [521]SKIP ([522]Intel XE#327) +2 other tests skip        
>      • igt@kms_tiled_display@basic-test-pattern:                                
>                                                                                 
>           • shard-dg2-set2: [523]SKIP ([524]Intel XE#1201 / [525]Intel          
>             XE#362) -> [526]FAIL ([527]Intel XE#1729)                           
>      • igt@kms_vrr@flipline:                                                    
>                                                                                 
>           • shard-dg2-set2: [528]SKIP ([529]Intel XE#1201 / [530]Intel          
>             XE#455) -> [531]SKIP ([532]Intel XE#455) +10 other tests skip       
>      • igt@kms_writeback@writeback-check-output:                                
>                                                                                 
>           • shard-dg2-set2: [533]SKIP ([534]Intel XE#756) -> [535]SKIP          
>             ([536]Intel XE#1201 / [537]Intel XE#756)                            
>      • igt@xe_copy_basic@mem-copy-linear-0xfffe:                                
>                                                                                 
>           • shard-dg2-set2: [538]SKIP ([539]Intel XE#1123 / [540]Intel          
>             XE#1201) -> [541]SKIP ([542]Intel XE#1123)                          
>      • igt@xe_copy_basic@mem-set-linear-0x3fff:                                 
>                                                                                 
>           • shard-dg2-set2: [543]SKIP ([544]Intel XE#1126 / [545]Intel          
>             XE#1201) -> [546]SKIP ([547]Intel XE#1126)                          
>      • igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate: 
>                                                                                 
>           • shard-dg2-set2: [548]SKIP ([549]Intel XE#288) -> [550]SKIP          
>             ([551]Intel XE#1201 / [552]Intel XE#288) +12 other tests skip       
>      • igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:      
>                                                                                 
>           • shard-dg2-set2: [553]SKIP ([554]Intel XE#1201 / [555]Intel          
>             XE#288) -> [556]SKIP ([557]Intel XE#288) +21 other tests skip       
>      • igt@xe_exec_mix_modes@exec-simple-batch-store-lr:                        
>                                                                                 
>           • shard-dg2-set2: [558]SKIP ([559]Intel XE#1201 / [560]Intel          
>             XE#2360) -> [561]SKIP ([562]Intel XE#2360)                          
>      • igt@xe_oa@mi-rpc:                                                        
>                                                                                 
>           • shard-dg2-set2: [563]SKIP ([564]Intel XE#2541) -> [565]SKIP         
>             ([566]Intel XE#1201 / [567]Intel XE#2541) +3 other tests skip       
>      • igt@xe_oa@oa-tlb-invalidate:                                             
>                                                                                 
>           • shard-dg2-set2: [568]SKIP ([569]Intel XE#1201 / [570]Intel          
>             XE#2541) -> [571]SKIP ([572]Intel XE#2541) +3 other tests skip      
>      • igt@xe_pat@pat-index-xelpg:                                              
>                                                                                 
>           • shard-dg2-set2: [573]SKIP ([574]Intel XE#1201 / [575]Intel          
>             XE#979) -> [576]SKIP ([577]Intel XE#979)                            
>      • igt@xe_pm@s3-d3cold-basic-exec:                                          
>                                                                                 
>           • shard-dg2-set2: [578]SKIP ([579]Intel XE#1201 / [580]Intel          
>             XE#2284 / [581]Intel XE#366) -> [582]SKIP ([583]Intel XE#2284 /     
>             [584]Intel XE#366)                                                  
>      • igt@xe_query@multigpu-query-gt-list:                                     
>                                                                                 
>           • shard-dg2-set2: [585]SKIP ([586]Intel XE#944) -> [587]SKIP          
>             ([588]Intel XE#1201 / [589]Intel XE#944) +1 other test skip         
>      • igt@xe_query@multigpu-query-uc-fw-version-guc:                           
>                                                                                 
>           • shard-dg2-set2: [590]SKIP ([591]Intel XE#1201 / [592]Intel          
>             XE#944) -> [593]SKIP ([594]Intel XE#944) +2 other tests skip        
>                                                                                 
>    {name}: This element is suppressed. This means it is ignored when            
>    computing                                                                    
>    the status of the difference (SUCCESS, WARNING, or FAILURE).                 
>                                                                                 
> Build changes                                                                   
>                                                                                 
>      • IGT: IGT_8022 -> IGT_8023                                                
>      • Linux: xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3 ->               
>        xe-pw-138784v1                                                           
>                                                                                 
>    IGT_8022: 2d82f767a959d58c04ff3876d59d67924208d4ef @                         
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git                         
>    IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @                         
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git                         
>    xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3:                            
>    38e1b615fb395b928e514108e908cd6edf3d34c3                                     
>    xe-pw-138784v1: 138784v1                                                     
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/138784/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-4/igt@core_hotunplug@hotrebind-lateclose.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
>    9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html
>   12. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   13. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html
>   14. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@intel_hwmon@hwmon-read.html
>   15. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   16. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>   17. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>   18. https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>   19. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>   20. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>   21. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   22. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>   23. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>   24. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   25. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>   26. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>   27. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   28. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>   29. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>   30. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   31. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>   32. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   33. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html
>   34. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   35. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-90.html
>   36. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   37. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   38. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
>   39. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   40. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>   41. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>   42. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   43. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>   44. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>   45. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   46. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
>   47. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   48. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   49. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
>   50. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   51. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>   52. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   53. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>   54. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   55. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>   56. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   57. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   58. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>   59. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   60. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>   61. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   62. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   63. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>   64. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   65. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6.html
>   66. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   67. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   68. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>   69. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   70. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   71. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   72. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>   73. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   74. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
>   75. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   76. https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   77. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_chamelium_color@ctm-blue-to-red.html
>   78. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   79. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html
>   80. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   81. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   82. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
>   83. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   84. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>   85. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   86. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>   87. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   88. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-max-size.html
>   89. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   90. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>   91. https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   92. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
>   93. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   94. https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   95. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>   96. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   97. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning.html
>   98. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning.html
>   99. https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  100. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>  101. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>  102. https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  103. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
>  104. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>  105. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>  106. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
>  107. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>  108. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
>  109. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
>  110. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  111. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>  112. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  113. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
>  114. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  115. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  116. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-suspend.html
>  117. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  118. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
>  119. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
>  120. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>  121. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
>  122. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  123. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>  124. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  125. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  126. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high.html
>  127. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>  128. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>  129. https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>  130. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
>  131. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>  132. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
>  133. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>  134. https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>  135. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html
>  136. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html
>  137. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>  138. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-7/igt@kms_plane@plane-position-hole.html
>  139. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html
>  140. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  141. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
>  142. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
>  143. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  144. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_plane_lowres@tiling-4.html
>  145. https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>  146. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
>  147. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>  148. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  149. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
>  150. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  151. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@kms_psr@fbc-pr-dpms.html
>  152. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>  153. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html
>  154. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>  155. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-435/igt@kms_vblank@query-idle@pipe-d-dp-4.html
>  156. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  157. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_writeback@writeback-pixel-formats.html
>  158. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  159. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@xe_compute@ccs-mode-basic.html
>  160. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>  161. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@xe_evict@evict-small-cm.html
>  162. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  163. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>  164. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  165. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html
>  166. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  167. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
>  168. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  169. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  170. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
>  171. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  172. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>  173. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html
>  174. https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>  175. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-8/igt@xe_live_ktest@xe_dma_buf.html
>  176. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
>  177. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>  178. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-435/igt@xe_module_load@many-reload.html
>  179. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-466/igt@xe_module_load@many-reload.html
>  180. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  181. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-433/igt@xe_oa@non-sampling-read-error.html
>  182. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  183. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  184. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-8/igt@xe_pm@s2idle-vm-bind-userptr.html
>  185. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html
>  186. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>  187. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
>  188. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
>  189. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>  190. https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>  191. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
>  192. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
>  193. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  194. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>  195. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
>  196. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>  197. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  198. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>  199. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  200. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html
>  201. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>  202. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  203. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
>  204. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
>  205. https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>  206. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>  207. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  208. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  209. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-4/igt@xe_wedged@basic-wedged.html
>  210. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>  211. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
>  212. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>  213. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
>  214. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>  215. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>  216. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>  217. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
>  218. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>  219. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
>  220. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  221. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  222. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  223. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>  224. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>  225. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>  226. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_cursor_legacy@forked-bo.html
>  227. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  228. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo.html
>  229. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
>  230. https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  231. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
>  232. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
>  233. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
>  234. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
>  235. https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  236. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
>  237. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>  238. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  239. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>  240. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>  241. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>  242. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>  243. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-5/igt@kms_plane@plane-position-covered.html
>  244. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  245. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html
>  246. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>  247. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  248. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>  249. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
>  250. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>  251. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>  252. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html
>  253. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  254. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html
>  255. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
>  256. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  257. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
>  258. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html
>  259. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
>  260. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
>  261. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>  262. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>  263. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>  264. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
>  265. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>  266. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
>  267. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
>  268. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>  269. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
>  270. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-1/igt@xe_oa@oa-exponents.html
>  271. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>  272. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-bmg-8/igt@xe_oa@oa-exponents.html
>  273. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-8/igt@xe_oa@privileged-forked-access-vaddr.html
>  274. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-8/igt@xe_oa@privileged-forked-access-vaddr.html
>  275. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-bmg-5/igt@xe_pm@s3-basic-exec.html
>  276. https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>  277. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-bmg-1/igt@xe_pm@s3-basic-exec.html
>  278. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>  279. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  280. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>  281. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  282. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
>  283. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>  284. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  285. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>  286. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  287. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html
>  288. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  289. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  290. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
>  291. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  292. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
>  293. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  294. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
>  295. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  296. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  297. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>  298. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  299. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>  300. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  301. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>  302. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  303. https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  304. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>  305. https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  306. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>  307. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  308. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>  309. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  310. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  311. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  312. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  313. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  314. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  315. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>  316. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  317. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  318. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>  319. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  320. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>  321. https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  322. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>  323. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  324. https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  325. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>  326. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  327. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>  328. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  329. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  330. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>  331. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  332. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  333. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>  334. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  335. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>  336. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>  337. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>  338. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  339. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>  340. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>  341. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  342. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  343. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>  344. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  345. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  346. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  347. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>  348. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  349. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  350. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  351. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>  352. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  353. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  354. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
>  355. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  356. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
>  357. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  358. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  359. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
>  360. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  361. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  362. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
>  363. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  364. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html
>  365. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  366. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  367. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
>  368. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  369. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>  370. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  371. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  372. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>  373. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  374. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>  375. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  376. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>  377. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  378. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  379. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@kms_content_protection@legacy.html
>  380. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>  381. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_content_protection@legacy.html
>  382. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  383. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
>  384. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>  385. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  386. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>  387. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  388. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  389. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>  390. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  391. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  392. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>  393. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  394. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>  395. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  396. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  397. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>  398. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  399. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
>  400. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>  401. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  402. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
>  403. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>  404. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
>  405. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>  406. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
>  407. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>  408. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  409. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
>  410. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  411. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
>  412. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  413. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  414. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>  415. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  416. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>  417. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  418. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  419. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>  420. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  421. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  422. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>  423. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  424. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>  425. https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  426. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>  427. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  428. https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  429. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>  430. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>  431. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  432. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>  433. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>  434. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
>  435. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  436. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  437. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
>  438. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  439. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>  440. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  441. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>  442. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  443. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  444. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>  445. https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>  446. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>  447. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  448. https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>  449. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
>  450. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  451. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  452. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
>  453. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  454. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
>  455. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  456. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  457. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  458. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
>  459. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  460. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  461. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
>  462. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  463. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
>  464. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  465. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  466. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
>  467. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  468. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  469. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
>  470. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  471. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  472. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  473. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
>  474. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  475. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
>  476. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  477. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  478. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html
>  479. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  480. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  481. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
>  482. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  483. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
>  484. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>  485. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  486. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
>  487. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>  488. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
>  489. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>  490. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html
>  491. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  492. https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>  493. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-update-sf.html
>  494. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  495. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  496. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-update-sf.html
>  497. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  498. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>  499. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  500. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>  501. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  502. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  503. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
>  504. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  505. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html
>  506. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  507. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  508. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>  509. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  510. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  511. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>  512. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  513. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>  514. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>  515. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  516. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>  517. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>  518. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>  519. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  520. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  521. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>  522. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  523. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>  524. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  525. https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>  526. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
>  527. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>  528. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-435/igt@kms_vrr@flipline.html
>  529. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  530. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  531. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@kms_vrr@flipline.html
>  532. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  533. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>  534. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  535. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-435/igt@kms_writeback@writeback-check-output.html
>  536. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  537. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  538. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>  539. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>  540. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  541. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>  542. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>  543. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>  544. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  545. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  546. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>  547. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  548. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>  549. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  550. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>  551. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  552. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  553. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>  554. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  555. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  556. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>  557. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  558. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>  559. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  560. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>  561. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>  562. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>  563. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@xe_oa@mi-rpc.html
>  564. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  565. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-463/igt@xe_oa@mi-rpc.html
>  566. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  567. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  568. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html
>  569. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  570. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  571. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html
>  572. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  573. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
>  574. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  575. https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>  576. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
>  577. https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>  578. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
>  579. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  580. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>  581. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  582. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
>  583. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>  584. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  585. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
>  586. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  587. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
>  588. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  589. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  590. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1961-38e1b615fb395b928e514108e908cd6edf3d34c3/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>  591. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  592. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  593. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138784v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>  594. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
