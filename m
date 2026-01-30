Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AF0D73EAA
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 00:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7D010E22E;
	Fri, 30 Jan 2026 00:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZ0efSF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586110E22E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 00:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769732424; x=1801268424;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wPAPMZl+sllZYBnoUgIdUtdL/jv4waJkorl3+7jA38E=;
 b=PZ0efSF9XlV3ugDJ/QoYomMp897qVMg3G2NZFblA1yOlLs6k4A5sLMq6
 VOAJ2u1VY9IMaU3fE9wL/xu2Y6qAG+179C5AfQJRruE5qyzGy0II3vDry
 LVmlO0R7rsoJIpcQk8l/3AwWsv0936N7GO5SbscL83lLqIMwAAovTiRVi
 fpYH6P7DeI8NUFj4hrXUqmfCxHCsQf5BPIjA9xS0F4zyyk8+gY1/+Pnd5
 W6bc5aBI80OE6dLp3EfhRGYBas3zSq/gFBKUFOZUzwiXLcxrj+KbyKf6u
 CdyiPaWNK0/yAG7flpjBtMA/7gck8X0IQmf/dAC/B/CczSouP5AGzDE8s Q==;
X-CSE-ConnectionGUID: HAyK4/EYRzmrkOs5OmxDTA==
X-CSE-MsgGUID: sUEEAwWJR9GO1kQ7EEeoLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82094573"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82094573"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:20:23 -0800
X-CSE-ConnectionGUID: rPzYJHXsQomkj8I/KUA3FA==
X-CSE-MsgGUID: 76m6gBQCSf2ATr9wCph/XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208630391"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:20:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:20:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 16:20:22 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:20:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNev8fRDosMqxpKLU7Sr40Lm2TdzU5rxwmgwhaxs2uqqliE9yzmZCv6n4/JUlWrS2hDB2S83huCd1G5XAbN0wtSyeUHQ2RCzB+/IkpQ32k1QiLM1EZJuxAPzNJ0SGy7BDH5FN3JeaRCy1XwJl3wGFrGlM4jf7PTgKUO931xu5lLFvzu2yQngMUOJzDRRi8IwKWr4ddkr9sFHl/rZgPej2U/KSxUjqGOFHZVMG+dx1H3lsaU5lCyg6eQqin4iCX+w02+tA5DGI+S3CiPobl22b843GiHjENs8uUzIksgAzDqdSMWipwxmOyx2qHminl0FwCi/XKDRicidTBqt0vJojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnH288WYU9MuujXwaInc1Jl5p66VElE49xiYm2WypC8=;
 b=cmhbh7Frnl+EggxT2okPqHPXoSXvBYpZaQw35RXjvNTU9ItM6zgE5Z3G2qWQolkknIfFZm7IBH5T71zWZU4XWubKN7SRrpUpQPao+Xl/V0Uqbk/0eMFsZWDSG/VUzFrq4fg9jFpkvkoyHNtc7/tTn+SDgv4r/EPHrxZBtXU8jZmDwDV545xr0ySNhpddzJuRhWdiCKSCRxfLj/ozXZ6KhSC1Z6LAuR5mOEa4yH4v5U0syDRBb2jbLh7sVMfueK1+iqrkcB2KNgL8nWdHQigueGzXspq7mlop7qlMZKLuqWxi2cJrfKnVZ9ixdDWkFX4O7r8/XTO6Xz5Bo+LpQxLozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 00:20:20 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 00:20:20 +0000
Message-ID: <c5f5731f-5337-4c97-82ab-8392e9338b1c@intel.com>
Date: Fri, 30 Jan 2026 01:20:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] drm/xe: Remove xe_ggtt_node_allocated
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
References: <20260128165724.12587-1-dev@lankhorst.se>
 <20260128165724.12587-6-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260128165724.12587-6-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4444de-7855-4299-9618-08de5f955a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU84eVFSNXB6RUhPTzkvV3pPVXE2WmxuL2Nuam9ZTlgrRlA3U1czYkc4Q0hR?=
 =?utf-8?B?ZlZROCswWkF5MC9FbHVsVnJtUFh6SVpkb2crQy9RN0tRaTU5dExNMFZRMUhQ?=
 =?utf-8?B?UDkxb0ErTkc5Um9kNjlXRmIvQzRrTEhrSUNMdjY1aXpsbjIwbjlrVGNqbFJS?=
 =?utf-8?B?bzh5ejlvdS94SmdTV3Vxb2VRN2syVkJYcFdWbzVkTS9SbGptZXBxbVZCQlNm?=
 =?utf-8?B?eHcwTDRPUU5wTmcyZnFIWW5tS2orMWc1Uk1xZlBLbGMvZU5vVm1HUGRVai9F?=
 =?utf-8?B?Q1N5L1VmV2IydGJXb1JSR1FFYUVWNHUwamVHWGFxK1BYbzhJR0hVUVY1d2VO?=
 =?utf-8?B?a3ZLZ0NKV1Fib1pVMk5aVldQWUZBMVY3bmNFV1kyMkpuWCt0aU92NkpLOGVs?=
 =?utf-8?B?OFB0a0NOTEE5WWpkZ3FEWHhIb0o5MGxmUDBXVEVwWUlSTzBWZXBrM1J2MFhv?=
 =?utf-8?B?TkFDd3hpOWhobUQvcnBGVlhqVU1vRitwdTVYQjN5L3hQSjR5ZXBmLzMwNm1v?=
 =?utf-8?B?aE5ZZDhSWW51a2lsTEhtRnFyVXY2SEtXMDdZdTVHTTYxZndEenBRaXo5Y01s?=
 =?utf-8?B?MXpCUC8rWkplOGRtRmNxd0xWZUU0U2FuRVRFdGZGbTNNWmRMTWFxMEpiTFM0?=
 =?utf-8?B?ZGRpK0FNNUNQdFBsNzJvaHpuK0NjVnJtNDF1Y3hYRndLVXlEbzVvRCttOTc4?=
 =?utf-8?B?OTBmUkJNWEdCZjNxSnN0K0ZYUVlqMzRNUThLMEFDYml3elp3SXpQbmN4Q2Nv?=
 =?utf-8?B?SWtJODRUKzZaVnVqaUFqUEpJN0ExMng3NnVSSkx0MnNraUJxMmliRVdmMTRM?=
 =?utf-8?B?TktYUUFMU1UrNi9jUkZZMjdoUzBFWjRUYlZvbGxIOVpFc3pxaFlsbWx1VlA4?=
 =?utf-8?B?K3lEdVdGT3JYeVh5ZDB0TE5iMlFmMjVZY2dTRlhjUjYrakUrOTF2YitLbFJK?=
 =?utf-8?B?bmV3MTcyZStJcW4yeHQvL0RBQVpwb2RXdXIwMGZqY2c3Zjlhbm5IZURoOVpE?=
 =?utf-8?B?SDBnMTNWYVJIZlE0VjJMS3lhRld1Z3FCYzFKMHFvMEVQY29uSklrSE5tQllH?=
 =?utf-8?B?RFk5WEhuRC9wVWhzam4xN1FKRDlHRmlTZ3VkZlhsQUM0VEoxUkVCWlcvWHNp?=
 =?utf-8?B?TGVYY3RkakpDNGk5dGppVE5pTGM5UHN1d2kzNTlMdzB5aHVOeXpCbGZMTUxU?=
 =?utf-8?B?UnFBM1RERmVUdlFVaUNyOUZoMFZPS0tkMk85NFlURlR3OXZKNGlBSGpJYlhs?=
 =?utf-8?B?eXp6T2NZb1FkdWF4Z25tZzg3em03dnJIQVBUeVRRYThMSnpPSFdhVkxvTVZL?=
 =?utf-8?B?bFRnaDhIcGVucWFjT05GKzB4OUR5Z0tnQWY3MTdzVVV1cmtpU0RnUXJ1YmdF?=
 =?utf-8?B?RTZYRytJOUhvMUFyTlV2QlFxaStHVTg1eTVHeGhyMjlXdkR6WVpVT2tsSVBK?=
 =?utf-8?B?NUdYYmZJUlFISnh0NUd2VnEwdkdEbGJjN0VEanFwQ2FodnB6cjFoMTJML0pO?=
 =?utf-8?B?QmxOQWJTMnUwRFpQd1UwMjZnQW1zL0NjZGFnM2JneGJpZTYvZXU0UEtqYmVT?=
 =?utf-8?B?R0Fsb1g3WHM0QUdSS0tab25KYzNraHM5Z2Q2WFhCVE5KUDdqTkhwMjJCY1Yz?=
 =?utf-8?B?SnhyWjBWRGdPSy9QengrRnVJOEcvcW13ZGZDQnhsSitySnYyckVvbTVxODN6?=
 =?utf-8?B?MnNSZDNQQkR0L0dOQXlEb0RLU25KUEVxV3c5ODN0Q3NZY3ZrTmtNUlBFcW5z?=
 =?utf-8?B?ZDNyZjY5U1JqR2o1M1JPU1pDemY3NTh2RDh4UXhrdXJmWDZVWHM2anRDN1RG?=
 =?utf-8?B?cmFBOVUvSTVyMk0vMzNFVGJFeTJrSWFSbjJSSWFqd3p3eFdoWHU5UHZLMUxL?=
 =?utf-8?B?QU1DMXJ0QWwzaXQ4ZnlHbEJnV2hvN1RnNHBqZ3RKdHZHc1g2b2pMZHJPYndn?=
 =?utf-8?B?dnhSU0Q5VWZ3K203YUxYcUd3dzdHZFlOU2x1OXRJYVViNitEZStudkRFUXBa?=
 =?utf-8?B?NWpaQjlIUnpHZGRPK3JwWUdNY1ppVVJReUhVNit4Z2R0VmIweVh6eVUyOUpP?=
 =?utf-8?B?YW9MeFQ4OXVaTTd6WjRpdm1sMERVcGdPS0JWbDA3Q2YxK2lJVjVib2k3SDR3?=
 =?utf-8?Q?guQM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGFCSnl1MU10WnlodDY1NUFrb0xPSjNvNENEUVJCR2ozUkNnUnVQcEZNVzk2?=
 =?utf-8?B?UzZGYUdYZUl1cEhQK0hHaXd4ZHFFVHRqbGM2QWE3ZzMrQ3JRUk5SN2xMblJx?=
 =?utf-8?B?SjVHckU3NitzQlBrbXFoREJRTnJSL3BNOXFrcDZzalVHM085OGZGR3ByVEc4?=
 =?utf-8?B?Vnh0Znh5cU9Ed3RhQVowekxjeTluNEFCT0lIRmthODR3VzhFZCtLVWl5MGwz?=
 =?utf-8?B?QTd1cmE1MlRMN09zaWtKT1VRNlZKRFJFV3liWXZvd2tXVFFuQmVCOGd3VDdB?=
 =?utf-8?B?STlJOW12aTZIMGdjZXVqRDNmUGNybTNJRWtGSWp4ZkcramFyYzNnQ1N6WkdO?=
 =?utf-8?B?Y3BwbndEU1B5NGFlWTg1cFQwZDdzcDRoWTFGMkN3KzRldWlQeGdJL1lzcExE?=
 =?utf-8?B?WFpFcVNMY1gwelNmYVRBUENMVC9rRHVhMm56bXFOV1dqci9jTGg2RkswMjF5?=
 =?utf-8?B?c0UxUGtxU0x6MXRYd0E3TEVHNkRKQmZaeU1ZZHNaMzRTM0p1ZjhmTUxoM01H?=
 =?utf-8?B?VkV1cG9KUitMZ3FRRzZQVXg2VTZwRmgzMk82U3UwTHM3MlA5SXVSK1JjdDNv?=
 =?utf-8?B?MFhmNU4wUkdpZ09Kd3ZCMkRNNE9laCt2QWtkd28va0I2VDJ1cGFteWpENEc4?=
 =?utf-8?B?RjZFbldDZ2tWb25aOHNLcFhZb0VadHpjeDRDR1FHSEFxQnJzWE9KS2d6cTVH?=
 =?utf-8?B?emt1Tmxlalh4KzlzYkpyMzNrbFMwZW90OFN5cXV6ZURQTGkrN0tobHI0U3Qw?=
 =?utf-8?B?RzdPTkJBaTdZU3J0ZUNYT1pDOUxicWN0SExlZDBwQVkrMFBFQzdNRGV3ZmIv?=
 =?utf-8?B?clNjY3lOcHpJZ0x2UlJKYkgyMHp2cGhiYzdmNm85TEZUczY0L0Nld0RTNy9T?=
 =?utf-8?B?WG51bzE3ZlNZMmFSb2hjUVZGMGp3ZDg2ZWlySk5OemFBY2JmbXNOWk5sRXU4?=
 =?utf-8?B?N2VGcEJWdk5oUjVPMGt4SkI1ZW80NFF3alBLZnIxYXlEOEc5NDFGbXlxdGYx?=
 =?utf-8?B?RkR0d1JueXEyTEdXeVpmL0hDeGFMRmc4ZHU5eHZTWXJxaXdTdXdXbUhEd2hU?=
 =?utf-8?B?OFF1T3kyN0hWYzM1ZXVLdmR1emdncVJUb0Zpc0lOaXpMMkdiOUFrZjdoS212?=
 =?utf-8?B?NmZzYVdVUUZSSTh3RlZGK1cvbkUvdlpPR3hPOGwyNmFSMDAvREVLTHc0VXpU?=
 =?utf-8?B?ZFpGZ281L3BUcFBsNnJVSm1zOVZ4MXBFS0x2ZGpBWVk5cEdGZzRuV1pSQ2Ix?=
 =?utf-8?B?RjVuU3ZkMGpmMXdMaGVlS1ZQNG5XRndhcWVxWDdzRzViWThyWFllVlRBV1R1?=
 =?utf-8?B?cmhYWUh1emhTYVNodDYwc0tJenNVTWRxRWN0aENRV1FIOGRYT2VPQ1NLR3p1?=
 =?utf-8?B?WHIybXVFQmJ4Q2pWMnp2M0I2c2VZeFBzMm9uVVp0ZWtUNVRpekh2Wk5UR0Yx?=
 =?utf-8?B?Zzc3eWZ6VDZxN2FuS3VaUnNQUnk0ZXQ1NTNuRGpVZFJxRlVuVUFyblFnNEhy?=
 =?utf-8?B?bUtaZE1OeDdZR3ZoRkVNaGV6UktBOWp6dk0xaktpVFAyaGZoT3htQ3E4U1ZM?=
 =?utf-8?B?aG5NdHpxbjNpdzBBKzNrU2lwZG5UTCt4T3pENmtqaGRLZU5vUko5YWVLay9Y?=
 =?utf-8?B?K0ZLVzkzNzd2L1g1MS9naERXbzRLSlVGVlc5QUhWR3hZbEUzWG9vREFqRG5H?=
 =?utf-8?B?YkRoWGJKQWNQYThQZy90bGllWEY1Ulp4T2ZKb2FIY25ZcnEraVJDVmRHbzIz?=
 =?utf-8?B?NnhTWVNXUCsrOGg4a0kxNDRHMG9mV1lCa0JTRzRtTWluN0VjV2RhbGVhNWlK?=
 =?utf-8?B?UWF2dlI0eGMyYk9IWUtQemFGemtqa0psZGdqMXBaMGNJVzNEa2RHaFZzYnBZ?=
 =?utf-8?B?N2pQNEZYYmlTc1FOcW92ZzhwRGRZeHNkVDEzR0dzSXA4RFdXc1cvZHJ0NkJO?=
 =?utf-8?B?ZW5uaG9KZDM3cVZsYjdTdndvUERyM2FQYVI1SDZaVzZtKzFCd0g3VVNmRHg0?=
 =?utf-8?B?ZTJBSHQ4KzY2WDBtZmlvelNUNmRLVW41MzZ2WFo2NkFmY0ZCNVJjcWZxRVBW?=
 =?utf-8?B?VkpGWENPV3RPazFKQ2REZ1M0a1BZRGFtUGRzZGJZTTBQcVVZWUVPY1crZGc1?=
 =?utf-8?B?SGlReUx1L1k1K2oxTFRDVm1rZ2NwOVZreVd6Rk5hR25aMmk1M0hqNVpGMmFO?=
 =?utf-8?B?T0tpLzQzRXE2dERMZjNnVE1aMndmYWxhU0gvalc2TEpLVzRjT2RFMlc1UWds?=
 =?utf-8?B?RStXVXF4WGt3RXA3c1duWlkrSUNBemdnTk1RSXNEMFUrRDFmWHc5VURKYUp4?=
 =?utf-8?B?YmcrNmk0L2RER2MySGtUdm40Q1BqL2c0eGhKSUpUMVZ6TkdPM0x6akt3SzYr?=
 =?utf-8?Q?kUXcW8mSW+ICNbOo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4444de-7855-4299-9618-08de5f955a4d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:20:20.5369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rvis+98+y8m2GKMohp5ixc3c/NDj4dT5Xg2dbMueniK1rHIHVf+zYDEoPIpQhauYtG8RGUcoQcNDgmG2kjaj9/n9jNH4/ir8rWGDbUX+ryI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
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



On 1/28/2026 5:57 PM, Maarten Lankhorst wrote:
> With the intermediate state gone, no longer useful. Just check against
> NULL where needed.
> 
> After looking carefully, the check for allocated in xe_fb_pin.c is
> unneeded. vma->node is never NULL. The check is specifically only
> to check if vma->node == the bo's root tile ggtt_obj.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
> Changelog:
> - Update commit message to explain the change in xe_fb_pin.c
> ---
