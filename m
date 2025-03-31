Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED63C36014
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 21:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDA010E1B5;
	Mon, 31 Mar 2025 21:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYIVvBNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B34D10E1B5
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743457528; x=1774993528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gyUuwdrKMDpw7AhvqHUGF0DhVBjmJStzTwXnBcQfkss=;
 b=NYIVvBNJaksSnAZvO5wzm67YAca7UqzB4TPuC+SZuTq6Y1oKFhrBElMf
 xaOvi+fvgytxMirxsKSvVBUsUgAznTGEacczos3caR+QBgoR/SnhNQQFb
 3aMCXbc+1Fc2hs4vR7zmHGDuJc1iozUUsssnM7fjSMht225gWCdya8mvO
 LcUMzstEnVIJwXXuDa3tI2+yIzPqalgD04pJyRJN4yEdxZiASM4UC2A2P
 UN+RMzxOgp68jXPZc40Gu0jTwr+4YrEPgc3grDpUusrcqN0xlgPNT3cPw
 EyAZUFNTpOmju3UW61QmHXT9axm9eqfTuz1XSGYuh3qzOH7YmGFbnFcoB g==;
X-CSE-ConnectionGUID: 6CNAHeHHQLGRpsAzqhk31w==
X-CSE-MsgGUID: vJfPYWfmRZycfiw9BAMvCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62154898"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="62154898"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 14:45:27 -0700
X-CSE-ConnectionGUID: gMFG9DDbTVqwI8v1zuoTnQ==
X-CSE-MsgGUID: 8Uxpljc3RKuUasMY9LPIYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="125955834"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 14:45:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 14:45:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 14:45:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 14:45:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pByelMi0b3ngot+leEO+SKxLNerpISypexxE8VR5/N63RbdbITZaA98LWvp8t/B6EQjOqh2HkidYItOMVrlDowrmgx32k5fUVXA/i+EX81CU00ks77Y/vWYTWbEl0gYKYp+BOCD+yqAK3V9Hok0FcNdLCTzQMAg2akCdyUrz6zpzAVcaMp2CAVmKO1C2UFhUkE5/nvGSUQ3aQxLB8ufvaaO+0ETwoyIqxLzfHiCrdm+PK8pSTQYoSyBTzsAGpeKFmQFijovKUd+33afYeOVePd3QNRofjgcaNEJoZqo8H0rfKYCC6RTqxdt7TtEytwKZwgarZdxKZYQ0wmKxmDl32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9sVLwIoKHV/OACHOzSNUAUr2IIkGAfGRcrxJmf353w=;
 b=mmKwN+L9tXAnoHSdJdi12mU8bhkmloj+pHPELNLU6PS88cyBvzEfdC8NvVzKP2KTxNgu2lPTXJtT2+DYAgDHPAy7GoD38MhlYCbXVQ4DVfSiJ8sJqxyduQAf7bPiaVMou+VUavRk8zODJl9OYa6MFL4dgdkuRTwc2SGF5uSyhXkG6aloiiEMminU/dZEOUKAUavB+morJd8p3jtlZ46nhRzHn8eOYyTRPgpmx8j3CQcbNaRqllq6N62klcCTyU8wX0rxudqsJdE04SKTc9MQ9WDVX3qe5L7YeHwSGflppSzf0ayTzRkcUEqdrusptMyPA8dgK4x9ULRClRn7n7+RZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS4PPF890B596B9.namprd11.prod.outlook.com (2603:10b6:f:fc02::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 21:45:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 21:45:09 +0000
Date: Mon, 31 Mar 2025 16:45:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 0/2] Add configfs support for survivability mode
Message-ID: <t33j6tcubwtq6r4wuhmz2p6s2wwpqsv7bye7ilzwf7r3vwpt2p@bop726wytsvs>
References: <20250327064204.459968-1-riana.tauro@intel.com>
 <zvdiclntjpojrpdzg6fehnecirfigza7vwir5f7go3rmzwee6a@fqazbweelg54>
 <Z-r40FFDDRVzI7wb@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-r40FFDDRVzI7wb@intel.com>
X-ClientProxiedBy: MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS4PPF890B596B9:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1776dc-792f-4da3-09a3-08dd709d4eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDMySU1Xc1JxWkkvQmh1N3h4M01aWm1STk1HeUkyVjBhWmR2Mkw3Z3pPNGc4?=
 =?utf-8?B?ZG83b2JMdWd1YnZqUFpXY2hvUTRwN0F2MUpxZWZIZi9HZlNGR1hwNzVjTXV2?=
 =?utf-8?B?bjJvVVN3V2lQZTVJaU84cjIvdVZpLzBnd2pBNWl0VEhMMGJGcXlqbTBxbytM?=
 =?utf-8?B?UzB6SUlUeUZqRENNaHp3WGVYUG40SzBQY2RtdkloaC9YSmllRUpjTVdGdnFz?=
 =?utf-8?B?V2RFS2pwQzhrWXhvcERMaUNiejFBcXBtcHV3VW1YOE9KczlPbU5IZDBQRnVK?=
 =?utf-8?B?Wm0wZ1g0ZHNyN2RNbXRkNHBBUVdQZlZweTZlbGZMR0FSVktOYW92bzhPeEU1?=
 =?utf-8?B?MXd1R2pXSEU2TDI3VDZaV3FGNlhGSHNCZ1BlU2ZmbnVCeDRNRzJxRTA1SjRZ?=
 =?utf-8?B?cDh6bWIrMWJaQTU5MVBoSmVQK0ljYlZ0YXlRaENkaGRJY2E4SDdxK1hzNEJ4?=
 =?utf-8?B?MG0xZ1EzanUzaFFaZTlTMFhwQXF2bXBtRDVZeUZSVlhJM0dsaS8rcG9WWHZa?=
 =?utf-8?B?M2daUzg1LzY3OGNrYkZPNk12czNHc0ptSndkbUJUN0IzMnBwc1BacE5QbXQ1?=
 =?utf-8?B?ZU1WbnF4dlQ4U3h3WEhFbUFBQnRxaW1qSGV3NHVMa05aS0k1aGZCamI5VEN0?=
 =?utf-8?B?VExaQkQrdllFQ0k2MVdDMnVHU3hLWFhBcnhhejlNU21iMTNqZkZ5Umh4SWVp?=
 =?utf-8?B?MEMrN29reHZVZGVtQmFpT3Bsbk9NbmlGbXE3UzNVN2xRMXFTS0lFMUlKNDl6?=
 =?utf-8?B?QjhsWERUS05CNXl0TDZkRm9LQjdYSzJFSEZDWHg2UEpIcGNQZlk0ZzBwQlU2?=
 =?utf-8?B?MkZwMU9VVHdVT05mVmZzSUV2MnRWeHlJcUdqSmtBbVk5NUdIL3dXT1hQVEdO?=
 =?utf-8?B?R24wSDE3SWh4dUJIMkNOUm4yMDBoaGxiaVpndGFtYWxyMEZPUGhCUlNlWHo1?=
 =?utf-8?B?blpIRDl2U1hmQ2NwdjcwOFA1WXU5TmtuZXZKNzNENzJHQkRkZ1U3SVZvM2oy?=
 =?utf-8?B?MVArSW5XL0V0cktnYTZWVjFFK2I4TnBxQVJMdnIzNndDQjFUVkkxMk5ZaEVp?=
 =?utf-8?B?MGU4VG9aL0dTZS81dTQ2eDI4NzFwT3BDL2JQdVZqMk5OOGJ4eC9kT2ZHMEQw?=
 =?utf-8?B?UlY1MGtxYTJsc3RSenhPc1V2VSsrTUFFNmhTb0FPZ2FDelp3U3lvSkYwZWI5?=
 =?utf-8?B?Y1Y1djY2dWtRa21lcjcycTQramRYTDJ3NG9xWjEzSVJiTHo4ZDh0N2RRNFhj?=
 =?utf-8?B?VXhEd0pNUk82YnNUZ3JyT25JVjNjZys2dVI0YS9qYW5nT1hyWTFNN0VXY3lN?=
 =?utf-8?B?YVIzWmFxR2hhY3RCNmwzczF4SHY0QXRrWWc2UHI3TlZzalpNM050K1h1cnZ6?=
 =?utf-8?B?OEVoT2VHUEc2YURiWmt3K2NVS0s4WDBJZXRYREdGQ3l1and5L2VTanpSOUNa?=
 =?utf-8?B?ZUZ0UnM0OUNLSEljMTBTZ1VIK200KzVtaHVVN2dHQVpzTjlVVS8yYUhmTFd1?=
 =?utf-8?B?Zk5xUTZtKy9icWJieTkvWXNLOTlVMUtqcDE1WUkvcVZvM1R5a1ZXcmlTcFFE?=
 =?utf-8?B?OTN5WlZBMHMwWTJVYTc0dmU0SnRvbGRmSERLV282akt0eElSUlYvMC9jKzB6?=
 =?utf-8?B?d0pudk5iTC80VGJxSXFFcU9sTEtlRk1zRExrTlBDS0I2TXJZZXJpMEUrR3BX?=
 =?utf-8?B?cSt1T0ZhRWRNT0NaZnhyaDBwTTNSblZHWUdOZlN5TkR5UVVRMFpvV1VvY0Nx?=
 =?utf-8?B?Mm5NK3p5NGFBYndVQVRxWDJ3NFpvZXNkTVdQT1cveU1HbnBOSmVLQ3JTMHFl?=
 =?utf-8?B?cTB5M3dKTE0xUy9sWmpCaHhXSVA2aWZrb3l2Tjk1ODU3RGlyclVZaUJyNURM?=
 =?utf-8?Q?UbxUXND6X6qMJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGowQ2diZ29rYngyK1ZmTStsQ2N1TjFmNzBZb2dNUmVnRFhQdjVsaUNCbElp?=
 =?utf-8?B?UzVOTmN3MldHVmp4WnZTczNvZTI4V2htWmRjb0d2UVM4VzVBN2RaQko1Y2c0?=
 =?utf-8?B?S1pEUW8ybktRbzdTVi9Ud042MlUzeUU1YnN6MyttVi9xS2hrQ1BPUVBHT0t3?=
 =?utf-8?B?YW5vbVBOekxtZUJYczE0a3VvSzNlUU5vUWxEL2RFRTcrMVhJQUZhZmxqSWxv?=
 =?utf-8?B?eUxndXJFSVJ5bEZ6VllWWmVReDVkUDFxRzdnbVl5OXppaER5a3A4RVdUVEpN?=
 =?utf-8?B?WE0rZ2MwaHFTYm9VR0tPNnNLMUlWUW14RzBoU2k1YkhwUlp0czN6WEVYeVB0?=
 =?utf-8?B?dE5iNUsxd1B5TEk4NDB2SVh3d1ZyU0s4TnBLWFF3V1g4cmxRVHRoWXluUjBl?=
 =?utf-8?B?K2VPWkRtK1QveXE4L0N1MkZnRUpGQW5SYlVXcGVTa3NjUVFSVGhPK0dpTU9h?=
 =?utf-8?B?YjZjc0VVYTFQOWRIZnZTKytEbjNranhIbHEvamszQm5xVnhtR2VpZVoxUVRu?=
 =?utf-8?B?MGFCZnlCajlOa2svVC9UT09mM3VIM3l4VEZqN2dDK2VLc1NHak1hdUNVS0tP?=
 =?utf-8?B?ejZhOEtLekxDQ3RRellEN0N2L2o5ZVE0UUhEV0M0RWdCaUxXSHpMTG5QczRS?=
 =?utf-8?B?bWhKNXBpNHk1WnpvK1JadHJhL0FCZW9XbE9GcHd4a1JPcHNVRENUQ0VhbTFm?=
 =?utf-8?B?S3NTWVgzUjBLR0VkUkRsWjYvaEF1U2hUSFUrMTJDZnVwU0Zsd09JV21nN3Uy?=
 =?utf-8?B?K2xtWWdET2xINmw4SXJ1cm1KQ3BCNzdFN21QVkhjUkZ1VlF5NTg1T3FuYVdD?=
 =?utf-8?B?eHI4cUNKL2RtYlVtV0FmaUN4cTJiUnUxMVZ3MFJTMG82S3NvMllWa1NWUnVy?=
 =?utf-8?B?aEhlVEZnYXBDazF6ckFwMENXT0ZxQ0JLaGVLWHJoZ3hTdnkxU0MyYTd4aVhq?=
 =?utf-8?B?enVqYm9wVXhDdHExZmJpbFdZcHcwTEg4RWpCTFZKamlMd1RLOVJrcHdxeWJF?=
 =?utf-8?B?Tis2V1FVZjF1czY4dnhDK3VNZ2xHNFFiMERZNDRxSnRhREtQWTJhaWdDeXkr?=
 =?utf-8?B?bnUyUHJ3aENYak9NN3JKWmRzNktZUzZWdW9UZ0tYN0UyNGxFcks0V3ZOd3lq?=
 =?utf-8?B?V1lVZGUrUXc0QjhmdjdtaUltZ1JPTGVzc29wRDc5R0RHRlNhU3p6VCt5YmRP?=
 =?utf-8?B?NXdBeHlOVW5qcXd4QTVZSUpoVFBSNzB1cVplSlgzVnA5SU9kckJmUTdEaEZm?=
 =?utf-8?B?b0ZwS2RPaUEra3NJMkFOVG02dW1hYkE0Zi9vdkJ5NWM1aEVVeXdFOWpxSzl1?=
 =?utf-8?B?aS9JbjB2cU41UkwzLzl2YU15VmhMbkVIbkpnTkx6dEJCRThUYjdQZjlYMmtI?=
 =?utf-8?B?ZDVzcDNXQW9NSGduTndGNkVUSnUxN3N5ckF2UlRpNnFZc3JCT2dkR0N6NFVX?=
 =?utf-8?B?bVkzci9tb1MyR3BLeGVsUVBOR1JLS1VNSCsvdEt6R2x0RlJUZFN6V0FnMFZ3?=
 =?utf-8?B?Q1pBRm84ZkFycDBQZ1NpVERYRUZzaTFYd0xkaGsrbDhhR0M2THVWbm9sZDBK?=
 =?utf-8?B?ZzZWMDJnV2xvWjBTa1laNVJXWnVRSHk2SmpOUGhEQTVLbGEzM2Nta2F2bjZx?=
 =?utf-8?B?UlFnT2pmczFXdlBoVDVaKzc3Z2diTFlwcGdTREZuMmN6dTZYdy84eFpzNy9K?=
 =?utf-8?B?Sm1QTlplODJXdG5XN2Q3RUoxT2E4VzB2OGQ5WEVWUUpUU1dwUE9XaVA5ak5o?=
 =?utf-8?B?WFJqbXp4LzNOWEdLTXpGK2t2Nmx6aHpTNTZ0bG9VeEpYam4yWHAxdW1SUlp4?=
 =?utf-8?B?UExab3Y2Z0ZJMEtGTXd0RW8yV215MXZsOGdNeVd1alRaSExXTitweUZROVZt?=
 =?utf-8?B?dVo4ekRubkRnOUVQRWp5WXlaQmRLd3FNejFMNDkvdFdhVnhaRVgxa0dKV25n?=
 =?utf-8?B?UzZyVnorbFhmdmQyWU5vcm1YUW56WGdCaHgxUUR5VGFQVkk5SFdoS3Zndmtv?=
 =?utf-8?B?SjVYNElHTUY5K1RSczY2NHdvWmtPNmNIdkZSTS9QR2FSaUJzdzJoM2ZlRWcy?=
 =?utf-8?B?R2pMZVBUV2dGbkJHQ1U2NGtmcTM0aERkclJsZ3ZCRG53SGRqZ2lBMlpCaW5v?=
 =?utf-8?B?TENnWU5ENFJQQzdRTDNiVk1TNHE5Z3ZIQ0V3dHMxYmQybjRtQldyanpobWdH?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1776dc-792f-4da3-09a3-08dd709d4eee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:45:09.4901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRXJgqOXelNQR2qb60IyfhD0M+vYTOVN6HdmRRpXN0ynMB2SDiKLi5UgpbKFxLDREpJxKTVeNMVplWfFpY2y/3hsny2CS0MeF/0fLd7gBEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF890B596B9
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

On Mon, Mar 31, 2025 at 04:19:28PM -0400, Rodrigo Vivi wrote:
>On Thu, Mar 27, 2025 at 09:40:39AM -0500, Lucas De Marchi wrote:
>> On Thu, Mar 27, 2025 at 12:12:00PM +0530, Riana Tauro wrote:
>> > This series proposes to expose attributes via xe configfs
>> > subsystem. Xe registers a configfs subsystem named 'xe'.
>> > Userspace can then create directories for the devices they
>> > want to configure and set appropriate attributes
>> >
>> > This is done by
>> >
>> > mount -t configfs none /config
>> > mkdir /config/xe/0000:03:00.0
>> >
>>
>> If we need a new version or to document anywhere in our docs, I'd add a
>> comment here:
>>
>> # If driver is already bound, unbind it as this configuration
>> # applies only when probing it
>>
>> > echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>> > echo 1 > sys/kernel/config/xe/0000:03:00.0/survivability_mode
>> > echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>> >
>> > This is an alternative to introducing module param that causes
>> > all the connected and supported GPU cards to enter survivability mode.
>> > Manually entering survivability mode is useful when pcode does not
>> > report failure, in field repairs and validation
>> >
>> > Rev2: use config_groups (Lucas)
>>
>> Awesome. I have some other work pending that will make use of
>> it. I will play with these patches soon.
>
>I really liked this new flow and I was giving it a try here right now.
>
>However it didn't work. It didn't take me to the survivability mode,
>but also, I cannot unload the xe after creating this configfs file:
>
>sudo remove /sys/kernel/config/xe/0000\:0*
>rm: cannot remove '0000:00:02.0/survivability_mode': Operation not permitted
>rm: cannot remove '0000:03:00.0/survivability_mode': Operation not permitted

humn... testing on a bmg, it works:

	# # first of all, make sure autoprobe doesn't do what we don't
	# # want:
	# echo 0  > /sys/bus/pci/drivers_autoprobe

	# # load module and set the configuration
	# modprobe xe
	# mkdir /sys/kernel/config/xe/0000:03:00.0
	# echo 1 > /sys/kernel/config/xe/0000\:03\:00.0/survivability_mode

	# # bind the driver and check it enters survivability mode
	# echo 0000:03:00.0 > /sys/module/xe/drivers/pci\:xe/bind
	# dmesg | tail -n1
	[ 1994.807063] xe 0000:03:00.0: In Survivability Mode
	# cat  /sys/bus/pci/drivers/xe/0000\:03\:00.0/survivability_mode 
	Capability Info: 0x138320 - 0x2001ae06
	Postcode Info: 0x138324 - 0x0
	Overflow Info: 0x138328 - 0x0
	Auxiliary Info 0: 0x13832c - 0x0

Unbind first and test we can remove the configuration for next bind:

	# echo 0000:03:00.0 > /sys/module/xe/drivers/pci\:xe/unbind
	# tree /sys/kernel/config/xe
	/sys/kernel/config/xe
	└── 0000:03:00.0
	    └── survivability_mode
	# rmdir /sys/kernel/config/xe/0000:03:00.0/
	# tree /sys/kernel/config/xe
	/sys/kernel/config/xe

Remove module:
	# modprobe -r xe


What doesn't work:

	1) Remove the module without unbinding. This is already the case
	2) Remove the module without unbinding first

For (2) it's basicaly: when you create a configfs connection, configfs
increments the module's refcount. You have to remove them first.

For my surprise, it's possible to remove the config after binding -
there's no error. I need to double check if this wouldn't create some
UAF depending on how we use the config, but for survivability purposes,
I don't think it has an issue with that single bool.

Lucas De Marchi

>
>Tried to unbind and had the same failure.
>
>then with the configfs there we cannot remove the module:
>$ sudo rmmod xe
>rmmod: ERROR: Module xe is in use

what's the `lsmod | grep xe` output?

You should always be able to unbind. There's nothing the driver can do
that would block the unbind. After unbind, you should rmdir every dir in
/sys/kernel/config/xe/*. Note that it's not an rm -r since you can't
remove the inner configuration files, only the directory that is the
"connection" between configfs and the driver. You also can't remove the
xe dir (as it's owned by the module, not the connection to the device),
only  the dirs under it.

Lucas De Marchi


>
>
>So, it looks we have some stuff to adjust here before we can move further,
>but so far things are looking promising indeed
>
>>
>> thanks
>> Lucas De Marchi
