Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F5C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 14:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7060910E07E;
	Tue, 21 Jan 2025 14:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LE6Aq9ej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C54910E07E
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737471095; x=1769007095;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a8VI4ma7kWtA3trXJ+3fwTOIjw5JQGvf2paaLxjwluQ=;
 b=LE6Aq9ejhbBffd6Ec5E/Zg99GNhqXOV0Ik6Kuzoeq/ltumRtMsvAB2Ej
 ywydqnkC9112O/3Nhz3UI6c4y6d9UqXBi3h2IdBHdMrdIC1PGyLLpzKXr
 xs6mfCKdyrtX71MzxH5NMwKdYkoJKlbDQh9k28GVvypHAAQdTQBvDIWM2
 qlsv+0iuE1UK7L/uvm+w9614Uxrr6yBPImpVGALX21hSmI+lIpbMKAIFj
 5WHim/04cuByvspUiLvPd9fDdfETjWYeEBlygCbsK82TEEHh85WESo8jZ
 +65iIuEq2rbsTy6dGvyOdnIhIHXFN9gWIMTw9SQJUtaMH17vsnO2VMf6o w==;
X-CSE-ConnectionGUID: bWWu/NayS7Wa2NaGFw6n5g==
X-CSE-MsgGUID: eaRIdyiYQbyznBS4W6hMCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37763116"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37763116"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 06:51:26 -0800
X-CSE-ConnectionGUID: 7/gxADztTD2gjFJH/ahpyA==
X-CSE-MsgGUID: sYhGUU2TT4WhpmmjxrcZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106754107"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 06:51:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 06:51:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 06:51:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 06:51:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGHFx5E6+uyIQP3wb+8GPpw7um9dQVuDsy8R3f7a43jHhNCczSRzk04PNcVz8J5Qx0uDfawMq/hcG0KITt6b9e+wTIzh03BDHyuDlHL6pGA2iCu5rv3yJbqR8hA6bIeCt11EfFEbkwPpwKQ24vajHq3XUhNsqxV+rZuKclqHwyWMEMhVOduFh3Ew4FWINx4EG9ch4vHhRaZy9mQH09fAB4VYpLHp1zX8yU/5y1ArHyiKqJErFIsLQcT+PKl/Sizl1sJ3i1+aKtplT4Aor20e2dMEWhPjzYls3OmoQ/yMY63+hc5lMZlgyo5DIZUHWErsgGzpymNNO0x757hWK5G+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoBu2BYKcz4RLap4YXtVO7m95BmCqYjnjRp/djzu8rw=;
 b=W8y4pWSMk6uksLqZnvHSh3r1LzZPE8Lx2MqPDO9gqsY3KZqK/MSHaZB6NpLdEt9oU0F222wMyEiPPbzb8mANA68XfU7XgpOduuP1u4dD8ixi45hUJW2YxxIS7MuypXhbH0vnjpgocMmN01N0HKBNrGr5wCLZsZj1Xd5650XfN1H3CJtWBqBdIcG+Xa/RWr8kLrRVsHHGmfeIv6+uB4mUHLzV8oCOlA9NQ4FfuVW7hgZyWz96UWUGxh9e8MA/D6Gh2CkZKjwl/eCGPyG4zD6nIzqxoYGhHhVWMI8zumudsbh/BxbX42rOlkuizDj1YCeHmJH/1yiu3fYoVDLbusO7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Tue, 21 Jan
 2025 14:50:53 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 14:50:53 +0000
Date: Tue, 21 Jan 2025 09:50:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <jani.nikula@linux.intel.com>,
 <alexander.usyskin@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Add functions and sysfs for boot
 survivability
Message-ID: <Z4-0SStrkZYgXQZx@intel.com>
References: <20250120064042.2596178-1-riana.tauro@intel.com>
 <20250120064042.2596178-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120064042.2596178-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:303:16d::8) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 10da5064-39dd-4725-188c-08dd3a2b011c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cCtJbFk0RW1uV1B2QkpjYzMrSFlCZFA3UFI1Z3ErT3IzYzlYM1JQdm0rWEVK?=
 =?utf-8?B?OTdCVlNUSURnaTcwVlZYRmsyenl6QXpwN3NDVXFoSDY4WmI5RHl2di92eVpS?=
 =?utf-8?B?RFlpUWJkclJyRTJocmF5M3NHaUhNdGdWZVZxYitlenFDN01DM1NWYXBSYXhK?=
 =?utf-8?B?MnR6Smw2MWFTb0JOTXd1bGExenhnQmoyaXNWa3dYVUdZQzhrcWtnUk50bTl5?=
 =?utf-8?B?MGV0MlhmeXpUV25sWWxURlhNaDd5eXEzMVdPSmQ1Z0Y3ekhFanN1NDlETldP?=
 =?utf-8?B?TDFUdDNRSFhOMk9BM2VzN2pINnAwNFpJV3Z2SGtmTG9hR3BlVk1FY2xLcHFX?=
 =?utf-8?B?b2hQazV0TDEvMENJOXMrMkVzR3ZTOTZYakU1YVN1b3RjZXVrVVRIQTc2RXJZ?=
 =?utf-8?B?RHVDWkMzcW5oNWhuM0U1QjlIeERzNGlmZWtYTDdXQmNXZTdMYloxdHp1RTNY?=
 =?utf-8?B?b3ZtYjEvOEVheFJwa09PR1grY2VFUDJkME52TXFvRGFQUUNsWm9zOFl6c2lT?=
 =?utf-8?B?dGlYRlIvcnBSS1NqSTRTOTJCYWkyOTc2TjluQmdFYXYwenpsWEU3R3luQ0xs?=
 =?utf-8?B?RjZpaTR1cEllSjlxQlNJa3dhVU1GMWxkNVVoZFNCQnBrVkdJS1RBZ2x2cUx6?=
 =?utf-8?B?dFVYdllYVitUVmpBLzRrT0ZDTEZYMTZLeGZ0UTVqQTRHRllYTHg2anF1bEE1?=
 =?utf-8?B?S3JGeWJJMk5yN050VW4zY0s2UEhWWWJhRjZJNTJOUGVvVzJhZ1hIMDZqVU0v?=
 =?utf-8?B?ZUl5c0Nlb1IxVnJqSzFCK2VtUmxRK0F1OGlsT2Z5eVVnZWtqNE15cHRGZWwr?=
 =?utf-8?B?U1ZtdTdRK3RIOWRMazB6S0hDZmxVQ3BTRFU0UVU4SU5Scnk4VWZya0pSNU4v?=
 =?utf-8?B?TGdSS0xTeG5sZVRsUDJWZVdLbXJieWVwOHplT2JxaGhQY1RmZUZqSFhSSXh1?=
 =?utf-8?B?SVN3ajJhVzkvaHlOL2sybFFocXhzWkxmeEZrN3hCbks2eDRHbUVyZGpZMU1F?=
 =?utf-8?B?dmpsWTUvbk5maGhyTlorTmM1bStKL00wS2dGQ3ZJUEwrOHJhQnNnU1JWdFFO?=
 =?utf-8?B?Qmg1SHBpM2J3bTRiQWluUmJRcmZXT1hXUHZNYUR3QmQ5cTd6NHRNZ1VmYU95?=
 =?utf-8?B?RlZuQVozMG1rTDBES2NIempqdTRVV3BDM3gzZzBqdUxwdFNFUEpiaU9RdjZv?=
 =?utf-8?B?SCtYZncxZjRqdDc0U1dBM2dtbW5OY2hKUndMZGZFaGlxWnRIbUorTWpuMHRU?=
 =?utf-8?B?RlhUdE1vV05HelhKUWt4bUtJaGVqZTJCZllTN2g5aDhDZkRONE9yemdrNnRa?=
 =?utf-8?B?dExnbFR4UmxjbWRBWnVXeTdvTFk1SzZzNEFJKytnUmU4M1FuNGxZTFFsRVJN?=
 =?utf-8?B?ZXZrYlppU3d4bTgwV0U4T012K2lKUXJLcW5Jc3RPNG5zeDY1aHhNZjRNYlox?=
 =?utf-8?B?YmJ1TTNpbE1hSWg1UXZwRzFHaWkwNnZLaXZiZlRzNklSaWtLWVR2ZjVGTWJ2?=
 =?utf-8?B?UmFDdnpUclR5Tld0NDMrb0gxMGlkaXVHMVVtNFkwS2IzWldGMm9zeUl0amRm?=
 =?utf-8?B?TzRHWUxhVUJxYW1VUFJ5aSthZWFSMk9saVZpMGtPZFl6QjZaQ3JZZWxsMmJT?=
 =?utf-8?B?QTRVQ2UwTkYvbENicjl4QU9JZm9oOEpwNTIyVmRTNFBCNHBvWVBZRU5vK2lh?=
 =?utf-8?B?cnN5VHZCOW5OSFBVNGJwQ3RLTFE2ajdReGg0cklkcW9iTXQ3S1IvUnNlaEh6?=
 =?utf-8?B?cUhhT0xCTy8zZnIvb0tMRGc1L3M1bXBZeSsyTGIwZm1RMEJtOUEwRm04bEt1?=
 =?utf-8?B?aG9Ta3ZPeUtKQi9STXczYUp2Q0ppd1JIRHJGbWwwVEpMK0MrTDA4NWlBRFVG?=
 =?utf-8?Q?aAe1mNlle3Lzu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGdaL2JCQnJUOVV6VlZUZSszSitrZDlxQ3FsSmFlZnphRElaaW9LcG43L0ZD?=
 =?utf-8?B?aTJBSXBzaDdFQ0dtVWU1TkduYlNaVm01M3V5aEROaEt0SUNINUYzUlNNMTFE?=
 =?utf-8?B?RkVNY3J1b2F2RkhlRU5VQ29XVGtmcVBIdUV6d0dtU0tpQ2xQY3Bjc2syaXdy?=
 =?utf-8?B?eDU0MXpwYUN2UGhPNlduNlVXWmVmZ09lb2hqWTVoT2tzOVprbVpEYktUY1ha?=
 =?utf-8?B?ajZrOHU4ZC8vOGhSa1ZtQzlDWTBZT0wxOXVZQkEvRThCRVRKdGdGQ2RBL0Na?=
 =?utf-8?B?eGVSUzJFNUdVQmZmRHZlYlNhM2ZFZEFUdTc0dkVTeGhEMTZvQXFHUUxlY3A2?=
 =?utf-8?B?MFdHa2lVMU5Ud1duSHVBMkNNaUh0T2hvUnkxNDJDOFZKSlBqMTRGczY2RjNT?=
 =?utf-8?B?bWJQWWdGUTVuS1ZDRU9uKzdFTDh4d1ZwT0k1ZmxjNlprQUFZVjJNOFBrbXBa?=
 =?utf-8?B?Yi9NeUd5K084TU5aZk5paGZTYS9kV2pycFJweldKVVpranFMV1pla0p2ME1C?=
 =?utf-8?B?UDVQMnVkQWtVSFVYQXRQWWo5RkJIL1dIc1ZrZGhJVjg4ZC94WDZ5LzVsUlBW?=
 =?utf-8?B?ZG5xRjdSMFc3ZXZ0QWVtVm1IeWhwVDZzaVh3blMydkd2Z0tlc0hFNXVxcjBB?=
 =?utf-8?B?OTFncUxyTGxWRlhWOEtMSWdVcUxabytLTEhXN3JtZTh0b3J6UVBqRUJkUnF3?=
 =?utf-8?B?VkptdnRUSkpQcFhFZHJlUUZ0cDZRbzBSVVlHRitwRm9YVEpzRTRQdklDbHRu?=
 =?utf-8?B?TFZTaXovS0kraXhhNnN5ZURJR2JoMWh4VnQzZldhb1A0Z2xpRjY3MDZ6endj?=
 =?utf-8?B?UHQrMUN0enJPSHBtZ0VuM011VjMwSEtLdHFRSW53S2xoSkpSSUQwUDFHQkNv?=
 =?utf-8?B?SDE3c3k2a0pxb0FTay9HckUvK3h5RUdrUkFBWFBUSGtlekdjaU5HS1dFUWlv?=
 =?utf-8?B?MzdFcDREblRvWGNKMWhKdE91WlIwbktyd3N2RHhuUm5XaUVCNFdnL1NGbnJH?=
 =?utf-8?B?Y3Q3VTRNMEk4cUdtaVJrT2ZSekJXenk4dmNsYmFtYlJZeCtVTVFjM1ZlZlZy?=
 =?utf-8?B?TnN3cXVhMWEwNEhXKytsTSt0R05wU2gzbW51WWVqeE44eGFLK0Q4UndDODho?=
 =?utf-8?B?ekRocVYxNFViY0MwenovQkpvUGsxTVJibkVOUUtKVzdZVDdBMEU2cldjYWJi?=
 =?utf-8?B?RjlJNGFQZ2ViRG1KTHYwMm0yWS96UFhYNmJTMmlmRkVRcWljclB3MHo5OGRw?=
 =?utf-8?B?cVEzemdtQTM1dzY4ZGltVGF5RmFmaTBtTENtNTRjVVlsMjRiUmNQMUdWeFQw?=
 =?utf-8?B?bUs1RVY2ZytLT2VNRWVKZW1CSVlMTi83TENWK0l0b3pwdVpENmxmQ3FhQ0dj?=
 =?utf-8?B?bGQ1YjRuREZ4KzExeGRaWkFGVTNzVCs4c2ZXQUt3TExlcXhFUEFSak1wdDdw?=
 =?utf-8?B?cGpmNUJhNHJQZXkwZDFQZ2dlenMxVDFDM281NUx6Z0VTU1FDRFVoemRJYm5D?=
 =?utf-8?B?T2paZXN5dXF3WCtQUzZ5eWFTRk0vbTJwVHFPMGRnaEFMYmFkYUNCaFRYQUc1?=
 =?utf-8?B?eVZvMTZ6Wk8xUGEvMVgxWkprOWZFZTlPNTZScU9ZR2xTNTYxK0xmeUxQU1p3?=
 =?utf-8?B?bXg1cUo1SEtNamQxazFNVmpTTHpkcWJ3blJzbVhacmNCUGQvS2RuMS8wby9u?=
 =?utf-8?B?R2EwSytNTUNaUzFlTnRrRGJVYjVyZ1JMRzhLaTA4MVhwNmtheUZlK0VXalkx?=
 =?utf-8?B?Z0NmeDhUbGpSMGVRUnRoeFdHWGVJdWQ3QnJvcit5VWFJelE0NXBUZ0F4cnBM?=
 =?utf-8?B?SzVRRmZSVGNYdDgxcGxwdnVUMjMrZURQY0VJMThqMzZPSzlVRWFnbnNQOTdU?=
 =?utf-8?B?cC9pQjNoR2NmSVVCSmhaRWhmZHg1cmNwRnhpZTJCMUNFS1NSNXVYWXpvT2RL?=
 =?utf-8?B?TU5SdVpRZTBhNTNWRXRWVkpWVDdNMWVTTUQ5YXhDa1Bma05HK0FhUkQ1SEdX?=
 =?utf-8?B?WUZpZG9QN1RpV0FyT1VqeTdZRFpJUUNUMGFKOXJqbzFRWUhvQUpNTWRwTmdi?=
 =?utf-8?B?ZnMrTjZIN0hqQnM4YWUvUlExTXJLQko4Mzd5SE9wSytqTE9KZkpYWnBaUzBE?=
 =?utf-8?B?a2lLaGMrWXZQeG56TC8rWTYra004RVZQRXVTQzdodC8zZkplNmo2WHZ6KzVW?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10da5064-39dd-4725-188c-08dd3a2b011c
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 14:50:53.8219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3zvGfniGGpyj8cireGM6PHFx4rt7KGq8T4Gjm7mQyC3n4KLNswu7YugNdlN0hjDPu8vwy/rKHZ2i6AZhhQqeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
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

On Mon, Jan 20, 2025 at 12:10:40PM +0530, Riana Tauro wrote:
> Boot Survivability is a software based workflow for recovering a system
> in a failed boot state. Here system recoverability is concerned with
> recovering the firmware responsible for boot.
> 
> This is implemented by loading the driver with bare minimum (no drm card)
> to allow the firmware to be flashed through mei-gsc and collect telemetry.
> The driver's probe flow is modified such that it enters survivability mode
> when pcode initialization is incomplete and boot status denotes a failure.
> In this mode, drm card is not exposed and presence of survivability_mode
> entry in PCI sysfs  is used to indicate survivability mode and
> provide additional information required for debug
> 
> This patch adds initialization functions and exposes admin
> readable sysfs entries
> 
> The new sysfs will have the below layout
> 
> 	/sys/bus/.../bdf
>              	     ├── survivability_mode
> 
> v2: reorder headers
>     fix doc
>     remove survivability info and use mode to display information
>     use separate function for logging survivability information
>     for critical error (Rodrigo)
> 
> v3: use for loop
>     use dev logs instead of drm
>     use helper function for aux history(Rodrigo)
>     remove unnecessary error check of greater than max_scratch
>     as we are reading only 3 bit
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Acked-by: Ashwin Kumar Kulkarni <ashwin.kumar.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 215 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
>  6 files changed, 286 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed738..fb1cb98ce891 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
>  	xe_step.o \
> +	xe_survivability_mode.o \
>  	xe_sync.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..0f5a052150c9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,6 +21,7 @@
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> +#include "xe_survivability_mode_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -341,6 +342,9 @@ struct xe_device {
>  		u8 skip_pcode:1;
>  	} info;
>  
> +	/** @survivability: survivability information for device */
> +	struct xe_survivability survivability;
> +
>  	/** @irq: device interrupt state */
>  	struct {
>  		/** @irq.lock: lock for processing irq's on this device */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index f153ce96f69a..4e373b8199ca 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,20 @@
>  /* Domain IDs (param2) */
>  #define     PCODE_MBOX_DOMAIN_HBM		0x2
>  
> +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
> +/* PCODE_SCRATCH0 */
> +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> +#define   HISTORY_TRACKING		REG_BIT(11)
> +#define   OVERFLOW_SUPPORT		REG_BIT(10)
> +#define   AUXINFO_SUPPORT		REG_BIT(9)
> +#define   BOOT_STATUS			REG_GENMASK(3, 1)
> +#define      CRITICAL_FAILURE		4
> +#define      NON_CRITICAL_FAILURE	7
> +
> +/* Auxillary info bits */
> +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> new file mode 100644
> index 000000000000..b27757b4ef5d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_survivability_mode.h"
> +#include "xe_survivability_mode_types.h"
> +
> +#include <linux/kobject.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_mmio.h"
> +#include "xe_pcode_api.h"
> +
> +#define MAX_SCRATCH_MMIO 8
> +
> +/**
> + * DOC: Xe Boot Survivability
> + *
> + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> + * Here system recoverability is concerned with recovering the firmware responsible for boot.
> + *
> + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> + * such that it enters survivability mode when pcode initialization is incomplete and boot status
> + * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
> + * survivability mode and provides additional information required for debug
> + *
> + * KMD exposes below admin-only readable sysfs in survivability mode
> + *
> + * device/survivability_mode: The presence of this file indicates that the card is in survivability
> + *			      mode. Also, provides additional information on why the driver entered
> + *			      survivability mode.
> + *
> + *			      Capability Information - Provides boot status
> + *			      Postcode Information   - Provides information about the failure
> + *			      Overflow Information   - Provides history of previous failures
> + *			      Auxillary Information  - Certain failures may have information in
> + *						       addition to postcode information
> + */
> +
> +static u32 aux_history_offset(u32 reg_value)
> +{
> +	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
> +}
> +
> +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
> +				   int id, char *name)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	strscpy(info[id].name, name, sizeof(info[id].name));
> +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
> +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
> +}
> +
> +static void populate_survivability_info(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	u32 id = 0, reg_value;
> +	int index;
> +	char name[NAME_MAX];
> +
> +	set_survivability_info(xe, info, id, "Capability Info");
> +	reg_value = info[id].value;
> +
> +	if (reg_value & HISTORY_TRACKING) {
> +		id++;
> +		set_survivability_info(xe, info, id, "Postcode Info");
> +
> +		if (reg_value & OVERFLOW_SUPPORT) {
> +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
> +			set_survivability_info(xe, info, id, "Overflow Info");
> +		}
> +	}
> +
> +	if (reg_value & AUXINFO_SUPPORT) {
> +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
> +
> +		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
> +		     id = aux_history_offset(reg_value)) {
> +			snprintf(name, NAME_MAX, "Auxillary Info %d", index);
> +			set_survivability_info(xe, info, id, name);
> +		}
> +	}
> +}
> +
> +static void log_survivability_info(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	int id;
> +
> +	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
> +		 survivability->boot_status);
> +	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
> +		if (info[id].reg)
> +			dev_info(&pdev->dev, "%s: 0x%x - 0x%x\n", info[id].name,
> +				 info[id].reg, info[id].value);
> +	}
> +}
> +
> +static ssize_t survivability_mode_show(struct device *dev,
> +				       struct device_attribute *attr, char *buff)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	int index = 0, count = 0;
> +
> +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> +		if (info[index].reg)
> +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> +					       info[index].reg, info[index].value);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> +
> +static void enable_survivability_mode(struct pci_dev *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	int ret = 0;
> +
> +	/* set survivability mode */
> +	survivability->mode = true;
> +	dev_info(dev, "In Survivability Mode\n");
> +
> +	/* create survivability mode sysfs */
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	if (ret) {
> +		dev_warn(dev, "Failed to create survivability sysfs files\n");
> +		return;
> +	}
> +}
> +
> +/**
> + * xe_survivability_mode_required- checks if survivability mode is required

                                    ^ missing a space here

with the space fixed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> + * @xe: xe device instance
> + *
> + * This function reads the boot status of Pcode capability register
> + *
> + * Return: true if boot status indicates failure, false otherwise
> + */
> +bool xe_survivability_mode_required(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 data;
> +
> +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
> +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> +
> +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> +		survivability->boot_status == CRITICAL_FAILURE);
> +}
> +
> +/**
> + * xe_survivability_mode_remove - remove survivability mode
> + * @xe: xe device instance
> + *
> + * clean up sysfs entries of survivability mode
> + */
> +void xe_survivability_mode_remove(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct device *dev = &pdev->dev;
> +
> +	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	kfree(survivability->info);
> +	pci_set_drvdata(pdev, NULL);
> +}
> +
> +/**
> + * xe_survivability_mode_init - Initialize the survivability mode
> + * @xe: xe device instance
> + *
> + * Initializes the sysfs and required actions to enter survivability mode
> + */
> +void xe_survivability_mode_init(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	survivability->size = MAX_SCRATCH_MMIO;
> +
> +	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return;
> +
> +	survivability->info = info;
> +
> +	populate_survivability_info(xe);
> +
> +	/* Only log debug information and exit if it is a critical failure */
> +	if (survivability->boot_status == CRITICAL_FAILURE) {
> +		log_survivability_info(pdev);
> +		kfree(survivability->info);
> +		return;
> +	}
> +
> +	enable_survivability_mode(pdev);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> new file mode 100644
> index 000000000000..410e3ee5f5d1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SURVIVABILITY_MODE_H_
> +#define _XE_SURVIVABILITY_MODE_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +void xe_survivability_mode_init(struct xe_device *xe);
> +void xe_survivability_mode_remove(struct xe_device *xe);
> +bool xe_survivability_mode_required(struct xe_device *xe);
> +
> +#endif /* _XE_SURVIVABILITY_MODE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> new file mode 100644
> index 000000000000..19d433e253df
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
> +#define _XE_SURVIVABILITY_MODE_TYPES_H_
> +
> +#include <linux/limits.h>
> +#include <linux/types.h>
> +
> +struct xe_survivability_info {
> +	char name[NAME_MAX];
> +	u32 reg;
> +	u32 value;
> +};
> +
> +/**
> + * struct xe_survivability: Contains survivability mode information
> + */
> +struct xe_survivability {
> +	/** @info: struct that holds survivability info from scratch registers */
> +	struct xe_survivability_info *info;
> +
> +	/** @size: number of scratch registers */
> +	u32 size;
> +
> +	/** @boot_status: indicates critical/non critical boot failure */
> +	u8 boot_status;
> +
> +	/** @mode: boolean to indicate survivability mode */
> +	bool mode;
> +};
> +
> +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> -- 
> 2.47.1
> 
