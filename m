Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11680CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 21:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D4F10EAEA;
	Thu, 28 Aug 2025 21:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ij77YTvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498510EAEA
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 21:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756418069; x=1787954069;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aK8rZonGDKGudIYcWpAlN5N5PIQNrqxl9XGk15OcMsk=;
 b=ij77YTvWtqCuKp+jG/VqGzjM/izrcZb4ggC1a6FWIDTa/wQ3ZESrmw5R
 /iNBtl3Z0fXquCpQbCxQMt5G3Tb79zAIl40nL84NoixHQbpD7MIYouteA
 Cxwb2ISa/avUzBl2XN8vwoq8OnKLoieTNomBlqurBymcmdkuoeMZo4f8K
 TcfcTHlf2/5KXRzYtA/Ye6m9LN89NYQCYVtc7Xz13hG0jsGB9q2wZ5med
 8ooVx68XICLM9m6hyTw6j8XX5FNRPTox1aW02z3NjyqzoKnQHm3G1WSuX
 vp6H8ZTlN30yi3G7+lJ7ngxzYGjE2B+/F1D6TSmW0L5M8nUbTyn3KupPZ w==;
X-CSE-ConnectionGUID: xxB0JOggQIyFrKXFUs89IA==
X-CSE-MsgGUID: FgCdSK5oT+WpodAHPnfhdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69798703"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69798703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:54:29 -0700
X-CSE-ConnectionGUID: 6DEUNK9LRW+bg0fquw9EOA==
X-CSE-MsgGUID: uDKBNsM8SLenxPS5DO9a6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169802213"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:54:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:54:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 14:54:28 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.46)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEyf3M0YMsymg0kzWYwtdgypX4iVWveRqhW3xNJJu74IO2xj6nA+2E6FKXCrECCA69ceOGweNgjKJRi+99MK/ZCoNa2SagzoFIsFrX3SpX+yUQQIMK9JdqNPVTEvNHMSRGQT4PcL8BklQe+GVAl0EnBEbC4ToAECGUwujtWLzVg7b+840RwN28FrJ+5vjBpq9Dy0gTJJblehSCU4DFuYXsVrRmGqMdhSBlWueZDeLMaLc2i0USyEwiknvqrfxRLluv3tWZzsUN1IkCIv7GoCXftuvnTenqLRCif4DBpI3NoIZLBc4fA07R2nt6RYqs7dGYQxRYXY8/n5glpSXzxvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnjPVNYot864ua6SSFDGgo/Qihm4zzP02ShlDh0wzkI=;
 b=LClQb19yarbGrYMKvGNDCtMn6Qpy8ZcZlpYviNv9yux4YQJOTMI2xjGEmgsNp67gmZP3iPIxx5+ZFWHG3sCP9rX8AoLvmrcotYY1X1UvvpzHgzPyl6ncbP4e9mZI1IAPQPrRuCjGpsK0mQ7htx7/gn1xBNFFii9QeU/MvQLqxR492z5OSJIXIZ9c9mEXG5nPzh6g1fn8UB2gZDJ/aRa2eKAem+eWIPBU9s8Zlk0cgVotj+FqYVuSufGMXLBHSiFuE6RIMDE8oi8ZqoMOCytlHpFOswoosAuJD8QCSCDnEtffM0+wrk3HhRxeJ2ljL1KOD9lEhgoDzJ8xEG++n1Zzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 21:54:22 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 21:54:22 +0000
Message-ID: <d1fd4ac9-955b-43fd-b9ed-b0f62aeef57f@intel.com>
Date: Thu, 28 Aug 2025 23:54:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/guc: Add devm release action to safely tear
 down CT
To: Matthew Brost <matthew.brost@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
References: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
 <cb231cc7-0173-4b7f-8d1d-b480ac76bb6a@intel.com>
 <aLC0oPvt1ZqgEVat@lstrano-desk.jf.intel.com>
 <a19ec502-266d-48cf-af9e-c89070799a20@intel.com>
 <aLDNhqSV3zfgSn3g@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aLDNhqSV3zfgSn3g@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW5PR11MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: eea9a5b6-b5d7-464d-cdbd-08dde67d7217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTNYSlFhOEdYSE1ZTksvUjFhTFhTTzZ1NndORGM2YzgwNCt3alFleGtKOUxN?=
 =?utf-8?B?Q1h5eTlqa0ZrS1pvM0kvdnd5eDcyeUpMV0lHTjZVeWFHc1F4aUdDY3dPNDE1?=
 =?utf-8?B?b3NWa21NTk8rY3dJRDZJb0orL0pJY3lkalRQT21rUlNHZFlBaS9rRStaMWY4?=
 =?utf-8?B?M1IwRC9lODFIa2tFdEx4aDNFVlBSaGkzQmdFdmNjYmRyOVp1VUpzSHloK2JP?=
 =?utf-8?B?eHZucUcwL0oyU1N5K2JUUXM5aFlLUjRIanZyVXlhRHBFSWhXNEFTNHZEakYv?=
 =?utf-8?B?c1N2aFF3WCtWS3JmM0puSVQ1aEI1ZUZSUExaZVJjSkZaaDdwK2FJalBJbW1w?=
 =?utf-8?B?SVV1ekZ4bTZGVjdRWEg3VVc3MEFyY3htbDRWUGZoWTlzOEtIaDdmU3lMaG4w?=
 =?utf-8?B?WEZvZ25JMGxiWmEvUU5vbXBmZTV2a0lIblZDVlRybmtLQzZoRk9acXZaL0hJ?=
 =?utf-8?B?V1d1NlAyTSsxWDVkWjgrNG1vbSt4T1NHMFNBZVhWVHNWd1JtdUY1Y3NYN2N2?=
 =?utf-8?B?NVFoeHRaUFhYcC80WTAzQS9ldCtwWDZpUlhQRVUweUNIcDdsZlo1U2QyM3hm?=
 =?utf-8?B?Wk1MSi9PR05pb2plaWxpQlhSQ1YrU2VMaVBRYWFMR1FKa0M4OWdLOUIwY0Nu?=
 =?utf-8?B?bzNuM25yRVJ6MFZ5RS8zOW8zaENoaWZiZ3AzRFdoY1RIcVNkYkxXUVFOZEpr?=
 =?utf-8?B?K1c2SnRML3BXVzU0VGQxaEVzdGVnNlV4MGdYSnBRNjFNdTdJL0JaM1Y0bWJk?=
 =?utf-8?B?bnhrdEFQY3RiZnRRczlZOGlObzRlSmJqcE4xL1dhWTN3MWEzbDY2NDBmeHNR?=
 =?utf-8?B?OEtJR3JNa2g2S3ZXa2g5RVRhS09BUkd6Zy9QWU0vdUJVNFJ6b243NzNCNjdP?=
 =?utf-8?B?Y2g4R2pmUjJ2QjljU3BUaDFJVEhtUGZFVlRqRFdzYWpmS0YyVFZsT2pkYVkz?=
 =?utf-8?B?ekR6SnpJRDVKVmdZbXFmVnVCcHREejltNjI5OTBkUDcxTEhpSW90MVVOUFhz?=
 =?utf-8?B?MFNGd0ZzNkFuWTZveTNzL2c3Z2c1a1RoZzZaV00wUWMyZUVERHc4VDVUeUw3?=
 =?utf-8?B?eXkwOFJRQW0vcHVkcTFLV2NCUS9sejhLSGlUS2ZpbnNod1MycnNISXFJQnA1?=
 =?utf-8?B?eDBQWmxvMVNOd1dVbVpGbHRqSk5ROFNFUkxLUnNnYStiM0oraWdpVHNmenZj?=
 =?utf-8?B?SVpRS3IvbTE2RUVxOHVvQ25oOXgzb0V0SXFDei9HVE5mekdvQkxHRFlKSVJm?=
 =?utf-8?B?MlBCek5VSzMxOTZBV0ZFWmZkaW1Fa3AzMFVxMlE5QW8rdVVlNzUyZHVudlJD?=
 =?utf-8?B?YUZTL0tOREh5SFNEdkN0VkYyWmRuOHRMVzl1ZUtRSCtQem1OcVJJUXcyQVFn?=
 =?utf-8?B?UmdEUk9vWExackRrTEpzSmtUL0owV2hXazc4MWZEOHZLejNlTGJQaUZXb3Zv?=
 =?utf-8?B?T0JvNlZUVHJyUEhXN1ZZTzU1eFBuc2tlN01kUTFSSEMzdHd6NDlwVlN2Ym9l?=
 =?utf-8?B?OFRoV2UrcUZMcmNZLy9KWkU5aWRzdHdQTlNPM2ZZZ29tNzA0M2k0Sm1MeWFx?=
 =?utf-8?B?dHI0RVkzbjZodkdPNlJoU3pDTUg1czhBNndnekdDNk54ZlZseVBtcHl4cVAz?=
 =?utf-8?B?YStmSEVhZnB6UlU5bFRFZTM2VVY1UDhCd3ZxZEMvbW5oSzJxdnNFeitmQzdY?=
 =?utf-8?B?NlNndmphbXlPUU4yaGhxeHJUajVzQ0FlQS8rdUtKTTBZRzFRK3k3a0RoOE0v?=
 =?utf-8?B?T1o3UnZMajFaRlZVNTA2eXVWLy95emt2OVhzTDl1MDV3UXZhUjB2N0lSN2Fs?=
 =?utf-8?B?ZERESVQzMTV3K1ZlanpSVDJkWDB5V3UydFlNb1hJOFVnTEo4Y3VESmx5Tkkr?=
 =?utf-8?B?YUNqWi9xZnFGMTR1Qk01dE9Ecy9LdUhXajFJWW1vby9IcmxjNmt4bHVmUEw3?=
 =?utf-8?Q?+vPLXIXvl0Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVU3MVdZVzVEalZuS0ZKbTN6S3hIUkxLb2EzSm0yUll1SkprdzlYM2I2djFZ?=
 =?utf-8?B?OG1iU0tDVk1OMFFYaGMvdW5SMGZaT0VoZ3dnRUNITDNZeVJEeTlSeWYvRTVU?=
 =?utf-8?B?aDBDeitueUgybkNSOHlwVk5lUWx3REoyQ0UyNFdIRzhMMEE3bjhub3BnNmhB?=
 =?utf-8?B?WnA4ZlFPcEdlWUV4TFpYZlRzdzdlMUxBaHhWUzNaZzc4YlFkYnZjNFV3RVBC?=
 =?utf-8?B?WXB6YndNeTA4aG0vOXpVYktiUnRBZnhMVVhkaUx3bE9vcnU5QzBkTGdZVFNu?=
 =?utf-8?B?d0dRcG91RUE2YnlxVWZ2THFZUStnTUNMa0QwQTRlU29waFhKclJ2ZU5jNnFI?=
 =?utf-8?B?YVBIcG12TkZYMk9USDN0WTFDK3VuNWN3bkFJekdUeVE3Njhhb1psdHZjTWEv?=
 =?utf-8?B?WnhUU2F3NGZBbXVBNWFpUk9FTFE4VWE1SC9pb0J3TGpUM1dnYVNxb0psOTZz?=
 =?utf-8?B?dGtDdkVHYWFNeEJ2Ylc4b29MK2RMOW1QSWh4M3BjdVdIRHlxZkt4N2xxRkUy?=
 =?utf-8?B?TmlqWWlzV2twOUkxZmNKZ0ZKTEFnemorRy9TWXJBUkJrYzhoNGdLTk92ZkNG?=
 =?utf-8?B?WkdtNVdPdUloQTZLUWIyc0pGQVZMaDZUamNBS2FNOGtwOW5QVDFobU56alRM?=
 =?utf-8?B?bGwxQ0xoRXhyYnRmY1ZoSXI2eHBkK1IxRDIyeDdncXhEd0Q3V1NZV2pwK3Fl?=
 =?utf-8?B?amxuTjB0bVhtOExQUXBzWjZsa2xpdFdLOXkrRTM1OHBOV0JyZnJiMFZ0ZXhw?=
 =?utf-8?B?MTNkcS81ZnBmMGRYNTNzdm9SZ1Y5VTBncStvQTlSN0lSZytRY0hpUUtvQ3Bt?=
 =?utf-8?B?ai9DR0VaSWtqYlhGYXFKR3FPaGRXdGVIc2J4anJ3Y1BBQ0J2eWNBQzRpbVhQ?=
 =?utf-8?B?V0pKK2FkRExSWkcvcUUzUXpJZ3ZUYkZVTGFvTzhNZy9jZUpHNTdIUndWRm96?=
 =?utf-8?B?eFZlS0RsREN4clprQnQ4M3cyK011aWUyN3grU1RYa240NUc5cXJReEVPTjY3?=
 =?utf-8?B?MmtJMUc4TzU4dnRnckxYR2pnc2RiYldxejF4aUpCczhrTFFhemNIZllmeGJL?=
 =?utf-8?B?ZDVtM3hNaEgvQ291UmpYR0VWL2dUL0ZlbDZnWHpyQVB1RFpDekZVNEVBb3cr?=
 =?utf-8?B?YmVJMGwyK3ptKzRnZ2R5NlJqMWFITmxMODRZblQ4d0hGUWx1c1ZETjVUVGRU?=
 =?utf-8?B?VEdQV2MvUGcrT3JzZC9nWi9zZ1hjZGF3NHJiaTBrRjNwTjh2Y3FNdEtnWDZP?=
 =?utf-8?B?SUpHdVlXZS9iMWxkaXRPb3pSd1JVY3BBakdpcEhISVRXNnpoZU9sV0hHcC84?=
 =?utf-8?B?VWd4amNPSUhiSlFFbmxVYWgwbTBRRGlHYWd0c3ViOUx0T0doM2JaM0g0QlZo?=
 =?utf-8?B?a2xtamxxTFI1Yk9nMFZESTlMZUdsU0hNOWNjbjg1cUhKWjBvZEZpTmlndUlX?=
 =?utf-8?B?MzhvaE9wUkt1cEc1OFp0TFR1KytuenlsemxuY09JNjM2Z1NFdm5YZ28zazA2?=
 =?utf-8?B?NnF6MVJkSkorbUNMbStNVGc5MEpxdmxRZVN4Rml2K0dqWnNVUUxyMWpIajNs?=
 =?utf-8?B?a2RObi9PQXU2R2pmTE0wK3M5SmFEZFlpdzdBck5LZkM1Z0YzREtrNGt3NE5y?=
 =?utf-8?B?MTRpczVQRklNaTYzK1VVVzh6ZHpyMGdOUDVMdm5NeFBPajRSVUpXSUZVSXRt?=
 =?utf-8?B?VUdoUThYbGNzNWEzdTdlcWpLZFlSb3hSN0Fwbm9EYTR0dk9hM0VJZStBRWlZ?=
 =?utf-8?B?ZS91SitUejN1eGtyYW04MFNnTVZBdW5wbUNWZE50Y2hGY1d6UkxLQmQ0TzNJ?=
 =?utf-8?B?b3htSkdYbkFWV0FOWHJrTEhQZGt1M09pck9JUEY3cEhtOG5kOHZjdWpEdTFy?=
 =?utf-8?B?TWlpU1FhMmlFSllSTDN1R3BaU0Frc0ExSDFPcS9FY1BvMFRuTGlNOTViMFdP?=
 =?utf-8?B?TERTWFBQV1BJTzE1ZWpJNmJ5bUxDTXZTUTFZVCtWMWpDVU9jS0ZzSS9OL0JU?=
 =?utf-8?B?b0JHQ1kxejN2QnJJcTdMVUwrWVhaY1A2eUJMTzdVSU54d0kvb0czRXpkVC85?=
 =?utf-8?B?bm1SR2N3dzlwT0VuQXVlQTFFeTRUdi9vUXBBY2Y1ZEhDU3g0TmhQbFdMLzFW?=
 =?utf-8?B?bEVaZ2JhY2VWaEVkN1VSSGV0YjRTTnEyN2RsNWRZckhQNyt6bXNiWTJyTmJ6?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eea9a5b6-b5d7-464d-cdbd-08dde67d7217
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 21:54:21.9319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zkvq45hTXcaWMFP/KuNGTd2OZ+uRaT0uthhcvtf8RYzNyOyNjjV+Tp62ascd2ryFaCEDcxIzqvprdTNDbQeO1F5BLdO6z3kV8ITTMXcJJWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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



On 8/28/2025 11:43 PM, Matthew Brost wrote:
> On Thu, Aug 28, 2025 at 11:19:13PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 8/28/2025 9:57 PM, Matthew Brost wrote:
>>> On Thu, Aug 28, 2025 at 07:21:02PM +0200, Michal Wajdeczko wrote:
>>>>
>>>>
>>>> On 8/28/2025 12:44 PM, Satyanarayana K V P wrote:
>>>>> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
>>>>> flag, the driver initiates TLB invalidation requests via the CTB mechanism
>>>>> while releasing the BO. However a premature release of the CTB BO can lead
>>>>> to system crashes, as observed in:
>>>>>
>>>>> Oops: Oops: 0000 [#1] SMP NOPTI
>>>>> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
>>>>> Call Trace:
>>>>>  guc_ct_send_locked+0x8b/0x670 [xe]
>>>>>  xe_guc_ct_send_locked+0x19/0x60 [xe]
>>>>>  send_tlb_invalidation+0xb4/0x460 [xe]
>>>>>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
>>>>>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
>>>>>  ggtt_node_remove+0x110/0x140 [xe]
>>>>>  xe_ggtt_node_remove+0x40/0xa0 [xe]
>>>>>  xe_ggtt_remove_bo+0x87/0x250 [xe]
>>>>>
>>>>> Introduce a devm-managed release action during xe_guc_ct_init() and
>>>>> xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
>>>>> resource deallocation, preventing the use-after-free scenario.
>>>>>
>>>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Summers Stuart <stuart.summers@intel.com>
>>>>>
>>>>> ---
>>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com> (with #rev1)
>>>>>
>>>>> V2 -> V3:
>>>>> - Fixed review comments (Michal).
>>>>>
>>>>> V1 -> V2:
>>>>> - Fixed review comments (Michal & Matt B).
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_guc.c    | 12 +++++-----
>>>>>  drivers/gpu/drm/xe/xe_guc_ct.c | 40 +++++++++++++++++++++++++++++++++-
>>>>>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>>>>>  3 files changed, 46 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index 37d06c51180c..ed0da4ebd928 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -706,14 +706,8 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>>>>>  		return ret;
>>>>>  
>>>>>  	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
>>>>
>>>> btw, IMO this should be moved (in separate patch) to existing function:
>>>>
>>>> 	xe_guc_ads_init_post_hwconfig()
>>>>
>>>>> -	if (ret)
>>>>> -		return ret;
>>>>> -
>>>>> -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
>>>>> -	if (ret)
>>>>> -		return ret;
>>>>>  
>>>>> -	return 0;
>>>>> +	return ret;
>>>>
>>>> maybe just drop the chunk with reinit(ct.bo) without reformatting rest of the code
>>>>
>>>>
>>>>>  }
>>>>>  
>>>>>  static int vf_guc_init_noalloc(struct xe_guc *guc)
>>>>> @@ -847,6 +841,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>>>  	if (ret)
>>>>>  		return ret;
>>>>>  
>>>>> +	ret = xe_guc_ct_init_post_hwconfig(&guc->ct);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>>  	guc_init_params_post_hwconfig(guc);
>>>>>  
>>>>>  	ret = xe_guc_submit_init(guc, ~0);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> index 848065a25c44..0b88cfb05e7b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
>>>>>  static void g2h_worker_func(struct work_struct *w);
>>>>>  static void safe_mode_worker_func(struct work_struct *w);
>>>>>  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
>>>>> +static void guc_ct_change_state(struct xe_guc_ct *ct,
>>>>> +				enum xe_guc_ct_state state);
>>>>>  
>>>>>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>>>  enum {
>>>>> @@ -252,6 +254,13 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>>>>>  }
>>>>>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>>>>>  
>>>>> +static void guc_action_disable_ct(void *arg)
>>>>> +{
>>>>> +	struct xe_guc_ct *ct = arg;
>>>>> +
>>>>> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
>>>>> +}
>>>>> +
>>>>>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>>>>>  {
>>>>>  	struct xe_device *xe = ct_to_xe(ct);
>>>>> @@ -268,10 +277,39 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>>>>  		return PTR_ERR(bo);
>>>>>  
>>>>>  	ct->bo = bo;
>>>>> -	return 0;
>>>>> +
>>>>> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>>>>>  }
>>>>>  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>>>>>  
>>>>> +/**
>>>>> + * xe_guc_ct_init_post_hwconfig - Reinitialize the GuC CTB in VRAM
>>>>> + * @ct: the &xe_guc_ct.
>>>>
>>>> remove trailing dot
>>>>
>>>>> + *
>>>>> + * Allocate a new BO in VRAM and free the previous BO that was allocated
>>>>> + * in system memory (SMEM).
>>>>
>>>> make a note that this BO reinit is only for DGFX
>>>>
>>>>> + *
>>>>> + * Return: 0 on success, or a negative errno on failure.
>>>>> + */
>>>>> +
>>>>> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
>>>>> +{
>>>>> +	struct xe_device *xe = ct_to_xe(ct);
>>>>> +	struct xe_gt *gt = ct_to_gt(ct);
>>>>> +	struct xe_tile *tile = gt_to_tile(gt);
>>>>> +	int ret;
>>>>> +
>>>>> +	if (!IS_DGFX(xe))
>>>>> +		return 0;
>>>>
>>>> hmm, I'm wondering if this is good that we will have two different
>>>> unwind points where we will disable CT (one for DGFX other for !DGFX)
>>>>
>>>> maybe we should just reinit(bo) for DGFX but replace disable_action
>>>> unconditionally ?
>>>>
>>>
>>> You will guc_action_disable_ct regardless if this DGFX or not.
>>
>> yes, there will be action registered
>>
>> but will be called completely at different time and this may
>> (or may not) actually has side effect on other unwind actions
>> that we registered between ct_init() and ct_init_posthwc()
>>
>> as a reviewer I feel responsible to ask questions if something
>> looks suspicious - if author (or someone else) is confident that
>> there are no issues, we just move on without next rev
>>
>> so here, if you are ok to accept that dualism - let it be
>>
> 
> I think the point is you want a both a early and a late action to take
> CT (and thus TLB invalidations) at different points. The early one is

no, just one last action related to init_hwc() checkpoint

> protect against the BO disappearing on you, the late one is to take down
> the CT immediatley on driver unload. The latter actually probably should
> be DRMM now that I'm thinking about this.

can't be DRMM as it could be called later then device unwind actions,
and all our BOs are managed and will be released as DEVM actions

> 
>>>
>>> Can we really not nit pick this too much, rev1 worked, albiet the
>>
>> I know as I suggested that change - we just workout the implementation
>>
>>> layering being slightly incorrect. This is a clear issue and I hit from
>>> time, customers can potentially hit, it would be nice to agree
>>> upon something soon.
>>
>> this should be the last round ;)
> 
> Hopefully.
> 
> Matt
> 
>>
>>>
>>> Matt
>>>
>>>>> +
>>>>> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
>>>>
>>>> hmm, maybe we should assert that CT is still/already disabled when
>>>> we do this re-initialization? near the start of the function
>>>>
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
>>>>> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>>>>> +}
>>>>> +
>>>>>  #define desc_read(xe_, guc_ctb__, field_)			\
>>>>>  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
>>>>>  			struct guc_ct_buffer_desc, field_)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>>> index 18d4225e6502..16d82c0e6cde 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>>> @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>>>>  
>>>>>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>>>>>  
>>>>> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>>>>
>>>> put it closer to the existing ct_init() declaration
>>>>
>>>>> +
>>>>>  #endif
>>>>
>>

