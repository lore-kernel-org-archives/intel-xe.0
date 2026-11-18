Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C4606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VFblq9Tn;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=g4gCbNDP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A6310E1E7;
	Wed, 18 Nov 2026 08:12:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9FA10EAD9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794989537; x=1826525537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=RMbMzWgmAfI2obUAZABLS4+R4wVH9bZiN4VIm1D68Ss=;
 b=VFblq9TnfWcWH5NOj/zXmUDRDXJqbAzepx2Gp9Im3fjV39lFijP+G845
 rOWXUuy87LEQrVp6js2cWr4w6GuMGcO4Rqsli9TBQc0gC3YwoNOOLInir
 +LhD7rTPJ6YXNiCihFG4otOBwuNfoXn2YtBS/ZZ+4e4U0CeFuvfzzIF1I
 yzqp8SXfQWE/eouyw6TxSD08AGarpCiXYKBGSOBSNjwPO+t9lCjOlH0dn
 ib0KwPlL2h9pz7A+nii+1Fhs4lbM2Ucmjhc8am129kPforclhF9FQUr5Q
 rTwIXC7BOAyFS1BsBZNsnbDaMdAjLHiwkt2RbSbtDEwfQAhrislqzPGTP A==;
X-CSE-ConnectionGUID: dORMs6TeT+ewtxSVUa5rbA==
X-CSE-MsgGUID: hzZuvqJRQeiZrVPmNySoTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3813618"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="3813618"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 00:12:16 -0800
X-CSE-ConnectionGUID: JJaqZ8QZRjiMvnQSYLlFGQ==
X-CSE-MsgGUID: EQgSdKruTHKC16+hiSDbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="10479319"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 00:12:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 00:12:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 00:12:15 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 00:12:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3PljX4+ukOmQTa/Z/UlZkCadVftD4Fpq2nxqHFA0qVDzNoN4yspH3wWRSxJ+Gd8avbHIGSPYNkR8iislGsDBiWZvMCfBoKN5SaYDTIg5pfLy0xKg1cWI5qgYcuF1I/Hg/WOTakub7Xl88yX0IG2OGHIb/hegheecnHPxC4tClTXAwCobi3biOT9Zlu1qI98cvHQZTJACWJ7Lv+sWmLgpqSMwUv75lhWL0u9DLfW3304h8ruevwtp81tSyo4Nd01YqhJtiPl8xFq1G7Lqb0BWL8ldkliFoPdqhrojGKoPZKLtBrZHIemDyoq2P7UO2+U0Lt8Yvo4pWQcF4tET3wifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3OUARwkiBS13xcwwd9tgIlx5DookoBoOTHjd9tunsM=;
 b=OOy6HKy+P95lyFH3IV6GM1DHUfz6azmjPG07Q/o6he2Gk9rmHgMJe+Uerko2uu6uXrJxJGInwMtmi5tIDjMsQX4gKxhxHEe4nABdNg7UUSv0kKRxmhjNDvy+QxOYIe3Gl5L2S7j8jdvy95CUSoS7lnakj/Tf3EcdAqi1VydupRTVgjWq5EfNGBHkcgnowpOZcMnaqYahDs3cpIfSDR5tvHa4GOERhPq5LSyP3XwtqdbUGGOOWE2xsOZjSOmTaK+Iq2YPGoYyOV8h6sxGJhv94lNrdPCjX7KvwkRrO7a8h4/poz21EXI85mL7X5BLhW7jnOv50S5s3BZx+zq/ZQCJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3OUARwkiBS13xcwwd9tgIlx5DookoBoOTHjd9tunsM=;
 b=g4gCbNDPl+SlVR2wbBHiVHjMsBS5yoq09gRnVh06uWuoJ+F63nuEQx1qMMoy1RsF01Cfz9JZ3FXt8NTNSe0pp5ko+ZFs4K+axiuJxz5pp4rBso7TC0xuCyTY3lJe7R4LvE9FqGzaPeub0rsQzNMlFaqhZF/rwPRlS4n6eVkUKTA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7844.namprd11.prod.outlook.com (2603:10b6:610:12a::17)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:11:49 +0000
Received: from CH3PR11MB7844.namprd11.prod.outlook.com
 ([fe80::1b09:28f3:5090:3380]) by CH3PR11MB7844.namprd11.prod.outlook.com
 ([fe80::1b09:28f3:5090:3380%3]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 08:11:49 +0000
Content-Type: multipart/alternative;
 boundary="------------lsZK0A329xbZpfM4ZZL9ua8b"
Message-ID: <79c77074-2b72-41f3-b888-b678c03ecacf@intel.com>
Date: Wed, 18 Nov 2026 13:41:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] drm/xe/log: Add software CPER information to KUnit
 output
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-13-mallesh.koujalagi@intel.com>
 <72fa0db6-8809-4cfe-82cb-c4dc03888a2d@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <72fa0db6-8809-4cfe-82cb-c4dc03888a2d@intel.com>
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7844:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: f1fc2214-233b-46a7-3f72-08df454b97dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|261009223027099003|8096899003|4143699003|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info: JnGCVL5F8QGqARs2MWNM7NB5zPZAWFY06F/eSbnVoBpbpQMwdfAwYQwknhPE0ocI5Cb5onwtLH7FOg5UExfamIbDm+pL08v5w2xNxkx0PUWbHQhHkqrhbNO5oz5XA4C3sHRMp0n+p5XI66nfiabGZAnUXtFwzvIZIv/GA26F/Pgq2/m86jrILIJdQ7xlol2CcFGnrmrOGGg5Rmi5sbL9thChmzzDeYJ/JAPtHhaq3Qcb/U9hvvouOam3nMXPniq/Md+Yvgx0OMaWlq7mdyvAGP1m2jENbT+m4uSHOpx/qYmj7a7ertCdJxZVdP97bTDXco3yvwAs4dXpTh51NOWFeIoUINKeWlJVyU0vDmAO9wdjHsPUlIWGG5bbZ9H4HGYBv4p9qT3G6bfvQWHmzVy7472I12mJLpGd1Rl6Cm0VTLVCoQO659Mlb2G5rg2oVKofiLPoaTO1s+C1psqTQZ1raF4aLizNQOeoa3y8npyLzdIp4cIe7hStrk42jCVFji3qW82dY440b9dtXKLga8JtKaA0P+hRn8o97o6Q+3ECDZO2CsZTcky2Y2P0OsAkHM71lGrK20PmHRF+iELOOtb+t8NPDnQGi76BhFc/beZwl0dk/RJxgh64x8Aco1S3Xbgml+Vc3GWnIMGqsTrNSoGj6acBB1LKUnEkCboauLRxhCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(261009223027099003)(8096899003)(4143699003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261022113327099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkh2dDRZdnFhVGllbG5WK2h4M1dHU3cvQ0ZOTk1za3ZiOS9QcWs1Um9DdnZz?=
 =?utf-8?B?cGszQmlxMGNJZldGcXJpVjc3RFhJNHMreXFKd0VVQ2dxMy9udzloS29SeDZ0?=
 =?utf-8?B?RDNNa0NQeFNKTFdqODY0ZHg0R1UrWGxQWDh5cjlqMTY1M0I5aWtPQlJJMTd0?=
 =?utf-8?B?eHhUWDlpb2FtaE5ER0FNOElpZnp1clVYNTNPd0hjM1QzZDRRYzE0K2ZjNHNz?=
 =?utf-8?B?eHhtZlNlN1NKMXBpWmZyS2JhT2lFNDFhblFZak1sL1F5L0lPZXd5bER3YnAy?=
 =?utf-8?B?M3l5VUFRaFNKRzVvQUsvSTVpcEEyLytkQ2I3ZGZ2SVZpdW5iUnUyUlVHbnA1?=
 =?utf-8?B?cFpnMm9pVW1hY2x0akpPbVRHakJmT0lEVDJIcU5KZlZrSWhVNnhBQ1lBMjBs?=
 =?utf-8?B?WWdtalJHU2VxMDN3aHVzOEErYytZMk5CWUdNWGlrdklBMGg2MzBWT1JRQU8w?=
 =?utf-8?B?eHdqT2tSSUV2aEZNWllVVTdGKzJYcCtvbDltd0R4aVZHQlNQdjB5a3NCNDRZ?=
 =?utf-8?B?clJOcU1hZ3NrSW9RR0prekR0YWhHbzl1blFpdGJmdmxRZ21LZng2cFNuYTJ0?=
 =?utf-8?B?T0xna3hQRXFIS3VCOEJid2dxckYvYXhRbmRJdlVadytsdmlhenRWNGJ6S3hB?=
 =?utf-8?B?Q3RQWjVvSThWOGcwYmZZNVJRYVljK0xsNUFIS0FmeXZTTG5kM0hFNmtPSzJI?=
 =?utf-8?B?MEd2SlhkMUMyRVQwcDRXU09WTmd2MzZ1YUdITHNHbW5mZDA1ZU80SmthSzRE?=
 =?utf-8?B?eTBkMDRUaVFxSlRsOGI2SHExWmJlT3h4Y0JnQzlvUFdBM29aSDlyYUt4RVJ1?=
 =?utf-8?B?T3NHRXFyeDUxbFY2d3F3Lzd4QVdXWGlNRTJnRmgwY2I4ZkxXVFh2V0xsbGVk?=
 =?utf-8?B?cG9temxXNzFVVWdEODdMME9JS1dhUEVWdUFFWVJQaU9TVlczOXhXakNKQVNK?=
 =?utf-8?B?ak5EREs0VFhPeENzcERwODNiYzJwdkxXSjdGdFh3ZFNoNk5KcFJ1WkpkQlVo?=
 =?utf-8?B?cGoyWU94YVhkTHZNWEZZcUpPOFFkSnFtY29nT3pKV1MzTkVxOHlTWkY2MUJW?=
 =?utf-8?B?YWxXZ3hxdjRCKzlqTFJMbE0xY0dDMUVKUm1zUEw4K3pOdWtoVDc1T1FDU1Zv?=
 =?utf-8?B?dlFnMjlDRk95VU02MmF0dVVBU3M4a0pZWEVSUlZKVWlOZXlocGp6STQ3VGs0?=
 =?utf-8?B?bjVDaFp6eEFITHJHYUs3STNaUHdxR1hiOHl1YW9Vc2FsbWVTOXRhMmJQSStM?=
 =?utf-8?B?RXgxNkVmRENUdGI0bkJVeDRzTkRQOUg5Qm8zRFlSZXZuUlJLQy9KSFZKVWhy?=
 =?utf-8?B?eElxbklyb1FVL2dUUkRjOUdYcjVWc0szdXFYRkh6RFJsRmxVeVRHWm85ejZl?=
 =?utf-8?B?TEIwYkNBNkYrL1hCNnFKUW8xYjNsa1BCSHBNOVFEbGhvK3lKOGtUVWF0UmxF?=
 =?utf-8?B?VHVZTkVHZVhnaVJrMGUrb0ZWS3BYbnZQSFFoOGF3cUZVZTZma2tCWU1xR29W?=
 =?utf-8?B?cHNIV05PbzVyOWx2MjhJNGREQ2NsNW9UbUs2OFBuS0Z3TndoQzU5TGptbEZW?=
 =?utf-8?B?REszNXQ4aUc0dDFRWHRwaVhDMEtMZU00YnJMN1BmSTU5dUllSjZNUFVQOHM1?=
 =?utf-8?B?UW03cHYvbXhTSjN0TzByUXZpcXgralRjdzdZZlUxUElzc3hrWG82TjZpSDlR?=
 =?utf-8?B?bk1rdGZPTFhkd1lvQjNsSGQ2bzJmUGZZS1AySDl5ZGJOekpyMGdjTFVwTjJo?=
 =?utf-8?B?ekVkYTZBSTh5VXRiVEJCVVMvSWNqYWROTUFPbHdRbFBiZllSRzB0M1dsNlNJ?=
 =?utf-8?B?cWdxVUtXRVBhS3kwVjZtRUxMbzd2Yk9lcHpqQzh0Z1VmTnk2ZXhZL0ZvY2Uw?=
 =?utf-8?B?eHBKZ0dWQk5Ed1JNdFRuamRWWTVZZWxnZFRoemNXV05IME10Qm8zd1NBUnNu?=
 =?utf-8?B?WXZ1ZG9jZHJvM0VNMXZJR2tiZGVCaWdGaU5QS2pTT0k1b2FEVmMvZDk4akdi?=
 =?utf-8?B?eGhjRnE0OWxGYTNBaHVZUHRoRXg4NkxHYWlYM0NWTHRnNUFZcDRSaEFHZnFQ?=
 =?utf-8?B?YnAydEpoelVqUTJBZEg5VlBBeFRmWkVaZGRmNm9IMnVLU0s2cUVsRlo3V1gy?=
 =?utf-8?B?WDMxaTkyWnpNTmtnQ3lDYWdnYW1JZVJ2RUtaUGE1VjVRSExOYkFja3drMVRD?=
 =?utf-8?B?WDRGOGU5ai8yTDZVd0d5Q2hGYVVtZytXMGdGc3YxQVVHdERuNVlMU2lJQjI4?=
 =?utf-8?B?OGdyLzVrbGhsRW9DMjkzOUtWaC90eisvUjZtVXBxamtMWkRQaGFQYWtCWVQ3?=
 =?utf-8?B?NW5hcGNRNWhLd1R0MW1YRnBuQy9SYWRFYVhPbFFMZXJXUkxoUCtrK1ZSWFRs?=
 =?utf-8?Q?lNNMjJnpLAFB5M2I=3D?=
X-Exchange-RoutingPolicyChecked: CSdJaqcRlezP78Ds/w4kCNxN0dARYIUhJz9wmskG0iLHm2EvBAkE6qbVggIQAUk0WiddXLx8LA6pZyf1p/b7DavYk81zTEcSTPAVtgLWt+PIthzNEh1XbCVeZ2n1rqRg0Ug6rnbcLJcwgP36ClzOrti1to8snWuKTF2fN7QnSRSbDjofBSudYqqq5i1Y3s9MsR7PPmwW7dEI+CWaQUARFEc2YBFMr2tZ2CDrFZ1nQEt0X7VWAdR0QGI5V112IMuk2iBshnkuqc019qZwfaQC4jk2Szk3GYi8CirS9LJHbH4gjlsItg+ixFuODG+r+YPpiHVkL5EE3XIcT9O3GnHPWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fc2214-233b-46a7-3f72-08df454b97dd
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:11:49.0745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33oliCd9vm1Ut6XMMd24lRR/et+7PM0sbIVGAL8otlbZzvIbx60OEkEDannJkP5kqH3vQwTq5LoxepqVymWgsO/LNpuWHxf70XECOrNsTV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------lsZK0A329xbZpfM4ZZL9ua8b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18-11-2026 01:03 pm, Nilawar, Badal wrote:
>
>
> On 12-11-2026 19:16, Mallesh Koujalagi wrote:
>> Display driver classification details for software CPER records
>
> Could we use “Print” instead of “Display” to avoid ambiguity with the 
> display driver?
Sure!
>
>> in the fake CPER emitter used by KUnit tests.
>>
>> Cc: Badal Nilawar<badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_log_kunit.c | 21 ++++++++++++++++++++-
>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
>> index 56c36c8a08e1..08828ecc9098 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
>> @@ -6,11 +6,14 @@
>>   #include <kunit/static_stub.h>
>>   #include <kunit/test.h>
>>   #include <kunit/test-bug.h>
>> +#include <linux/minmax.h>
>>   
>>   #include "tests/xe_kunit_helpers.h"
>>   #include "tests/xe_pci_test.h"
>> +#include "xe_cper.h"
>>   #include "xe_device.h"
>>   #include "xe_log.h"
>> +#include "xe_ras_types.h"
>>   
>>   static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
>>   {
>> @@ -43,6 +46,19 @@ static const char *location_type(u32 location)
>>   	       location ? "?" : "";
>>   }
>>   
>> +static bool is_sw_cper(enum xe_sigid sigid)
>> +{
>> +	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
>> +}
>> +
>> +static void fake_emit_sw_cper(int cper_sev, u32 component, u32 location, const void *data)
>> +{
>> +	/* mirrors xe_cper_driver_error_class: full 16-bit component/tile, unconditional */
>> +	pr_info("SW CPER CLASS=severity:%u component:%u tile:%u cause:%u\n",
>> +		cper_sev, (u16)component, (u16)location,
>> +		IS_ERR(data) ? (u32)-PTR_ERR(data) : 0);
>
> This only prints the driver error classification fields and doesn't 
> actually emit a fake CPER record. Do we need to call this 
> fake_emit_sw_cper()?
> I think this was introduced when CPER doesn't exist. Now does this 
> test needed?
>
That will provide how Software CPER looks like, similarly we emitted h/w 
CPER as well. We added fake_emit_sw_cper() function for consistency.

CPER SEV=1 SIGID=101      # software
CPER DEVICE=demo_cper.drm-kunit-mock-device
CPER ERR=-19             # -ENODEV
CPER MSG=00000000: 74 65 73 74 69 6e 67 20 73 6f 66 74 77 61 72 65    
testing software
CPER MSG=00000010: 20 73 69 67 6e 61 74 75 72 65 0a                   
signature.
SW CPER CLASS=severity:1 component:0 tile:0 cause:19
CPER END

Thanks,
-/Mallesh

> Thanks,
> Badal
>
>> +}
>> +
>>   static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>>   			   enum xe_sigid sigid, u32 component, u32 location,
>>   			   const void *data, size_t len, struct va_format *vaf)
>> @@ -51,7 +67,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>>   	int n;
>>   
>>   	pr_info("\n");
>> -	pr_info("CPER SEV=%u SIGID=%u\n", cper_sev, sigid);
>> +	pr_info("CPER SEV=%u SIGID=%u \t# %s\n", cper_sev, sigid,
>> +		is_sw_cper(sigid) ? "software" : "");
>>   	pr_info("CPER DEVICE=%s\n", dev_name(&pdev->dev));
>>   	if (location)
>>   		pr_info("CPER LOCATION=%#x \t# %s.%u\n",
>> @@ -68,6 +85,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>>   
>>   	n = vscnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
>>   	print_hex_dump(KERN_INFO, "CPER MSG=", DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
>> +	if (is_sw_cper(sigid))
>> +		fake_emit_sw_cper(cper_sev, component, location, data);
>>   	pr_info("CPER END\n");
>>   }
>>   
--------------lsZK0A329xbZpfM4ZZL9ua8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18-11-2026 01:03 pm, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:72fa0db6-8809-4cfe-82cb-c4dc03888a2d@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 12-11-2026 19:16, Mallesh
        Koujalagi wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20261112134636.1860446-13-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">Display driver classification details for software CPER records</pre>
      </blockquote>
      <p>
        <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style> </p>
      <div style="font-style: normal; font-weight: 400; line-height: 20px;">Could
        we use “Print” instead of “Display” to avoid ambiguity with the
        display driver?</div>
    </blockquote>
    Sure!
    <blockquote type="cite" cite="mid:72fa0db6-8809-4cfe-82cb-c4dc03888a2d@intel.com"> <br>
      <blockquote type="cite" cite="mid:20261112134636.1860446-13-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">in the fake CPER emitter used by KUnit tests.

Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com" moz-do-not-send="true">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
index 56c36c8a08e1..08828ecc9098 100644
--- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
@@ -6,11 +6,14 @@
 #include &lt;kunit/static_stub.h&gt;
 #include &lt;kunit/test.h&gt;
 #include &lt;kunit/test-bug.h&gt;
+#include &lt;linux/minmax.h&gt;
 
 #include &quot;tests/xe_kunit_helpers.h&quot;
 #include &quot;tests/xe_pci_test.h&quot;
+#include &quot;xe_cper.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_log.h&quot;
+#include &quot;xe_ras_types.h&quot;
 
 static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
 {
@@ -43,6 +46,19 @@ static const char *location_type(u32 location)
 	       location ? &quot;?&quot; : &quot;&quot;;
 }
 
+static bool is_sw_cper(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
+static void fake_emit_sw_cper(int cper_sev, u32 component, u32 location, const void *data)
+{
+	/* mirrors xe_cper_driver_error_class: full 16-bit component/tile, unconditional */
+	pr_info(&quot;SW CPER CLASS=severity:%u component:%u tile:%u cause:%u\n&quot;,
+		cper_sev, (u16)component, (u16)location,
+		IS_ERR(data) ? (u32)-PTR_ERR(data) : 0);</pre>
      </blockquote>
      <p>This only prints the driver error classification fields and
        doesn't actually emit a fake CPER record. Do we need to call
        this fake_emit_sw_cper()?<br>
        I think this was introduced when CPER doesn't exist. Now does
        this test needed?&nbsp;</p>
    </blockquote>
    <p>That will provide how Software CPER looks like, similarly we
      emitted h/w CPER as well. We added&nbsp;fake_emit_sw_cper()&nbsp;function
      for consistency.</p>
    <p><span>
        <div><span>CPER SEV=1 SIGID=101&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # software</span></div>
        <div><span>CPER DEVICE=demo_cper.drm-kunit-mock-device</span></div>
        <div><span>CPER ERR=-19&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # -ENODEV</span></div>
        <div><span>CPER MSG=00000000: 74 65 73 74 69 6e 67 20 73 6f 66
            74 77 61 72 65&nbsp;&nbsp;&nbsp; testing software</span></div>
        <div><span>CPER MSG=00000010: 20 73 69 67 6e 61 74 75 72 65
            0a&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signature.</span></div>
        <div><span>SW CPER CLASS=severity:1 component:0 tile:0 cause:19</span></div>
        <div><span>CPER END</span></div>
        <div><span><br>
          </span></div>
        <div><span>Thanks,</span></div>
        <div><span>-/Mallesh</span></div>
      </span></p>
    <blockquote type="cite" cite="mid:72fa0db6-8809-4cfe-82cb-c4dc03888a2d@intel.com">
      <p>Thanks,<br>
        Badal</p>
      <blockquote type="cite" cite="mid:20261112134636.1860446-13-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">+}
+
 static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 			   enum xe_sigid sigid, u32 component, u32 location,
 			   const void *data, size_t len, struct va_format *vaf)
@@ -51,7 +67,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 	int n;
 
 	pr_info(&quot;\n&quot;);
-	pr_info(&quot;CPER SEV=%u SIGID=%u\n&quot;, cper_sev, sigid);
+	pr_info(&quot;CPER SEV=%u SIGID=%u \t# %s\n&quot;, cper_sev, sigid,
+		is_sw_cper(sigid) ? &quot;software&quot; : &quot;&quot;);
 	pr_info(&quot;CPER DEVICE=%s\n&quot;, dev_name(&amp;pdev-&gt;dev));
 	if (location)
 		pr_info(&quot;CPER LOCATION=%#x \t# %s.%u\n&quot;,
@@ -68,6 +85,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 
 	n = vscnprintf(msg, sizeof(msg), vaf-&gt;fmt, *vaf-&gt;va);
 	print_hex_dump(KERN_INFO, &quot;CPER MSG=&quot;, DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
+	if (is_sw_cper(sigid))
+		fake_emit_sw_cper(cper_sev, component, location, data);
 	pr_info(&quot;CPER END\n&quot;);
 }
 
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------lsZK0A329xbZpfM4ZZL9ua8b--
