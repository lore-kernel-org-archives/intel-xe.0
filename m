Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA04D49C6B
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1CC10E924;
	Fri, 30 Jan 2026 08:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="av5Ahx04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DF510E919
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769760814; x=1801296814;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zTjpeDsgTgs7CsCSvCEa0QcQgzOJIYmM2YoLVqcf+s8=;
 b=av5Ahx04uO9eX08VjqDzB9maSW3faMyZDjD3EheR2P5FqAZI8vhAKW9o
 A3Cl7pm1tmUm6pT2l40CyD9TEtRdBudn7S6TZs7osTjf5GgEyPUeJI/1R
 iIeCXORzw/AUT/6iz2ZRbMtBzDm9t8TCHyFf6NN6i56Yw8nBwvIf5TwMG
 f6MlZxi0CK927KIvqjerNeWJfx1BXXO224hZs4tORzhzbb615+M5J5z3y
 Bv85mue4gVil9bDwXXz8U8qC16E1OQGoi7MUuDDliPUpCtFRbiK2y8YdR
 Vq4JjKpsxKG2nlP8Uap+P8/yMLXQ2Z4zMH6638Mf/JMHW12sp5k68fFws w==;
X-CSE-ConnectionGUID: 7RFypZNzTvuzcvxTMwfgnw==
X-CSE-MsgGUID: dHnitDMMRJGxkY0CfkUVgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70916448"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70916448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:13:34 -0800
X-CSE-ConnectionGUID: UZXPUv8kQP6xpN3Df60rBw==
X-CSE-MsgGUID: BQTOXVhxTymDNAcAy4MLNw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:13:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:13:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 00:13:32 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:13:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+S8qTlQMU4L+tlSsoObAWE8XjN1pxxbO+6/de9mJ7thIWQ/hQsCMkGJKOk+gA6HqW+bgZ717X/lelGtBTuLytvYP0WvbakCQhskR8Gx4SGj5K86oTwV2BE2ZRv00MjRDQbmnvKef+eHCfiauvapXwLiPVx38aAA0+6xiXSIhdGc6sbUmGqCPhvtaAa5giE+vqVzbAQPddzD6cOr8LTUusx/oUdceG9x/JI7/tIOJ9LNMhKVxAXH+57WlzbHQR/Ust+A+URS3cWLM+um7RedHWqwnMxm8+giBKu9Mo7Wdyl6Nk0e+i3GuL2YFzg9iYuorgGtM1yOAkNoxjMniCgCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiOLvRSzOXpySLKYxE1/flOw9CRYGU3FJPIe29IQtX8=;
 b=kmf5BPOg3PZx+ct5+Mq6LQLvwreFkbj8L9SM0oojIfEDJ60CnDcXTnTdSfaejg6YwUKYI6zmvGgwvDBN1oiIB95bRJrqoZqqefM1ub4ow3BZ3Bmwv1gFnDLP58nQlR1LiqNbENUmbeI/yb3wrcb5/XlBIOZ0zRhxNOVNqhL9PEmxf4iMyY/TwD34j8jbljhvVvTBaJA7XTX7AlurWva7LBYS5xSEnn+/gMPoUvxF1xpkUy4I+RhnLNljuSuwicwqHdrpjvIUxQlpqCHhYtAxe9WocsTLT8c1bAOWecAhQm/V1TgkM7bPNzYL/ULiKsC+bIVSuaBmHlMEIbEQ+4s1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:13:29 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 08:13:29 +0000
Message-ID: <26ebe247-1fa1-4b91-980e-c93c09cfcf67@intel.com>
Date: Fri, 30 Jan 2026 13:43:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/madvise: Implement purgeable buffer object
 support
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-4-arvind.yadav@intel.com>
 <aW+0HUCM9UvfTL05@lstrano-desk.jf.intel.com>
 <2ea862f587c233f76865b340c6c1bd01499e36e3.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <2ea862f587c233f76865b340c6c1bd01499e36e3.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::13) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|MW4PR11MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f5848e-b258-40e3-59d6-08de5fd77383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXV5M3lPaDBCWjZLYjU3bXUxZlVnTHVubGpBdDYxRmo2c3ZTNldWMXpDWXpO?=
 =?utf-8?B?TmxXa1hLRW1oMmRaeENneDREdHY5T3Uzc2xncXpRNHgvUDBSOW1VQ2FDTUtH?=
 =?utf-8?B?b1VpVmt0WlE2dnJ1UmtiVTNQQjM3RVNKUnVqMjViNEVNUVJudUJQTjAzR2Jr?=
 =?utf-8?B?bFp2V2xUTVdZWHBNeWtyT05sVzkvZWhWK3ZvRktYWUE5TzViSFlJQmJEeVRE?=
 =?utf-8?B?T1YybTFyZ3ZvalJ1SnRueEkrQTBEWGxWWHd3bTZiUXpUY2wzenRSUmhHVlBz?=
 =?utf-8?B?ZUhwUS9aS0Fvck4ydElZU2M4OERPbjJhek81MVQrZGFhTGpGa3ZDSU1GajdU?=
 =?utf-8?B?aGVlRjNhMWtsaWdtR2VHYzRLQlhrTGxQYnVsU09BalhJejIxRE50Y3hoUGJX?=
 =?utf-8?B?Q0pvRjB0QkVHbE4wNktRcGYyUks0eVBMeFV4czk4amhVREdMZnlINHFjTnBX?=
 =?utf-8?B?S3ZoSVNPYTQ4ZGhrRlVIT2pXNDJKRU5QdGVHN2hkc1d4bW41cEo5Z1NUYVZI?=
 =?utf-8?B?MTBGUThxWU1HODJOa3haanoyS0c1dEdsZ3Y2SmZLaW1xM1FIQUt3OVN2QmlJ?=
 =?utf-8?B?cC8yeURrMm95TktZUHJ0NG95R2VPR3pqVDdWWWRjUlY5T3A1RkV1UkN2Z1px?=
 =?utf-8?B?WjNxUVd6YzkzRzE0Q3hXWGhSME1BZW9vdHlKbnVIcE8zNUZBdmM3a0tKa0JK?=
 =?utf-8?B?RHBsOFlMVTR1Vmp1T2hUZXcycUlIUDlCbnRkd3dkekVGOThKcVNjMWRZbXRY?=
 =?utf-8?B?WXptSjdIT2UxRGRhUGRuSis3NFdrc21yM2ltZnN2NlRvQXpKbWQ3TVVjakR5?=
 =?utf-8?B?MEpUK1paV015K1ArNzdRdEdzSWVScE1HNWtDa3R6TlZsb2UvakZYeEE4VG5R?=
 =?utf-8?B?b1U1d0lWN0pBdzBCRTdmenRRZG1uamtpdHREMHVNTFh1Q0FHRkJiNUxONXhZ?=
 =?utf-8?B?Wmo3aTFUL0plUFhkaEM0VDVQMXNvZFRqYjlqMlVyd0R1SzNyaWNuNE1uOENO?=
 =?utf-8?B?dHdFaFNCUHJmaW1yOTBYRmVXcVUxZlEyTzBiSW1sRWpqVEdhSkpqVElFQ0Rz?=
 =?utf-8?B?MEZhaUVTNXRiYjV0cW1YT2pxVEtKWXkyT0xGOWhsRWlSTzRxT3dZcFEyUWZB?=
 =?utf-8?B?UFRhbkQvLy82V1hvL0ZrNlFKRmUyRzZGWmpHcWR4RUt0RENmdEE0bzk2NUJa?=
 =?utf-8?B?NWlUcDVLaVE0NFExN2s4Y3A2UmpXZ21SOGZMK0dQRXkrUDRPQ2F2aEJuRjdN?=
 =?utf-8?B?NW1Jb0N2N21sVjYzbWVqdy84ZlRSVFFUZE1RQ2pkZmlFYU4wQmNLR3ZMcDlq?=
 =?utf-8?B?ckZ2RU5VWUhoUXJBbVhnYU9HUjlVUERLK2d0djY5Njl4clZSc1hzZXBNbkRH?=
 =?utf-8?B?MUZ5SGY5YmJ3SnN1cWZpbitxc2NmY3ZsRXp1UVV1Z2w5QUhDR3F3bElJbkZ1?=
 =?utf-8?B?SHg4UTVRNzNMUy9UNVVLaTNvZXB0L1pQbWJJT0RBb3JtZ2NkWU01ODFyLzJ2?=
 =?utf-8?B?UEphU1NIb2RJQmMwVG92aXZ3R09GaHYyYTVkTXFxS0llUjdROHU0amZlei9R?=
 =?utf-8?B?a21VSzFBWmdtdW5zaDhzM0RLR3RaZDByOVMzNHF3YzJ3MTBMTTJLVnhiNExY?=
 =?utf-8?B?OHJUcCtEVFVpdkEwMGlFU01iaHVLVll3Qi8ybEJUZzdHVkFObUY5dWExWDNN?=
 =?utf-8?B?L2NSQzVJMlk4YW0yWHdJbDgxSWFmWlhOSGptbkNGZ1ZDRGxEWEUweitDL1F2?=
 =?utf-8?B?MSs2NEVOUm1wV2VDczNOVlJvUFd1RkJaVWNyblZhZXNtL0gxV3J2S3VUcEUr?=
 =?utf-8?B?SlBuOEx2OUEydHNOY2pycnhrMDUwbU9EaFhVc1pHczdUUGZiNGYzWkpZRllq?=
 =?utf-8?B?U2p2bHFZOWU5TUwvQ0wvTGg0S1JBd1FEK2crNFhNaW5VRFN0dzB2MTdqak10?=
 =?utf-8?B?UjYxVkx5ZWtCNzJNZGtxT1lOUk9rVkFJWklobC8zQW1Scmt6RWlrRE9XTzNi?=
 =?utf-8?B?Y1RxRWpRMDMrcVRMMGJteEtWTEE2U0pFMVBDbFNnVkw4V0xSUUZtUmNFSExC?=
 =?utf-8?B?ZWZFUGFmbnlIWTZ0QWtKYXVxRDhTbnc1K2RFb3VUSEJVZjhtY2VCeVYvcDAz?=
 =?utf-8?Q?f860=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9mOVVIbFFyZEdOZzYyVjBhQTlBbGhlL3IyanNtVzdIR1c1N09FdFFWaTRS?=
 =?utf-8?B?RU9sUjNxek82ZHErSEVqRkcwTWZjNDhOVkVRVjkzRmxQWFhoc1o0NzJ3TkFx?=
 =?utf-8?B?K3Y4Y00rQ1IxVnNORUdHN0xGajZkWk5zVVpycGR3ZnBrdzV3U0ZZTndud09G?=
 =?utf-8?B?Z3lSVkhVSGtiUzJBblcyTUNSNG9taFQ0NXNUaE9jV256cUp3WTVLY3I4U2Qw?=
 =?utf-8?B?YlZ0d3FWTGxHVnE5S2FwRE5OUC9OclNRM281eE5yRXROc0xndDFBZW9LOHh4?=
 =?utf-8?B?Qi9MSUNMcGpnMXZQRytCTVYyOXlFaWd3NVNhMlFkNTNReTJ2K3M0TDUzWGFU?=
 =?utf-8?B?UnBkallCM01FVHl0QmpuVHVmSTVNUnhIVWczZ3pvcldzRysyUzdLbXhVRS9M?=
 =?utf-8?B?aXo1akk5RVVheTlYbTEvdWxPKzdCYnM4VGYwQ1d5US83eTljL2tqZGQxOEhZ?=
 =?utf-8?B?bVVBZGRUVG9NNW1xZUNWdkJoeHlCZzZFd21NaFRPQk1pNVZaRzhnZ1ZZYlNL?=
 =?utf-8?B?Mlg2U01JWndnYlZURDBMa0pwRXpsRnZCNW1OMTUrSWtmZ2dpOU96Mm5wdHFY?=
 =?utf-8?B?UWx4NVdRbmdEUzkxamFOTjQzSEdnK3F0TGJNQ0drdENLUy9OOTlNUUs2S0tH?=
 =?utf-8?B?bjIxb0plUnl2MityaVdDai9nSE41dTV6bUpxYVpmMXJ0K3o0N2N3RDdxV2I0?=
 =?utf-8?B?UEpqMjJOWllocWYyQjhLMDRTNWhmRVgyVkFkRVNkT3paLzN0b2tVdnFVU01s?=
 =?utf-8?B?dDMvU3FSL0dhdEVuYTJwSDh1bjl4VnRSNEljNHJ3NUx4dHdhaVV4T0YzeW1Y?=
 =?utf-8?B?L25HVnUzNzJ2Vms4VHFnWTZueXdkZGw2dWFwVFBVaWVObXNUbi9nUVJDMVUz?=
 =?utf-8?B?RWxLUFpEQkUvRTN2Q0lPblVxam9yUitZTmRkMUpOZzY4UG41bHJVSHk4VUUy?=
 =?utf-8?B?SzZodndLNkVhbFVXVlZRejZCVHFVdFNGTnA4SVJrODdhdVN1aXQ0aUZpR1Zj?=
 =?utf-8?B?MTVOdjJRZEoxSDZITG1sVm9MVHNBbG5iWFMvYmFORmxDd2M2NEdNR2IxN1hC?=
 =?utf-8?B?TENxT202OVAwRW5UMEZYM05YbWFwbTBpTVJYWDZOQ1V3VU1jdS81MzRCZW5T?=
 =?utf-8?B?RUZNcWtXWXhmL3ZlcXRWU0ZQaFpobWpyRlhIQ09aV082QVZER2lqWkhBeEtE?=
 =?utf-8?B?djREbS91YnFTOFBPMi9lNFZENnhJdjg3TEpSRnduOW8rQ25uWHJER2pKdi93?=
 =?utf-8?B?UkhsL2hDek5ya0taeHl1T1lDTzRvWWhsdE9ybHNUSVJqTmsxWE9PS0NwTWth?=
 =?utf-8?B?Um8raHdwK2UwdkYyaFNua2Z5bUkrcHgxQW1Dc2dJMGdaTEhOY0pqK3NjQ2NL?=
 =?utf-8?B?OXlDc2Y2U0JyU2p5NEZtQXlRcWtGRXU0K2sraHRCUWFwck1ScmFzMHVYdktI?=
 =?utf-8?B?eE1aL05udzdkeWZJa0lzUzVPTTBRYkFhQUU5SzkvVkZHNVdxeENTdTlDNWlp?=
 =?utf-8?B?ZDlOYzFLQ0p4ZkxwM1VQYWpFQWRUVUtNZm0yNHdvQkN6amJvdGNoRnpURWlD?=
 =?utf-8?B?NUN5Z05HbmYrZEFzTlhjTVY0NXpwWFdIdW96T1J5MGN0K0hxK2o5Sk9wWE9v?=
 =?utf-8?B?WU94UTUwbjRWRld4akxPRy9WTk5KVXRrbGFYSEgySG56MERMRmZpcEdJOW9U?=
 =?utf-8?B?SDNZcDdkUDF4RkJ0Zlo5UzVGQllIL21HRHZZWDNyNEs5b01rNm1MRjhvNEt5?=
 =?utf-8?B?YWEyR2k0NzhneHRnQ2xoVjMzTTJSYjhPaHp6dzJZdWFQZmlJWW93dEp2OHJZ?=
 =?utf-8?B?UnNZUEI4N2ZKZFZSM2VwZlRxWjYza1NNV3B2SGxsbWtLajFQRlk3Ny9WVTZu?=
 =?utf-8?B?MGw2bzVFSTJhRUNBZm0zYUJCZVpmSmovQ2FIamFPZzhtTnVjZlVCRFdnRWxz?=
 =?utf-8?B?cEZML3BoM1U5VnpEMTBtNGJBdkt2dEFHMWF5aGw0SE9tSmJFZXM3MzF0aUZl?=
 =?utf-8?B?MUYzaDBITmdjSVB3UU02S0xQZ3poYzE3bkI2elo3b1lsbENFVU0weXdKZTFU?=
 =?utf-8?B?RVB5cGVQa1pVZ09WOXNSRkh0MHY3QjFVNFhYUTQ1QjZTaENNbzArZ0JKSVpM?=
 =?utf-8?B?dlRuSnpaNkpFcVJCTnByalRoUEFhQnpjaDVNWE1oOWc4V0REelRCZ29ZYTlt?=
 =?utf-8?B?OVU5d0dPQ05QQzFmbkROL3hHMnhHeHlWdnNjamZkV0hCSm5DKzNWdm1lYWph?=
 =?utf-8?B?MHpkeXFPcGRvaWZRakxjM1hZN2kxd0tqNnBhcUpPZDR0ZzBBVk5YM0dZWWpD?=
 =?utf-8?B?ejJhVC9LUTJBMDBpK24zSGlmbDhLVWNkTDRSbk5sRlF4U0lES3lUdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f5848e-b258-40e3-59d6-08de5fd77383
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:13:29.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJs9XlA8wWstpeRW/umQzmBSPr0r+oAHZMJX+ra3qxa2aQ+Lg013cLKLrlhV0NX7AVAJBGTK1zfuDKVk9wJuiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
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


On 22-01-2026 21:00, Thomas Hellström wrote:
> On Tue, 2026-01-20 at 08:58 -0800, Matthew Brost wrote:
>> On Tue, Jan 20, 2026 at 11:38:49AM +0530, Arvind Yadav wrote:
>>> This allows userspace applications to provide memory usage hints to
>>> the kernel for better memory management under pressure:
>>>
>>> Add the core implementation for purgeable buffer objects, enabling
>>> memory
>>> reclamation of user-designated DONTNEED buffers during eviction.
>>>
>>> This patch implements the purge operation and state machine
>>> transitions:
>>>
>>> Purgeable States (from xe_madv_purgeable_state):
>>>   - WILLNEED (0): BO should be retained, actively used
>>>   - DONTNEED (1): BO eligible for purging, not currently needed
>>>   - PURGED (2): BO backing store reclaimed, permanently invalid
>>>
>>> Design Rationale:
>>>    - Async TLB invalidation via trigger_rebind (no blocking
>>> xe_vm_invalidate_vma)
>>>    - i915 compatibility: retained field, "once purged always purged"
>>> semantics
>>>    - Shared BO protection prevents multi-process memory corruption
>>>    - Scratch PTE reuse avoids new infrastructure, safe for fault
>>> mode
>>>
>>> v2:
>>>    - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas
>>> Hellström)
>>>    - Add NULL rebind with scratch PTEs for fault mode (Thomas
>>> Hellström)
>>>    - Implement i915-compatible retained field logic (Thomas
>>> Hellström)
>>>    - Skip BO validation for purged BOs in page fault handler (crash
>>> fix)
>>>    - Add scratch VM check in page fault path (non-scratch VMs fail
>>> fault)
>>>    - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping
>>> (review fix)
>>>    - Add !is_purged check to resource cursor setup to prevent stale
>>> access
>>>
>>> v3:
>>>    - Rebase as xe_gt_pagefault.c is gone upstream and replaced
>>>      with xe_pagefault.c (Matthew Brost)
>>>    - Xe specific warn on (Matthew Brost)
>>>    - Call helpers for madv_purgeable access(Matthew Brost)
>>>    - Remove bo NULL check(Matthew Brost)
>>>    - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
>>>    - Move the xe_bo_is_purged check under the dma-resv lock( by
>>> Matt)
>>>    - Drop is_purged from xe_pt_stage_bind_entry and just set is_null
>>> to true
>>>      for purged BO rename s/is_null/is_null_or_purged (by Matt)
>>>    - UAPI rule should not be changed.(Matthew Brost)
>>>    - Make 'retained' a userptr (Matthew Brost)
>>>
>>> v4:
>>>    - @madv_purgeable atomic_t → u32 change across all relevant
>>> patches. (Matt)
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c         | 61 +++++++++++++++++----
>>>   drivers/gpu/drm/xe/xe_pagefault.c  | 12 ++++
>>>   drivers/gpu/drm/xe/xe_pt.c         | 38 +++++++++++--
>>>   drivers/gpu/drm/xe/xe_vm.c         | 11 +++-
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 88
>>> ++++++++++++++++++++++++++++++
>>>   5 files changed, 191 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>> b/drivers/gpu/drm/xe/xe_bo.c
>>> index 408c74216fdf..d0a6d340b255 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -836,6 +836,43 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>>   	return 0;
>>>   }
>>>   
>>> +/**
>>> + * xe_ttm_bo_purge() - Purge buffer object backing store
>>> + * @ttm_bo: The TTM buffer object to purge
>>> + * @ctx: TTM operation context
>>> + *
>>> + * This function purges the backing store of a BO marked as
>>> DONTNEED and
>>> + * triggers rebind to invalidate stale GPU mappings. For fault-
>>> mode VMs,
>>> + * this zaps the PTEs. The next GPU access will trigger a page
>>> fault and
>>> + * perform NULL rebind (scratch pages or clear PTEs based on VM
>>> config).
>>> + */
>>> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
>>> struct ttm_operation_ctx *ctx)
>>> +{
>>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>> +
>> xe_bo_assert_held(bo);
>>
>>> +	if (ttm_bo->ttm) {
>>> +		struct ttm_placement place = {};
>>> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>>> +
>>> +		drm_WARN_ON(&xe->drm, ret);
>> I think since 'xe' in available here, you should use xe_assert in
>> place
>> of drm_WARN_ON.
>>
>>> +		if (!ret) {
>>> +			if (xe_bo_madv_is_dontneed(bo)) {
>>> +				bo->madv_purgeable =
>>> XE_MADV_PURGEABLE_PURGED;
>> Helper to set madv_purgeable state /w lockdep assert?
>>
>> Also perhaps assert valid state transitions in the helper (e.g., you
>> cannot tranistion out of XE_MADV_PURGEABLE_PURGED.
>>
>>> +
>>> +				/*
>>> +				 * Trigger rebind to invalidate
>>> stale GPU mappings.
>>> +				 * - Non-fault mode: Marks VMAs
>>> for rebind
>>> +				 * - Fault mode: Zaps PTEs (sets
>>> to 0), next access triggers fault
>>> +				 *   and NULL rebind with
>>> scratch/clear PTEs per VM config
>>> +				 */
>>> +				ret = xe_bo_trigger_rebind(xe, bo,
>>> ctx);
>>> +				XE_WARN_ON(ret);
>> I think xe_bo_trigger_rebind is allowed to fail if ctx->no_wait_gpu
>> is
>> set. In both the faulting fast path and certain parts of the shrinker
>> we
>> set this. So I think any error returned from xe_bo_trigger_rebind
>> needs
>> to propagte up the call stack.
> If possible, I think we should call xe_bo_move_notify(), which will in
> turn call xe_bo_trigger_rebind() rather than call
> xe_bo_trigger_rebind(), since xe_bo_move_notify() is intended to unbind
> / unmap everything needed before a bo move / purge. In this case
> xe_bo_trigger_rebind() may be sufficient, but perhaps not in the
> future.


Agree with both points. Will do the change.

>>> +			}
>>> +		}
>>> +	}
>>> +}
>>> +
>>>   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool
>>> evict,
>>>   		      struct ttm_operation_ctx *ctx,
>>>   		      struct ttm_resource *new_mem,
>>> @@ -855,6 +892,15 @@ static int xe_bo_move(struct ttm_buffer_object
>>> *ttm_bo, bool evict,
>>>   				  ttm && ttm_tt_is_populated(ttm))
>>> ? true : false;
>>>   	int ret = 0;
>>>   
>>> +	/*
>>> +	 * Purge only non-shared BOs explicitly marked DONTNEED by
>>> userspace.
>>> +	 * The move_notify callback will handle invalidation
>>> asynchronously.
>>> +	 */
>>> +	if (evict && xe_bo_madv_is_dontneed(bo)) {
>>> +		xe_ttm_bo_purge(ttm_bo, ctx);
>> With above, we need to send errors from xe_ttm_bo_purge up the call
>> stack.
>>
>>> +		return 0;
>>> +	}
>>> +
>>>   	/* Bo creation path, moving to system or TT. */
>>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>>   		if (new_mem->mem_type == XE_PL_TT)
>>> @@ -1604,18 +1650,6 @@ static void
>>> xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>>>   	}
>>>   }
>>>   
>>> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
>>> struct ttm_operation_ctx *ctx)
>>> -{
>>> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> -
>>> -	if (ttm_bo->ttm) {
>>> -		struct ttm_placement place = {};
>>> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>>> -
>>> -		drm_WARN_ON(&xe->drm, ret);
>>> -	}
>>> -}
>>> -
>>>   static void xe_ttm_bo_swap_notify(struct ttm_buffer_object
>>> *ttm_bo)
>>>   {
>>>   	struct ttm_operation_ctx ctx = {
>>> @@ -2196,6 +2230,9 @@ struct xe_bo *xe_bo_init_locked(struct
>>> xe_device *xe, struct xe_bo *bo,
>>>   #endif
>>>   	INIT_LIST_HEAD(&bo->vram_userfault_link);
>>>   
>>> +	/* Initialize purge advisory state */
>>> +	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>>> +
>>>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base,
>>> size);
>>>   
>>>   	if (resv) {
>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
>>> b/drivers/gpu/drm/xe/xe_pagefault.c
>>> index 6bee53d6ffc3..e3ace179e9cf 100644
>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>> @@ -59,6 +59,18 @@ static int xe_pagefault_begin(struct drm_exec
>>> *exec, struct xe_vma *vma,
>>>   	if (!bo)
>>>   		return 0;
>>>   
>>> +	/*
>>> +	 * Check if BO is purged (under dma-resv lock).
>>> +	 * For purged BOs:
>>> +	 * - Scratch VMs: Skip validation, rebind will use scratch
>>> PTEs
>>> +	 * - Non-scratch VMs: FAIL the page fault (no scratch page
>>> available)
>>> +	 */
>>> +	if (unlikely(xe_bo_is_purged(bo))) {
>>> +		if (!xe_vm_has_scratch(vm))
>>> +			return -EACCES;
>>> +		return 0;
>>> +	}
>>> +
>>>   	return need_vram_move ? xe_bo_migrate(bo, vram->placement,
>>> NULL, exec) :
>>>   		xe_bo_validate(bo, vm, true, exec);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c
>>> b/drivers/gpu/drm/xe/xe_pt.c
>>> index 6703a7049227..c8c66300e25b 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
>>> pgoff_t offset,
>>>   	/* Is this a leaf entry ?*/
>>>   	if (level == 0 || xe_pt_hugepte_possible(addr, next,
>>> level, xe_walk)) {
>>>   		struct xe_res_cursor *curs = xe_walk->curs;
>>> -		bool is_null = xe_vma_is_null(xe_walk->vma);
>>> -		bool is_vram = is_null ? false :
>>> xe_res_is_vram(curs);
>>> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>>> +		bool is_null_or_purged = xe_vma_is_null(xe_walk-
>>>> vma) ||
>>> +					 (bo &&
>>> xe_bo_is_purged(bo));
>>> +		bool is_vram = is_null_or_purged ? false :
>>> xe_res_is_vram(curs);
>>>   
>>>   		XE_WARN_ON(xe_walk->va_curs_start != addr);
>>>   
>>>   		if (xe_walk->clear_pt) {
>>>   			pte = 0;
>>>   		} else {
>>> -			pte = vm->pt_ops->pte_encode_vma(is_null ?
>>> 0 :
>>> +			/*
>>> +			 * For purged BOs, treat like null VMAs -
>>> pass address 0.
>>> +			 * The pte_encode_vma will set XE_PTE_NULL
>>> flag for scratch mapping.
>>> +			 */
>>> +			pte = vm->pt_ops-
>>>> pte_encode_vma(is_null_or_purged ? 0 :
>>>   							
>>> xe_res_dma(curs) +
>>>   							 xe_walk-
>>>> dma_offset,
>>>   							 xe_walk-
>>>> vma,
>>>   							
>>> pat_index, level);
>>> -			if (!is_null)
>>> +			if (!is_null_or_purged)
>>>   				pte |= is_vram ? xe_walk-
>>>> default_vram_pte :
>>>   					xe_walk-
>>>> default_system_pte;
>>>   
>>> @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
>>> pgoff_t offset,
>>>   		if (unlikely(ret))
>>>   			return ret;
>>>   
>>> -		if (!is_null && !xe_walk->clear_pt)
>>> +		if (!is_null_or_purged && !xe_walk->clear_pt)
>>>   			xe_res_next(curs, next - addr);
>>>   		xe_walk->va_curs_start = next;
>>>   		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K <<
>>> level);
>>> @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
>>> xe_vma *vma,
>>>   	};
>>>   	struct xe_pt *pt = vm->pt_root[tile->id];
>>>   	int ret;
>>> +	bool is_purged = false;
>>> +
>>> +	/*
>>> +	 * Check if BO is purged:
>>> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe
>>> zero reads
>>> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to
>>> avoid mapping to phys addr 0
>>> +	 *
>>> +	 * For non-scratch VMs, we force clear_pt=true so leaf
>>> PTEs become completely
>>> +	 * zero instead of creating a PRESENT mapping to physical
>>> address 0.
>>> +	 */
>>> +	if (bo && xe_bo_is_purged(bo)) {
>>> +		is_purged = true;
>>> +
>>> +		/*
>>> +		 * For non-scratch VMs, a NULL rebind should use
>>> zero PTEs
>>> +		 * (non-present), not a present PTE to phys 0.
>>> +		 */
>>> +		if (!xe_vm_has_scratch(vm))
>>> +			xe_walk.clear_pt = true;
>>> +	}
>>>   
>>>   	if (range) {
>>>   		/* Move this entire thing to xe_svm.c? */
>>> @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
>>> xe_vma *vma,
>>>   	if (!range)
>>>   		xe_bo_assert_held(bo);
>>>   
>>> -	if (!xe_vma_is_null(vma) && !range) {
>>> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>>>   		if (xe_vma_is_userptr(vma))
>>>   			xe_res_first_dma(to_userptr_vma(vma)-
>>>> userptr.pages.dma_addr, 0,
>>>   					 xe_vma_size(vma), &curs);
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>> b/drivers/gpu/drm/xe/xe_vm.c
>>> index 694f592a0f01..c3a5fe76ff96 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -1359,6 +1359,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo
>>> *bo, u64 bo_offset,
>>>   static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>>   			       u16 pat_index, u32 pt_level)
>>>   {
>>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>> +	struct xe_vm *vm = xe_vma_vm(vma);
>>> +
>>>   	pte |= XE_PAGE_PRESENT;
>>>   
>>>   	if (likely(!xe_vma_read_only(vma)))
>>> @@ -1367,7 +1370,13 @@ static u64 xelp_pte_encode_vma(u64 pte,
>>> struct xe_vma *vma,
>>>   	pte |= pte_encode_pat_index(pat_index, pt_level);
>>>   	pte |= pte_encode_ps(pt_level);
>>>   
>>> -	if (unlikely(xe_vma_is_null(vma)))
>>> +	/*
>>> +	 * NULL PTEs redirect to scratch page (return zeros on
>>> read).
>>> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on
>>> scratch VMs.
>>> +	 * Never set NULL flag without scratch page - causes
>>> undefined behavior.
>>> +	 */
>>> +	if (unlikely(xe_vma_is_null(vma) ||
>>> +		     (bo && xe_bo_is_purged(bo) &&
>>> xe_vm_has_scratch(vm))))
>>>   		pte |= XE_PTE_NULL;
>>>   
>>>   	return pte;
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index add9a6ca2390..dfeab9e24a09 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -179,6 +179,56 @@ static void madvise_pat_index(struct xe_device
>>> *xe, struct xe_vm *vm,
>>>   	}
>>>   }
>>>   
>>> +/*:
>>> + * Handle purgeable buffer object advice for
>>> DONTNEED/WILLNEED/PURGED.
>>> + * Returns true if any BO was purged, false otherwise.
>>> + * Caller must copy retained value to userspace after releasing
>>> locks.
>>> + */
>>> +static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe,
>>> struct xe_vm *vm,
>>> +				       struct xe_vma **vmas, int
>>> num_vmas,
>>> +				       struct drm_xe_madvise *op)
>> Shouldn't this check be a vfunc in madvise_funcs?
>>
>> Also I think you can hook into xe_madvise_details for the return
>> value /
>> final copy to user.
>>
>>> +{
>>> +	bool has_purged_bo = false;
>>> +	int i;
>>> +
>>> +	xe_assert(vm->xe, op->type ==
>>> DRM_XE_VMA_ATTR_PURGEABLE_STATE);
>>> +
>>> +	for (i = 0; i < num_vmas; i++) {
>>> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
>>> +
>>> +		if (!bo)
>>> +			continue;
>>> +
>>> +		/* BO must be locked before modifying madv state
>>> */
>>> +		xe_bo_assert_held(bo);
>>> +
>>> +		/*
>>> +		 * Once purged, always purged. Cannot transition
>>> back to WILLNEED.
>>> +		 * This matches i915 semantics where purged BOs
>>> are permanently invalid.
>>> +		 */
>>> +		if (xe_bo_is_purged(bo)) {
>>> +			has_purged_bo = true;
>>> +			continue;
>>> +		}
>>> +
>>> +		switch (op->purge_state_val.val) {
>>> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>>> +			bo->madv_purgeable =
>>> XE_MADV_PURGEABLE_WILLNEED;
>>> +			break;
>>> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>>> +			bo->madv_purgeable =
>>> XE_MADV_PURGEABLE_DONTNEED;
>> Use above suggested helper to set this state?
>>
>>> +			break;
>>> +		default:
>>> +			drm_warn(&vm->xe->drm, "Invalid madvice
>>> value = %d\n",
>>> +				 op->purge_state_val.val);
>>> +			return false;
>>> +		}
>>> +	}
>>> +
>>> +	/* Return whether any BO was purged; caller will copy to
>>> user after unlocking */
>>> +	return has_purged_bo;
>>> +}
>>> +
>>>   typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm
>>> *vm,
>>>   			     struct xe_vma **vmas, int num_vmas,
>>>   			     struct drm_xe_madvise *op,
>>> @@ -306,6 +356,16 @@ static bool madvise_args_are_sane(struct
>>> xe_device *xe, const struct drm_xe_madv
>>>   			return false;
>>>   		break;
>>>   	}
>>> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>>> +	{
>>> +		u32 val = args->purge_state_val.val;
>>> +
>>> +		if (XE_IOCTL_DBG(xe, !(val ==
>>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
>>> +				       val ==
>>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
>>> +			return false;
>>> +
>>> +		break;
>>> +	}
>>>   	default:
>>>   		if (XE_IOCTL_DBG(xe, 1))
>>>   			return false;
>>> @@ -465,6 +525,34 @@ int xe_vm_madvise_ioctl(struct drm_device
>>> *dev, void *data, struct drm_file *fil
>>>   					goto err_fini;
>>>   			}
>>>   		}
>>> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE)
>>> {
>>> +			bool has_purged_bo;
>>> +
>>> +			has_purged_bo =
>>> xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
>>> +								
>>> madvise_range.num_vmas, args);
>>> +
>> Again use the existing vfuncs here.
>>
>>> +			/* Release BO locks */
>>> +			drm_exec_fini(&exec);
>>> +			kfree(madvise_range.vmas);
>>> +			up_write(&vm->lock);
>>> +
>>> +			/*
>>> +			 * Set retained flag to indicate if
>>> backing store still exists.
>>> +			 * Matches i915: retained = 1 if not
>>> purged, 0 if purged.
>>> +			 * Must copy_to_user AFTER releasing ALL
>>> locks to avoid circular dependency.
>>> +			 */
>>> +			if (args->purge_state_val.retained) {
>>> +				u32 retained = !has_purged_bo;
>>> +
>>> +				if
>>> (copy_to_user(u64_to_user_ptr(args->purge_state_val.retained),
>>> +						 &retained,
>>> sizeof(retained)))
>> I don't think remained needs to be a u64 - maybe a u16? Will comment
>> on
>> uAPI too.
>>
>>> +					drm_warn(&vm->xe->drm,
>>> "Failed to copy retained value to user\n");
>> See above, use xe_madvise_details_fini for the final copy to user.
> Can we use put_user() rather than copy_to_user() ?


Agreed, Will change to put_user().


>
> Also, should the IOCTL return a failure in this case?

yes. If we can't communicate the retained state to userspace, the IOCTL 
should fail. Will return -EFAULT.

>
> Another option is ofc to assert that retained is set to false on IOCTL
> call, so that if put_user() fails, UMD will not try to reuse a bo whose
> retained state is unclear.


Agreed, I will add a check that retained == 0 on IOCTL entry and reject 
the call otherwise. Combined with returning -EFAULT on put_user() 
failure, this guarantees userspace never observes or relies on an 
uncertain retained state.

Thanks,
~Arvind

>
>
> Thanks,
> Thomas
>
>
>> Matt
>>
>>> +			}
>>> +
>>> +			/* Final cleanup for early return */
>>> +			xe_vm_put(vm);
>>> +			return 0;
>>> +		}
>>>   	}
>>>   
>>>   	if (madvise_range.has_svm_userptr_vmas) {
>>> -- 
>>> 2.43.0
>>>
