Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D239CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 18:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E8210E05A;
	Thu, 18 Sep 2025 18:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbEbG6EG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD7E10E05A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758219907; x=1789755907;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A5iMdZj90nLx5feZmN2QNT8DLJc7SjLcAei8Qw4xBvs=;
 b=QbEbG6EGc5QqmKQAOLnXHjf6oTuLdjKrsfC4RmvIxF+5Ppo+u352196G
 IHGT1nzNcEIoV3eD0nCYaXeYVt2JujG+SaKf+7rnlwV2pglK4XCn+jJ6I
 nNA72R3wJXAwwsH6PGgHoVi/eQOqyopboJKgMwTsAEWqH7Ea3P62SG1Xf
 M9pHf8miLiWstdw2f+JZkbZ1qLpY6eTVmnZhaYAhL1c6lUucyWxGS6MgC
 ID2MeqUpoLps59ukBwfLtD5SCqjka94g5pRI4/9HoE4D5ZekAKobvGyzf
 cAd5MGJTTirkfXNvsOzwnEB71fo3d45LPg+srcTsYlr8QlPceUvYyx7wG A==;
X-CSE-ConnectionGUID: lL159kp1TJGUuZ5URwahUg==
X-CSE-MsgGUID: ZAhpoEd+ScqoDSNV4V+Xnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60715515"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="60715515"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 11:25:07 -0700
X-CSE-ConnectionGUID: sQQl8gv3RO6TCgsi6wN5tw==
X-CSE-MsgGUID: 38U+H+RKTNiX65HiM93YpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175542206"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 11:25:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 11:25:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 11:25:06 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 11:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqC7FDUv3z48h6XOOZG0EYxWktxL+4KfwyuZiahj7LDSklAFqjbfUFNyScyih1BlItu30by3bgnzD71do5FWZK2tATqRAJH5Idq80ZkDxqq0SJ26YanroVQrCNi8kogEN3y8cx+pHQa6PXbd+VP/ZX9cJrei9Qu1FSyY+hu6VqeblhrnbRdbAna4S6EQCMcZcrLGVV1iOk3SD6ZMlu2FoOTOkFG4JWl+wL8m37Y6D0X8sbqAlLKBcP987ioKQwtK2aBL+h1pOHDBTQgxLkrAqjsRrTOZVPQWuxRNZCp9Ep87oUs7NnDR1Um3bkdxARLrMxAguApIFT5GPJBurqHK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJtyj+SGf1+Imo36l4EElkdMUS+00qQ16a+BUEq5gTA=;
 b=r94UvhY6uYUNL7/geoBggTRaobhsnAV1mr4TPJz9XkKRhU3YdFBa/ZYyQNs2KmVm2zb/0jbPNzyabg1vxqYn5ZWkeZA3cEjALLDvowX7bfPK63WxbyaFVzGaYj8qFZMMc8H6nBxj03IscI6w+b5FWjnIwfnmbF2/Q+kveXUcqA7GCfV3YUfEwx1QtdsQpR847APhKHvelHK9UTtOWVliL6jFu/PSx6o6/53LNTnJj/VCiS6CJkT6igx1vBnrdxS9gjmHbv97yBmk8CX2+Q/K3VaaC1T7jMHiKvukzrvip4RDlQgNFKwwYOCw7VAxcr16/7AmO9aJ/nb+TmaX91sj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB5299.namprd11.prod.outlook.com (2603:10b6:610:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 18:25:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 18:25:04 +0000
Message-ID: <4c0f7b32-db6f-4758-89f9-22f6848d99a5@intel.com>
Date: Thu, 18 Sep 2025 20:24:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20250918164355.1459200-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250918164355.1459200-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0016.eurprd02.prod.outlook.com
 (2603:10a6:803:14::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB5299:EE_
X-MS-Office365-Filtering-Correlation-Id: b349ac4d-b47b-4699-df52-08ddf6e0afca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2pSeFE3VWN2dkNLU1ZjVHVDZzdQcFdBejJaYlJsUnhlckN4aXV3SE5OaUw0?=
 =?utf-8?B?Y3UwTUpiQ3VwZVNFbzJiVStlbVpVYlRkUnR2Z3FCOW9wcjZRRit0eEY4L05Z?=
 =?utf-8?B?Qno4ZGd0Vlc5My9ma1g5UWVvSllwM0NvcytoVUI3c3k3RTdhV21BUDlQYk1J?=
 =?utf-8?B?cll4a2t6NDJwZnU3c1NmWStXVHVJbkkyTU9MeVQ4eWNDTXd5S2IvbnpPN2Ji?=
 =?utf-8?B?U0pTYzdOTVh3c0NQRTVLZisxSHJ3Y1hqRUhTaVQrZUhndVMvRnZIM2x2djBD?=
 =?utf-8?B?bitibktVYldSZG1OZEpLVEZHQ3p1Ujl5alVyem9mK2tubEdPeGVNL3JhY3p0?=
 =?utf-8?B?M3M2ays1bmJ4Qk0yWEtQdlp6cnRQRVVkYkd0c3o1UVdlaEpoNEU2WHFPUEU3?=
 =?utf-8?B?K29RY0YrK2JDZ3diRHB1dVMyUm14djFUUHNSS0tlUi9MR0M3U2ZuSGJxdGJF?=
 =?utf-8?B?a0hkZFBDKzN2S1J1cUw2NXZpQnV5c2xDT1U3VkJUMDY0dEE5cWNtSklLV1B0?=
 =?utf-8?B?Nmk5dDFQaktGTVk2cE01blNZeStjYlFKRGlBYmhkTnRPbzZ1YWJDYi80VmIz?=
 =?utf-8?B?RW9mYjZDTjlDZTE3SEJ2RU1TTkozSkJmbHNiZXBZZ3hnTlJQSHBMazFrUUJz?=
 =?utf-8?B?aHpXVDNTb1NiMDlOK3JZL013Q1ppUFlqV21HQVdYbGdkRmxYOEszYUNBRGdJ?=
 =?utf-8?B?Ukk2OHUvbjZBTDI5d2drZldkUkkraG9mZWNvY0tLSEN2UkN1S2VvYUJmY285?=
 =?utf-8?B?d0pJVlV6VVJRb3FDSjZrR3FYOG5DZ1Q5V2ZNSVpENWo4OHF1bEFYdHhPbDVp?=
 =?utf-8?B?QWZnNDB1UnN6NnhxK1ZOTU4rRTkweU5kZmhwTlJoUE1kc2Rlck4zS0pIQTBS?=
 =?utf-8?B?eWRsVGZqOCtwSHl3YjNibjJVZ0F2WldlYktRZUxQaS9jM1RwQ2hqMUNoZklL?=
 =?utf-8?B?V2xmUHhJUEwzQWJJSnJudEhnRGhKa0xKa1Y1YS9ZdDhZL2NJL1FYSUtLNGh5?=
 =?utf-8?B?TXh1WkU1U3F2dnFBNlVXbEJHb1B6MEFCcGpxTmkyN3AvSkhVclhabktWMGlX?=
 =?utf-8?B?dVdiV1ZyTk1kVVlEejI5ZThCT3B6M3R6SzhXU1lWM09RKzkyM1MxeXY1eno0?=
 =?utf-8?B?N1JyYS8vUHNtSkFjb2p0dTg3NjJYNnMwVklibnZvQXRvZi8wdEJrQVNYZk56?=
 =?utf-8?B?bkJ5RW45MTRNc2tWTncyTFJoUExCQ1RId09IWDZHOXpWUm82NTV6QVVzZkkr?=
 =?utf-8?B?YkI4djFnaG9iUzdDZ3ZFd1ArRDJJZ1JWa0JORlhtU1FUcks3clFVWjFPdXdw?=
 =?utf-8?B?L0VHdmY5TDcvODdBcGlaTHIzQU1nN1N6bStmWGNlV1JzZUVyZU42WEpOTFN6?=
 =?utf-8?B?dHBYSnhMZUdVdVloaG1wdC9BQ1VPOW9xOThCRnUxWjZkVFZjTkZVU0RUZndZ?=
 =?utf-8?B?YUlaMHNIT25EMS9XNWxQQlNWeTFvbmdMRFE3NUVHNU9ndVcxclUyY3lFUXZY?=
 =?utf-8?B?M1d4TDI5cVZHOGVZaU4xOVlINWhRWHN1NUR3aXkvK2NyaE5pYjUybk5ja1c5?=
 =?utf-8?B?Vk1ta0FobGI3bllnNk9ETXBETkNEdzVVZHBJSjVhRUpNK1BoYjZaWktzT1Bz?=
 =?utf-8?B?amptUnhmZC9GK3VLMmZkQmdmaGFLNHFock11cFI4T21vV0JDUXEraXVYZUFI?=
 =?utf-8?B?TExGUmIyUVg5eTJWdXlkSUF0enBzcHEvb3lrSjV3ZUNwRExyWjZoUlhjWjM0?=
 =?utf-8?B?UGMrd09aWjVLVWZRTjJpUVZJZFVycmVNSkRJb21KODlrbjlxNnJ1RzlqenNt?=
 =?utf-8?Q?WMLOYrpSSdO9mEFNIdw/nDrJdx0Uf1W819hrg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVJoS3N0cGFOSTRvVGVYZENtWmNvUVpNamZVRzZZdk9lT2N6Z09FOU1CblNs?=
 =?utf-8?B?Q2JrNlJSbzZTMFBIV2dnTEJxbVRORkxBNUE4T0g5V2dCbzRja3VLWDRxOTFm?=
 =?utf-8?B?cDgzQ2V4QWZpRGJpcVZZdWlJYmd2TEtveGExUzJaelZrSmZHZ0g4Rk9YWXM5?=
 =?utf-8?B?VXdrNEtRQkpUVkNQOG9US1JLYXFwTWFJVy91NW16anFaUnE2NkFXbFRETEVi?=
 =?utf-8?B?cllhUC9Ea3gyS3VtcHIxTmRteWc2MDBJMitCTWx5VXNBVGhvNzVNYlprVnVY?=
 =?utf-8?B?Q2swTFBwK2o2b25oMEFRVVR4RFZKcnhNVlF6emFsNFg3MkU5WjArVFdaWVMz?=
 =?utf-8?B?eDZuVjdYelhvSUhFN0NiRzBmdElWWGl0L1d0c29vY0w3N3lGcXNsV0hyazh3?=
 =?utf-8?B?RlRkSWhuSGZlWG02a1M4RVJuUDlMRGhSejN1MUN3UnAxN2tmYktTeUIxa2hq?=
 =?utf-8?B?OFJLMWJrZGYwVjZSVXJJUUNZd1FtVFBJU2RWLzNQdnZHR2daeCtPcnY2MXlE?=
 =?utf-8?B?Q2pUd3E5YzRGZ2cwQkpZb2hkSlpOOTF6ZGxyU1JnTHo1cU9TY3pPOVhKaTAy?=
 =?utf-8?B?K2ZJdlBjUDhlQTgydDBoWWxiZG5MOHRKeDNOTnFoYk5JK3NvVWxaWUl2b3BU?=
 =?utf-8?B?Y1M1ZEZacEt5aHphd1pJNzVEQ2R6S21ERUF3WTFXWVArLzNGOFNYV2lwUFJK?=
 =?utf-8?B?ZmZRbFRzd2FpMGoyTFJrNjVEeUZDUFFFYjBlS3o5ZVZla3lQWGQ3K1Rld0p5?=
 =?utf-8?B?OXFHZXVid0FnL3VUWHhwUXROYU1RMWlUbEJxOWp4V250TE9zaENtUVFSTE1i?=
 =?utf-8?B?WVBOVlpFcDZhOTJMVC9ES1kwRkt1enlxY3R3Qm56cnhwVVZXSytac1FyNDcy?=
 =?utf-8?B?V2hMcVFUNTJNQzJOc0VHb0xOcEl3RUVxMlgxRUkzM3hrOHNhaW82ZmVvNjNB?=
 =?utf-8?B?bHM2K0VLRFh3bi9tRDgyNkNyWnlMWEtuQUxhUFNab3EwcXFhMnd3VHhKNXc4?=
 =?utf-8?B?Q1ZzRTRmTDdmYXUreGM4MjRuRk5RaW9ud0dhRTNYMlBEZ3ArNlh2b1o4RUF5?=
 =?utf-8?B?R0pBcFVOVTJIdlQ0ODdGeHFlUUZYOU9UdGxkYWszdmpDbDJGTlNoYm9DWmJT?=
 =?utf-8?B?Slp6TEcwcDdPc1dUUXVabEMrWWtQb0RXdzF5SnZ4UnI4TFRTOXFxMHk4aFh4?=
 =?utf-8?B?SWdUL0xyM3F3VWZhSWdOR2tCT2k4UzhUaHRndEd5SGhXYjdmNVE5dWk1S2xJ?=
 =?utf-8?B?SXZvNlRKd1BSanB0ZmlZZm1EeG16dUdRYkcySVYwbmpqZThPU050MHQwL0ZT?=
 =?utf-8?B?MmN6eklaVnBkdm91N3Qrb3A0Ym5QZGRBKzEzUkdFSDd4MnowWkpWZTZVTmFQ?=
 =?utf-8?B?QVlBU0txcWIvSmVkRFFtNzZtWklMNVREeGJBcStTenc5MnlRL0phdThrRENx?=
 =?utf-8?B?dmU2aTNITmc2TFFxZnRBZWVJdXk3TFk4TnozM2c1bEtvVi92YktlWENZdlNh?=
 =?utf-8?B?SXVUeitySStzQmJSMzd0WUN4NXc4K2xvbVdPY24wMDVxZEtGNGxISVViNzFq?=
 =?utf-8?B?akNKSWhkSUN4TVVRUmNIVDJiL2xieElkc0xWallNbkE4WDB0a2NqTkI5Q1hG?=
 =?utf-8?B?d29LK252ai9zMUhVZEQ2U3VvTWtUNEhtNmdtcVNzSW9xcjlDb2YzWi9xalp1?=
 =?utf-8?B?bmc0RTduQkhrL1dxVEdDd0NDWEVYeHcySThyU3FnUHlMbTByNzZYMTNjdEJv?=
 =?utf-8?B?V3JTNHFjTVdUVFd6SGxVOWE3eXorMHNJN2YwNnBoM2hXSXdBcVNBbjN6YmJ2?=
 =?utf-8?B?NzgwdVIwWVFDaitnYnJHeklXWHE4dzBOV1V1ZjZIbllEdXh2Y0k3N3hYWDVF?=
 =?utf-8?B?cUJxa2p1QzcrY25XREh2cnBxcVdOT2Jqa3EzWUdmcEFHTU5RZXE2a3ZGKzYw?=
 =?utf-8?B?dnk2TmRaNW96MTJBU3ROa0o2cDdpUXN4aVdGcEE5OEQrU3JrTno2emRQNlhr?=
 =?utf-8?B?U1FLMFJDU3UwaVBYWEJqSG93TC9RaGU2TWU5SC9QQjh1VEhtNWF6NHZFL3Uz?=
 =?utf-8?B?cVFHNE1SSklSc3dYVFJCb1RrVWNtVzlJekUrSVc4SGFJTGhQTnFrZzlyb1JT?=
 =?utf-8?B?TUVGciswOTM1TWliZ3creEUwSW1KbDRGOHJkeEdzT3BzdlRIMEgvQlFTMHRs?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b349ac4d-b47b-4699-df52-08ddf6e0afca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:25:04.0356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfqYs0xukh42vExBw0glHBURLbMFvzOuynDzjMTHznUJ9xtSM+W42XGueTZaI8SOG0X32g+0oGcFwqzjfDEmvDuIHiVbcTMHKikpqSCrsWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5299
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



On 9/18/2025 6:43 PM, Marcin Bernatowicz wrote:
> When VFs are enabled on dGFX the driver resizes the PF VF_LMEM_BAR to
> fit the requested layout. After VFs are disabled the PF VF BAR
> size is left as-is. On platforms with tight MMIO apertures a
> subsequent unplug/rescan followed by another enable may fail with:
> 
>   "VF BAR …: can't assign; no space"
> 
> because the PCI core reserves address space based on the (now large) VF
> template, often multiplied by totalvfs.
> 
> v2: Use pci.total_vfs in helper (Michał Wajdeczko)

internal reviews don't count

> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
> Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index af05db07162e..ff003a650f79 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -144,11 +144,26 @@ static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
>  	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
>  }
>  
> +static void reduce_vf_vram_bar_size(struct xe_device *xe)

is it "reduce" or "restore" ?

> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int err;
> +
> +	if (!IS_DGFX(xe))
> +		return;
> +
> +	err = resize_vf_vram_bar(xe, pci_sriov_get_totalvfs(pdev));

pci_sriov_get_totalvfs() might also return tweaked value based on xe.max_vfs modparam

https://elixir.bootlin.com/linux/v6.17-rc6/source/drivers/pci/iov.c#L1276

> +	if (err)
> +		xe_sriov_info(xe, "Failed to reduce VF LMEM BAR size: %d\n",
> +			      err);

we try to show nice error codes using (%pe)

> +}
> +
>  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
>  	int err;
> +	bool vf_vram_bar_resized = false;

please try to keep vars in reverse-xmas-tree order

>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  	xe_assert(xe, num_vfs > 0);
> @@ -178,6 +193,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  		err = resize_vf_vram_bar(xe, num_vfs);
>  		if (err)
>  			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
> +		else
> +			vf_vram_bar_resized = true;
>  	}
>  
>  	err = pci_enable_sriov(pdev, num_vfs);
> @@ -194,6 +211,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	return num_vfs;
>  
>  failed:
> +	if (vf_vram_bar_resized)
> +		reduce_vf_vram_bar_size(xe);

in pf_disable_vfs() below it's called unconditionally
why can't we do the same here? or it's broken there?

> +
>  	pf_unprovision_vfs(xe, num_vfs);
>  	xe_pm_runtime_put(xe);
>  out:
> @@ -218,6 +238,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>  
>  	pci_disable_sriov(pdev);
>  
> +	reduce_vf_vram_bar_size(xe);
> +
>  	pf_reset_vfs(xe, num_vfs);
>  
>  	pf_unprovision_vfs(xe, num_vfs);

