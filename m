Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9847BD0EE13
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 18:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C1310E439;
	Tue, 25 Nov 2025 18:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdCMePjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E642910E439
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764094746; x=1795630746;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pIZwZWUW/d+tseRJMw0Apmu/kYbUYNnmeihnNbMjqbc=;
 b=CdCMePjGyrucPVeVi8vntWMVpIyn6TCUTsesS4dF9mVAIGlc4MfyUJEx
 JX3YxarRRr1UU/n0IhxOg6R3k6dFVA3xs4FF68o9pA1nD8ZyTTHi8MYuU
 knyNMlIINS6lHijKbuZyTNVM2zzn1Epd/+GGYiaAt+oo6FmKqECmd42TX
 5HXnz4cfH1aVxakE4y/L677kkS2UVjliMxu5Eyw22CzQUejKTlqfMuozA
 kpMAHMQLgIINPoTeURJa+QoyPuTquijajcOutKJlVUrXfy9o4bCzpH9Uf
 8EUjehr+bhBtFJOZ18cQBejs0Dqy/RIpS6wtOweVsAFRqkzpBf/aGuaff g==;
X-CSE-ConnectionGUID: MLv5dqkxTsaMBdDP3M3w2w==
X-CSE-MsgGUID: OTLIusOlTCqRSa2Yu4Tb3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66010582"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66010582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:19:05 -0800
X-CSE-ConnectionGUID: SrhIBb4jRQes3/I3Nm10ZQ==
X-CSE-MsgGUID: nQ3+iNUERvmDmvoUtNxW6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="191963515"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:19:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:19:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 10:19:04 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:19:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2WOmNSsjF/L58ABeVsCIbjJavCKV2wByu+nB4CBr1b0gC37eiQUKDHgqtSdfOCLYfKVieWtpcIqwfGcrMY0pdS6IJwuo/RnsMbGOJVcd28f11msuKsj1LnbSTXG/YZOdyqRe6g13FpnsEBbLAsX/mK5rgWSg2QBKAKONuTLeFRgnQPWxJWYimWJb5SI0hQgfYLiZvXfHaZOuZSfYsrjKmDzOegp6DTLGOT1sKBHowP127mXqKRhAS8EO8R4CA0BOopSMnfKWroX5pYDXSyGjgOJChOymdvKKeX+JvbyVPaon3id8SamHQf3bIVzjYnLSK6tQ/VX8EtPt0ksXWT1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DP0Mi1YTet/zzLnV6wet3nOzpGz2YcfhiXtQ6KKlIOY=;
 b=PeckZ2Gato/lk2u//ubKMxByYg4OljUmbMKOphqBnnmyxjxYBMlDbSBD3HTMVk206g4rTZggvNmxb84vKL9yuMgGxbZkxrh52A3zywfiipkEZUqUfqdoGn09IuGI5qKfN3gYKy4VpL60iqfnLQrs4m6ktuQkKQhS9SiVIohLjhykUCgMnSxlrLB3vu+j8ilQngppJH8qM0zbbByp+nQ0F1lLt4Jd486UDIIPCC+LuFyumOzFKZI1nrslZZ0kEju2PGQldClHgJL/MZdV+5oj9s8ObUihqZskU226LnhZvJlb9H2pZLEw6r1dgcCFoX9AXXzs4ThlmG/tirPSGn/mPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 18:19:01 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 18:19:01 +0000
Message-ID: <3d139b75-0fb2-4d4c-9b6c-eaf0a167b084@intel.com>
Date: Tue, 25 Nov 2025 13:19:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] drm/xe/guc: Add GuC log init config in LFD format
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-4-zhanjun.dong@intel.com>
 <98cbe993-463d-448b-8c76-7b109d008673@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <98cbe993-463d-448b-8c76-7b109d008673@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:408:143::26) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA2PR11MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c1aa86-d4e0-4ded-f21e-08de2c4f1b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjdLQnVQeGx5Skg3K3hqeThVcWdyV3pCRnpDc3UwMy8zbEVIb05TN3g0bXpG?=
 =?utf-8?B?cmliSGpHNSs2eEhFT2wxd3FKdjlBTzM0ZVJsMytNOVA5cEhROEI5OHcrSXEy?=
 =?utf-8?B?UDFNZFljUnZ6WmlvWkJOSnc1blBrQUpucFQvN1BPMUFReCtpSDJodmJHbDdl?=
 =?utf-8?B?b1ZqOE80L21zMWVwQXdvd3Y5Y2UzRGNMeVExRmVGQ3c1cVBiNklwY0xhSHhL?=
 =?utf-8?B?T1NmZmdMR284RFhKYllrcFFZOXpVWjBYU0hSYlVGUmJtaUtqMVlKYm9YUUtC?=
 =?utf-8?B?ZXIxWUF2Z0hUNFhtRTlTamp0UHlSUWg0NUx2dUJVK3FLV2xhTVNLQzQ4SWFt?=
 =?utf-8?B?ek54cnN3eS8vV3FVR2tMWUtPeEtLMThrYU9NcjVlWmhWRnBNc09GWmJ3YUs0?=
 =?utf-8?B?dnZqaHNVMW1KSVpqLzBUSVU3aW4wU2ZZZGNxTnNwQThLYTRNbHBDRUtySk1Z?=
 =?utf-8?B?S3FmeUVLdndmNy9WNVYrNmlsc3hNc0FIQjFNRXJYRkVEQXVraFdXRkdEUUVa?=
 =?utf-8?B?VGVVZUN4NUhYSk9UNUlmYWtsMDRKajhnUjJDNmRBdU01RittS3V5cWJoTVVL?=
 =?utf-8?B?eTF6Qk1aVDdUdUErajRhbW5JQnFrNUF1ZnpXYXdPQXVIanZ6T2JBekJ0NDF0?=
 =?utf-8?B?STBnRGE3Q3BpcFRuSVRkZTRtZFVPRW5JT0tMV1NLazkwWnlnV0xXOGk3UmRx?=
 =?utf-8?B?Tjl4QWF6djlFcmgzRDVsODVmbVN4d0pkTU90SDl5ZW5IR0RyM2orMDM3OUFw?=
 =?utf-8?B?ajBKL3VPWTlLRzczU2owMHNBcXg3WjhuZFByVUN6clRDYWFiYmhzRVE2a3dE?=
 =?utf-8?B?TTlLSFRvd0llOXU1SjJnQ2lBcitRSHZwV2NBdzFNUkdjL01IbjdKbXVEOGhS?=
 =?utf-8?B?TDJkQkpDMHR5RzRWeE1IdEVBaytrem9yWWcrK3l4TE9uTElieTBZdFF4RCtY?=
 =?utf-8?B?aUY0QUNFMEppc0RkVXFqWHFVcm5ld21LQ3Bwdlc2eEZBTVFwU1VENnQ2Qysr?=
 =?utf-8?B?NXNBZTcvK1Izdi9vQ2txZ05hWTVGb3QzQmtHeGdaOCtrKzJEVFgwdnpiNHB6?=
 =?utf-8?B?MVJaeER5OUNBdTBRYktPRmdEN3dXTGFCZVJZNXQzbE1qeHJjVzZFWk1pcEQr?=
 =?utf-8?B?VVRPMHJ4MWpNRlc4RG1Uc3dBREdhZCtxakR2Z0w1WHVTUHF5TXNabmpzUG9X?=
 =?utf-8?B?WWJpTDdLYlFTK2VEUTJhU3pXWFVYQXBYcVU2SVhjS09MazJEOWdTRmlOSzBS?=
 =?utf-8?B?N1liZzhjMDhJYzIrdktieURDS1RFYVlwMGtTWk9SVWp2K0ZYbjZDb0RvU25h?=
 =?utf-8?B?dXRteGhJYWE4ZnJEN3RRNFhabVB2b2VVc3FSS0NGK1ZldEhYTlRhR2U0ZWVy?=
 =?utf-8?B?SUhvOFgwZE4vWW9iMVNxQmpXWHgwYmhOaE9VdlRJNTI5bFI0VE83TnhGL0tH?=
 =?utf-8?B?Ulg0b3ZkRVprRHlMVTJscHpHZWNINUtOWjlDWlVSWXNMRHpmcVZnU29NNzEw?=
 =?utf-8?B?WnVNckt2Ny8vVXNBdW56bmdDemhWK0lXVktNeStKQzdLcGlGVWtkejlkQk1V?=
 =?utf-8?B?TXNZTmxueGJYbG1Rdmh5L21QWWpWMDN4SEZVd092MHJXNTdGQjNSZkFnV09a?=
 =?utf-8?B?Tm9lbHVsUml1K2dpemZ1azROUnpkSkYwNHp4M3BLcXFaZFMxeWRjRDUvS2pO?=
 =?utf-8?B?ZlByOXV3d3h5cEM2NUNmbnlES3AvdmpnUkN5eitXZFpVeUh6NUNweU96a1E4?=
 =?utf-8?B?STh2amd1WlJQQzNmbHcwUmdiV2FrNnlxMG1hQlhEOUNLY3poT1pUR2t3RS9H?=
 =?utf-8?B?RUYwbFl5QXpnUDAycnB5Y2t1Vm1talJYU1J0WUw4WnVONE05elZTY2w0cVRr?=
 =?utf-8?B?eFpVKzU2S0RZQWorTnRIZWJpeHplUVZMeFZJNklwN0Y4SjN3TjdoUmFQbVZP?=
 =?utf-8?Q?WpnYkbwX3bsBduYwPOOB0O9mMbSzGr8V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUxaNUVvTXBETjJXSmFDdExmVC93SGZDUW02SjNkUEh1LzF1TkMyWUk3UDJo?=
 =?utf-8?B?MXo2UTdkcjFIbVF6U2U4REh5aVYwN0ZRV2tHa2R3RVpMUEFBRDRZV0U0VDUv?=
 =?utf-8?B?cmVEbUdsVjBXSmtpMUxPcWo5aTlIRFJjaDl4cHV1RE54MTFVMTVadG5JQ3Aw?=
 =?utf-8?B?cGRZZzlyTk1OOHl3a3J3dCthbFRSZEFRNFNHb1J6L0pUdWE2NUlleHRLMnUv?=
 =?utf-8?B?SjhJQlRkMHBLRGFtV3NzZExSKzRiNmNjbnpuWjZhaEp3QUJWYXJxZ3Q0cnUy?=
 =?utf-8?B?TzFaL2YzYmJlWFpRbFFhVXVBOU5JNGNnQ3JPakVVby9HL282WlhkbDdiN09N?=
 =?utf-8?B?Q3Nqc29XSkY4cEpsU3JINnh2UUkyOVdqSTQ2TGxWVGVHdkhuNHA1MEwxTFNs?=
 =?utf-8?B?S1JwZVAyMzVVQ2QxZ2xtaGxMNStLMFVZTE56eHhRY0NWVGE3bXBNSjFJdTJa?=
 =?utf-8?B?VXQxRXdjR1VxVzRPRGRsMXhReFp1Rjc5aFQ5TzVkcnU4Y3Rlek9DZG83Smdh?=
 =?utf-8?B?a040MWNRdWJSQkZGeXh4bG5oNmtSNTloaWNST2xOUm82Q21xclpNRUt0RnQ5?=
 =?utf-8?B?U3UrWlc4R2RYc20wbytZTHBJSGNCYnJJbVEwNTZvZlJPOVVneWorQXErYVNw?=
 =?utf-8?B?aG54S0ZocnJ0M01zVlJUS2lIc2ZRTW42cXVlbjBsRldHWHBvRHYyZEcrdXA1?=
 =?utf-8?B?TjFzekluQlpaclgrZDRReFJNcXFNYks0ZWZIZmhQRkdPWlFJNTZNTkt2ajAz?=
 =?utf-8?B?VUxWRmJhOU1yb0tFVlJZV1pXZWI1Ykp2VVJ5M3UvdTZLUzRYYnc3SFpndGNl?=
 =?utf-8?B?SkJOSDdOV2FaRk1MK3JSaDlZVVRnZXVIV3lPU2tWZ2JxSWF3SkRCN3R2aG5s?=
 =?utf-8?B?UWthelI0TTlLSnpDeGxUazFhRm9sc3J4REZoRFNSR0Z6b3IzT0dBNEF6clVV?=
 =?utf-8?B?NEh5MUlNOUEvang4SXZ0ZjliOStJSGM3KzhOMlZSWnd5Q2k4dmIxZGpkTzMv?=
 =?utf-8?B?NVFzVG1relhRYlZyekJnK3lKSzR1ak9CWk5CVC8rVmQ3aUp3ZzhBa0tSeS8r?=
 =?utf-8?B?aVdzK3pNa2RxL2JHMlpEWno0c3lab2ttM2dHZXlybEptRFd1bTVERU9mTzZ6?=
 =?utf-8?B?akJ3OXRzRVl0YjNqTXRqRUpkWUpEWTVNS0FnTDFOekVJSnFLYzlobmxlcXVT?=
 =?utf-8?B?ZlErdWxJSXhTWW5ENFYxSVM2dEpmTktaTnZQaGF3NG11K3VxVG5kNjdkeTI0?=
 =?utf-8?B?bGVXaDlqY0lXNkk1VE5qZmdKaXBEelRpd1Y1WmJwcS9JY1IyR0hpemMrYlA2?=
 =?utf-8?B?OEVOVVpncmZSak12SFRMRk8wVW52Y3dFMGNkdC9iZHVCZG12SURiTkUxbFZu?=
 =?utf-8?B?cFRwT0RWN0hKa01LenRPY0g0MHlqbWtmMUlQcHVuSUVpZjN6azNjUjZ5dk5Z?=
 =?utf-8?B?QlJVMStpUlg4bXp6MmkyLzJNK2F2YU95Y2xxd3N5aXpXT2ZIcTl4TWpKNjhw?=
 =?utf-8?B?NmpNWER2SEdPM25BYTVnZmlLVHNoS2ZaaUFXVHVWaU9LN1czQjcxZkxZR3kx?=
 =?utf-8?B?cEt1bXBaN0Y2Z2xkZzJ4b2tkbGluSjZiOW1xRzRYR3RGSExsKzlucE8wR096?=
 =?utf-8?B?WW5EeXZtaFZRZHZKYXpZeHI4djZxUVUrTTV4eEFiRFMwWm83MHhyOVBLRlE2?=
 =?utf-8?B?SU9lOTBGVkNScVlmYytIZXJqWFpTVHJtRkpiWDNnWUk2TWViYkxWNHlEcHF6?=
 =?utf-8?B?VmEwakF6N3BNa2FVYlF1djBWcjdBKzJ0eE5uaVd5MU4reVlndzlhMk92OTVy?=
 =?utf-8?B?amxkRnVGaS9nUjFrWlI1eGVicFRhUWRNR1l3VGt1Zk4vNW5pZWVFL3YyZ3Qx?=
 =?utf-8?B?RVpETUdyVVgrc1JWTEUwcmF2QXQwWWk2ZUhrUjgyemk2d0VEVG5FR3pxV1FQ?=
 =?utf-8?B?b3BBbmp5WHFFcVNENVdOb0RIRE9RV3dBeStRQllNS0pPcCsvR2dYVXlMR2E1?=
 =?utf-8?B?aEpUMDVtQUF0aWhaakJkMDJ3M2NqS2h2MENMV281MU1TTXZiZVpENEpuenVG?=
 =?utf-8?B?VUVhOGhoNllTQk1HRnh1eXUyUElCRks4dVFodFdMTzN0ZW1ISmRNdHN3b0NS?=
 =?utf-8?B?SHEzUTdxd0pYaC9tYzRVM084empsa2E2cWl3RWpvRFVHb2lvamliWHFqaHhP?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c1aa86-d4e0-4ded-f21e-08de2c4f1b99
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 18:19:01.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFzGHsE4QOjt9oI7S449Vie4BMX1IIERb//8TzevVe9yrpgc0v71PU6G5ZKTjh8UGRELShwv5/up6Sdfi7AClg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
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

Thanks for review, please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-10-20 7:44 p.m., Julia Filipchuk wrote:
>> +/* Magic keys define */
>> +#define GUC_LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
>> +#define GUC_LFD_LOG_BUFFER_MARKER_2		0xDEADFEED
>> +#define GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2	0x8086DEAD
>> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
>> +#define GUC_LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
>> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
>> +#define GUC_LFD_DATA_HEADER_MAGIC		0x8086
> Possibly fix alignment
Confirmed the alignment is correct in source code, misalignment here 
shall be caused by '+'
> 
>> +/* LFD supported LIC type range */
>> +#define GUC_LIC_TYPE_FIRST			GUC_LIC_TYPE_GUC_SW_VERSION
>> +#define GUC_LIC_TYPE_LAST			GUC_LIC_TYPE_BUILD_PLATFORM_ID
>> +#define GUC_LFD_TYPE_FW_RANGE_FIRST		GUC_LFD_TYPE_FW_VERSION
>> +#define GUC_LFD_TYPE_FW_RANGE_LAST		GUC_LFD_TYPE_BUILD_PLATFORM_ID
> Does it make sense to define these near the relevant enums?
Those enums referenced is defined in xxx_abi.h, where defines are about 
GuC interface layer; here guc log.c, implementation layer, is what we 
supported. It is possible that some features are defined in interface 
layer, but implementation layer(xe_guc_log.c) skip/don't support it.
Keep XXX_FIRST and XXX_LAST these implementation related macros within 
the implementation layer is the way we follow this layer concept.
> 
>> +
>> +void
>> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
>> +void
>> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> Should this just be declared static?
> 
This is the way we add code without trigger the
"<function xxx> not referenced"
build error.
In the last patch in this series, it will be updated as static.
