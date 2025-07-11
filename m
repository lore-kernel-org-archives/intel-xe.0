Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7054DC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AE889C29;
	Fri, 11 Jul 2025 19:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhRUDp+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C21B89C29
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 19:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752261823; x=1783797823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rBxslvlSBzba8MIBqd/2X1huzDvkpPpjqaUVF0/oLG8=;
 b=VhRUDp+i2dA6HnyCNIpIMZR4+0ESNZKKdu8ckJOLK7Ua42IElJh+CJ/M
 mIahssnoNviRbr77DDvrZLOtzW2AU02FQf0H+q4+7/ExTcytxVqaSJqvc
 RLiprYui8194SGCi2WXM+K3vIBq3aMwLRBnEMOXPnO7cQeJFn2XQcpy7/
 zG1QtP2o1LIc9Klm2hXfRTmWHTqgwvoN01ulz/NEyCKzYLse7XcHe5uFi
 SkX1Yq9xYhzuZoEvOMxN8hGmOUFuHjuxJgKmd4OXp/RnarUpJQwRnwr0Z
 7Ly16WHaNrDvIO2Q+pADBU1SR/yKFbLCt+andKH/XwEs5/jrh1bEjfJhy w==;
X-CSE-ConnectionGUID: l2q1jWeIQba3lo9y2vNmFw==
X-CSE-MsgGUID: //KWYzMtR6eVs1ejDhn+OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54536137"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54536137"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:23:42 -0700
X-CSE-ConnectionGUID: AUTnYXRFQaiA5GOd08NdlA==
X-CSE-MsgGUID: Rp/nlHlST8WFqvVUfyHKsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160460444"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:23:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 12:23:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 12:23:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 12:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vdtvje9NILbB2wf5dToE/LrxNhRN3HqGiVCb41frXZy+qz2a33TQAuY22a1ZV11f2xQR1deVez3xSjjS601B0xJs3kJaikbfEzqbyOs+A3U07WLENACnirJGo1Wm8vB4dVhT0lRjONc6y42uyW/O4ssPDGglMqc0IXgAWJHieUws27WrDkNmlek+ThduCqfEwRnijfMpuclyDPlaE8pFrg+MdADH6L7rdUDcUIJNuJ8I2g6aloIS4ShLAEVSvxF/SooWrpSqsdSpaI5gRx5qnvyeHU2Pw0LfC8ddr8hiu3+vwrtEnuwhs7Vpw8gsL6jglYpJ/lCFvWJRWkUQhpv14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85S99PqK6frZydbYfdoL4KUfOzbYJTPYnrZIOiR7WB0=;
 b=B5sWmf2D51QN5fhaJeWtLDfJWd1/mnI0aZGODhPMgKwi3IEhNPgGdZJyKBRbDDx/aN9djertcL5eOhvEgsTTTXGra12OlPBCT6q9cDr1tBbwuixgHdPat5r6Q2zLxRdcVwwhVe425HWiNVDRwfJ0lTdsU4/BqK8OdbRcMwlC4jxtMFrklPD05b2X+q72J0GSjaHbSQuM+sdndwKg41yMOZpp3K6r8n2eRLbaEgIEEjUA1RgQPGOdk2/PW37x7pBaABR6e0h4XEtGV2OEnsxMQXDVrb1GIs3jkKTxU3HtoYJxwKM49ktx/jmKcgZN5LDLOURrjjHShxwKTYTUwTE6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by DS0PR11MB7213.namprd11.prod.outlook.com (2603:10b6:8:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 19:23:38 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 19:23:38 +0000
Message-ID: <b91be662-a005-4150-bda3-854521f12ef1@intel.com>
Date: Fri, 11 Jul 2025 12:23:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Normalize default param values
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Mrozek <michal.mrozek@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20250626-guc-log-level-v3-1-c3ed8b452e91@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250626-guc-log-level-v3-1-c3ed8b452e91@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0048.namprd16.prod.outlook.com
 (2603:10b6:907:1::25) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|DS0PR11MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: b61030b3-1283-466c-e331-08ddc0b06ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTd6TXdQUWpCR1IzNDdMUFlWbWMrL3pFQlZHanhPNUlzYndnbFhOUXJWU3M2?=
 =?utf-8?B?RlJjdDlRT0FuclNpYVUrcyt1OWtvcFRUUHdHOTFhSmd0UVdiTWtmY2FTckNH?=
 =?utf-8?B?anR3cmY4Rm1abEh6SThGemticDl4TVVVOHNoWmJyQ2dDbUZpalZhWklCUDZl?=
 =?utf-8?B?QkpZMGREVTFXdDBFcXdpMUx0YU1IemFXWDNDWFpQNFVMVkU1T2wrL210Nlc3?=
 =?utf-8?B?U3VYa1dhNzZWVFdEWkR2ZERIV0R2Z1lnSzJuUE1JS2NoZVlPN2FIdS9ZOHRl?=
 =?utf-8?B?Y0d4THpCemF6VitaeHBrUUc5cTBTQksxS2NxR203N0xTUUFXNWV6QXlGZmdi?=
 =?utf-8?B?bC9kUENHd1VxME1oR2RGU2hsQ04wL2N4bFMwNWFEekNBN3QzckpUQVpQTlp2?=
 =?utf-8?B?VTEyK28xdXZTQTY2WlBpN1lJZUZqcThmTjFzWXNmbmhITk94WlJpYmZsV29t?=
 =?utf-8?B?cnZtV0k1bnFvODRUN2ZhWXd1ZytBTlBkWGhIOEw1cTZLVysvbHNvcFZ0K1BB?=
 =?utf-8?B?czdFRllNMlNJdnFYRU9XYTBvYk5Ka3ZQZUNBdEhWQTloRGxDb25nWE91SHJD?=
 =?utf-8?B?ZkxmV0JsbDRTMy9KNnhXaDhpejdnU1UySjFhZXNad3ozWUs0R2VDbHNVUU5a?=
 =?utf-8?B?b0U4MDRqdkdhQkRFWTZ0c29sajNBSy9UMjNxdm5YR051OXJVRjVTUjBwMmQ5?=
 =?utf-8?B?WVljY2V2eDZ4a0krcko5dUY3NUZRREl1TGFyMEt4SXJWZFB6MmhLTFp6ZTBP?=
 =?utf-8?B?TjJQRWR1UkUrR3JCRFdRYVQ4T3E2VUVCR29neFNwamY2ZHlJZzRSZUpRV2J5?=
 =?utf-8?B?TkNUNzN3RnZQUnk0RWowN2JtZWhRTkp5aGxsdFpEUTU4eU1DRkRqbXhqUEFT?=
 =?utf-8?B?dVhyN0FvMGtodkQvdW1JWjBMY0RrOVZVVjdLdTMzQ1RuRjhPOTVsSzhhUFRX?=
 =?utf-8?B?V0ZjazhSVTVyMzBnRUwxNVRjdTA2b3A1ajJCNm0wL3VydW1qWGVCdDF2VkZq?=
 =?utf-8?B?VW5SV3BaSDZ5MW9LS29nd1p5VVcyeWhtOFB4ZkZRQ1M2WHMyQ0x6RUx3d2Vt?=
 =?utf-8?B?NW9GMzA4Q3YySGZTeGp5ejhqQUVkcldmYU9pUk1ZN2ZlZ1dYSEFMeGEyRVAx?=
 =?utf-8?B?aVhJaDI0Zk8xWDVieElHYXM2T1JkUTFPc3NZbk16NUdaSFVVSnBPeUhQdGpr?=
 =?utf-8?B?NC9laGNJdmNOdlo5TTUxaW1uMkVnUjhJQVBvN0ZrWHlYSVI0M05CS0V1RXZ6?=
 =?utf-8?B?UlRwN2NTMitsMm5QdVJYdWM5b1h3OEFSbFZhOHduZlBTZ1BHM0hicGlCTVNY?=
 =?utf-8?B?NXZnNjNVbllieFhHRkJwOHR3cFJLdFR6UlJCMU9nVUhnb2VucGdybkR4Vk00?=
 =?utf-8?B?K1dGa1BEODNSOWZWWENRU0VsSUw3aHpQOEU2bmgxcnVlb01GRFpyMWhHQlJj?=
 =?utf-8?B?enkzZ1JXam1BcjgrcWRSa3dSTklLNnZxTTNKYUJjZXVWV1NZbUQ4MklRSkJa?=
 =?utf-8?B?R1NQNWVGblpPUXpsY3l3dEhoTWNKdWVGbTJ5b1AyUjVFOHEzREMvaUV6U2tQ?=
 =?utf-8?B?ZGJBMGJpYXhncVQ1NTZFMEs2Z0tITnJCdzVvdkxYSUlEUDYvTUttakJFV2dN?=
 =?utf-8?B?a0RDS3RIMDRhR1RtWnUrV2d6RThBRDZlc2NHa2FkckxMdGovWldzSTlqQlJV?=
 =?utf-8?B?SEIzOVNSWnc2S0FaSUh0dnZ5dGUzbTdYbW11azVUWXZKaGs2NFA3bkZCZlNU?=
 =?utf-8?B?OFdQUWJ4bk95ZVFNRUNlbm9JN0VLVlM4SXdiUVdwNjNuUkNKZCtYSUlMNVlC?=
 =?utf-8?B?N2IwOGx1MnZXMDJVdFVZd00xSVFQMmdmTTRSbHhZVEk3ZnNja010ZDRveTBw?=
 =?utf-8?B?Tnp0dzVOVFVWWW93NElHYmxXRi9FdHhIODdoZEcyaVJpSnkwVkRRTUNlRTd0?=
 =?utf-8?Q?Fr04M/Xs5Gc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVIwR2RxRGtTak5WNUNHMndrNHdIQVdjMlJGMFVOcStmL1dFU1FnbTFnTmJO?=
 =?utf-8?B?TmNYUGxLTTVxd0FURmlBelV6cDE2NERGUVdlcU1ZSlE3RHBnRFE1N1NrMno5?=
 =?utf-8?B?VWJPeVdvdWVVdSt4dTJFVXVSRVZyWS8xa3h0K25XTHhRVTgrMElRK2tBWDJT?=
 =?utf-8?B?cDd2TzBNV2Vhb3pheThmWVlzNFRaOHg4SjNUZzdDS1FPNGU2bnRhZ0hGS3ly?=
 =?utf-8?B?MWhZQTBCYk14a1BHb3Z3TjFnL2oxaTdSYXNXcWxSU3R3TkZFRkNwUlJaNTlF?=
 =?utf-8?B?WXRRT0dUWlNQaWg5S2JNK1R6YSttVVkxNWtWUmpTaWM3V2Y1WHZmaTM2WTVI?=
 =?utf-8?B?MWMvOGJjRHhiTXlzSTlWSDd6Qy9XZyt0bWhYL3FtaVNjNXZPRm1KbzhsbTBs?=
 =?utf-8?B?VkxFY0FyVWRJSlZtbDJoeFMvRElYdHhuQjI0YlVNbURhVERGanJHR3pKbkU2?=
 =?utf-8?B?R0t2aHBFYXZhUXNvVVc5eXA2OEN2NEFZa3dMOXBIT25jL0hCRnMwdlFmcy9S?=
 =?utf-8?B?bFFoNGpnZzd2WXBndW5MQjVUd0RkNlg5MVNGRGFRMkt3bVU0Yzhya1lRZHE2?=
 =?utf-8?B?eWRWcUljcSs2Sm9WVXEwemFaNWZmSU1CQnd2TU9FQ1VrbkxrKzZ2NjBjc2Ri?=
 =?utf-8?B?M2pJWk1LWG80N0hMUVJMQktaL2pmRHBUSlpHUWJHUldrS3p0eWt6dEtQbHdG?=
 =?utf-8?B?ak1qS1BhOE9yMm82aFlYV0ZKZkVDNVJMY0g4VVlzclhseExNV3ZTeWVoZkN1?=
 =?utf-8?B?UFRBZmJtZVgyeTQvOWxTUmtOZk95bHBRQ3dTakZvckVDL0cyNHV0ejVaVy9J?=
 =?utf-8?B?MmlRVlJrbnAzUTdMUGsxLzhjOGN4cE1uazZiN3Zxamx3K09EU2UzQWRnVy94?=
 =?utf-8?B?dDJ0dEVIVmd3VmRKMkRjaytwa1Y3dEdyOWtsWm1IcllBem5KeGpvUWlGdjl6?=
 =?utf-8?B?NDZUWTBYSmtUd1d5OVV4bG5RU2IwbzZzdzFwTmhKWEJwMTE4WkFZVzB2eWxU?=
 =?utf-8?B?elpiV0k3d3NRMXN0UDdSOTkxN0JtWHVvMkVlL1ZuWWp5V21aalluZVltWjZI?=
 =?utf-8?B?NVV2L3RkWlBQMHRvdHlENDk2cUhtMlR6UEpQWm5FR1dnRzhZYkt1a0VWOEs3?=
 =?utf-8?B?YmZnZU5Ia1NyWHRLZjA1aExDVS9yYXlhdTg4cXlZNVdBM1J6UmgyUFFQUjBy?=
 =?utf-8?B?UXdpS0ZjT3Zic3pVSGRaV0NiSXZBdTI4WlUzKzVuTXNxd2tZbGVVY1hlMEVK?=
 =?utf-8?B?MkNnVWtkSkNYL0JGUmpHWmEyMG5VMTB1Q2orVVBaZzhaTm5yd1Fta3RMUGhp?=
 =?utf-8?B?d0h2TnVsY1NWWUo4a1dCQmlCQXNoRklvVGZNOVR5dk5MM1lMM2JZaXRaRmRj?=
 =?utf-8?B?cEE0K0NmTTBLYTlaN29FSlRCekF0T2tPYTI3N3huL0cvbEdGWDhTZnowbERE?=
 =?utf-8?B?dWFkWWNUUncvSVRLVXZhSVFVVXRKUytyUzRqQWNvTjErd3Q3dTEwN3BvTEg1?=
 =?utf-8?B?OFpraXh2TDZkRjFod2tDc3lhL2xiYTlGUFo1UXpBOWtMVlYxN0pKVHVORmZT?=
 =?utf-8?B?UU1aVEJVd2d0ZDNzdGkwWkFObW5nUlBoR2swaUhYUjFzOUg1eXRvOEdUVC9X?=
 =?utf-8?B?ZXVDaHdnWEIwMnA3d24weVVObVpJVU9nc1hXR05FUi93YUVPNEZpcC9RYUZm?=
 =?utf-8?B?dk5mWXVCNGI0RlRFRmNmSUR4dE1qZFRwVlBpWTU2UnR3c1pmWHVMTEFDM25s?=
 =?utf-8?B?dWpJNi92NVBoNGJtY2JpMVcvaE8zcEVSN1A0UXd0UHpxTGt1emY3V3ZNUGxE?=
 =?utf-8?B?cCtnUHFIWEdrc1RzNUJPY0ZiWUUyRmNLMHUvL1Ayc09yNG9RbHl5K0tFQi8r?=
 =?utf-8?B?SU04S0wxL0NjMTc4MkZ1dzUyVlpRb3prTmNxRHJnU1UvS2VDc2gwREVUVlYx?=
 =?utf-8?B?dktCcFRFSHYyV3h3dzVYU2hZZnhKUXJBdEwwTmVaOHZsd2hZeUhXck0yQnpE?=
 =?utf-8?B?YlhURWNtQlpONS9hOWtybWdEK29zcWt4QVdhRTQ1Zzk0bWUyaHBFbzRHYXA2?=
 =?utf-8?B?bXBmNW5nTWluZ2IxeVA1UDNRUW5GN045aUdSTXlXejJsa1UxaUVVR05jVXNI?=
 =?utf-8?B?R0xrNEtSWTZ2NmhiMnRCK1dyaTRpejRJc1hsdjJXcnl4ZU13YnRFQmRYekFG?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b61030b3-1283-466c-e331-08ddc0b06ff4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 19:23:38.2982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VnoEXShVhNikYfzTRgN1ZPpp42Jf+f5AXB9sgQBZdi8/je5f3CtwgKUpu2gg35iTJ+eHiNwFV7U5vmDC6hseeTdqT34hqlNIR3tOjflVFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7213
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

On 6/26/2025 2:25 PM, Lucas De Marchi wrote:
> Document xe module params with the default values following a similar
>
> strategy for all of them:
>
>
>
> 	1) Define a DEFAULT_* macro with the default value. When the
>
> 	   value can't be directly stringified, also define a *_STR
>
> 	   variant
>
> 	2) Use __stringify() or the _STR variant to make sure the
>
> 	   default value shows up in the param description
>
>
>
> This allows us to show the correct default according to the
>
> configuration. max_vfs for example was wrongly documented for
>
> CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its default
>
> documented.
>
>
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>
> ---
>
> Changes in v3:
>
> - First 2 patches merged
>
> - Rework the last one according to review feedback (John Harrison):
>
>    - Add missing DEFAULT_VRAM_BAR_SIZE
>
>    - Define DEFAULT_MAX_VFS_STR based on DEFAULT_MAX_VFS if possible
>
>    - Bring back ifdef for CONFIG_PCI_IOV
>
> - Link to v2: https://lore.kernel.org/r/20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com
>
>
>
> Changes in v2:
>
> - Rework the second patch so the default is kept in a single place and
>
>    the module description doesn't need to be repeated according to the
>
>    configuration, suggested by Michal Wajdeczko.
>
> - Add a new patch to normalize all module param descriptions
>
> - Link to v1: https://lore.kernel.org/r/20250612-guc-log-level-v1-0-51f124a3be6d@intel.com
>
> ---
>
>   drivers/gpu/drm/xe/xe_module.c | 44 ++++++++++++++++++++++++++++--------------
>
>   1 file changed, 30 insertions(+), 14 deletions(-)
>
>
>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>
> index 192908fa074cb..064093bf1adca 100644
>
> --- a/drivers/gpu/drm/xe/xe_module.c
>
> +++ b/drivers/gpu/drm/xe/xe_module.c
>
> @@ -19,34 +19,47 @@
>
>   #include "xe_sched_job.h"
>
>   
>
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>
> -#define DEFAULT_GUC_LOG_LEVEL	3
>
> +#define DEFAULT_GUC_LOG_LEVEL		3
>
> +#define DEFAULT_MAX_VFS			~0
>
> +#define DEFAULT_MAX_VFS_STR		"unlimited"
>
>   #else
>
> -#define DEFAULT_GUC_LOG_LEVEL	1
>
> +#define DEFAULT_GUC_LOG_LEVEL		1
>
> +#define DEFAULT_MAX_VFS			0
>
> +#define DEFAULT_MAX_VFS_STR		__stringify(DEFAULT_MAX_VFS)
>
>   #endif
>
>   
>
> +#define DEFAULT_PROBE_DISPLAY		true
>
> +#define DEFAULT_VRAM_BAR_SIZE		0
>
> +#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
>
> +#define DEFAULT_WEDGED_MODE		1
>
> +#define DEFAULT_SVM_NOTIFIER_SIZE	512
>
> +
>
>   struct xe_modparam xe_modparam = {
>
> -	.probe_display = true,
>
> -	.guc_log_level = DEFAULT_GUC_LOG_LEVEL,
>
> -	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>
> +	.probe_display =	DEFAULT_PROBE_DISPLAY,
>
> +	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
>
> +	.force_probe =		DEFAULT_FORCE_PROBE,
>
>   #ifdef CONFIG_PCI_IOV
>
> -	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>
> +	.max_vfs =		DEFAULT_MAX_VFS,
>
>   #endif
>
> -	.wedged_mode = 1,
>
> -	.svm_notifier_size = 512,
>
> +	.wedged_mode =		DEFAULT_WEDGED_MODE,
>
> +	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
>
>   	/* the rest are 0 by default */
>
>   };
>
>   
>
>   module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
>
> -MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
>
> +MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
>
> +		 "[default=" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
>
>   
>
>   module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>
>   MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>
>   
>
>   module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
>
> -MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched (default: true)");
>
> +MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
>
> +		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
>
>   
>
>   module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
>
> -MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
>
> +MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
>
> +		 "[default=" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
>
>   
>
>   module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>
>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
>
> @@ -66,18 +79,21 @@ MODULE_PARM_DESC(gsc_firmware_path,
>
>   
>
>   module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>
>   MODULE_PARM_DESC(force_probe,
>
> -		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>
> +		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
>
> +		 "[default=" DEFAULT_FORCE_PROBE "])");
>
>   
>
>   #ifdef CONFIG_PCI_IOV
>
>   module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>
>   MODULE_PARM_DESC(max_vfs,
>
>   		 "Limit number of Virtual Functions (VFs) that could be managed. "
>
> -		 "(0 = no VFs [default]; N = allow up to N VFs)");
>
> +		 "(0=no VFs; N=allow up to N VFs "
>
> +		 "[default=" DEFAULT_MAX_VFS_STR "])");
>
>   #endif
>
>   
>
>   module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
>
>   MODULE_PARM_DESC(wedged_mode,
>
> -		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>
> +		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
>
> +		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>
>   
>
>   static int xe_check_nomodeset(void)
>
>   {
>
>
>
>
>
>
>

