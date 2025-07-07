Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90225C71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 18:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4399710E506;
	Mon,  7 Jul 2025 18:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfyhdvAY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BFD10E506
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 18:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751912909; x=1783448909;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PN55w+QP5srpajHwMq0xRC5Emdz1DpEukZkY14H6rjY=;
 b=AfyhdvAYltfDZnXhXKCfHbbVAHLU/Y6KwZmtB518lLRwwlWTEx/qzHjE
 ZrnRzikc/BjNbnub5zxUXHT+AuhpHzUHwgpIQrYa7Avi30/23tmnUdc10
 Svb53bDsuTXwfHQ6eAcxP72mp3wWFNIfRPvUKvwVa6gNeyBM+E9ZFThVX
 1UHDBBRyf0nlbYmPdJxb+PYGKV6Y5Zj1xAqTDGNHmfOgg1vkQC0SC/jwb
 oy/krcb+GcUAgmEYGAoDokpi0Ri+gRgsrbuN2lyZD9aYOGIDyFzxymyOm
 Pb2dELgyo3/cR3eGP4Odk/fXcqmfGAtDRw28jwvApmznMRHahSHci4vTo w==;
X-CSE-ConnectionGUID: 2y4f3w6AS820cpMX89vgzg==
X-CSE-MsgGUID: 2stNeQoMS+2kx3Ogz6QulA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76690008"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="76690008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 11:28:28 -0700
X-CSE-ConnectionGUID: LxsmoDnaRX6i+Uhiog+frw==
X-CSE-MsgGUID: 9UGnV6KPSfuEXK8k1wQKqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="159618431"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 11:28:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 11:28:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 11:28:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 11:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrrLvprjhNdTlJ3JaR3QdC1kLhVnXo9SozO/pNlwzwVTyK/Mfm3L0zHM5cZ54+GG1Y25w+fahzp6i8cCs/NQp6rAI7N7ewDUzcrOutpGn83X7z9EBhVcNOBlx6LfcsGVcrXA6HowbXgBTbUTV1GFwQGeNIx5G3wwARsUTSD0nQ31osZhavjQUhBt/wK6smTSQ023iyeUsCIqIyaTGdpvaHUXCjqCMXafiy01ov9J6l6d0X1rQXUSJ7L7ik2CwzTRb0UR6Cn4kojke4qor1mRBNl7es0DCt63zwASOJVYtgGKvDOJjU/6GaiczEDpCWvv8s4+desV17IuqZPAJFvpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+C7pt1qFvt5ccwIg6dt96re1ixhq2k8kSfzn83MSlc=;
 b=nO2fhLsrpk2iCCTFOJSmxi8xh7etpMJvVB8cjVWyiVvGLv23jLhH26IUaUdDkt6YVWkKjQA1b7wgxjRiSwe0J6Q97BknWV98RQaTOVM0xGbaUma9BUXcvi9ccQmefPKphELukK3NYUT32kAJY9Bi3SUljnHIfYs5wHk+87AGuPBqsk+MR+nlVAWJyOqxCNvsMePdLTr4mtL4z/Q7dslhN8jsimUsXqIJASriBaF3NPRnySvMg3VpCddI360KDhFU/2GARuAyRPrX1ul8ZBZvZGGvCp4Gh2kqxYPxoK7kPeHzOabuTBY7hl8vz1hEeWIUuDfjeSKl2Kv56FGhdHVEVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 18:28:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 18:28:24 +0000
Date: Mon, 7 Jul 2025 11:30:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Summers, Stuart"
 <stuart.summers@intel.com>
Subject: Re: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Message-ID: <aGwSLzlUP1YTJ5bP@lstrano-desk.jf.intel.com>
References: <20250703213845.2259302-1-zhanjun.dong@intel.com>
 <CH0PR11MB54443606D202241399E6692EE54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <3a784641-2436-4ead-88e2-88ef33fd39ac@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a784641-2436-4ead-88e2-88ef33fd39ac@intel.com>
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd12b70-f248-4763-a6dd-08ddbd840f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGNPY1YvSThOMjdjNGxKbGlaZTRpRGZsZkRnRXJTRXVab2xwVER3YVkvNXc2?=
 =?utf-8?B?d3NsZlFjVVhDeTZXS2hqM2dKN3U3ekpHdnNZZWVPMmNvbzNuaHdGN1hkZkhp?=
 =?utf-8?B?NWFvSjBjTUtLdFZsMWk3cFNUWUNYR0hPbUd1NndLWjhlL05EMzlBOG5idXZn?=
 =?utf-8?B?K3dyUUlRaDFtcmtLL1FTbTBWbGlNQXphZFdjODdBOTl0STJmWExKWHBMMkpv?=
 =?utf-8?B?VktiZDhkVTZOWlBCbUMyMnFvV1lxRGhMcjY4ak0xKzRVM25FSGluWEFSNmF6?=
 =?utf-8?B?a3NiNjFWUTdOdi9JNlp5amEzbm5mUEg0emx5cndYUnVyc2VmSFBmRzY3RFlm?=
 =?utf-8?B?aDAwakVxUUZnT3RhNTFycUNpYnQvU1NaWlVuSmlST1RNOXQxM3Vic3RJSlpy?=
 =?utf-8?B?VTM5QXJFQXZQYVBpZHRBOEVDZm5oZnhOaTlHejhyS0tVbWQ4WDBtV0ZQNm1n?=
 =?utf-8?B?OThYRDZrdmxocmpWWFlhOVpac1J0TzZJc2lGRkNpMGlaNUd6a3VPMjZ0cTJX?=
 =?utf-8?B?ZmRrd0N4cnl5SzFZZkxHc0pmV1MybU9jVXdHbXd3eHMzNDk0Nkp0V3ljRDk3?=
 =?utf-8?B?czJJekk1THYvRzJiUXFqTjI1UzUySzlyV3BIRmpWU2hXRkVDb044cGMwRnN1?=
 =?utf-8?B?SDdMZXlRbUxLVWJWS3ZqQ3RhTC9SVGZhbEkvaTlRY0NqQzVNdU1mQWt6U09P?=
 =?utf-8?B?SkRidTNnekNnbUhmRUdUNDVkeUZuTFZWY2lpZTlma3VCY1JHTlVJNVg0bGU0?=
 =?utf-8?B?OC9ONWt6OUtSdm8zTG9CMFArWDlsdysrbk9vZlV6amZwUWwwbDZCUHI2eU5F?=
 =?utf-8?B?UzFMNjZQdUFDZjRyMjVyZW1sYnd2TEplTTQrcmZldFhiM0JnMDgvVU9WYTE1?=
 =?utf-8?B?dHd0Q1ROMkM5OFZkdk9RTlExOWhlWWJFSDM4ZnYyQmhQMTB2Lzl2OGRhaGps?=
 =?utf-8?B?WjMxWW00L1RuRDJWekZQQStaL2g5Y3JmZC9QcmRzUVJvYk8wYkc5ajJ6cVFM?=
 =?utf-8?B?RzhQa0RJaHQyNWxSbXBtQnZFanJ1UEJzUS8xaCsvWUo5UUxVMm5ZTDVEdFhs?=
 =?utf-8?B?UXZZbnVnTXZPZDhWRC80UHZ6SkFqQVNBNWpORjNQazE5RDE2dVRsZmFvemhn?=
 =?utf-8?B?V2NBclIwc2REVkE0d2hrclFBUVFGbjN6Mkp3VGZ6L25KVzFVOHRLanFwOUo2?=
 =?utf-8?B?MTliSktEREFzcUk1clN3TVZVK0pOWDlxc2cvWUp3UDBIWHljT3dtL1B1SVo1?=
 =?utf-8?B?Si9uUFRPVU9EUnlwSUQxdzh0SXp4REh5R1N6OXBTbW1CaFVPUmorVnVqZzRv?=
 =?utf-8?B?YXBSZHlZNGVGYjIxVXhQazNxUFcrKzlBajFhSEN4QWh0aGpqY2ZuTkFuWmlD?=
 =?utf-8?B?NWJ1UkdjMFY2bWNiUG9xaC9DaEFiaEtzajczNHdXMXhOVFo0amY5M1pxcVlI?=
 =?utf-8?B?THVDY2l6UklFR2JlZW1relo4VE42enNseFloRVIvbkx3QVVnOVRoRDk1N3hP?=
 =?utf-8?B?bTBNclNOZS8rMDV4WUFLYXRDelFNYnhlczRRL0lNbm1LalpScTE2d0JEZENj?=
 =?utf-8?B?T3F2dU91c2pEbXd3WWpCWXdqUTVDMC9rNWV4VUIrTk0zR3p6RkRWSWlrNTFL?=
 =?utf-8?B?eFJDUGdTeWxSNFhyajMrYWE1WUswNCt4Wjk3NTlXSEE4cU5Kc1ZnQkVJVWpz?=
 =?utf-8?B?ZjV2TjhaeFJWZnk2UFVYbytZQ1FFdlpiMjd0c0xSM0FjQXJCM3ZaMms0cStL?=
 =?utf-8?B?dDZQMTNIN1VjVTlzVzVmZlVQTHZrZ0dINkFhajBKU1ZCVm5ENStlRTM3YTFs?=
 =?utf-8?Q?kdjF5mhK5zAptKxu5XWrZiqP5R+/d8/BFAFrY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFBtUUVGR21TOFo0VG40UnpobmtMNWo0dXFuUVBZSjNCaE4ydHJJVEE4UU9j?=
 =?utf-8?B?VFUrR2UxNmM1N3RZbytlYXRBWk45UzRKTXkxS2ZQOVhJUGtvK3I5VFNOcjBq?=
 =?utf-8?B?eGxGK1pjY3MyOXFFQU5jSjhmNlMvODJWelNIYkRXakdIbmRGUUJ0NUduNnFq?=
 =?utf-8?B?RWpHd292SE1Bb2lGNkI0UU9jNUR6d05aa3RzVlVlUDc2eHZjVTFBU2t2U2di?=
 =?utf-8?B?TUVlRElkbVNQdjRxam9YTEdwQ2pSc2k0Z2ZxNVlucHBGKzFPblNTZHJHSWVp?=
 =?utf-8?B?UUUycVhvTTUvR3BhNUpyaU00L0dkbzVFYW82d0ZDemEvbE40SEFOeGxEQ3Fq?=
 =?utf-8?B?YWR1RUhoV3BjNStGK05KQVQvbDlnaC9QYnNZdS9KVUhhT05iMiswa1ZGSERU?=
 =?utf-8?B?elFuV2p5dExxeG5LRm5TNVJTbmtPaFQ5emlDSTJ2d0xrU2VMbVNPeUI4SGlQ?=
 =?utf-8?B?U3NKY09uNDRZbXZyVGl3V2p3aDJiRHNUbWlpNE1aWDJpMzhMSUpjTEdDZzZR?=
 =?utf-8?B?QXdjdzFCZjdIcm1zNlN4L0ZZN2tCQ0hUaXRuOXRmeTdsVjVKQm9FTDQ3UnRj?=
 =?utf-8?B?SEUyWE1pTGVaRElxamNaUXdBUXh4WEwrNVJYUDBjOERJQUpDUmEzRlcweTFl?=
 =?utf-8?B?dEVnRXdYWU4zdTJMamRWRENseEJsS3JPblQxQ0VNVjZNOVRVbzVReWhlVzh6?=
 =?utf-8?B?dlkrMzNENXlCaElWMWFzRmNOcU5iakFyNFh1Qi9IejdaU3B2UExpVkRadUx6?=
 =?utf-8?B?SXZSTWVmYzIvdzByTVF4YlR0ZU1Zc0dOL0gxZWVwYmtBMEVxN1FBUlZMdU50?=
 =?utf-8?B?bEZET3NGWlh3d2RCZ3BQNWhCeThOVGRwQmVWUG03K3FoeFZkZGNTSUQwVHpa?=
 =?utf-8?B?dTdMRitQVUI3M0IwZTlmQzE5RHFGUXB3ZjY3ejlMTVpMb2dYSUFleGVzdnMy?=
 =?utf-8?B?WGRvUWlqQzFNamNsVnYybEp0dTJMcXZ5bSt5d01aMHptYW1NQm5IcitZTS9N?=
 =?utf-8?B?MStJSy9kcEVnZmhJdmFJRWlaT0l2YmtKMUFWSVBuNGpvVUpsNE9JeDZydjFo?=
 =?utf-8?B?NjI4S3BKVTY1WmpNajlIQXJhemIwUDUyajlMOWVmOGJMOERESFZsYnhadGZk?=
 =?utf-8?B?NlZSSDBnZFU5SmFVcWp2VEc2OFVYSCtNU1JlaDhPNVM4NU8wTXY4VGN6Zzhl?=
 =?utf-8?B?Qm0wbDN2RDV4U082WEozTHJ5bHhhSW5iSEMzbkNrYjVib1QzSjFOS0lyQVh5?=
 =?utf-8?B?VDBCb2pmRDl5cjBDdUFoVjkwY2lsL0l1RXRBQmVJbUJaamJuN0FUMFBYQ3ZN?=
 =?utf-8?B?c3gyRlNJRW9kSG9Wb1NSbW5BN3BtNWEza2RMUUNLdlRkNTlXa3RXNlZCWW5D?=
 =?utf-8?B?OVZRQlgxdm03RmxNbGpqTHJVSllycnN1SlFQSk1vVHNxcnYxMkFHdFhlbDAy?=
 =?utf-8?B?dDF4WFZkSmZkeDVXcG5CZlhtS2JZbVl1N2V0dzFDNXZvVHJhT1U5SFN3WFdG?=
 =?utf-8?B?eVUybUhody84R2xua1Z5MXFVU080SG5tN2ZBVktWaUl6YVdFSFhncnFITVBp?=
 =?utf-8?B?WGRJWm9OQ3ZJVUtSMitycGZsbmF2ZFhRQXlDeVE0UndvR05tVGNNems3eGtW?=
 =?utf-8?B?eHZDOG1MaEJnNjI1eUNiUnhDTnBEa0lOem1Nc1FJQXZsczNhd0Q5TTVSVVdX?=
 =?utf-8?B?YWl1R0pvcDBGWHVOaXB0TGJkb2RvY0pGRHdxcno0Qll1ZzVMQVR2Yk5RcHVF?=
 =?utf-8?B?V1FCZS9rTEgwZjJHYmJsenRCODhLNWhZbEg3MEVvZDhQNVBwYmdiNWtoczR0?=
 =?utf-8?B?ZnR5WCtGY0IxQ1BNMTgrUm5iemxjaHk4MUNSNm9JcGxyM1VKdGJ5RTl1K01r?=
 =?utf-8?B?d3pBZXUvNFphd2QrU0VLQ3V6TTZpK3JLSm1tVHlHZmY4YWdMWVZvSitwdzMx?=
 =?utf-8?B?Ykp2YmRlaGFoNWYrVFNlak1FOSs2NnBRTGN2Y2RGQU5CdnZyMGQ4eUpQNjF2?=
 =?utf-8?B?UjZLNGwydGQwWWFmUjVMNmJyMmVnbEtUdGw1Z3NTY3UybVcrQlIrWkpwU2M3?=
 =?utf-8?B?UitYSEpSeEhpWVRjNmpobnRFcFhXTDB4UEZwcmY5dDRxM0pKVDFXNTZyQUVs?=
 =?utf-8?B?cmdRcTZDUWVKVVZLMWpwTFdHT2xDNEgwVTJKTDQ5SlA1TDU1YzNaUDRuTGVn?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd12b70-f248-4763-a6dd-08ddbd840f1f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 18:28:24.5269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMkoFD/9XIe7qyPi1mrB//9ucbFTeNmsFHCsqLGIbyg6KHtAx2nT0uFo54T95ELHHVOskqeSqLfH96dsWnoYfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
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

On Mon, Jul 07, 2025 at 07:36:29PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 07.07.2025 15:56, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Dong, Zhanjun <zhanjun.dong@intel.com> 
> > Sent: Thursday, July 3, 2025 2:39 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Subject: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware initialization error.
> >>
> >> Disable GuC communication on Xe micro controller hardware initialization
> >> error.
> >>
> >> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> >> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
> >>
> >> ---
> >> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Stuart Summers <stuart.summers@intel.com>
> >> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >>
> >> Change list:
> >> v8: Fix kernel-doc style
> >>     Add error handling in vf_guc_min_load_for_hwconfig
> >> v7: Add kernel-doc for xe_guc_disable_communication
> >>     Unset submission_state.enabled as well
> >> v6: Skip disable ct on xe_guc_enable_communication error
> >> v5: Set wedge is excessive action, revert back to disable ct
> >> v4: Fix typo and add new line
> >> v3: v2 CI re-run
> >> v2: Remove unnecessary jump to err-out
> >>     Drop disable ct, switch to set wedge
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc.c | 20 ++++++++++++++++++--
> >>  drivers/gpu/drm/xe/xe_guc.h |  1 +
> >>  drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
> >>  3 files changed, 33 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >> index 8573957facae..6643a2cb898b 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >> @@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> >>  
> >>  	ret = xe_gt_sriov_vf_connect(gt);
> >>  	if (ret)
> >> -		return ret;
> >> +		goto err_out;
> >>  
> >>  	ret = xe_gt_sriov_vf_query_runtime(gt);
> >>  	if (ret)
> >> -		return ret;
> >> +		goto err_out;
> >>  
> >>  	return 0;
> >> +
> >> +err_out:
> >> +	xe_guc_disable_communication(guc);
> >> +	return ret;
> >>  }
> >>  
> >>  /**
> >> @@ -1337,6 +1341,18 @@ int xe_guc_enable_communication(struct xe_guc *guc)
> >>  	return 0;
> >>  }
> >>  
> >> +/**
> >> + * xe_guc_disable_communication() - Disable GuC communication
> >> + * @guc: The GuC object
> >> + *
> >> + * This function will disable the GuC communication.
> >> + */
> >> +void xe_guc_disable_communication(struct xe_guc *guc)
> >> +{
> >> +	guc->submission_state.enabled = false;
> >> +	xe_guc_ct_disable(&guc->ct);
> > 
> > Didn't this used to just be a wrapper for xe_guc_ct_disable?
> > 
> > ... Well, I suppose needing to set the submission state enabled to false
> > would also be a rather important step, so it's probably good that was added.
> 
> hmm, while it might be a required step for shutdown, putting it here
> looks like a random choice, it's unbalanced what "enable_communication"
> did and also looks like a violation of the layering, as guc_submit code
> has its own files and we shouldn't touch internals from the outside
> 
> + @Matt
> 

In general, the use of guc->submission_state.enabled in the existing
driver doesn't appear correct. It's accessed in multiple files without
any clear locking or layering rules. This falls into the category of "I
wrote this early in Xe without much thought or due to some ignorance,
and we never cleaned it up"—and there's quite a bit of that floating
around in Xe. So I agree with Michal—we shouldn't make this worse.

Rather than calling xe_guc_disable_communication here, maybe call
xe_guc_sanitize instead? It should achieve what you're aiming for
without further complicating the handling of
guc->submission_state.enabled.

Matt

> > 
> > Everything else is LGTM, so
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> > 
> >> +}
> >> +
> >>  int xe_guc_suspend(struct xe_guc *guc)
> >>  {
> >>  	struct xe_gt *gt = guc_to_gt(guc);
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> >> index 22cf019a11bf..20823b821f7d 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.h
> >> +++ b/drivers/gpu/drm/xe/xe_guc.h
> >> @@ -34,6 +34,7 @@ int xe_guc_reset(struct xe_guc *guc);
> >>  int xe_guc_upload(struct xe_guc *guc);
> >>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> >>  int xe_guc_enable_communication(struct xe_guc *guc);
> >> +void xe_guc_disable_communication(struct xe_guc *guc);
> >>  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> >>  int xe_guc_suspend(struct xe_guc *guc);
> >>  void xe_guc_notify(struct xe_guc *guc);
> >> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> >> index 6431ba3a2c53..1012fe84b379 100644
> >> --- a/drivers/gpu/drm/xe/xe_uc.c
> >> +++ b/drivers/gpu/drm/xe/xe_uc.c
> >> @@ -13,6 +13,7 @@
> >>  #include "xe_gt_printk.h"
> >>  #include "xe_gt_sriov_vf.h"
> >>  #include "xe_guc.h"
> >> +#include "xe_guc_ct.h"
> >>  #include "xe_guc_pc.h"
> >>  #include "xe_guc_engine_activity.h"
> >>  #include "xe_huc.h"
> >> @@ -158,7 +159,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> >>  
> >>  	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
> >>  	if (err)
> >> -		return err;
> >> +		goto err_out;
> >>  
> >>  	uc->guc.submission_state.enabled = true;
> >>  
> >> @@ -168,9 +169,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> >>  
> >>  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
> >>  	if (err)
> >> -		return err;
> >> +		goto err_out;
> >>  
> >>  	return 0;
> >> +
> >> +err_out:
> >> +	xe_guc_disable_communication(&uc->guc);
> >> +	return err;
> >>  }
> >>  
> >>  /*
> >> @@ -202,15 +207,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
> >>  
> >>  	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
> >>  	if (ret)
> >> -		return ret;
> >> +		goto err_out;
> >>  
> >>  	ret = xe_guc_post_load_init(&uc->guc);
> >>  	if (ret)
> >> -		return ret;
> >> +		goto err_out;
> >>  
> >>  	ret = xe_guc_pc_start(&uc->guc.pc);
> >>  	if (ret)
> >> -		return ret;
> >> +		goto err_out;
> >>  
> >>  	xe_guc_engine_activity_enable_stats(&uc->guc);
> >>  
> >> @@ -222,6 +227,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
> >>  	xe_gsc_load_start(&uc->gsc);
> >>  
> >>  	return 0;
> >> +
> >> +err_out:
> >> +	xe_guc_disable_communication(&uc->guc);
> >> +	return ret;
> >>  }
> >>  
> >>  int xe_uc_reset_prepare(struct xe_uc *uc)
> >> -- 
> >> 2.34.1
> >>
> >>
> 
