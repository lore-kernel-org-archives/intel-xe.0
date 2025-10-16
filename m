Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC37CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 18:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1765610EA72;
	Thu, 16 Oct 2025 18:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wy6Jc5EO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C8510EA72
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760640957; x=1792176957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8RLrECNZF2kO+FSfjGtSFc2LP3AakP4UTHVhL1t+S9A=;
 b=Wy6Jc5EO3GOvSCEsvIZ5ruRW752EIiZzFvJU+ysv1l7Dh8Dh/JsqJJ6C
 6nKOwCle3cesdJjxABG2ZSO1ZJnHOLUlM2oEiQxwFR0WZPuHO0I9EJDdd
 SSz2kSDklAt6MtazZt9TjUPMFyNqfTaqgvk2lPkKeZwRPvCinuESdZneG
 6dKSN3Ydv6bAu/VZX1xCX9ciD/QjudrVYWXgbOnyl8bt8cjAz9hHa0fJP
 ef2fxOQRLDL5QqiANlyCDcGB3xBnDpS7uMWx6T7ZpzYMs3W4aL5Uj5UMz
 fEtHfgFBoBxrdOQA15oY7P6whX8Q51Yp3hjs8PJeF6LkhldgYxv0pSyhn A==;
X-CSE-ConnectionGUID: 6rV3WfmiROSjX8AaEzux9A==
X-CSE-MsgGUID: 26TE6ew7Sx2R/63EGsWzRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66712379"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66712379"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:55:56 -0700
X-CSE-ConnectionGUID: uNRTlnz7SRCQ8WGDuwgafA==
X-CSE-MsgGUID: BPLSl1F/QNGjPbLiHzUZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181742829"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:55:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:55:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:55:55 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZru6Ue7G0NckkcCU/Vi1AJj1w8gMr8RPwdHNWWngrkX6Um2CRnGMQzfJrE+/SuM/KWWyHDzm5FGg0ieNp2thojfhUAraZyP50+G0q/2sG1vYXcb741o2vAfy52gJIjrIwR3knVQ6LCHDc49oqEO+QkrWkW2Kz8UkYc/JzYpFMVUWH3uJ1+fjFc01aj2WWHcIZIhTS4Xwa7z+HZz0xlCJ7ftfP+RG46KsFzEUhakpix27hk/WE5VVMUYopU+ALogoX+6yifGc9OuDX3OG5ACilQ1lQaci/I9qRTZxtrHz97+DdyHuxx3lPKWUHDFdM+rdGgwS7rKswWRhMqxzIpR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyyT4TY5OiTQoNjoSvGhKOK0Cl1Bk3zqqLhCre16fqo=;
 b=vIwG57D1WvjsFh6B+nCvWnmQmJqPSosSuD4UFlwXfHe1zQmW3i3ccqPjNnEoT0qkvmxNh4HnzMGxve0o3u8523/qUkUCXDbmlqwppDb3I4yC1nZi0+b8ocs9rybCQxmcc6esmYBhcwdA8l6JHF3SmI10dRTJaWE/zdBSJpN62ElXL+GxyngEbfLChemYdwEjzRYa9lisdTt7ylhMdheU2rz3qmDcxI2B4BAI/87V/HWJIXKPFnwbe6zBnARNFWFiQSYEYZwKJXmwzlh5szamwD00bE4F5Bkqzf8yYLgxL46IHS6d+RlJD8b+8NR88P+wq+GNH/OBqg8W7wGuJjcPMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 18:55:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 18:55:52 +0000
Message-ID: <ac95442e-dff5-4390-8e2d-e09eaf0a56c2@intel.com>
Date: Thu, 16 Oct 2025 20:55:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/tests/pci: Convert GT count check to general
 device check
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
 <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-1-d0886d97121d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-1-d0886d97121d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::44) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: d655499a-2ab0-4951-0f2f-08de0ce5a153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkI1N3FPcEc1YXEvRG5rRVR4Z3ZiSFlDZkM4YlhGYWZZVE1QNno5dFgvRElO?=
 =?utf-8?B?L1MzWDdVb295Q2hneXI2WTZJdEltRGJnN3hKMkhsdGR5WTdzT1ExWmhJVHFh?=
 =?utf-8?B?aDJ4MTJBNjFoVExwdDdjekFWQVlXQlFXY2N6Q2pialJUOHJwTWFwNXB2OEht?=
 =?utf-8?B?bEdhaFlGc2NhQkVrQ3dPQmxia3NvMXNOdzErTWgydVRLaXZBNGYvbGp6R0NM?=
 =?utf-8?B?endLR1p5cHJrN0R3THE0WmRXazJCUnBIUWRKcWJISEtOeG83VXVKaFVIUllD?=
 =?utf-8?B?akdHMDhaRTFPQlY4QnBFc3oySTFoSE9CRk5hQU1oOWl4aXpIWGdWWG5sando?=
 =?utf-8?B?cVQ3N3ZENWcyTGRGMzJ4OU1kcTR1Y2J5TmFNUnZ1ODFVV0oxS29vdHlTR29I?=
 =?utf-8?B?aW9XblU2OGpmVS91WERCemEwV3Y5Q1hoV3p4MC8ySmpidWIxbGVMNEZpbXJw?=
 =?utf-8?B?VEVmQzRrWkV2Y1kyZDFNVkJCNmhMUERseVZpOU9JNlhDb3VFaldGeVFBSC85?=
 =?utf-8?B?UCtPSHdISDFjNzFnMGlSWmpuWEp0VE9nZmk3bTAvdFBZNUVsa0hEKzlhUURJ?=
 =?utf-8?B?NjZhbTVQeHZuZ0JRYzdXK294dG5oNXcvbTh5V1UrdWV0QkR5bXRRZDRqRkp1?=
 =?utf-8?B?dHRIZGdvWnBuZ0tKZy9rL2QzT0VzNkhIY2pMMzc2WmNJSTJlRjZma2pxME9C?=
 =?utf-8?B?T0xKUGxaUXd4ekJrMWdMOUVIbDBPcU1pd0VDTGlwUXZjWUdrNHdQMTBwNWJO?=
 =?utf-8?B?T05JWjR6N3JBR0tScisvNlZTNm9aK2V5MVUxL2V3NFk2NzZxakZPcVl1RE9r?=
 =?utf-8?B?V2RhK3RnTXUrRytjQytidlVmUE9vdEhPVEhYQ0Y0UlN4WHpRSkorU05mZ01Y?=
 =?utf-8?B?TjRFc1puZVFQejRlYjJlNW9LY3craGNhdHM0UjJxZDJqOUtKSFJNbFRzQVFI?=
 =?utf-8?B?b01PK01hak5DQ3Nwd1U5MjdLa3lWYTd1bEQrazJ3N2ZnalZVV29zdjRpR0lM?=
 =?utf-8?B?Mk81QlVMRWViOXhVSkUxQkNDeHVKdXpwMHgvQk9ZYnhBcHRJRFdWK0JsMENa?=
 =?utf-8?B?Y2dwQVhQdExZOFN0RGI1Unk4REs4Zm9leDVjMURFSWxzb3loN09waHEzSmJK?=
 =?utf-8?B?eUtnVWd3YUczcWJhQmNCTU1PbXNKbVY3bEhOc0RwWTcxai8yMVIwVk1SZEw5?=
 =?utf-8?B?cEdhWm81SWNJL2ltczFKWkt5OUFmWDhLUVJCTk1PM3ZYRTdJV3ZTdE9YYitZ?=
 =?utf-8?B?YmNiUzBMSnZvTVNMRnpHUFlrSHNiTG5ESkZQT09UcC9yVG9KTFJzNHQ4M3lL?=
 =?utf-8?B?ditmOEdKSmpORVpmUmUyK2M4b1JHemFFMUxmNng2RHdCMHlTd0kxNkNLVHdX?=
 =?utf-8?B?eXVSSndmTXBuUWNYaHlQRDd6dllUR1V0ekt0a2VyRU51UlNNd2R4SWpER1E4?=
 =?utf-8?B?R2RsQnZSZVphNko2ZjNkbitZaS9FTnpXQzNhOWtuQzNjbGtRUzZVMjArS1B4?=
 =?utf-8?B?OVdvNjNHalNTS2RpdHFRUWdxaWpvNmhEb1Z6Vll4UXM0NUQxQXFGR2x2RVc1?=
 =?utf-8?B?OW1RVnRMek0vb1NEMXJaaGkySkpWZXIybkNSRnRRWGU0QXpkN1JFUUp1VFBs?=
 =?utf-8?B?UGZLTzl6emFPeXdUR3lEdHpjZUxUcFR3a3BhR3lGNllaMlN4U01pcCt2NThG?=
 =?utf-8?B?bEJ4clJocjBtZ3BRK2kzZ2JEb0h2RnJXSjk5aHcxYzM5NGJPUkxaVFJGL3dT?=
 =?utf-8?B?RHJLU0Nrd2wvNkFxS1JWRTJnaVQ5TWx1WlBVc21DdGpJKzQ5Y3Z2YU1LQm1I?=
 =?utf-8?B?U1Z5VWlONTVLU2N6TURiaThiRDdxVmd4L2kvM2NBdFV5TlE0eHpCbDdEM054?=
 =?utf-8?B?M2xwZFZDSldiMUtCQTNwMkhLVjZ3Z2huQ05Ld2FLOGRubE94WDl3OUI3OXJE?=
 =?utf-8?Q?tBXfXI3TL/k7iB9p2gN9MdZAld5tJzih?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ZhUWgrcVRnZitRM1VwdWoyaStmME0wNVhQUkhMaDd5VjIxNTJ5TFh5S1Nv?=
 =?utf-8?B?bUkzeFQ3THVua3d3aVFjc2d5dUlMNk12NjVocWs5UkdXekpNNkZQSHhUSFFv?=
 =?utf-8?B?cmZManFEU0FnL1NpV2grdnJvay9BZEhCS09kSVpVdVBtamd0OC9jaStoeWMx?=
 =?utf-8?B?cWQzWWlkUVlsdkp0cDJIc1hlb0xEdEpRRWI0cFJRQ0Nyc0d2ZVAwdmRtWTE4?=
 =?utf-8?B?QjNDRGZMZUlTR0NBNnlMK3BndHVCaVJYQnA3OGNBelR2S0loclMwRGdjeVY4?=
 =?utf-8?B?N3o3dXhvRE9Sa1BKVG1CbkxBSmtOdDhlTVVmVVpEOGJzVnRuYjYwQVZPQlRk?=
 =?utf-8?B?TVdoU3ZyQWhqMlNPdXhPc1pYVEJjM3RjU2ozbHRkWUNVRExUQWlJbUs4bS9L?=
 =?utf-8?B?VFY3SCtiOEJoZk4rS0VDdzdsRmp2WU5sL285TThDOTBvS3B6bGlrQ3ljWDFV?=
 =?utf-8?B?R2VybmxxeFEraVJUS2JSbjA1TTBXM2t4YW93Vi9RbXJmSk40KzFjTVpVR2Ir?=
 =?utf-8?B?UEhDcnVqYlpJSk9Oc2IwZ2xvREIxVXppL2dBMjM2cmQ4MG9aR3pQdklQYWlq?=
 =?utf-8?B?c0NTTSt5bjNCZ0I2YUhTNUhVZzlsejR2bDUrTUk0bjh4LzFTMC9OOWtiamdi?=
 =?utf-8?B?Sm5MVU1hMWZ5eENVaW81UkI1UWxlMzdrY0Y4aFJNODZuMmlDdTlWMldyQkJW?=
 =?utf-8?B?TE1NVzRSRmJCaXVKSFBGRnBSNUp3Z0Y4WlVLTGRzeFF2TkZacUJYcTJwYUZG?=
 =?utf-8?B?Y0wwbm5pMFREanlWQzVuRGVYajNxOGwzVG04b25IRGM0dUg3Wm5mYXkvTHRo?=
 =?utf-8?B?UlAzdjlvc2g1Sm1OcGlBT3JzYjJ2bUJEajJBdUJodWlLY1B5R0dDQnFjZ1Nu?=
 =?utf-8?B?S21XMSs3UFk1RU9yK0hLY1E2STd6NVpoSnNrdUN2UlAwVXVLV0JiSnFENUN4?=
 =?utf-8?B?ZGE5UnF4RWNKNGd3L3lPaXhyVWR3YVMwSjRKT2FOdCtySXhBeVh6ZDRFVUlP?=
 =?utf-8?B?YzFkRmd4Qng5ckJQaTNwSHBmb2hSNGJUQ0MxRmE1K3VscEgrL1BES3dqdnAw?=
 =?utf-8?B?OGFIY0s5Vm9udkxsR2Jqb01RTVFWWDNIZUhIY2Z2Y3ZzTlp0MTBFSXh5dEU5?=
 =?utf-8?B?TmtkNFFNREM4b0txVFBacVdhOUxaM1djQ2l1YUNwMEU5dHlwd09lSlo0VzVL?=
 =?utf-8?B?N08yT3NHYVZpN09jdnlqdnVpd2hzRnZsYk54MzdhZmdBSHFaVmRWbXZ2WXJ0?=
 =?utf-8?B?UldydmpUSkVKRENLMnpiaW9XTkZnZ0drZitFTWwvQURKbGJrWElrVTJPYUM3?=
 =?utf-8?B?NFRyTFplUTVhclJTY2I4WDNicENHZUxtOE1oUVRLemUyS2ZjeXYvQlI0eHBo?=
 =?utf-8?B?RWFFMWhxM1pGamtJV3lvK0JuWWFmYmRhcGRTZFFqclZzVzZXZlNFeWVVSGxE?=
 =?utf-8?B?Z2ZLVDBRME5DbjRKdlByeUhxMTB0R2FKbjdNSzl5NUdHeHBVeFpqblhWcG1x?=
 =?utf-8?B?Y0NweC9tWDEzRGkvd2ZITHhWQ1FkWndvYnpacVVvemFjc3dEeHR3b1cvSjZw?=
 =?utf-8?B?VTdyaDIxUG9Nb21ENnViZFY2UWRiYnZnVGlQdGI5bm43RVhBZ0grMERWMW02?=
 =?utf-8?B?VktQblo3RkYxdGVxN3hnNEdBQ1lPZGk2SC80M2NJdG5odVZOK2lueFBCN0lM?=
 =?utf-8?B?OFhONEFCOHppdnNVZW1RdzF4am9WamprVFNRZC9xOElrM0UrYnlnTjVYZHYz?=
 =?utf-8?B?ZFo1dHlyOGV1VDJWWExZaGp4WTFrRmlLR1gvRE9ZTXpWNmtqZ0x5SVlSeHBq?=
 =?utf-8?B?bDRmNFdjZGx5Rko5TGIraUt4d2RQcG9BOEsvaXNrVUF3MlM4OEdDbW5VcTBU?=
 =?utf-8?B?T1RqRTlSeDA4N3R6cm13QkkvYUN4UXJzdkc3dkVhdHN5UUIxQkI4UmhOdDdH?=
 =?utf-8?B?VnJFYTJoRU0zTEJxSnJvb1plOFBvRFJVclR5R2FYU1NhVE1mdkpoRlJLeTUr?=
 =?utf-8?B?QTlHN1N1bDhJSXRtbElwVDZtOURLSURHWkFWd0lHRFVkWU1kOHUxL25FcURT?=
 =?utf-8?B?YUMyN2J0cmJlS1N2cExuM01oQ3JGZndGR01sTUhkNk5LSGNMeUN0TzdwT1Zo?=
 =?utf-8?B?SDFUL2hqbHh3Zlp6Ulc5RG9wQVIxTmVCRGNpbWZkbGZkaGMwaW95UWtjYWlV?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d655499a-2ab0-4951-0f2f-08de0ce5a153
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:55:52.8905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/qR5DTfXZn267MTWTAJpY5NaR/k5smESIfoV+fJy/qzqIG5HvCLGscMHBLOvJ176Ih3uw8isJtes8zHGQZhj7IcrsmLHzJaASWzps4O5rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
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



On 10/16/2025 7:49 PM, Gustavo Sousa wrote:
> We already have check_graphics_ip() and check_media_ip() as general
> functions to check the IP descriptors.  The check in
> check_platform_gt_count() is simple enough such that we can convert the
> function to a more general device check.  In an upcoming change, we will
> also add some checks for other members of struct xe_device_desc.
> 
> As such, rename check_platform_gt_count() to check_platform_desc().
> While at it, use inline (int) casting of max_gt_per_tile to keeps checks
> for each member localized.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci_test.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> index 37b344df2dc3..f09efb523b7e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> @@ -44,21 +44,20 @@ static void check_media_ip(struct kunit *test)
>  	KUNIT_ASSERT_EQ(test, mask, 0);
>  }
>  
> -static void check_platform_gt_count(struct kunit *test)
> +static void check_platform_desc(struct kunit *test)
>  {
>  	const struct pci_device_id *pci = test->param_value;
>  	const struct xe_device_desc *desc =
>  		(const struct xe_device_desc *)pci->driver_data;
> -	int max_gt = desc->max_gt_per_tile;
>  
> -	KUNIT_ASSERT_GT(test, max_gt, 0);
> -	KUNIT_ASSERT_LE(test, max_gt, XE_MAX_GT_PER_TILE);
> +	KUNIT_ASSERT_GT(test, (int)desc->max_gt_per_tile, 0);
> +	KUNIT_ASSERT_LE(test, (int)desc->max_gt_per_tile, XE_MAX_GT_PER_TILE);

nit: maybe cast to (unsigned int) or just to (u8) since this is base type for this bitfield in the struct ?
and maybe use KUNIT_EXPECT since there is no need to stop the test after finding first bad field ?

anyway, LGTM

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  }
>  
>  static struct kunit_case xe_pci_tests[] = {
>  	KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
>  	KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
> -	KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
> +	KUNIT_CASE_PARAM(check_platform_desc, xe_pci_id_gen_param),
>  	{}
>  };
>  
> 

