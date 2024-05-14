Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0F1C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 08:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D07810E415;
	Tue, 14 May 2024 08:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcpQ7N6b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC9F10E415
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715674864; x=1747210864;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XX9Kgk+IsY2nNPr1xq/WsR7yfXCGjfJWY9joO3d6DPM=;
 b=AcpQ7N6bK6JRV6+8JYV87L5roVpXCrWnQ+lj6SBeXWbbPLbcYM2JN759
 aonTBN799Hxg0q/5m/kN0A0umaWgO+KIvUub929BF6rnVmll6z7NimVyl
 28eYqBZfvIcIvLjb4Qx5RtA8MIVKkskl5oQ4tGc5E8rZa6TK8eX+BrEd9
 DegmNHvHOAVaOy0Eb81S37Bte6lOBGdHarvX7z6wTALxsNYW0JgGMVG74
 81FhdKFAU7NUYeDrReUF/fbXzlCMYnxmKB7NCq4q/t50Gj5UvgQaNrKJC
 FWb4zx7xDlIFhCsyCh7fjdthE+PItmNQk7CRCTwgPv1hXXVW1EYH8NYu6 Q==;
X-CSE-ConnectionGUID: T/DcX9EvRSeJEnLS1SOloQ==
X-CSE-MsgGUID: fBzwI3qHR8m3NN4juz+Qew==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11513258"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11513258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 01:21:03 -0700
X-CSE-ConnectionGUID: V8XeZlT0Qf6xnCJIclj5hQ==
X-CSE-MsgGUID: Uc2uoa0AQTSApTC1RIrBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="61788998"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 01:21:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 01:21:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 01:21:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 01:21:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 01:21:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haLLSzfzpp9qsBvlRAFTwMXUv7fVaUjf7+zxrbr/iXL3SHrCF0ru3BvsvPtmmRcfjeDxNJGAI5oSG3UpxLx5tP6TOA9dgrpOMR9uDyKdQEPadqWEznSXEjqtu9Y5OyfcbFqRmX8/SZvlxMLfGHYK1ZsdLIUOzjJ+8cW4prNQdJ3DJOvCtaw0tJy9zc2i8+/luUHH3omGgnGL554L3sPoTKhqlxLMZ1pJZSQd4E01aG4lB5pIN2wuAgh5n7cJhN7ulWHbOjtwZ6t5tYyqm9UlB+1XKHLiHfW/VP37PgEq82XMHJML9ie7T5/QdIbNTFJC0ghQb5b9SDd32vjZ8bkSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Gx6uL08CwB5byUrlzO1YbUAuayHpZrli0+hJUuk8eE=;
 b=lstppUqY0VDFbwtePsVHThu3LLBD2rduhN1PGD3r2HEtcr6KNnbRsLden/+ZGLMGJdZE7WEA1yEg1Ay2Hxkfc3pw/HgQhfY5O+QGsOkFHbNTsNd04R7iuBzFnHo8Iokun9OoySE5b2+eNGY0l1VJ0PQWtOkgx/T67ZnBr2/tTCUmYUOfY5c1tkStOl66H8e3fPhs0JPEoY6aSakV9UwcWr85j+Ts8wXPHq2b2ihN/qQlh3/557RiINnoWsnOWq8jPDO6x85Ji7mfe0BDqoZN74mgEVgXd07ZiEVY/z5sfDfM57JuI5YhK8+O/w0QM9ifn9VD03Uurjp0rRRws7XHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 08:21:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 08:21:00 +0000
Date: Tue, 14 May 2024 10:20:58 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/8] drm/xe/guc: Add support for threshold KLVs in
 to_string() helper
Message-ID: <20240514082058.cigcuaiyqemm746t@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506133814.2571-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB8PR06CA0023.eurprd06.prod.outlook.com
 (2603:10a6:10:100::36) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 151c2c7e-9b48-4e83-462e-08dc73eec9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWQyZTNHMnpWSmFQT0RIajhMaExBcVcwTVk3cktrc3Vaa3dCRE5BRUhNc2Vv?=
 =?utf-8?B?NkRCS3VkYXlRbENsMGpEbHcwMnVGdlZ6cnBiTFNheFBoMTJrbzVSOHN2Yk8x?=
 =?utf-8?B?K1ZYWHVBakZzVllEdlFuRTM4L0o3MDE4NHk2UkhwYUlvSGtneisyRXBMVGM3?=
 =?utf-8?B?TnFzZVdoYlNiRE4wSDhWR3pVTkFIdmp6aFdhK05kbXpvbXlmMEFTeFZTWGhw?=
 =?utf-8?B?Syt2T3lkeTQxakhtNWNqMGxLMHRsNit1NjlkZXVIb3hOcEpxaG1waUFmUHF4?=
 =?utf-8?B?ajBGdk83WkExbkR0THRENWFPT25UUlVpRGtlTTNFOUx2ektXM3JlVFFwTGxS?=
 =?utf-8?B?TzByaEZQRkMyaSsydzIvNlFHTEtKRkU5endHU29DcHRJMTRvTUJCVEhVL2dQ?=
 =?utf-8?B?Nkx3cUFYby9ZQ0lpWXZ0UVA3LzZBU0dNblF3V09qdVg2VWJGT2pUVjFEcjRh?=
 =?utf-8?B?T2dOZ2h1ZWpaRFZCdWUvSnJTbXlWOEU0aXFWSHV5dzM3T0tXY0YzYnpySkxs?=
 =?utf-8?B?dTFBL1ptYyt3TWc0bllWaFJWTHNTazlYcExrN1BveUlJVmZQZXA4UGlhUkxj?=
 =?utf-8?B?RE9mVjNPZEV0WHZZWGpCbUpNQ3FKaWN5UkRaUnJTQmdjOTVxL3paSmFrOUNk?=
 =?utf-8?B?ZGNsbktnR2ZQNzdCVk44a2RWZFJ6LzlVbDhwZWhiWThicEpLQ3pSUGZzQlRI?=
 =?utf-8?B?em1OVk8xQmZ0Nzh2YlhkU3RQbTNmUUFHeWdpRnJybUZ2NXgrMzdoMWxHVE41?=
 =?utf-8?B?Tm1KWFJMM3J3RVN3VmM1cXA3S1ZjM002QUlCaUVZNkt4UVZ2KzAwRCtIbFFQ?=
 =?utf-8?B?cDYvWW9hWk9nbSs1RXFVTU5mT0xBTHhOdDJqR1dhQzFyS2FkV2lWTWFyK0tD?=
 =?utf-8?B?MmFJejZkaTZhY3RZR2lyQnhTYS8rVk1JWFdQaTgvYzhTRENZREsvaEx5WWJu?=
 =?utf-8?B?aExxL0hGNERKS0RzVVF1d095Q1M1NURwQUpOcmozZDlqbGVhTGtWdks3Mmhq?=
 =?utf-8?B?Q2JyVnErRHBZV3dTaGg0dE1BbFA1SnV4U1RJTWFGT0xIcHUyeGxVbWFCSnRX?=
 =?utf-8?B?ZDFGTmNwMkwxNll6ZnRic3BMSk5wVERDMXNEYVZ4VVVOeHFxc1FSY2IwQUVt?=
 =?utf-8?B?aktRSDN5YXVuNWlVMStRV3g5YXlEcDFiVTVicFVJNTVia0xqWWl6TElLL0Rh?=
 =?utf-8?B?OTI3dlhNNVdPNjFwdFlVYWFwdEgxZnFTN1N3R0RnNSsvZGx5bDZuRFpCVnpF?=
 =?utf-8?B?dVAwc1QwUExQY0VNUmE2dFlhL2pza1psTzhsaEtZYllrT3V2emJKT20wemdB?=
 =?utf-8?B?T3dOb1cycU5qWUM4UTdCMGlQdCs5SHdWR2EvVzV2SWR0bWR2Z1RLd2dEZXd4?=
 =?utf-8?B?WGN4NUZyVFlwMnByUFhUS1g4QkRNYzVhc21ZUEJ4UDlxRENEbFc0bVk5UTdB?=
 =?utf-8?B?ZEx3cVVIU3c4TjluTlRZQlJJYW1BWU5zdnRZOWJ0cXZXMG5qdmFWV2lTREVJ?=
 =?utf-8?B?YzY3NGM3SHlhMkVkWjRzSDgrb3VKZVJxMCtvbzN3alhGaEdtWXdseEdSNXBJ?=
 =?utf-8?B?RFpiZllnRm1Rb1Q5VTdoT2RkSXpUNExsd2VLQUkzOHdXeWp4WVpQbWZJOXR5?=
 =?utf-8?B?SERjQThnUnc2YkZwN2N1Y1BYWGZ5aHV6ZVl5dERreDZJMzhxRlg2OXdyZDkz?=
 =?utf-8?B?OGd3NVRRTVd6TmRZQUR0RWVpeEFJcUdVVmlkZUJkZmdqRklQL2JuUlZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdmVTdVWm0vcENHS2tEUnF0STJoaEhST2pJc0xQMitDQjlkWGk5UjR2ajcz?=
 =?utf-8?B?RWlTb2RFWFBKQUJ2Sy9HWVJWbEdNcXZsZ2NFYy9vMk1jb3ZxczZqRGZEZVNL?=
 =?utf-8?B?MlRsRGdvbTcxVEJoT2diWkdLTWd0bHpYL3JqMnNobHB3bU9Wejhub1ZRKzI5?=
 =?utf-8?B?a1B3SHhYQmtaVVJjTW9NSTlNQ3htUXVpbFJjN1ZmRXhoemNuNjBZY2ViUEVm?=
 =?utf-8?B?K1ZRalA2TUtTUGEvK2ljRWNST1ZNY0ZEQldNMG0yRE45R0dXQkQrUGMvSld3?=
 =?utf-8?B?MzgzQlFlMWlpdGd0M245aGZIRlZQODBKS1UxS3VkeXhEdTB1SWhCNnRJY3po?=
 =?utf-8?B?OS9WZ3lhSFZ0cnRRNmJ3Q2hyTjBoSW1SOUw4S2F2RUphakJiUEl0U0pXbXBZ?=
 =?utf-8?B?UVRVT2pzMXpPcTNuVkRicGQ2bWhYYkRSNlJPYUNNV29DQXBUejBBcmhDdHFO?=
 =?utf-8?B?L0NLWE42dDJEeHA0OXQzRmNGTHBCTjNWM004U2VPNlRpbFpHdXBLenN2OHpk?=
 =?utf-8?B?eE5JOGJRbkNVWTJDMVp2bERsUktwOEdUdVJ0Z3B3TmdhTy9jUjlBaVZGZlZY?=
 =?utf-8?B?c1NXMDlRODYyTHI2WUhTeVVXaW02VnFhWEFSQzFXSXNkelhqQ3VDWVlZYmxu?=
 =?utf-8?B?Y3hGUEo5OVJmL2V3RENUbS9lcnN0Vk91eFNEbHN5U3FKVENSQ3ZjT2VENW5F?=
 =?utf-8?B?ZHdXMkprR3dzLzFEbHBCYkcwTHNMVmloM0p3d28xaFg5d1U4MjhzZ2RJek4r?=
 =?utf-8?B?RHQ0ZG5SaGNraTZzc3pVcUl5RGowc05rRTdPRWRybXp0UVlrV3BGMk4rQ25C?=
 =?utf-8?B?RXV0eU1ROEZpOW50cjF0Q2dYZ09wRTNvNFE4YlBQQTl1UDZFUXM4VUZTSXlY?=
 =?utf-8?B?d0k2RkZtbDhKcWx6bm9GQ09MdVN3QUM5cGxFWUhGdXorSlFuc2Q2eC9ncFcz?=
 =?utf-8?B?U2NyTk1xR0pNWnRUcm5TSzUxSExtMkxzTlVtcEJKZHl1bHhWUTRTWjVqZWhZ?=
 =?utf-8?B?dzRLaEN0bEVUZFpRSkUvcDRDWDkrNGNNWnRLRDZDT0tsYXdBdzhJUG9YKzNx?=
 =?utf-8?B?L0lJaERIN09hblhQNmZpTVhBR1FvQjFyVDFxTEo2SGtIM0VFd05PMEFzMlFO?=
 =?utf-8?B?Y09YYktSdXVyYjV1QWlMSkVudTllK0phUU9TY2tjMUFpREttZUdwL2ZVanY5?=
 =?utf-8?B?Rlc0ZWk1eGdvMXJETCtyMzFpMFhDVUJqTG14eElIN3N2NGFDSW1ONkRHRkVj?=
 =?utf-8?B?Q1JoVk92dlNKQlIvbWtLMGVjRS9FbitSNEV3bDZObExrYkhzMTFpSjlJYno4?=
 =?utf-8?B?RTNLS0pBQlQ3TGVlZGlKSHZyenJaR0U3MVlENWJHd1RRMHluTy9TZndobkEw?=
 =?utf-8?B?R3RqZDV5RXAxdFJEQXc0VEhXelE1U0tPejZsRkNxaXlIVlBRTXN2UEtnZ1l5?=
 =?utf-8?B?aTEyKzMwNzY5aWcwNDFYMUpienpmY0duQTBLSnprZHJJTmxaMU4xU3g3anYz?=
 =?utf-8?B?cC9CZEhKNkpOck9Oa1AyU1hYcmY4enlyNWI0SktvSWZZNFE5cXg3OEtxVnFT?=
 =?utf-8?B?K2EwM2grYnIzVTFGUVNGVHVKbUJLL3d1ZDlzelJWa1dlYnFaQUdxMEhQMWg1?=
 =?utf-8?B?MXR5VzBVN2ZkR0ZWdlZNdTdsYzJmcTBSMElCRDA2YXk0bFlOSmVXK2NIeERw?=
 =?utf-8?B?YnBraituc2krOGdoM3RUNTJUTmk5dTNpZkwxU0I2WG1kMUR5b2lXcVc5REl3?=
 =?utf-8?B?K1pKLzBiT0JIRWM4eVhkWTdDNDMzSnhZVFNzYktXYXkvTXBaZGI5aGlpVlZo?=
 =?utf-8?B?blBpSFVPZ2FwQkpFc1lLVzIyUVdWQVNEYXpvWTBudlJhSS9iUVpDVTlNRGQw?=
 =?utf-8?B?RzM4TC9JczI1VDR3Tjdsck9CcCt0d0xpQXpDcnlHVEp3TElsdkJoWWxpYVQ3?=
 =?utf-8?B?RjlqdWZiNFdCWmRTMk5WZzFSeFJhL1VmWXZRNW5oUkVRbndMZjlqQUI5Y0c4?=
 =?utf-8?B?WWd6OHhGSDlqdkRZZUhXMXpxN0YxSU05N1VCVHZpMHk3SXRKNFZZd1dTRTFW?=
 =?utf-8?B?RXAzNE5ZTmVPek1RdkZvczdNeTd6VzZSVms4dDVZdDhiYVcwcmhDSE96QnV6?=
 =?utf-8?B?NW5PNWprUXlVMVJBZktNSlRSelF6Ymo2LzcwWlBpSnNiRE44OUJrZ3B4Szhv?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 151c2c7e-9b48-4e83-462e-08dc73eec9d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 08:21:00.6203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0HklDg99GyUXj8ndJ0LW1rcODEZyZ27vcvz7Xxv4kE8U2tJiaCSaenQO9I/eiq7c+BwAELrgk62wA2o01BaoKxdYfMRrlJN39xIgbe7cv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:09 +0200]:
> Use MAKE_XE_GUC_KLV_THRESHOLDS_SET to generate missing conversion
> of threshold KLV keys to string.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index ceca949932a0..cf7c5fed407d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -8,6 +8,7 @@
>  
>  #include "abi/guc_klvs_abi.h"
>  #include "xe_guc_klv_helpers.h"
> +#include "xe_guc_klv_thresholds_set.h"
>  
>  #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>  
> @@ -48,6 +49,14 @@ const char *xe_guc_klv_key_to_string(u16 key)
>  		return "begin_db_id";
>  	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
>  		return "begin_ctx_id";
> +
> +	/* VF CFG threshold keys */
> +#define define_threshold_key_to_string_case(TAG, NAME, ...)	\
> +	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
> +		return #NAME;
> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_threshold_key_to_string_case)
> +#undef define_threshold_key_to_string_case

In a review of an earlier patch, I already mentioned that placing the definition of this macro
inside the switch worsens the readability of the code, but still:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> +
>  	default:
>  		return "(unknown)";
>  	}
> -- 
> 2.43.0
> 

-- 
