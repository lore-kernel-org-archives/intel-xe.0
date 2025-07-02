Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599A8C7EE30
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCB810E307;
	Wed,  2 Jul 2025 08:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G338XNcY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ADE10E307
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 08:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751443373; x=1782979373;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a+VPemeJPfPCbsnPmmsszP4nGRD7kNQ+4nMNb+FcBEA=;
 b=G338XNcYSr0F62ekcVgTUPgvXn7nEn55MtmSmebL9PYjF0xofm30yjcg
 Q4LVZq1PwFH++FvM0J0JBCR5CTczaJNhuZLv2CeEP6HCqWtEZwxxYlz4F
 9hE+WK17k4MSV6qYa46wdjU7qItYWaVV+/EVINAv/Z8fA13Tzb4ig5AwZ
 R4W8IDeXkUOFuLSVpriwH2EUbcbROh2GQxPXJ9o4Lt34K/UBV0OzCCQY6
 o2VnfMoaqFdUOrvkabdgb0ix8m567pqBUS2JXZAUIMhvSiFKx7zYyKk4C
 PLaff4mQXCMhqF+P0gvpJIorf1+usl1ZTnUGeo0NFtRcrbLzQSKEvfi/L A==;
X-CSE-ConnectionGUID: 58wCvjqqSxO+aO2pNuLkzg==
X-CSE-MsgGUID: vVrQPwyvR+CYmFACm+SL0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53868533"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53868533"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:02:52 -0700
X-CSE-ConnectionGUID: 1kztAxJBQ8yoe90gXdzfWg==
X-CSE-MsgGUID: gxLzlgmgT3GuKXISSHEYbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159712948"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:02:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:02:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 01:02:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:02:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N77u7eylvsiqrJ6Q3mWgyRKj2D9mcbbS95WeX22lsfnh9C7Q0PnwqeybLBUgZOyt+TldtaKMu+Qzw58iwoKMymj/vh2sabIMVHyskjyRRuku25hrPkFiRnzFzPOJpSGOUcEMFANEFz1b1WMMD/jKw28b3bAh3ydjEUFwJ6TZmT60dMlUO/24JSybCwLKQ95/A8i652Dnr5qcUTKrcm8CulqUobWRVQyMmf8XltK9xtXPpl5PE+MYBHBo3NTzrH9+NZW/EmZnNaHzGpvwvJ+EyrAIj9Aw5ovAcSueLLsGwqrZ1I0ICenJbD9vlGuY8wJDEOJofxcPyN0yEHbyi6wxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK+ekbiO+M4CPa0vC1XckKQuN5iG3VWSXRcNZ9CXuj8=;
 b=CPR8fsBjktOcPS9e/vKx5hwy40BTboAa2Qbx4+SLQQ+CHigDuBGlin/3fUmdUQ48Hg8/WSaTvdfOTut11ZhRD21AqTBqzhlP/v8LElvc2uBsqNgPy0iJ1tJt4CBMEmK1oXWbcq+VdmzweI6ouwTf9Zz0S7V8qXuTuyobD7Ws0/8hhsDL3QznIpypHxdxg3AOK4Hy0O89NIVOthsGKco91Rlsdkk68RLM/xkb81l73yDZndAO1tR6fRNy1tH1JhOviPJvF53uBW8dUT+QKfnprECcTIeZ4GdXi+TU8cnJnXjPb33QADzxCQW4PjXO6IMvlzgCwW+7q8K+8EyOn1nxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7486.namprd11.prod.outlook.com (2603:10b6:806:314::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 2 Jul
 2025 08:02:34 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 2 Jul 2025
 08:02:34 +0000
Date: Wed, 2 Jul 2025 10:02:31 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Clear all LMTT pages on alloc
Message-ID: <20250702080231.givgpmcdn7qxjlrp@intel.com>
References: <20250701220052.1612-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701220052.1612-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d9a72f-80fd-496b-0a4e-08ddb93ecd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TURPTGFncFpWcStWMm0wOVkrSXgzT1ZodEpQd05FalFyNVFjSHVCUFBYNXBv?=
 =?utf-8?B?WTQwTjgvVEk3ekRMdXR4K0t2MXA4TlRYbzV0ZVc5azZKVndPNFhqQXNrMWhZ?=
 =?utf-8?B?RW8xeDFiVVNPQlIwZGRPSkJsQWVONy9YazdvSlVSSXJJRCtpK1VzQm1rckFQ?=
 =?utf-8?B?QS9aQktlZFE4dzV3M0tsU3NObDBMSkVkODR3dCtpcmZ6SWxtc0dlalJaV29N?=
 =?utf-8?B?QUVqOElORlRUU0ZkemtzWUErMWxPdTdOM0hFbzNoZGg1a05UOEQyVjhFMnRY?=
 =?utf-8?B?WC9qV2NCY3JnWjRna1RJcU4rMEJ5dkMwaDQzeE4wVVdpNDhDUmNiM0E4RVVn?=
 =?utf-8?B?S2tQcnZRVlRkSDNjaTBGc0NQVjNDdTd0TDlUOXFXMS9yTmFVNmVrMlZUc0t1?=
 =?utf-8?B?ektYV0RJWWVTS2E5WVNMR3EybGF5L1c1MWpaUzNhcVNnekJWaUFlY2wwaW92?=
 =?utf-8?B?TFlQbjhnZktZMTlFQ1RqbElCeThNdGllUDJGV3d3SnhBWDlyaXhEbmdSMHEx?=
 =?utf-8?B?R0VlMmEvclRNM3BqQlUvQTZMaE1EY3ZMeG9OOGJrNUpGakhVclhNRktscVJN?=
 =?utf-8?B?dWc2MHdURTgyYWJxVWcxL3JFcFFoVjZkaXRpSmlHK0tOMkl2UDE3SHFLTFJn?=
 =?utf-8?B?S3o1b2RDSnRNODAybUhRd1FFaGxUM3B0QWtSRHJGS0x2V2NQTzV2VGxzQThr?=
 =?utf-8?B?S21jVFhFL3JXc3o4S2wyQllzRDV5WEQ3Y1lWUk9Sb0k1azdzbGVPS1Q1dS90?=
 =?utf-8?B?bm9BTzMza21IdWJXaUkyRVhud2FCUWUrK1hOa1ZNeUx5eWZLMDB6VW1JU1dY?=
 =?utf-8?B?dDNpbzdIWjVjdXl2ZitmbFZUdy9YdExEemZnZVc0bzVIZTYyTS80S2x1TVgy?=
 =?utf-8?B?eXdzQzBOeE5mVkJKUXVlYzYxMjByazRtN1ljNXc0Ulc4cDhVcC9lSnZpVmNz?=
 =?utf-8?B?elhxNkxlRFhnak9DS0kxTEJPekVUSXQ3bi9qbnhXamdDbTZVVjFpeHE0aVRa?=
 =?utf-8?B?aitiNElvcUp3NjR4UVVoWnk5czdsMGRSdDN2ZzRia2lJRDR1aTZMT3lPODBx?=
 =?utf-8?B?V2xQUENUNW9VQ2dMVFY2cTdGdjdtT1NXYmFmNHlDNytKdnN3WmxiV09VbTl1?=
 =?utf-8?B?R1AwVytaN21GTUQ5WkowM2F3YVZMTThqQWVESlV5R1NDQTVESzcwQWFyRnVB?=
 =?utf-8?B?UDNNQnBmRjVHL2FXTnJ1ekt5dkJRWFI1TFk2T1NNODVFV0w4VEsxeEdGbDNH?=
 =?utf-8?B?ZDY3dUl2NGNnQTJmZEVtVDFad1VGNUppV1dqZGVjOHFKZHN4VG5qdFl4UUJs?=
 =?utf-8?B?QVY5SlMxbGNvZDNDWWdUa0pUUkdGSVovQjRZbjg5alRIbVBxeFdSalNjdlIv?=
 =?utf-8?B?KzArWXlYYzBTaURCMnZhcUNMb1JPWXV0UmJQWEthRjMwclZuazdoZU5qd1dz?=
 =?utf-8?B?ZkZRQzdOeG1kUHNjcmZqbTNObFZIUFhXMk1BY2g4K3lYVllyN05RNXFEQlpi?=
 =?utf-8?B?bUE5dXBPZC9lTWE5blZGNTJHQjIzYURnY1dzZzlWRnZwZy9kdGx0WUFTS1hx?=
 =?utf-8?B?SVJuc1FPNElldmwrL09qTGxlZndTbk44Y0dCTHQ4bVRvaGEyZW1lazlNdGRX?=
 =?utf-8?B?TzROUFpDbEpXTXBxRVQvbGYyNXcrVFZvdHJoeG9RRlp1UmVuNERFUzZQWFND?=
 =?utf-8?B?ekI3aE4xUWpxblh6NGFUdlJEeVBvcTlRbFFuOGtyK2JKWkhlZzN1QjRHaEU3?=
 =?utf-8?B?RmgvT0hEbmVGai9BVHlNL2k4aTVXNVV2S2hPc3c3eXZFVW5OQld4djZCYmlV?=
 =?utf-8?B?T2JZdk0wMnZrREdlN0J1TmlMWGgrN3JQVHZGMGpJU0Z1VnhqcEhxT0NwT09T?=
 =?utf-8?B?RmlrazNWUGlVSFJQWlBPbjZxcHJ1d09RVjVkQStFTW56RjFQQ3ozUzBkRnpJ?=
 =?utf-8?Q?XsQv6XZzdn0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnhWTFhVcmZDbFpQbjhONGJVME5ybWx1SGVuVFNOaE1nZnc1a0lUcitrWXh3?=
 =?utf-8?B?RnErZGJNSUlKNkxMVU84YytrZERVZzQ4c2VyeVZmakJPaEpQenFXQjYrSlp3?=
 =?utf-8?B?bU14dzFaQncwdVpBTjJDWld4K3luOUYvYTU4Y0E1L2thOXZhb09zT0JGNkFO?=
 =?utf-8?B?SHJxV0pCaEZ1WEpvdERKYTdkWU5nOUdhV0JkWFV2K3ZqSnFjNlNNSTNTYklB?=
 =?utf-8?B?OGhrMHJ4cDdLd1l0am5mdWpqd3hzeWQzR0VJNEU1N0pGTDdVRGpFZDZqL3l6?=
 =?utf-8?B?R3hMaWlLelg5anhkM3JVN2I0anNwRFFOVmxDY2pnZUN6WTlMbHBhcVlIVnBw?=
 =?utf-8?B?OHl3d05zUVpjaUlxQkMyOFZ3QVJTMHIxSlJ3VjIza3dLRm1uTmptaG5BNWhj?=
 =?utf-8?B?aEpwOWhBRGd5S0MydWVzNi8zZ1RTb014WFRuZEMwU0QzUlBLMXVBMHZBUm52?=
 =?utf-8?B?YyttdHBtOXBMVkVDeVhuVHFVNHZXTDFLemJIdFYyNkFxc1FmMTgxZk9JNm8z?=
 =?utf-8?B?WEhSNVRIRW1zZHFMRFhkMlZva2hvRE8vaXdvUUNTeFR4T2tMYkVJV09HQTZ2?=
 =?utf-8?B?K1czTS9HMDVqSDBwUVlNOE1Ya2ZpdEEzUXA1RXpwU2c5bW52MGNwZVNpNmZu?=
 =?utf-8?B?TEM5RENGaWZSMHBuT1JwMjF5ckRDWVlhU3dBNm4ycU1lVm5rZWlubnNNQ2Rh?=
 =?utf-8?B?ejIvUm5Fb0t0cCtGMGU5cURJNXIzN1RxbGo4ZmV2YmhrS3N6Y21pN0lacTJz?=
 =?utf-8?B?VUM1dWZ0SEtRV1dwL0xpVTJ4TmJpZUFSS2NGdDFqV1hhZ29WNXEwM2VoU243?=
 =?utf-8?B?QmNrVkpnYXp4d2x0V2I3N0x3UnYwTDdKVDIrd1ZYQmxSUWZqcm1OMnU3LzF3?=
 =?utf-8?B?WGw2ODFUR3Z4WXFzdHNjSDQzeUc1a2l1eGR3eURWTFY5bTRtZVJGQjVsN0F1?=
 =?utf-8?B?amVZekxPMUx0c1I0dlBBN04xZVJ0OW1zZnNMcm94MzVoZVlSVmZqQ2VZTDZ2?=
 =?utf-8?B?d21xTVJZZ2NiM1pCNzd3QWh3azEwWklIb2g3V1h1N2p5dnJFRnY0Ky9lckxr?=
 =?utf-8?B?WkorQi83WjNqOGpMV1hCWlp1MkVNU29XYWxaUmVLa1BpRk9jM3dIV1R6MHM2?=
 =?utf-8?B?d0lGMmRjREFpQlpWcVZ6MjloVFNEVERLU0VBQWhzdkl3eVgySnBOVFUvMEdI?=
 =?utf-8?B?V2dLQ2xQWDZOZFY2WVdteDdsc1QwWTFRVmRjOFRkdmwwb2FBTzloclpqYVYz?=
 =?utf-8?B?VDUweitXb0M5TkRhNVV5MmNmRFZ2VHlVUm4xMGNYdWYrRW1maGJzTVhOenZr?=
 =?utf-8?B?TkQvRnN0eDF6SHE5NndSUEdkdDNidlNhSzNCQ2o1SmZKa3RxdGpia2hiQlhZ?=
 =?utf-8?B?MVR5WDNEZmpVS1RXNnd2ajYwZjZhdUlIN1phczVObUlMYW9uR1BCK01YR3hs?=
 =?utf-8?B?WHcrcWQyS0t0NU05Q1lnM2hUbDdjZ3V4aUNFL3BJbFhNRmdZUGtkZkh0aGQx?=
 =?utf-8?B?T0ladWVncFEvMmxSKzBzSVB0Ry9Tc2U0R3JUK3EvY0hJLzdGQ1pPRUJnaDJI?=
 =?utf-8?B?dEh3MDREcEtzT1FFc3RtV0xScVN0dEdUekEzbzBaL3JsN00ydUlPZHRoK1dE?=
 =?utf-8?B?R3R5K1NMRnFyL2U2dmFOaWtIRmdwQ0RQVXhHSnB4cysvckZrMUxBY0d6UUVF?=
 =?utf-8?B?ckZ5bmdHMnpyeWtmcE9NdWhibldnZFdSd0dhMk9leTBvTFpBTGdkZ29GckhG?=
 =?utf-8?B?NXU2SVcxODFZYnJ6MWlkVnVOejQwOVZxeEdFRHdCemNKRVhVVDdXdlRBcEQv?=
 =?utf-8?B?YnlWUnFvMzB4aGlEajl4N2FJRERKTjNOd2FlQzc5VXlwbWFvcGVVN2VsM1Br?=
 =?utf-8?B?Sy9EWmlPU3BWZjVGcStuWCsrbTlHMkZWcG4yMFN5aVBKdFVJL1ZYNnRSa1dw?=
 =?utf-8?B?dWV1Z1FkdEprMStnV3k0aWtRL3hPU3VLaVp6NGIyTktpVjk5V3Rwb2U4eFda?=
 =?utf-8?B?cVltdVg1Q3ZLdU9kMTRWVStONDBlUmlrZjB1SHl1TkpYYmkvRGFCSXpDSy94?=
 =?utf-8?B?UVM2aWNBcGREV3FJQzN4VCt4V3ZvcmNQME5wbXZCY3FqTzdRTVpVNEtJaWNq?=
 =?utf-8?B?R2d4YUorU2J2UjFiaTJkY3ZCczRZT05qaEdGT2dtelN0cXdBVVg2QUJ1L2ZC?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d9a72f-80fd-496b-0a4e-08ddb93ecd59
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:02:34.2033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEKrakJ+NkZM7VKADnpG3fcj/4D4DKMOLN8lX3Kvqwhf94vDUugEbDSsG27jebDiP5c2i/iUMLaaruWJ+e51vsDM6kbDfUsOyrP3sSCUHts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7486
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lip-02 00:00:52 +0200]:
> Our LMEM buffer objects are not cleared by default on alloc
> and during VF provisioning we only setup LMTT PTEs for the
> actually provisioned LMEM range. But beyond that valid range
> we might leave some stale data that could either point to some
> other VFs allocations or even to the PF pages.
> 
> Explicitly clear all new LMTT page to avoid the risk that a
> malicious VF would try to exploit that gap.
> 
> While around add asserts to catch any undesired PTE overwrites
> and low-level debug traces to track LMTT PT life-cycle.
> 
> Fixes: b1d204058218 ("drm/xe/pf: Introduce Local Memory Translation Table")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index b56437a816e4..381f576036d0 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -78,6 +78,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>  	}
>  
>  	lmtt_assert(lmtt, xe_bo_is_vram(bo));
> +	lmtt_debug(lmtt, "level=%u addr=%#llx\n", level, (u64)xe_bo_main_addr(bo, XE_PAGE_SIZE));
> +
> +	xe_map_memset(lmtt_to_xe(lmtt), &bo->vmap, 0, 0, xe_bo_size(bo));

We have a dedicated macro LMTT_PTE_INVALID
Maybe it's worth using it here.

I wonder why we care about cleaning LMTT only during allocation and
not in lmtt_drop_pages and lmtt_destroy_pt.
To be precise, in lmtt_drop_pages we do lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid),
but from what I understand, this is missing at the lmtt_destroy_pt level.

Thanks,
Piotr
>  
>  	pt->level = level;
>  	pt->bo = bo;
> @@ -91,6 +94,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>  
>  static void lmtt_pt_free(struct xe_lmtt_pt *pt)
>  {
> +	lmtt_debug(&pt->bo->tile->sriov.pf.lmtt, "level=%u addr=%llx\n",
> +		   pt->level, (u64)xe_bo_main_addr(pt->bo, XE_PAGE_SIZE));
> +
>  	xe_bo_unpin_map_no_vm(pt->bo);
>  	kfree(pt);
>  }
> @@ -226,9 +232,14 @@ static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
>  
>  	switch (lmtt->ops->lmtt_pte_size(level)) {
>  	case sizeof(u32):
> +		lmtt_assert(lmtt, !overflows_type(pte, u32));
> +		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u32), u32));
> +
>  		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u32), u32, pte);
>  		break;
>  	case sizeof(u64):
> +		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u64), u64));
> +
>  		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u64), u64, pte);
>  		break;
>  	default:
> -- 
> 2.47.1
> 

-- 
