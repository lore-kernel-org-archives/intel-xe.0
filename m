Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B300CD12688
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 00:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520C810E011;
	Wed,  3 Dec 2025 00:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGkcYWXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECBE10E011
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 00:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764720360; x=1796256360;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wHR67IOjkzu7CsJcWm83tbgyRRoAddwX8SXQjMo6/2c=;
 b=ZGkcYWXElflPkx7lPPlIHyynRVOH3nqxK/emUAYe+donJqVlGzSmNHZ7
 i4B1AsqclNXXwDi8YH0cegv2pj3CZs9BIIcnVCU42KIwAN6TmMP86CaKm
 itwkrwxddO+jkIdvDP+TOvPXWFSm2EZNvjf9w8gxPwmbi8NzjdSuYX64T
 3rq2LADoicHSKWrMyOdA2pazZxJwJvkR2YulAjCC5ht9oCskZ9sgTJzEU
 x5OHaKJQ0BMu8/xRJjwmGjCPvBtu99OxuVUFcHaXKbo8n7uFEy1X7aW1F
 bxcxmoRD64AaoftoSbh7qqifWDNKYkD0ENqTAJGkxNC2pc84vGh4M39WL A==;
X-CSE-ConnectionGUID: JVNmbxKPQEyppnTxtDCuXw==
X-CSE-MsgGUID: mmAV/glSQbqmy6vhCnTS/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66744593"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66744593"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:05:59 -0800
X-CSE-ConnectionGUID: qinvuf35SlaPCA6T+Y9qrw==
X-CSE-MsgGUID: Fh5GuG1xS0ywFChg7pemcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194332064"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:05:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 16:05:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 16:05:57 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 16:05:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx8MAInKU+LtKxdxxhObiIuKeD88MTi17symrC3401NJ3q3yDsAVOoqIjojb8cwbshxOg0262g4GVBH39Hx7/ocZssOCAwb2Ahm2TRFbhlPaBL0l03r7nAEAQZsj5o9dTeZ4N/y4++NL4Wq/qAsNTb/rJdS80tsaUcSakBB9RzeHlB5bURHwiERZjeDe/93DyuqgfzGkAuTaZm0YC7OpTyZpmtLhYq2HwOfbmPiNe4C3685ycywAn6/+dQLON4j+dTh5Ln4gAFl/tDLj76jmOhWmnnMkPoiJVV9aWXO7exTnKpp76XP3HUp2kLV/eM+6wtmhDTiwd1AKRQY+NyR0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3aG2trlmhU6whelMANbhSHJP31pYiIfPxJpbyCrJXA=;
 b=bXhkgK2LD5yiPl2i098K9JobvFX1+KPe3Qs+OWiyxD1vNo5PDHKPLw+qy70R9BWqcnrXMAyZssgnQUqZPU7ouaMkPL0dQH56q2V/IsC7CttBoH3uSQlpJSXbz3KdxsYmT6VxIUSeUlUYAcSHWPA+klYPhm9nGYEjzmBlnHcdfI49C5qgY6p2DrV/iIMp1dC6B5rLW696zkl0Yjy4OAUI3r1OrmfVM+ljeMtUAGZgEXJb1J/fL1GvXPKZk0TALiW9gCg/cQm8udF8fRU+/Q0qQHz3LiqvQ7nsQNFUzM0Fgu89bYUaGfN0AApsOXfTOBCQrXfLpxKCZoUzw3OwJ/TODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB8420.namprd11.prod.outlook.com (2603:10b6:208:482::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 00:05:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 00:05:50 +0000
Date: Tue, 2 Dec 2025 16:05:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>,
 <alex.zuo@intel.com>, Jani Nikula <jani.nikula@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v4] drm/xe: expose PAT software table via debugfs
Message-ID: <20251203000548.GL4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251117230156.366860-1-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117230156.366860-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d828a59-8bec-4b8b-b478-08de31ffb7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEpZTlpvVmpad1cxM2ZOOXVEbzJyRW1aZ2Y5cTR0d0lQekc4OHVWanVzZHZn?=
 =?utf-8?B?Vm1GYjBHSTBCVXBsZDJhbzFRMTJQVVZhS09ROC9vaGpmSFdEQndOcDVLMndr?=
 =?utf-8?B?bHh5d2tnT2xjYXFZNURzS3VlT1NXUjJwNWZsY3h2RE02bW02TGh5QytqbGww?=
 =?utf-8?B?bGtubDQ1VkFYOVRXdmcyVzBPTjBvL3pxUnMvRDVxWE1ndkZrd2pnRVhPV3VZ?=
 =?utf-8?B?VitEUGYwK0dvRC9VRnFqbDllL3FZc1g4blFmYmdjclJUaU9YdTljMEVnU0Qy?=
 =?utf-8?B?Ky8vTHRCVUxDRkJCZXpKRjlXV0djZkVpRWo2OEg2T3ZkN3M1dk42V2Vxbms0?=
 =?utf-8?B?Nk9VMEdXVGQ2L0pGTmZ3YTZ4SzZ3OUxkOUpkdktFNmlNVlRSaHpqMmlmWlpY?=
 =?utf-8?B?dTBONmNhL0MwNW5QbGFBTDhqYkJ2bGZVT1FER2c2ZFNsSUt4VHdyZ1JvWWoz?=
 =?utf-8?B?UmtoOFJrbUV2QUw4VkQxdDRub1AxQUdDcTZKcSs0M3djblg4cmJUQ0YzdUxG?=
 =?utf-8?B?ay84Z09HbHYxUThLZWZFOGtWNjFReG1uZmFxUHFNemxCRkxrajl1SDhnSWIy?=
 =?utf-8?B?clZLeGpYdkg3VzFjb0hGWFlIQzFlWTV0RnVOOXpWaHdZWWczQWx0VDJTUXVq?=
 =?utf-8?B?YXJUZGhqaG9Zci9hYlZjSlBCRDB2V1ZqSUVlWmhpSDdPTnBIc2ZoejhBVGRI?=
 =?utf-8?B?OXp4OWJwRWVhUHJyUnh6Y2FNQTlqaUsrdjhJRUo0dUI0eDYxUitrRUhycE51?=
 =?utf-8?B?VDhxUnhvcFJjRnJ5cnFibkNTbktnWm10cmM1NC9VSDQ3MjlHV2ZsdmI2TWxO?=
 =?utf-8?B?cFY3M2ZZTjRFWXlhTDhvdnVvbEFSWGtjTnN2MS80d2F6VUpaS29lMDVoRGpN?=
 =?utf-8?B?Z2lQSGRVQzZEZTlXazJ6MWhzOC8rNTlOcVhSMG1Iai9ZUG83UklrZm9VbWo0?=
 =?utf-8?B?U3UzbWN1TkRFV1Y1UU5qWnZtYnRIS0N0UEQxalRIUWdGUHJWN2xuVjAvMjhK?=
 =?utf-8?B?bmtoUFRVRE1NWTZURms2MFZzd1VqMmtkWGFkL0g4ekZidHdidVgxbEpiTFYr?=
 =?utf-8?B?R0t1cXNkTlg0d1kyaXVrWmFZZmlLdlIrblZBN0VwZXdMdDRaNWoxOGNMV0cv?=
 =?utf-8?B?T2g3elNsZHlrSXo3aHJyUjYyT3g0bWVRMEE0K2dXVFljZWg5MG50MWxSb0pq?=
 =?utf-8?B?VTJwRVVoQjlub3NCY3FaMWxvLzBsYnFZVmhaVDI2dW1jRHlzNDF6UHVXeDFy?=
 =?utf-8?B?SlV0ZEJ5SFBjWnloeWxEcUZ4YlFwV0NzYmtlNW1PMTV4anJTNWkrT1hhVld5?=
 =?utf-8?B?S3Jtc1dnV1NQdkIwR096L3p0SEVKRGpKTlFiVFlqM00xdzRJNld1Mm4wY241?=
 =?utf-8?B?cjRXeDlQTTQ3WDQ1RXZneGNSaVFkTUJUK2xrU1ZWeVlqZUVreGliQy9adTQ3?=
 =?utf-8?B?bEZRSnA4QjRzSlNUZ0xLRG1OMDExTHF3S1QwYmlCZ01haGZ5QlpsWkw0V2RQ?=
 =?utf-8?B?T1I2SGpHZ3owRkFHaDBBUTc1RHNGYmZpNHp6bWdJYzNBSHBCMlhGamZtQ3pm?=
 =?utf-8?B?dWxnRUNkRGlNWWVWbGZxaDZ5ZzF0ZHEybXR5MlMzbUp6NWl6UEM1K0tkdktY?=
 =?utf-8?B?dmJQc2RZNy9kTnVLNndkUDJHMC92Y1JHMm9pZVhGdUFzNitmR1BPTVZLYTNJ?=
 =?utf-8?B?bi96azJtOUx2QjNIQmd1OVBuL1IyNWJSanNXc1JVZ3BzNGI2YzljNXY1Y0pR?=
 =?utf-8?B?YWw5VGEyWlhPR0ZURTFZNXk1a1VXQnF5QzJEWklKWlQxWHg5RkQ0eEpYZVln?=
 =?utf-8?B?NWFITVBsSUd4WHd1K1ZLQUwwcXlXdlI0eENrYzN2R2FPa1JPS0VjRFl3R3pk?=
 =?utf-8?B?eWltNlQvMzFLd2ZxbVlaYXNoTW5ETldHRS91Y1pUZmYvUHFMaUdSODF0WWNa?=
 =?utf-8?Q?VqR0Qi5o/BB2pqWSvkvtBJTAYTKPzWzD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHA2cEFGUlBHTHZyZXc4ZDhXQ1FnNXBJck43VkRjRDh0T1lLRjZTc3NndXZx?=
 =?utf-8?B?QjlORTA0dEY0T0FIczJzaFZHMlFIZkJCVkdyUGptZS9jSmU4N2p3Z1pwalFW?=
 =?utf-8?B?dlNIMGtHZm1rSFJlam82TWFtdGI2SHpIZlM3cmpEazNVWGIyLzIxVW9qckJ4?=
 =?utf-8?B?cGs2NGFoRHFwc2lzUTl0aXNLOXR1eCtaa29oeU13QlQ2UFQvMHhXYUQxR3lw?=
 =?utf-8?B?V3EwRE1acWhJM3FqODMza0YxK0RKRTlUKzhHVlRFNFhiWnRHT24wTjBhejRD?=
 =?utf-8?B?bm9iQnJYZEt6d0JFbTNMelRQMGwvOTVib2NXQXY2Zyt0TG8vVzh6d1E4bGIv?=
 =?utf-8?B?YTdxSHRwV0tkdDBJd1BFN1pTWmNrSDl6WFFib2tva2pCK3ptekFwVkpyT0Rs?=
 =?utf-8?B?NXRqdlVLU21oYTZsdlZnY25OLzNxbkhDWk51bzRabDloRGZPdGZXUU9DVlZC?=
 =?utf-8?B?Zy9oWlNobkRCWGM3SnB0L3VmcTVnTFhuOFdrd1JvWHk5dTc2SGEvQVpYTzJO?=
 =?utf-8?B?dVdaaWhESWdpVURaam1Gcmk5WVRSUnlFQkRtaHN3aElCWW1MZ1UyWjVDZm0x?=
 =?utf-8?B?UGtlc1l5eVpGeHJWTnBKUXpYcjRiUXdISG9ZYmlFVzJJK3V1clJRczVZWlJw?=
 =?utf-8?B?T0p1MW4va3k3LzVET2dJSndLZDd1Slk4L2ZBYkdkaitqV0IwZDlzeXQ0VzYw?=
 =?utf-8?B?VVMrNUhtREJFT0hwZzBVQmI4TzMxY1NKVk5xc2NPNVFzSmR6S21lV0UxeWVL?=
 =?utf-8?B?UHVveUhWTkJHT1RFa1hHS0pvUHNyL21RL3o3Y2NKL1pYOFhnMmVKM0JIR3Jj?=
 =?utf-8?B?RzNnOUFaQzZzbi9oLzh2K1BBa3NCV2svaU9PNk5jYkVyMFI1M1p6RnppWVFK?=
 =?utf-8?B?enpxb3BLaUJhU1hsaW1rbUFidWJtOHpTbVdwajhwOEN5R1ZrRVNLWjFqbXpZ?=
 =?utf-8?B?ZUh3N0lpZGxXbjkydHZRczc5dmpFM1ZZM3pGUDIxTDBmNTMwTThJUTdJR1da?=
 =?utf-8?B?MWZzNEVzNUVIcjRMZnBrZGNRM0RzRGwxZVRIdElsODlPTU16U3EzV3l4SlBp?=
 =?utf-8?B?U0xySzFQN0ZzQXBrM0hGQTdjRFFUTW9kNmdaNmppdHNCeDJCeXJoSmtRS21I?=
 =?utf-8?B?Y2F0OVoyY0E0L2dQb2sxWk03SzlsUUxiZzBHalAzSjhuT1lzeHBLUVpoVzNU?=
 =?utf-8?B?T0lFbFIwL1Y5VTY4ZitDTWhyUDA2VEdsRUI5VHNGYS8xUGczUi9yS1lvajh5?=
 =?utf-8?B?ei9PZTBwdmUrVko5MGhzWTdnbmdTZEg0cDFVTUExRWI5NDltak81cVprcnls?=
 =?utf-8?B?OGplZkpUWTBLajZsOVYvRzcxUjJDRWtsQWpkUWEwSFhoTVQrcGNOVjFHV3lU?=
 =?utf-8?B?ak8wdmRCQ2s3NE1Nb2F2WUdzd0FDVURwZDJrdVBtT0lvNlNEZm96dTlJR2RS?=
 =?utf-8?B?MXRiWHllZ21sWFBtdGIwa0tJWjhDWExUeXJHdEZjcUhrSzNlRFA2T1BKZWtZ?=
 =?utf-8?B?L0xJa1pKeGJzRjlCVXF1MXI3VlpHUzdiNjlvNThDZEp2THY2K09ybEJpUld3?=
 =?utf-8?B?ZEVyWFVqZjc1NG1ydCtrTC9ZOUxzT29uOXN4TXZBTG5mb0xvekEzTUpheExz?=
 =?utf-8?B?R29MMzNPVHZkUVZNU241SW9zYmdsWUp6aENVM092Vk80WkxlejZyc3QzZ3My?=
 =?utf-8?B?MlZYZDNkRzdta1F6MmF5MFZnUmFEalZ6THcrdVR4TkljTVh1S0djcitTZnV4?=
 =?utf-8?B?ZXpkVkxhNmxsR0hzcXdTeTBoT1d4blAyT2p1a3M0UFZsR214Q3hDRnRqNk15?=
 =?utf-8?B?SVhhUUJUbjFiWmZTNEZNS01DUzZhQ0xNYVh0ckFjVTFmNW41dG8rYmhidmRt?=
 =?utf-8?B?ZTNrby9pd1JLU0hGWHAwekdyQjdnSUFGMVVtTXNuWEhDZWtxOFhPMlcvOFhN?=
 =?utf-8?B?OFo5RjlGVWRkazhLdGhiR250Rm85T2d3aUszTVJUQ3F0YkhZRHA5OUZWR1JS?=
 =?utf-8?B?NHp0aFNRK0t5bG5MUkgrb2RxT2Q1ei9oTEU3bEJrQ0Z6aEdIT1pyTUZiaUdV?=
 =?utf-8?B?YVlyWkJTMEZ4QmpTdVUwRy9ZQUhBZTlpbkR2ekRwQzdDT2t5OVRlNHJKMTRD?=
 =?utf-8?B?RnhCMHRFR1M4U2J3WkxYMjFWY3BqdlN4d0pZRHpaN2x5eG1lNHB0ZXNsU3Y5?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d828a59-8bec-4b8b-b478-08de31ffb7eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 00:05:50.7002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL9WC8QYCsYuSSaRqkpgevS+WaY6PacUbNSuPMu/hpCiGMp5Kq1L4DwFeLWQEokYXtWiWsI1gMnMjb+ZjNfpJ2jp9tFONN3lJE72WYa0RYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
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

On Mon, Nov 17, 2025 at 11:01:56PM +0000, Xin Wang wrote:
> The existing "pat" debugfs node dumps the live PAT registers. Under SR-IOV
> the VF cannot touch those registers, so the file vanishes and users lose
> all PAT visibility. Add a VF-safe "pat_sw_config" entry to the VF-safe
> debugfs list. It prints the cached PAT table the driver programmed, rather
> than poking HW, so PF and VF instances present the same view.
> 
> This lets IGT and other tools query the PAT configuration without carrying
> platform-specific tables or mirroring kernel logic.
> 
> v2: (Jonathan)
> - Only append "(* = reserved entry)" to the PAT table header on Xe2+
> platforms where it actually applies.
> - Deduplicate the PTA/ATS mode printing by introducing the small
> drm_printf_pat_mode() helper macro.
> 
> v3: (Matt)
> - Print IDX[XE_CACHE_NONE_COMPRESSION] on every Xe2+ platform so the dump
> always reflects the value the driver might use (even if it defaults to 0)
> and future IP revisions don’t need extra condition tweaks.
> 
> v4:
> - Drop the drm_printf_pat_mode macro and introduce a real helper
> xe2_pat_entry_dump(). (Jani)
> - Reuse the helper across all PTA/ATS/PAT dumps for xe2+ entries to keep
> output format idential.
> 
> CC: Jani Nikula <jani.nikula@intel.com>
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |   1 +
>  drivers/gpu/drm/xe/xe_pat.c        | 122 ++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_pat.h        |   1 +
>  3 files changed, 94 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index e4fd632f43cf..ec279f005b10 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -220,6 +220,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
>  	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
>  	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
> +	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data = xe_pat_dump_sw_config },
>  };
>  
>  /* everything else should be added here */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 68171cceea18..77e11fe17d4e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -358,12 +358,26 @@ static const struct xe_pat_ops xelpg_pat_ops = {
>  	.dump = xelpg_dump,
>  };
>  
> +#define PAT_LABEL_LEN 20
> +static void xe2_pat_entry_dump(struct drm_printer *p, const char *label, u32 pat, bool rsvd)

It would probably be best to split this into two patches; one to
refactor the dumping functions to make the printing re-usable, and then
another patch to introduce the new software config debugfs.  Also, we
might as well extend the refactor to all platforms, not just Xe2, so that
we have re-usable functions to print their lines of output as well.

> +{
> +	drm_printf(p, "%s= [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", label,
> +		   !!(pat & XE2_NO_PROMOTE),
> +		   !!(pat & XE2_COMP_EN),
> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
> +		   pat, rsvd ? " *" : "");
> +}
> +
>  static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int fw_ref;
>  	u32 pat;
>  	int i;
> +	char label[PAT_LABEL_LEN];
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);

This patch will need a rebase, otherwise there will be some minor
conflicts applying it with the scope-based forcewake series that landed
recently.

>  	if (!fw_ref)
> @@ -377,14 +391,8 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		else
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
> -			   !!(pat & XE2_NO_PROMOTE),
> -			   !!(pat & XE2_COMP_EN),
> -			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> -			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> -			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> -			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat, xe->pat.table[i].valid ? "" : " *");
> +		snprintf(label, sizeof(label), "PAT[%2d] ", i);
> +		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
>  	}
>  
>  	/*
> @@ -397,14 +405,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>  
>  	drm_printf(p, "Page Table Access:\n");
> -	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
> -		   !!(pat & XE2_NO_PROMOTE),
> -		   !!(pat & XE2_COMP_EN),
> -		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> -		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> -		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> -		   REG_FIELD_GET(XE2_COH_MODE, pat),
> -		   pat);
> +	xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	return 0;
> @@ -422,6 +423,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	unsigned int fw_ref;
>  	u32 pat;
>  	int i;
> +	char label[PAT_LABEL_LEN];
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref)
> @@ -432,13 +434,8 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
> -			   !!(pat & XE2_NO_PROMOTE),
> -			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> -			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> -			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> -			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat, xe->pat.table[i].valid ? "" : " *");
> +		snprintf(label, sizeof(label), "PAT[%2d] ", i);
> +		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
>  	}
>  
>  	/*
> @@ -448,13 +445,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>  
>  	drm_printf(p, "Page Table Access:\n");
> -	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> -		   !!(pat & XE2_NO_PROMOTE),
> -		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> -		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> -		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> -		   REG_FIELD_GET(XE2_COH_MODE, pat),
> -		   pat);
> +	xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	return 0;
> @@ -578,3 +569,74 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	return xe->pat.ops->dump(gt, p);
>  }
> +
> +/**
> + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	char label[20];
> +
> +	if (!xe->pat.table || !xe->pat.n_entries)
> +		return -EOPNOTSUPP;
> +
> +	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >= 20 ? " (* = reserved entry)" : "");
> +	for (u32 i = 0; i < xe->pat.n_entries; i++) {
> +		u32 pat = xe->pat.table[i].value;
> +
> +		if (GRAPHICS_VER(xe) >= 20) {
> +			snprintf(label, sizeof(label), "PAT[%2d] ", i);
> +			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +		} else if (xe->info.platform == XE_METEORLAKE) {
> +			drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
> +				   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
> +				   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> +		} else if (xe->info.platform == XE_PVC) {
> +			drm_printf(p, "PAT[%2d] = [ %u, %u ] (%#8x)\n", i,
> +				   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
> +				   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
> +		} else if (xe->info.platform == XE_DG2) {
> +			u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +			drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> +				   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +		} else if (GRAPHICS_VERx100(xe) <= 1210) {
> +			u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +			drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> +				   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +		} else {
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	if (xe->pat.pat_pta) {
> +		u32 pat = xe->pat.pat_pta->value;
> +
> +		drm_printf(p, "Page Table Access:\n");
> +		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
> +	}
> +
> +	if (xe->pat.pat_ats) {
> +		u32 pat = xe->pat.pat_ats->value;
> +
> +		drm_printf(p, "PCIe ATS response:\n");
> +		xe2_pat_entry_dump(p, "ATS_MODE", pat, false);

Not a huge deal, but the bspec calls this one PAT_ATS, not ATS_MODE.


Matt

> +	}
> +
> +	drm_printf(p, "Cache Level:\n");
> +	drm_printf(p, "IDX[XE_CACHE_NONE] = %d\n", xe->pat.idx[XE_CACHE_NONE]);
> +	drm_printf(p, "IDX[XE_CACHE_WT] = %d\n", xe->pat.idx[XE_CACHE_WT]);
> +	drm_printf(p, "IDX[XE_CACHE_WB] = %d\n", xe->pat.idx[XE_CACHE_WB]);
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION] = %d\n",
> +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 05dae03a5f54..4a3045f74bfe 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  
>  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
>   * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
