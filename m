Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E467CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 18:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DD710E834;
	Wed, 22 Oct 2025 18:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FB/aJuV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8750810E834
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 18:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761158889; x=1792694889;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FZffyk9I07yRLNbZM6rMZyLPz3YyFoGDazWITiIROcU=;
 b=FB/aJuV/tbfkurFCOr79HGNCJoNA4dCBHK3/YTmRpR7XfiK05Scypb1q
 ReUA7ZP/Q4chf6XlLwixPmV/iIWX03x9dlX/UcQZ/v2mMxsTY8AzG2iQd
 3kIdjzj/dQVTW49W11/atK1k7KIFn2KfXnUE36D4QDH4v0eQ2tiQj95VQ
 ZwB2cKtY0k7WmElh5DhZfJwyVTxEAMPbAPVihxo48EBncRtXvIK2HE3Dq
 hHvo8q+YcjXvHzwpQKc+AhaCANJRPYX1NDhuy6RDTsRJn9ZwgB8SvufwU
 ahzUrckVzFtqOE0vZGw5c1eswmM79G9TEsIf2Bre7O3nUwwzXno9UhyCS w==;
X-CSE-ConnectionGUID: ZvINv4SZTt+oZSWowKvcTA==
X-CSE-MsgGUID: XNUg29ZwSqWuIRrQ6xF2hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67155026"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67155026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:48:08 -0700
X-CSE-ConnectionGUID: W5zN1nfARmGX88ABcjM7aw==
X-CSE-MsgGUID: BH9rJ8BRThKOW2Omvys4Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="187990802"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:48:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 11:48:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 11:48:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 11:48:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoILaMVzg6scthDZenjGfvkC1ZoNYDBMN2PLnGs/FBaqaabpkI7zUkLB5pr6nJrQQCRgo3KxgmzwadAVGHEYsC1CKQ+D15M5w4Nvtk0cCNCRQixoYzmjFMjU00Z6VWH4lCyrBrcouqsXQ5XOTClLvqfGB0xmpJ/kYu1H0BLx7/K97RgldGDQ3AetBbDL492YAERwxsgcT6Um4CENBMK8LZnmYk+6Vexhz71UYSxsMpOTo1bJjfCeA4bsht0Vmj6q9oW7k6dGLPmJHiHeZFV/v/grGyO78xKFetMVfR5bbxvQ2Bq8hVA7HHdwccwzlSjipws6SmoHW6MSEUUfhExrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QdI7/WwgDVkfAKRcdQWpA9FJbQfiUFOmv6DzEkYAXw=;
 b=LlLTTIsGUewIOKXSaAOeRLeFQESPQLhX7p7G2HeivzWjUEsxw41GHyP8JoBBZbZ29vIkUdVqA2+1pZfF7YoXcQlD3+xSZUIRkB17SNGk9Dq+cFdpTCzw8+lXvEOZG4d/ssARUi8kwX/BsOvsxSpiI59XBBNjOferFnGtR+mcTDF6bOGfMFFk3Mzx0zDtCeYLzOKinb/udM+7hLFycs65NE2hGUlwS98GLfbIN0GXsdLoVoXfDgp8RUogE7EsOESUZTyPUzalCQnPUl1lcjitjRWz3Rb+EQTKQVgMstQvYZ8raWfmnfSolhKOgDb3yssxSGvmxhyrYEs4HVU+oJY/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 18:48:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 18:48:05 +0000
Date: Wed, 22 Oct 2025 11:48:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Limit number of jobs per exec queue
Message-ID: <aPkm4utKS39I1W/o@lstrano-desk.jf.intel.com>
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022181036.2868787-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0329.namprd04.prod.outlook.com
 (2603:10b6:303:82::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a88f836-4451-4d0e-8fea-08de119b88ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTZyYXpkdW9oVDZBaUhWQjFiZGlMdndwRGhKRWFUUDFqbDE0SFZvaDBrZEVL?=
 =?utf-8?B?Qk9UQ1I1azZSL2ZHNE01YjZpUU9teEViUVRPRnIrd2pIeS9paTNPVkdzbjh6?=
 =?utf-8?B?aWVyVGg4YkthazRHUXYrREFxMXBybU1LeG9VcCs1QkIyNm9aeVZFZ3gydHZh?=
 =?utf-8?B?RjdxcjdiMXhYT0twZS8ycjhXcGF5azMrUUd5VDZJdWJhd01VK1l3ak5neXhk?=
 =?utf-8?B?SjlZUWw4QkUvWkhkWU44bzBkVFp1NnhlbVhUQ1l2aHpMQnh1c3ZKTUtEZ0py?=
 =?utf-8?B?b0lZZ2paVmlqc0V1OFcrdGQvMFZVSHZ4SkJsZy9LRk5rVVFjSUxKUlUxOHFN?=
 =?utf-8?B?YXlBbFk2TzJWU1kzUXNtZUk1Z1JlYk9FNEtGRHdzdUNsVG1qVDdXSGM5RXRF?=
 =?utf-8?B?TUs4cGltZkw5Z1hzcThZMnBzVW8xVmUwdThKUzZSb09heTY0MWdRTTE1RkR3?=
 =?utf-8?B?ZVluUW4rWi9xeXh4WGpWRWtXQmJDUURHYml2YjFGWk9MTjF2THlCOWlYeFVh?=
 =?utf-8?B?enBMOWU5YjlUVy9sU3ZORFhlQXgweVpDQUhEa2V3YTNzQ1RpQks5Nm1WQmor?=
 =?utf-8?B?MU9HYWdMZDhhU1pGUENPN20vN01Ob1ZtdmtIS0l1YVNwRDhZTFZEa2hLQ00z?=
 =?utf-8?B?cmtIYjd1K3hSeTRuMThSQzRKVXhseEFwbzArT1RIY0NSQS9wRzdkMGpNRDh6?=
 =?utf-8?B?aDRNVVdHdENIVzFQVGNTazUwZytTaEFudGp6dG42QTBZalZ0eTRyUEtTUFla?=
 =?utf-8?B?aEt0QkorZHRkTlRhU1hUUWpnS0YyTldpeEF3VTMzTnRCNFROOUpvMlVxTnNH?=
 =?utf-8?B?RXhUaW5Iczd2MGQvVVBpZzBWdkdZOW9sV3h3WmVIaWpLb29mcG5jTlI1NDNU?=
 =?utf-8?B?MjVqUWJLVjZya253RGRZZTRnQUlHbWVub3ZuRU1BU3dpQkl5RURhWFRpdFBr?=
 =?utf-8?B?QlJGa1A1d0ZuL2t5bUJlbFlOUS9xSU5Xc2tkdDFDcjJKbUc2NEJYY2FLT2Yw?=
 =?utf-8?B?anJFQlp3QVp5OGQ3RXg1dmFrc3VtbWdCQ09aUFExS2RBaEU4N21CZUpLTE9j?=
 =?utf-8?B?UzYwMUNNUnJ4KzgwSTRlVGJ1dlhmTi9HUHRNRTJoUWRBL3hlbGNLUDF3R2Iz?=
 =?utf-8?B?bUZuYXFjK3VkVVJNUHNiMTZ3bzJlZVVPcFVUczNmdEd0bU5VRW53cm5MNGhP?=
 =?utf-8?B?WC90d0NDQVlRUE1ESUdLcGdzbGVLZm1vZTdWQU84S05YbXI3MFdPeUxJY244?=
 =?utf-8?B?aXNMVXRyR0V4SCs5bUJBbnlScEFEMDBWK1I4THg1Q1J2QXpZTkp3eTRVMHA5?=
 =?utf-8?B?N1grcHBIeDdmR1c0aktQdnZkUXQzUFo1ckRzZm9KM2JJa0pLK3ZSN0o5MHpJ?=
 =?utf-8?B?VitWTjFCcm1iTi8yeDNOMEdjMGFiS25QSFpZem01MGhFbnd0M0ZxcVd6aWtB?=
 =?utf-8?B?R3hsWVhuYXA5UC96eXY1bC9lSmc0R3NRR1FLWUxkaHAwV0duQ25wQ3cwb1dr?=
 =?utf-8?B?bjZhcXhhM2lOOHArOGZmbzJab0R3L2N5R2ZGVUdzOWZDdDZYVmM4WjNsdGNF?=
 =?utf-8?B?ZmRSd0pmdVBTWUNzL1RudmV3MjRZc0hKY2JJaFZ4YW50aTFKRk9lVVNIRjdZ?=
 =?utf-8?B?aExVVWQ5YmhWbmcyS1FmSkptellHdHc4KzE5MWRIbzdncHpVMGtuakdmbm9D?=
 =?utf-8?B?SG9vTnlhMG50NysvdVJsSE5mR1VrLzBHUmdrL3BOVUJwa2hDM0p5UHMwWFpk?=
 =?utf-8?B?Skx0T3JtbFFCa0NsZzJ0eUpLODhBWXZ1L2ZMZjZ4K1gzTlpaMXE1Wkd0cUMz?=
 =?utf-8?B?dGJFbG5yNHFFZ2czZlBGQ2pvcDVTdWlJR1RvZkhIOWdEVVQrNWkvdUZ0Rm1D?=
 =?utf-8?B?QlF2UzZKVUttd1h4ejc3VEIvKzFzWEhwUVR6b1NENkdXWW9ua2JIMGM1RXk4?=
 =?utf-8?Q?SKvmFnkt1NnbwozE9MUYZXUMXb/oaN8x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JyS24yZVpnNVZZcy9uVVRzWk5vNmxDdEJtNVVYZ213elhSYlNIVElyMnp6?=
 =?utf-8?B?MHFrUXFuUWd3aVpNUWRFcTcwR2ZLSWI0bjBpQlBqYmczV0gvUGRRVUxySXhr?=
 =?utf-8?B?a2FKWU9IRUhFNGRQcXRZWm1nOHRhTTc1ZWZiSnpzMm1ibE8vVWJ1RnlJc2hl?=
 =?utf-8?B?TWQ3U2FCTlJRWmdkZTZETkVoMFg5UWlLU045Y1NDaGN0bFNJc0MyTll2Ni9v?=
 =?utf-8?B?U1kvT3VNU0h2VmJZMkFtY3J2c3VuOEhPcUFGRGcxTGtIcUVhT1VVWVg2d2ky?=
 =?utf-8?B?YUl5S0kxd21ObmYvV1I2YTFTakYycXhZTG9vY0dCamVlNHVhbFRFL0hDOTk1?=
 =?utf-8?B?LzN3eUlVVGpyT1RPVU9tc3JlR1lZR3hMcFVFMXlxOSt1VjJYU3l2R1FKVVBO?=
 =?utf-8?B?WWR3aE5sYTF4WElwYjAzOXA5MXBTem1qYXo0MDIvdjJJY2F1dk8xSVFFTm9a?=
 =?utf-8?B?NzdhNmpldHdNVmFzelI4bFovZ1RIZkVIUlBwMmQwRElhK2xMU3dKWm9MMDNJ?=
 =?utf-8?B?UitUN01lbnlOOUp1UUpaNWhaRkcwUFFpV2VxdG5YQUtJQTdzV1kvUHExVDJQ?=
 =?utf-8?B?SHRUd2FQbVhmUmdVdWFacEtjTml3V3hvMXlSNlhaRVJ4R0FtanV1R2dDWjNh?=
 =?utf-8?B?SkdiOGQrY21QbHU5dHdDYkpOU1BCMUlMNmJlbitMTEJhTkRFRTNTUlVuSTNH?=
 =?utf-8?B?NDIzMjlNRmVkamRsVkRPUUFjVlR3Mys5bEYvbGY4Y0dzMEVzTkZwaEYvSUhS?=
 =?utf-8?B?bXhzdVN3VDdmN2FQQVpsM3dyTVI0cmtIczdmU0w5NXhQSVJxaFBxYzBTQ0Nh?=
 =?utf-8?B?TXg1YU80UnZaMlVDZnB5SUgyMDFIREhjVnBRZngwUWxaYmtVUGlSL3RqYklp?=
 =?utf-8?B?VmNHVkViNkJwUnZxNnpsYzArbENja1BySUdGN25wbjBZQWw1R2RwMisydUN0?=
 =?utf-8?B?bElxOXFNTUc5am0xbnJqci84OWQwY2JXS2Zsb21ibHZFcGtJZXNpUU9aUjRv?=
 =?utf-8?B?RHRHT05YRTkwRmVHU1dibTZpMytsdDZxWTRRUVRRdzZHWHAyRjVGR3Fia1k4?=
 =?utf-8?B?NE1UMGpIMjh4ZUN6Uk16R2lDMEtqdE1rOWZKMGtCZ0lxSmhWNmVmcWRySjU0?=
 =?utf-8?B?T2xYcnh2VVFkL0FNVkRYVUh6cjIrQWRWaHZ1WEFuOUxhUU1SWGVnK3pVcXF5?=
 =?utf-8?B?RlZNNEJSQ3V3Ynk5bGVWSXF2aTdtYVB4WVNCYzRpT0VUTVdTb296NGxXckti?=
 =?utf-8?B?VVVVY1RTMUZUaFVObjAxMEd0UVhobzQ1YUM1bmpJTEkvZVg0MHFwNi9XKzBr?=
 =?utf-8?B?ZGU5UG1PakNnNDQ1VVNlN1hLLzl1MU8ydlMwNFJ5Yjg5dEdpWnE5OGdXYkxo?=
 =?utf-8?B?VG1vNXE4VE9wblhpaG9QLzZINDZ5aTdRUm1WRVRMeFRpT09Za285UFNqRVpC?=
 =?utf-8?B?UjRFY3JwQ0FONzJobjhmV3Y4bXlxR2F5anJMMFZ1UUdKK2hjQktOWS9tVzky?=
 =?utf-8?B?QzZvVFFaVXlVU3FkeG1oamVHd3JjcEd6Q2E4N0RVUisrUlNOczRLSzN5VVFx?=
 =?utf-8?B?cUhTQ1ZRc2hpZWZWdUFHWi9Jdlp1andHdmNtS1FoTGIzajkyTDBNOFBkZlpK?=
 =?utf-8?B?cVZZNHk5dittR2Y4bHl4ZGxZRG1LVHBlQ28yWFR5ZExhWEZXRUpuTUd6L1lp?=
 =?utf-8?B?ODdzcVZDVm5yRHRiK1lhTzJBZHRxMmVxUjZLZGk5ZithTVM0WG5GUWx0Nm5m?=
 =?utf-8?B?YzJ3L2lwNTV1UlAyWTlNeG1ScjkwQktGa1lIUkFIRHZEbzU0SjJ4ZnlSSnVw?=
 =?utf-8?B?aDRqTyt2UEhTb2RvZjRCS1BWVldPUUE3a1lmUEMrdEJCNFhoTm1ralZaL0Za?=
 =?utf-8?B?Tm5CNWlRWHFEK295bGFJZmNseU5OYW1WN2YrUW80ZVJUcEg0NDdLczIvY3Mr?=
 =?utf-8?B?aGtJUnhDZTlldUcyblY3TGp3ZnRTSFB4bUE2cEJIb0VUTitnSXppVktsV2VV?=
 =?utf-8?B?RVhJSlFEQWJ6WENpcjhrbkxMVTlYay8rNGh4WkwyWFY3V0V3Y0M3V3RybHlX?=
 =?utf-8?B?Q1dxQXlra0NSQ3hrNmpCOFZZR25ac2FiSFNYV3FXUDR4azFkdkN1VnhJT1pr?=
 =?utf-8?B?WUN2WjhrSWFxVkVFQldKQjhRa0JQYjNKbXV2eEMzUmVtL0NoQnd3VkxpcWRG?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a88f836-4451-4d0e-8fea-08de119b88ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 18:48:04.9465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXd2jHu68wRqH4mLPscKatX4ActEllcLxdwUqJpEuFRTigOpdllvF0HeVTVR4ePLNyNjJyJJoniXIr8Ii0WyIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
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

On Wed, Oct 22, 2025 at 06:10:37PM +0000, Shuicheng Lin wrote:
> Add a limit to the number of jobs that can be queued in a single
> exec queue to avoid potential resource exhaustion.
> 
> A new field `job_cnt` is introduced in `struct xe_exec_queue` to
> track the number of active DRM jobs, along with a maximum limit
> `XE_MAX_JOB_COUNT_PER_EXEC_QUEUE` set to 0x1000.
> 
> If the job count exceeds this threshold, `xe_exec_ioctl()` now
> returns `-EAGAIN` to signal that the caller should retry later.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c             | 5 +++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 5 +++++
>  drivers/gpu/drm/xe/xe_sched_job.c        | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 0dc27476832b..722a5ac0200a 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -154,6 +154,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto err_exec_queue;
>  	}
>  
> +	if (q->job_cnt >= XE_MAX_JOB_COUNT_PER_EXEC_QUEUE) {
> +		err = -EAGAIN;

How about an ftrace point if this occurs? Should help us detect if users
somehow hit this during normal operation.

> +		goto err_exec_queue;
> +	}
> +
>  	if (args->num_syncs) {
>  		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
>  		if (!syncs) {
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 282505fa1377..5f3219acec3c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -162,6 +162,11 @@ struct xe_exec_queue {
>  	const struct xe_ring_ops *ring_ops;
>  	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
>  	struct drm_sched_entity *entity;
> +
> +#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	0x1000

Hmm, I'm trying to think of a reasonable limit. 4K seems high. Maybe we
should check with the UMDs to understand the deepest reasonable pipeline
of jobs they build — to avoid blocking them here while still limiting
the DoS surface. My initial thought that 512 or 1k should be a
reasonable limit for now. Can always adjust going forward.

> +
> +	/** @job_cnt: number of drm jobs in this exec queue */
> +	u32 job_cnt;

This needs to be atomic. xe_sched_job_destroy can run in parallel with
the exec IOCTL.

Everything else looks correct.

Matt

>  	/**
>  	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..37f58be7cbcc 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -146,6 +146,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	for (i = 0; i < width; ++i)
>  		job->ptrs[i].batch_addr = batch_addr[i];
>  
> +	q->job_cnt++;
>  	xe_pm_runtime_get_noresume(job_to_xe(job));
>  	trace_xe_sched_job_create(job);
>  	return job;
> @@ -177,6 +178,7 @@ void xe_sched_job_destroy(struct kref *ref)
>  	dma_fence_put(job->fence);
>  	drm_sched_job_cleanup(&job->drm);
>  	job_free(job);
> +	q->job_cnt--;
>  	xe_exec_queue_put(q);
>  	xe_pm_runtime_put(xe);
>  }
> -- 
> 2.49.0
> 
