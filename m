Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CA3D43341
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 18:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FF110E141;
	Thu, 11 Dec 2025 18:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/IV/cf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBC110E141
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 18:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765479558; x=1797015558;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=84AZ/F1Swq99qrrBYWMYFN4ulnc0MXHILn+ii68EkUU=;
 b=O/IV/cf+sWHV0lSJePhR1qZmlEDT7rjZMft6N/UybQxhOfXlI5aCw0Kt
 b6NzmrBK+Cs1TK+qUOPgJc5qqGRf3hh5+YUM8/9Wrw0FZwxyBwqJqUkQj
 Z7t6Ld8zTpDWTu+cG8rXgMM6Qqr5Q3aGfoSlXRriCD4FTcxJTu1nakdDg
 6diD9Ji1sTvxEaSmjxRVUASCmeGSZu5mDAGL0VsZRU16NKi9MiLT296Um
 +7tDPtxgPAGSEBpjvFeqegMV9M/vQA9X2lnaz5PT5KFL/sSOraks8Fh7F
 ikLIQiL2NHA8i3o3f3cTE99/XNPvKSpmdcEX2391PfDuj4DVzV1oslV+R Q==;
X-CSE-ConnectionGUID: QLJ+uyGTQYm8ivzkb7cM9Q==
X-CSE-MsgGUID: shodeznVSy63VAnRRcxkLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78933769"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78933769"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:59:17 -0800
X-CSE-ConnectionGUID: 9Cw/3pTPTomvzhMmHBstWA==
X-CSE-MsgGUID: HSygXqZcSNux60Uzt09axA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196161087"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:59:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 10:59:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 10:59:15 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 10:59:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww9x5eGtF5oNiwgQviGIczd9b2ikVLGQnMIG+Ep2KL3uUSXPDmxaObHI8tqIVSfdF6Z/WarBX5nSS4T3QY2qJHYMGRSFitIYy7ytn4eqTMJ0ZIYdHlYEueUCjXIAAe6V93ftbAmIttvY+VGzWSJgj2FzDytLtLWwneANoUFe6mP3ftZVKuJ8OpoFo/xWPy3hBDZ0oo4HkTxqmeeKZljlaac0Eq/c2SDl8P5TAobJEeuoQ4ZCpqTWnEswQJCjYL/BurnnuqsS+ulNcj/EfcHzEIcBlT16jo8r/7il8asFi86yrg+n3M5tkkYFGtianZfqNtET8vqgtNNGaJclCiiUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuOrua5RlDZaL74FwnzBQAeaNWYRhK/fp9WHNWeUhpc=;
 b=TnV3TLBHBPcuxcjkp2gRxo8XCkxbgy5MKOh9M1WI2kf9yhrPUYex2mgDwQjpJbf7DxJMeZ83CdkaDDopVkrkh7rKWQjp7at/nr4S09XYo1WcYOS6PuFaoUOpgcDiVlfZZKPHkumYskow3ry6cwqz5sXorvjJ5ypEf3Yldx7Lm7uzmZwQZ61ICdYkci1E0WXkfHMUEd8+7RMLQDSgsbF9xyot+Ym1CnTyqwM0f2a5JmD2LfKhTmtu6ZADsFKx3TNlb6H7P0HQO2rI2ifBtOiqph9p3uuvzuUc7735iFTL0n2O5Dto7vITiL4IVN1hyuv2m0pl6SXBcYB5NefmlP6NaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 18:59:07 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 18:59:07 +0000
Message-ID: <d53cee53-e649-4997-bede-3cdae61d9ebb@intel.com>
Date: Thu, 11 Dec 2025 19:59:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] drm/xe/sriov: Add support for enabling scheduler
 groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-18-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-18-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:803:104::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: db4a02ef-e222-4655-80b0-08de38e75c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U245c0RsbzM5U0MwQUc5U0VSVStpZEFLZktKaW8xeUJMQU1vL205OWttWmUy?=
 =?utf-8?B?VFlsSDY5MEhhTTBiUkozZGJPN25CR0p0OVRIQXpaUkY2VkE5RWVvTTFrSlFq?=
 =?utf-8?B?czRPcUgxdnVtMU9LVTBwL3F1aEdzS3pXQ2o0andpSTFzbG9vUVBEZ2VDUEtK?=
 =?utf-8?B?SkhGbWdmL2tYMEQwc1l3aDBRM0Z0NWR6eFJ0OStGU1g1TWt1c29TUEMzNHpR?=
 =?utf-8?B?OExhRkdsS1AxVTlyMGw5L3FXeEJlUWRHSW1OTXZRU1dVWXRUaUZWMDArcDZU?=
 =?utf-8?B?TTV5SkpWRElvcXFBUW1zRk5tVEE0QkZiakQ4bmk4THdUSmtnbU85bStQTjkw?=
 =?utf-8?B?T1h4YXhaKzQ0SVZxaWVPQ05hcnR1ZWp0bDhxc3BSejFrTGdtbVp4L0E0Zy95?=
 =?utf-8?B?aVpCWjd4Ym93c2hNNkxPazBFOWRRR2d4Nm5taVJRN0pWYlpZUjdlTHU1UWpW?=
 =?utf-8?B?T1Q4aUxSQllCd2Q4eWN4UVRKaWN4OEk5SVlaaENOS3FyTm5PemY5NHk4TDFW?=
 =?utf-8?B?ek5TQ29VV0JoOUMwQjAwRzVXM2RrTlQ4SDNscVorS0VUcUc3T2xJOGlSd01V?=
 =?utf-8?B?NXE5TGNRazRHOWFrTzJ5YkYyUVUrd1k3YXdUTmZWT3BmSmZ3UndRUjkrRVJD?=
 =?utf-8?B?Vi9oWWt6NHJiL0FqaTV4S1pteDBLV3NkVXVDNGJiNHNFeElBRVJoT1cwbkl1?=
 =?utf-8?B?YmVqZGRqMXpDbW9DMUI0cHNCTjhweVRUeWZMZ3NSV2hNTm9PWThXb1cwS0F0?=
 =?utf-8?B?TE5WMzNQNnI3dXUzcEhxMEdxM1RYdWlYYStSNmthZHVCcnFTeFg4cEpJQ09s?=
 =?utf-8?B?NVhSbEhadWp2UGtHRDFXUmR2UG1YMXRjUjNaRmQ0N2ptUzFxL3lVWkhJMlQx?=
 =?utf-8?B?Wldjcms0WlltcTc3dUdxS1FRNnJLRUxnSHBYK3NVNUFPanNpK0w5Rm15RC9x?=
 =?utf-8?B?Z21QR2VBWm1iN0YvOXNaZStaT0VKaXl3ZVUxUEpHT3A1ZWc0U1F3ZEtyVUwz?=
 =?utf-8?B?WFRRNDBGRkN5TURSKzhwbDZyaElsbWZsNy8rMjJMR2tOdEtmbVlTKzhrSnpD?=
 =?utf-8?B?OE95NzVxWjdHNmE0d20xd2I3eUtHcmFxalU4Tll1NHR2L0JUMkllcEFKRzNU?=
 =?utf-8?B?SW9YNm5EVEF6SFBDa0hWOG1CbElDc2JkUVZyLzFkaG12N0M0VnNxVkgxb1Qz?=
 =?utf-8?B?cTdBT0JISzZ4U1VGYTY0WDlYM2VTRlFNVTNTeWFyVVBaU0ZJUHIyaTR5blBv?=
 =?utf-8?B?Rm82WTk5QzRIamJTQjRFSlBSKzNITStqaFM1bXpzZlRVSUFSQklzNG9OUVd1?=
 =?utf-8?B?a081TFNwanFxUjQrd0MySythZ1dUVHp5Z2NhNkE3V1RLVFI3Qkl3UnpTTHVV?=
 =?utf-8?B?M3J6NEljVjZiV29Qd0xydzJSbmNtajRidlBjYnlqMFRERmpaS2VrczNhL2Mz?=
 =?utf-8?B?SWVJVnZDNnFEYW82UTZqMEM3am9naTczbUNHamRxdGxtVDZCdkxDcXZyQnJk?=
 =?utf-8?B?cVJGbDVqQmpNcDIzM0hHdHdQeGE2RXNTbnlqUHAzRWRxcXVsSVJUSEFBTEV3?=
 =?utf-8?B?emFoZVhTQnhNSldZcVVNT0JCYll1TTV5aVZ0T0Z5eVhRT1VUaXZRdW12S0c1?=
 =?utf-8?B?Q3VKUHhHMTR0dU9CN0lqS01NRVlzMHdZdDFacUhvOEZVYmh3Y2RncmlFUUFS?=
 =?utf-8?B?OStRN3dHZlMxRjU0VWYxTXAwNlZWd1pTU1dXTGpiYThjUXVLZHIwLytMZ3dp?=
 =?utf-8?B?VkZLcEIvS0U4NXdUbGU2bStjaTNoSVBRNEVmcU5BaGdOemJLQ2ZHZnFzQmxS?=
 =?utf-8?B?dCtMbG1xa1hnUGo5OG11eEpkckZub3pSeUtrVTcvdEU2WkNXMC9GN1E1T00v?=
 =?utf-8?B?cEZnRE43SlIyQkN0Y0J5MU9UeDlPcUtYa1lMODB6Kzk5WDB6eUdZU1ZsdWxP?=
 =?utf-8?Q?5KdyWTJCwDEBZsl/BONBc+dER+QOLtge?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZyQ2dibm1GR3NRU280eG1veStpL1BsUWNoOW4ydjNEVVdXc0Y4dkpRT2lw?=
 =?utf-8?B?L1dobnA2bUwxSExpZmRyUWsrbXRVQjhkVWE3Z3NBbzVLSzMxUHZGVUsvT2ZO?=
 =?utf-8?B?aWY0eHRqaisya0U1WFpEeFBZelUrcEJlYkxiNnZhaUNzZnJMQWNZT0pOdVhU?=
 =?utf-8?B?aG13SHppS0U2V2xsUFNiTVkwcUVWT1gyWGVIMzdqcEFTdEpUNm1HMmxLV01n?=
 =?utf-8?B?a3RDdEFXZzNOd2FUcWNaS01EcTQwRHJUcHloS016bG5EdzNIQUZXSmpKTk5T?=
 =?utf-8?B?dGlRQnU2WnhWeTl4U05GbUlVUjNTZDJHcXBJQmErQlZhQS9pSEFHeHRNc3Nw?=
 =?utf-8?B?RFZkakNJV21jMW1aMFU2bGhma05ET2VuVGhlcDFMM2RsWVVteVdwbURzMTZx?=
 =?utf-8?B?U1Y0eWJLTENOU2FNK1Z6YklDRDFibmVNWmFJVFBxL0JJK1VFcUd3SCs5TXRE?=
 =?utf-8?B?TkdwQjdERFJRUU5zLy9KOEhOQVFndlR5V1FZeWY5ZlJZSGUzR1JGbWpGMVY4?=
 =?utf-8?B?SEhpL0lxK21LdEhRZGZJN0YrQ0cxZjNUSitjSnZ1clhPejdhZ2RrM1VvbG13?=
 =?utf-8?B?WnJJcmlTVnV5a2hlR3ZSVmY4Z0ZUZGhIWDJnUFpCZ3kxdGwxS0ZFNkE2SWdk?=
 =?utf-8?B?NUt6Rmh5TjhyRGVFN0s1Z2N3Z3VSOWdUUXFYeCs5ZUVIVjBDVU1xbTlhOVRn?=
 =?utf-8?B?d1lDSWt1RG1IVEJsTkU2U3JDS001S2xVeVp4Y29adlJtYVZENEZ6MlhhVjVX?=
 =?utf-8?B?ZlVmWE1VWGZsL0dwQ3pCbWRpOEdvc0RJczZJRVlYU082MEZtRE92Tm9TeXA4?=
 =?utf-8?B?cGRITURkQXNBemZDWmJlQmdlcHpqTEw4S01wNnViUHRLMkwwb3hmNUU3eENI?=
 =?utf-8?B?V2xNN29yYkhsNVowZ0MxV1N2ZVlGSW4rbysvYUpoZ0xSLzNHcVZQQzZCQys5?=
 =?utf-8?B?ZmJpUi9zbFliZlNHcFBRaE1ld3dUeDFaTk5hWC9TS0QrUS93bFA4cGRLRFNH?=
 =?utf-8?B?c0x0dWZYYU5ieWhOTXB2Qm56U21aSm5JSHowYkJvazdHSHREWUsrUU1mYzBu?=
 =?utf-8?B?SjQvbGlKODlJWldqNFMvankreWJUc0w2WUw0Zy9RamtTUjl1SHFTRkFvVE5Y?=
 =?utf-8?B?L1dRK0oycVJHd0VPZkZNL2pMc0RBN0RyaC9NM3ZqQ3hVMU9VVUcxWXIvWjBs?=
 =?utf-8?B?eUdUVlN6eWpsd0I1M1ZRSTQyd29Fb01HRm1XZXlYMGNrVW9lV2gzVk5PN3Mr?=
 =?utf-8?B?QWdwWmFjd01tN08zNzdLSFA4ckhWY2Fnb0NZMDZpRjAwWERPczhJa1hTZXll?=
 =?utf-8?B?N1Z0S0poWC9Wbm04NmdJQ1dxMlFwZjI5TFJxSFhrTTQ5bUdwMWV4QjVtUjBK?=
 =?utf-8?B?N3FhNVVQeWhTVWZUZytLam02cXRVVXBrNFRWeVB5bHNYbGNaNFo3a0RnMy9y?=
 =?utf-8?B?SlV0d2Y3UHUxMTFWa0JFTUJYd2syUGVZclhYNXVDVVdFT2ZlaW84amdMVUha?=
 =?utf-8?B?RXN0SDVKZVVHaDFvaEV2RVNvWmhVQ0E4L3k3My9pT3RMWFhHbll3R05FcFQw?=
 =?utf-8?B?TlNlMUgyZ21aQTc0bk9kM0Y1TmJEWGZqNDgzdy9lc2s0MXBNQmFPaGdjM01K?=
 =?utf-8?B?eXdTU1VmaHQreklLQW9LeXRUbjVkMStvOHAxbGRNQ2lNQUJNYWIyMEl4djcr?=
 =?utf-8?B?TE90SzZmUkpWNmVuSlNPUGZTUmNXOVZVQTB3bmRpOEhaYjVFZld4aW1mTkhv?=
 =?utf-8?B?TktlQ0hsTmZqd05TMFNENk5LOVRyNmptREhXQVRVM0FBZ2JTRTRzL042Qmk3?=
 =?utf-8?B?YXpGSzB5ckJCS2tuZzRzWDBjSllGTFcyZzhGNlpUVG5BcEUzRHltT2RJejZD?=
 =?utf-8?B?VmFXaFhnN2RsTUJIdHJSVzE5MUNyUytNdWF5eExKQmM5dUJzbmVuaHc5bkRG?=
 =?utf-8?B?c3NJUnVSRUlyOE9jb3Qwa2ROMUptYSs2LzBpN1hleGRqcjV1bi9RRVJtd01x?=
 =?utf-8?B?MFp4UUdOREJIM3hmN2I2OVBuVjRPZnBYU2lvb0UwMEVnSkpVYTJUSE13cmt4?=
 =?utf-8?B?aUs4WnJRajU4VGlBdjFzWXhVWkJRMnE2M0JzVHRJWkhncWxYT2dvblBScEdm?=
 =?utf-8?B?WlFtVjI2ckpDVkpiSGdLb2JpR3VjVGFuemxLWWtJWTB4NEI3TE1hUkJ3VExQ?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db4a02ef-e222-4655-80b0-08de38e75c9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 18:59:07.7941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxWeRKmYtXNv5UrakOuaGJmPuM5j5bhNnzwRMcTTSjAslz4XSyuYUM3j21krB8GH2QNrh7B+F0yW8yseAp37pcZy8T0usTIzhs7TvRzvlCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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



On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Scheduler groups are enabled by sending a specific policy configuration
> KLV to the GuC. We don't allow changing this policy if there are VF
> active, since the expectation is that the VF will only check if the
> feature is enabled during driver initialization.
> 
> The functions added by this patch will be used by sysfs/debugfs, coming
> in follow up patches.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: code improvements, add GUC_MAX_SCHED_GROUPS define, don't add
>     XE_SRIOV_SCHED_GROUPS_NONE to supported_modes (Michal)
> v3: fix enum/integer mismatch, use GUC_MAX_SCHED_GROUPS to define the
>     max KLV length and not the other way around
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  19 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 151 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   3 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   6 +
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   2 +
>  5 files changed, 181 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 265a135e7061..f0a87a1cb12f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -8,6 +8,8 @@
>  
>  #include <linux/types.h>
>  
> +#include "abi/guc_scheduler_abi.h"
> +
>  /**
>   * DOC: GuC KLV
>   *
> @@ -200,6 +202,20 @@ enum  {
>   *      :0: adverse events are not counted (default)
>   *      :n: sample period in milliseconds
>   *
> + * _`GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG` : 0x8004
> + *      This config allows the PF to split the engines across scheduling groups.
> + *      Each group is independently timesliced across VFs, allowing different
> + *      VFs to be active on the HW at the same time. When enabling this feature,
> + *      all engines must be assigned to a group (and only one group), or they
> + *      will be excluded from scheduling after this KLV is sent. To enable
> + *      the groups, the driver must provide a masks array with
> + *      GUC_MAX_ENGINE_CLASSES entries for each group, with each mask indicating
> + *      which logical instances of that class belong to the group. Therefore,
> + *      the length of this KLV when enabling groups is
> + *      num_groups * GUC_MAX_ENGINE_CLASSES. To disable the groups, the driver
> + *      must send the KLV without any payload (i.e. len = 0). The maximum
> + *      number of groups is 8.
> + *
>   * _`GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH` : 0x8D00
>   *      This enum is to reset utilized HW engine after VF Switch (i.e to clean
>   *      up Stale HW register left behind by previous VF)
> @@ -214,6 +230,9 @@ enum  {
>  #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY	0x8002
>  #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN	1u
>  
> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY	0x8004
> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	GUC_MAX_SCHED_GROUPS

nit: maybe we should still add LEN defines?

#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MIN_LEN 0
#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MAX_LEN \
	(GUC_MAX_ENGINE_CLASSES * GUC_MAX_SCHED_GROUPS)

> +
>  #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
>  #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 003860661687..7738d515ea9e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -97,6 +97,23 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
>  	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
>  }
>  
> +static int pf_push_policy_payload(struct xe_gt *gt, u16 key, void *payload, u32 num_dwords)
> +{
> +	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, GUC_KLV_LEN_MIN + num_dwords);
> +	u32 *klv;
> +
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	klv = xe_guc_buf_cpu_ptr(buf);
> +
> +	klv[0] = PREP_GUC_KLV(key, num_dwords);
> +	if (num_dwords)
> +		memcpy(&klv[1], payload, num_dwords * sizeof(u32));
> +
> +	return pf_push_policy_buf_klvs(gt, 1, buf, GUC_KLV_LEN_MIN + num_dwords);
> +}
> +
>  static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
>  {
>  	int err;
> @@ -397,6 +414,17 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
>  	if (group < 2)
>  		return;
>  
> +	/*
> +	 * If we have more groups than the GuC can support then we don't want to
> +	 * expose this specific mode, because the GuC will return an error if we
> +	 * try to enable it.
> +	 */
> +	if (group > gt->sriov.pf.policy.guc.sched_groups.max_groups) {
> +		xe_gt_sriov_notice(gt, "media_slice mode has too many groups: %u vs %u\n",
> +				   group, gt->sriov.pf.policy.guc.sched_groups.max_groups);

nit: is this something that could happen in production build on production platform?
maybe assert or dbg will be sufficient

> +		return;
> +	}
> +
>  	/* The GuC expects an array with a guc_sched_group entry for each group */
>  	values = drmm_kcalloc(&gt_to_xe(gt)->drm, group, sizeof(struct guc_sched_group),
>  			      GFP_KERNEL);
> @@ -459,6 +487,15 @@ static void pf_init_sched_groups(struct xe_gt *gt)
>  	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>  		return;
>  
> +	/*
> +	 * The GuC interface supports up to 8 groups. However, the GuC only
> +	 * fully allocates resources for a subset of groups, based on the number
> +	 * of engines and expected usage. The plan is for this to become
> +	 * queryable via H2G, but for now GuC FW for all devices supports a
> +	 * maximum of 2 groups so we can just hardcode that.
> +	 */
> +	gt->sriov.pf.policy.guc.sched_groups.max_groups = 2;
> +
>  	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>  		u32 *num_groups = &gt->sriov.pf.policy.guc.sched_groups.modes[m].num_groups;
>  		struct guc_sched_group **groups =
> @@ -478,14 +515,127 @@ static void pf_init_sched_groups(struct xe_gt *gt)
>  		}
>  
>  		xe_gt_assert(gt, *num_groups < GUC_MAX_SCHED_GROUPS);
> +
> +		if (*num_groups)
> +			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
>  	}
>  }
>  
> +/**
> + * xe_sriov_gt_pf_policy_has_multi_group_modes() - check whether the GT supports
> + * any scheduler modes that have multiple groups
> + * @gt: the &xe_gt to check
> + *
> + * This function can only be called on PF.
> + *
> + * Return: true if the GT supports modes with multiple groups, false otherwise.
> + */
> +bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt)
> +{
> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes;
> +}
> +
> +/**
> + * xe_sriov_gt_pf_policy_has_sched_group_mode() - check whether the GT supports
> + * a specific scheduler group mode
> + * @gt: the &xe_gt to check
> + * @mode: the mode to check
> + *
> + * This function can only be called on PF.
> + *
> + * Return: true if the GT supports the specified mode, false otherwise.
> + */
> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)

nit: shouldn't this 'mode' param be declared as enum xe_sriov_sched_group_modes ?

> +{
> +	if (mode == XE_SRIOV_SCHED_GROUPS_DISABLED)
> +		return true;
> +> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & BIT(mode);
> +}
> +
> +static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
> +{
> +	struct guc_sched_group *groups = gt->sriov.pf.policy.guc.sched_groups.modes[mode].groups;
> +	u32 num_groups = gt->sriov.pf.policy.guc.sched_groups.modes[mode].num_groups;
> +
> +	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY,
> +				      groups, num_groups * GUC_MAX_ENGINE_CLASSES);
> +}
> +
> +static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
> +		return -EINVAL;
> +
> +	/* already in the desired mode */
> +	if (gt->sriov.pf.policy.guc.sched_groups.current_mode == mode)
> +		return 0;
> +
> +	/*
> +	 * We don't allow changing this with VFs active since it is hard for
> +	 * VFs to check.
> +	 */
> +	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
> +		return -EBUSY;
> +
> +	err = __pf_provision_sched_groups(gt, mode);
> +	if (err)
> +		return err;
> +
> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = mode;
> +
> +	return 0;
> +}
> +
> +static int pf_reprovision_sched_groups(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	/* We only have something to provision if we have possible groups */
> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
> +		return 0;
> +
> +	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
> +}
> +
> +static void pf_sanitize_sched_groups(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = XE_SRIOV_SCHED_GROUPS_DISABLED;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_set_sched_groups_mode() - Control the 'sched_groups' policy.
> + * @gt: the &xe_gt where to apply the policy
> + * @value: the sched_group mode to be activated
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
> +{
> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
> +		return -ENODEV;

nit: maybe at this point we could just assert and force the caller (debugfs) to check?

> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	return pf_provision_sched_groups(gt, value);
> +}
> +
>  static void pf_sanitize_guc_policies(struct xe_gt *gt)
>  {
>  	pf_sanitize_sched_if_idle(gt);
>  	pf_sanitize_reset_engine(gt);
>  	pf_sanitize_sample_period(gt);
> +	pf_sanitize_sched_groups(gt);
>  }
>  
>  /**
> @@ -524,6 +674,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>  	err |= pf_reprovision_sched_if_idle(gt);
>  	err |= pf_reprovision_reset_engine(gt);
>  	err |= pf_reprovision_sample_period(gt);
> +	err |= pf_reprovision_sched_groups(gt);
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	xe_pm_runtime_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index f5e3b2595063..d1b1fa9f0a09 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -18,6 +18,9 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>  bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
> +bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>  
>  void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> index d228cadcd8b0..04015fb907ee 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> @@ -24,6 +24,9 @@ enum xe_sriov_sched_group_modes {
>  
>  /**
>   * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
> + * @max_groups: max number of groups supported by the GuC for the platform
> + * @supported_modes: mask of supported modes
> + * @current_mode: active scheduler groups mode
>   * @modes: array of masks and their number for each mode
>   * @modes.groups: array of engine instance groups in given mode, with each group
>   *                consisting of GUC_MAX_ENGINE_CLASSES engine instances masks. A
> @@ -33,6 +36,9 @@ enum xe_sriov_sched_group_modes {
>   *                    are in the same group.
>   */
>  struct xe_gt_sriov_scheduler_groups {
> +	u8 max_groups;
> +	u32 supported_modes;
> +	enum xe_sriov_sched_group_modes current_mode;
>  	struct {
>  		struct guc_sched_group *groups;
>  		u32 num_groups;
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index 146a6eda9e06..1b08b443606e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -26,6 +26,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>  		return "sched_if_idle";
>  	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
>  		return "sample_period";
> +	case GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY:
> +		return "engine_group_config";
>  	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
>  		return "reset_engine";
>  	/* VF CFG keys */

again, just nits, so:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

