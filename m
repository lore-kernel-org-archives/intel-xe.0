Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F4ACCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 18:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50EC10E33D;
	Thu, 16 Oct 2025 18:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAqE7T6G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022F910E33D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760640464; x=1792176464;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=To4FH2FHHmmfMYNokp6LT9k4ZfhpCNODYcBaB7HBJXY=;
 b=TAqE7T6GzE3NWrJmG+feu9Od0qw4MKdrFoeCJ9C4XLA4vjQ3ncSdY7cO
 ApjW52+8ZAGk/ih+ZBVzU51jjVz0JuzAoW6pLpfy8gGEXNgfBPPnV4/qo
 /xTsiIsg4GmKQ0HsLngda/UkcWugbexGSRwJGpvLWVqWowWjfN9VqFodb
 GBy/UJq1Xn9PwyCCPZR7VA/EugokZ1wHdnqKi5X3Mdlc0MrDri3MKRz7P
 BzdGiSmi6+OWW+EaJ+xIFTXavdI64KGrUVN+OxDP6ZS5dD7wsdWHobnEE
 gA1cMJ7PhqOgCgIZQcQMuhcK3XB0rOiSIxDSquPgFvbC0K9x8uZmqu8nS A==;
X-CSE-ConnectionGUID: ULnUg8EnQQu/UA3TUpEn9w==
X-CSE-MsgGUID: XJvw0wGiSa28hi7pnzEkfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88314246"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="88314246"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:47:43 -0700
X-CSE-ConnectionGUID: o8CpJtOIQGuLk46eFCEBwg==
X-CSE-MsgGUID: L7JvBjJ7ShWHpl4LbFdcyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="206234333"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:47:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:47:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:47:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLe42vF3KjCfjrEUnHOJ5qEOpsCi7POGSP/ipKqseK+Wl4P6MBE6U9uGSJvmP1KxLeetz7TRwQZECjd24qejYFLMcX9ESQtwmwG+A+XGM7LxyMPkY5E5M646OCaVxcw/z/DVFzkBRiUt3O/Ktw72FT5jQrARBIIQsovrb3pkStdw+fLVq9f+6gBFynfoaXm611Y8EIcYXkwTEfcXVBP9yZaCPk4ECU5t5uw3iUMk4rrqcfKvSr7X197V0pitO73oGGaUXTgoDv22lw/1GzaSWEWD80rdA1LF5XCVGhzSGyK+Lk973FAMnKOXeKfDuxcU2ssTtoIS2EZXezHWqa0EoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GRXvCS8o38ytWPwYH9RU8OSxAb6Q0+J1cWQQy2EyeI=;
 b=osCd6KWuTqOsluYyW2Rbjj6lWboL444D+EEkKKKWCJ829tkrIkg+Qus+1oCpiWTLfRg5RPxu3zJUz7F7mRSg1MxisbJuY8Q8THPQYypyHrHXJ9ZjBozKF7/1y4IIlMXBEKbogTzQ6n6LsoZKjwDx8X8Di1coPWFHod0yTG36yatuHE0VaeJDoZxa0TX53NUVjtTg44EIj+T3olwNe/46B61qbgwSp2PsN17VFTmr7OuMftm6plxk+o5tK1DWUIxU/AAc50nrm4ZzVa0zbuiJoGstbqMQIJwkWNIt46bJKwzGf5zhGCfUsOo4IwzkGlPgmxu3GenfTiPkb6pa0XvGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 18:47:40 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 18:47:40 +0000
Message-ID: <4bc0b037-ae4a-49fe-a379-a9aec25ef42d@intel.com>
Date: Thu, 16 Oct 2025 11:47:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/gt: Introduce runtime suspend/resume
To: Matthew Brost <matthew.brost@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
 <20251014073036.3282329-3-raag.jadav@intel.com>
 <1aa6c0b4-73fd-4603-b414-802b4e15442a@intel.com>
 <aPE7oYJa037sxbaU@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aPE7oYJa037sxbaU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5110:EE_
X-MS-Office365-Filtering-Correlation-Id: 1062bd58-27cb-487a-9266-08de0ce47bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWhOUHNubTlnTzJzZ1E4VlBYWG5Fc05GRTF6Zkp4U1JPQjV4N0xOS3E3dVlq?=
 =?utf-8?B?THRiY3JyT2JOSk1kY0JlMjEwcEJoSzRjTnlOYlZlMk93cTVJWmZZZzUrTllo?=
 =?utf-8?B?Yk15aFF0VWI3dlFsT1FmM0hYeERBVEZaM3g0QTJXRmdkVytOMEtydGJuK3dT?=
 =?utf-8?B?bmZQK2tuYTRVMWxlaDBjZzNUSTlscVZ4eVhDdnVLVHRQdnNyZ1NhditzTloz?=
 =?utf-8?B?Wkx2RVkwOTBBM0tvcFVCTlVjbE5QM0w5RFp6S2tuRCt2WnZKenhmLzg1ZGJL?=
 =?utf-8?B?NXY4TVliQWF0WGsvRU9yRGFXaTVldkFXODNQUmFBcGJpK3ZHWnlsSWdjNnBi?=
 =?utf-8?B?ZWVncE9veURtRnQzVW1UZllpenBUYW5OV3l3am1wSzZtUnYxdVBvS21QUFAy?=
 =?utf-8?B?aGhvY2ZweHFGNXZOc0lDMExhc1VCd3lsZis2WWdVVnZMQUp2TFFoWE5qYks2?=
 =?utf-8?B?VGR6WGs3Q2pmRXEyS1VJOGV4Vm1WeGdDeHg4RUxhZ3NESFBtQVFaMWNHOUdj?=
 =?utf-8?B?R2J3Y1BJT2tyK1ZHdTE2RWovNFVNQTRheVM4R0c0dzRGMTNNTDVEWTJNZEo1?=
 =?utf-8?B?dEJHV1EyakZtaEl0WkNQd3FNa1duMU1aZ3kyVFlrYUFiNjFGSHdSOUoxRmNh?=
 =?utf-8?B?bURLTVpLUy80d1lQNUk5TUV3Y2tDZzRVK0pMMk5TT3p3RTh5aC9UWGVZOG9G?=
 =?utf-8?B?Y21vSE95UFN5QnpuallTREdnRCt5TkczSTc0MkQwTEt0YmtRRTBmVVp6eS80?=
 =?utf-8?B?eWtOOFRZb3l4SkJEa2NNK0V1UC9pdW9Ma2toOVhXVk82Q3ZTM1VwTlVFcnJD?=
 =?utf-8?B?eXlhdEVUaldsKzZ5cGt0YWNhaEFTeU42cEZSRjRtMGdRRkU4UHVaMlR5RVdC?=
 =?utf-8?B?d241YmRxNmdkOFJvVUJ1c21RUHgzZmtvSTdWTGlOME8rb09scm1QSGtkSkc1?=
 =?utf-8?B?WlVwUml5cS9hZ0JSSjJzSDBPdURnQ1RwY241aTgvQzVrZXNWdzk0VkdONWVF?=
 =?utf-8?B?ZXQrNlFFcmgvTG5BQy8zRFBXV2dkRmtmRTA1UU1HMkkvdm1Ca0l0QUpXdm1a?=
 =?utf-8?B?SjhhSEQrSFZuN0FBenp1ekpkM1d4eVkxNmtYNUVmMG1JT0doLzdpL3BXVDZQ?=
 =?utf-8?B?L1h3d1pLVDkwZFdCbU9SeE9kUU14WTlsUy9SMFpKMHhHSVIrNXNMa3JWMDFt?=
 =?utf-8?B?R2VsWkhZR1ZUK0hwU1prV2FZSjNZK0NDVm5kdDVMdndKdlpLOWJZVEtHL1lQ?=
 =?utf-8?B?enNxK1pZN1RwRXBFdnJISU9CWlYyYVJ3YWR4UVl1MEt5c0E4UUdxeHRWWmFH?=
 =?utf-8?B?OFlnMUlMb2E4Kzkvdkhic1o3cm42c3pnUWVTQkxFT3FlVWVaY1Y3clhPcTlo?=
 =?utf-8?B?aXRXejJKcFZuM2hLSE9kbCtQQkM4VDBGVzVhZFJJanNSOGRxd3hZdHhqcm5x?=
 =?utf-8?B?TVBDS24wekE4TDJzNS9jcisvVlR4c3hKR094V1p1Q1UyMjRvN2QxS0ZQZG5D?=
 =?utf-8?B?K0lUcjBuMVBmU05sNlRYSHhXa0FwenpPbllJb2FERGlJMmt2aGNOWmNnSTFa?=
 =?utf-8?B?SVhzZk1WZzBST3RmSWcvc1NoeTVvUWswS2xlQ3hraW9ZMFpZUkp6dHhlZ3Bz?=
 =?utf-8?B?eGllZndWWXRuYVpoM2RFNWhMNG1aOG1nazZuN09VRVBCdFZudmhteDgxVmNi?=
 =?utf-8?B?d0NIODdDMUxxVjhHa1p2T2NTdGVma0o1S25WSGdiZm5ZOXdNNi9uZXBLbzUv?=
 =?utf-8?B?T2t6c2x3QkRIa2F5Y1dJQmUrMVdkbzRYMWU3SEd6TEZkdlBxcVU2RnNFYUFC?=
 =?utf-8?B?Yzc5Yk55U0RzR2x4YzJuYWZOTWl0dGpwMFI0bUxIWExqb3JLcjdOSHJ5dU9R?=
 =?utf-8?B?cCtTd20rMURaSnVsbkFMRlN6N0N5Q2lRYkhDZGZvQ0VkK1FZSHJVMlplK2Rm?=
 =?utf-8?Q?S3hmeZAt+KWy9mUuA2UBG48eFfHIo+dY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmNic2p4UFRGZWtCMW5GZ2crN1VaSWpBSlNUTEh4SUducGZXUDVlNjJUY1ow?=
 =?utf-8?B?MjlNejcyWHR5VGFsc29mY1ZvUVFxK2MvSmxYVE5rWkRyUW0rMWpqeGhvdmhq?=
 =?utf-8?B?S2NmeGdiTWJNR01FVUR0bkVVZStjRWk4SmtpSDdVbFhWOUxiZlQra2VDalh2?=
 =?utf-8?B?VGFTcFpiNU5kL1U4UXhFeWp6QlBWeGtJMjd5UUZEMnA3K0ZLUG1VVks1UGg1?=
 =?utf-8?B?OFI1VjV5VW1LdHJIeVdtU0R1eDJHUkh6eFJpL3lpc21yc2tzMWlJaFRGR2lK?=
 =?utf-8?B?TTQ3K2FVdDJ1ZG9wRmRTWmc3N2VzdjFKR3Q2ajlWSWhnMHF6eHFvQ3ZNZFo2?=
 =?utf-8?B?Q1FXNkxCdkU3a09ZMWsxVWtFODJOZ1pjTlFyYmZNbm5vSUhqY0NVbmNsbmNQ?=
 =?utf-8?B?TEl3RVJCUUx4amVIZ28zYjk1djNoZDBzZHFQVURMcHoxTW5QRjlWRVlHVElL?=
 =?utf-8?B?UFpjT0I1eWVrTWZWSkp2TFJzdzJTT2Rjek50UUdWdHlPa1JOWEo1V2JLM1Yr?=
 =?utf-8?B?cVVsdlM2a0c4UThnNXRPalBEMHNTUkxFVnl4a2ExYS9aM3k1cHpRbFpkQ0JG?=
 =?utf-8?B?T0EyV0xRMmxhWXZ1VVI5S05pZFVjSEJSS0ZIZ1BNNGZTQ3VwcWtvZUdrODlY?=
 =?utf-8?B?M3VmOEk1bklBKzRTSUllcjJpMHlXR1Q5bldWdmVzSVZtMkg4dkw1MTVueG5l?=
 =?utf-8?B?empLdEdoMFM0T2IwdHEwS3Brb05NZVViYXlRWDJyaEVhL2NJNHoxZ2VZRFZZ?=
 =?utf-8?B?K1VtR29qMjB0QkpnNGhUU3pGclNNS0d2MVI2V2ErM1U2SFg0RFhDREY3bUE2?=
 =?utf-8?B?OER0bHhlYkpmcWxudGtaUnducDUrMnp4dkxNV1paZTVqMml6dFR0UG1DTVRD?=
 =?utf-8?B?cWh3NGZKVDAvNmFpNlFTdHVIeFdsd2J6Nm1ZUUhHbzRtV0tHa3gxcmhOakYv?=
 =?utf-8?B?emFOOGlyaWEySS84RVFhYXhML3hSdnVjSGdTTUtDZnprWTFGcnV0SVhNcExD?=
 =?utf-8?B?cUE4OFRkTnlQNU1ORktWK1I4eVUwZ1RLL0xKTjRZMnowSS9BYzU3KzhWT1Jv?=
 =?utf-8?B?aGVYY1d0QmtudnVlaWgxYzBxUjBRcjFvR0t5QVNaNkYyYU9DNGdhVzdLS1BO?=
 =?utf-8?B?N0h4S3dMVUxpQ1hpY01CMUt2RENQOFFGc2VFMmFVS3A2MWI1OFVQV1Bjdnk1?=
 =?utf-8?B?S3FGRS8vWWNJUjM5VERiTTJackdYekNCaWd4M1lLeUhQL3BuSStEbXlMZGZO?=
 =?utf-8?B?ZzlmRlNmMEdEZm1tWHl6aE5SZEhjbjdZb3BQSzc3bzFKekR5cVVjdTJIcmEy?=
 =?utf-8?B?N2dLY0ZBY2d2S2tZVXkybmlKdXI3UG5mTzVZQnJRSzlhQXdzN1UzbGhJZlJm?=
 =?utf-8?B?V1lJbzYyWTUxYVQ0M3BkNVN2cExraVdqVi9JMzNJSitLZExOQTRHaGI4VnF4?=
 =?utf-8?B?VVdLNzVwMTVQNG1uYUY5cTd0bXJKK1NyV0xiaUZTeTNsNnorL1hKZHlpQUY4?=
 =?utf-8?B?NUJubEIwWWJJUE1oOEFnbGlQUlA5MXFyTkNOMTJ4SDZub2xIWnc4VGJVcldG?=
 =?utf-8?B?ZVZlZEJpZ2JUZVFVaFpTVFovM3AyUVYyODhieWlwSXQvd1BoWFBBSmkrUlpN?=
 =?utf-8?B?OHdzQThhMWlVWUtFQ0NaaUhyeU9wOHZtSjBxazllejVUeFlMRlI0b3l2NFVH?=
 =?utf-8?B?UWt0YXNIb1g2UnI4WkhWRkVicDVMY0M1dExOcXlPUlE1N3lHeGVXSHpaajNl?=
 =?utf-8?B?TFl5NWNRbnh5MzRHQWNJeXUwcFk3UDRXSFpGZWFkd2JuNzJ5ZE10dFBDUXdz?=
 =?utf-8?B?ck1mZFRDUDVTVDZiTUxPMllkemdsclQzYkJWUGJSckx2S3huYW96UUFFdmNq?=
 =?utf-8?B?MHdiK3h3am45VjdKazJEc3ZoWWRYUTZkM0szbnBORmhkLzNTaEovRWw0b0pK?=
 =?utf-8?B?Q2NkbzhRbXBrOGF1RHdSUGFjOGRFL2hXdnlnVkVFbWYyVDF5YTNKSDNDRy9C?=
 =?utf-8?B?QUlITVJvNGpYOE9Bc1phYWVzeWJjNTBJWmJWUTdDUnNWVFNyK2lPcEMyT2FI?=
 =?utf-8?B?ODcvTURLamRpdG9DWFhrNVBTM2JFUE5PK29nZ0kva29NR1hzdHhKWXBZNmRj?=
 =?utf-8?B?WmZvZERRdGd0RnFwZjlHVHZUOGFXQzVPNW9VY3VyU2FtZFg4ZVJCR0NSZHF6?=
 =?utf-8?Q?BWpi7z0o/wJeVO805RPwxQg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1062bd58-27cb-487a-9266-08de0ce47bd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:47:40.4490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjJA3SImSPjYUj7TLi57rOGITO1bkuTR9BImFMBSFlcZCrJctZ11qZWS771AGpcF96RMbmETKUZvSxlvY3fvS6OJalG09Y70zx23DVYCnYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
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



On 10/16/2025 11:38 AM, Matthew Brost wrote:
> On Thu, Oct 16, 2025 at 08:32:23AM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 10/14/2025 12:30 AM, Raag Jadav wrote:
>>> If power state is retained between suspend/resume cycle, we don't need
>>> to perform full GT re-initialization. Introduce runtime helpers for GT
>>> which greatly reduce suspend/resume delay.
>>>
>>> v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
>>>       Use runtime naming for guc helpers (Daniele)
>>> v3: Drop redundant logging, add kernel doc (Michal)
>>>       Use runtime naming for ct helpers (Michal)
>>> v4: Fix tags (Rodrigo)
>>> v5: Include host_l2_vram workaround (Daniele)
>>>       Reuse xe_guc_submit_enable/disable() helpers (Daniele)
>> Based on the reply about VF behavior in the previous rev, I am thinking this
>> is not the correct approach to this.
>> If on a VF the runtime_suspend/resume functions are not called at all like
>> you said, it means that the VF driver needs to be able to cope with the fact
>> that the HW can lose power without it being directly notified if its rpm
>> refcount is 0. This in turn means that on a VF the driver can't rely on what
>> you do in xe_uc_runtime_suspend/resume() to idle the state and must instead
>> guarantee that the state is already idled when the last rpm ref is released
>> and that a new rpm ref is taken before restarting anything (which might
>> already be true). AFAIK there are no difference in the SW state management
>> of queues and CTBs between PF and VF, so if we achieve that on a VF we'll
>> also have it on PF/Native, which means that there will be no need to
>> pause/unpause CTBs and exec_queues. The only thing that the PF would need to
>> do in the rpm flow is program the HW (e.g. the host_l2_vram stuff and the
>> irq re-enabling).
>>
>> tl;dr, if we guarantee that:
>> 1 - if the rpm refcount is 0 then there is no activity on HW, so nothing
>> that needs to be paused (which might already be true)
>> 2 - an rpm ref is taken before any activity is started (which might also
>> already be true)
>>
>> Then we're guaranteeing that there is nothing to pause/unpause at runtime
>> suspend/resume time, so we're safe skipping those calls entirely on VF while
>> on native/PF we can just focus on the HW re-programming.
>>
>> BTW, any idea how this is working with the current code? Given that we're
>> re-loading the GuC on runtime resume, are the VFs getting disconnected and
> VFs hold a RPM ref. See pf_enable_vfs in xe_pci_sriov.c.

Ok, so we just can never do runtime pm if there are VFs active and my 
concerns about VF rpm behavior are void. Thanks for clarifying. It might 
be worth adding an assert to the runtime suspend/resume functions to 
make sure this is documented there as well and not just in the SRIOV code.

I think that we should still investigate if we actually do need to call 
pause/unpause on runtime suspend or if we're already covered by the rpm 
refs, because we might end up being able to actually turn on rpm for 
VFs, but we can do that as a follow up step and go ahead with the 
approach in this patch first.

Daniele

>
> Matt
>
>> having to detect that and re-connect? Or are we just disabling rpm if a VF
>> is enabled? Because if our approach is that rpm is just not supported if VFs
>> are in use then we can keep your current approach and add an assert to make
>> sure we're not runtime suspending if the vf count is > 0.
>>
>> Daniele
>>
>>> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt.c     | 60 ++++++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>>>    drivers/gpu/drm/xe/xe_guc.c    | 34 +++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 27 +++++++++++++++
>>>    drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>>>    drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
>>>    drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>>>    9 files changed, 162 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index d8e94fb8b9bd..0eacca14ccbb 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -1003,6 +1003,66 @@ int xe_gt_resume(struct xe_gt *gt)
>>>    	return err;
>>>    }
>>> +/**
>>> + * xe_gt_runtime_suspend() - GT runtime suspend
>>> + * @gt: the GT object
>>> + *
>>> + * Return: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_gt_runtime_suspend(struct xe_gt *gt)
>>> +{
>>> +	unsigned int fw_ref;
>>> +	int err = -ETIMEDOUT;
>>> +
>>> +	xe_gt_dbg(gt, "runtime suspending\n");
>>> +
>>> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>>> +		goto err_force_wake;
>>> +
>>> +	xe_uc_runtime_suspend(&gt->uc);
>>> +	xe_gt_disable_host_l2_vram(gt);
>>> +
>>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +	xe_gt_dbg(gt, "runtime suspended\n");
>>> +
>>> +	return 0;
>>> +
>>> +err_force_wake:
>>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +	return err;
>>> +}
>>> +
>>> +/**
>>> + * xe_gt_runtime_resume() - GT runtime resume
>>> + * @gt: the GT object
>>> + *
>>> + * Return: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_gt_runtime_resume(struct xe_gt *gt)
>>> +{
>>> +	unsigned int fw_ref;
>>> +	int err = -ETIMEDOUT;
>>> +
>>> +	xe_gt_dbg(gt, "runtime resuming\n");
>>> +
>>> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>>> +		goto err_force_wake;
>>> +
>>> +	xe_gt_enable_host_l2_vram(gt);
>>> +	xe_uc_runtime_resume(&gt->uc);
>>> +
>>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +	xe_gt_dbg(gt, "runtime resumed\n");
>>> +
>>> +	return 0;
>>> +
>>> +err_force_wake:
>>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +	return err;
>>> +}
>>> +
>>>    struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>>>    				     enum xe_engine_class class,
>>>    				     u16 instance, bool logical)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index 5df2ffe3ff83..ceb633ec22d0 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -52,6 +52,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>>>    void xe_gt_shutdown(struct xe_gt *gt);
>>>    int xe_gt_resume(struct xe_gt *gt);
>>>    void xe_gt_reset_async(struct xe_gt *gt);
>>> +int xe_gt_runtime_resume(struct xe_gt *gt);
>>> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>>>    void xe_gt_sanitize(struct xe_gt *gt);
>>>    int xe_gt_sanitize_freq(struct xe_gt *gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index d94490979adc..6262ca1c1d42 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -1599,6 +1599,40 @@ int xe_guc_start(struct xe_guc *guc)
>>>    	return xe_guc_submit_start(guc);
>>>    }
>>> +/**
>>> + * xe_guc_runtime_suspend() - GuC runtime suspend
>>> + * @guc: The GuC object
>>> + *
>>> + * Stop further runs of submission tasks on given GuC and runtime suspend
>>> + * GuC CT.
>>> + */
>>> +void xe_guc_runtime_suspend(struct xe_guc *guc)
>>> +{
>>> +	xe_guc_submit_pause(guc);
>>> +	xe_guc_submit_disable(guc);
>>> +	xe_guc_ct_runtime_suspend(&guc->ct);
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_runtime_resume() - GuC runtime resume
>>> + * @guc: The GuC object
>>> + *
>>> + * Runtime resume GuC CT and allow further runs of submission tasks on
>>> + * given GuC.
>>> + */
>>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>>> +{
>>> +	/*
>>> +	 * Runtime PM flows are not applicable for VFs, so it's safe to
>>> +	 * directly enable IRQ.
>>> +	 */
>>> +	guc_enable_irq(guc);
>>> +
>>> +	xe_guc_ct_runtime_resume(&guc->ct);
>>> +	xe_guc_submit_enable(guc);
>>> +	xe_guc_submit_unpause(guc);
>>> +}
>>> +
>>>    void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>>>    {
>>>    	struct xe_gt *gt = guc_to_gt(guc);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>> index 1cca05967e62..0165e941a352 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>> @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
>>>    int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>>    int xe_guc_enable_communication(struct xe_guc *guc);
>>>    int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>>> +void xe_guc_runtime_suspend(struct xe_guc *guc);
>>> +void xe_guc_runtime_resume(struct xe_guc *guc);
>>>    int xe_guc_suspend(struct xe_guc *guc);
>>>    void xe_guc_notify(struct xe_guc *guc);
>>>    int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 3ae1e8db143a..2232e872dbd6 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -634,6 +634,33 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>>>    	stop_g2h_handler(ct);
>>>    }
>>> +/**
>>> + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
>>> + * @ct: the &xe_guc_ct
>>> + *
>>> + * Set GuC CT to disabled state.
>>> + */
>>> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>>> +{
>>> +	/*
>>> +	 * Since we're already in runtime suspend path, we shouldn't have pending
>>> +	 * messages. But if there happen to be any, we'd probably want them to be
>>> +	 * thrown as errors for further investigation.
>>> +	 */
>>> +	xe_guc_ct_disable(ct);
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
>>> + * @ct: the &xe_guc_ct
>>> + *
>>> + * Restart GuC CT and set it to enabled state.
>>> + */
>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
>>> +{
>>> +	xe_guc_ct_restart(ct);
>>> +}
>>> +
>>>    static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>>>    {
>>>    	struct guc_ctb *h2g = &ct->ctbs.h2g;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> index ca1ce2b3c354..5599939f8fe1 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> @@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>>>    int xe_guc_ct_enable(struct xe_guc_ct *ct);
>>>    int xe_guc_ct_restart(struct xe_guc_ct *ct);
>>>    void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
>>> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>>>    void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>>    void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>>>    void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index 53507e09f7bc..403a61e98ad8 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -591,7 +591,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>    	}
>>>    	for_each_gt(gt, xe, id) {
>>> -		err = xe_gt_suspend(gt);
>>> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>>>    		if (err)
>>>    			goto out_resume;
>>>    	}
>>> @@ -633,10 +633,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>    	xe_rpm_lockmap_acquire(xe);
>>> -	for_each_gt(gt, xe, id)
>>> -		xe_gt_idle_disable_c6(gt);
>>> -
>>>    	if (xe->d3cold.allowed) {
>>> +		for_each_gt(gt, xe, id)
>>> +			xe_gt_idle_disable_c6(gt);
>>> +
>>>    		err = xe_pcode_ready(xe, true);
>>>    		if (err)
>>>    			goto out;
>>> @@ -657,7 +657,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>    	xe_irq_resume(xe);
>>>    	for_each_gt(gt, xe, id)
>>> -		xe_gt_resume(gt);
>>> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>>>    	xe_display_pm_runtime_resume(xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index 465bda355443..6a58b33248f5 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -301,6 +301,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>>>    	return xe_guc_suspend(&uc->guc);
>>>    }
>>> +/**
>>> + * xe_uc_runtime_suspend() - UC runtime suspend
>>> + * @uc: the UC object
>>> + *
>>> + * Runtime suspend all UCs.
>>> + */
>>> +void xe_uc_runtime_suspend(struct xe_uc *uc)
>>> +{
>>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>> +		return;
>>> +
>>> +	xe_guc_runtime_suspend(&uc->guc);
>>> +}
>>> +
>>> +/**
>>> + * xe_uc_runtime_resume() - UC runtime resume
>>> + * @uc: the UC object
>>> + *
>>> + * Runtime resume all UCs.
>>> + */
>>> +void xe_uc_runtime_resume(struct xe_uc *uc)
>>> +{
>>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>> +		return;
>>> +
>>> +	xe_guc_runtime_resume(&uc->guc);
>>> +}
>>> +
>>>    /**
>>>     * xe_uc_declare_wedged() - Declare UC wedged
>>>     * @uc: the UC object
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>>> index 21c9306098cf..5398da1a8097 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>>> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>>    int xe_uc_load_hw(struct xe_uc *uc);
>>>    void xe_uc_gucrc_disable(struct xe_uc *uc);
>>>    int xe_uc_reset_prepare(struct xe_uc *uc);
>>> +void xe_uc_runtime_resume(struct xe_uc *uc);
>>> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>>>    void xe_uc_stop_prepare(struct xe_uc *uc);
>>>    void xe_uc_stop(struct xe_uc *uc);
>>>    int xe_uc_start(struct xe_uc *uc);

