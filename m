Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFBDC02199
	for <intel-xe@archiver.kernel.org>; Sun,  9 Feb 2025 13:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BD010E14C;
	Sun,  9 Feb 2025 13:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQwzja2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C4E10E14C
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Feb 2025 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739108051; x=1770644051;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8DL38fiV8eeYvpGbPFtCaE4ZArA6yAAxYNLgMyxrR0Q=;
 b=gQwzja2dbDaQAfjBl5Zq5zsne+UhRMQ88f3rj3zS6AsM6KylWTrrSN9Z
 eaHL3QzesCghB0akjHoyWCKiG0hKD5lNi5v0jDJekoSgx5qTme+sCxkHt
 AMDyB9+UE25WNGA7FLQioKE9uFdQ5n0mvWd629X1oVVnJ2FmB/l5TCuNQ
 ggih37CW1tyy0PfouwOaffp+v5kjY114EIAea2O0jEXKD2NrKXpb//Yzi
 LXrPq1wrkhTlgLuVkQ3zjusVPdiNoq+zb1lgJ2Ze9ZFOdYdhUumwWcJt6
 10mLvFCXaC0JaGgcGH/aQQe+6uYWI1zdCF8pwTZf4aafPS7N6dLcjyUBu A==;
X-CSE-ConnectionGUID: hWCfCmnVRoy4KTKq0CZlPA==
X-CSE-MsgGUID: RvTM98UuTEC1CFXx1YrWZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50323534"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; d="scan'208";a="50323534"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 05:34:11 -0800
X-CSE-ConnectionGUID: VfFoxUtyS9Sj989GO9ICsw==
X-CSE-MsgGUID: 2o2ENnFKSjm12mJU8rMnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; d="scan'208";a="111720625"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 05:34:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 05:34:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 05:34:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 05:34:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEDxjRzX9fSzm1puCaHFvuL3/sp+eO5Mr4+Cnw7I827TlZ8Fy8BG4i0RpblhKKT4+RTs0MG1Ual8e9R/rbX+H9Fo2Hn7XnZkTZwjie/6xFA2QwVSe80mMWtNPw44FG16XZUJLaL3P5zWHysnO2PRq04hhJAo9EE6l52IS//Fy7H6qN8cCzq+dtOj5VAakTKyiN/1B+aGAoelea1eGMmavKOSoiRIvXudwsIJ2cCpsRlEcq/YvKEPVhfdb6gdledTWOKHEtHPbZ1oMCdMUeAyIRN7wTlhn1yfOCclIT/XeISTRUby/xLtrUFtRvmvpj+kpp8h+GemX3QJXJFHlPPpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPziXc7r1en7iIjNAMdAzZSW/8terJKpkoL2ZLYPIRU=;
 b=n6DXCWFDmAwfK0H3AC9usRaQYY1T4E9cUgmLMrikbcDdXXnR6ZJVM18vVoJ0juuOAZeusbLPa/uLzY/Ejr2/Oqr1a7pcaTnYLfWKM+yhQ8PVyiSeLnmjRJQf8RcxgTHkmBd1CL1WB84SvMHdurU/N5C65KpWw7oQDErgirjv0JGq/ljvZvM36KHVv2xabzIZ0gx67YWa6B4hWXVEsJnpENM3Iu1o5HVr1mG6rtzVpPWuH3nbvX8GZw3o62okCE0Y4Z8LLHi2oY1uwK0z9CCJEdpn9gucpGzlL5XmANGeLkiqPxIGyl/PmVxD3J9RMWJS6BBHC4+UU9IWdkjMmn28jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sun, 9 Feb
 2025 13:34:07 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%3]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 13:34:06 +0000
Message-ID: <9be76fdd-01c4-4e2a-93f5-4ead7ad30239@intel.com>
Date: Sun, 9 Feb 2025 15:34:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add xe_mmio_init() initialization function
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
References: <efc3c364-a41d-4ab6-a3bc-f1e571326712@intel.com>
 <20250202110035.205061-1-ilia.levi@intel.com>
 <fd9fd363-a43a-46bb-b85a-cac565adfbcb@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <fd9fd363-a43a-46bb-b85a-cac565adfbcb@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0021.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::15) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d355d40-b7a4-4b9d-3dd6-08dd490e6d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjlqVnNEWWpYempRTExhQVU5dGJhQ1FGTWxFUnYwM05ML0NFUmhCb2hyUlNR?=
 =?utf-8?B?TlB4TjArdy9Hby9kb1BaYi9acFBtL3ZmZFdvdHpnSFBDdGVsS1dybWczUC81?=
 =?utf-8?B?ZlZVZDE4STQxU2QzUVNrTytnSjc5K1ZObzhsNStjelp5Mjc4czY3SkpScVVJ?=
 =?utf-8?B?WnZRRTJHUlpPaFJhc2RheHB0WW13TGJZWC9IZ2lDMk5VTS9wQkp4Q3gyQk9K?=
 =?utf-8?B?U3FVQnBDY2FlaGFnQWlWN3VSeTRxQS9Xa0NEa1lSVzFoSFJVQXVGdms0NVBq?=
 =?utf-8?B?ZHJxaFVwNGJVT1NadnpxSXd0aUpReGJUWURXYS92MEFLQWZ6RGlaZkc2WFlG?=
 =?utf-8?B?L2hCOXpZWm5DM1hrWmpnbWVZc0dMeU9PQ0hTaERZYWVtNDBmNHFUcUFRUlFD?=
 =?utf-8?B?T2FGSStyVE5FODNiLzhKQk5RZHFLUVp1alllbElGejk2ZDVDN1h3Nzc3MDhS?=
 =?utf-8?B?M200aXZoSjJ5dnBXTUVkdCtmOUhrVGQ5dm9wZmxpM0pmbUhEcWt5TFFaRWtm?=
 =?utf-8?B?RDV6S2lqVjd2NUNkSjlUTjhnSHFyaWtVSkRJOUFqdGJJN0haQ1BxWDJtNnFJ?=
 =?utf-8?B?RHJyOWwyWUJFTTFjY2FxVXdvKzM5Z3AwM2hiS3dXVUVmRXRsNThkNmgzSmtL?=
 =?utf-8?B?dHpsKzlsRzU0UlNsZnBFL0RWaHpnSW9OVUNra3lncXdUeVRQS253dzNxMnpG?=
 =?utf-8?B?U3FLejA4a2w3M0gwWTJld0loMmw5MXFBVU94Z2VrVXVRZkJNbUN3QjFDa1ND?=
 =?utf-8?B?UnBjb1FJSk9ldWhPZFZML2t4dExMZHRCeEwxSDRwVms3cEk3Q1dodzQ4TDRx?=
 =?utf-8?B?TlZNUTAycnQ3K2tQVzdFcEgvSytqL09hNWxybjBmeVhpNDhibDNSVER4QkJT?=
 =?utf-8?B?aW9GVHlsZ0VMNGVNVnpxWTVWSTlHSUFPNHU0TmNEWFpQblA1YThVZEhMejV0?=
 =?utf-8?B?QlpMZDgyNklXdmt6RldhWkZLZjZyc1lkd1ZsckYvMmZpVVNlUTlQNnoyRHZh?=
 =?utf-8?B?L0lWSWt0MkEvVlhaU1RoRUFYclFuWHd1azE3ZnR1OWIzVE5kZXVOUjArWEVK?=
 =?utf-8?B?bWIxWG04OWUxcVltaml5dTZndGtvczhZUVZqSVYyaTB3SjdwUEJsWVBpVGow?=
 =?utf-8?B?TC9yRmtRZHQwV1dyY2h3VnFLemRpT0lmVC8rdjBMTTE5RWdCUjNJajE2OHR2?=
 =?utf-8?B?Q05Fdm9LdEhvMWVWUFlpSGNvMy9LKzBiSjlnNTN0U3FzWHdZV0kvQjBzRlZv?=
 =?utf-8?B?TmJpL3VBblUxNTBqS3VkT29sSHRJS2lELzdwTy9JZjFrVWJKamhKRVhORTVv?=
 =?utf-8?B?MmxDamVmanNzZk1sK2I0Zm03RGtnak1KSUdzNmFtSjMyV2YzSGRYRXJlMmlL?=
 =?utf-8?B?dTZYYlRiKzRHUWRRUjlSbURSL2NwQXNyeE95SlNqcW90ZjJRSmJLZ0xmMWJX?=
 =?utf-8?B?NnhqY0J6YW5xdXpsWmlpS2lFL1FNUzF5ODZaZzNuNmdqRGFabDlwS2tzenBO?=
 =?utf-8?B?OWZlRExGWWg5aEhTSmNyemVadUFDV2g1b3RjMUdZNUdSdGtZMzMwNDExMTNO?=
 =?utf-8?B?bGRYNG1nNnBPd3BrSG9oYlg5bnJjMTNIVnkyZEJ0dzc4NGhpeE5OalpFVWxD?=
 =?utf-8?B?alhiS2loRXhRamNWRG5FVWZUaUQ0d3l6RmNqQ3VHK0NaczF0Z1M2cW0xSHp1?=
 =?utf-8?B?R0gyZDFQVjBJZmVocUtiaCtiYlBjOG81dDNIUWhzZzhQUlVCOW1objAwanZ6?=
 =?utf-8?B?S1F2cHRwNHEvUzlGOW9rK0JvbDYyR3ZKTmJEVHN4VnB4TkJjYmNlNU1QNVln?=
 =?utf-8?B?RWIvWTlTcWp6L1Fpam93TXlqTy9xL1hrTWo3d3FhV04zckpFaTVOa0VmRm11?=
 =?utf-8?Q?bx+/qShjRL6K/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWtNa1gvenBRZ2E4ZTJyQThtdytzQ1NPbnMrZnk1RXlmSWdpajZSS2ZENjlq?=
 =?utf-8?B?RHB4aW1uVER5QTVqSUZRNEZnbUxtYlNPRHRxTnY2djBvY3lCR25rbzRXNmZi?=
 =?utf-8?B?LzdPYUJyQ25hUFhMem1MSXhvWHVtZmtsZUVHU1REZGlTTXY5eG00R1BydjZj?=
 =?utf-8?B?S0lCeFU3VHNyVmg0ZzdadGZ5Z05WUDhDOUdqdi9hVnkvNkUrQkxsSERVWDlo?=
 =?utf-8?B?UVdVTnovVjRtWmYyUk9GbkszcnRtdis5THlOKzVOcWo2NTJoMWZFNy9KN1cy?=
 =?utf-8?B?TWt6SFNKUGViclQ3SDF1NXpvVFJJVWk1VktZRWlXT1F1d3ZaTFBSOHBINUNF?=
 =?utf-8?B?LzBmWGp5NjRiMTcwNmFkSVA3MUkvNklySE1DOTZDbjloOVNLSUp1UCsybHZM?=
 =?utf-8?B?T2ExRUhxSlhzY0dhT0NpS1dkdzZIcE05WFJaTXZhcVJwOEFvMjIxVDQ0bDc5?=
 =?utf-8?B?QlVFZ2IvT0NjajBiQjJKT1NaaEduWkxPMEdQZkNsSlFSUGpoNWIzbTR6R24v?=
 =?utf-8?B?RWQyTlM4QzF1REFEMEo2RW5QZlJYY0M5aEs0LzJoUkRSSEZ3WkllY2t0ak44?=
 =?utf-8?B?M09XNVdjTEY5azRDT0JwUThiU3RONWwvUUliMlpRa2NNeklabVN5d2hwTlEr?=
 =?utf-8?B?TzN6U0ZKK1JhUWRlb1puUXVpWWlDOEZEMVltRXdNWjVvV0dDTFpGVmxPeFE5?=
 =?utf-8?B?eXg5aUdVQWNQVkxqSmlaaWx0RUN6TlpNZzdGS3dMZkZMN1hsVW5mcDZZakxO?=
 =?utf-8?B?dFpLS05lZnhRUmZRdzRIa3F6K05wajZJNmlHbFVldzhtKzMwYzIwMHBsczlp?=
 =?utf-8?B?dlg2TWZEOGdhT094R05iR0Z4OEtqT2VXYThXWnVJcEVqUlFTQkpuUGtJcUY1?=
 =?utf-8?B?YkNycDVKNStxT0lGM2ZlSTROQXdjdXZFSmszSHVLUUorTVhXclk4UFJ2ZXNp?=
 =?utf-8?B?L2FiR3hVK09raVJaYUhzSmY0THVHZXhlaVhEVWJyOEpkdmJRTWJiWE1sOWNi?=
 =?utf-8?B?Zmttc0IzZUVWUnVFd1A0SkVGeWlpbHpvQ1lhUU4yZnBNZjFGcGRtTnY5T1E0?=
 =?utf-8?B?dEtkb0lxZGc5SUswNVp0ZTVkZzArVWFzbHRwZHh0aHZLeWZBMGwxQmNBdmdE?=
 =?utf-8?B?Qi9lcE1ocTBsVUVzQ2NnNXZIZkZzMGpHMzREcml4RWk3bXdVTWlTc2dielor?=
 =?utf-8?B?blc4WkZCTTdaYXN5ZmwxRDlvQ1FxUUFSTUJwNlJTL1FUSFNTdWZNYVRmaXFP?=
 =?utf-8?B?Nit2UFJLcW1kaGRNUFkybmpLVzYzWDdPaDdXaEFZNlcwcWtzYWFocitEYndN?=
 =?utf-8?B?RDJsU3VkYUlUNDMrNXk0ZVBib1krMmEyQVIvcXdua05CLzh5clp1dTZsNnpY?=
 =?utf-8?B?Y21jakYxQk8yMUZYaTRIMnFTd3ZvTGFMRnQyTU1oMDdZWmhFRUxDUUxyM2ow?=
 =?utf-8?B?eE9wZFd3bkpPWXhZeUtMVDlHYk56RlU1VktZWWlxMk9ZM0Q4MVJhN1UwUm9B?=
 =?utf-8?B?REF4OWRPR0pPMHF3VzdBSTdOUHJrSnFOVU5ISVNvSHR3OVY2dlpQU1BvaWtS?=
 =?utf-8?B?cDZxQndKZHRzc1A4Z0ZqNHpzNFNTeFNTL0JtTDAreEZkUFYvZS8raEVJOU90?=
 =?utf-8?B?M0hqUitvbXZ1VTVOM1RDQWRxWGhhdXdIczNpU2JvWVFUb3p0V1ExYmwyUUdU?=
 =?utf-8?B?cUcvTDZJNXhiNG5ObDNpWUc3TGM0R0R1T1B6WnhudDA3UkZxOUp3dDQ4czFI?=
 =?utf-8?B?UXRoZldhUGQ1bkZuWGZFR0xtNUtJNVpENVRIMHY5SUNHa2RaeFBNWm9Fa09N?=
 =?utf-8?B?TllSdjYrZ2QxT1JDNjllQmNSSHI2dTN4K3FTYWNsRDIrSk8yTUxGK2xPeEkw?=
 =?utf-8?B?WGc0TjdRd29Hb25pTzFlT0tUR3pVcU5JczFiM2NmQ1h5eWhGRjMrTnRoNU16?=
 =?utf-8?B?cjJNTVB0ck9UNWs5QUZSNXhaN0VjUXVVT0dGZEpJblM1RTJkVnRtM21RUk1Y?=
 =?utf-8?B?bERsTzRTeG1meHJPYkJmOVhtMnpIWUFHWUVMZWd3RTZYMEF2bnp4VlZoZ0NM?=
 =?utf-8?B?ZkdZU1F3YTZQd1lQWDNOYWZzMjBjUnk5MDgzVWladEdPMmNMV3NQYUVIblJV?=
 =?utf-8?Q?TVedpw+hw5RxutWRz4suFEAmv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d355d40-b7a4-4b9d-3dd6-08dd490e6d0a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 13:34:06.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXEjDd5fiJOB/wes41rUIMGC4iZdqv3otNISX/pmuj5IJAEQJ/UonaVhL7FUe2Ba6ifZsPVnXLwMLZTiEWQVrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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

On 05/02/2025 17:56, Michal Wajdeczko wrote:
>
> On 02.02.2025 12:00, Ilia Levi wrote:
>> Add a convenience function for minimal initialization of struct xe_mmio.
>> This function also validates that the entirety of the provided mmio region
>> is usable with struct xe_reg.
>>
>> v2: Modify commit message, add kernel doc, refactor assert (Michal)
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> with one nit below
>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h |  4 +++-
>>  drivers/gpu/drm/xe/xe_gt.c            |  7 +++---
>>  drivers/gpu/drm/xe/xe_mmio.c          | 33 ++++++++++++++++++---------
>>  drivers/gpu/drm/xe/xe_mmio.h          |  2 ++
>>  4 files changed, 30 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> index 89716172fbb8..26d00d825454 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> @@ -10,6 +10,8 @@
>>  
>>  #include "compat-i915-headers/i915_reg_defs.h"
>>  
>> +#define XE_REG_ADDR_WIDTH	22
> maybe we should also add a comment for this definition that we aim to
> support at most 8MB MMIO regions and define this as:
>
> #define XE_REG_ADDR_SPACE	SZ_8M
>
> so we can use this definition as-is in the assert below and then for the
> xe_reg.addr bit width use const_ilog2(XE_REG_ADDR_SPACE) ?

It is a good idea, but the limitation comes from the fact that we use only
22 bits to represent the address, not because we want to support up to a
specific size. The limitation is imposed by the specific implementation -
if we used a u64 for the address, we wouldn't have any limitation at all.
Thus, I think reversing the computation would convey the wrong idea.

However, I've added and documented XE_MMIO_SIZE_MAX macro in v3. Let me know
if it makes more sense now.

- Ilia

>> +
>>  /**
>>   * struct xe_reg - Register definition
>>   *
>> @@ -21,7 +23,7 @@ struct xe_reg {
>>  	union {
>>  		struct {
>>  			/** @addr: address */
>> -			u32 addr:22;
>> +			u32 addr:XE_REG_ADDR_WIDTH;
>>  			/**
>>  			 * @masked: register is "masked", with upper 16bits used
>>  			 * to identify the bits that are updated on the lower
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 01a4a852b8f4..f10c1f5fbbe1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -637,10 +637,9 @@ int xe_gt_init(struct xe_gt *gt)
>>  void xe_gt_mmio_init(struct xe_gt *gt)
>>  {
>>  	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_device *xe = tile_to_xe(tile);
>>  
>> -	gt->mmio.regs = tile->mmio.regs;
>> -	gt->mmio.regs_size = tile->mmio.regs_size;
>> -	gt->mmio.tile = tile;
>> +	xe_mmio_init(&gt->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>>  
>>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
>>  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>> @@ -650,7 +649,7 @@ void xe_gt_mmio_init(struct xe_gt *gt)
>>  		gt->mmio.adj_limit = 0;
>>  	}
>>  
>> -	if (IS_SRIOV_VF(gt_to_xe(gt)))
>> +	if (IS_SRIOV_VF(xe))
>>  		gt->mmio.sriov_vf_gt = gt;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 3aed849a128b..8ba314de02ce 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -55,7 +55,6 @@ static void tiles_fini(void *arg)
>>  static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>>  {
>>  	struct xe_tile *tile;
>> -	void __iomem *regs;
>>  	u8 id;
>>  
>>  	/*
>> @@ -94,13 +93,8 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>>  		}
>>  	}
>>  
>> -	regs = xe->mmio.regs;
>> -	for_each_tile(tile, xe, id) {
>> -		tile->mmio.regs_size = SZ_4M;
>> -		tile->mmio.regs = regs;
>> -		tile->mmio.tile = tile;
>> -		regs += tile_mmio_size;
>> -	}
>> +	for_each_remote_tile(tile, xe, id)
>> +		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
>>  }
>>  
>>  int xe_mmio_probe_tiles(struct xe_device *xe)
>> @@ -140,13 +134,30 @@ int xe_mmio_probe_early(struct xe_device *xe)
>>  	}
>>  
>>  	/* Setup first tile; other tiles (if present) will be setup later. */
>> -	root_tile->mmio.regs_size = SZ_4M;
>> -	root_tile->mmio.regs = xe->mmio.regs;
>> -	root_tile->mmio.tile = root_tile;
>> +	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>>  
>>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>>  }
>>  
>> +/**
>> + * xe_mmio_init() - Initialize an MMIO instance
>> + * @mmio: Pointer to the MMIO instance to initialize
>> + * @tile: The tile to which the MMIO region belongs
>> + * @ptr: Pointer to the start of the MMIO region
>> + * @size: The size of the MMIO region in bytes
>> + *
>> + * This is a convenience function for minimal initialization of struct xe_mmio.
>> + */
>> +void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size)
>> +{
>> +	/* Validate that the entire MMIO region is usable with struct xe_reg */
>> +	xe_tile_assert(tile, size <= BIT(XE_REG_ADDR_WIDTH + 1));
>> +
>> +	mmio->regs = ptr;
>> +	mmio->regs_size = size;
>> +	mmio->tile = tile;
>> +}
>> +
>>  static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>>  {
>>  #define DUMMY_REG_OFFSET	0x130030
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index b32e7ee4b23e..c151ba569003 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -14,6 +14,8 @@ struct xe_reg;
>>  int xe_mmio_probe_early(struct xe_device *xe);
>>  int xe_mmio_probe_tiles(struct xe_device *xe);
>>  
>> +void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size);
>> +
>>  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
>>  u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
>>  void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);


