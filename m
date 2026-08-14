Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F95C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C0B10E142;
	Fri, 14 Aug 2026 13:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0zVbRcx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEDC10E142
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786714333; x=1818250333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UenjoQpS6xMJqniqVAq3qZ/oA42tikyWXrbIiApp0II=;
 b=Y0zVbRcxZtO8V1PV/Cz0uiz4LqR3uhlf7RWg1h/BPYHDkhZtqSAu7H6l
 V6yFDXCncQSHusnaiEcS5gbHs4Ww7fJMdIZT9fxXBH9DUMw+WxrG+RklZ
 54oiFJugC/CUokOu4JT3SkqA9Ny6gfhJRiCqO4LGdQd6UYAXWS2F1QXtn
 jh9ZPgFoaot8k0VkndL3DR2BPpVZyWygAtI0dItIUQEjBrFmETV90NjF2
 iEtLt0IEAy2949lalgugFjkFh8Sfddl6AcWesobaok8TKEWvVk2JB/YNj
 eGSscbERh/NnYjrbrfIMPwwGYahmVeDhFgfmpK4pnkT2xKGdJWm8GCLVg g==;
X-CSE-ConnectionGUID: aTAvbojQSK6uzAopPxzEew==
X-CSE-MsgGUID: oI1nIQmFTbCWOkptBHL3Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97883029"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97883029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:32:13 -0700
X-CSE-ConnectionGUID: WL/6gs/7S+mPP0nC94wDoQ==
X-CSE-MsgGUID: I/gLg2M6TRuvD9Jz7+jiJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="261581311"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:32:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:32:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:32:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHVuN7yo9iqy+USAICtsHTCQI/LJ4auoPaHm+5Safpm+zR5Prg5bx5fbwt42vSeCZ3VE70lHbd8ZdcrwblFVtdTs/2C/ylMYGvSzcQ/PR+L4kklsi0EndiAa/S0dqBR/k9ZIX2UNm0p6mHf1yS0wbmpKCtd0F3/6UAhNf7Gi6uhUsRUdx3l5M7fb4DU4tuGfQUiApKuqTaVDg7WgbNb/Pumu5xZp12s+wwX5XYPLgfX6MJSbAHdOhVShzKUow6OUn63E3iDWcZVFNqCHvarpxlbVe17sHQpiZ8J5SdemprlfpXVcvHFscJKYrnHZCdLPmcsyGkKniuFvIQ6eVCVhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b45mE5NgW9Rn97E7qeXVMA3BTWedYkbxUL+DVA/ORzY=;
 b=KbdduyNm6IAyl9dr2cQNf7lARf+rQ/yKe5JJEggu1deg7aQfv5rKZW5+0aJbii238HvXVGZulJL3haSOxulLnZEPp0jmsR/kWjIutaNQZ+k0k0N2k3LE/4x1nZEYt2vXEV9vbLyywi+nyp8TA/Zv0iQ6W6Nj8Dedr7xcEGuJJJz/r494qQYkI4pwEogxyYWFRqLXVvLcZKWsbBoh11Z8pTdsAu65jx+dUv88GlFrK5V3w2kqS4/Y60O/h5tGY0E4CBeiQOMgEo3KlL7NGK2kfgYcOWRCJ542XLXZQD5OWg2DKkBbf51ThSA1DBwERPXLDrxFlv6OIPiLTIBMwsatfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB9472.namprd11.prod.outlook.com (2603:10b6:208:5ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 13:32:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 13:32:10 +0000
Message-ID: <edce6b28-753c-45d9-b43a-8184cfd44615@intel.com>
Date: Fri, 14 Aug 2026 15:32:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/32] drm/xe/survivability: Report 'sysfs failure'
 error using SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-22-michal.wajdeczko@intel.com>
 <cfcbd22e-88cc-48de-94c4-875e6d8f6a55@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <cfcbd22e-88cc-48de-94c4-875e6d8f6a55@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0056.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:353::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d89fe08-ee6b-49be-7ec9-08defa08714d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aMI/3QKH1nIoYQKZvJi0dKBuRvmdwTO7OqRr3Xz8x0YYuHjMbLMugexpxLpv0Pyfqi2P8EeLRLq2T/sI+ViBYz9OQHLp+ZOVYcdeJKG/zoI8sLQdDVeqQLalhBbKdhjS+DQQzWVln6lSTmnk0Ji5GCguMIKYdfKmrBzd9GR0RZAkykyBezsjH4TlCEwxsfvoAgY3Wa4MmQHTdWQueHYaEJE5SASvWmr5KEWQ/LvsZc17Go3KU/bWZqvkTd3G7P4fBF33uejGfqYUNnsVcT3lieqgBNp5cB3b7XmzBH7yZLJj+RVEatTCoqDiQdeeQaTveM6FVakE6T/D6D5ZHKg4g5fx7g/j0FYTm0RnmjK2rN5IjlIyCk8YYfRier1Y47wRvk8mmD89dPC0ZQJmg1aGl5Ou9HG+owkc2Z5av1DEG+FdpxBFUKcAv21b/ujLS3w2iRXyB5yuVGXc3ee4vIxyzBV5kTq50zfiUplh0FPdWSdj+MzysK/F+AfiVssS83MfdkLXRseC14Q7Y18Ra62CR2StSSXZnWslDHQzJJqtq1CcghDGnN5lTJ0AOVLYuDflnPdyGx6vyg1jjlUZDU+OZFihVx424f8tzYtJuzLnnodps40UTIryGEsgUAxHyYh+ZAe6Ia0Ita1vS8Q5VkfcX8A4NKw4Ynot/yZ7E+XJgSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MSsvT1JSMGxSQlJFUUtyUG1QZGR4U2lpd0l1anIvSkFYaGJOdXdXSlpzVEM4?=
 =?utf-8?B?cDg3MkwxdUwxRWl5MHUxbmloS1d4Z20wbEVEdDFibWFDWGhVY2Y5QjhucC84?=
 =?utf-8?B?ZGFQemI1L0VCak5qbm5NdE0yME5xSzNvcU5jajNvYnM2ZUEyMzhSeVhHT3py?=
 =?utf-8?B?LzVxODFiUE02RWdia3IxNWZWNldrWUxGYU5BczVwMm90OXlSYTFQSncyMXlN?=
 =?utf-8?B?SHJLcGt2OVo3ellLT3Q5RlA3M0VwZklCc2JqYi9hdk05US9XSEphemlqdklB?=
 =?utf-8?B?S01xbENBbTZmSFpsT3hvVXNmSEFRUFl3VnpoREx5eHkrSWhCTndUMmFVbXJx?=
 =?utf-8?B?NTk1dEE4VVE2cUNEYTRwdHpjWkZaVGlGUHY4ck9yRHBqMmIvTGovTnJhemc1?=
 =?utf-8?B?bE43THFNSC91M0I0VEx5QzZBYUFpblU1amQ2WjZNa0I2RUgwcmtIdlBHZjVt?=
 =?utf-8?B?YThIT1dDWEczOFllUkRxenpHWDhrckFhd1pKWlpyVjRCTnFFM3h6YTRLQzNJ?=
 =?utf-8?B?eVRYVzM1aWR5djBPRnJIWDloTFBWeTUvSmdLd3ZkcThOTzI2cTFvYnZsWHY3?=
 =?utf-8?B?a0ZwRnFsb2dNT00rSXZVSlFpTy9NRy9BYitWbWhsR1Y4LzZWR0dJRk5ZSllI?=
 =?utf-8?B?R2VrZytZZE1xYzVOMDRaeDg1VE1xMHdiUnBLcnM0SHM4TEZtR0liZE9HeEwv?=
 =?utf-8?B?YmRpVGlVaGExYjRIWTl4cW4vRHBINDhZMENPaTVyUmNsMTJPeHZsOWR6UElS?=
 =?utf-8?B?dmppbU04V3lZMUdSVjRYaSt1WG4rZ0twSGhHNEVhUzdOZmJNT1BZR1lBMkp5?=
 =?utf-8?B?ZmlPSDFOeWg5NjJVd3pva2Q5L0FPREIwNjdVakcvZHVlbUtubGcrQ093V0FV?=
 =?utf-8?B?WG4zdHdSSWN2dU4xVXJHeTV3Z2RxQzVTVjJ0aXdDOHIwZDJ5UEdyOFVIdzFD?=
 =?utf-8?B?NkpoQ1FKd0x1bUhHNFRWVGRJUm1QeStZRGZRNHdSbXNmTXF1WFViQ0Z3ZGFm?=
 =?utf-8?B?ZG5CRUZXQlVNTVVHbWR2NFA5VzkyUldMejBPZHVCZTRqUDBQYUNFRlVvbHJx?=
 =?utf-8?B?WUVEZTYvU3k2d21tV1h2TXc1TU9QNDFpL25ZM2Y2ZFhmMTJjK1FIVXp4M3VY?=
 =?utf-8?B?SEpJMnk1bnZvQ3k0bUdUL3RIZGRWSU1saUxIMVNiaUNudnFCZ0tDQmliUDBp?=
 =?utf-8?B?eVhPZFhSVDdacXNMMWVTWEdJcDUyZkVQQ0xHNlZKbkQxakF5b1NXVkZCRjha?=
 =?utf-8?B?a2J6NUQrcEkyeFpkbURTaFNPQ1UrbmZqZ0NEV0haMzkrSHR4UmpUQnBzMW5w?=
 =?utf-8?B?M2loSU9aNUtTRTNleG5MMEVCRWd0MjJyczlVaWRBNitlMGlqa0J2TitwdUx2?=
 =?utf-8?B?YytseUcvSjFza3pCbVV5Sk1ZVDM2U0hhVTd3L2lkTnJPVENRMUZza1FCSGtZ?=
 =?utf-8?B?bjRlZ3RDc0NaWUpxUGs4ZGJQS2JIYW5BMFNiYUJYaklUMGNyeU1lc2kzYWhq?=
 =?utf-8?B?UFE5ZlpoQzhDeXU3eCt2TTZ5ZmxYNFh2Y1I0UEVNbzJ5V1FnanRHSkdnYVlr?=
 =?utf-8?B?UU9vQzcweFZ0Sm9VWE01MGdkcW9PV1V0RUdrbUNXaU52dzkxSS8zUW1TckVX?=
 =?utf-8?B?VW5wa2VpdDRsMzFGT0Y5U0ZkY0lWTnMvSTEvZWhRN243RVNzZGIwVUNzb3hK?=
 =?utf-8?B?TVNHNThhNTlsWHFtYUpTRDBEN2FPeXdKc0JTTTlDZ213TS83clY3bnZYOGpk?=
 =?utf-8?B?bmFBSU1XeGZJRWRCSVRzSlB1TmQ5am1hUytmc09yVmNidWVNZmdPRmhxOXFD?=
 =?utf-8?B?NjZuNjdRWll6NFJzTE5pNkJNdVJhekxSUFNEM3NuWkN6M3F0bTFRVWlFcnFa?=
 =?utf-8?B?SjZWRSt2UjdUdFlXb2IvNGxvRFUyMUxaYis4bitLQmM2aHZuYmdSVWVqWFZo?=
 =?utf-8?B?Z3pnVGwwNUNxbzhpNkZrdHpqcFRTdmpSTzE4YmpHT1A2RzJGYW1ERVByU2xK?=
 =?utf-8?B?OE9NUTNkb3VPVGZxQ1ZZL1VpQ2dKZzhSQlYvOHRiRDF4T0QreEpXYTlJV0hV?=
 =?utf-8?B?SDlEQjFmMHFYeFlhSThVSnZRTDVpOW0yVjR1emM5amdVb2V3ZUVYaFlGa0Mv?=
 =?utf-8?B?ZVh2ZU9jU0lIY0s2Tk9hdW9ETEE0WHJ6MzV2b1RDSUlaU2JaQUY5TjdWNU93?=
 =?utf-8?B?eFpXVTI1djk4aDc2MEdNZnZsaEEwRVhDbjJTcXQvbW40WmcrbWhWNmpHdW90?=
 =?utf-8?B?TXMyaGNWSG5BWS9VSFdMdC9vRHNDVjNNVnlNMHgxRS9Bek53VTc1c0Y4Y2hB?=
 =?utf-8?B?NkRMeDJxOENjcDB4S1NJZW9VUkFLOUQ4N0VnTjhoK0ZjaFBZazFFSWlEV1g4?=
 =?utf-8?Q?kk5puBBxUXhXxcyE=3D?=
X-Exchange-RoutingPolicyChecked: EleKZ3l0JkENG9jn7z3hkL6Ig1KGf+sYWjneIdCo2wXTlj7BEo1CeSyb4ymTReMpmOslvAChCjR1Epo7hKaWXCW+vbS2ff6WD1CRi3CIl8fXm0fDEx1U23BQ+3FXKqsQwud8RSYa7/du4XzGbs/mOlfX8+/7C5d6nfloCtxPoBbgbhJtCLNDHdEAQreGj6ZhqddEiemS2rId+PJrcA7V/koEtQ4hPWyzdE7RpVmvm2ZE9lIq+clVKsBqaa7/Y7u7VncQc0UMH6ghnRGTtMQJxzGxNf/HCzuIAxwfb6Vzng+3f1KZ2zBUhUp+nQaTR3DpZyO+ZUeYdQQ47oOMqK/CVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d89fe08-ee6b-49be-7ec9-08defa08714d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:32:10.5058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBXV4ECtnIRlCOSHuuVbAQVN5SlmCYE68fHqckdxQ4uoKdUGnF06d2L20Pxjox1W0l50hm3PZpHJo13KRq+4hAx0EoGr6jmbvyAaf1eJ6OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9472
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



On 8/14/2026 12:34 PM, Tauro, Riana wrote:
> 
> On 13-08-2026 00:44, Michal Wajdeczko wrote:
>> Report 'failed to create sysfs files' error using xe_log_err() helper
>> from all sysfs failure points and for all call sites.
> 
> Is SIGID appropriate here? My understanding is that SIGIDs are meant for failures requiring corrective
> action either from driver itself or external.
> A sysfs creation failure is a internal issue and may not belong in that category.

but it will eventually lead to probe failure without
enabling boot-mode, so IMO it is better to have errors like:

	[drm] ERROR SIGID=103 (-EXXX) SURVIVABILITY: Failed to create sysfs files!
	[drm] ERROR SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable boot-mode!
	[drm] ERROR SIGID=101 FATAL (-EXXX) PROBE: driver loading failed for device XXXX

than just the last one

> 
> Thanks
> Riana
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 85b4c125a217..2d8c532157fd 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -280,24 +280,26 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>       int ret;
>>         ret = device_create_file(dev, &dev_attr_survivability_mode);
>> -    if (ret) {
>> -        dev_warn(dev, "Failed to create survivability sysfs files\n");
>> -        return ret;
>> -    }
>> +    if (ret)
>> +        goto failed;
>>         ret = devm_add_action_or_reset(xe->drm.dev,
>>                          xe_survivability_mode_fini, xe);
>>       if (ret)
>> -        return ret;
>> +        goto failed;
>>         /* Survivability info is not required if enabled via configfs */
>>       if (!xe_configfs_get_survivability_mode(pdev)) {
>>           ret = devm_device_add_group(dev, &survivability_info_group);
>>           if (ret)
>> -            return ret;
>> +            goto failed;
>>       }
>>         return 0;
>> +
>> +failed:
>> +    xe_log_err(xe, SURVIVABILITY, ret, "Failed to create sysfs files!\n");
>> +    return ret;
>>   }
>>     static int enable_boot_survivability_mode(struct pci_dev *pdev)
>> @@ -403,9 +405,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>       }
>>         populate_survivability_info(xe);
>> -
>> -    if (create_survivability_sysfs(pdev))
>> -        dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
>> +    create_survivability_sysfs(pdev);
>>         survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>       dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");

