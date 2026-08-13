Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BF7C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 20:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FED10F4FA;
	Thu, 13 Aug 2026 20:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRzQI02o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4E910F4FA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 20:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786652185; x=1818188185;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s6W/8ezOl/hI2nS9ytIdpwn1NYRCS0ScH76/TIljvX4=;
 b=TRzQI02oB/AbmgXClscBWuNWQibFKMUpxaYPSgyjgOI5RDOARi/eO6Hl
 myvYlf+gFNHQj3RkIVin54EbHQtiJTSXvQLl3vUiA8Z2/8VNUneR1EEU3
 tGSdvDT3Se2bsxjSwM4FW2jhawTvyoutJ4gmigdOcvFaWY0CYFwEqmhuE
 pgFYESZslFlsyr20E1prJHOzCwl/PE1gxJVXDiFpMUqZ1+cWEPDpcBeOV
 pNB6aa5rxrOulFWee47HH2ctikCNfhNojsdez4+LNQp8OIjwHFH5o/Dsn
 Z9Z4h3oBnKvKrfJnHq9fucy1v9QKhvI051vao5lUP4AcmKZCDd6mkejmZ g==;
X-CSE-ConnectionGUID: kogwU4wfQf+MZcONa7ejGQ==
X-CSE-MsgGUID: ZgM+N5vuRfiy0AxaWksWog==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="110020757"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="110020757"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 13:16:25 -0700
X-CSE-ConnectionGUID: R8L3ubIMTz6dbbaIVcT2Qg==
X-CSE-MsgGUID: R/mLuCrWR6CKNXsceKaOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="287512974"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 13:16:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:16:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 13:16:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cR7zS9+6N0zdiIPm1i/bUPHvR8jiZYJn0V6a9fYHmL1zYUbJxzyDRuv23FVk8fdNBoablVcuBqMrdTyEdvwGimtKRDHc6R1yUoYh2ZCK9EJb0TaZLwUvZ/8laPjFjiGGOqjiILmGKmnMEV46+m+o2SLpdjzVyn0+ZsvVVj8QS721IEg/ABJ1aI3m7DYSTyaM0A1GCOEMt4MP2OcI/kxF3xI0QSaarcbVTpSeHHWJQJRO+otPnSMqeP3HEwTtjxzNlBq/bNLs/4Cvpm4fqrRKlcMu4vis1xYXlARTiR0Q7Gc5P+kZBaP75DUDs1CGZFvJzWwXIG6iTHXphjqzSBRkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7z8+msJovGsov7mN/AJwTBh76Z1gr86/ZjyRep7pXNo=;
 b=iRQdcNAkk3PtPAn0p+RIFZqU8mIVEDgehB/FIVjsGwlpAQnc3/PGG+/bIvoTmUFIvMa0APCYVCif6a0LLBKZurVnla5pDgDknkjBq+gIqmA1C0WPbUrhUj8xf1vmu6lYFnsYf2mGouo8S02UjYvEb7KvW6vnZBAVgnK7QM9UdNL+uOsgQl6+S4bSca7SYOqndktT0+RgccGUvY1428AKgXeiK+MzcufsjY7aWypJfxTaLWiDhwtSMvBIWa2lB2QsaUOe0UCkLrf/4UO2Uui/GbA2sGFVTEsLRRz7kh+PmgWlm/erJ6tujy8MHMPL7RW89XWmTZRneqKMLIkQkLkwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB7976.namprd11.prod.outlook.com (2603:10b6:806:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 20:16:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 20:16:18 +0000
Message-ID: <e3ddf01c-6983-4e96-9d81-c75b10ced837@intel.com>
Date: Thu, 13 Aug 2026 22:16:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <741c14be-9fbb-4ade-9959-8f50f9bfec5b@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <741c14be-9fbb-4ade-9959-8f50f9bfec5b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2PEPF000008AB.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::645) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: a40ad728-fd29-4cee-40c2-08def977bbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|5023799004|11063799006|10067099003|56012099006|6133799003|18002099003|22082099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: xD7gakKv262ZMbVk626fexGPeFAlyPSlpK4KxzF8cSKUqbKAoKisrysnMjrtR0rFzS1twyFmtm+7iTDVhZXaCOQYngwahRuZDwTe64S+YwgvbP5XQzdt1XYpUvmRnYVhsQIVjVLW0eyb5msbxdAf2Yxz1FBKQPeIS0MDmmKtkpxTXv3DTBxprIlO1eqeBc1OPaZC2hMabQWOus8s/NYXzpq3/afVg3wr/LhDuiofAIamTskFpJZ5hiw9JI+EzdIxfDE/ourSRQi+mCH0+hWbibuE78ChE/Fiq1ylgF1UVAPhaSShkH5bc2aQ0ElW5FkPJzlNQnqeHvQVNfMwATPFQ/iU8R1uCWI1+C1q9um7J74ZcndaEUdnlNWf8J+1H7SNGyU7zhONulv41iml9NCGjDe/NiKNEOpAkrsXhhP59vMRdsVc/EP6dNrsH75n5ZwF+C5hDzMKgH/Ji6nLGMVbBiHjMO7oeEsqeThYphafLno+T4tKbc1qeRDO1cSXXeukgePxll2Mx34Mo57b8VpL0a5sWbB4Zw4FVr8JaxrvkAPUbDJbbTfw9tqHPoBzBH3F2d21Rxvr+Ymnp4NMHSAPFvQrJObMJXbFgMz6ko5KTmk3VHhsZDeJEGAMCjTTt70Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9DS281bVEyd3U1WU9hUTkzOUs2aThrMEYyekhzM0k5NkxzMklrQ0JMdWpt?=
 =?utf-8?B?djI1R0NTWFNZOWJkZGJseVk3cE9ESytKbk5LUXZvVGNOT3FPU2wybXFJK2Jo?=
 =?utf-8?B?a0E5cmNjTHQ1NzAvRHVMZGpCU0RsNm1tN3BWZ2h1Q2lVM0lETWVwOGZHNGtt?=
 =?utf-8?B?eldQeVpRZVJ6Y1doR0tkWlIvVU1qRVFrMVIyOWV4K0FzTFY4VDdrVEtzeGMv?=
 =?utf-8?B?MERabzVvT0sxMDVFSXc5ZXVQSDZRWUUrRE54NWNlU0J2MkxUQ3JaNjR5VytN?=
 =?utf-8?B?bkN1NjVCeDVOQTdzUXkwQnVpRFFmQXZPc2N3Z0wveU1tVkw5UU9LVGlFUXVD?=
 =?utf-8?B?WlZvU2drRGk0MjY2NFZxY1k0OFFYeGZvMGdOOU9STFAwelk0UUl6S3hQQkF0?=
 =?utf-8?B?SzFwSTN4REVhSHhGTGZqcndMblhxQVcwbThnaXhWY0R3Mm0ybnZrRk13TWRO?=
 =?utf-8?B?eG5kNG01anRnQmVTbG1CV05hd3Q5UXZjTW5VcGlHNTNSWWxydnhsVWFweE92?=
 =?utf-8?B?L1JEWXNTbVJwazRwZENGb3dyM3dCVEpUSU5uQWV4K3RTZVdtU0FEcDNwbzhI?=
 =?utf-8?B?UXdERUIxcEhSaG5sMDJCa3VnY2VKWmxhTHR6eHlqOEJQeC8ydTVTekZOTTVV?=
 =?utf-8?B?TFNvNUZQTmtnUWpsUVAzVy9kcU94N2NtR1I5VFRLOW9Zd0RPV3hIZ3JUalF0?=
 =?utf-8?B?c1BjbzNQYk9TWHY1ODJlVGN0SG5GZW9hdE5OcXNaYXBoWEMyQkdjRkdXRVd3?=
 =?utf-8?B?d3p2TXFRMFRrRWJZWGRLdHI2eHRtcHUySlhuSG1kVFJ4dllWQnFQUGxoeGRa?=
 =?utf-8?B?bjJaRjRLZEF0YzF6M0FBKzF1YXZvSmFPUEl3V1FJNjFXdFZlUTZ5bjU3bzdm?=
 =?utf-8?B?Q1kwU1ArWlFFMTRBcXVwN3hMdU90KzlCL3JaU2Y4SzlDY3YycGZNaGlvUnRz?=
 =?utf-8?B?ek96RzVIZXVCV0pmc3lVL3BIQk1LNUJkbXNhMzUybjVlRlNFVGoxWUZUR1pK?=
 =?utf-8?B?OTFCaGJRZGtWR2I2M2JWdDJIckxMUjhTNUNMN2laNzZuTHdNUjBCcW5LWHVa?=
 =?utf-8?B?czRYSWE5eFhNZVV4blRkcVViR1Q0bmdVckNjT0tIWDgwd1k1ajBFdjJ6Vzli?=
 =?utf-8?B?cHhaTXFSTkprZkVFUEZ5UEFpc3pBRjRNUXNSQks1ODJDckg3SEpWbkVxQ1ho?=
 =?utf-8?B?WlFlV1FSVDdKV0p3bUF3WXhNdVA3UXJFQ1NxaWhicUpvemxaREZQcm1CVkpQ?=
 =?utf-8?B?Y2hWZ1pGNC9uVXpHWUNRY3VDRnFHQVAxK2NFd0MrVkpWQmROUzlEd0RNN3gx?=
 =?utf-8?B?RGJxcjlmTUc5czdjakNqakhiTWExZHJ4SE9WcnI1ZHhqWDZrbkhpREp3WHZB?=
 =?utf-8?B?bGtiTTdDelBUcWs2NTdtY014YWJCeGsrV2JoT0pKY1p1dU5nN2dxZE1za2ZH?=
 =?utf-8?B?a0hucU9ZVjV5N25kRFBMRk05MkFSVEk0VXptMGNlcTNZeDFFZU9QRGFBQ2R1?=
 =?utf-8?B?T2lUOWtsd1N5aHNzRGp2RStpU1VHTXFMRU5DU3d1bzNzMEorMjdwak9pc085?=
 =?utf-8?B?S1pWeHl2ajQrd3BnUW5wUzRaejJVS2J1Q1RveHJuWHIxK2l5R244d20vNVpP?=
 =?utf-8?B?eW9mdmZVK1p6Sjc4QWV6WHljSFBpZWRjY0JBWEhBWjZ5Q0U4ZnZ0YTdtN21q?=
 =?utf-8?B?TEZzM3B5V3dlTmdaanpqeUpZTFVVaktWdURDa2R6eE1lV2J3eUU0KzFOdTdE?=
 =?utf-8?B?UHZTVkNncnBCdnlLbFltMFdNUnFZc1ZPYnpSQ3gxbktQaVk3UzZTZGhVa3Zu?=
 =?utf-8?B?YnNCb2xGa05lQ1FWZFpmV3ZWZlBzeGQ5cGFHVzVORXZVTmxWdHdONzFQbXBv?=
 =?utf-8?B?dU9BRXUwdEFrM1RXSjB5RDRmbjZLdjdvWUszRkhtZnB1Mm9MUHNKeGxwbWV2?=
 =?utf-8?B?Si81Um9YKzhCNmVHUGxkMjJ6b255QXZ5ZkM0OUg2aHA0QVYzQnFuNFhCcWVQ?=
 =?utf-8?B?bTRISUJleHpoSHVMcU5RUnpnMXhvODQ3eEczTzdVOEpLK2N0NElqTzZySUhL?=
 =?utf-8?B?dFFPV3Y1TDlOVk5lSzZiQ282MWQwZ1laSEgrZ0IzSWZabGpHUEIvOG5vY1ZY?=
 =?utf-8?B?TzNvenJhcyt5bU05bFFYSUpVSURKMTRUNDU0cHM0amkwa05QVVhNVEdGUFB3?=
 =?utf-8?B?STdGS2swREt5dFBIamg4V2RtZHRET1VqNDFzSnBad0RIM2VzMFc0SnFzcjQ4?=
 =?utf-8?B?dnQ3cG9oZSs3M0hTYk1OSzJ5ekJKQjF2S245aXZ5NFdvckMxcGFXc3IvNXZo?=
 =?utf-8?B?TkdQNVpwdndrTkd6M3lselJMaWZtd3hwdFA5K3BmYlpuckNIcTcxMWhjamtH?=
 =?utf-8?Q?T9YP+xg3GYj5uMhw=3D?=
X-Exchange-RoutingPolicyChecked: ZNIMdxPeK2zed9oG5Wmkqskhw4pMhZJtHrJejh6k0yubyAO9RRwl89UfvZdZyg1uIgeYIObuM38UMaQeASdE0esl27jygJ0gsXtRTwoDsYGuPBipIORhMpYIG8ayJSNvRYfoCFgvJJJFort/TN2SbeBpGEM+YlG//dFwYg9XdjTuc0hJYRBmr5JKIOmHXs3AKHlfa6f97hV/X4TEkkvH5swInAJwIcoT+xuyccbjSHIaBrZBc56G+lpJBhyQXLO8zMJ4ZmdxMIYSyge5QNtwZIP5bT6nJ7oOphZq8Hu2Yqqp+dcY3h5fNal8EdjnP6dVhmBz8WgiLN5JN7kmg9l0mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a40ad728-fd29-4cee-40c2-08def977bbbe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:16:18.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9MllBKLTSMAfxMhm/hYKPQ70CHpWkAnk+SQm1YrdnBBriIQf/FSWu3JFIr+aXun/zIHa/hmJO59gwavsqvfNZhp0HpJTupcc6uf/jjwyDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7976
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

Hi Badal,

sorry for late response here

On 8/12/2026 1:43 PM, Nilawar, Badal wrote:
> 
> On 30-07-2026 20:50, Michal Wajdeczko wrote:
>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
>> strings that have no stable shape. That is readable for a human, but it
>> gives fleet tooling nothing durable to match on: the wording changes
>> between releases, lines can be rate-limited or dropped under an error
>> storm, and there is no consistent way to ask "which recognised fault
>> just happened?".
>>
>> Introduce a signature identifier (SIGID): a small, stable integer that
>> names one recognised Xe fault situation and serves as the primary handle
>> for triage. A SIGID maps, through published end-user documentation, to a
>> description and a recommended action; the driver only has to emit the
>> right SIGID next to the usual human-readable text.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Assisted-by: Copilot:Opus-4.8
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: CORRECTED is still an error (Michal)
>>     prepare to decorate dmesg with comp/loc (Michal)
>> ---
>>  Documentation/gpu/xe/index.rst        |   1 +
>>  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>>  drivers/gpu/drm/xe/Makefile           |   1 +
>>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_log.h           |  20 +++
>>  6 files changed, 354 insertions(+)
>>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
>>
>> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>> index 665c0e93601c..0247a255f7e6 100644
>> --- a/Documentation/gpu/xe/index.rst
>> +++ b/Documentation/gpu/xe/index.rst
>> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>>     xe-drm-usage-stats.rst
>>     xe_configfs
>>     xe_gt_stats
>> +   xe_sigid
>> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
>> new file mode 100644
>> index 000000000000..45d84a62f185
>> --- /dev/null
>> +++ b/Documentation/gpu/xe/xe_sigid.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +========
>> +Xe SIGID
>> +========
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :doc: Xe Error Signatures (SIGID)
>> +
>> +Signature Identifiers
>> +=====================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :internal:
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 67ada1d6c2fb..7ac3954737f9 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>>  	xe_hw_fence.o \
>>  	xe_irq.o \
>>  	xe_late_bind_fw.o \
>> +	xe_log.o \
>>  	xe_lrc.o \
>>  	xe_mem_pool.o \
>>  	xe_migrate.o \
>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> new file mode 100644
>> index 000000000000..99717fdf74a6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> @@ -0,0 +1,183 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_XE_SIGID_ABI_H_
>> +#define _ABI_XE_SIGID_ABI_H_
>> +
>> +/**
>> + * DOC: Xe Error Signatures (SIGID)
>> + *
>> + * What SIGID stands for
>> + * ---------------------
>> + *
>> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
>> + * that names one *recognised Xe fault situation* -- nothing more. It is the
>> + * primary handle used for triage: a SIGID maps to a human description and a
>> + * recommended first action. A coarse first-order action is documented in-tree
>> + * per SIGID (see "First-order action" below) so the id is actionable on its
>> + * own; published end-user documentation refines it with finer, cross-product
>> + * detail. The driver's only job is to emit the right SIGID next to the usual
>> + * human-readable text.
>> + *
>> + * Why this exists
>> + * ---------------
>> + *
>> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
>> + * strings that have no stable shape. That is fine for a human reading dmesg,
>> + * but it gives fleet tooling nothing durable to match on: the wording changes
>> + * between releases, lines can be rate-limited or dropped under an error storm,
> How SIGID is going to handle above scenario?

error logs with SIGID will be printed to dmesg, and thus could be lost as any other
regular xe_err messages, but also there will be a CPER record generated (a planned
follow up) which should be more robust against any drops.

>> + * and there is no consistent way to ask "which recognised fault just happened?"
>> + * A SIGID answers exactly that one question, identically across driver and
>> + * firmware versions, and (eventually) across other Intel devices in a node.
>> + *
>> + * What a SIGID is (and is not)
>> + * ----------------------------
>> + *
>> + * A SIGID names *which situation* is being reported. It deliberately does not
>> + * encode the detailed reason or the outcome. Those are carried alongside it::
>> + *
>> + *   SIGID    -> which recognised situation is being reported
>> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
>> + *   errno    -> the failing operation's error, shown with %pe
>> + *   message  -> free-form human-readable context
>> + *
>> + * Severity is independent of the SIGID. The same situation can be reported at
>> + * different severities depending on the instance and the recovery taken, so a
>> + * SIGID is never tied to one severity; the reporting site chooses it by calling
>> + * the matching xe_log_*() helper (see xe_log.h).
>> + *
>> + * How to pick a SIGID (the uniqueness rule)
>> + * -----------------------------------------
>> + *
>> + * Pick per *report site*, not per incident. Each site emits the single most
>> + * specific recognised situation *for that site* -- so the question is never
>> + * "classify this whole failure", it is "what does this site detect?", which has
>> + * one answer. A single underlying failure therefore legitimately produces a
>> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>> + * follow a fault from origin to final effect; it is not a duplicate.
> I don't think XE_SIGID_WEDGED fits this rule. Unlike the examples above, a wedged GT is not specific to a single report site and can be reported from different paths.
> So wedging is situation reported from different sites. 

each site will report its own SIGID based on fault site (FW, BUS)
and we will use WEDGE SIGID once we eventually reach that state

>> + *
>> + * If a site does not match any defined situation, keep using the ordinary
>> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
>> + * or over-broad classification is harder to retire than a missing one. When a
>> + * new situation is genuinely worth triaging, add it to the list below.
> The information regarding logging SIGID should be embedded here. 

in latest rev4 this kernel-DOC section was refactored

https://patchwork.freedesktop.org/series/171022/#rev4

>> + *
>> + * Scope: software-emitted signatures only
>> + * ---------------------------------------
>> + *
>> + * This header enumerates only the situations that the *driver itself* detects
>> + * and reports from software: probe abort, wedged, survivability, driver-
>> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
>> + * These are the only values the driver assigns.
>> + *
>> + * Signatures that *originate* in firmware or hardware are a different thing:
>> + * they are produced and identified by the firmware or the hardware itself
>> + * (e.g. via their own records or error counters), and the driver merely logs
>> + * them as they are given to us. They are deliberately *not* enumerated here --
>> + * minting a driver-side id for a firmware/hardware-reported error would only
>> + * duplicate an identifier the reporting layer already owns. The two
>> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
>> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
>> + * observed a firmware problem, not a signature reported by the firmware.
>> + *
>> + * Numbering
>> + * ---------
>> + *
>> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
>> + * in the order the situations were introduced. Values are stable: once assigned
>> + * they are only ever appended, never renumbered or reused.
>> + *
>> + * A retired situation is deprecated in place, never re-purposed.
>> + *
>> + * First-order action (resolution buckets)
>> + * ---------------------------------------
>> + *
>> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
>> + * *resolution bucket*: the first thing an operator should do on seeing it. The
>> + * bucket is a stable, driver-owned hint; external documentation may refine it,
>> + * but the in-tree value always stands on its own. Every new SIGID must pick a
>> + * bucket, which forces the question "what should someone do about this?" to be
>> + * answered up front. The buckets are::
>> + *
>> + *   COLLECT  -- capture logs and open a bug report
>> + *   RETRY    -- transient or already recovered; watch for recurrence
>> + *   UPDATE   -- a firmware update / flash is required
>> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
>> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
>> + *
>> + * The bucket is documentation only -- it is recorded per SIGID in the enum
>> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
>> + *
>> + * When to use SIGID logging
>> + * -------------------------
>> + *
>> + * The xe_log_*() helpers are for these recognised fault situations only --
>> + * important, operator-relevant faults and events. They are not a replacement
>> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
>> + * using them for ordinary logging would dilute the fault stream. Not every
>> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
>> + * a published situation.
>> + *
>> + * dmesg vs. the machine record
>> + * ----------------------------
>> + *
>> + * The dmesg line stays close to a normal xe error message so it remains
>> + * readable for admins; the only stable, machine-matchable token on it is
>> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
>> + * text may change freely, and lines may be dropped. The durable record for
>> + * tooling is the CPER record carrying the same SIGID (generation is a planned
>> + * follow-up).
>> + */
>> +
>> +/*
>> + * Top level Intel Error Signature Identifiers.
>> + */
>> +#define INTEL_SIGID_INVALID			0
>> +#define INTEL_SIGID_GPU_START			100
>> +#define INTEL_SIGID_GPU_END			999
>> +
>> +#define INTEL_SIGID_GPU_XE_START		100
>> +#define INTEL_SIGID_GPU_XE_END			299
>> +
>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
>> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
>> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
>> +
>> +/**
>> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
>> + * @XE_SIGID_SW: Software component failure. [COLLECT]
>> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
>> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
>> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
> Going forward there could be multiple actions associated with survivability mode. 

in rev4 we dropped the resolution bucket idea

>> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
> 
> Are we certain all runtime firmware failures lie in retry category?

ditto

> 
>> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
>> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
>> + *
>> + * The situations the driver detects and reports in software. Values are
>> + * numbered sequentially, are only ever appended, and are never renumbered or
>> + * reused. The tag in brackets is the default resolution bucket (see the `Xe
>> + * Error Signatures (SIGID)`_ section).
>> + *
>> + * Firmware- and hardware-originated signatures are not listed here; they are
>> + * logged as reported by those layers.
>> + */
>> +enum xe_sigid {
>> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
>> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
>> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
>> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
>> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> 
> Is it allowed to maintain each firmware as separate site?
> e.g. XE_SIGID_RUNTIME_GUC_FW, 
>         XE_SIGID_RUNTIME_HUC_FW, 
>         XE_SIGID_RUNTIME_GSC_FW

no, there is just single SIGID for all those above firmwares
but we do have LOG_COMPONENTS for each of those, and macros
accepts them instead of raw SIGID, and xe_log_emit can use
those components IDs to decorate dmesg and update CPER record

> 
> Thanks,
> Badal
> 
>> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
>> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>> new file mode 100644
>> index 000000000000..70a41bdf1a01
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_log.c
>> @@ -0,0 +1,135 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include "xe_log.h"
>> +#include "xe_printk.h"
>> +
>> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +			  u32 component, u32 location, const void *data, size_t len,
>> +			  struct va_format *vaf)
>> +{
>> +	/* TODO */
>> +}
>> +
>> +static bool is_hw_sigid(enum xe_sigid sigid)
>> +{
>> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
>> +}
>> +
>> +static bool is_sev_error(int cper_sev)
>> +{
>> +	return cper_sev != CPER_SEV_INFORMATIONAL;
>> +}
>> +
>> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
>> +{
>> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
>> +}
>> +
>> +static const char *log_sev_prefix(int cper_sev)
>> +{
>> +	switch (cper_sev) {
>> +	case CPER_SEV_FATAL:
>> +		return "FATAL ";
>> +	case CPER_SEV_RECOVERABLE:
>> +		return "";
>> +	case CPER_SEV_CORRECTED:
>> +		return "CORRECTED ";
>> +	default:
>> +		return "";
>> +	}
>> +}
>> +
>> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
>> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
>> +
>> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
>> +{
>> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
>> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
>> +	else
>> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
>> +}
>> +
>> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
>> +{
>> +	struct va_format vaf;
>> +	va_list args;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va = &args;
>> +
>> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
>> +
>> +	va_end(args);
>> +}
>> +
>> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +			   u32 component, u32 location, const void *data, size_t len,
>> +			   struct va_format *vaf)
>> +{
>> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
>> +	const char *sev_prefix = log_sev_prefix(cper_sev);
>> +
>> +	/* TODO: add component/location details */
>> +
>> +	if (IS_ERR(data))
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
>> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
>> +	else if (data && len)
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
>> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
>> +	else
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
>> +				 sigid, sev_prefix, hwe_prefix, vaf);
>> +}
>> +
>> +/**
>> + * xe_log_emit() - Emit a structured SIGID log entry
>> + * @pdev: the &pci_dev device
>> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>> + * @sigid: signature identifier, see &enum xe_sigid
>> + * @component: component identifer
>> + * @location: location details of the @component
>> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
>> + * @len: length of the @data in bytes, or 0 if not applicable
>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Emits a dmesg line that includes a single stable, machine-matchable token
>> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
>> + * when @data pointer is set, either the error printed with %pe or a packed hex
>> + * dump of the @data binary blob. The dmesg line will also include printf-style
>> + * text message.
>> + *
>> + * Note that the full dmesg line, with the free text message, is only a debugging
>> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
>> + * The durable machine record is the CPER carrying the same SIGID.
>> + *
>> + * Note: generation of the CPER record is a planned follow-up.
>> + *
>> + * Examples::
>> + *
>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
>> + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
>> + */
>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +		 u32 component, u32 location, const void *data, size_t len,
>> +		 const char *fmt, ...)
>> +{
>> +	struct va_format vaf;
>> +	va_list args;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va = &args;
>> +
>> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>> +
>> +	va_end(args);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>> new file mode 100644
>> index 000000000000..d475e816ee0b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_log.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LOG_H_
>> +#define _XE_LOG_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +#include "abi/xe_sigid_abi.h"
>> +
>> +struct pci_dev;
>> +
>> +__printf(8, 9)
>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +		 u32 component, u32 location, const void *data, size_t len,
>> +		 const char *fmt, ...);
>> +
>> +#endif

