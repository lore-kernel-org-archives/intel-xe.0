Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD6BCA1007
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 05:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5AA10E873;
	Wed,  3 Sep 2025 05:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nx1lJFr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E95710E873
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 05:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756878004; x=1788414004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/3ADEaPa+jM+yWWb6jAxDohDavzItUBraiRPMGKXt28=;
 b=nx1lJFr3mF7rm8a/VC1COlbDM9BbSVNYJ1K5BChFDQKg/WXQzZa7DLsc
 3oXOsHPXkDhLrr1B5zGZegVeFY8BhxmAl7fpEbMO6X8K0tceHuZ0f2ZRR
 8ufONTg/dqDGa1OrKXZJ+O3o67+imeXTX8iEmGhIITXsthOSq3/5iSUoG
 IrIPpAm9dsQRzuQVhD52uSyLKsJR/p+tXz0M5umHC5QF8bqz66i4YZUvx
 ptRDVIgIGyYJAUO8DIGbVDCdvXZxkCLjlFECOARRyys2eU/yDqoehCtHI
 wVjqGkHxwnwO8TaoYj7eILDdW4ijLIjAMHLFiePB9Bw/+XEVsjZtbmX6v A==;
X-CSE-ConnectionGUID: e9m9J9bMQCWVnk3EcFGkhQ==
X-CSE-MsgGUID: F1eI6AX2S8Kf/tocZlJqqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58395072"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58395072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:40:04 -0700
X-CSE-ConnectionGUID: dPpmTuDnRJKu1XI4BxV1gg==
X-CSE-MsgGUID: 8AzSmoPUSQmnL/ThGCB5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171039776"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:40:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 22:40:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 22:40:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 22:40:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRRVHWMfLbz+RBvktoQYWZOT+q8ogot4+5A2FhlZw6zH9hP2PbJ8GsUhtcz61ZPLkhU9CCtfVwQU0YwiY17Zvmadladyh1aCFDbMwseolaaQpsevAIXPL96UM3dVHNl/LLJsWk9jFCp1j8LbRVdR73Wl4ABjfuNlbgd0I/2bMdTca2UBupHY5w7+VZSS1nbXxc3NqfGNcOFa4DHcloEopRYgsjwj0eHRg5ktfThnTa6jr3nBMxIcOHUuAiZZPlg1YgHF0BzeI7edTYf4FWExmoM59BOlobQy2E7B/oUjCQXZaFhK+gNVt8mOnYlf0p7Z6GlSn1HYYcuRUdkaase86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcFyw20ajBJwtqFvviwYi839BEHoH83urXfZoYgjjS4=;
 b=TObDYzM2/GOnBt4/nOK/9Srfnc9MzwexUsF/GXzeNfbQkso0duM5pzDG4FEwbpF2A/F0zL74XZ41GxtNIdWmPOFK7pIQVcd81Mb79jceforINbMTJqtb7MPgpN0ThGfZ5IzSN5W0VCy/RGrxBZLfyNJrTrlGV4vWVLE6tPk80wOOtd4DSSAqKQf53YeAHDUYdNrlz6J2aorn4uyoubcm8ppApGxsBRnfLceCsAHV2+/v1m6DLJWspQyo4hLUfmhQaO92+Z4mXvKz2KcNj17o9Ydd4wOaAuHRzWnF68I8KWpNnLu6/Qhi3OeQpVFbEtbxml3IO9Xqq5ogEkwuRVnSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 05:40:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 05:40:00 +0000
Message-ID: <12059b2e-e91b-4db6-9602-ac2b09b460b9@intel.com>
Date: Wed, 3 Sep 2025 11:09:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
To: Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-2-michal.wajdeczko@intel.com>
 <qeq32k6xksjwzg7saglvxlodqxkr75mofjnmfv2bx2dzanciol@2c7ouidjtxly>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <qeq32k6xksjwzg7saglvxlodqxkr75mofjnmfv2bx2dzanciol@2c7ouidjtxly>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 4685b7b5-0cc8-43f6-0ebe-08ddeaac5276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnJnd2hjdUhkVHBhK0ErZDE2L0VFQVlpLysvMkdyUW1ULzNWV1RhOUhiNzJ1?=
 =?utf-8?B?TEp2QTNRbDNKYVc1VDJQT0lHay9xK2YreXBFRGJTSjZscFRxek1kQk1WdE4v?=
 =?utf-8?B?NENiRk5wMC9NZkRNZFpPYU5XSWcyRWtQdmppa0J0M2xLYVo5NU0wU210RFRV?=
 =?utf-8?B?Y3hnUmxNbHl3WVFucmEwTUhpS25WcXpJR29hei9NbitvM1hObDZRS3Jkc3lZ?=
 =?utf-8?B?N0pNd1BjTCtDYi9ma0ZUL0ZkSnMxbzNkUjh1UWN4RFE3dEtQRFp1b0sxUjl0?=
 =?utf-8?B?OHd1czNEay90aTFYQ05KajdEWk0wUy9pRGpwZFNFdnJoQ2RGM2s5VENJTlBD?=
 =?utf-8?B?QTcxZGpqU0FoZk4vZk9BL1R5L3pBQmN3TDVxQTFwMCtOdi9QRjArS0NkVXc2?=
 =?utf-8?B?UlY2a1FXRCtaMGthR0RZd2NwU0U4a05WVTl2Qk9nWC82VmEyZW1qY2xlZWFK?=
 =?utf-8?B?ZytzbmloMC9BVnpnMmFuZXNxSlFHRmN0NmRLUFg5dGVFcEpXcUZveXk2b1hl?=
 =?utf-8?B?OEIybFRiY3NxRzZ3WHBHKzZPcmZYVWtRK2N3Tkp3S3RKdDVvSVlBTGZmS012?=
 =?utf-8?B?NkhDUVFEUFNCdEFZL2I0OG15RUJpR2FFK1EvamRmZjE0cUhveEtqbm9OWXFY?=
 =?utf-8?B?aXBZVHo1MFZudkZYUFQ5Q1QwaUlQUGNxRFBEbDE4Zi9tUHJDSHVibURabVdl?=
 =?utf-8?B?aW5RZ3Z0UWJMQmYyMkVjVzZGYnovVGNsbjlmblF1K2pBM2tkQTlrWjg2SVFa?=
 =?utf-8?B?OVdZeVM2Y0oyTDFVaGJ5S0grMlR2aXg5RUtBRlJPYjYyaWVuZXI4WnlIQkd3?=
 =?utf-8?B?MCtnU29XZ3lpb0l5TW5zaEszRVM1dExESnpLRHoyQW1obmNmeXBYdy9VUUhp?=
 =?utf-8?B?ODJMSWxDT0dyRXNEYkp3Ui9mVlJybXp0cExraS9XV3NacTREbUZQc0xPWktN?=
 =?utf-8?B?SDhKN2RpQWJmbHVRKzUrY0EzTzkzZi9uc2ZKenBTZzZGVG8yYk5tMzJiV2l3?=
 =?utf-8?B?emx4Z3llclNXWWRMVk02MGdFVUpqOElrRi9XekM0ZU5KQlg3OGFyQ09UYkYr?=
 =?utf-8?B?QzQzNVV4TGN4SXVvRjJ5Sm5mbVFWeDJWVW1QWHF1M3QwM2FTMmtVTmxNK0JS?=
 =?utf-8?B?bDE5TzZvVHJkSmlHN3BlUHU4czdxSEY4ZmZ4MnFZOVRiVVdBekIxb2s2bHpt?=
 =?utf-8?B?cFVla0NBTTZHVnBtVEYrUGYzNWRVRGc2bDc2QmtaWXpDNzV2OHUvckE1MEtn?=
 =?utf-8?B?dTJ5bytDZ0Y3WSt5bGh3aW94ZnF6RGsxVkhvLzRvRFdudG4rZlovSHNSRHRT?=
 =?utf-8?B?WnpkdnpiZFZoT1h5K3dsT3hQaE10YVE4WUNyWitGMlZ1L3dzdnRrTk8yUG9k?=
 =?utf-8?B?WkJ5b1Ava3RpeEovaTQ3TWdzcTMvV3B2K2FlSjdscVRWemdIVWIyV1VqYUdt?=
 =?utf-8?B?NHdTcGNFbERHM1hhRG8rT1Zyczd2QTFaUVg5SEIyeU1BeDl1UVZFNDc1Tnpm?=
 =?utf-8?B?a1JXM0c0Z2o5ZU1jUUc3cTliSHR6OG9GbUpLR2s0T3g5aGZqNzZqdDVCRFBn?=
 =?utf-8?B?dytwQ0dDODRNYlM5Z3pXY0J4ODlBNEpMRkVSeVE4YlkyL2ozeE9wV2J6blIr?=
 =?utf-8?B?MHhqRVJpMW52RFZCRUNJMDBKOGxCdkpUSXlmVWh6MEllYnRNTDJBdlMvMFB1?=
 =?utf-8?B?UGxydHljcWI2bWZrRE9COEU2VEZSc1Y4OUxPajA2RG9Yb2pMeTU3akpNRzYv?=
 =?utf-8?B?Z3RKd21Fa3ZmalY4Q01ENEI1QUpDbitLM3pHTWxpQ3NUK3dpMUpGYWpCeUZm?=
 =?utf-8?B?UGR5SS9tRGpubGlRTkdZV2lCeUxLS1JhMjhnUFdiUTVqOW5uUUFROHk5dUJE?=
 =?utf-8?B?a3VJUEcrR0FRQ2JUT1ZFalV1eXE0VkxSRVZ6b3l3WFlXM3YzaDJSNjlOTFpj?=
 =?utf-8?Q?8+HCn+++R2c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXNIdWNBYWhtOWFMVE85UnQ2cjUvNjJVWW5nRVJIcU91bVRRcFVpMUJGZGJB?=
 =?utf-8?B?NGpjalRUbUUydEkza1RtUU5YM2Z1dDJhMUNrd1RXNmdJZjdGY3NmNGxhNXM4?=
 =?utf-8?B?bSttVnc1YVdpZ2JEYnJFd0tOcDQzV0tvOGFSc3ZHTlpmTXMxQ0tHKzdtY1FD?=
 =?utf-8?B?RUliVG5jcGRlVEJpYkZockpFTFZkWjYyNmwyV1BjUGRnK2k3Snl3TitaRmw1?=
 =?utf-8?B?K21ndGpqTDBCRisyWStldVNGUlZ6WHREVXhrRERXdS9SM1lKS2lFUXF5bEIw?=
 =?utf-8?B?MmtRZnlWVmliaU1kMXZXOTdMRXZ4S0wydjN1K2FRRVh3WE9ZMTJ0RGdOZFJS?=
 =?utf-8?B?NklLbllmR21RZkZiZi90U09GNFdiSVNObEtBSjBEaUZlNWlPdnh1KzJSSnpa?=
 =?utf-8?B?dXdXWXdEeHN6T3k3ZUZTRUZFdi8wTHRZZzhDRWVxVkpHa08zMVRDZXdPWm1u?=
 =?utf-8?B?VXRtdU1kQzhsQkxFNlVVdWhwVnkxOVBONE9JaEdZQTFTcW9iS1lpaUlEdHRa?=
 =?utf-8?B?NFNucTBmM0gwTWpPMml4ZHg1Y0lENnY3enEvSys1b0diWk1vYTJWUTYzNHpQ?=
 =?utf-8?B?SXF1WjZkVTdGeGJlL0lHQ2Z1ZEdKVE4yS2hvekRaUnFCTVNFOFNKVDdWVHpu?=
 =?utf-8?B?UUJlQ1hYZjJqd1czV2NyTVBHajNtOWlIam1PTGprYTMvU1lpZ0Q3YUI2YTNj?=
 =?utf-8?B?bENJbkt1VldBQmErV3RWbnNBWnRMcUFKa0ljTnlDWms1TmlPWWdnaTNSWTdV?=
 =?utf-8?B?QWNSWGNKYzc0VDRuWFl1UUJHM3FheGpvMG9lTmdxeDBlOTFRTnFSc2RFUDI5?=
 =?utf-8?B?RkN2aTZLaFk5ZFBQdG9ncTdENGNpMmpQMHFRd1k1SGJ2WVozZ3JzdXliNzl3?=
 =?utf-8?B?Z2JlTUhGY2pXNnNSbmUzN0kzTXN0dVF4OHRSOXIwTWJrVGRVcjRRZThFd3oz?=
 =?utf-8?B?cVczK0NkdjY1QSs0d0VGQkQ5M3MvZ2pDZGJYMjkrd2o4NTNrcjQyM2N6NHdi?=
 =?utf-8?B?T0h3QldPS2Q3eVhxcjU3YXRuSkd3RFByay83WGgwRlJPdFd0Z203T0pVbHVH?=
 =?utf-8?B?NG9tTWRDY1JtMjY5dHl6TVhuZ1NqaUVBdXByV000TWFOS1pvYWR1bUIwWVRy?=
 =?utf-8?B?UC9EbS8zNUs2TmduY0lCdFhDTGRjbTUxeGN5TDVsT2xOaExQZnJyQ0NzeldX?=
 =?utf-8?B?TjNmclpIbWpyM2Z3U2x0Tm5NM21ONnhxcXZSVVRaanJORFdzNXdlOXpTaThm?=
 =?utf-8?B?YUdrS1RPRlA4VmJsL1k5NGVRY3hDTnF0TmRqNTlCM1FlQ0dxQzZRbmRaSE9K?=
 =?utf-8?B?Vk53TzhUTGE0UTRQdTJqRUIraDBJMHJLdmY1SUhKQTJPZlF4UjZzZEY0cTJp?=
 =?utf-8?B?a3ROWGZFdVROL2Q2TGE3Ti9RR1dTRjZLeTd0allmZU1RQ0ZYZStoQjRJdXlm?=
 =?utf-8?B?azY0Z2RRRUNyVE52Yy96WENjblFqNHRSVWhUSGx6YS9BK05GTlRrL1pBNDl5?=
 =?utf-8?B?QkZZa1pTQUlHMHlCaTZJbWUvZW1wUkpPK2k3THBycjRTMmNSR2l6YXRPWW5B?=
 =?utf-8?B?OWR3SklwSG9lVi84aGpVbEladnRoYlBWWkpmdDJkVDZsdUZrQmJGK3dsRlJR?=
 =?utf-8?B?Q3FXdllmQnVKNkFDNU5zWEY5bThrTm13Y3pPRkMrZTdPblAzTGhyUzEyZ1Ry?=
 =?utf-8?B?b0VLMTZTQW1OQzN1RjNtUmhLYldFYjRCdkN2YnJSVVNDOGxueSs5NWZpcnl1?=
 =?utf-8?B?UkptTVVZVmdPK0l1YThIUUtsUFJCWFFNSmU5OVFXNlJpYkdVOHRLU21ucVVi?=
 =?utf-8?B?UmFOU0pGdC9ReVpnRGxhNDgzdEZ1MFpyQ1g1Zjk5NHNzaTEvekNHaFVzaGk4?=
 =?utf-8?B?TXVFK29vUWs3VWhwb1RwY21GVVVlV0NqdGV1TE15QXZyb1k5WEg2d0JoK0NJ?=
 =?utf-8?B?Zk90UHVkK3ZKc1lhdW8vWEVlMGZpNG8zQkQ1RElLVTlrMG1hNHBoVXRHNTRp?=
 =?utf-8?B?c3BhUmFTQ2VSU1E2UmVjaUdBanJOOTA2SmhqbDVXT1RaN29nbFNhbkdWVTZl?=
 =?utf-8?B?NWVWcysyb0lKTEJoRVpXVklqUWIxelIvMStJMnJJeFVQNk1adEhPS09pSWdJ?=
 =?utf-8?Q?kpVmUPiZzonnQIc9/9W+9PfnX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4685b7b5-0cc8-43f6-0ebe-08ddeaac5276
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 05:39:59.9071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFUGAoMGIEnuLS4vGg5lalDKi2xzOVRM1dvA6QsBBTS7jD27voIoAfFBfO8fr+PBNDCYN3l+QHXFT6OWqyGlZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
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



On 9/2/2025 11:34 PM, Lucas De Marchi wrote:
> On Tue, Sep 02, 2025 at 03:17:42PM +0200, Michal Wajdeczko wrote:
>> This is a user controlled configfs attribute, we should not
>> modify that outside the configfs attr.store() implementation.
> 
> agreed... this was the first user of configfs and I don't think it was
> the right to do it. However for such a change we should propagate it to
> stable too. Riana, any possible issue in userspace? With this change
> userspace should do a rmdir() before proceeding so it drops the
> configuration.

Survivability mode is enabled in early probe and is used for firmware 
flashing by admin. If this is not cleared while exiting the mode the 
driver keeps entering survivability mode on every unbind/bind till admin 
clears the mode in configfs.

rmdir is general and can affect other entries. For survivability mode,
it's better to retain this clear.

Thanks
Riana
> 
> Lucas De Marchi
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
>> 1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/ 
>> drm/xe/xe_survivability_mode.c
>> index 53c5af4b810c..79426ea46861 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -180,7 +180,6 @@ static void xe_survivability_mode_fini(void *arg)
>>     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>     struct device *dev = &pdev->dev;
>>
>> -    xe_configfs_clear_survivability_mode(pdev);
>>     sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>> }
>>
>> -- 
>> 2.47.1
>>

