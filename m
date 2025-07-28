Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DACFC87FCB
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2F10E584;
	Mon, 28 Jul 2025 19:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JskiwRwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D4D10E191
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732526; x=1785268526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RI95PamiAlUzyTGVLEozXBPUNq3SCpkAapfOZQzqst8=;
 b=JskiwRwO6GbRgVmx39bBCkuWjFKc/FXk1WvvWLj9H3r29COKdWOaZgbE
 yE5t01vS71cYLBcrWAMRc0jKiAi8tuJQqdRicuu5BcQGF9Q0Ah3cDSZyV
 HDxhWCnEgnHRsXc6IqTDkOJ8DEGG+h/942lQFS+UDaV/BCt6s2dIUOsNf
 NsuhJQFuS4BXSLp13OyAAldcAI752WVVbhMNTeBtChY5VRH4D35KTX7aA
 aJf6MwoAlJ1JstxPBm5/e3SziLc3yK/g3z3mNT55JFMlQeua0o4ps5vy7
 8q3v4hSgEF30ms3088ziLH54P7166JUkMcJmMaZRTigkFoXh9O0Kw16Mv Q==;
X-CSE-ConnectionGUID: b3rf7fivRom8V4rSVYgctQ==
X-CSE-MsgGUID: 0VwMllYFRF++mdTe0z2sBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56142104"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56142104"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:55:25 -0700
X-CSE-ConnectionGUID: EK8LSG/FTlin1l9JoodsYQ==
X-CSE-MsgGUID: O4NnikwPQEqe3hNZnkjIbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166676096"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:55:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:55:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:55:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDehuigjgX55Q8yFoQjikvdpdjbfMuB5OL2WVK2BS7SmJwfHD55kxkkfYIQGRfh9MhEcUBhC9n0ZFWD8d7cQpDUgDJwDvAK+SPCq4MBHr2SsmkDNymreQRzMOxvATQHLkT2ef8/5ztjWUedveayt5KRK8p7isGQ/3vfsSnUBst4q6U3D9KQRi5m8TEwCmqno+V3eAGwU6dCW8pmgqCsLVY6PInYcs0BaNNbqHrp8x/+WtN5MbuGC2quJRvgxX2R/Ws6FvgHYmIdBKUbim0q/ccqi9bvMMrt2Sf8be1ZK4xxkI5J5/Whv0G1ay5JogMpbrUFycqvT/VeMufMkvMwg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbOZEtgYBkAnp8+m5cMs4LqdW0HGY6vSQsUXkEU0xvw=;
 b=cbXwzEpskemIJCNOwxol94yhFEV3J9er4d3UF+jpk+tFaBr24/jTqvdKLBNE+tiK+IimJrGOcYvIbe9wYakiDUY35CFGfWcdVOUkqrhcRB452vTn/ssUVU6rILre1AY6KbJO3i/2iDnMAuBBydg36bBhxcufAxC2X8IsSk4QOFZHsT0wvO69tR+a3y8Fz1vInK21/rTxUpQXYnNx7aevw16KDvNXrDNxA1OXnW2v5rbgu0WoKrEIpRNOasiYufG1LgCqQi8yE3pr6x8FAwgCI7B9LLsNEkPW4VnZBSOfe5vOW9fDb0/Bw+Lr+LM58dgIkqQCftAURTcRxIvc65hqEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:55:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:55:16 +0000
Message-ID: <e0a9465f-e37e-46ea-a5e3-e059dc9acb41@intel.com>
Date: Mon, 28 Jul 2025 21:55:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] drm/xe/configfs: Use mutex from xe_configfs
 subsystem
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-5-michal.wajdeczko@intel.com>
 <aIfUbQWlHiOymYGF@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aIfUbQWlHiOymYGF@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: e63bf2c3-89aa-4b79-ebf0-08ddce10ac85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjUzT2hxaU5HaFJXaVpuQzRvQ0NJZlA4WXBSSG9xRHhIQnl2OGIzcU9nV0Ny?=
 =?utf-8?B?eEY5RnA4M2NMUXBQdmRxSVlCQThGMjA1SHh3L3puVzNQOW9ra2d2Q0ZRZlA4?=
 =?utf-8?B?TmlkS1lsZGtiYUljY0tqRHZBM3ZFdWUrYWlVaktORVVLa2syT1NkMXdqMWVu?=
 =?utf-8?B?RlNqUUROQ05lS0xsZS9UNnN0SlNJM0p3S2JKUGNQVURiNDA2M09SYjZDN2Js?=
 =?utf-8?B?ZWFZcVZEeCsrbHdPSzBSL0MyQTNLc3c1WFo4cEhCZ3RSeGZhckUvRzBlUFRq?=
 =?utf-8?B?Vlh1R2ZMcmtVYUlCdGZLalRwMENxdnE2YUhtejh6cENMZC9nK2RKQVptcnVG?=
 =?utf-8?B?SW53WGN3VHc0ZEVxMmdlQVJ3RFhrTjV1cTN3QnNhVUQ3QklQZkEyYWcrZXda?=
 =?utf-8?B?ZFFJeWpSeXMvQ3kyeUdvUzJ4MlVvRlJiczdWSS9ZUjVjTUdDM2VrdkJzU1gx?=
 =?utf-8?B?ejRlMzZOUWwrZHVtTWtVejJYVXZuZ1g0Z2F3ajVDd3VIMVNNZHcvb0hyVGZi?=
 =?utf-8?B?UVNuR0xmd3B0WnRrVVAwVTB5WER2RzMvR2xGblE4OERMNHF6bmJqNFdGVHJ0?=
 =?utf-8?B?MTVKR3NGNGpyMTgrRVFxbG5xbkNGakFCSTcrQlJqdG5mclBPMHlGTnZneDhn?=
 =?utf-8?B?SFlNWFROQy93UlZxbmdPUm96bFk3VmwvOEs1K3VmSnc1cWt2RmZnZmpNNW5M?=
 =?utf-8?B?d2x1REM5eExneWlJNTdwVTQxci9kUnlmRGlxRWdGWFVPNTlLV1gyWGJydW9V?=
 =?utf-8?B?clRqeHhFeHpzMDBCR0F4bDA5MW9vdkl6SEJ6dkVMKyt0QWxiK25OeEtLa05O?=
 =?utf-8?B?bkNpeElWTmYzallndUkrdG14dmN5dm1HVUFPZlRWV2t4eEt3ekRJTjBJb2hv?=
 =?utf-8?B?RlgwUVcrT2ZWWUYzcVp3SkJoNVFVWjdQODRFSVZIdkRNUk8wa1NRblQwN2pp?=
 =?utf-8?B?S3lDMGQ2S1R4VEsraWZJMEpFaGZuQW1BVmUxVENkdFFaeU5hZEtZQllPYzJW?=
 =?utf-8?B?b2M4SHFzVzA3VTV5NzJhNmRaVm1ORWhxdDJFclRPTGhGTE14WGp2Zmd0Mjlk?=
 =?utf-8?B?Y2MzS2o2RlM2ckx5Y0h3bWVBaUhTYXltTXYyNGd0TTJTemRvbmM1cEdGMU4w?=
 =?utf-8?B?b1c3alAybWFHbnR4T01SM0VLMTh0TzZMN1NZZHgrWU84cm1UNVg0bFR1N2xM?=
 =?utf-8?B?Zk1PSlJ5TThKQjlpRWY3ZytBVHpHS2FNb1RMWThYRGVLWCtEZk5lSnRYa2VW?=
 =?utf-8?B?QzMwdGNmRFZqOHdzZTFxbW44UmJEZzBxVjJYb2JXbmIrSEo2WkYzNVhMSDUy?=
 =?utf-8?B?SVJSenVXUnlWMWxNWE8yaGlzSUZBM0R4bjI1aUpQWWNFTnJBelUwL1U0ZDFX?=
 =?utf-8?B?YnlLZVlsMGxETFptN3RhN1JVVlpDWGlYenVUejdCQWFNUytaaFZ0a05GanFN?=
 =?utf-8?B?VitzbGMwQmZjQjd4c0VZRGRUU0E0TDFSSlVycFVuOFZISW9JNGdoNy9LZTIr?=
 =?utf-8?B?c204Y3piQ0xRVkNkTFZJMi9xZ0J4UVFqSmVZcWxmMm5aeVNJb3FqcjNtWXZB?=
 =?utf-8?B?dGhMVjRKSjg3bTFnSC9rZ0pPdko1ZGphOGdGbkJ1OGVGMDBGRGtTMUorK2JL?=
 =?utf-8?B?ZGJQdXIrVjY0NXRNRGtLUFVPWUx1NE5tbkJ2a0xCMDJqL3UxdmJQUXM4SGRM?=
 =?utf-8?B?NU1MeXB3RzNQWHkwRHd1ZGFHQ1JFcmJVUmpLaEVZb205bmJRYTh0VkIzNGFV?=
 =?utf-8?B?cGdYTFdaaE9SU3czV3FRVXlUWVZNTm1wRFpjbW5wdVVlQnVqcXdxdUgyTy9E?=
 =?utf-8?Q?m2jlCvt27k+bGZT23yk4SZsYH7jX/K3+36q7s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnVvYWd4MEpJamhjRHBlcDlSSXdRTzFud2pMWDFmdkUyTUxja3FkZkpLTllY?=
 =?utf-8?B?Rkl5VHloQmszQ2xRMEdUZGhXaTh1bC93V1J1YU5Famttc1IrU1RjeVIxQmxP?=
 =?utf-8?B?QlJCNDVodFNoOG5SMU90R2lYMUw0Y1MvVmd1V3I1cTVkNUNsaldBeDFKTy9H?=
 =?utf-8?B?N3ZKcHBTdklZcEpUZkU3Y09ObFVON0MvSEdGNW53UE9LcVU4UHpZR2psc2dv?=
 =?utf-8?B?S2FoRHFjRFNQZmp3eUhXSGlsTGFuZW1LaDB0MzhlVUZoN0xVYXhFeExORUJ1?=
 =?utf-8?B?bGs1VndieHYrczY2R2xmRGMyNGlJSWR6d3VPWFNSM3QzQzkrb3NLZXVrSzQy?=
 =?utf-8?B?V3lkMzRqZ3M4aTV2WkxORmRmcWpmeGxLakhLQng4NVJFMU5VUjRHNWk3N2di?=
 =?utf-8?B?MVlLbUExNlhOekh0c05kMXV4eHlTSEFVTEVwdlh2Wm5ZeFNBV1RHcW1TZEtC?=
 =?utf-8?B?czFGL05QZ01pVFRLMmhjdDVFRlZETythNit4Q2tFejdMcXd0dDlGTTF2OXRR?=
 =?utf-8?B?NmgvVWNncUc4WDdVRytoK21tbUo2MDAxS3FrWEwxbU1nWEFiaVV1SzVCRmEw?=
 =?utf-8?B?aXJ5b3pLSmdOSnpnR2R6K1pUR284NlRsUmIrMTNQQUEwRmpFV0E4cHdaSDA2?=
 =?utf-8?B?d2Q2anRlZ09tVys0eWNpck05eEEvV1R4OG1nbi9vcmYxcGxoVlVRMFFjSVIy?=
 =?utf-8?B?YkxkdU1uT0hKRUFYbWFsQXpPeXFVTGtXR0J1Q2orV1lvb0hra0tSK1lPQWNh?=
 =?utf-8?B?bEVYNkpOaDBNTXVQTnBNcm5ycTNvZngzN2xSaUZJcGdwYWJWYXMvNWdQbWEv?=
 =?utf-8?B?aExTQkM5R0hVTmdKSjlPZEVDMmV2anBWcXFpSHFuWmlQbWpxaDZjQm9FY1hK?=
 =?utf-8?B?eURHQjI5UENHZmhTUmNGSmlZVmpVMEJ4dE9EL3BDay90QWdqMkJHYmFvTEhR?=
 =?utf-8?B?Q3orcEp5akQ5ZlljREpvQWFNOVVTb0NiUDVhbER5eENlNkZLWDkzQzhaK2RV?=
 =?utf-8?B?a3FCa0I0aXJ0UlB3bmUrU1pZNEpkclhBY01yMlplZndBd0hhaHdLNFpiV1FI?=
 =?utf-8?B?aDZ0dzFoRzA0V2NZOG04Q3lISE0yMlpmb3ZWL1Boem51b0dTU2Vxd2Z6T2g1?=
 =?utf-8?B?WmxtYjQ3VnJIQmVNWEtOZVdNRzZvZmhyalpneXE4Y3RJdGcwL0xadHluak1O?=
 =?utf-8?B?YnpFUE5zbDRSd256S0ZObHpZa0xteXJLU1dKbGN1OWx6Q3dqQ1NBdmx6Y0Jk?=
 =?utf-8?B?TU1FRHM1S0ZqWVNLck5QUmlVb3I2MU1JbHliTmFuWDFYN3RyV2owMzlWdmhh?=
 =?utf-8?B?Nk5ic281QmNkcDdPY2doMVdoZnlscFBWM2V2eUZkNXVwZjh3VFd4ekM0UjVY?=
 =?utf-8?B?NU1rZ1RIM1p4dFRnK2lRaVRiYnB3KzU1MUoxT3dwbUJVNHQ0UjE2U2I4ZnFx?=
 =?utf-8?B?NnVpbkdvRVJ4VW5MSmJ4cE13VXFGdy9acFQwakJ3T3FXYWROOUNzbHV4cG1x?=
 =?utf-8?B?UHBWS25IRnA4QW95blVXM05IYzVjYVJseDEwZVNLQmFUdW5oazJwd0pNR3hy?=
 =?utf-8?B?amtSUjh5WUtrdUcrMUpiS0l4aXNFTjE3djJXclhIc3diNWNhM05nU1JOU2ps?=
 =?utf-8?B?V2NLckNZdzhIT2FUTElVbHl5MnZ2T0J2RkJLNVRZOVFVSVl5eUxTbzFzZEhS?=
 =?utf-8?B?YjFsL1BiTGY1SVhGMWxFNFA0S2RHOFYxOS9jUjNSYUovQlFXK3FMaTlCbGNh?=
 =?utf-8?B?V3VPMGtwMDNQL0hQRlN6QWlzRXl5ZFlwT1pFRi96WmlzMTFla0VUQVdCWFQx?=
 =?utf-8?B?c0xaSTNUa1ErUElNRkdNMk81MkFwL2dQTzlWL1hhbmQ4eDYrcy9JWHcrMWll?=
 =?utf-8?B?SjBlMmtaczcyY0FPWlVlWTVONkN6aFpQMGNSK2JPbVExdFJ4T1hLTG5sUlpM?=
 =?utf-8?B?U1N1MUZ4ZWV4cTF1em53L3hNaGxFRkI4SEFVOCt5bnNkQmN5UUtZRm9HSG5u?=
 =?utf-8?B?UHhsb21nUi8rK1duWXRYVGdVRE9nd1h0dTM5b0ZiQ042Q3diSEJtUm9ZdG5x?=
 =?utf-8?B?UmdxSkZzaEdBODIyVTlJOVRjOXV2aHJwZ1l0cWtLMlR4QUFnbHJpd09Ed3dh?=
 =?utf-8?B?WmVtNVVvOEw5MFEzQlFvYk81Wm5kdmlFWmJhT3lnMnNycVFrdlV3YlllS00x?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e63bf2c3-89aa-4b79-ebf0-08ddce10ac85
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:55:16.7902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUP1oQIkltNiVgAM043dwVzwMo6X3X11bT9uJkeI2I+sUOC8nWtgDnKuJq3qLXdy9QmfxJC8nbljI9p+IHR7H0JBlylhdngeztUhCYrMOLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
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



On 7/28/2025 9:50 PM, Rodrigo Vivi wrote:
> On Sun, Jul 27, 2025 at 07:20:01PM +0200, Michal Wajdeczko wrote:
>> It should be sufficient to protect all configuration parameters
>> using single mutex already defined inside xe_configfs subsystem.
>>
>> While around, also convert code to use guard/scoped_guard classes.
> 
> agree on the guard/scope change, but I believe we should keep
> the local lock for the local variables only instead of re-using
> a global one...

Lucas was fine with that, hence the patch, see [1]:

"I think it would be fine. This is very rarely changed and doesn't matter
much it crosses all devices."

[1] https://patchwork.freedesktop.org/patch/665141/?series=151773&rev=4#comment_1219134

> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 29 +++++++++++------------------
>>  1 file changed, 11 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 6aa0531bcf76..e32517afae58 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -85,14 +85,15 @@
>>   *	rmdir /sys/kernel/config/xe/0000:03:00.0/
>>   */
>>  
>> +/*
>> + * Use xe_configfs.su_mutex (also accessible from group.cg_subsys->su_mutex)
>> + * to protect configuration data.
>> + */
>>  struct xe_config_device {
>>  	struct config_group group;
>>  
>>  	bool survivability_mode;
>>  	u64 engines_allowed;
>> -
>> -	/* protects attributes */
>> -	struct mutex lock;
>>  };
>>  
>>  struct engine_info {
>> @@ -135,9 +136,8 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>>  	if (ret)
>>  		return ret;
>>  
>> -	mutex_lock(&dev->lock);
>> -	dev->survivability_mode = survivability_mode;
>> -	mutex_unlock(&dev->lock);
>> +	scoped_guard(mutex, &item->ci_group->cg_subsys->su_mutex)
>> +		dev->survivability_mode = survivability_mode;
>>  
>>  	return len;
>>  }
>> @@ -219,9 +219,8 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>>  		val |= mask;
>>  	}
>>  
>> -	mutex_lock(&dev->lock);
>> -	dev->engines_allowed = val;
>> -	mutex_unlock(&dev->lock);
>> +	scoped_guard(mutex, &item->ci_group->cg_subsys->su_mutex)
>> +		dev->engines_allowed = val;
>>  
>>  	return len;
>>  }
>> @@ -239,7 +238,6 @@ static void xe_config_device_release(struct config_item *item)
>>  {
>>  	struct xe_config_device *dev = to_xe_config_device(item);
>>  
>> -	mutex_destroy(&dev->lock);
>>  	kfree(dev);
>>  }
>>  
>> @@ -286,8 +284,6 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  
>>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>>  
>> -	mutex_init(&dev->lock);
>> -
>>  	return &dev->group;
>>  }
>>  
>> @@ -311,12 +307,10 @@ static struct configfs_subsystem xe_configfs = {
>>  
>>  static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
>>  {
>> +	guard(mutex)(&xe_configfs.su_mutex);
>>  	struct config_item *item;
>>  
>> -	mutex_lock(&xe_configfs.su_mutex);
>>  	item = config_group_find_item(&xe_configfs.su_group, pci_name(pdev));
>> -	mutex_unlock(&xe_configfs.su_mutex);
>> -
>>  	if (!item)
>>  		return NULL;
>>  
>> @@ -360,9 +354,8 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>>  	if (!dev)
>>  		return;
>>  
>> -	mutex_lock(&dev->lock);
>> -	dev->survivability_mode = 0;
>> -	mutex_unlock(&dev->lock);
>> +	scoped_guard(mutex, &xe_configfs.su_mutex)
>> +		dev->survivability_mode = 0;
>>  
>>  	config_item_put(&dev->group.cg_item);
>>  }
>> -- 
>> 2.47.1
>>

