Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0AAC3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 13:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D846510E5BD;
	Tue, 23 Jul 2024 13:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0svVgSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3857F10E5BD
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 13:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721740035; x=1753276035;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZBIlDKzdpqiIoIFEHgocEOgJZHPzYbygoMfJoS4DglQ=;
 b=i0svVgSz0Yhx5NxbFIOGr0eLC5hh9c7Ez6/rW6q7lSIWwZVDmPmKTvnT
 hZbe9uyUpPVO3bkm7E3sZS9nfhdQKaFpoPXlbb4X4mJsekBEbF/m4/Pm1
 OrbRUsJ5zt1BVQMb1mi7I+0AtzxURh1kFG8zvYa9Gwc17amo4dShRJLtN
 +02T4Ol//6GbovdjY7548LZZ89kCQlhQ+FlS43WhI649/g9DUYWWIqkjm
 sUTssCPUalvP0crNwLRrBHbMpzF+Tmm2/misnEWQlrfj86BEUmoLgRyIr
 5Far58uk3BKkDsQJWy9In3sC5nDiIlRYQtyYB4XEB81qOuqDsKA6Dsqof Q==;
X-CSE-ConnectionGUID: JR54MgbTSVS0WUJNHgCpgA==
X-CSE-MsgGUID: 5k9vwwkhTfibQKAvk5i34Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23125281"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="23125281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 06:07:15 -0700
X-CSE-ConnectionGUID: cC3ZeBToS/CexPQa4P6UVQ==
X-CSE-MsgGUID: rdMJiY5AQf+SzF90grCjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="57355266"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 06:07:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 06:07:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 06:07:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 06:07:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 06:07:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ip7xGh936n4AeZwYX9QkFEY5hldfCVF2NsiLmS9e2lj1uRHJnmZTpCIHzuPBdaB99GW2hNP3ljDJCwj5L4U5G0+M0Pb1FrdOt1Kq8AsXY63a4cqi/VGGw3qh4odE8YsAQF+gXm2T/1hO7ZD41PZXW20VhWQZQ+1P7kr7buzqRO839OZr5qmANby/8FfnuJcMDWamgdvN6nRvKhv/+5pOF1csFp/b+e735JJ8vXrR4GzmJtmW+EJVdHexPWE6WPrwE3yMLhtUd5wj5EreYuU7TE/Skj5LTqYbWtCaJl5jPTbP9+Mbsc4rwnD6ISFmUULkE+/1PX7+sPuEn2EDywpoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpvX2dT777DJVn3zbwPNqsHDMGt/MVuQaPlEQ8pHpdI=;
 b=JuH9/d9y/bsdI/Yo70qy6auMoRSjINneZvPt0xj2ewSl6Ix1H0ll5kZnrh6MJYwJJ3KoJS/sgWJTI2rgBfLnHuwBgdEhOtjup5rKjF+1Yp58zVNrfF2Y5lRcCoWx7AM5QhCjx+RxIVYmi4IlU4NLuGXuJ/y980uKlvvZat81pWeF8Wu9u3SE6XwyX8s2TWXrwvfFcdJHPCIglZvARaupH+nget2e0z0CvcbdpxfuufX4XkxqtXbMbRYrJIDSMOyUCRHTIOanRLHgoKXPLUSrvAwdFD3S8jPGI52Gh9FkKKjEsDIknhVM5qWZb8y2AOkOX7mO3gsjrzQENBES6tU0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.16; Tue, 23 Jul 2024 13:07:12 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7784.015; Tue, 23 Jul 2024
 13:07:12 +0000
Message-ID: <51db88f1-79b1-44e9-9354-0f628069a64b@intel.com>
Date: Tue, 23 Jul 2024 15:07:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add sent and recv counters for tlb
 invalidations
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
 <20240723111610.21564-2-nirmoy.das@intel.com>
 <9ecd36c8-b880-4097-a6ae-27e786b15497@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <9ecd36c8-b880-4097-a6ae-27e786b15497@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0023.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DS0PR11MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 471abbe6-787f-4538-9cac-08dcab185d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTE5WXFBSjBDbUVYM2JZZ2plVUdGd3FRdG5aeUpLcnlxQmdwNk9YYUV0WXg5?=
 =?utf-8?B?cWpKd2NWQkYxUG5zV3FoQWl0OVNWdUtCTkQ3N0c3NkluSzh1Sit2amJsajBS?=
 =?utf-8?B?OFkwcUtoaWxoOXNWeThyRjl0MWVVVU1acmtiYm42TTNRYlNtWVVPZXkxMjQz?=
 =?utf-8?B?VzEwdUdvVTVvMlhDZmZSWWovQkFLRUFVVXRSd2FhMzRkUmVwMzdKZS80RFpr?=
 =?utf-8?B?NklNZGdBa3hqb1VaM2s2dGh5WEhRL3pCaCt2bFVRaW0wZEQxOVB0c0FmNWZv?=
 =?utf-8?B?cXNhZkhCQW85c1g2OHB0V05JUmVrSll6UVhKc1IvWFlyQmpwZnVVR0ZLd0xG?=
 =?utf-8?B?RytsTWxEQ09NaFlSQlc1R3crOE5TSGpIQkZHNWRnRHVKRmZ6RUY1YWI2RW16?=
 =?utf-8?B?WG9FSStlOTRuWTR2eGlFa2JXMjhZem01SFFLNVVXQUNwUkVTL2x5NzNidGJj?=
 =?utf-8?B?TXV6SDhXeVB2OWpMY3NTV2J1anVLRkV6cGNxdm9laFB0Q0RpUHZ0Y2grYzVt?=
 =?utf-8?B?NmV4T2VBRDNucXo0MkdKVHZadW9OVGpxT1hCZTB3d1VIa2ZvVlV4ZmRlbm9P?=
 =?utf-8?B?U0owR2h5VHJzNkc2L1hPV0dUdTJ4KzY0a0RZSmxlNFAwcWNWaUJRbGdSdUNH?=
 =?utf-8?B?TkpiZmN2aVR0VTByaHZTanBQNElKaHk2T3VmTjNscWh0TUNXOGw3N2RPVFpP?=
 =?utf-8?B?dHAvdGpOdmljSXNCNzhDZE9FaWUrTVduWExKMHR5d1hIdTNBUjd5TVpLazVU?=
 =?utf-8?B?MEdBY0JORUM0S2NBanVMMWl6ZE9aUWlCRFdGcnJ0MUxJYlkySkxETThhTmwv?=
 =?utf-8?B?SEJWR2lvcVlRNUZ6djlyVHFtdEdoSlZkUUxMN3IwV3orUDNBdFZMMDVTQ05I?=
 =?utf-8?B?QS9BdXJCMG1sVDVDSFVmcFArUjduWDMyUDB2Zm1kRjJnaFUxYjh0b1dIa0R4?=
 =?utf-8?B?WEx1aFNFVDFoQVhNQm1jSzREVjd1VFkvUmtzaFNldUpiNWxYZmMzYkxidnFL?=
 =?utf-8?B?UitDVER1c01Lam14RVRLTjFRRjA4allFQnoyUEVweEx6UStiUHl2WU9ZcXI0?=
 =?utf-8?B?eStLQ0MyejJpY3BXZG9RYkNDRi9ZazgrQnQwYVkyZXdwQkNuZ0EvamdqUStq?=
 =?utf-8?B?blpBY3pPREJmemVCOG95VkVzcnZVdlRId2pFOUlxNkdOOHdVcngydWdPeW5j?=
 =?utf-8?B?MVdDQ1lFc3IzUnk4ZklxUnFIVmgzN3FSM3ZNU3FORUhKcm9VM3pUNk9LMkFH?=
 =?utf-8?B?NkdtcUw0ZWFjRTRtaUR0ZU8wblFqWm1WTlVkZTlqTXhrb3FsNTFVRk9XRGZ1?=
 =?utf-8?B?QUFESEdzQytIR0hTTExpMUpQOXdpOTdyenJ4aER6Mlc0MXpGSFpzd1l6dkNK?=
 =?utf-8?B?Z2hjNHd3YWZmYjMzTkVPZy9mMTJmNStnN1NCc01ITmdpREhJMW5KM3BCWXRi?=
 =?utf-8?B?TTBHSXgvYWd4dEU5UUJYVWx2a0xnS2hBZVBVQW1KcmpHOVJyOWZYdm5YU1Zw?=
 =?utf-8?B?WFVDU28vamRYL0hRcWxCVUErbTlBdlZXNjAxRzBmRVNHRzdoRGFIZzJZZ1Mz?=
 =?utf-8?B?UWlNbWwrbk9ET3lnZE4zME5PV1JUbndpVW1sM1NpWFlHNStSQkdGcU9GTmtl?=
 =?utf-8?B?bFhXZWF4UG5vM1lxQTJvVjlvdFg2c3FYQ3dNRXNHQ3Izalo2aW4ySGpNUUFS?=
 =?utf-8?B?dTROa1QyaTRvcHpMcUp6VHRIWlFqczNPNWxZc2JGS2Z5WFd0VVRvV1FLUElJ?=
 =?utf-8?B?R29WbTUvd1UzQTVjMnBDMkttdW1IZWVEd3dKaVNtNmdCQVNVSHU3VW5UN1Ux?=
 =?utf-8?B?VHkzNUNjZE9yYi90cVhSQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0lhaXpYWjMxMFloVFFxd1p3NVJyUmxvQ3pERlFXQUdjSXZSZjdHMjZkY3RF?=
 =?utf-8?B?bVEyTWcxeFlhemZGNEVaNFhmaHJHckZLNDRGc3R2S1hVMEVOWEEvdXM1Lytm?=
 =?utf-8?B?QnR1dVJTeWovczJvOFRGdTNNTkVUK0xkWnlNeSsrQkx3d3MySFIwYnkxUHgz?=
 =?utf-8?B?TzUxL044NmQyMlI4V1BlSExpL0wrcXB0NGk1NEJRTnVhSWY2T09oa3BTWVFr?=
 =?utf-8?B?cTMxNWtqZWlvR2RBVEZnWkJiUGRiQ25pOUlSN0tnZjJUaEh6NXNhUHNkMzBy?=
 =?utf-8?B?OFZJMStLMXFxTDBqdkFoRzZQMjNBaCtNbmZPa3JzN3NiZkZmR3JneTY0VWN1?=
 =?utf-8?B?UU5OUEJnYjhEZFFuMVBUazFna2dNRnBWdGVzb1VZSDNBOENNbFBWWVBUclBW?=
 =?utf-8?B?S3B6SWFDQldMOWRrSllSTFpEYlgzK3VJY3JrL2lXbnBJMlRnb1U4d1hCaW94?=
 =?utf-8?B?YmdCTlBSanJGREh5dFN5dG1Xb1JwUUFJek5CRmdFUzlIbGRiVm90SFFXUUpB?=
 =?utf-8?B?VnY2NnVUVzNFZmFCMy83SHlKZERNREljWDZNS0VtYVVCbW1pR0hDczdpN28r?=
 =?utf-8?B?R3hXamhsRmdKbHVVbjdYdlZRd203bUJFbUhqTWxMOUJObmpURVZ1UWJRWG1H?=
 =?utf-8?B?TFBmUU15RkVINk0rcmZ3MHN2V0tVQ05zeHlyUHFqdEM4MTdIZkN6RWVZbnhn?=
 =?utf-8?B?U2ZnSmYxa1phdUdEWVZSKzk5MFlaUVV0dkgzYjVsZTFGU09KQmVDb2NCSWJW?=
 =?utf-8?B?d2IwY0lQN1c4RWFsSTRWaWFQZDhER29KUytVNUhmbkg0ckVSNXdod0d5Z2Q1?=
 =?utf-8?B?d1F6aFU5eS9FN2E0cGVhMitrZG85OFErZ2xFUitCOWc1a1dRMURLT3ZpMVJk?=
 =?utf-8?B?S3dMdDE1MmJVY0tkejBTQ3ViZnhHUlBFR2ZwYnR6R0t4UW9vOWpKcEMxaTBP?=
 =?utf-8?B?WU83NWZsV1BCOFRtWnVCWFovRFZPSEFJeVJjc2FGSXcxZTJ1eFZDQ2lEc0VJ?=
 =?utf-8?B?QW5paXRWWkhJVENJcXd4MzNZYU52YkJtejUrTTdhaFJHVmtuMkYwazY4QzNG?=
 =?utf-8?B?NnZGdFJzMlFIcHQrbjdlY0prV2d2M0ZIdWZXV1p2em9mUndaWmdpVzBxclhF?=
 =?utf-8?B?TXV4a1lVbk05b2E5cS91bk84Zlo5NVAyVStXbHlveThubWtQY2lFOEt3Sk5y?=
 =?utf-8?B?dy9TcmhBUU5vTGZzcjFTa0kvZm52bTdyZ25YSWtiUHJsSE9hUUZMS2Z6ZXZy?=
 =?utf-8?B?RFo0dmdkL0g5OUVxTkV5WTRTMUdWd0FEbFhOeGl6MGJYYU85eDcwMzM4TGNl?=
 =?utf-8?B?SHh5ZXBIVGFjUDV0MWNDRGZOcG16YWUzb29oakVzUjEwR1p4VWNNaXlUSENB?=
 =?utf-8?B?YmNwS0ZSWmZsdWV0NzJSK1ZwR25qdlR0WlFadDIvbzJwUFBieUk1RDVhditu?=
 =?utf-8?B?bjF5WHhPZjBKdUh5UWo2SjAxUjQwa2QwM0M0YUgvTklBRk9tUUl5aDFDdXo4?=
 =?utf-8?B?UjBlTEtLbm40SytuUXg3clhkNGR1NmpPQU9EQkowNTZ2VVNtRU8zdGx6NDl0?=
 =?utf-8?B?cCtKQ3k5dkZyOUd2SWZuTEplUHFKRThtcnVqMGdqcisyWFVyT01YdmNkcjlM?=
 =?utf-8?B?Q0JNUGxDblNlRWNDbXh5dHg3S2g2QmRKci9qM29DMW1rZzAvdHRqclB3UGtH?=
 =?utf-8?B?cmdvdDcwTWUwYzlJMUkyRUYrVklVUkRDN3RmUDJ5SHNaa2JnWnAyUmlwN3hj?=
 =?utf-8?B?WkdTRG5aTUlsMUtzNnY4VWFwMGV2NkZIQitMVmY4ZlBiNTB5anc2WGtQR0dy?=
 =?utf-8?B?emxzb1l6SDEvbmcyVmZxRUl4RGdTTFJuUW5BL3BJelZGVjZDOEhtMmJ3Lzlo?=
 =?utf-8?B?K1Q5OTZKYVpzR0lvbml1akhzWWZhZEZIaFpJLzZUOEdsMVNhNEwzOTZmR0Zq?=
 =?utf-8?B?SnU2TzBzSDIxU2p3aG9IWVVjNDNJbmQ5djFhUk85S3l2aEl2NnpmTGVRYWl6?=
 =?utf-8?B?V3dhWEhEU01ldEcyT0lUaE1FS1I4aFVkMTJaYTJLcnFTUFdveTRWKzVNQ2dj?=
 =?utf-8?B?eGE4bXJKbzRGMUxDMXNIbFgxeE9MMUs0dzMvc1FrMVgrbFN0b0hhVE9ueXl1?=
 =?utf-8?Q?uvVW5U+sgb/3q2GbXSMSOA4vn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 471abbe6-787f-4538-9cac-08dcab185d9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:07:12.0444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQ7xwAbN5e5qp/nJBe+ag4mE/EGZM1phena3Y85ObktSbbsoUs2zKMnaMSdeQ31SAUMkfNq1Hk6jj6CkXBbaXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
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


On 7/23/2024 2:22 PM, Michal Wajdeczko wrote:
>
> On 23.07.2024 13:16, Nirmoy Das wrote:
>> Add counters for TLB invalidation sent, receive requests which
>> then could be query as sysfs files from userspace.
> s/sysfs/debugfs ?


I will fix it.

>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 37 +++++++++++++++------
>>   drivers/gpu/drm/xe/xe_gt_types.h            |  4 +++
>>   2 files changed, 30 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 481d83d07367..f84717c1aafa 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -37,8 +37,11 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
>>   }
>>   
>>   static void
>> -__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
>> +__invalidation_fence_signal(struct xe_gt *gt,
>> +			    struct xe_gt_tlb_invalidation_fence *fence,
>> +			    bool failed)
>>   {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
>>   
>>   	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
>> @@ -46,13 +49,19 @@ __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_
>>   	dma_fence_signal(&fence->base);
>>   	if (!stack)
>>   		dma_fence_put(&fence->base);
>> +
>> +	/* Only increment the counter when tlb inval is done successfully */
>> +	if (!failed)
>> +		atomic64_inc(&gt->tlb_invalidation.received_count);
>>   }
>>   
>>   static void
>> -invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
>> +invalidation_fence_signal(struct xe_gt *gt,
>> +			  struct xe_gt_tlb_invalidation_fence *fence,
>> +			  bool failed)
>>   {
>>   	list_del(&fence->link);
>> -	__invalidation_fence_signal(xe, fence);
>> +	__invalidation_fence_signal(gt, fence, failed);
>>   }
>>   
>>   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>> @@ -76,7 +85,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>   			  fence->seqno, gt->tlb_invalidation.seqno_recv);
>>   
>>   		fence->base.error = -ETIME;
>> -		invalidation_fence_signal(xe, fence);
>> +		invalidation_fence_signal(gt, fence, true);
>>   	}
>>   	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>>   		queue_delayed_work(system_wq,
>> @@ -102,6 +111,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>>   	spin_lock_init(&gt->tlb_invalidation.lock);
>>   	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>>   			  xe_gt_tlb_fence_timeout);
>> +	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
>> +	atomic64_set(&gt->tlb_invalidation.received_count, 0);
>>   
>>   	return 0;
>>   }
>> @@ -140,7 +151,9 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>>   
>>   	list_for_each_entry_safe(fence, next,
>>   				 &gt->tlb_invalidation.pending_fences, link)
>> -		invalidation_fence_signal(gt_to_xe(gt), fence);
>> +		invalidation_fence_signal(gt, fence, false);
>> +	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
>> +	atomic64_set(&gt->tlb_invalidation.received_count, 0);
> hmm, any TLB invalidation timeouts/errors, which would make
> received_count != sent_count, should trigger a GT reset, which in turn
> will reset those counters, so under which condition you expect those two
> stats being not equal?

We tolerate GGTT tlb inval timeouts without needed to do a GT reset, 
probably we shouldn't? If not then, I agree that we can have

a total sent counter  and another for inflight counter.


> is it just during the waiting for some ack?
>
> maybe better/cleaner option would be to track/display number of TLB
> invalidation requests in flight ?


Request from Sai was about having total tlb inval sent counter and I 
think inflight would be a bonus and should be useful for debugging.


Regards,

Nirmoy

>
>>   	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>>   	mutex_unlock(&gt->uc.guc.ct.lock);
>>   }
>> @@ -182,7 +195,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>   	action[1] = seqno;
>>   	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>>   				    G2H_LEN_DW_TLB_INVALIDATE, 1);
>> -	if (!ret && fence) {
>> +	if (!ret) {
>>   		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>   		/*
>>   		 * We haven't actually published the TLB fence as per
>> @@ -191,7 +204,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>   		 * we can just go ahead and signal the fence here.
>>   		 */
>>   		if (tlb_invalidation_seqno_past(gt, seqno)) {
>> -			__invalidation_fence_signal(xe, fence);
>> +			__invalidation_fence_signal(gt, fence, false);
>>   		} else {
>>   			fence->invalidation_time = ktime_get();
>>   			list_add_tail(&fence->link,
>> @@ -203,14 +216,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>   						   tlb_timeout_jiffies(gt));
>>   		}
>>   		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>> -	} else if (ret < 0 && fence) {
>> -		__invalidation_fence_signal(xe, fence);
>> +	} else if (ret < 0) {
>> +		__invalidation_fence_signal(gt, fence, true);
>>   	}
>>   	if (!ret) {
>>   		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
>>   			TLB_INVALIDATION_SEQNO_MAX;
>>   		if (!gt->tlb_invalidation.seqno)
>>   			gt->tlb_invalidation.seqno = 1;
>> +
>> +		atomic64_inc(&gt->tlb_invalidation.sent_count);
>>   	}
>>   	mutex_unlock(&guc->ct.lock);
>>   
>> @@ -321,7 +336,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>>   
>>   	/* Execlists not supported */
>>   	if (gt_to_xe(gt)->info.force_execlist) {
>> -		__invalidation_fence_signal(xe, fence);
>> +		__invalidation_fence_signal(gt, fence, true);
>>   		return 0;
>>   	}
>>   
>> @@ -455,7 +470,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
>>   			break;
>>   
>> -		invalidation_fence_signal(xe, fence);
>> +		invalidation_fence_signal(gt, fence, false);
>>   	}
>>   
>>   	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index ef68c4a92972..130d9f5cb5c2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -199,6 +199,10 @@ struct xe_gt {
>>   		struct delayed_work fence_tdr;
>>   		/** @tlb_invalidation.lock: protects TLB invalidation fences */
>>   		spinlock_t lock;
>> +		/** @tlb_invalidation.sent_count: counter for sent TLB inval requests */
>> +		atomic64_t sent_count;
>> +		/** @tlb_invalidation.received_count: counter for received TLB inval requestes */
>> +		atomic64_t received_count;
>>   	} tlb_invalidation;
>>   
>>   	/**
