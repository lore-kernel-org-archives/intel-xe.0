Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3795AC021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 00:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C840010E16F;
	Wed, 19 Feb 2025 00:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVuLOiGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8710E16F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 00:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739925541; x=1771461541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g1EGTciTi1DEAJkS6CZ2hrC+jDzFDMfEg8NQ6HAFIhQ=;
 b=VVuLOiGH/lcjFqQ0yat7lpsJefZbd4+w650/VNSOaKgCSY7eZNctEsOV
 c10DD176hJE7No0/0tZLdeSf7qjV/3/Q2ThC9oqQMgdk05EQUT8GlIpWP
 wtpQvlayQJVT0pNEd2uijNbJGJ/cLVfj3ERHOzygqGPT1X2LEmkPdXqnz
 s/yMfde1UdsLREA2iUX69u5DALg9zIblhnvonG9oU5NEl2Qh4HjXDDr4j
 SCATNC+aPDlR5yGwIzWU8YVRmy/0l5/yMPirt/i9JNtszLKN7RR89n0fu
 l8hiaFj6nx4IuAQCMJhlGjbMQaDfaLthj0So3xgKAZgjj8pPdvqYGZbYO A==;
X-CSE-ConnectionGUID: dRcUUS16QQOAiwr7CqaIyA==
X-CSE-MsgGUID: T0kwhluyRku9qsP29sy7Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28246993"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="28246993"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 16:39:00 -0800
X-CSE-ConnectionGUID: BI4V/9tVSTWkJbg5+kdvJg==
X-CSE-MsgGUID: b8mudh8OQay4ULStUrk2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119756382"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 16:38:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 16:38:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 16:38:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 16:38:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddrH+uJaPToCoaDDU5eHXOO5qAAnjPAtOWAgbBFm5Q1XxQ7MJidKXoxqCSb9MyxYQ9zwrTnkrYSr4E6E5zYAp1WFobUQ7CaK6FLrIUas4JyEdN0OM6WaU6BdzARBs12ygdbAj/RiX5d3oJveqJZAYHkqwnMPULTp45VELdKzgh8VQjLR50b6I5FGkMV+t1+FAYu8nNLVZ7AsdDfjGgdLOlTv//kEPtgclZ8wTru2kYNkmjqWEU1NYCv7o2MSsDu09+PgQp8ejhjQeEppkT81lcUCNMor5wHCraTIOxKDJ219KeqokX2mTUEYk55EBZAJjtpo+PnWhr1tbkHVMyorPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu1tXKMvgic9s0HyqFcgfxyE4thBMA8NtAXf9Tscn38=;
 b=cnCEK9jakEKPgZjdaedTazLZRjJv/pXpafWyKFacmPIwqU6Ure0SZHZ5j5I/do4ajfAT8X8OaxldKO15vYp6hJAkUoX8LoLcoF+b/mmdnGRkFkJNqsSkN7pVW2ZTvtcuCcoAKEDB4gtZXGZPDOj5+ewPCP8P85UMzagblD7aostOm44Xpwd3tqf2PMa/mLyulUFf9cjZIowG+yhx4FAXKq8c1knVdkea+EhriwR2d9Wf3CXTpVzs9s3ZHijdp6a8RN7BkH/uh4JBx1X2uYcOScSjFkIDl4bwQLz61mhqjYIpg2gvfjkW7ThUx4ZsPwS+WLV15zLiAtNs34L56yPs8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 00:38:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 00:38:35 +0000
Message-ID: <e7a999a1-f5be-4fa0-8557-2cf293da385a@intel.com>
Date: Tue, 18 Feb 2025 16:38:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
To: Matthew Brost <matthew.brost@intel.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>,
 <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
References: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
 <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
 <aff30f31-6f1c-4086-b059-d8c1246bfdb2@stanley.mountain>
 <1cf17877-18ae-4cd0-8be5-9a5abd46c58d@intel.com>
 <Z65T4j6Z81Hxl0so@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <Z65T4j6Z81Hxl0so@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: b868ca4c-bbf4-4c6c-1b35-08dd507dbeb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elFUbEJtd3ZkK1JkeHp1S0x0bFJxbzNGMDQvRkh4aDBXbnFqeDZBbFE3UUZl?=
 =?utf-8?B?WjBqMCtnNkFodlJ4M0l2YzJ5bUVDWE4vM1R3TzNzTk85SktxRCtHelo0d3Rt?=
 =?utf-8?B?dEpyWU5ENEhIUGpqc2NPeFhnSWR4blZ1OVJrY202akQ1RFFMUHRVV3NhUUZj?=
 =?utf-8?B?a2VxQjRtKzI2NHFQMUpqNXM0UE1uM1l6Qm1MZzRidVNVZjhKZ3pucW5JK1I1?=
 =?utf-8?B?eDUzUS9sd1RZekV1Y09maDZkcDNCUlc0bmNrN05KV3ZtNTREUjVoZncwaXhu?=
 =?utf-8?B?UWRBUDF5U2Q4MkcvNTZyZldCNU9sRU1oR2VhaW5DMklZeEtXcGVpMVl2K3ZO?=
 =?utf-8?B?bjRqK3djQmt3VUhkUGdiNWlXQ0k0OVJxeE1XREhzVFpkVjEwODVjcWNOUnQv?=
 =?utf-8?B?d0d5U2lvZWpnM09lWjRNdG1rcmhvTHlJemZhU3hkQXl4VTBpTHYrYTFwYmtv?=
 =?utf-8?B?cUlSVUJuVU82UjNkSUJITnFnczRONThTMUNPT1AvOHErWG1Rb0toM05WNVBm?=
 =?utf-8?B?QWhURTZNaG5HUjNhVW1CMHBIc1JjTHBFWXNXY1cvMWR3YzdXRDhhb0xUbHRU?=
 =?utf-8?B?bFRGZkdKalB3UGpEajh0ZjNuY1ZDcUNab3N5UmltcmhlUGJ6Rmh2ZmlCTENO?=
 =?utf-8?B?cjVUaWNOZHExaVU4Tmc4cjZ2MDRpZ2lFMUhMU1hBRGRXWTgxb1BTZG1oNUhY?=
 =?utf-8?B?VE80T1AyRm42WHVyNWlxY2NuNXNidHA0VDY1Z1Q0L0VjWUE3Z2JhVEtvN3ZD?=
 =?utf-8?B?SFhDc0NDYXRGVm1CWlp4OGVSRjBRZFJjWVp4N0d3SzY3bnBiSnBEMWpFTG83?=
 =?utf-8?B?cXhDK0ZNVGFKUVpxaGdqdk90MUJQL21NRnhoT1RmU1Zra2g1dG9JLzA3bU1x?=
 =?utf-8?B?dWhjZWxWVWxjQnJidmora1YvYWhNZ2tYLy9LTzdUQUZ0cGxSZVMzQ3B3TDlr?=
 =?utf-8?B?MnRielNoWURQK2tZK2xqdVRyQ1U1a2EzREdFVmNjbXd2RlhCam5NNmNsVW5a?=
 =?utf-8?B?Y0dhS1hyR3VSS2RzNWVtQ1JBTWV4N0dwZEMyMjV1N3J4MDlXREl5d0xrbEFi?=
 =?utf-8?B?Z2lXL0ZNUytGRlR5SnBJbG1Kdm1ISTA1ZGRtYjgwZzNycXhDRmVIYlBRSktR?=
 =?utf-8?B?RHNFYjY4WnhtVGxuODJJY2pwVHYveG5GZnczd0hRUDJCb3EwUXZWbHNZT29Q?=
 =?utf-8?B?RjVFUWo4dStacDMyQXIzMlR1SWZ2ZmpoOWZvMVZkcVU2NkZXdzVIK3NKRm5u?=
 =?utf-8?B?cFBHa2JCWUVCVkRyLzRmRlo2Y0RTVWRiempzRFNLbzQ1bVE4c2FQZzJqd1hh?=
 =?utf-8?B?U1p5SUw0VmUyb2xwZ3F1Q1RoWXR3VTV5QXk1S05ES2F5TzVTSDFpbFllT0lk?=
 =?utf-8?B?MEpsOUdJNCtPY0M1ckRzelcvMjhvL1FqcGYxSFNnd1FFN3pIWlZ3UE9zK01Z?=
 =?utf-8?B?TW9CZjF0dDk0d0crTFR4b21wWDUraWpsOEhyaE9YNEpqbUxCemx5L1NLM045?=
 =?utf-8?B?RitrVjlBYkF4YzZoak40aDYzRWhNVUh4WVpKR0Evb0FacEQ4QlFoLzhEelcy?=
 =?utf-8?B?eGVYNis5TXlSa0R0aFVCRlFGM1YyV3M1Q0d1STN3SXF0dGZ6R3ZacXJ2a0VC?=
 =?utf-8?B?eWNGKzR3eUtBUThKY1o1V2hpY0JhM1FScmNYbE5NWUlFNU85SmZjMkdySG4z?=
 =?utf-8?B?dmVWSndvY3pIS2Q2OXpMY0dONGJlV0dqRXR1U2x1U0FSSGR6Z2s1dHpWRTRE?=
 =?utf-8?B?WDZCUFdFL1pVYVpGVnVZdm91RUtYbkNTRFk1SFFIMzJoSHdrZ2x0L1lTUFhQ?=
 =?utf-8?B?RnRsSkFWTVFSWTZ0WTJNbkNyYStCbGVrVUhzdHp3OFZEdDBYSkJ1TXRYVDNZ?=
 =?utf-8?Q?cL5wc9WHMpIpb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3MyWUVtTXVWZ3FObGJJWHI0bkNRRkJTSko0cTJMWFpyUVg0R3pueDAzajlE?=
 =?utf-8?B?UEJWcFZhSmk0STQxYjZmcVJPUjJHY2ttN3hnSnhYd05tODhGcVIrOWlDRXBQ?=
 =?utf-8?B?ZXhnd1JTbGtSYnl5OVEwU0RsR2daNHg2VCtuNFRnWVg0S2lSeWNoM0pyM0Z0?=
 =?utf-8?B?STZ2b1lXdW5qamg1ajlKZmVrYmc4ck4vNENHa2dtR2p4aHZNYit6QWpyN2sw?=
 =?utf-8?B?VXZiOW5ISkl6eU0rOWR2N1QzSEJzdHBUM3lLZDhKTlJQV2piZnNsakRtN0tJ?=
 =?utf-8?B?VTZTOFVTUncwVzZNMHVudWVzUmo0VEpTaFhJTFhlZmtUa2VSL2wrdnA1Qzk2?=
 =?utf-8?B?ZkhxeDBIQUVMTktMWGpvdkYzRWZTZU92Zlp4eVR6SzdndW1Ja2ZJNExudGVq?=
 =?utf-8?B?T3dUWk9CNTM0bXNtb0VKSnA1SVY4R0FtVXdzbHZtYmg5TTFkanNwOUpYZjlY?=
 =?utf-8?B?TWd2Qk1zSWhtRWs5dGtlRTZoc1IxQWorb1F1UEpTNlFEQUhSUG5hZTU1d25C?=
 =?utf-8?B?VlFHaWFKRXFIbGhpaTQvM25KVi9Cd3VZQ01YOWdQaW13RG5XeHlrbWJWdFA4?=
 =?utf-8?B?U3Nkd0drUzRQZkdCVTZocDBLNjhMYUkwRlpaWDBUNlFWL1JSUUZFZCs2ZDZQ?=
 =?utf-8?B?WG9UOEdHN0dTNnBVQXhDNUpXSmNqWHN6MFlJSklCMytLM3hmKzRLandoNEda?=
 =?utf-8?B?V3pIYTMwbldBK0tjZjNkYkZYYVZITldEZHNrQy9QbW5xZUlGU2dMMkdRbE1O?=
 =?utf-8?B?YzlGaCs0TVNqNXRSMS9YdTMzVG5mVVVSb3k2QUdyQmU0NFl1Y3M0Uk5zQVZp?=
 =?utf-8?B?bjdXbkwvU0JzMjMrZXZ3WENaNHh5L2d4QUhTUjB2a2NFbnBjTjZGM0VhNEtj?=
 =?utf-8?B?Z1J0SFg3S2M4RXZqelpPUVErNVlpKytvbFlUOXBLaDNKS3FKS0FlU0Y3OFNt?=
 =?utf-8?B?NU1FdVE3NXFqVW04U2w1aldKOFE4SDRtbDVQTCtqQi9peDA0S1NqSURHS01T?=
 =?utf-8?B?TUlpZlZmWkg1ek12SWx0NmIxVlhONzBvRjVVbXAwemgzdkYvWi9LaDBGaDJJ?=
 =?utf-8?B?UUhwWG9mN0pjQ01uVDJBV0JXVWcxMUhZSitjKzY4YWNkY3QrL1RGRU8xbW01?=
 =?utf-8?B?VWJLV0hiVVoxL3B5Wk1rSWRHTzlMSWVWbVhjbWU0aWdlVjVxT1FrTVZQT3FF?=
 =?utf-8?B?VHhNdndDVnpyazZWUjNXZks0d29BUlNEaGNpcm1sdFpOUEdBcHlmVUVaTGVP?=
 =?utf-8?B?ZlAxNENkV1JRcS9SVWVkTWdVV0k5OFlid1NnTy9QT2x4NVQ1UFY0ZnBoRHBY?=
 =?utf-8?B?V0EvamVIekxEM2VVUEpCOTVSdzB2NnA3SkdTS1d2RElEOTErbjlDNU02bVRz?=
 =?utf-8?B?TVBoQURla2Jvc3FlWjIrNzZmTzdqclJlYnVIeTZRMTVyYlNxS3lIeloxMDNR?=
 =?utf-8?B?VFg5NURXR3JPRnM0NW1YOVNDUVRPUVhKYUpLc2RxZEVGdWZEU1F6SVRqUVYv?=
 =?utf-8?B?YllkT1NtcDNGZ201dG14OEVUaXkzVUdoY01GbjJwcTdIS2xMK3hRemlNbnlH?=
 =?utf-8?B?V1NnR1Y2Qk1ycnhDaWZNNHNXSWdxRUg5SEtJNWh4bzZaSmhJNnFtTXNwSnNP?=
 =?utf-8?B?YUJyMERBQm5ILzlDSit4OVhhczloalRtUHBZTUlwTXdqMWhCc0ZXcmtTMWQw?=
 =?utf-8?B?YXBYc0NiSXN1S2RvWGF0NVA2Zjg5ODBxTFFZWTVSZGt6ODhJQ2FWOVdhK0sv?=
 =?utf-8?B?UVVlVnFSSUdMUUg5SjROajhySlpHRHFzd2VLLzZ4M0tOUFJzcFFyd3ZoMUVp?=
 =?utf-8?B?d0U5dmlYQkJGQU5oMWVKVFFYZmhiUG9aSkVIazRaK2Z4bWtwM093OUlvbnNs?=
 =?utf-8?B?YUZ4d2phNXozUkd4R3N1TGw3cjF6VzV2Ynd5QSt0M3d2Mk8rSDNXWkJyUmxa?=
 =?utf-8?B?RG1JR3lHL25RR1N0MUdSRElDbDlVL0h2U0VjK1BaYXJqVitLOWJyR2k5Sis4?=
 =?utf-8?B?YzhHdUFuM2I5MWl5WjFzd3lSdUIwbTlta2JWTC8rak43eld6N0tpc2NFYXhp?=
 =?utf-8?B?OHpMY0VjMWI0Ym9rWXI4TENpQWF4RkpMZUJ5Yi9vWGw2RURPNjNxeHVDanhV?=
 =?utf-8?B?Rm5JeTdLdnNPdDloKzJ4Y1ltdjc0a3hmM29XTWNvcFMwUEl5ajI1R3NzdlNp?=
 =?utf-8?Q?w8TrGpDmC8CwNHVGKhZIwq0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b868ca4c-bbf4-4c6c-1b35-08dd507dbeb1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 00:38:35.8634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/heNr53hU1WkSdFw1n+NdVL2i4VOvyLXr25FcTMkqXFdT3tQev88dBbHx+0kBFFsld7K3P70yWRavqqiqvqcH46+1YuOQcwc0bKUlJQfcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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



On 2/13/2025 12:19 PM, Matthew Brost wrote:
> On Thu, Feb 13, 2025 at 09:23:26AM -0800, Daniele Ceraolo Spurio wrote:
>>
>> On 2/12/2025 10:42 PM, Dan Carpenter wrote:
>>> On Wed, Feb 12, 2025 at 05:26:55PM -0800, Matthew Brost wrote:
>>>> On Wed, Feb 12, 2025 at 04:40:32PM -0800, Daniele Ceraolo Spurio wrote:
>>>>> xe_exec_queue_kill can sleep, so we can't call it from under the lock.
>>>>> We can instead move the queues to a separate list and then kill them all
>>>>> after we release the lock.
>>>>>
>>>>> Since being in the list is used to track whether RPM cleanup is needed,
>>>>> we can no longer defer that to queue_destroy, so we perform it
>>>>> immediately instead.
>>>>>
>>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>>> Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
>>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Patch LGTM but can this actually happen though? i.e. Can or do we enable
>>>> PXP on LR queues?
>>>>
>>> This isn't really an answer to your question, but when I reported this
>>> bug I didn't notice the if (xe_vm_in_preempt_fence_mode()) check in
>>> xe_vm_remove_compute_exec_queue().  So it's possible that this was a
>>> false positive?
>> We currently don't have a use-case where we need a vm in preempt_fence_mode
>> for a queue that uses PXP, but I didn't block the combination because there
>> is a chance we might want to use it in the future (compute PXP is supported
>> by the HW, even if we don't currently support it in Xe), so a user can still
>> set things up that way.
>>
>>>> Also as a follow should be add a might_sleep() to xe_exec_queue_kill to
>>>> catch this type of bug immediately?
>>> There is a might_sleep() in down_write().  If this is a real bug that
>>> would have caught it.  The problem is that people don't generally test
>>> with CONFIG_DEBUG_ATOMIC_SLEEP so the might_sleep() calls are turned off.
>> We do have CONFIG_DEBUG_ATOMIC_SLEEP enabled in CI (and I have it locally
>> since I use the CI config), but since PXP + preempt_fence_mode is not an
>> expected use-case we don't have any tests that cover that combination, so we
>> return early from that xe_vm_remove_compute_exec_queue() and don't hit the
>> down_write/might_sleep. I'll see if I can add a test to cover it, as there
>> might be other issues I've missed.
>> Also, I don't think it'd be right to add a might_sleep at the top of the
>> exec_queue_kill() function either, because if a caller is sure that
>> xe_vm_in_preempt_fence_mode() is false they should be allowed to
>> call exec_queue_kill() from atomic context.
> I see what you are saying here but allowing something 'like we know we
> not preempt queue so it is safe to kill in an atomic conetxt' seems
> risky and a very odd thing to support. IMO we just make it clear that
> this function can't be called in an atomic context.
>
> We likely have some upcoming TLB invalidation changes too which I think
> will move all queues to a per VM list with the list being protected by a
> sleeping lock. Removal from this list should likely be done in kill too.
> This is speculation however.
>
> I agree some test cases for preempt queues and PXP would be a good idea
> if this isn't explictly disallowed at the IOCTL level.

I have a test written locally and I've managed to repro the atomic sleep 
issue. Unfortunately, I have found a second issue with a locking 
inversion: we take pxp->mutex under the vm lock when we create an 
exec_queue that uses PXP, while here we do the opposite with the kill() 
taking the vm lock under pxp mutex. Not sure yet which of the 2 sides is 
easier to fix and therefore if this patch needs an update, so I'll hold 
the merge for now until I have a clearer idea.

Daniele

>
> Matt
>
>> Thanks,
>> Daniele
>>
>>> regards,
>>> dan carpenter
>>>

