Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD929C3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 10:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938C010EA0C;
	Fri,  9 May 2025 10:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SynE5uH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4739A10EA0C
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746786751; x=1778322751;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e1mePrUeQXzIZmTuQyMwcn7Ql/6rjWuKXAVYnVPsxBg=;
 b=SynE5uH4b5ElqwVbcVw4Z6cHkDGtAKmNyoTCzeLvUDLiJgZD+fichE07
 yuZOiKWey8etS4WgT8qLBgQyciDot503hRNhBPEKhzwjtMkX6kIjQgNM5
 /jnq4zQ9Tvy9XZMh8YyAOv46Hk2ksLLLV0zte+rncHIlj9kwN4LVOettl
 4MtVAHWZyiUxknYYa+mCjRFDRLbzzhi4yb20D0nSbxmshqJfU5pP2weSj
 ouisNUSSnFyFLbwBPb1hTEASUjSLhqi5SDtabQYS0mVWXmnIHAsUEe+hO
 YoSsPact5f+z12S9ZHL0a8lzg9w9CbsFJXrKJP2rAzc3+JbiVp7Vo52Xv w==;
X-CSE-ConnectionGUID: r6K7n2YVR4CS6Uoc5khMzQ==
X-CSE-MsgGUID: YcUo0r3iQrmRyr5mPE3ybQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51267101"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="51267101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 03:32:31 -0700
X-CSE-ConnectionGUID: feaLfk6JR3G1DLm4M9pBqA==
X-CSE-MsgGUID: xK/wwRczRyaeJWbJWzJDoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="141528735"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 03:32:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 03:32:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 03:32:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 03:32:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSSxf9LQqWmb0g4AX6NBsyrFV9vd/YuRAJ4BFxqjzp8+FqTXPzgLWc9sADvsMa1HA8OoRs3J2HdyoyKEclkAGewinNmgc/a5A0S/hDu+xePSthtphlLLEEwY/dj1RPsf0ddIaK8oEuqtflM4v5FpmVHXjxUUnS0wtaBM38DxDfsA8DyPbf1L8gf3Hq89ckwS6U3bVOAJrSoE5KnDH2WLobIyEJDBZvUqO9K1P5vLx8C2txW5vu/1356XgE/WF0xGx2Gy0tyAmhEM1WFRAQXPKCcx3XZXWTimgNsif6VzcXXaVSMQ5V6aM55iLINMDxbqCd8BCVirxBIZ6cD1AJzBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppE3wi/VfLmb606+Iw9R3JKpMpmohaBhl0pwxXDd0aY=;
 b=DG+NMXD5sejF/1kwjW/5CIOXw5rXJJ/qLRk+0tvny936m7Kv8EUf1DsnybYpOZ89QG0qyM5ilLiNc3CpwImtCPQ4mYgfOSegCECB1oCifye7LDHoQT4PPPpia57Y+1aG6ZALsTyX3/Xun682LjLRnJdf5XO52A1bLyEcY0KYsOyJaCQfQxwPcee8ZPglRrePWPv8FUbWDoLJZxOup8yGXVV9exd9Am2Un+q9ud8OFQTTUk9tFMlsXVa+dzsDwfDnfvL1iS1/eVP9gBqc7VI/zwxCO84cmWcOf5W20o2mefE+LxBQJCzGqXl7FytJoFWkR68+lJ2OCgQroKWs4NkrZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 10:32:28 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 10:32:28 +0000
Message-ID: <6c321500-bbc2-4a74-82af-cd5453e81c4d@intel.com>
Date: Fri, 9 May 2025 16:02:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm/xe/hwmon: Add support to manage PL2 though
 mailbox
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250509095157.340680-1-karthik.poosa@intel.com>
 <20250509095157.340680-4-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250509095157.340680-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f95fe63-77ba-4c99-4cc2-08dd8ee4cbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUZuSW1oZEJFMVBld1QrU1EyZm1ZZFJ0TmV4ZlJ4Y25RcER2cDRQVCtDVmJP?=
 =?utf-8?B?dnpmazdGNFpiWWhmeVQrS0xsS1FZSXJ1a1d3K0M2V05VbDhIaUY4d3h1M0Iv?=
 =?utf-8?B?ZWtOQ0VOZk51UzlVQVRiTTVKUVRuRjFRMUd6Rm9ZdDhJU3NBNWFFMmVzejQy?=
 =?utf-8?B?OG81WWo5eGwwcW9WYTdWTjYxdWJwZmpQd3c0ZjB4RC9rL09DVXI2VVVxSXcv?=
 =?utf-8?B?QjNNcHFDZ3RQTVEwTXBneXhXQmh6dm1VREVBdWY4U1NNcnJINVJ2ZW9SUEVy?=
 =?utf-8?B?Y1BZS25UYjZQUi9xR1I3VDQrczdKaUl2MDhNSThoNjBtUjY1WWJrK3NqcUh2?=
 =?utf-8?B?MlJqbnhETnppRGpyK3g5cUNLdVdBSGEwL052a0k5cHJzYnBYYlNzRUNaLzBa?=
 =?utf-8?B?ZWRMUWhJS3JEM2RqYk1sSEJhbDFWRWM0SWFyNEZ2SEkrQTI4SE9laXBDZU5I?=
 =?utf-8?B?MnE1aWk1aGpreXFKVnE4RWp2OHR5RVIwRmhHUFlQc3ZZWUM5N1lxL3lORk1y?=
 =?utf-8?B?ZEdrZDR1MGdYb2doTjRHWkFKbFNyeVBCd2VRd21pWExHLzM1OHBGaEphOVdS?=
 =?utf-8?B?ZTdYSjMxN29kSWhFMlV1c2Ruakd1SHE3K3pFazFieDF6M044M3AyT2NnNHdH?=
 =?utf-8?B?R1RnZTZRVTBzUGhWTzMzRWMzUnk4eURlYjh3TkU2VEhsWnh0M0NwQ1FwdURM?=
 =?utf-8?B?Y2RZdmdGNEExNnNWNVcvNFB6S1diaS8xR2haUnRjTFhRSFAzUUJsU1d1NXFV?=
 =?utf-8?B?c2MxMG9Hbit5SCthWUsxeGVlQmIzaVFQM24wQ3FzOFVlQTNCM2poZWFOaTBj?=
 =?utf-8?B?VHNlenhnR3ZrdzRMdENpT0tlUE9IWnNwMFVaZktacmswL0cyL2NUWmlGVitz?=
 =?utf-8?B?V21vOXk3WTAyMnZmT0dMOEQvTW5hY1VrUEtTNzBVYW9ZL0IydWk3VndSMUE5?=
 =?utf-8?B?K0pOVksxTHFnc3lrbllqMnBxNmhOVmZUS2pmdTJjZ0l4b242NkVGVVNEaW50?=
 =?utf-8?B?cmx0Y1VrYVY5enNwOEhXTlR6U3h1czJHMzF0WmhsV21QNythakVxcTV2cm5u?=
 =?utf-8?B?TzRVdEFON21BNUFXUzB6UnczcThaOTByQ0FseTd2dFBiY3I1TXkwWStDcWpH?=
 =?utf-8?B?aWhzSFkwTUlmSjZUUXU4MnF6SmNCbktsVzhTTE5qakRLRnhNM1c2a09BaDRs?=
 =?utf-8?B?OTRKMWJWbnY0MXNaSzhGRHdPOGdHMkJVUFI1c0JGWFplMmxKR0ovL2Zobkc4?=
 =?utf-8?B?T1prTFJ4WXMzVDdYdUF3b0lQRjFpbU1va3d3WDdWZE4rV2srcmFwUTE0SlFM?=
 =?utf-8?B?S3p5M1RWdFRjZzBoRkpBbmFuSjVqOElzZVp3L3JCUUw2SHVRV1VsTytzRlBi?=
 =?utf-8?B?cmp2L083b3dOSzh2bE1xRGYzWXN6eXh4bDZVVG5EcU1MVmp5b1RrVFRwQ01i?=
 =?utf-8?B?VENrcFdFRlA3ZDBzZ01RNUdscUZxRUpnVGhwbTR0RUxVQm9Ua3JzMFpWK0c1?=
 =?utf-8?B?RTExV3pHalNDb2s4b01GUSt0UWYzVjZiekp1dnlSYjRUODVBUi9pdTlYK3Nj?=
 =?utf-8?B?UmVyVFNxM3M4ZEFyaEsyVkdvSC9UUFFqNHdSZk03bmZycFRodmM3eXFQbkdN?=
 =?utf-8?B?aVFSQk5xRVVqUmdJOWZJOSttdDlxOFVIRUlxOVozbDJnSFdRalh4L3VCLy8v?=
 =?utf-8?B?V0tSV0NZTVhFelBEbEtuL2tzU2tXM2V5UC9id2FzTEtNU05RWkJTQVNlMi9D?=
 =?utf-8?B?c0g3RVlhRFhvZmhzenNqU0k4L2hQOE1oWEt3MXJaSzJFcWJ5THBiU296NDFK?=
 =?utf-8?B?TnZBRFJjaXk1cHROendxR3JpdUtlMloybTBXbjArcEs2VmcxT1RwRE8wS1cw?=
 =?utf-8?B?aHJFdUVxdWZUOW5jQVJKSk5lbG5PN2tQcDl5NDJJV1FxMnd0bWlxNnJPSGp5?=
 =?utf-8?Q?H3BksuEPmww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymdxc1B5czdybU5nL1Zuam1MaVpTdWFENnl0UnZaUDV2VDFkdTMvWjVrYXJ2?=
 =?utf-8?B?OENtRWZrWWJLc1RqUEd2WWZMbGxVNEZGeHdnOFVMc3dIZlRkK1lWZjRYdFpm?=
 =?utf-8?B?K1JDNWFSSnlLWFlocGFXaU9HMmhRMFgySXUxeFlIUE8rRDlwWXd2QVFiMjAr?=
 =?utf-8?B?MFl5ckw1VXZ1R0krR2M4T0ZoKzZNekFhUS9wV3NwdFpFSWhzcU83ZUY5b0RC?=
 =?utf-8?B?cldyeFJ6eFVMVG5XM21mMTdPaFlHb0tsSk0rZVdCaWczQXN3ZUZ2cTB0d3J0?=
 =?utf-8?B?ZkxhT2hFODQxc0pCTUJzSDBydmJmL01oZWRuSEc0b2hPYUdPRVBzM0o1OHFF?=
 =?utf-8?B?aVBoeVUvU1JSQnFoZnpIQW5FOFBzTHJ6c2crUEhMZjlrUnpJYmkwYytiTVFL?=
 =?utf-8?B?bHNpL0pROUNNMlZPZHgwWkhWYU1EZ1lYRG9ZWnZFT05GYmtja2c1NzE1VXZS?=
 =?utf-8?B?NVlkU1JQSVpsbyt2WHdJcUEyNGd0SDdJbXlvN1dDemxYd09SaUp1T2dmcWZH?=
 =?utf-8?B?NjJUdFdFWWZrU0RsR1pCZXFNUWQ2K3VoOXNkZFg0c0ZheEJUb1A1OU1VREEv?=
 =?utf-8?B?U0FqTGtkZmlSOTJHOFZ1S3ppVnY5WFJZVDBDSDJSNjZxM3FGOW9Fa3ZWVTdq?=
 =?utf-8?B?Vi9vT3MxajJtRlJrTTc0QVBmdk5UTGJMdFdzbzdtYmsxWElEUXVtci82YzFW?=
 =?utf-8?B?d2F0ZmozN1FUOGhpdVcrMmNKQzJwQnFEb1N2VG1vblRETHl5TkhYcjJyNWcx?=
 =?utf-8?B?eUQrUTVaRk9HdWU5cDNBcmNHbWFBV0kyUUJKZGo0dmlzeGN1dzl6TFdYRDhs?=
 =?utf-8?B?bTA2WElZamJVUXFZTC9aZjBNdXVUQ3Q3QUh6ZkVONm5VckswQktVUWM4bXVE?=
 =?utf-8?B?T1A3V0ZuYk0wTGt2S3pqamI1QSt5MVhLcTV5dU44SGZOL215VEV1R0dxanBD?=
 =?utf-8?B?NDFWMTJCaXgyeTZ4Qzc0WXM2UnlRYXZMMzJHMGNCWGRsN1dUbU9DRUNid21p?=
 =?utf-8?B?Y0pHSXFjZkl0WkhiL0IwelFET3VqVUVwaWxrQ1JvZ1ZibVlVN3MwamRyc0J5?=
 =?utf-8?B?d204UjdFeE9ycDAyNFNIenRNakkxQkNVSUsySjlpdnlOSEVFdlVzRVF3VWF6?=
 =?utf-8?B?SEVYRU5JaFNrVHdGTXpiRy9GTVd3TVR5T1ByZnMvcGJQNzE3b04zcFVyL3Bt?=
 =?utf-8?B?cmJjOHcva0ZxZ3VXb2IrL250b3o5cnRZcFRqL1pleWc1WHg0UHdMMklXaFJh?=
 =?utf-8?B?RU93bmEzd1E1TktnRk9kSXpxcWJXa25lUTZ5ZlBjUW1VV1lZMHBpaWYvTStD?=
 =?utf-8?B?eVB3bG5iNGdwWUtzV05maVd6eHZuZnRVK3JxTW1rNGR0bG85MlFINHUwL04r?=
 =?utf-8?B?RzdjUWV6d0lhZWlhNFdPcW9IVGNISTNSampsMENnd2c1N2xCWXdRRkVtNklj?=
 =?utf-8?B?cyt3dEd6c0kvYS9peXFVeUR3a2lTVFFGSGYzWWp5M2RadFAxejA2SzhiTGpF?=
 =?utf-8?B?Q05LU2hnQ0YxaEtNbkZ6N1NDN1lQTDIzNStOb05nUTl3V3k1OEkyd24xK1h4?=
 =?utf-8?B?SFRRWmQ0aEZCeVh6eEE5S3ZKUk5pQkRYVnZDZ1FuM3l4UzIwd3QzWGg3Z2FB?=
 =?utf-8?B?bEZINDJqeTA5b0NpcUE5MXhldytPZmdSYnBZUlVPZTQ0Vmkvb0Eyb09lZnVt?=
 =?utf-8?B?blYvNWVhSkZnL2luenpMR0kxTlJMdzJaTCtUZ3JOTVJBMjYrV0xJNUoxSzR0?=
 =?utf-8?B?ZmMrdW1RNlBmY3owaTRaVkxwczlJWkNGRjM3dng0bmFPclhRVGIzZ2YzaFpa?=
 =?utf-8?B?cHJhRXVXSTk0cWdwclNpcTlmdEVDRm5qTFJmaDRoWUJGVEJ3ZE8yUlIyWndV?=
 =?utf-8?B?YVJjbC9XSW0yL21HaHAvUmhqSXltSmxrN1pXd0x1R3RoRFNjbTIzZmtFbVE5?=
 =?utf-8?B?UHdtRFlpZVRjdTdCSWw5UXpJWng0ZmUrMU91Q2tVaVlmZXoyY0F6eGVjbS8r?=
 =?utf-8?B?RkhaR2FJTllnOGsxdnVidUFINktIcnpPRndJRld0U29IcWlOUjlva1V1OEwr?=
 =?utf-8?B?dGZwdWYzMW12UVBWMHVZU2VHS2x2TmVidGZiUmh4b0twWW0zb2FVYVp6U2hL?=
 =?utf-8?B?b0hwbXZuTFI4VGNrRTVIT0FFRzhwSSs1SW1lSXFUT0dzZ2tGUjZaTXNicW1i?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f95fe63-77ba-4c99-4cc2-08dd8ee4cbf2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 10:32:28.3017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvJpXsgg5XQVLiBpbyq+ReLJqDDq7LbdZw/b1U6VXmSq8jcIfhYTTI/JfnQeEquZTgeSNA4km2AdMtBrD+6/QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
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


On 09-05-2025 15:21, Karthik Poosa wrote:
> Add support to manage power limit PL2 (burst limit) through
> pcode mailbox commands.
>
> v2:
>   - Update power1_cap definition in hwmon documentation. (Badal)
>   - Clamp PL2 power limit to BIOS default value.
>
> v3:
>   - Activate the power label when either the PL1 or PL2 power
>     limit is enabled.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 30 ++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 74 ++++++++++++++-----
>   2 files changed, 84 insertions(+), 20 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 5a91dcccd3ac..dffd6443664a 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -148,3 +148,33 @@ Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. Fan 3 speed in RPM.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
> +Date:		May 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card burst (PL2) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically milli seconds)
> +		exceeds this limit. A read value of 0 means that the PL2
> +		power limit is disabled, writing 0 disables the	limit.
> +		PL2 is greater than PL1 and its time window is lesser
> +		compared to PL1.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap
> +Date:		May 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Package burst (PL2) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically milli seconds)
> +		exceeds this limit. A read value of 0 means that the PL2
> +		power limit is disabled, writing 0 disables the	limit.
> +		PL2 is greater than PL1 and its time window is lesser
> +		compared to PL1.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5ba800b35969..4de79b0d5c49 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -51,6 +51,14 @@ enum xe_fan_channel {
>   	FAN_MAX,
>   };
>   
> +/* Attribute index for powerX_xxx_interval sysfs entries */
> +enum sensor_attr_power {
> +	SENSOR_INDEX_PSYS_PL1,
> +	SENSOR_INDEX_PKG_PL1,
> +	SENSOR_INDEX_PSYS_PL2,
> +	SENSOR_INDEX_PKG_PL2,
> +};
> +
>   /*
>    * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
>    * not supported and below are SKU units to be used.
> @@ -72,8 +80,9 @@ enum xe_fan_channel {
>    * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
>    */
>   #define PL1_HWMON_ATTR	hwmon_power_max
> +#define PL2_HWMON_ATTR	hwmon_power_cap
>   
> -#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "Invalid")
> +#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
>   
>   /*
>    * Timeout for power limit write mailbox command.
> @@ -124,6 +133,9 @@ struct xe_hwmon {
>   	bool boot_power_limit_read;
>   	/** pl1_on_boot: power limit PL1 on boot */
>   	u32 pl1_on_boot[CHANNEL_MAX];
> +	/** pl2_on_boot: power limit PL2 on boot */
> +	u32 pl2_on_boot[CHANNEL_MAX];
> +
>   };
>   
>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> @@ -151,8 +163,10 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>   	/* return the value only if limit is enabled */
>   	if (attr == PL1_HWMON_ATTR)
>   		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
> +	else if (attr == PL2_HWMON_ATTR)
> +		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
>   	else if (attr == hwmon_power_label)
> -		*uval = (val0 & PWR_LIM_EN) ? 1 : 0;
> +		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
>   	else
>   		*uval = 0;
>   
> @@ -180,6 +194,8 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
>   
>   	if (attr == PL1_HWMON_ATTR)
>   		val0 = uval;
> +	else if (attr == PL2_HWMON_ATTR)
> +		val1 = uval;
>   	else
>   		return -EIO;
>   
> @@ -328,7 +344,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   {
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	int ret = 0;
> -	u32 reg_val;
> +	u32 reg_val, max;
>   	struct xe_reg rapl_limit;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
> @@ -356,20 +372,24 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   
>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> -	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>   
>   	/*
>   	 * Clamp power limit to card-firmware default as maximum, as an additional protection to
>   	 * pcode clamp.
>   	 */
>   	if (hwmon->xe->info.has_mbx_power_limits) {
> -		if (reg_val > REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel])) {
> -			reg_val = REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel]);
> +		max = (attr == PL1_HWMON_ATTR) ?
> +		       hwmon->pl1_on_boot[channel] : hwmon->pl2_on_boot[channel];
> +		max = REG_FIELD_PREP(PWR_LIM_VAL, max);
> +		if (reg_val > max) {
> +			reg_val = max;
>   			drm_dbg(&hwmon->xe->drm, "Clamping power limit to firmware default 0x%x\n",
>   				reg_val);
>   		}
>   	}
>   
> +	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
> +
>   	if (hwmon->xe->info.has_mbx_power_limits)
>   		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
>   	else
> @@ -453,8 +473,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	u32 x, y, x_w = 2; /* 2 bits */
>   	u64 r, tau4, out;
> -	int channel = to_sensor_dev_attr(attr)->index;
> +	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>   	u32 power_attr = PL1_HWMON_ATTR;
> +
>   	int ret = 0;
>   
>   	xe_pm_runtime_get(hwmon->xe);
> @@ -507,9 +528,9 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   	u32 x, y, rxy, x_w = 2; /* 2 bits */
>   	u64 tau4, r, max_win;
>   	unsigned long val;
> -	int ret;
> -	int channel = to_sensor_dev_attr(attr)->index;
> +	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>   	u32 power_attr = PL1_HWMON_ATTR;
> +	int ret;
>   
>   	ret = kstrtoul(buf, 0, &val);
>   	if (ret)
> @@ -587,11 +608,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   /* PSYS PL1 */
>   static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>   			  xe_hwmon_power_max_interval_show,
> -			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
> -
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL1);
> +/* PKG PL1 */
>   static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
>   			  xe_hwmon_power_max_interval_show,
> -			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
>   
>   static struct attribute *hwmon_attributes[] = {
>   	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> @@ -605,7 +626,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>   	int ret = 0;
> -	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
> +	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>   	u32 power_attr = PL1_HWMON_ATTR;
>   	u32 uval;
>   
> @@ -637,8 +658,9 @@ static const struct attribute_group *hwmon_groups[] = {
>   static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>   			   HWMON_T_INPUT | HWMON_T_LABEL),
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
> -			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
> +			   HWMON_P_CAP,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> @@ -763,9 +785,11 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> +	case hwmon_power_cap:
> +	case hwmon_power_label:
>   		if (hwmon->xe->info.has_mbx_power_limits) {
>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> -			return (uval) ? 0664 : 0;
> +			return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
>   		} else {
>   			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>   				       channel)) ? 0664 : 0;
> @@ -777,11 +801,9 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
>   					       channel)) ? 0444 : 0;
>   	case hwmon_power_crit:
> -	case hwmon_power_label:
>   		if (channel == CHANNEL_CARD) {
>   			xe_hwmon_pcode_read_i1(hwmon, &uval);
> -			return (uval & POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
> -				0444 : 0644 : 0;
> +			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
>   		}
>   		break;
>   	default:
> @@ -795,6 +817,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_power_max:
> +	case hwmon_power_cap:
>   		xe_hwmon_power_max_read(hwmon, attr, channel, val);
>   		return 0;
>   	case hwmon_power_rated_max:
> @@ -811,6 +834,7 @@ static int
>   xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
>   	switch (attr) {
> +	case hwmon_power_cap:
>   	case hwmon_power_max:
>   		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
>   	case hwmon_power_crit:
> @@ -1137,7 +1161,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
>   						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
>   		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> -						    &hwmon->pl1_on_boot[CHANNEL_PKG])) {
> +						    &hwmon->pl1_on_boot[CHANNEL_PKG]) |
> +		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
> +						    &hwmon->pl2_on_boot[CHANNEL_CARD]) |
> +		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
>   			drm_warn(&hwmon->xe->drm,
>   				 "Failed to read power limits, check card firmware !\n");
>   		} else {
> @@ -1149,6 +1177,12 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>   							 CHANNEL_PKG,
>   							 hwmon->pl1_on_boot[CHANNEL_PKG]);
> +			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> +							 CHANNEL_CARD,
> +							 hwmon->pl2_on_boot[CHANNEL_CARD]);
> +			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> +							 CHANNEL_PKG,
> +							 hwmon->pl2_on_boot[CHANNEL_PKG]);
>   			hwmon->scl_shift_power = PWR_UNIT;
>   			hwmon->scl_shift_energy = ENERGY_UNIT;
>   			hwmon->scl_shift_time = TIME_UNIT;
