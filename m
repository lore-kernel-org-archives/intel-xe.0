Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6CF606A335
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkntmwGQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=I2c8HuTC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B8010E3EE;
	Wed, 18 Nov 2026 06:54:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BEC10E3EE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 06:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794984857; x=1826520857;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A43XeBR2VblkZd1exnrmxFDD1ZNZ0Er37ropr2Mla8w=;
 b=DkntmwGQvpvpM9CJ0xIpItL64E1ZVr6xKbfgFIHvLSV1LqK4WnGk4MAY
 7QEA0JPJqSqs0Wj93gWlfVCbov+KcMZ8J5mSQwI2QTzTIQh0qg+miRUuu
 bD25XEC8CvyKfH19XYhd9rKHSre1C4QYIwA5N+6rEpUzS3xRkQ+yoB6B5
 q3gp+t9vsPC1qF0EdzSIZa4el8eV7PXJJ5dY7Aai6wXGD4rdMQX6SH8Mn
 HoTi6u8wVufEpTTLWXUx1hnG7PT+krTCBgrVfSRVFV3YLYH50MRWrJmGX
 STvteYrf50AbqrFIQ0lavwthZ0JkuIJLPI10bxuG8IlGZE2l9hlUfbSlU A==;
X-CSE-ConnectionGUID: MvN2ncAyQv6gRqloyen6+A==
X-CSE-MsgGUID: BV5buer1TaidWnpT+ZNFQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3791766"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3791766"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 22:54:17 -0800
X-CSE-ConnectionGUID: mQhQEfeHTa6UD6NAlTUHdg==
X-CSE-MsgGUID: rA9zOpvCR0CnMKy9v/pslA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10381370"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 22:54:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 22:54:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 22:54:16 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 22:54:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxN47mAr4+ri3UW3kZ74ZL0XkrFDjrUsL7OXrv5ZlXuT0Ms0EsDEaLKb/NCB+ds5NV+Jbn+xnhtkyabH1G8vpzfYdnWhZ7FjMYNPpl36KDUCcijgE+YM53tRkhQL3Qf9K2BSqHuZ/dtXwZ/4greKHnkn37Jj/zoavG5YAc+9raepzrVKys1mOfOs4Ve1wqcjUjwyGpTzQorWps1ybpc4wpO3GUou4iSnej1Bk4syi2GqtswPxgRXUSsq7ZSy+1y6hn0nJSROC2MSRpbhk4fDbDqNXu9zOdmaIwVFE/EI3CtTuhkiSoOM5AInaK+UnFzmKWjOuDjHeD0U8pwVgL+xMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRa8oQciMKRjfabq/EJorLAZ3FgGuav4U2Cxf7HTebU=;
 b=J1+oodFNSHiP+7W6/Ndaz4TX9XtmJPxiEHmyJ4lTa7/4SaOymYD8I/xIgLIWxi4Pkeq9I4iLMNHi9mc4LD9wcrPBX0oWStNVj/YqT4+VDjlCgcphYCeHqzCc2Zxz21i+gidPRT2c9Nz2m2EouH7gd87UgFW9RS0AcJeRoVA4QfErBt10jJvh0nSAMsKqpE8U3Mm7EYneY2XgmguQJZwZdgeIAuXdZGA2j5VOiphLvFPHtGhC4vKcnx0fuCWTTgbXG53x2h6KinV2au/brtR35CobnRG5aM/He1pQtTA+6VJ+KIEMmh/1arC6Z6jYOHEfACaMh4sG21tzlyFjiSSjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRa8oQciMKRjfabq/EJorLAZ3FgGuav4U2Cxf7HTebU=;
 b=I2c8HuTCyn8lV9mu8+VeCN6tsBFyKkQUWN7eSPTlUffcdRXE9cS6gYWysEtr1e2/TxPHxTJy8BojTNQSy9bBU+k7YvVejbfDqUtSgBh65S7wmpw/litWn7iATpYHIpAJQvcovII2bT8LIEkRAkSKM49/7DFvnZIP1kcIC25h8pI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 06:53:46 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 06:53:45 +0000
Message-ID: <5dba6679-3d4c-4710-a6d4-dd5d1af60824@intel.com>
Date: Wed, 18 Nov 2026 12:23:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Rename xe_vram_freq to xe_vram_config
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <sk.anirban@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
 <20261118062301.4135537-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261118062301.4135537-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0255.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ2PR11MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: ae758d48-06be-426b-46a2-08df4540b05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|261022113327099003|261022105027099003|4143699003|10067099003|261028144727099003|261026121527099003|261021123027099003|261022075727099003|261021121427099003|261102123227099003|261026140227099003|261009223027099003|261009221227099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: E4kZAAhmQ49TMOX0BDGFyf0uE30NLPNGN+RnPrsX7JlVYqAvwN1Y2y3TUMs8Cc8cAbRVnhZOUkGD+1cwJ4LBEhI9R4AedNSBOYRVz/ER2B3pYzmT4vIpUfa+oc87MwjVy4IysIWbm+vA9N4b/5csSRVnMHWudQ1Ttve/Dlrbs8IdaZO1RPcNDdSqjT5vfAA3IhOWtZE2TujBptBkq+SEBM26YDi84ricYZAM8d9ItUeR9tuscR1XdzL3Lq7HVILLwEGjFDAD2rXbHdQhtVbANmKriPyrQU3RnsayF3wRM4yzDt07XeEqH6zAa/MyR78bnyCHsLeW4QsXvp/tK6AofCiNoV4AkzztzbdYJ5RXsA5wnQ8n5L6y0sExBrUVB7BpYpbCNs5f5TllfPx92nUmIsDOq/xJ2b7YZOnlaStGik1sU+TAP7JzHk/qZMZhgyeap5rxSjBZzhwxWNDVBa76eDnXU4oqYSSamrzOOFw7jC+1SVEtUvHE/YqejmJEJuQ5QNOBl5IdZZw3ukhkXoDgZpmkEzPOCMnD02Uk7knkEP0wYZAc+MZK+NJ3CbN+uUPKCl/1oTqTzotzy6pT4d8p17gq8qrhDi2ivXTD+P6PTiJrsg3NV1S14uox95ZXz0N39XcyGPdO1345X1DAyCiwfv9s/DTZR9/kB5AHpdCIkfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(261022113327099003)(261022105027099003)(4143699003)(10067099003)(261028144727099003)(261026121527099003)(261021123027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009223027099003)(261009221227099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NExhTTlUaXg1NmxQVm93b2lhL0RtRFMrY1JVNmpIWmM2V2RWUEVkVFhkdFNr?=
 =?utf-8?B?Q2c5Sk9GZ2NpM1BIQjljWE5SekRjdHJtaURENjJKdHJzNmtlSTlka2o0Z3hK?=
 =?utf-8?B?dm9UdW10NWVVMVBIZHlBMkczWFRUZXdjNGxvZm1ia0wzUWdoZUxOaFpqNHBs?=
 =?utf-8?B?bDJkV2s4TFZNTGdtVXlYV2s1a1dFd0s0Y1k2MjBxNlR4NkFhR1J2RFRGRGR1?=
 =?utf-8?B?c3NTNVBjcnp1RVhlRjM5eFRHYngyR0VlUm82enVwb2ZOc3JGQVZoSnAvbi91?=
 =?utf-8?B?QjZuY2hQSWNDTVR2cVI5OGtnUVpMdDA2L2NJYlh1R3BWc0lYa0dTaXVDMlN4?=
 =?utf-8?B?cUM3MnNNeEtaZy8rMThDMjZXYnFKMzNOM0NyK1VYSnhuQ0dqU1VGMHNLM1hZ?=
 =?utf-8?B?M3BaNjJKQU5BTWFvZWxCNUV1clBRVys0akZ0a1Jxc2JuWVZYRnB1TVhya2RK?=
 =?utf-8?B?eG16SlVOTFlpY2prNU5UTWNLcWFLYXU3RVQyU3dnM0xtTVQ4VjBqVUNSZEZM?=
 =?utf-8?B?QUZCUEU0eDV6SlkzNG1iTU1aZVdXbVlOT3NwQ2JwMUM3UVJJbU9jQlRwSDhQ?=
 =?utf-8?B?eXVJY3BtRlAxNW5td29qSThUMGN6NkN2ZTVUaWxIcGt1ekJYSkl4S1ROMzE0?=
 =?utf-8?B?citmTGZyVTlyV2poWUFRSk1tbTVrUW4wQ2hrTkwvQnBLUE9YM0oya0JDN3lv?=
 =?utf-8?B?Q3lNS3BwODIvNVlmVU1aemN6MTQ0NkNEaEJ2RU5HbmQ0M1Y0SnZmZ21ocVAx?=
 =?utf-8?B?ZCtwWnpJMVVMWUVvaExSd2pXOEZOdjNQaWUydU1sQksvc0JPRm96U240VGEw?=
 =?utf-8?B?OW1oV0dSZ1RsdlhZOVJwVDFXdyswWVVqU2NnN3N4OW1SZi8wRytMTGtJY282?=
 =?utf-8?B?MTFPbU9TVDJMandjSENLTmQ5UnY0eFFHWlVpYWlQRkppNk41S20xMXlxWXky?=
 =?utf-8?B?V2FFNndpZnN1T0krSVdTdTNpVTRPZkNqa3BpUUhibURLSlR3OEZaZG8xaURa?=
 =?utf-8?B?NXVDeWl1dWI5RWxYZGpBWnY4aXIzWHBNbkdMeXZ6SzE4cnk5UzhQYXJFVkdI?=
 =?utf-8?B?L050ektLZFZha0hPZFdWN0ViTW5VSnpZSHJjRkFQQnFUZHk5T1lqV1Q0VENl?=
 =?utf-8?B?djQrSktRalY3bjl5NFNrRW1rVUoyVk45V1RNcWxscW5Mb2xVbGVpTDBDT3JU?=
 =?utf-8?B?WnhzZTFrcXYvdXQ2eXgxRlBIcG9OYVQvWE5yZVpCRENhTVVDVDZ1dHE4VVNV?=
 =?utf-8?B?cGdFeWJ3MWVFUEZmNVpUUHQrcVhwTmEzVU9lUWRRMDFsZVA0RXMxN0ZQalV2?=
 =?utf-8?B?bWpGRjhFMzlmSVd0VWRLTE9RVFM2d21JcWhma1NLajlBMEJsZGlQc0xYSmxq?=
 =?utf-8?B?cnU3bzUyU3luVVRLSFNCZGZjRXkyemI5YnFKRU80MjNDZk45ZkdUMjFKZWFC?=
 =?utf-8?B?bWVYV1VRTEJZNWhCZkptNy9TVThwdG5VOFR2NUVuY21xbE5XQ0h1SFA4Nmpj?=
 =?utf-8?B?eEdhSm9XVWxOYkVPL2lkSVBVd29DdEVPODRCVmNIRXIvbEdpM2JRcGxXdGRL?=
 =?utf-8?B?Uk1JbzZIQzgwQWJYMWVWS0I1M0lSbU40RVZ3Y3IzMzZvNzd0dEZsSlBqL0M2?=
 =?utf-8?B?azNpcnZzUjJEbUJIb2NxcFRWcU00Rk9XTW1oVDVBZll2azc4SjlFbE1sVVpL?=
 =?utf-8?B?Y3Vzd0wwb1ozYW9OelJOTzcrZ2V0YnNBdXdLQW1qdGQxUFVBME5mUXBZbXZZ?=
 =?utf-8?B?NlNjVktkdUZycDRxMGh4bEdFaW1aWE9lV3pqNU5MUXpsNHlnbm95dUpNMktN?=
 =?utf-8?B?MDRza1RGUUU1aW1GY0Rlek9pUUIvTWUzRmMzYzlxVGMwLy9hTnRFTHdnb01t?=
 =?utf-8?B?N1pNWStRenMyMzljN0F1UVZYdGZXQ0VhTkt6T0h4dTcycVU4SEZTWjVXWldP?=
 =?utf-8?B?amljOUhEeDd2eGo0SExHNTlSTE1BYk9JZDY5ZlF1dWlMeTRyVCtKT2NhVFdn?=
 =?utf-8?B?Nm4xNnRPWklZeWJHYkNweFAwWUh3THdwL2x2cUJYWjd1WEozVkJnUzN4SXpv?=
 =?utf-8?B?VFNIUHdPUEFxNGRpYnBlY2VDT2xaeUNIWGMrNHZjTlFKa1Vid0t5cnRRY0kr?=
 =?utf-8?B?R0orL0NPSkxPNEk1djhYZDRuVkJ5TW51T3VrcVJMcldUOThmT2txdmdPMEFY?=
 =?utf-8?B?bG1GcWFnanVyUXFSby9qamRNNkpzeXZQc3pHN1lDRVBpK05TemJQMVlUT3I4?=
 =?utf-8?B?VFdxOEhyd2pzd0tHMXpsY0hpNzJQckJXcEJ6aWRFQS9FVVVqejk1c0puZWNW?=
 =?utf-8?B?NTE4c3hhcXBxdVpDSEh2M1RYWmxOa2MzSG5OZWw5TnFlc2Z4Qm1lQT09?=
X-Exchange-RoutingPolicyChecked: 1/c/uEoIREyNvD6AoPwc75PPo5AP0y0Jl+7/yPJSIXn/bjDKATOqs3PdwEBrFZl5fBwY88w6wKc32BOBO8v69mtPa3FlxpIlz013kVUM63J29snKVhCtozPPGJ78z3b7cFz/lalYwXTAxWsjNF+iSFIZEHB4LxYKR7VFM73PWQkm67nMeRL9gNOu7ystu3JBzaCDOoXwEyJe98jrS1SmPv9wl9IXtpAppIFUnxl33hBsuRXbQZFM3EJXoGTkiVe1L7crVkyQdw4gC/CdydZJhExv7ZZHmi8Y7i30fbdZycpmyDnk5WHx5c4ZrcHPprBf6PGB9xXGOI86/uboUZYlSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae758d48-06be-426b-46a2-08df4540b05f
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:53:44.9991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEULPn9+YSKoT4+XmmiBXJk3Ues6dBFefwBQatR5c3FuZl+INfH3zKvsfC6iBCFKHx5VsaNQKvvDmvGWT2oDFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 18-11-2026 11:52, Nareshkumar Gollakoti wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
> The tile memory sysfs component is about to expose memory configuration
> beyond frequency, such as maximum bandwidth. Rename xe_vram_freq.c
> and xe_vram_freq.h to xe_vram_config.c xe_vram_config.h.
> xe_vram_freq_sysfs_init() to xe_vram_config_sysfs_init() to reflect that.
>
> No functional change.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                         |  2 +-
>   drivers/gpu/drm/xe/xe_tile_sysfs.c                  |  4 ++--
>   .../gpu/drm/xe/{xe_vram_freq.c => xe_vram_config.c} |  8 ++++----
>   drivers/gpu/drm/xe/xe_vram_config.h                 | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_vram_freq.h                   | 13 -------------
>   5 files changed, 20 insertions(+), 20 deletions(-)
>   rename drivers/gpu/drm/xe/{xe_vram_freq.c => xe_vram_config.c} (94%)
>   create mode 100644 drivers/gpu/drm/xe/xe_vram_config.h
>   delete mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4377f60f5dab..b0ce47fbac9d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -150,7 +150,7 @@ xe-y += xe_bb.o \
>   	xe_vm.o \
>   	xe_vm_madvise.o \
>   	xe_vram.o \
> -	xe_vram_freq.o \
> +	xe_vram_config.o \
>   	xe_vsec.o \
>   	xe_wa.o \
>   	xe_wait_user_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 510aa0ac4428..c944579a17c8 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -10,7 +10,7 @@
>   #include "xe_device_types.h"
>   #include "xe_pm.h"
>   #include "xe_tile_sysfs.h"
> -#include "xe_vram_freq.h"
> +#include "xe_vram_config.h"
>   
>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>   {
> @@ -49,7 +49,7 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>   
>   	tile->sysfs = &kt->base;
>   
> -	err = xe_vram_freq_sysfs_init(tile);
> +	err = xe_vram_config_sysfs_init(tile);
>   	if (err)
>   		goto err_object;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_config.c
> similarity index 94%
> rename from drivers/gpu/drm/xe/xe_vram_freq.c
> rename to drivers/gpu/drm/xe/xe_vram_config.c
> index 8717367ccd4c..31a3405c39ab 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_config.c
> @@ -9,10 +9,10 @@
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
>   #include "xe_tile_sysfs.h"
> -#include "xe_vram_freq.h"
> +#include "xe_vram_config.h"
>   
>   /**
> - * DOC: Xe VRAM freq
> + * DOC: Xe VRAM config
>    *
>    * Provides sysfs entries for vram frequency in tile
>    *
> @@ -93,14 +93,14 @@ static void vram_freq_sysfs_fini(void *arg)
>   }
>   
>   /**
> - * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
> + * xe_vram_config_sysfs_init - Initialize vram configuration sysfs component
>    * @tile: Xe Tile object
>    *
>    * It needs to be initialized after the main tile component is ready
>    *
>    * Returns: 0 on success, negative error code on error.
>    */
> -int xe_vram_freq_sysfs_init(struct xe_tile *tile)
> +int xe_vram_config_sysfs_init(struct xe_tile *tile)
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
>   	struct kobject *kobj;
> diff --git a/drivers/gpu/drm/xe/xe_vram_config.h b/drivers/gpu/drm/xe/xe_vram_config.h
> new file mode 100644
> index 000000000000..98903911f658
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram_config.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_VRAM_CONFIG_H_
> +#define _XE_VRAM_CONFIG_H_
> +
> +struct xe_tile;
> +
> +int xe_vram_config_sysfs_init(struct xe_tile *tile);
> +
> +#endif /* _XE_VRAM_CONFIG_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h b/drivers/gpu/drm/xe/xe_vram_freq.h
> deleted file mode 100644
> index bf726bc5881f..000000000000
> --- a/drivers/gpu/drm/xe/xe_vram_freq.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2023 Intel Corporation
> - */
> -
> -#ifndef _XE_VRAM_FREQ_H_
> -#define _XE_VRAM_FREQ_H_
> -
> -struct xe_tile;
> -
> -int xe_vram_freq_sysfs_init(struct xe_tile *tile);
> -
> -#endif /* _XE_VRAM_FREQ_H_ */
