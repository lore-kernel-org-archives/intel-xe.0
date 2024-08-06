Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F8DC3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 03:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD3B10E2E5;
	Tue,  6 Aug 2024 03:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGmsUxX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FF310E2E4
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 03:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722916641; x=1754452641;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s6xrwOpRnXlLU7hJNqEuzaf21R7HiTv2kAMnCmuaRiI=;
 b=HGmsUxX20fd7ijE92nnVGUC01sicW0PR0JLkO9vlrPO/vjvvY7hdHwRW
 geCAYAwWxbXFzAN6mFYg/wjYV07hOi7N4+PJ0vADeLYGA/G9KIFoT7h61
 WJxRqX8osn4RrjDD0YfAakJdUc/wT85Q/BbkXIfGOq6jwBRzCdOl2efdw
 MLMErUpxrL2vUEpuXeGFWdbInT6DAO5PI/Fc4L4zr9xAjVoSStmVo9anG
 QOGGg7nCPMdmzGcJeip/CY9nZf0N/svU8zFzEggylhdkvKpZ+IQqvv18C
 bNHGVblbq/xj8j782y5mjITIttmeGPILRFERSbaD2RniW4c4cW3bukgcw w==;
X-CSE-ConnectionGUID: BVNnA0SNTLeAblJyU/xV9A==
X-CSE-MsgGUID: xbvxfsVKRyKL7zNe5sts2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20726776"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; d="scan'208";a="20726776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 20:57:21 -0700
X-CSE-ConnectionGUID: jMGz0lH3RN6qFNMPhfTrAQ==
X-CSE-MsgGUID: JI52ADFqSgy0+E0su9I6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; d="scan'208";a="56302939"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 20:57:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 20:57:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 20:57:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 20:57:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 20:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDzzMYMa7yBzvW+nIGy/2GNfew4w0KywXepC7Bh/2io9Uiir6FxhVjKrDk/0cbfvpWSCmQ8HkD+zcIziZQyDHbhr0C9do4a5RR5DD+ICgq7bLrPR6mpsojcdndJb7nghXy9bd25XrowVn1EoVFfQZcgn67ieMmh+W0/+vQdUICEoySJCwpg0ByIlg0hv1qkQA4rWl32W0Z6XC1wIlGLD/rvFtkHo/mHshOX/igwGtmyTxnrzy0qEM5kFS55yq3sk2eIraOiH9DQjzVbFK0QJMQTY1bfmxHRtP9C+W0ZVJcfVw3WKD0xK1igupFwtPsBbRSx2sJTfmIs9R9qUGw4uNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1ySZMeRLlX7WDZIshtJ6+uaflg+8IrqnriGWuwAeZk=;
 b=X0ZWLFlAl5/F7N2sJ50zrd7DR02svD5EmqSN+fAyUXs9yELEKLepLrBAauRQfaB4ZDnQ7C6P3Fwy28J3CUefpXGDuSS7/Wygy/T35H2G+4iNJL+YmAgRpcCAkF7i57FWALG0Brfl/23Dmc4DLNfO4xZ8pt71A0See77+hOmsv3mhON+l9weg8HWW1juMUI5yyM5gnZYYHlGliDZFPAIYZexfjiQwCzn8/yiGHsb2xF47q7NQAeJ1oT6b3awYUzR9AFl6RrG9vIO6lXCdx/mu0d204KW9DJ/dMv8CuSc/+ZwqUPwIIPveSvw/RdMv4NTV3L3z9YejTOQp32XtpQ+8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by DS0PR11MB7832.namprd11.prod.outlook.com (2603:10b6:8:f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 03:57:15 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 03:57:14 +0000
Message-ID: <3579742d-d3e4-48bd-87f9-a9b29e81f243@intel.com>
Date: Mon, 5 Aug 2024 20:57:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2: Add performance turning changes
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240805053710.877119-1-shekhar.chauhan@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240805053710.877119-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|DS0PR11MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 5789c772-45ec-4b3d-86f8-08dcb5cbdb59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1pEbjJDM2MzL1ZkamtLMnI5ZTBCNklSZmxYSEdzYmJHWDlzL2creVRpeDVH?=
 =?utf-8?B?MC95M0NxeWVSMU5URThPaVFvcGRBQ090bmlWRk5xVjVjcEFJVGh0VThBQTRB?=
 =?utf-8?B?b1RVdUU4d1o1enBxU1N3ZWFaLzkxUDgySkZlcnRveUdtSldHUWdpTW82eW0x?=
 =?utf-8?B?dTdYaEcvVkVEZ3l6bWZIMWN5OGNEMTBmZFkzYmxXRkxiakswRzNIWHFMVy8w?=
 =?utf-8?B?Y2RQeDBZSm5KRXU1cTZNUGZkS3IyUDk4RktVczVPQTlDYmtoTk1xSnoyVmtn?=
 =?utf-8?B?NG5Wdm1tanFYenZBRVNKdVdFRkZnTWNCRklFVVlRM1IzQ0laZ2RpTnUrL3BB?=
 =?utf-8?B?SC9xK1hKbitwTnlqS09CMUREaGZ1Z2RSazhqcmRQM3FhdGFURi9JYkZGYisr?=
 =?utf-8?B?SjJMdkpKUW5XaUFDZnIxSWxVd2FtWGphVmdvOEZaU05OWTdUZHBMYXpwSHd3?=
 =?utf-8?B?VU5yTGUvK1ZLQ2VjR0JiRklneWIxVEc3eXplTW9XUUU0WmFPd1JlbWc3Yk9Y?=
 =?utf-8?B?MytiODAxOUZHL2tFR0JWYXhXNFhJNmFPOWdZc1JXYjRSTGlIRHcwdm1rbVBj?=
 =?utf-8?B?Z3ZxUTE0L29KWFFYSGxpNVhpaXJqUFE1NThqSVNSb3IxR3F6Rm4wc25NQ0Y1?=
 =?utf-8?B?NXUxMHhLYWRoQkkrKzRPdmtIT1g4K0xCVVZWRHlmZkR2Mk1RYnNkbDcrSVUv?=
 =?utf-8?B?Q1R4UmxuQVZjV0dPMkwyMGc0RGVxNVJaNm9KWm1KMnhNN243Z1dwK0dySUVO?=
 =?utf-8?B?OHVyMEszRk0yMnlNM2c2bWpXcFo3cWpNN2lSV0JqajJzd3owckpRQW9lL3hl?=
 =?utf-8?B?Yi9tWTh4WnNGL2JTN3VZVkNXaCt5NjdYYi9PTjdjZGVpdlMxMkpLZkIyL00v?=
 =?utf-8?B?b2NwOW5TWEludEJQbURtWlErMjFWVGxnTEV0cC9LS3d3ckRmNStEMHRaMmFZ?=
 =?utf-8?B?ZGllb1dJOXphbXpnTnFYZVgyNG9sVlJsOWtReVRwdHFFTzd6ZWZwaU9LTWRX?=
 =?utf-8?B?ZVVFVXRpSUprZEwya2tJTUEvR21lYWFQR2I0VUxrRkpMQURlTmFzMEdFRTd1?=
 =?utf-8?B?L3VmemdYWTltMDFBNjNCN3dDKzUxYnZCclF2elNldzZrZitablFyMHVQOGVn?=
 =?utf-8?B?WTNCeHltRXRuNFIvcE1SYTMwcW5MMnQ1d0x1R3BJMUxIb0UvVlp0by9IcmV3?=
 =?utf-8?B?NDdBeUpjTEpOOHJ5NTNZUDFCbHJuVjR2ZHllOWNma2I1NStGR1lYeStEM0pk?=
 =?utf-8?B?YnlyRksvV2huOHZmYTR5V2luQlZVWmMreFVhaEZvODZ5N2JaOXIvb01ndjZQ?=
 =?utf-8?B?L25VOS9heE90MTR1Q0t6bHpnclV4NGFWT3U5Wms3R0hkVGRodngxYU1kd0dn?=
 =?utf-8?B?Qm9McCtwd2lKK0t0bndZR3NGQU8ra1RXSm5LNnFjczY0QzJGSDFBQUxXQjgv?=
 =?utf-8?B?ODNyQ29YejhSbkQrTFozQWdYNyt4ZytpM0xuWEVJMmpUMFIzSTg1RmxTTkpJ?=
 =?utf-8?B?bzQxV29XVFFCZkwxSGh4UEJaVlk2MjZpbERKZ2Jnbi9Vcko0RElOaW5NNkVj?=
 =?utf-8?B?K0ozWGNEREtpZ2dTTCtXSUVGd0RxSjBWMW4xa2xvVjJjNkJUQTk0S2Fwc3hi?=
 =?utf-8?B?YzRidWQ0a0dack9tMW9Gc2wyK3Y1Q2lLU1ByZHVVRUx3TVpWWTZ3SU5IejZ6?=
 =?utf-8?B?MjdqNlc1SzZiN05KY3k0TGRBMDUvTGZybjI2bmo1MEZNajltZThNMlZtdlFD?=
 =?utf-8?B?T2FpMm5HR3pyaU05ckx4REVYWllFenI3SmNXNytyZ2pJQ0lQZ25remkzazRO?=
 =?utf-8?B?Q3dBNlFPYW9GbGJVbW1Edz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXpDUHNjV1M1a25xVFhpT1NqbzBuQ1RIekJEa2xpeUV3OWhWc1I1STNvcXFT?=
 =?utf-8?B?NjFZbkFsWnprTkZ2VkRQc3BPY0gzRlZ0T0xLWHE4UEtXQXJwbnVuQ3ZqbFNM?=
 =?utf-8?B?dEw4RmM2b1U1dkhGWGptanRlNFdMMm1OZGVveE04eU9KdjI2YkE3U2UrWCtP?=
 =?utf-8?B?SnY3UUN1d0xhVHpMVjN1MHdTdkQwZGM4bEZvR28xZXd1aGdTbXVRc2R6WGpP?=
 =?utf-8?B?US8wS2Y1c09PaC9tRWpMUi9SbTZVRSs3d2JFYVpWLzJFMWhqSFYxYmp6NlBS?=
 =?utf-8?B?b3ZqaXIxWTA1UVlQOFJLQVVnSWExbFVmQWtrakg2MURTM2ZZZ3NNNzRhbjVQ?=
 =?utf-8?B?bHVndXhoVE5XaGs1VG1GaUZIMUMvOHJXKzZYejFXNEdPZk1tRHdKbEJ2c3ll?=
 =?utf-8?B?bndwWkZmakUwUFhGQzFLYSs3MDlPUE1VRzRheFZmYkpObTg4RlVnMFltV2pq?=
 =?utf-8?B?ZUFiYTViSVlwckU2SktleUVHVk9hZzVuVWY2cGJpOXdmNWhzOUtCVnRTZjdu?=
 =?utf-8?B?NHUxMkFRakE0RHMwNXRjMVB6cHF2djI4bDU2bXpqRUlLYWRsalk4N1lxaGVq?=
 =?utf-8?B?WXpaclBMYW11UDJzVHVqQ3lJeHNaT1IzWnFRMkdVYWJ5VE9RdmtTTkhYZ1V3?=
 =?utf-8?B?RGlsL1ZReVU5UWdPNENFckd5eEdDTkkyaFBpbithekJDcjRXdm95UVJCRDB5?=
 =?utf-8?B?M2RCbllyTzE3WmV6T0ljTjk4M2g1eUEySTdnRTdVT0RmZG9EYWxzeG9XcW40?=
 =?utf-8?B?VzB3QmdwWDFZa3JJMVFVTmEzckRYamhYc21WdWs4eXlDRitHbE5vK0VteE1D?=
 =?utf-8?B?ZHcvMGhtL1A0WGl3UkVCanlXT2FGU3JwZCtVWEhsMk9rNlE5aUZzOWRVZUpQ?=
 =?utf-8?B?RVliVDJRTGZraVhpT1FtYzdWZlo0d3FIajArZVdEN0twYXpHRzZMQXNXK2E5?=
 =?utf-8?B?MU5JVXJtWXI1YlM2emUwTi9xbm5jQ0I2a2p6SnpBVG5jcWNsdHZKT3hvSmxE?=
 =?utf-8?B?L0xPMWNLQjVrTXUvamV1bGZvVGJYV3BQUWVQRG5Ub3JNdFNhZDJwaWtXRmdx?=
 =?utf-8?B?WWVpOHJoN3hUNmdnbXpaQnRNL3RSTUdqOVp1eFV4ZjEwQkpMV1Q3TEUwSlhw?=
 =?utf-8?B?eW1OWXkvQWtaN2JocWlLNUxoSDhLRVMyUS9vTFBVajdkZW4yOG50SzU3RUZQ?=
 =?utf-8?B?akE3amMzOXdrdVFhd0hhanBTbnZGTXdYSHhmcnpMMlR3VS9hRjBPcGpqbHIx?=
 =?utf-8?B?VmVtY3p1R2J5aWZnM0dkVzZCdXdZZ2V5YzhWNHVucVZ0emRYZmlFOGF3S3dC?=
 =?utf-8?B?dmZuMWRycDJuNC8zVWdNLytnZkFtZWJBWDZ0NXRpYVR0Q3hFSTJtWG80b0hn?=
 =?utf-8?B?V3lqRCtCalhGWm9CMFdrdXRsVUdvcEZZNWZSei9veEdjamRBblJ5K1V0MTM0?=
 =?utf-8?B?UC9HZlp2QjB1aURoSnN1c2FmUEZqZnJaOWtSSnNjb0dhbmhObzVWQS84cGow?=
 =?utf-8?B?RkNaUHBoMW40aHB4M1QrM3M1OTFKRy9iR1dlMG9yMVN2c01TeDNTZlhicUtC?=
 =?utf-8?B?VTJ2T2k0Z0JyQzk1Q2FCMERlbXJ3WlhhOHJWMEk5aGV0UnU2eE9ybVhXYmVv?=
 =?utf-8?B?aDZwVWl2Y1VpUEd3VUZCVmxxUU15em40YlFDRld0QkE4RFNKV0FTNjFBZGo5?=
 =?utf-8?B?a3Y1dGJpMExIOVhVRlNDWmNiZ0dySkR6WjFnb25VZ0poL3ZkZTRqdTBVYmFl?=
 =?utf-8?B?VFEvcWE2T0RUV0VlM2dzMkYvbGdHd1p3eE1qWUFOOTV2WWFmUHFjVTJVVjlQ?=
 =?utf-8?B?NXhNRSs0Z0V5bFF6UmkvQ2VNQituS0YvUHE3Ymhxd1JMYjhyY2luRnc4YUd4?=
 =?utf-8?B?VW5RRVNTbjhmOUF5TVV0cDZudCtPNU9iR3cwd0ZaS3dCbU16aGRibjgzK0N6?=
 =?utf-8?B?enhIb2I0V0U3MzBqb1hrN3dDS2hxa2tWekt4UEJaU04yVEd6c0k4Njg3OEt1?=
 =?utf-8?B?eXdWNHJGTUZqVjhnVWFHZzBVcWxkaWJrcUJYYXZ2dGNjMGUvaXlGcDBRS1pi?=
 =?utf-8?B?MlVKU2kxSkpHTE51aUJUeG5xRFUxOEZUNTVIQ2N5YTVvUHRlM3pUNzZFeWZM?=
 =?utf-8?B?eFlWMU1XYTNJMFZiYkxMT3hpWExvYXhPc1FaS3lVb04vOGNxUndWQmI2YnJW?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5789c772-45ec-4b3d-86f8-08dcb5cbdb59
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 03:57:14.4888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRiD1iGU/xVE8pm/P+G9F4ZkbH3WM84k/37/1iLEdUrdW2KpIjF4aRLP7YN/BMgy0kip4pl8aG7oRNnjqOVSNincxcAZOoGa3w/BJwdd3v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7832
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


On 8/4/2024 10:37 PM, Shekhar Chauhan wrote:
> Update performance tuning according to the hardware spec.
>
> Bspec: 72161
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++++
>   drivers/gpu/drm/xe/xe_tuning.c       | 8 +++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index c50643ab4c84..2c8c4d4218db 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -80,6 +80,9 @@
>   #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>   #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>   
> +#define STATELESS_COMPRESSION_CTRL		XE_REG(0x4148)
> +#define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
> +
>   #define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
>   #define   CG_DIS_CNTLBUS			REG_BIT(6)
>   
> @@ -193,6 +196,7 @@
>   #define GSCPSMI_BASE				XE_REG(0x880c)
>   
>   #define CCCHKNREG1				XE_REG_MCR(0x8828)
> +#define   L3CMPCTRL				REG_BIT(23)
>   #define   ENCOMPPERFFIX				REG_BIT(18)
>   
>   /* Fuse readout registers for GT */
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 3817b7743b0c..faa1bf42e50e 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -39,7 +39,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>   	},
>   	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> -	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX)),
> +	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
> +			 SET(CCCHKNREG1, L3CMPCTRL))
>   	},
>   	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> @@ -50,6 +51,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>   	  XE_RTP_ACTIONS(SET(L3SQCREG2,
>   			     COMPMEMRD256BOVRFETCHEN))
>   	},
> +	{ XE_RTP_NAME("Tuning: Stateless compression control"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
> +				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
> +	},
>   	{}
>   };
>   
LGTM.
Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

