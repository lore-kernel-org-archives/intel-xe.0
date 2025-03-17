Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0262BC282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 05:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC1C10E03B;
	Mon, 17 Mar 2025 05:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbymHGhH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE1A10E03B
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 05:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742189138; x=1773725138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+OzE49jT4Mz04OVLDpA97uQEgej543zueQvYh/ZP6kA=;
 b=SbymHGhH13zAfcgF6BgQ2qglkuVF9dzQnoYc6s8O6mbXQs6Z50hIlXmn
 ED928sM7R0gUGHe2by/1Ut5fr/xFAgPXf7PR7fQInbX7Vjuj/2oYyVyXG
 /fz3Vc9q2MkC7KI9/QNwYTMhaniihqKHknGo7Q3x/BijmLzwS6mZHh8Xp
 bd3xVe6iRWDqNJMnsa+NkvxzJYgQZ0bQ2nokWB0roeXMu6DT4NmHRtANH
 VEH+Ff622z+Mw+8dnhs3qKkm3Ac0TgoN2UzUoEipSvY9TFwWG8buLkp/3
 BYYBtUyj1SOhGhREBtQax//8V6p4V+7Rr067vlh8iT/A2m5++VkXAW7+9 Q==;
X-CSE-ConnectionGUID: ZAUS/69BRf6oBXRDOIBPpA==
X-CSE-MsgGUID: Lp13N+HGTNmYmYKPf4GfDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="65733485"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="65733485"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2025 22:25:35 -0700
X-CSE-ConnectionGUID: DzmlUO8MS+aD5nIxDVU3Yg==
X-CSE-MsgGUID: dYC3rCCRRwSWLpB0ciccgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="122345561"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2025 22:25:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 16 Mar 2025 22:25:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Mar 2025 22:25:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Mar 2025 22:25:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ue40jZidtRTMVhcfPOP8wK1LGLyFqUmbUE8fhLAwPxKzGNbl8j6NAmRuKi+LPrSN4CMSJJhTJVcZMHsL69MybvTKxNzmWi6UzX2W0mviH7Azbk3dAnL9tmsuL08Y+tXL5MIXZb94uUyIkXLQA7vwWuFhXH+Kn17cQbDxgutmZyhqG1Oce2Q1RD+TCo9X8yg9WBsKPbjSq8cdZjtC8V80BM4bJiMRsqf1icCQqm27h5/DhFb3Ow8BeU84PgKaGCWFgQAinZ89LiWkq/i/SkbF4anxqtkTRhX6lpzhWOEdA7QS0hMq+cJBJQucHN5rABrj2Y3ss/0mgOml4x+KTFwsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+/QtrPeiMrhY0HxDiLYEGDi+pHc06fdq22HK7kvzI4=;
 b=pHow5p/JTyNxkmXhj9ip4BCPlRkftwfztsyZtwf2Plchuzmx7rtnwxiygZkfgMSEurE75RCNJy8xmOof/GQJ45gyrtUD+kY/VsiQRhIGqY7NQS6NXa+Fn2PGr9pOZspfmMsYuYJIeDOZ+ZQxRJXw1KrOEYzNr8A+nnyreyjBdFJE+bNIQ8+nydzm2X4aoDF/0Wr9r4d7tO0oDT3GfV7V1Hzy4Mr2OzP1RHECy656dSE7ibXkMyQytSrMw9ir/CTMuj56Tpkd8l9JV7DGG8HYZhgx1k9iTc0kADWAQrVH2711KZbGoO9txU5MqbkAFIQzfdP8Ct0sFzvCsDfcwIwMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Mon, 17 Mar 2025 05:24:46 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 05:24:46 +0000
Message-ID: <23861c48-b702-42d1-95c9-9960b8fc0916@intel.com>
Date: Mon, 17 Mar 2025 10:54:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe: Move survivability back to xe
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe
 <intel-xe@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250313-fix-survivability-v4-0-5e90efdede99@intel.com>
 <20250313-fix-survivability-v4-1-5e90efdede99@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250313-fix-survivability-v4-1-5e90efdede99@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 9502bd2d-5d61-42e6-86b1-08dd65140795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG1PUDJqTTM0U1orZnFWZnNVOGpZSEYwTWNsZmlCNkg3eFUvaEtabkwxZlNv?=
 =?utf-8?B?TWhaYytnYjZGN0FzVElZVUo4Y1NsZ3lHNVF0VTZPbTB5RitoemRyWStacXJa?=
 =?utf-8?B?c1ptZ2lKZlpCZG5sUUIxL0oyM3R5YXBYNXhTaDFibGhnUG40MkFCMHhLQ1Z1?=
 =?utf-8?B?dXo1M3dDVi9OSmhOQVk1RUg0RW5YVWVTSUVpNGQ2ZUk3Q3J0Sk0wVVQ1WFhs?=
 =?utf-8?B?V0FJQW1Wb1lPb01nQUI1VU9SWkRDdEY5UHpjaGhJdGJ1aEplNWx4bXpvRzlU?=
 =?utf-8?B?LzNzZXYzY08rMzJPcjFNaVMzcFNpNlp3UzlkbjFxTXFiZlgzTThSTXdnTFdy?=
 =?utf-8?B?aGRhbkUvZ2kvMmNyQkFpZTBKWTBKS2tFa0NBVFdqck8zL3lTbGJoR2NkM1N5?=
 =?utf-8?B?Q3FWdWZCbmFDNjZKVjFRSHphSkRoK2lWRFV6ZmE4cjI1b1d5N1RKRzVXbHNO?=
 =?utf-8?B?SFM1MnR6Z2hTQ2hOYk5JRXduaFMzKzREODk5NWtBZGpBdnQ0b3JhTHBiRE0r?=
 =?utf-8?B?ellONXlXTDNqM2JLbEZYY1I2V0lDcXlTQUsyd1NrdmxyYlZST2NZZHhoWDk2?=
 =?utf-8?B?dWtDeXdtQUZsUVN3NXNGdnBhdTliKzl6di9aY3ZncjBPa0VBdjVZa2JSeVBD?=
 =?utf-8?B?bUMwbVdpV2dUeTkyNzduNkROSjNhRTA1RDBDY1V5bjQ3UWovTmR5WmdDdDBs?=
 =?utf-8?B?aHZibm02clVpQzNvWW1iTUhWRU05UWVOaUNXclNvazFRWVR5b3dzclBueGZn?=
 =?utf-8?B?WUxJNDFDQm44WlpVVU9tNWxEYzhDTmprUUVOVHd1dXFXTU5WMkliUGh1MVNN?=
 =?utf-8?B?SFdSTTdxK0RZeVJJaVB0UmRjNHpLbWFyZ3o3SEZqYmh1REZPZ0xBZTAva0or?=
 =?utf-8?B?ZTNOMGZ4dkwyZ1E5QWh2VUh0OVJVaGpPWVRvVU9TWmsydVVkcUZoZWMvc2Fv?=
 =?utf-8?B?S1BldkRldHpyN01NdHJvOW5iS3pWaUczZlZSZmVZTEFSVUhYdjRlUlVLWUhE?=
 =?utf-8?B?ZkVPbyt0eTZaeG5UOUE5U3VzdmFZRFJUY0FiK2hacm5aa29VUng2UzcvV3By?=
 =?utf-8?B?QlZTbjFSd0lWR3lPM2htbnkyMm5iK3JNejZvbnU5aXc4enZkem5zMWg5S0N6?=
 =?utf-8?B?MWc1SDRmcXdWaGIrZFUrOTRlYzVtU1haNHBHYjBydFhCblczdkR3OWx3aEVG?=
 =?utf-8?B?NVRDK2dLQkVOM3VnN2Vya1lzVG5nc3JEZVBKNHNkUXpLVFh4VTVhTWdhaVRm?=
 =?utf-8?B?Vk1vZGNFU0JIOHVIeUY4a3BFbURDRnFCQmM1bTJQQUtONjU3aTlOcldPdlFn?=
 =?utf-8?B?RUN4amE1QUtoMzluRzZkdEUxd2RPdEt2M0xUbVNtd2NYblVjRjg0VkgzZmcw?=
 =?utf-8?B?dTgyelNuSFM0VGtOWnhnd29rZmhmK2dDZC94K0EremxlRnphcXJ0ZVNTS2Nm?=
 =?utf-8?B?VDhZQ3pJMEZzZGg3MGw5N3VxazIvTWUra3VSVFVTVlV1eVNJaGdyTnl3NDFN?=
 =?utf-8?B?RkZ3d2NGWVhTNFYvSEF0WEZDZitoSWtqOEdTTmdCa1pGb1k0SWkyREJNSWZZ?=
 =?utf-8?B?VEtxcGpHOVpyaGl4Nmp0YUNuK0pWaXBDREllcTc3K3lJZlkwM1N4eWFuVmI2?=
 =?utf-8?B?WmdkRzlKMXYrQnBONWM0bkZsMHN2TDU4d0FRRG9DTUNLeTdZTjdKRWxWa2ZJ?=
 =?utf-8?B?ZzU0RVpDUmFjQXFvMXdkZWZ5UVB3RGFHMEcvbzNhenk5Mm1lcVgzSGRVdDd2?=
 =?utf-8?B?ajB4djNYQXdGeE5KWUhQb2gzK3NyZGV2RUtxajFRWGdmMnZ2eVphQU0wSUxR?=
 =?utf-8?B?TUJpU1VLb1V4ck1MS1Q1eEIxOWNoSGFJNndHZ1F1b3pmQ0FyYnByUmFvdy9N?=
 =?utf-8?Q?NdfEUwJvQWv9/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU15ZFBBZWhKZWFtOVlSd3VOamtZbjNDZS9hY2l3b1VYcktUa1dKZlA3ZVJH?=
 =?utf-8?B?TzNlVFJ4d1J1ZFdFZFdHaUw3dnc4aEJtRFRuZ3FTTk53SUV1dllWbEtVQnhF?=
 =?utf-8?B?THlWSk9jcjM0cDhXS2gwMXRjUHQ4QWtoblJ5Wll0L24zMmRWVGd5eWFwVnZP?=
 =?utf-8?B?ZUFhQ0p0dGl6bFhXa1RYczVDbUtFeks0SkVGV1htQ0thb083UXRlSWF5ZzRW?=
 =?utf-8?B?VXV6L0U5Y213ZW9LdThnUXNEVDdhMXRpTmxRN0c3NCt0RE5jdVhsVUl1RTh5?=
 =?utf-8?B?TzluS3VzZ09pOXltTGFyNFRFenJ6Qm4rLzdtWFpOQ0tNcUR5bGdaR3A2WW1V?=
 =?utf-8?B?a2E2MjNDcUtoakJadjZMVmtCbTV2elZYS1lRd0s3R2lnWVFTendydUpPalVy?=
 =?utf-8?B?cXZUMnlDZlVtSnA2amRBV1hsVjIxbzFPakNlWEdYZlMwd3FFQ2xYYXQvKzJ4?=
 =?utf-8?B?QTlLc2xGVVhtSTNmUE9mYmxBdkFaNjFJenFDR3creWlHMlQwS2NiejlSbS92?=
 =?utf-8?B?TExzbnRDKzJLTElZTGNVRFdGYTZoVzJmWW1LUVFLUm0zaUtRdG9sK2pldzJS?=
 =?utf-8?B?dHEwM2dSNlVybFpFbnU4b0FsNlJ6djdTZUV0WkQyOUdxdFR0UE1oeVJLS3Vu?=
 =?utf-8?B?OWViT1QyY3dkTnR1SWM4aG4zcnVQN2VnbGF5bmFkWUhqc0xvMVJlSXV6VEwx?=
 =?utf-8?B?RmxGQW9hcEgxVUQ1Rm9HR1QwdHRRQ2dPcUk0UVBncW1GaitTNFZTeDdxWCtK?=
 =?utf-8?B?cDBSNGJLYU1TR1p4ZFVhTFdRejVZVGQwNXRjNzhzT2t3aFdkU25DT092bHJJ?=
 =?utf-8?B?RGpERDkxNVZTZE9UVFc5d3Q5aGlFdzNVbUNxcmFUS093a09pRit4cXJxQWJh?=
 =?utf-8?B?MjYrSHozN0djWkVtblJBemI5amFsVHhWZWRkMFNIRjhhOVNzWi8vdnlsZWRI?=
 =?utf-8?B?TGRNbUEvSHVUSUJ1dldSTXlVai92RFB0OGJrSlFMTURKNDZnTGttaHQ2ZmQ0?=
 =?utf-8?B?OE1abDZTN2FzdTc3MFFyK24wVjhRaVQ4RnpOOVJoS2RLY3lOUDdPb3Z3UnRN?=
 =?utf-8?B?cWc5NjRPc3Z4WkttVmU1ODVwaDdyZmpaK2NlZmQwRXVJOVNoZkhMUXM4L05o?=
 =?utf-8?B?VW1KUkE3ODUrdnhTL1A0T0YzZTFZY1Bpc2JZUlhPREh2U0RLMXU0b1p6WTlV?=
 =?utf-8?B?OEw5MlFTajBmTDg2cUNSQkFuZFdMa1gxcVRFQ3FjcHZoMCt4SURFT2lIWWdm?=
 =?utf-8?B?OHNpalZJeDNHd0pYZ3JxdllYUjdWeGRtM1FPUmlKL0M1QmVIQkxFTVRaTk14?=
 =?utf-8?B?YUVvaFBoTXYyN0J0d0ZxSkpJOWNzUFRjR3pCczcxT0hRcC9DZWJlZnR2cGdO?=
 =?utf-8?B?QUYrdk51M0t6MFJ0bGxjeDBvY1kvYXVJYmhmMVdIdWczTjVqTEhMSDIxY0g1?=
 =?utf-8?B?L0FWS0xrYiswQmN0Nks3WTFqUXNIejZEMDdOcmJzUVl5by9ST1EwYndoRVFt?=
 =?utf-8?B?cWZYTVNnTTg0L2Y5U1N1TEQ0QVY0UThabnNKRlhhZXNMRzhPWnpkWEdsUktz?=
 =?utf-8?B?U1hzZ2Y4enhjRkc4dHk2SURENzBQblVwYUFvTGdaTWhHRzNSWWNKTTJkOWJR?=
 =?utf-8?B?TW1oVW95bEFRV0QwSmpENzYrSndEcTdpdDBic2ZKcGloenFWMkpnYW1pSE1q?=
 =?utf-8?B?Z1lhVllTYmNLSUZUK3NtaG92ZmVDaXpiUnpncEc3cFp3T1hFNDBqdWMzcGJO?=
 =?utf-8?B?OXVqVkpKV1NOOWhmOUYwaWg1dThTcFRyWkkvRHYzSFRhUlRLbnJDdzRkN3By?=
 =?utf-8?B?cmMrQngxbGhGbm13OURLOEZ6SGdsd3QzNW1nSG1IZTQ0enpXaVN0ZkJtdHkw?=
 =?utf-8?B?eUVQZ25rY0FyVXlOM2syaEEzZUVETUFjK2ZSY1Y2Z0orVVJ4a1hhR0MyaGVI?=
 =?utf-8?B?RFZlbS9lQS9PNkpBRHR5Yk95UllMbkgrOWhGVUptUkdZbXpNaFdrMlZ3SmVB?=
 =?utf-8?B?aFp0YWZZaTZ5cHNzc0diNVd6YW1NdDg1ZjN0MTQvM0RwcE5SS3Z2emNZMjJQ?=
 =?utf-8?B?SW5VMkFjTG5oOUY5YUpLdUlNWlozNWhPWHR5NUtsbGlFUVdaVjBhYW0wY2V3?=
 =?utf-8?Q?PtpRxngD7jjLU331oXMR4osHh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9502bd2d-5d61-42e6-86b1-08dd65140795
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 05:24:46.1250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnKpxJqKpS5EJgFtrG26rt7gYJO6TGY5OzEtXQz0OOsSbEobSH7MfFkobCwoOWlJ3NkQdc2QZQ2UCZXORtkeCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
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



On 3/14/2025 2:10 AM, Lucas De Marchi wrote:
> Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> moved the survivability handling to be done entirely in the xe_pci
> layer. However there are some issues with that approach:
> 
> 1) Survivability mode needs at least the mmio initialized, otherwise it
>     can't really read a register to decide if it should enter that state
> 2) SR-IOV mode should be initialized, otherwise it's not possible to
>     check if it's VF
> 
> Besides, as pointed by Riana the check for
> xe_survivability_mode_enable() was wrong in xe_pci_probe() since it's
> not a bool return.
> 
> Fix that by moving the initialization to be entirely in the xe_device
> layer, with the correct dependencies handled: only after mmio and sriov
> initialization, and not triggering it on error from
> wait_for_lmem_ready(). This restores the trigger behavior before that
> commit. The xe_pci layer now only checks for "is it enabled?",
> like it's doing in xe_pci_suspend()/xe_pci_remove(), etc.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
> Changes in v4:
> - Swap the returns for err and save_err (Riana)
> - Reword commit message to detail where the behavior before commit
>    d40f275d96e8 is being restored (Rodrigo)
> 
> Changes in v3:
> - Stop using -ENOTRECOVERABLE as it may be confusing wrt
>    critical/non-critical failure. Returning 0 is sufficient
> - s/xe_survivability_mode_capable/xe_survivability_mode_requested/
>    as it's not only about it being capable, but also about the type of
>    error, firmware signaling it, etc.
> ---
>   drivers/gpu/drm/xe/xe_device.c             | 17 +++++++++++++++--
>   drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 17 +++++++++++------
>   drivers/gpu/drm/xe/xe_survivability_mode.h |  1 -
>   4 files changed, 33 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b2f656b2a563e..0e8805f93468d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,6 +53,7 @@
>   #include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_shrinker.h"
> +#include "xe_survivability_mode.h"
>   #include "xe_sriov.h"
>   #include "xe_tile.h"
>   #include "xe_ttm_stolen_mgr.h"
> @@ -711,8 +712,20 @@ int xe_device_probe_early(struct xe_device *xe)
>   	sriov_update_device_info(xe);
>   
>   	err = xe_pcode_probe_early(xe);
> -	if (err)
> -		return err;
> +	if (err) {
> +		int save_err = err;
> +
> +		/*
> +		 * Try to leave device in survivability mode if device is
> +		 * possible, but still return the previous error for error
> +		 * propagation
> +		 */
> +		err = xe_survivability_mode_enable(xe);
> +		if (err)
> +			return err;
> +
> +		return save_err;
> +	}
>   
>   	err = wait_for_lmem_ready(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4d982a5a4ffd9..6fea3091e2348 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -808,16 +808,14 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		return err;
>   
>   	err = xe_device_probe_early(xe);
> -
> -	/*
> -	 * In Boot Survivability mode, no drm card is exposed and driver is
> -	 * loaded with bare minimum to allow for firmware to be flashed through
> -	 * mei. If early probe fails, check if survivability mode is flagged by
> -	 * HW to be enabled. In that case enable it and return success.
> -	 */
>   	if (err) {
> -		if (xe_survivability_mode_required(xe) &&
> -		    xe_survivability_mode_enable(xe))
> +		/*
> +		 * In Boot Survivability mode, no drm card is exposed and driver
> +		 * is loaded with bare minimum to allow for firmware to be
> +		 * flashed through mei. If early probe failed, but it managed to
> +		 * enable survivability mode, return success.
> +		 */
> +		if (xe_survivability_mode_is_enabled(xe))
>   			return 0;
>   
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index d939ce70e6fa8..0d57ad1596edf 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>   	return xe->survivability.mode;
>   }
>   
> -/**
> - * xe_survivability_mode_required - checks if survivability mode is required
> +/*
> + * xe_survivability_mode_requested - check if it's possible to enable
> + * survivability mode and requested by HW
>    * @xe: xe device instance
>    *
> - * This function reads the boot status from Pcode
> + * This function reads the boot status from Pcode.
>    *
> - * Return: true if boot status indicates failure, false otherwise
> + * Return: true if boot status indicates failure, false otherwise.
>    */
> -bool xe_survivability_mode_required(struct xe_device *xe)
> +static bool xe_survivability_mode_requested(struct xe_device *xe)
>   {
>   	struct xe_survivability *survivability = &xe->survivability;
>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> @@ -208,7 +209,8 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>    *
>    * Initialize survivability information and enable survivability mode
>    *
> - * Return: 0 for success, negative error code otherwise.
> + * Return: 0 if survivability mode is enabled or not requested; negative error
> + * code otherwise.
>    */
>   int xe_survivability_mode_enable(struct xe_device *xe)
>   {
> @@ -216,6 +218,9 @@ int xe_survivability_mode_enable(struct xe_device *xe)
>   	struct xe_survivability_info *info;
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
> +	if (!xe_survivability_mode_requested(xe))
> +		return 0;
> +
>   	survivability->size = MAX_SCRATCH_MMIO;
>   
>   	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> index f4df5f9025ce8..d7e64885570d4 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -12,6 +12,5 @@ struct xe_device;
>   
>   int xe_survivability_mode_enable(struct xe_device *xe);
>   bool xe_survivability_mode_is_enabled(struct xe_device *xe);
> -bool xe_survivability_mode_required(struct xe_device *xe);
>   
>   #endif /* _XE_SURVIVABILITY_MODE_H_ */
> 

