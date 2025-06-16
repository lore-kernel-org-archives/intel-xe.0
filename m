Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47387C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 16:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA72410E0ED;
	Mon, 16 Jun 2025 16:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWyOPtJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84F410E0ED
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 16:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750092120; x=1781628120;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1znPc70a51zGUKlRPlX3l0Psjl8jy7gZAMghV+LDbV4=;
 b=IWyOPtJvk4UOmcEYzJK7CC+kDK/9IpATHOeKqgvEQgr26SqE6F2Hm3Jt
 6GYxqxOQJ2q+YJTae7yzczrDYxPwHlBLgaqAa2VJNyWR2Mbt03/FJhaVj
 vpP2ZloHZqPjcIFP06QntsExlqSksYnaBKADNUllg02ckrAo9BSCR5SjI
 DDpwMWITXfMDpJFMkLnMcm/kyaVq/L4tFBojHeDQj7BK4k+PCPyYV/Ucu
 V0LiJ73z2bPzrqzMaTKk++Z5/Kn6Kbsf6xogJZ9JJGZ5z75TZrWcQZnqI
 yy49lowbcD8VLEWL8tFX1hyYpyEwZt4PpP6M7T1v0rmAXFPlDUcvpa9v8 A==;
X-CSE-ConnectionGUID: 8j8YpnHUQmOGCA16ewJwOw==
X-CSE-MsgGUID: JP2QOk/FRTicP0IXgUy16g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62849445"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="62849445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:41:59 -0700
X-CSE-ConnectionGUID: 62pCq3hETKOy3nZ1ll+x+w==
X-CSE-MsgGUID: 8JCYNGLATr+JO1Joyj8BqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="179510158"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:41:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:41:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 09:41:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pkx35g0lSD78hhJ3MageuDXBGmYjjOEfVaImXwrEX/PcLPNEvbNzcVkNSf3hivEI2r2H8UdILmorhM7V6DrHwGXFwplke1CVykKRrOVcv4Ym+U3YAVAglCxadr4g0MwVqaA75GPOg9SOFVjOxCqngYi4aRXfXy4mnkybfNrkdwejn+W+eaHxm4whYlCeKIR4Rjsul8BJZVqVC6T4koBvO4pct2WYMq1Btyix6xU9Wb+BKSqISYtOrbeL2QJqWINbgSLTk1PZE1sfE8+XAoMMss03PrCW6PFREmqeNU2r6s/LSxoQv51cweeVjeHYXrLkDWgn+1y+byYva9T378hBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8IdbPGSoXIcL+59ETe0O6/mK4hvKW9CAJeSFdIKwtc=;
 b=Vs0SRgJ1+HKy+X4kx9BqGo690pQ/BJT1/gLhTJKKZfZUubA5s0ZIhlMUhpSDG6eRFqJSKseih0RvMBPLo7rYah/aoH3q63bfWng8mh5yfyJVO8kNsIf4qhlwuOqL3Jnp+qpRO0WsFnPtduUkBLtcXqMaEK6d8/kK1dM6xyVG38jCdO+tX/GaVMXepZ54F7csmC07z9AwPwrREXX/6w4/kvZJzZKNGVgQrwDAkQBLYuLLVFrBdBmdWdKBDufa+v9vg1KkCYt3yMRq588IxXLWQs3nhBdBexeDAB+IIb+Hg1C8iGxw9pME8MOf5033FpFR3Q+7xW4DLIXBv8vcKEsCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7193.namprd11.prod.outlook.com (2603:10b6:930:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 16:41:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 16:41:54 +0000
Message-ID: <3ca022eb-cd41-43c5-9062-d1ef6070ab00@intel.com>
Date: Mon, 16 Jun 2025 09:41:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL,
 DG2
To: Lucas De Marchi <lucas.demarchi@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
References: <20250614015511.691610-1-julia.filipchuk@intel.com>
 <20250614015511.691610-5-julia.filipchuk@intel.com>
 <wgbww4noujwbpxydqqgjcbks22abbql23sigqg4v6c7t75hrhu@m6uhe22uuqdz>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <wgbww4noujwbpxydqqgjcbks22abbql23sigqg4v6c7t75hrhu@m6uhe22uuqdz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 861acb3a-5b32-4571-0b89-08ddacf4b3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTFsVy8xRzNld0V0R2Y2TnlVbi93T05ZZm9McklEZi9vRjZKUjgzeGJQc0pk?=
 =?utf-8?B?Q3NKcHJFWndGbG5WR3R0eDloYk1zRHREUEluRGloR0dhQ3JDbXRnbFBzR0RR?=
 =?utf-8?B?VWlobk1VK1craVRlVHdvYmRyNUNVVEVhUkFnRkNVaVpSUFpIRHJRYUgxRWFo?=
 =?utf-8?B?Y0lyazU0V010NkZoeG9OR3pGTk5NWlMrZ2dFVjRwcWErMWNCRFZRVUZnWHVF?=
 =?utf-8?B?Q2NzYklMYnU3THdvLzd4V1IrS1R0bzlNcHJta1p0KzVNaFM5ckhTZ2YwWEZi?=
 =?utf-8?B?VHNCRjQ4QVc5REJoT2hzWGtyUWRQNGxVUUtQTmhRMDE4Wmc4UzZJVDlmNUhl?=
 =?utf-8?B?VnpJbzFQcGVNcEZpbWRUS0hKczFJVUx3WEZxTmdUNTVuakR6MmFtZjdMUkFj?=
 =?utf-8?B?ZXU5Nkt1MU1PdmwxVVhCUUNiRjFsVEQ5QjRFenZONExFVnF2c1MrOFRvZ085?=
 =?utf-8?B?SE82Rzl3NTcwV1NGZk9QdG1QNHZ4disveDhYSmFaZzRPbjZKUlQ5U2MxeG1Y?=
 =?utf-8?B?MlRzNjFaNkxncFBhOFBkVmdFeCt4K2taSFFvOStwdnlQUlBuUXZpZUdOdHpo?=
 =?utf-8?B?bklFZ1ljUGFZNHQ1eGFkWk81Q1BNa2tpb2JuZVJ4VXNSWXFkcVhpRDJ4UDdn?=
 =?utf-8?B?ZnhIUVA2azRYS2VuaEFEbWVFQWsrQ0JtcDYvK0NxZVhseTNObTZkZS9MZ3M4?=
 =?utf-8?B?clZZb2xPaFlLY0hrNEExZmRQWEVUN0lJSnR0WlhqdytuYnRHYlU4Z3ZKVlFL?=
 =?utf-8?B?Sm1pdFNGRGJOeU9adVlpNy9VQ3g2djhTWEZUVGxVQjcra0xBbWRBTkNXRVZ2?=
 =?utf-8?B?VWl6Q3l3c1A1cUc5MnUzajQ3am9uN2s5YkFxS0JWZSsrWWRQZ1pYUEw5dWJr?=
 =?utf-8?B?aE1yVDY0Y2JVMWJ5Zk5VR1JDVkZacVI1ZXA4Z0ZtLzZ5ejVrSEJZTTRaRGxL?=
 =?utf-8?B?TXA3NlpRaDVrUzNueDBXMUY1bjRqT1VaSkdNZi9QZXVLa2VWWVJ6VzNSbXh0?=
 =?utf-8?B?QnBscng3UVpidUkyM0hXcDMwLzhxUlRyMVhQY2Y3L25DcWdYdzcwK0JqcS9l?=
 =?utf-8?B?bFNYMDBVeWNtVlhzbVpjOUxEQ0s5T0VBSitGSmR2Z3M0V3B6V2dua00yRTNu?=
 =?utf-8?B?M1B5NWlkc2ZuY2xYM1ZPUTQycEJkOW1QQkt6ZVFlemx1eEpVTk4rV3BoazdG?=
 =?utf-8?B?bSt4TXhwa285MVI3U2NjbUlnVTZMMlFsTVRVUUV3MWpXaVZJZE00N1d1eW1w?=
 =?utf-8?B?QXE1ejIwcUVmTFpjMW8vVTJEeXg2UE1LV0tiaXhOQnlaWlk0T0N2UERjNGJ0?=
 =?utf-8?B?TitiUHdkUWxYa1d5MDQ2Z0Q2RUdkRUpFNlBYY1kwbHQ5U0R0WThWOWo2YUpW?=
 =?utf-8?B?OGkvbGx5bEl3VTdMV1g4S09XNlZzL29ZRktDaWdicjhGbmJCMlpEWmIxZ3dL?=
 =?utf-8?B?WnAwNjBTNGdaZVlwNGwrUVRWdFdsQnBMVkU0bmxJM1kvL1ExTTJkeUI4d2xL?=
 =?utf-8?B?bjNzbUMyTjVHcHJ0VkJ3NkhIVTFXd3N6d3hBL2IxVS9yL0tzK3VIc05LNGVn?=
 =?utf-8?B?MU1yQWQyMUxUeVZzNit5dk9DOGtYKzU3KzEyR2NQOEFpNEVSYkFWWnJURkVx?=
 =?utf-8?B?SStzamFPM25NMHY1aHBTTnR3U0pZNGNIZTJaWURVZkdrTHRBdG00RmM1Myt5?=
 =?utf-8?B?M2hPNmVnZllFMmVncVo0Y1E4Z2ppbmNic1didyt1NlZtczdTVERPamFHYmZ0?=
 =?utf-8?B?R2hSNXBNanUwTTZTeHd3a2k2aTFtaHQybDg0WUxtNWJ5U3JNYmZxbzlsSG8z?=
 =?utf-8?B?cnptbHV5M0E5aDIzWHRBc0VORmVlMXBWbG43WTAwL3prTllseTdhKzhGR29W?=
 =?utf-8?B?L1NGbWdaUldaNEFmY2hGTTc1Qnl3bkV5NnlpNUxjcDN3YjlCZGdPbzhWb2lY?=
 =?utf-8?Q?Gq40bwmdZ8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU1xU1l6Vlp3YTVQNkZ0ajFLZjRtUTltaE9xZlpaY0xOeFBPY2x2eHBoajlP?=
 =?utf-8?B?Rjljcm9mSUREcXVrZ3dQVFE5WFBZOEJHelZnTEZDOFp4KzcrTHZjaTAzSGZU?=
 =?utf-8?B?MjB0aXQ5bFZUS0VyNnpSTEtSbmltQ2NER1JHRVQ2NzJDUUw5UFROeXdRNFZm?=
 =?utf-8?B?TlNybEdXTld5c3ZzK09pOGdLcytINmZGQmQ4QSs0MVR2Nk9mY3hQdThIZ0p6?=
 =?utf-8?B?bm1wSXpISGFNZnlYOGI1dU1ieC96U203ejJIU00xR2xPc0w0RXZaZ0hSUHNS?=
 =?utf-8?B?bWhiS3FHNU1Wdk1CRWU2YWlGT1NPbmM4U0t3ekhxWDc5R0xRSkx2RkhBb3JI?=
 =?utf-8?B?aEJIdEpMdzAwVXhmMll6VWxUdXNHWmxpMlFuMXV3cCtLUk5KQllNekFsaHEr?=
 =?utf-8?B?VTArTkZCd056eXd4NXVCeWI1Tkx3ZVNBZkhXZVlrQnF2WmJWU3Zsd1R4ampP?=
 =?utf-8?B?QnZ5elBNWWdORGFhT0hkZzJMVnpCdHNxQmRxdHFXMzhjdEhGcUtMMHg3bjNm?=
 =?utf-8?B?bGNCTlRkWnUrOUpncDQxYWIwemdDWjc1eFNmaUVJeDVlemI4aEZrTHpEMjdC?=
 =?utf-8?B?NkpGNXdsZHVxTTNNUTFWVFhVclplakFIcStmQ1prYUVPcFZzaXQza21nREdS?=
 =?utf-8?B?U1RCLzBWcVJuUlRYbTVFb0RqeldhZ0c2Uml5QWVaQTMwUmU4akgxTlB4eUxk?=
 =?utf-8?B?OWpyeEtGOUt4aCs4VFZvL01mOXRlQ0EzMlYwQWFzZzFkNzI0MjlWT21wYThB?=
 =?utf-8?B?K1N6S3h6cVVQa0dTSkNhMGNCeGxQQWhKdUVINFlXWGttYU4xUithc3phSUc4?=
 =?utf-8?B?cUExSDZWSlRNcWszbUlZeFFmYllTYm8zelRNOUV6aWp2NFRIV2MrVU50QS9w?=
 =?utf-8?B?WXZrZys0YXFVVzkzL2JpbXM4OURlUzQ3a0s3SHVCVWJURU1jTXpDeUo2SXQ5?=
 =?utf-8?B?ZlhqVllRZ3FuaTlTbGQ3WHZYNUYvbEtpYnIxN2lPWjh3V25BdVpkSjhtajhw?=
 =?utf-8?B?b1lud1RxVHZrV1dDOTVCYkQ0cTgzRU5yUEx1QVdUTlJMYlZlWFY5WmU4MjQr?=
 =?utf-8?B?RWNFbEpLN1lJV2VHcHJ6ampadTlrZ0s1Sk9CQ0o0bWtGMkJ2YUpaajl6eGdj?=
 =?utf-8?B?VjRsTXQ4azFCajlmbis3RkhSTE9VTmtzODcwTGVJNFJuRllDRE5HN28zalBm?=
 =?utf-8?B?Q0Z6bW5tRjZFYXp0bEVtcldjWW1vMGIwZXlZVGNNeS9jOXlPamZEMGJ2WHor?=
 =?utf-8?B?NHZkQ05UVFFNWkp2Mm85Z3IyN2k4ZkNyczRmRHVPZGRnTXJrYnFKSytrZjZw?=
 =?utf-8?B?dlY4bHdJV3dnMWtDVGRxMFdFTnRWZEtJQXk1aVNJaWpOTEtlNnVzUmg4QmhR?=
 =?utf-8?B?NGxrb2Q3R0pocithNUJKZGt4bVM0VjN3VlZ5SmxnR0VRQ3pUYUxCSThsODky?=
 =?utf-8?B?ajlLTmVkbjZKMmlOWWFreGtIOW93V0NLUlQ1eG81ZThWRkVvRXBnUzY5MFYr?=
 =?utf-8?B?NDZub2Q4NDJWNmJValNvOHBRNlpqdXpwdlRHcDI3a3l0clpJWFRuVU1nSXI4?=
 =?utf-8?B?U3N6bklya0xzTmc0WFp1THJ4VUpIOGVuYUxmQmJJTjhoZVNuNVNVSUJHMHUw?=
 =?utf-8?B?R1Y5WFJYUDdFcks1SS9mQU03ZGRud3B4MncyT0lZUUNQSWJKK2RaekQxVlNE?=
 =?utf-8?B?bTNPdVVEOENVQ09MM3EzWDVYa0xXcS9FaWUyWk9PTWJwdE5TUE1sWDZ0b29i?=
 =?utf-8?B?cDhzUUdVL0NFQlFCTUNHZ2gwVzFLTUhBdjVPbDVYQTQ4alA2cytPTWR3d1BO?=
 =?utf-8?B?ZzVZWWZOZmVwN2RXeldpYnVESy84OHZFNitDNEJJcVdaeE5pS3hHV09rWTI1?=
 =?utf-8?B?WGFFSkNiNkV6MHBzbTJPNVpKb3d4K3d0UFZXM1JVTTNBenJ3dEgwWVZJSysr?=
 =?utf-8?B?WlorQzlYeEFzYzRFOUl3U0FpNXNVaStOd20wcWJmMWkwS0lja1NoN0pIMFdK?=
 =?utf-8?B?TjhCNld3V05zYTU1SnZ3U0NDSTlxdHlYUGFMK284UVdKcDRWTmVpK2xqTWtu?=
 =?utf-8?B?TUVxUzdKSnQ1YytFL00xcFUwUmlCUTJpc0tEZGtnb2FnMjJEemxHUkxLRlc5?=
 =?utf-8?B?c1E5cEpyeFJPaWtiTCsyTDQ5SW03TUZJK3hVeXd5Q1lWZDVwY0VjQ0RTMTM1?=
 =?utf-8?Q?F0tvKrJpnuxkGlDxaI/DQ6I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 861acb3a-5b32-4571-0b89-08ddacf4b3d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:41:54.6783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idje+xugQjpHhJdtdAwkfZ6CyM08sktHmwC0uN73l7bL7fH/gCV6cam2RpDX5JVQZH86pXiPzKoh4DljEBts1OxWThlL41kBrNFqBf8JZfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
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



On 6/16/2025 9:33 AM, Lucas De Marchi wrote:
> On Fri, Jun 13, 2025 at 06:55:08PM -0700, Julia Filipchuk wrote:
>> UAPI compatibility version 1.22.2
>>
>> Resolves various bugs. Recommend newer version.
>>
>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>
> Daniele, from the previous  version you seemed to be ok and v2 is mostly
> for the way the patch was submitted, right?

Yup, the change is fine by me.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Also Cc John
>
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 6d08695186521..4d3ace56f38aa 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -115,10 +115,10 @@ struct fw_blobs_by_type {
>> #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>>
>> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, 
>> major_ver)                    \
>> -    fw_def(BATTLEMAGE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> bmg,    70, 44, 1))    \
>> -    fw_def(LUNARLAKE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> lnl,    70, 44, 1))    \
>> +    fw_def(BATTLEMAGE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> bmg,    70, 45, 2))    \
>> +    fw_def(LUNARLAKE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> lnl,    70, 45, 2))    \
>>     fw_def(METEORLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> mtl,    70, 44, 1))    \
>> -    fw_def(DG2,        GT_TYPE_ANY,    major_ver(i915, guc,    
>> dg2,    70, 44, 1))    \
>> +    fw_def(DG2,        GT_TYPE_ANY,    major_ver(i915, guc,    
>> dg2,    70, 45, 2))    \
>>     fw_def(DG1,        GT_TYPE_ANY,    major_ver(i915, guc,    
>> dg1,    70, 44, 1))    \
>>     fw_def(ALDERLAKE_N,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 44, 1))    \
>>     fw_def(ALDERLAKE_P,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> adlp,    70, 44, 1))    \
>> -- 
>> 2.49.0
>>

