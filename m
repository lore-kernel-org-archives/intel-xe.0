Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D2CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 14:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A75A10E936;
	Wed, 10 Sep 2025 14:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C36qLxf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DB010E936
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757515082; x=1789051082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4Sg4XC8nKObptsjG2Ht2w3HfAkIEWmN5dmYoqiXFdMA=;
 b=C36qLxf3ULoESCfMac2gQEv2UX7W1VOiIpcsuXOxyjd+nromjBjwO1FJ
 uyAnDIQMRcNRLnPhjenRCc3Q3/B89/Xvh5omgt2xodkb1qwiR2eoXsKfa
 GkAvZhHEyFEVT6RiYgl7EfL912SsaPdhVdx7W5618R2XGb5jvdLhTrCRp
 RP4uIP/7yUjHgcDwxXVPns18QwqNkcsljupx1jiCfwsagFQwq1seLAMGY
 niUnkbAhCW4dBSrhgS4f5amayJ7C8YpNFC7RIthNZ2Mv0VdPwqogV05Ll
 lwqMxjjdCRYO7a/MJi96qTXN30W4xg+YEfdrdkSvYE9GnSG4yYFCJ11nK w==;
X-CSE-ConnectionGUID: 7D11E7iHT3yaoJTCw/4stw==
X-CSE-MsgGUID: 7YGcvrFgQmWjgOU+qjiLsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59777006"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59777006"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:38:01 -0700
X-CSE-ConnectionGUID: Zs0UxZKhRSObzPXBMcEldA==
X-CSE-MsgGUID: luHKTBpeSqqmlmsXl1menA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173327590"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:38:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:38:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 07:38:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:38:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKWSpD34qf2EXZlI9pAO/EAzrfHsSGdJX6lDgqBz1ca+fr+SAvAEKksyti2+w1rtWnqHyDxTejLFvEV95+R25OVsvOOfsblRB8jFQ3yNqMLI8Pk7LCVDai+W6cpFbl7JjWevPexd2HRvvRjqXjZHqasvUuIS4DU6hWygAv/AEg6H0e7YQDTs6fNSxYZhJnvoCxiCgEF0NJFZ6NsuL1gkrlZH/O0UN/ESX8cdOHvofnQtx2/rF6z1dqYpNy4GvPWj5fzV6XasuzyDtztRjxPJ0eQieaT24vmDY0PllNymj3Nk9QONbOYHWhwJ5w6iLGaJQZtOdeyIzB63dfM+V+SKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U16O84/yRzzFC0wUNConb/RHjzPCiCAFgeM167RdB9U=;
 b=hSG0l5k0t6EoO26VJPeVu5HIoYNRpMCiV0ScPkDvYXeNdQrsLb4VtIc/hvyGL1rNki716Hzk0yRWAiCyfJuNEIN+ySonRr9YXArfeoeiwutsKacza1VR5Ke/qnKnclxYw3yrHLj0SEP/FHBLF4PHtm6zjTmITHvvz0VFwLiiDSV0iMXP93tw7ZvIr5k0zvFLBIhqoggBEavAsYDAyrq3aNI//ZOTHRQi+Q4yvb0k09GRtLbwb9IaU+lczgypydpU60dZv0plbYGxLEu57uiCDLe+IwbJbE/IoCI2VlGIbRjrib6k0audU2P5mu/QJXkc2g1L9I+tNDJJfKiF7a3IDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:37:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:37:58 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 4/4] drm/xe/pf: Force use user VRAM for LMEM provisioning
Date: Wed, 10 Sep 2025 16:37:36 +0200
Message-ID: <20250910143736.792426-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910143736.792426-1-piotr.piorkowski@intel.com>
References: <20250910143736.792426-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ce6efa-7c78-417b-0efb-08ddf077a2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVpOV283blM0RjY4ek0xR3ZzWG9GSmN5UnV5aWx4eDZNZGxDdGwxNm92eTRK?=
 =?utf-8?B?TFlqSm80aDFUVzdmbEtsdXF2aHQyamRkbUtPMUJaWU41bjMyYkp1bXF1ay9p?=
 =?utf-8?B?emNoR29NcXB6dmxGSGs3Slo0Q1Fwd3BMV0QxYStraEx3MytlYm5UR3JTLzly?=
 =?utf-8?B?aVdtT2NaR25BK0tyU3FwaFhMZndpcko1Ni9IQURMaGtCUmsxVTVCWUhTQWxQ?=
 =?utf-8?B?MTc1ZnZjUktLbHVhOTVQaEo3cU40RHlMdmxRYzN3K1ovZTFCdFZxR0RUNDF6?=
 =?utf-8?B?U3V0TVh0ZnVkVzBhdEFKS09ueWh4bkUvbmdiY2tBZXdxZnROaGJnMi9neUo4?=
 =?utf-8?B?aVRmNjY4dXB1ZW1vRHBqTnEyWHQvRG1jSmlzV1VyZHRyTUt3K0UrN1dLeFM5?=
 =?utf-8?B?T1hqdExRSzc3NHFUUGdyMmhNYXgzcGR0RExOQ2ZFajVRTlU0UU9JOEt1bjUv?=
 =?utf-8?B?Qm1YRytjYXNaTmIxbGN4Yzd2MVBFQkd6YzRRV3hFa0hsNEdocHpQY3cvNUVZ?=
 =?utf-8?B?Rm1hZStrZ3hxNFJLQ1J6MmFBQkk3ZjNaQjNjMXFYZGdrWEprd3dlQ1ZVQkxN?=
 =?utf-8?B?aTJKNnc5M2pGUFFKY0piM0ZRNEFqcUh5d2gzaUhmcWlqQ1hzL2FTVGZYV25M?=
 =?utf-8?B?aTRuWngwQm5teEgyYy9SaEN0aDF1Ym1aRFBuU083Z1hpaU5JWktYTjcxN3p3?=
 =?utf-8?B?ZUVCTFhWdG9aM2NjRjBRY0RYQVNVQ3J2UTQrUVlqWSsralVKL1E4eVloZXFI?=
 =?utf-8?B?aEowRFRNV1l6L25Wbm50Q3dPU0ZsRURZN0JBdTVJRDI3dzZEbXJ0UVhRNWdq?=
 =?utf-8?B?cEN3dkJLZmVLMXBxdFdMbDloY2NBMHdFK1lXNzVLcWN4K1cvQU0vaElCdnVz?=
 =?utf-8?B?bVhCbmdtQTFUbmpHMDVuQlRTS0pmdTZQbmE1YTdUOFZGNENPeDNvVlo0eUMz?=
 =?utf-8?B?dFBnYldSRnMrUC85UHErMXMvZkNwdE9XVlgzN3Q5L25JbjVZR2t6WXp3dExU?=
 =?utf-8?B?OWJPVlplV243U1pOam1PT01IMWRMcGVxc1ZYakxjUkxjeW9ab1pFaE9zTzBK?=
 =?utf-8?B?VU9PNGRFZWVKQWhsZ2k1bHZraVF0VHJob1daaGtwZGFVMmFyT2FXZnhjSWFz?=
 =?utf-8?B?MWIrTjBnNGpWNnQ0UlRWVTA1Y1dLeGZlY1Nsc3ZNRGdBbG5rNVVGWUZtVHR0?=
 =?utf-8?B?QXAyakZ0WkdnNzN3OUlJNkZOSkg5cHNleFo1bnRkSVdraDFvd1BMSEZJSWpF?=
 =?utf-8?B?UXRLUzVuUy9SZ1lkbVl5Q1U2S09HZWh2Z05EMVlydUc0eEVCTzBnZ3BFb2Vq?=
 =?utf-8?B?NjBNL2VzVEk2dkFvN3VKd2VZMFVQeGJJZndBQlEwdHZKSFR6c0xsWnNDT3A5?=
 =?utf-8?B?dk5VQjdLeVFqbWhxbFJIVHBUbVBLSERmdFExb3hleVBUcW1ja2Z4V0ptL0M2?=
 =?utf-8?B?WXZ2NTIyMmZ4d1U1d21EQjlrZzlhRHV3NWpnQUxlS0d3TzBiYVBHdEFiZlEy?=
 =?utf-8?B?YVVqWmVnZ0loOWkxMWF3dnVHSXZJbjZYVXk5YW8vOVYvZk14aVI1VnBOTGhw?=
 =?utf-8?B?Q1M3NWFZUmloa0lNTE5SU1hTbXE1UjFHclgvT0lqakFiZWl1ck9PNWZXcFN4?=
 =?utf-8?B?WER5MFJLbXpkb0IzWmx0UzJ6NllOZ2NhaVRtb3JBT1o2TkNRSDhyc1NxTU9r?=
 =?utf-8?B?N2NKMkdWQUdDa2lSTE5JTmk0RHU2SktHNXRrMlo0enFyb0x2ek03ZjJNTm5L?=
 =?utf-8?B?QjV2dHV3cWVLWTV1bFhSaDJ6ZmJ3a2NORFNxQ1dYOXJNNzhWOXphaStqcVRr?=
 =?utf-8?B?SVJBbHFUaVY0VThGY3RZSldnQ1Mva3VaWW56ejV6dWZqTkMzRUltZzF5RE9x?=
 =?utf-8?B?aEl3ZVduUjRQN1JGYkJJeTl0MlJ1UERxV1l0OUVlVVVlR1QzdU5EQWVrUjNC?=
 =?utf-8?Q?/zvUJGyjVzQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm5hWW0xWU9VdU4yTEhPbndWOFRWWnJ3ZWVrYXhuYVYrNWh2UmFWanZHYlZx?=
 =?utf-8?B?UjJqNlp2K09ObmhJeEF1NWlKRncyclA4Wit1eXpPYnBHNEVULzQwTnYyRmRU?=
 =?utf-8?B?TGplazhlTnRlazFyNndEajR4YVB4SlAwZUZYVVc2VktVM2ZXMW5aN0lpRkpo?=
 =?utf-8?B?L1hUbEl1MEVpYlJPU0VBbHFEV0Y4M3RJVS8vQkFveksxWE5XVHFUZm5UTWhZ?=
 =?utf-8?B?cUhrelZPT2s3dVZ4WXhXeDBPQXZCU0RZRzFMRzVKM0tKNkxtMXdGc0JndkJh?=
 =?utf-8?B?bTlHODBwQlhMb0x3OTBRUzd6U3RBMTR3N1Z6d0FhQkRDakxCNDRLczI0Nkxo?=
 =?utf-8?B?VTRVdUpCYnVCeTVBY1lRUW1ZYnNSOFpCUW8ra1JlTGhKR0EwZU9hV3F6YjAy?=
 =?utf-8?B?L0hQdmtycjFCU003eDRjdzlRQit0d1RSN0szenFsZzBRTU1hUGRtL2tvYjNh?=
 =?utf-8?B?a0E0S2t4V1Fxdk1WRzA5cW8rYkY5MmJmRmtFWkxJZ2NYSU8xdFRoTnF3RHVK?=
 =?utf-8?B?eVpRYitaaHJ0SGorb0REZlJlRE5QQ3ZwTmVydy90a2xHc0hSbFZYL2Z5aWM3?=
 =?utf-8?B?OW5PR0JRVjhFZ000Q3k4MGxFWXJCN0ZYS1I2Z0kxQjBmc3dLRFlSM2JiN2hB?=
 =?utf-8?B?bmUyTEhvS3dlNDNubUYrN1ljYWRjajlWN0o3NG9LZVVZcU9Ra2Job1JERHla?=
 =?utf-8?B?NHZxK2tGME4rd2w0SlIxY3p5eGtuZi9BY056cnVkVUtnTUVDendnOVYyT01h?=
 =?utf-8?B?UHNuY25tb0syeVp1MXJnYkZIRXpsTlB4ekZqOENtNjRodDArRGYrWjhLRUJr?=
 =?utf-8?B?L3BSc2lneFdTWkszRmVBMjVjbFc2MFMvWTE5blZUcEdzM0pNd1hCZmRZTHBi?=
 =?utf-8?B?RUdMMnEwVUZVMFNOQjAyeGprQWx0eGFHNlZnQnFFa1prQUdxcm9EbitpYkJn?=
 =?utf-8?B?MmdOSldFcXBjd1NvZlJXN0ZRWFRIeGM0ZTQ4RkVNQk1NVmFFam9YZUR6dktP?=
 =?utf-8?B?VGVjQWVRWTFSU3daSWIzWEx5VVlRcTdZWlZzOGNxS05KajZ0cW5hWDZuVmN4?=
 =?utf-8?B?NzUzOC9SVVdyMzhaVkNJUDhnUHhtRUtMekxVQ0RQM2hYbEhoYTBPTEU0RVFr?=
 =?utf-8?B?Yy9MTUdHbjYvcmRHUjJZZ3k4RXFKR2xST3lONmc1ZlBqTDJVelRaNVJwVlVk?=
 =?utf-8?B?OTVJQlFvNTFFdFNhNTh2N0ltdUhKTWRiN1d2aGNVWWdXaGF4ZE9HdEJ0b2dr?=
 =?utf-8?B?MVJlUythd2NjRTlVMGM3dENralRTaDhod1pHYUxQV0hOM2ViR2VIM0h0MFVk?=
 =?utf-8?B?TjhRVmF2K0RiM0ViZEdIdDNEN29lbjJjeXh1M083VVZoVGo0Uk1tRk5KMm50?=
 =?utf-8?B?NGdkTUFyaGxiT0JqbWhWM1NDbXVIM1ltZWdHSGJITDR4VmpZMy8zWWVkSjJH?=
 =?utf-8?B?OWYzcExHVWxCVTdjcjI2V0xzM1pkU0R6Y3NCOThzQ2tFQzdQSTFQUWZreUVT?=
 =?utf-8?B?VnNDWTVRWUoza01nRzhzN0ozMWtOdlFORWt5bzBJYTdWSG1tbVlSc3FEK3FK?=
 =?utf-8?B?U1d3RkFac1R6OUpVTjZIYXV2cHRIWGFBaHNHZjZQMnVHUTZLZlRkN21uakdk?=
 =?utf-8?B?ZXZmWWV3RHVXNTdPb3RWTXRUWTVjL0ZDTzNnb09lejh3d2lDQ3Rnb3pORHEz?=
 =?utf-8?B?YTNGWHNMd2hZbG9uUVVvcXNyWENycVZtdGdQbUxGSUkySjZBR3NIL1Jad0ls?=
 =?utf-8?B?Vzh5MVN2RzQwRmtBYWh2SU5tWlU5V296YnovYnhzZUNTYlgrRWkxTjJHY1JF?=
 =?utf-8?B?NlVzdmsxUGVNZk1kdGR1Z0sxc2hVOEhza1FOTndsRUR4U3d3S2RBMmxnWTNy?=
 =?utf-8?B?ZEROdmZ6R28xazdVK3VNdjhxMnUyZTQrUklEVkZtd3ppMkllUitLVmRKTU1L?=
 =?utf-8?B?eFZKNjFvWCs2Y2c0b0JDclF1b1p0NUlONnpkV1pnQXJHOFlpWFJOVXQxK3F4?=
 =?utf-8?B?clhxTzNjeCtxYStOZHl5YjBlVE80OXR4ZXpNaFgwSUx0bks0Tkk2ejRIQXBy?=
 =?utf-8?B?YzFpcFJYaGVnQ3Y3MW1HN3V3UmFZUzhtRTk4QWFTZkkvYjRjTXBPOXVqdmtM?=
 =?utf-8?B?Ly9vRElkSjA4OTZqbEpBdGR6UytWM2szc1pjT1pWM2F1aEl5RXN3cjlKSWQz?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ce6efa-7c78-417b-0efb-08ddf077a2d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:37:58.1837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qXErzjSpKpjLX+rV9m6h/k0enrk/NqkGuQ2qFuyZo4SUHdcP47pnXU3FKgjZXYgRLc0mTWHUroCGh2Xl3dth0/asiih3HYCtYTIQFYAHCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The LMEM assigned to VFs should be allocated from the general-purpose
VRAM pool, not from the kernel-reserved region.
Let's force the use of general-purpose VRAM for BOs intended for VFs.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6a9a752fe24a..4e5132a77c41 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1484,7 +1484,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					 XE_BO_FLAG_NEEDS_2M |
 					 XE_BO_FLAG_PINNED |
-					 XE_BO_FLAG_PINNED_LATE_RESTORE);
+					 XE_BO_FLAG_PINNED_LATE_RESTORE |
+					 XE_BO_FLAG_FORCE_USER_VRAM);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-- 
2.34.1

