Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586B606A329
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fdh1cKUV;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Id5tpEAb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8038110E8DB;
	Sun, 15 Nov 2026 12:07:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0910E01F;
 Sun, 15 Nov 2026 12:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794744454; x=1826280454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hHjZ8pH27lVP/hdBT0HSChsv9UyHLsfqS0HNDuN+rhg=;
 b=Fdh1cKUVrLP8p2FVuKwyuGo0p+qlvQ1Ew4fWelDmNsfLu44Bysgps1JD
 oxHwr20wpgTFjKPBaR7mRnowPSTCtxIK7qWWM6JX0lobXEyhMqAsllpza
 EUGNGzX68I5evtTgfpFnX9nDtsjEQ6QGET3m/Glaj6hw2fvtuXI3JyU5+
 +6iJnow9i/ewo/e8NyUGRUB54SPM5sMwbN7CObFpAlamgNy6p0NF9cijE
 hQYkxfoipRNgJyo2uK2nIDXa6gb/6caMpfg5kdnAxL5XLEIsnPBgpC7Wd
 nIU0XxEykTBoUvemw7r2ohCMxcNEbAVHVw6CVuq0GbF5OxznL3UOn1g2S g==;
X-CSE-ConnectionGUID: 2LwSErMpQgaJEdhfKKAxNQ==
X-CSE-MsgGUID: 5aac7XzxQ+21Yeq7ByDKgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3534658"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3534658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:07:24 -0800
X-CSE-ConnectionGUID: stHIqsEER56y+Vm8sLRVUA==
X-CSE-MsgGUID: fXqHpfBUSdKxdaeAFNJ6Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9256132"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:07:24 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:07:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 15 Nov 2026 04:07:23 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:07:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTPW18/+r5qMyxGShspR61NA772nuLOGl80G7VcDSHBe4YId6jHDJf0I5Kvol+S6zKwmMoARw9lpjqgWPmwLsjKCxE9K+fkt5KeUx2AfWp73QhcdLVscwDRkXxda8lqXm+z3Pnga2QEJ5ADMSxpW457XpYJdGKDHSbi1UvHdvkMgt2xlwwmKkTXolXr2SNrfU0WmW6WStFHoxnnJPltrHz4bV3flYEhhdGY2bzre9frWheJRO3o/vinD2gnO8kaLTh5IbgWni2eH+vjJiD8vRm/thPqD4d3B5GaeGdteNocb7cBwxD/D61JqzR7YPnXkryqwJM7ElnBClHz4sC/rmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0sFyI/eiGy9j/P+o1CacV+gmEDTaqGB2Z/0YhVGaL0=;
 b=BtIyULCGo7DRu+TGPYDlDyqPijQGnfy+zf9HM84B7a7CvuppWoojAouB6Kx83WZwfrMRpCBkTEGTCPF2x46nc5gGBy9LSc7cG77JBCcbVD5miZOCG/RFrvceoQSqh1uMb2xfAEV5ZCiEns1aB88SCrBuvFMq1EUhvtsJdWSyjFesKORk6cWW1Ebs0lt8nq8rsefP1HwdhhaPyP19A1E6J8doMhPfmSmmQgFwTwsLbTMvzHeOv1FXNz20TxelwniZ/w5mwuniTi6Ghu9BgXWx5NysLUAUFRxNYW2zW+lYJTjd7c/ujIlvfQF0n4AP8P91aikVzP+XnMlzKyEfUrEt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0sFyI/eiGy9j/P+o1CacV+gmEDTaqGB2Z/0YhVGaL0=;
 b=Id5tpEAbZcb872aDAAJZ/46ZPPMUZmPus4iTyqoSQmBCJ9Uur+VnTeD7zkonk8INE91kZNoR+ZqIhVLwB3iIQ8LJKV+oNtx5ADmUWizlG9m67I2d9zDifIE1hL6EFSCViYGWsLIlP2cLBYJT2L/ANtM+ULYVPU41F0Tw11bNXxQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by PH8PR11MB9805.namprd11.prod.outlook.com
 (2603:10b6:510:3c2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 12:06:44 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 12:06:44 +0000
Message-ID: <c859200e-7972-4a7b-b8ab-fe135cd6428e@intel.com>
Date: Sun, 15 Nov 2026 17:36:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/i915/display: Program and enable the DP symbol
 based timing generator
To: Arun R Murthy <arun.r.murthy@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, <uma.shankar@intel.com>,
 <suraj.kandpal@intel.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
 <20261103-vlk-64036-dp-symbol-tg-v4-6-6cf8a588b54c@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261103-vlk-64036-dp-symbol-tg-v4-6-6cf8a588b54c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0300.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::12) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|PH8PR11MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5e7d96-c0a4-41ba-a94d-08df4310ea99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 1qF97lU8BtUhPbk+Rx8cLyGwfXyPUsLcwJuJdg/H/Evrrtg8kL5h7FRIKPyADoo5rDUDkmX61vwwDF0jY0kirX3um9J/jTfSGY4KTknLK2AUQWfPDyOUqCXxnDODc1hIbr7KJ4e9FDGNlmkxz7Z4my1zWytzQwtMU4rhUKGH7MXY9mYO4sjHz0RnjIHXDHeoA8jPiTQxh4gFX9rC/vu9ujnJqDPjh1c7hFk/SiHvitNyvG0aGdS2U9uDjyiJCTuIURUb6U+IqTg/+2GkKQvMALuGrYU5+8BA+BxVjTVFuXm91133kFHGUXMNDTL7mcpLe7+uJB2s2x6P00IeptVO/fDgVac1i48K7U/KIFMLzpHzD6UoXqzJypl7CDC77Ds70/czdhrkxTA8MXerY2ASG8Q1uGgo56Q8btzCAeVMIbXh42fFY2QRUw2nfGzJZX/viuCLnZQu+RlnK47zlzuTimgV2er/x40n1hIeKf0J4xuJmgh7RpMMZMFl4TrG0cFTMRq/Bc7ogqjd5cBnx8Qy6gbWfjVkO+HEc4mrjBP1/zb/SAPm0nAzqD7t1u0sJ9KIMTQystoZUzp4DCZChfIposvVfWTDDYrIfov7H9fftVRgNVE9+83pM31P/6yll+R+vFu6O/UEF92PO0rZ2qa0fmegwd0PgotlQYsKWWhMbvY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlvK2UxUWlFUjBqdGRIdElnbWprbWtVaXNTY0FUbFZwbEhCRXVBQXRSckhN?=
 =?utf-8?B?Y0VwZGlwMnB3dTcyU0c3M05jRCtpaElweFJFUmlZTHkyenZIRmw0WllYU1E5?=
 =?utf-8?B?RWtOcEJITTI4bkk3dXNqWUs0d3RNRHkvUnpldi9wVW1Jc2RWOWVTWmYvV3BM?=
 =?utf-8?B?Nlh2Mmp0YlRPN0V2UWg3QTh5MlQyS2ZBTG1hdTRQVW1OeG53SldEMjIxN0pa?=
 =?utf-8?B?TVZkSXpZamN1ZVNDejllVmpqdGRLS2hPS2l2SHJNcU9wVVN6eFJXcHIwaFlO?=
 =?utf-8?B?dkcyd1NncWlDL0V0SFMreU5oaVBndU5TTm5tZjRwSXUxbWcrckF4V3EwWUYw?=
 =?utf-8?B?UEl5SDdGU3lxVkJJMGNhWVlpUXF4R1E3MG1oZ0xyWEJQc09LRTFvT3ZwMFJU?=
 =?utf-8?B?SmI0VTVvb28wOWlTYWdkMERiVDdSeGVuVVh6dDQwckszMEV5T2hBQTBsdXZ1?=
 =?utf-8?B?UU9GMmtYWG50ZXBQZXhFTFBVS1NCUFJXZ0lYQ1dKL0pSMWdvTjNUckxXZVFq?=
 =?utf-8?B?TDZjWHV5NlVTdFhxWWNBdXBZeXRKYnBPM0gvVmYxNU5tSnp5Y3QxVytDckRG?=
 =?utf-8?B?WTZzb05WTGRUaG5jaW85cDJtSzRLMndnN2FYSFJrTjZVTDhWQm1jWk5zb2JZ?=
 =?utf-8?B?TWZFODJhYXhKZUozRHJJZmVmd0x5alV5aVVPcEtqb1ZqYURJWWN3cDIxRDVi?=
 =?utf-8?B?OUU2LzZEQm85Z3VmOHZaTFFyQUR6S1FETWtZWFo0KzVWTHpieHVaTlFYZldE?=
 =?utf-8?B?R1hGSUx6VCtTMVo5Ny9URTg3SmpWWGhZUjBRVWpTb3lTQ1FESHFZdlNaUktH?=
 =?utf-8?B?czhHSXkxT1I0Sm4xSGVHOCtITmlOL2dQRy9RUTl5WXVBWnVjdmdBUEpWU1dm?=
 =?utf-8?B?SkQvbytrOEhFTW4rU05UY2pEUDgxbW1JcGl6MDJxWmRBNGVIUWM3VkhqOXZU?=
 =?utf-8?B?S0VoRWJ1bzJ5TlcwM0pLWHdxNjdDY3FhZkFYVEYvdjQwZ2wvb0lmQW80aVRq?=
 =?utf-8?B?aVAxUWlhbHRUc2VXRE54bThiczRidzU1NTZkVldlS2xWeWFFMHp3b1VONkI1?=
 =?utf-8?B?NzVtTWQvOVEwb3RjK0xPN3plaGJmRlNtMFRsMmZTVnQvek5FYUcyRFhqN2tn?=
 =?utf-8?B?VW05clc2ci9hdXlURXZrQ1gwekJJRTZzdllrTGJvejBzOWxHV2plcGloOHRX?=
 =?utf-8?B?ek13d1NUdFNSZUl1QjMxQmRGKzhwS3dnK1c5c1BaVVhnOVFvVnczeHVMUTNI?=
 =?utf-8?B?WXJiZ0orb09ZRkdaTVFvdmJLZEtmZjIxczZVM0dKVjh3Y3k0VlF5bU4xc1NN?=
 =?utf-8?B?aHRyaVJrVVBPK09wUDEwVVYrWlduUFZEdkZ2UnV1Wm0yKzhta3VyMnNQd3pT?=
 =?utf-8?B?WDUxUEVzenNDaW5PNUFtM2pGd09vOVdURmpuckprMnF1L3FzdmtkelpWSStF?=
 =?utf-8?B?NzRFYjROanNFVmVUKzhJM0xsTXBhMnJuYUEwdkxWRUxOcFkwRzcxcmVMSXU4?=
 =?utf-8?B?dWt3Q0FkL3NaTThmNnBpWnRjTUErdHd1Y0FqcjI2b0F5T1hCTzQ0TWJqRUhw?=
 =?utf-8?B?TU5yL2VVZTYzVEJFTVVHVk8wNFFGQXlET2JWZVhtK2ZYU1J5MTBqTHI4N2tM?=
 =?utf-8?B?QUJEdmlxU2hXZGZ3a280Qi9hVUlSbVpGV1pHSERkYkVnV2gwSEdnM3FwYmtp?=
 =?utf-8?B?cE5FUkx4NUxWQlV1dDRJUlo1cUJrZGVrM20ybWtZNU1mREFDbXBQRGRHdVg5?=
 =?utf-8?B?TGV3Y2dPbDFjR2x1YSsyS29Ob0ZnaVEySEEwdWpiQ0k1NEJxbnBiY2owOHRR?=
 =?utf-8?B?d29pWms5N0wxZ0sxNlpscTJHYXlFVUhaOW9CZFUyeHVYZDYzbDZsUktaQk9M?=
 =?utf-8?B?YVM2UktvdjBQck1DTkI5eER0Tlhzbnk4SzhQeUJqb0xQN2tFRitKT1hnU2s2?=
 =?utf-8?B?YXpOZEtBOXNCZ3ROZ3ZVdEliTVpmQ2FzNUcxT2lqQWpibEJ4Tzh0SnBzSVpK?=
 =?utf-8?B?SmhadG14L1NxcXBZelNWODNnSDR1LzFVZTdmU3ZOZnVHaG1DR002aGtTWHl6?=
 =?utf-8?B?cEVRWmwyRXNHbms4RHoxUHcwWktlbU9rcUs2WG9XSGtmd0hBRkVnR3RzWkta?=
 =?utf-8?B?enF3T0FkcnIxd1hlR2p2WmJRQXEzUkVvaEt1Z0p2Ukx2TUpvbGd2ZmNJd2lm?=
 =?utf-8?B?bld6cmFLR3dzcTN4NEhZYlpVV2hldmpyd1JYYVU3eTNyU1ZRRHEyRXlFQjFa?=
 =?utf-8?B?azJzbEpvcEtsZENabTB1K1JHTGVWalk1ZFJXYVdQbGpQdXdSSWJRTzZBeE1W?=
 =?utf-8?B?dEpTQlc2SjFHZHdKSjhFZm1xaktTTG1zZis4SDBETU1nMEgrdzQzNWQ2dk5m?=
 =?utf-8?Q?ReQWnC/+liMhAq3g=3D?=
X-Exchange-RoutingPolicyChecked: fBwoss/9gKfOeKTXy/2BfwxqLoKogi40II8aaiM6Q4KfNxhY6+pWyqC2Zh0oBetEDhi0T6+ysmHvjlGQSydz89Wm/dUZ1K140TBmiO92UmUTvEmlsrw0iRiX3Z/PYG5FUuLr2cxChlAGwcjm3+E3jHUNLfNTO7AMwCmr7RlHlsX/lKKn9AsPF1czo2dJ7YPmGrTxEcPneJvxLR+adqUMTcYBrSYdd59yJMNgo2ABz6GeR8ZJSpNmG+n0XJT04fFMyTLnS+93qbtCZcl3p9FkPvpLtSaZPJEdBCLSRKrijI9A7bY/QSrv8Do/N0pMrEi3ULIZeqUpTGGOE6uQ8MJjBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5e7d96-c0a4-41ba-a94d-08df4310ea99
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 12:06:44.4907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlp707E4gtbzJe0TddJiT2X70nxJUoHOSZ4C5nQh83oN/hkD8LfaKXc4/dtFPMfTR7j7/YL2mB5qGX2174CwnMUHVLBTDVI40XoQOTyxNaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9805
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/2026 3:28 PM, Arun R Murthy wrote:
> Program the 128 bit LL symbol Data M/N before the LINK_N write which
> arms the double buffered update, the LL symbol HACT/HTOTAL/CHUNK_SIZE
> along with the other transcoder timings, and enable the timing
> generator via TRANSCONF.DP_Symbol_TG_Enable before the transcoder is
> enabled.
> 
> v3: Remove redundant HAS_DP_SYMBOL_TG (Jani)
>      Use intel_de_read64_2x32()
> 
> Bspec: 68849, 68922, 69961
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_ddi.c     |   2 +
>   drivers/gpu/drm/i915/display/intel_display.c | 101 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/i915/display/intel_display.h |   1 +
>   3 files changed, 101 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index a46ab5d3d70fc75c6975f46e14d1b0c24dc1ba5e..c814e0740aa064f56d844e304c0a93d1047475c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4083,6 +4083,7 @@ static void intel_ddi_read_func_ctl_dp_sst(struct intel_encoder *encoder,
>   			REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, ddi_func_ctl);
>   
>   	intel_cpu_transcoder_get_m1_n1(crtc, cpu_transcoder, &crtc_state->dp_m_n);
> +	intel_cpu_transcoder_get_llsym_m_n(crtc_state);
>   	intel_cpu_transcoder_get_m2_n2(crtc, cpu_transcoder, &crtc_state->dp_m2_n2);
>   
>   	crtc_state->enhanced_framing =
> @@ -4119,6 +4120,7 @@ static void intel_ddi_read_func_ctl_dp_mst(struct intel_encoder *encoder,
>   			REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, ddi_func_ctl);
>   
>   	intel_cpu_transcoder_get_m1_n1(crtc, cpu_transcoder, &crtc_state->dp_m_n);
> +	intel_cpu_transcoder_get_llsym_m_n(crtc_state);
>   
>   	if (DISPLAY_VER(display) >= 11)
>   		crtc_state->fec_enable =
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 7caf5bee8718729667376b487b0584b47891f05a..71a2f96b5e8f8474fd9ef24ac1c1ac89bcdeff0a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -521,9 +521,14 @@ void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
>   		return;
>   	}
>   
> -	/* Wa_1409098942:adlp+ */
> -	if (DISPLAY_VER(display) >= 13 &&
> -	    new_crtc_state->dsc.compression_enable) {
> +	/* The early pixel count is in symbols with the DP symbol TG, no scaling */
> +	if (new_crtc_state->dp_symbol_tg.enable) {
> +		val &= ~TRANSCONF_PIXEL_COUNT_SCALING_MASK;
> +		val |= REG_FIELD_PREP(TRANSCONF_PIXEL_COUNT_SCALING_MASK,
> +				      TRANSCONF_PIXEL_COUNT_SCALING_X1);

Bspec specifies the Symbol TG Hblank early setting as a pair: Hblank 
Early Count = 96 symbols together with Early Count Scaling = x1. If we 
are programming one we should program the other.  We are already doing 
it for the pixel TG with DSC: Wa_1409098942 sets the x4 scaling and
enable_audio_dsc_wa() programs the matching count.

It has no dependency on audio bandwidth management that is to come later.

> +	} else if (DISPLAY_VER(display) >= 13 &&
> +		   new_crtc_state->dsc.compression_enable) {
> +		/* Wa_1409098942:adlp+ */
>   		val &= ~TRANSCONF_PIXEL_COUNT_SCALING_MASK;
>   		val |= REG_FIELD_PREP(TRANSCONF_PIXEL_COUNT_SCALING_MASK,
>   				      TRANSCONF_PIXEL_COUNT_SCALING_X4);
> @@ -588,6 +593,14 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
>   
>   	if ((val & TRANSCONF_ENABLE) == 0)
>   		intel_wait_for_pipe_off(old_crtc_state);
> +
> +	/* Disable the DP symbol based timing generator */
> +	if (old_crtc_state->dp_symbol_tg.enable) {
> +		intel_de_rmw(display, TRANSCONF(display, cpu_transcoder),
> +			     TRANSCONF_DP_SYMBOL_TG_ENABLE, 0);
> +		intel_de_write(display, TRANS_LLSYM_HACT(display, cpu_transcoder), 0);
> +		intel_de_write(display, TRANS_LLSYM_HTOTAL(display, cpu_transcoder), 0);
> +	}
>   }
>   
>   u32 intel_plane_fb_max_stride(struct intel_display *display,
> @@ -1683,6 +1696,52 @@ static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
>   		     HSW_FRAME_START_DELAY(crtc_state->framestart_delay - 1));
>   }
>   
> +static void intel_cpu_transcoder_set_llsym_m_n(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	enum transcoder transcoder = crtc_state->cpu_transcoder;
> +	const struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
> +
> +	if (!tg->enable)
> +		return;
> +
> +	/*
> +	 * These are double buffered, updated by the LINK_N write in
> +	 * intel_set_m_n(), so must be written before that.
> +	 */
> +	intel_de_write(display, DP_LLSYM_DATAM(display, transcoder, 0),
> +		       lower_32_bits(tg->data_m[0]));
> +	intel_de_write(display, DP_LLSYM_DATAM(display, transcoder, 1),
> +		       upper_32_bits(tg->data_m[0]));
> +	intel_de_write(display, DP_LLSYM_DATAM_EXT(display, transcoder, 0),
> +		       lower_32_bits(tg->data_m[1]));
> +	intel_de_write(display, DP_LLSYM_DATAM_EXT(display, transcoder, 1),
> +		       upper_32_bits(tg->data_m[1]));
> +	intel_de_write(display, DP_LLSYM_DATAN(display, transcoder, 0),
> +		       lower_32_bits(tg->data_n[0]));
> +	intel_de_write(display, DP_LLSYM_DATAN(display, transcoder, 1),
> +		       upper_32_bits(tg->data_n[0]));
> +	intel_de_write(display, DP_LLSYM_DATAN_EXT(display, transcoder, 0),
> +		       lower_32_bits(tg->data_n[1]));
> +	intel_de_write(display, DP_LLSYM_DATAN_EXT(display, transcoder, 1),
> +		       upper_32_bits(tg->data_n[1]));
> +}
> +
> +void intel_cpu_transcoder_get_llsym_m_n(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	enum transcoder transcoder = crtc_state->cpu_transcoder;
> +	struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
> +
> +	if (!tg->enable)
> +		return;
> +
> +	tg->data_m[0] = intel_de_read64_2x32(display, DP_LLSYM_DATAM(display, transcoder, 0));
> +	tg->data_m[1] = intel_de_read64_2x32(display, DP_LLSYM_DATAM_EXT(display, transcoder, 0));
> +	tg->data_n[0] = intel_de_read64_2x32(display, DP_LLSYM_DATAN(display, transcoder, 0));
> +	tg->data_n[1] = intel_de_read64_2x32(display, DP_LLSYM_DATAN_EXT(display, transcoder, 0));
> +}
> +
>   static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> @@ -1693,6 +1752,7 @@ static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_sta
>   		intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
>   					       &crtc_state->fdi_m_n);
>   	} else if (intel_crtc_has_dp_encoder(crtc_state)) {
> +		intel_cpu_transcoder_set_llsym_m_n(crtc_state);
>   		intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
>   					       &crtc_state->dp_m_n);
>   		intel_cpu_transcoder_set_m2_n2(crtc, cpu_transcoder,
> @@ -2929,6 +2989,17 @@ void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
>   		intel_de_write(display, DP_MIN_HBLANK_CTL(transcoder),
>   			       crtc_state->min_hblank);
>   	}
> +
> +	if (crtc_state->dp_symbol_tg.enable) {
> +		const struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
> +
> +		intel_de_write(display, TRANS_LLSYM_HACT(display, transcoder),
> +			       TRANS_LLSYM_HACT_VAL(tg->hactive - 1));
> +		intel_de_write(display, TRANS_LLSYM_HTOTAL(display, transcoder),
> +			       TRANS_LLSYM_HTOTAL_VAL(tg->htotal - 1));
> +		intel_de_write(display, TRANS_LLSYM_CHUNK_SIZE(display, transcoder),
> +			       TRANS_LLSYM_CHUNK_SIZE_VAL(tg->chunk_size));
> +	}
>   }
>   
>   void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
> @@ -3095,6 +3166,26 @@ static void intel_get_transcoder_timings(struct intel_crtc *crtc,
>   	if (DISPLAY_VER(display) >= 30)
>   		pipe_config->min_hblank = intel_de_read(display,
>   							DP_MIN_HBLANK_CTL(cpu_transcoder));
> +
> +	if (HAS_DP_SYMBOL_TG(display)) {
> +		tmp = intel_de_read(display, TRANSCONF(display, cpu_transcoder));
> +
> +		if (tmp & TRANSCONF_DP_SYMBOL_TG_ENABLE) {
> +			struct intel_dp_symbol_tg *tg = &pipe_config->dp_symbol_tg;
> +			u32 hact, htotal, chunk_size;
> +
> +			hact = intel_de_read(display, TRANS_LLSYM_HACT(display, cpu_transcoder));
> +			htotal = intel_de_read(display,
> +					       TRANS_LLSYM_HTOTAL(display, cpu_transcoder));
> +			chunk_size = intel_de_read(display,
> +						   TRANS_LLSYM_CHUNK_SIZE(display, cpu_transcoder));
> +
> +			tg->enable = true;
> +			tg->hactive = REG_FIELD_GET(TRANS_LLSYM_HACT_MASK, hact) + 1;
> +			tg->htotal = REG_FIELD_GET(TRANS_LLSYM_HTOTAL_MASK, htotal) + 1;
> +			tg->chunk_size = REG_FIELD_GET(TRANS_LLSYM_CHUNK_SIZE_MASK, chunk_size);
> +		}
> +	}
>   }
>   
>   static void intel_joiner_adjust_pipe_src(struct intel_crtc_state *crtc_state)
> @@ -3419,6 +3510,10 @@ static void hsw_set_transconf(const struct intel_crtc_state *crtc_state)
>   	    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB)
>   		val |= TRANSCONF_OUTPUT_COLORSPACE_YUV_HSW;
>   
> +	/* Must be set before the transcoder is enabled, so only on modeset */
> +	if (crtc_state->dp_symbol_tg.enable)
> +		val |= TRANSCONF_DP_SYMBOL_TG_ENABLE;
> +
>   	intel_de_write(display, TRANSCONF(display, cpu_transcoder), val);
>   	intel_de_posting_read(display, TRANSCONF(display, cpu_transcoder));
>   }
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index d53b7b4a80e75f8cb3a76d923d05648ffe505e2d..fa9ae8799a1999d9dd6a1f4e4d56983b6536ba26 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -446,6 +446,7 @@ void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc,
>   				    enum transcoder cpu_transcoder,
>   				    struct intel_link_m_n *m_n);
>   int intel_dotclock_calculate(int link_freq, const struct intel_link_m_n *m_n);
> +void intel_cpu_transcoder_get_llsym_m_n(struct intel_crtc_state *crtc_state);
>   int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config);
>   int intel_max_uncompressed_dotclock(struct intel_display *display);
>   enum intel_display_power_domain intel_port_to_power_domain(struct intel_digital_port *dig_port);
> 

