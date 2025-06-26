Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D17CC7115B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0B610E275;
	Thu, 26 Jun 2025 07:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHok+guc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CA610E275
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750922115; x=1782458115;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=B708jp7tKwF9f6Babd4flkHcpdozWoor6Ng5SCuIGTw=;
 b=BHok+gucI6yAqENKS4pXqwa1jeTWCTOJLKHaUuzIzzxbzncCXPaI1FBL
 zbQsAvSUHlaJK/zQdnmYWOBiiDh4gZkZYJ7ae2JVrE3rQAVT/8UshE5Vs
 ru9somwNNc+6JYK0ZASFRb//4UUcQPeceUYqVN5Q784MQ75PQQ/OonOOA
 EMeAGp7L47EsDcQw+gtvEqPBpx1ZJNht1ChnZmJtSHyRNdS277c8KwYqE
 xf3YGVONf8ZA0G4HMXyR5W4EKNnR1YEPJrXWCSOxjQ5q7gHsm11Yb5txp
 QNFzSRvQEIDPZe/ohCmyU7bYsk0bg+/nPOJClRBZFB9CK0iPO0X5TtUN9 Q==;
X-CSE-ConnectionGUID: YAMXjDBLT1Wc7mGHhZkr/A==
X-CSE-MsgGUID: h+Qtudd+TJabN/c8vn0rlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64267050"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="64267050"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:15 -0700
X-CSE-ConnectionGUID: mxcBOC4+TAuK+7Abz2La+g==
X-CSE-MsgGUID: xDirOzawQLKnQ7iVqhCrDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156702088"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 00:15:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDLUMSDlYjrNz4PteRI09akZsP3OKXBExwJ7/kXTxdTJDr/Em8jH17rjgIPAhf3ggJIWut5BgGdETkvUD04659WSVnHdcSfLhB5Sb2jUwCx+2pmEPZHDGMNq4i/o8dO7HDZjXsUDtNmDO7d1cMrJFANryZvVVTjyiOvTUMqKtdJyOj2MZtWy3oU5ZOvo/U3+U+zLqFOSzfJ7rdYTsqINHQUB9++Dbxxu2wpaNc4KS0j+Sh9adzWI5OLl9cHAvPv0qcOEg4oOk6EJjK1jzm37jrleh9U86ETHMUSRNwej2dTnGpDMTPtLdXGYX14cOGU7qOAeS7opgn60ab51K/CxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze7qmqYLv+piFyD446D4Wp6a/k3cDiNzY5LnlquKj1g=;
 b=Tm9RSNM9bz+V1Wa5RsUslDaBSvgBJJ42kysdqO6OtXzpFQkelCgjGZkd3GqNLWO10Je2Pu7ak++NYoowFrEyrEI16Kw2lJBqtkT4a04nQs6Iw0H4k79yQBDM0MrEpY/GBwsjQJCIgQCO3kxcjjYMwX58ncoTyxU6+3Mtn03vZyDCCKB7lk0fINNExRRK+caZjEIQjcCztTvWy2EviefrVdz4VbsPEzia+uMNoqbF6zCjEMPYxxFscVI25jTYYSMs/2E6lvi/E1Fw9qO9sFK7GDKaG2FzHtcgEgWH3LVhulW+ydRsr9ky6fsVWdCniMj9HcZxkrCvffzorsHO+v+YaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 07:14:43 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 26 Jun 2025
 07:14:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v6 0/4] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Thu, 26 Jun 2025 09:14:33 +0200
Message-ID: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0248.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e756105-666c-44be-e3ce-08ddb4811ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlpWbzQrM0FkbTZQNWdsMEFPc014ODNjZnFybXJGT0JOR05qaGdTYTV4RGVK?=
 =?utf-8?B?RXVGTlVsb1NpY0x1bWJxdEtndDJrWlFDK0k4djl2QkdtcXhLVURBZDVkU29t?=
 =?utf-8?B?QVptNVNJN011S3Q2ajNEbGdrREpFQWVCdUhxWi9yZWh4V21Cb3FSYWwxT1NN?=
 =?utf-8?B?aEt6VCs1MlFOQis0d1pnOTZ4M0d6NGhmM1J2RFNHQ2JYNHJQU3g2U1liTlFZ?=
 =?utf-8?B?SGhDbVhMMHhLV2NkMnFzOEhhaG5ULyt2bVFDWUxuV2ttdnJzN1NkOGhhUDU5?=
 =?utf-8?B?NEJ6LzlRTmJaeGtTNWNVclR6QU80QU55ZEs0V3NmcllpaTByQ2c3SEh4N2FX?=
 =?utf-8?B?TWdHQXFCVmc1SGVJQlNaUzlZZnlWeUFTeU1LUmtyeVh1YVRoQm9TcnFOdENa?=
 =?utf-8?B?RCthZk80OHNoUUVKQXRlUnpEY3RvVkNGODl1bkRlM1FVUzhmdDhhbm1nNno2?=
 =?utf-8?B?cndQTzYyc0h0TmIyVUdpTlpxTlZwd0hoVi9LS0xKak5VUjd1Qy96OUx0VVUr?=
 =?utf-8?B?czFXZXJWMDhubXlqMURGSytrMTFob05qL3h1NTlobHBLdHZzakRqWGJRc25q?=
 =?utf-8?B?czRxeENHNVZrUXJVL0JHTENiZG1DR1VwRW43OWxETm5uN3Z5bGdBMGdYWjVx?=
 =?utf-8?B?SDQ1cllQOXZxQ2x3T0E1aUpDSVNVQ3M3WEdFUEltRDFYQXRwYmR4NCtRd1RP?=
 =?utf-8?B?T05yY0FYeUZsOFlFQmdzTzF4VXhVWE9hYStxNlRNZ1JmQ0NjRmpPOGNZY3NK?=
 =?utf-8?B?RzFpQVBrUGp6SFYvSFdpNVhqWjRQMERwVW1XcmdEMDdHRE1PRGVQYm9uUnlD?=
 =?utf-8?B?M2k5OFJ4Wk1nYmFXNUE2RnJIUUpGVGhTTDBQdmhzOWZIc045MzdEUXUycm5F?=
 =?utf-8?B?OW50MEkwb1dqT0tJcVp2YUVNVGtYcnVXUWFKOHk1UEdseU51L1BoWDVoK2pG?=
 =?utf-8?B?bEhtSS9uWkpRakVhNWNhbllHMUdqT2ZEU1pyaFpheXhzcDJrMXliamVBRkw5?=
 =?utf-8?B?R2t3R25mQ3lpM2FuOVNRQWpKY3RiaWdVcGNCSWo2OGUrVjJ1THFqOHRaSStl?=
 =?utf-8?B?TUo3RE5EcG4rRDNUUkxRSFNsYndPeXFvbVZrNkJqVy83MkZBdHNjWUxNNnNu?=
 =?utf-8?B?NHFTSUdpbUFIR0EvQUtUWThKNHpDdmovd0tiSXQxNDBBbXlzZ0pqMHB3b1gz?=
 =?utf-8?B?ZnFiQlFwL0RjUTBiWDBpbWxCOGw3REJiUExQYnNpTTBWREs0Z2lNY09zQ2FT?=
 =?utf-8?B?M1dQYmVRb3krRGJVSCtwdGZkRzRqeitFWnhRMzNPSkpzTFl2bERkSTNuUFNy?=
 =?utf-8?B?SlZJRVU3MVc0NmJlVkkvWVpFTmN0eklvTzgvNHdqcUZOeEw4ZGVOTWxTNXgx?=
 =?utf-8?B?MXVVc2dsTkdLTHh3UUVQYnRaV1ZSNDFLcTJtdmcxbmN0MmZrbmhKV3M1TGR1?=
 =?utf-8?B?WnZ4VzAvVktZQ1lMQkt5YWltWmdVdHlSY2xybE5QTzVDRHU4eDRocC9mazht?=
 =?utf-8?B?RUJSejVlS3NvcUgvYXFPNmJCN1kwM2hzcmlUVkZEaUtRT0xpZ2NmbDd0aVNR?=
 =?utf-8?B?Z2lsSExkWDRlVXBBc0dVV3hrSHZLMDBVaGVFVVNEMnArYUd4a3duVXZ3eXBp?=
 =?utf-8?B?VDNqTW9IcTRBRVBOUnlEMTNBcjBLNW5Ea2ZUbjRRc3hWZUpHTkxoNUJybVN2?=
 =?utf-8?B?NFo3M1R5ZG1zMnBOSWJwVEI1cklvbmFRR0tOeXhZY0tHcGE2MnMxMjFHdmEy?=
 =?utf-8?B?aGFaUmlId0dJcTltZVlFaVUxOTNnZEt6cGpzY3FaVUhsNjVLQnpCNkkyZEFT?=
 =?utf-8?B?cVhUKzJnRGhKL0hMZnhKL2FVN0VUUjFibDI5eDBOTHdPT0ZKeGhhTHU5YVJ5?=
 =?utf-8?B?SnFRdmlQdUlkNm1oTVhlVFVFUVByNU1yMjlFWkF5djc3SFNMRlRETGFXOGVQ?=
 =?utf-8?Q?AwuDfOi1AKk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkNaSVRQd3JaQkhrWDJiRHNEVjE5R1NLYWJkQUlEeUJCRGRNTFJKWUJ3NjQ4?=
 =?utf-8?B?d05xcGNadzRFb1BnRjdFWDhJV0xmZDlWRHBZdWNQQlM5KzB0ckorQllsYi9p?=
 =?utf-8?B?TkpCR3FpNTlLbnNRRzFmdVRCdFNjQld5L1FYamZ1U3lOSE15Zlp1b0pabEU1?=
 =?utf-8?B?V0Z3LzdKTmprSno3dWZkVGRSTXhoa2pkejdueExud0N1OTBGWUx5NjNLQVdv?=
 =?utf-8?B?V0F4UXJBUnR2SVdWN1RWcVhRcnVtL055d090c3VuZXlDTUpiMHpDczBUQzlB?=
 =?utf-8?B?SEgybjFnZi91YnVTMWJJQ25BSlM0dW1hd0pqTFVwbzFSUlVhVWRLM1hSbnBx?=
 =?utf-8?B?TUlyZU43VEM3TmFuYVp5Vk5XYmFRL0xab2NzOFdpZDMyanViR0Q1eTIxdk5z?=
 =?utf-8?B?OU1ZUGhkYVpBdnNaVHo3eHR5MGo0UENsc29KTXF6TklsYzZiSmVJNG5hYlhn?=
 =?utf-8?B?ZkJTMjErZ0RUM2lNVXEzekRzV1Z6VDJ6MVowamhJYWdSTVc0YWhSTCtmR3hz?=
 =?utf-8?B?dXl6RzdydmE4OGwrYzQybFJjY0hiK0h3MFB6VXMwYWlwUTdSaUJMbnp3aEh3?=
 =?utf-8?B?anY4Y0hxWTh2UlJZZjlIcHhKb0ZtODI2bU84eHAxRGl1UkFZTlAwdXR0ZTNa?=
 =?utf-8?B?Mm5xRUU0dnRvL01uYU4xSGRQYTI2dFRCZ203c3ZyQUk4a3BIQlhtTG5scHNt?=
 =?utf-8?B?QnFlNzh5NGZzZHZwMEQ0YkVUeDFKdkZ5d3hSQTVMdmM3YlFRcnhYNFV3TjVP?=
 =?utf-8?B?dkJWVFhFdmEwUGJYL05JUEM1aHRiYVhQMGN2d2hnTGhMTXNkZFhGaTIxMXQ3?=
 =?utf-8?B?aHBlbUtpb21hTG1YLzhVdTdVOTEzV1dsM0NKZ09sT3ZhUGxJeTJQMldzR1Ux?=
 =?utf-8?B?Y1BoSFVCcHhrSWkzVTQrK25JYTBEL3JWTTZYUzM2ajN3aUxuaFZDNk1oSzFw?=
 =?utf-8?B?cjdwWjNJdU1iZVdmd2Z3OHI5Ky8wbG1EeTBQMC9wdHVXQXV0ZDZqanAxQlJN?=
 =?utf-8?B?emZsOTZMaXRzMVYvRWNlQmdkSTViWjQvOEJ5NHlhQ3VYeU9VOFJlREhhUDF6?=
 =?utf-8?B?UVVNTW14ZysrRk5yYktadEI1NkhDK05YNDhaeGROT2dHVU9Tb01nM2Vlck9O?=
 =?utf-8?B?ZjBWUmJudkowbklFcjZJQW1KU1QvKzREZWprdDNnc01mUGc1YWpEWFhyclN2?=
 =?utf-8?B?NzhUYVNTQlpYallHd2Nya3NFWnk0L1dsZmtMdUo2Y0hNYjlGLzdzV2tHUDhX?=
 =?utf-8?B?emZBTHdSZS9VVHBTR3VaSFpRcm5vM3hVMjk1RGd1YjJxbUdtMUdxQWxhRGRq?=
 =?utf-8?B?amlqSm5nUUVNL3lXb0FZNm1QL3FML1dVdERuQTRZbGZyUlZwRlZLNjh4T05J?=
 =?utf-8?B?VzRoODROWUJhZUZCY0h5OWRDWkFHa2RyYjRpZXdUdHlsbytaSTVZdjMxOFBa?=
 =?utf-8?B?dk5IeW91WnBKRitVTEFVMXM2RUNWYXpPMnFPVFg3TWNnZE5BUHRsWm1vTUdB?=
 =?utf-8?B?WFowVXJhbEhMUmt2Q05SQ2ZJRCtGVVFUa1l3aktESFVyK0ltSE1SSkRxdkk2?=
 =?utf-8?B?cUh2TGpBVStEMXlaUXR5N1R5eVNNTXhIYjJqVjExbVAvOUFNSng1MXIzTFZs?=
 =?utf-8?B?ZHBiUlE3SFlNUWRIWnM4MmxET2RLcURvTUVaYVlod28yMHVROEx1aURnOXYz?=
 =?utf-8?B?a3NLZFVYYXBTZHBrSFd4aURJVWNGWHpmUTJWRTFHTzZNRVZXYTFVTGE3QnJr?=
 =?utf-8?B?VTUxY2QxY21JNDErWW9CTlBqVXJCMldPWFVGZUxYanRGbzNqTkx2YnVJV0Zj?=
 =?utf-8?B?U0NPR1kxdXlFVHBvSXZjV1ZDN1hNU3RNSkN0L0VaQ0hLNG5IbldiVzVDUHdi?=
 =?utf-8?B?T0tkTzNEWVdmTFp6S1hxNjdVWlNOdkZLcTJDSjVSUnF6cGkzM3gwdDE5WDZE?=
 =?utf-8?B?ZEo3VzhCR3hnb3pjblJzUnlvUTIvNXc0eWIrSlhxeGw5aTJPVHRMdkhaUks0?=
 =?utf-8?B?LzhXc1NsSE9ZNUpSR2dSVm5uYktXRDVBOSsvN0dJZ3IrQjAwOEZiYlB5cVNZ?=
 =?utf-8?B?YzFKWGNRM1ZkbDFLQVpjZzdEQ3c4RkQzUDJ1WXV4d3g3UWtKZG1aNS8yT0g0?=
 =?utf-8?B?T2NEZ3NqMEpnSEJaVWM0NFVTSUI1WnVoUkxSUGl4SWNQNUx5bEhwQW5PR2dJ?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e756105-666c-44be-e3ce-08ddb4811ff6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:14:43.7925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBYv7ihq7yjmfh4Ur0/nNUplL8swNWxsflI4Exltu7s5zwowvvF9jx0nI27/NPEiqiSzhOgE44e62KVe+g1FPhFg2MylLUwb5tOpnPLhIY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.
v4:
- add new patch "Use devm_ioremap_wc for VRAM mapping and drop manual
  unmap" (Matthew)
- add new patch "Move struct xe_vram_region to a dedicated header" (Jani)
- fix null pointer dereference in xe_assert when VRAM region for tile
  hasn't been initialized (Michal)
v5:
- Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v6:
- Fix build if CONFIG_DRM_XE_DISPLAY is enabled

Piotr Piórkowski (4):
  drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Move struct xe_vram_region to a dedicated header
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   3 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   3 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  20 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  62 +------
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  19 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  18 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  58 ++++---
 drivers/gpu/drm/xe/xe_tile.h                  |   2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   7 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  19 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 163 +++++++++++-------
 drivers/gpu/drm/xe/xe_vram.h                  |   5 +
 drivers/gpu/drm/xe/xe_vram_types.h            |  82 +++++++++
 20 files changed, 315 insertions(+), 181 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

-- 
2.34.1

