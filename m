Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0A1D1D482
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 16:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031A310E36A;
	Thu,  8 Jan 2026 16:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIKcCeEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B09D10E369
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 16:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767890208; x=1799426208;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6DeAgNTDAFHL4kZ9NvKHCHefhg9td5pmNfwmkQ7PPe8=;
 b=CIKcCeEmSeGiCb8dChkIIXxAu6vX54gGIFvlT0fwB5uZbwG27tWwz+HC
 Fjl46MT3R1Xq5cK7AXcLOJcd+ooVeeU+29VrWjm1eCPWI02DKJHUvAP2R
 BDQ9WsUFPZZsDSsR/4MY6sHg6ZBfLL7pP5x+N1wa9DC0ziRqwDIArPBqZ
 aqw7LMQGA6K+SsdYJnuIb9ifwqfEdlXGapcqV1LBDMzE12JqgB1CiDCYq
 ZN7fZ3gxeQaL+5hmAJ8hQA29BygjiLWLSRYqViuDrqelbGou1AOPBGGZ1
 L957pD6HeSksnKgr62M3h7DGBj82pM979NeybRbuHXR5x2S14MBgEeObo A==;
X-CSE-ConnectionGUID: L8X22etnSraEyfIbeAzV1Q==
X-CSE-MsgGUID: BsT2Q2h0R36plN882qx1RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69345096"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69345096"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:36:47 -0800
X-CSE-ConnectionGUID: /6m8gih8RRW+xaaR7+pd0Q==
X-CSE-MsgGUID: naD9NcxaRY24DRxg4et3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203307199"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:36:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:36:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 08:36:46 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:36:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7WMQZHY7wFPQynUZGRgMMSzqtkHSesJR7LD5RgzkRK0erSMA29XaPdWsm6/2V9gZs2RLdW08pMhi+oAmIGVXTSTuUWk9pxVwlAoE5c8CGwrsBXWgR4ipb5WsNZ9i2Vm64HUuOM9l9buX96Z3sOcrFB+EmNHI33MLkdyx2/9VKkecK52UFbUP+NVkXaYjOF9kIChGxSfE7x/tfBdm8B1xl+AyvjNz+ifjDpIEIQ7SDVnwNrtZCGD1JF926bLEjvYATBDt5/6UmjLIkkOz64vwqnLZKV7GlvTOx8ilB7RqE1fuvPcQFzUbUUZW5D2It8uFQxILgwVR8JP49l9rjs6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koMdrGsARW40wnlKyCJxjSogja/iXY4rY+3ooFY1PHs=;
 b=DqO+JsfuZmbUgKw57DRlZtszbJvjjIUEApeCo2R/CI0Ad66ZZdabU6xG4gLYUYf6+TuPGruJF4SKe2uUNFz1MhdHTJOn2AjFmslvLaYvHmt1wRybINz7dW5grFCyAdCapPG7DNE/QoTi7ZQTXQnjdIQL7REJ9N2W48Y6rD9a88IFtiOfGNBaSnNNoXhgKa8fu+7PMuWKkdDKYH0WJgrwcci/ECaR6LpzwffrRJH5ABlVBV3TBKqxmrT+ZrizGN0Du3n68X+HbT2BvzhAELLYB1A9qqfQEoQ/UCu4cAxn4nz4R/M81Fp8yVarILySAPy2AeP/I5SZqgpa2TV7DkoLZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 16:36:44 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 16:36:44 +0000
Message-ID: <0de2125a-c8b2-4d4d-bbbb-b079f752e303@intel.com>
Date: Thu, 8 Jan 2026 08:36:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/gsc: Make GSC FW load optional for newer
 platforms
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
 <20260108011340.2562349-6-daniele.ceraolospurio@intel.com>
 <aV_ArSsLW8jWUgHI@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aV_ArSsLW8jWUgHI@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BN9PR11MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: ff45b904-4041-4666-b72e-08de4ed41bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3FGTG5Vb2wvTVNMbHlUVXBXQWpabGhWWkMveUkrSVBMM3kzbEN2TnZYSTBP?=
 =?utf-8?B?RGI4VFVibHZTd3lPaTZNQlIxbzErN2U1eEFFdmJzU3JTcXR0Y1ZkUy9jODBZ?=
 =?utf-8?B?ZVNYa0EvK1pQODV5U2JHSkFMdHFXU2RYMnFNdmZqdmdMNjFnV1NiRCsrMW8v?=
 =?utf-8?B?N0VVcllTZ1Z4N0Z6NFhPUEVrbjRWZU1EQTUrY1l1bDZZcGZpZmYyMlFhYVA5?=
 =?utf-8?B?eGdManQ5QStsWSthVFlsbjkyU2FrUHYyMVJDTUxOWDhSUnVUUi85ZUYwOEwv?=
 =?utf-8?B?VDE4Vjhldy9OL2pzVVhPZ1BnNWtJa1duaVJoZlo5OHJyWWNtU29YQytnOUxY?=
 =?utf-8?B?S2dvV1lOS0hXYmNJWTFGSHFjOHpEY3ZXanAydHp3b3QwTC9aZjRVQ3ZZVXV3?=
 =?utf-8?B?VzhtaHpBdk5BSXV0UlA3bVc5N01HdElTNE5qcDZQU0RvWjkvZ3pQbzY0L1ZJ?=
 =?utf-8?B?eVRER2dPb1huQVhPbG9hZlBGei9FeGgvdm14bUlLcHRQU0Y3VXpKNDdHYVk1?=
 =?utf-8?B?QTBIZkdaVTNiV1pZUDB2RW84RElUVFlXdThDdElhYmVXL0VjK0VNV1VYcUM4?=
 =?utf-8?B?N3k3UTVrdmV2VXg4K2pTaU1Kblhwc2g4ZnBaUmhpZGQxSWVoaDdwM3VGRjJk?=
 =?utf-8?B?NHVhZXVoZDhEbHkyaEZMUDhtZjZwVzNwTUhac1p1bjBMMkc4WjBSd0V3WGlX?=
 =?utf-8?B?WXpvU09hcHFqTHJGZE5KVlQ4M3oybXVucTJSbW5HQjBuVWJtaXBPT3hJcUxj?=
 =?utf-8?B?SUtaVWJpS044T0puaE5xSnVGOVZGVzM0ZDRQL1VxblVVYThwTkJwOTNlL3NF?=
 =?utf-8?B?V3ZwWFZ0RnlyOVJER2hwWXhNV3ZXRVpTK3hacTJBSThlaTErdWZqOENUaEIx?=
 =?utf-8?B?VUQzeExGd3pLRVhHMExRR1E3bCtGVXBqYWF5VmJzU1ZYcS80YW5YQmwxbDA5?=
 =?utf-8?B?bmdSRDlhQkw1cjl3NFVlUngyT2duNFNVbVlYNGlvYWd3S3l1enBkdmhjaXdQ?=
 =?utf-8?B?Nk9uUVkwT1JLdGRzQmMzOFczRm9tdzl6aWdpTWdYRVIvSzZHd1c4cE9DQzQr?=
 =?utf-8?B?dE01L3VvL1kwNWRBM2VPVXgwRW9lNThoRWlMVFlTM3ZDNFQ3R29KWUREWDZm?=
 =?utf-8?B?cXl2WU9SZGlyMWRuUlBYVTFSUmFoK004THppZVB4UmNpSE5zNHFDRE1Ycno4?=
 =?utf-8?B?RWJOQURvSkZvSXN4K1dTdWJ3TTROajVyQk52MUhrTFArUnVVbmRWTW9melBI?=
 =?utf-8?B?ekZOWTdpaVBkMzJpbE01MkdZUmRPckorQ1JnbDFucURLK2lKeThjaWViMmRs?=
 =?utf-8?B?R0hDZkJyTFJBUzRGdFFhSHpHcWpKbWpubm4yLzFtejlpcm9kY2RyalIxV0lz?=
 =?utf-8?B?LzFuYVhxaGcvWXJXN0hOWFgvQnNmSVhVT2VOR3E5QjJPVjJWYlc5QXhraTRQ?=
 =?utf-8?B?OEJQYVdqOFE0aTVIRGlQckl4Q3hqR3FjcWNUWmdyV3NZVTRVWXZYclFENnYz?=
 =?utf-8?B?TXdDOXRER3pYclM2aHU4Y1Jwa20rNWtSWGxTa2pER1Q1YjZFd05hNllodURF?=
 =?utf-8?B?QlJmZmluSHlBd2FWTGwwVGZKWlM1WDFOSXhveWpDOW9JYjlybk1RY3hNeXQ3?=
 =?utf-8?B?a2o4b0JyNVdPTW9ENzB0eElOVWt4RjFoZ1kxUStMOFpxbTY1M0h2djhlRDRw?=
 =?utf-8?B?WVRKRkFJbDY3NFZFTE9iQzc2Y3FRejBvdFJlbTVEVHBLQlJwZ3ZXeUh3S2pt?=
 =?utf-8?B?TXFNVGUyLzdINTkzWTVVclR4STBweldKcTZHeWlSSGNKc2xaRFNHUTdiTDZ4?=
 =?utf-8?B?UzBDY2w1Q2Q4RkNBbExDb3pEOXJ2ZmxiZG12akRkd0F2d1QxSjFDSFUvRDNQ?=
 =?utf-8?B?NS8vVDFUVDJVTUFjUVBnMFBleENFeStSYTJKaDJwaXpoTWFyeTVKN1NjRXNz?=
 =?utf-8?Q?50nG0dKHEUB3TxCKxlexhPZL0xAMD1HG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWtYeE9uVUYxdXFaaEx0U2orVUhyL0FLWjRNUEtUZVpkazVCN1hCSStBTkRF?=
 =?utf-8?B?dUtMNVB4Y2NkUTJ1TWt5L1Vpd25keGNBRlQwQ1ZWV0dVZTVyVStrN3YrZmNu?=
 =?utf-8?B?NVdkNDN4aXdJOStjaElwaFNHdU55UDVjdDVkZjhJWGl2MEtPVW45bEpRcUxV?=
 =?utf-8?B?N2ZmY08rdEY1ajVSQjJ3WVJHcSt0aUdMRmNySmdhamlIQURZTS9pY28vNGVx?=
 =?utf-8?B?b0VpcEtBRnhveTRQVEVGUnlnVFdyK0J5T2N0cFp6NGlDZ2pPRE14WTlFcTN0?=
 =?utf-8?B?MzVleDd6Rm11NHBwd1Q2cXIyYlFwbm9FSStHZGNoQlBRUkpjNDNjSUplcklp?=
 =?utf-8?B?V0VxUkxCNE9KdlU1R2lZY2wvaUg4TlFuazJaRSt4R3k4ZUgwdDUvejBmNm9i?=
 =?utf-8?B?N2VXeHJxd1RIU2w5L2g5T1B6ZlBWUFZ1STRPYVJEYjlMaU1mUTJrODJjL1Z1?=
 =?utf-8?B?c3J3WURTWjg1bEsrVTIvd2JnR1VnczVmeHpWcE9JRlZ5WXFFRlRidDAyeVFy?=
 =?utf-8?B?ZG41Q3dVVDNhZENpT1hxMGM2V2VyTnVYM1p0MGZQN2NFMHRzODlUbDg0VndM?=
 =?utf-8?B?UnplT2dHM3hxZDBDTEl0ZGZ3cDhLenR4S0tDQURTQm5RN3ZDbTdXUUZjMjNI?=
 =?utf-8?B?RnZpR3RLd3YzdkVVcTBNbUdmZ1ZKdnFmTk5tUWwzb1U5NVh1alNxT1dEWUZH?=
 =?utf-8?B?c1dmSWF4Qm9YSklscERCOWxVNUh0TEtKSEN2ajkvZkQ1bFJqZ3pCTVFsYWlU?=
 =?utf-8?B?V1JMcmZRZjA1R1lubFJZME1vZzRnNjdZeE9xaWo2QWM5M2V2RlFNTVc4cXlD?=
 =?utf-8?B?Qm1WUW16UnhvRWJGQmd3K08xLyswY0dWNVArWUMvWG1EcFYzSkxaMzNJdUxL?=
 =?utf-8?B?bHgrZ2RJaFVTbnBTRkpXZDRQQ090ZTZIL21KV3hIT2szN0NlQkpDUWVIM3V6?=
 =?utf-8?B?UWkwbmRNdUhmZHFnRnlkZDVCUmxudjlaKzVXeVcyS21nYUFuOVFuMUFicnNY?=
 =?utf-8?B?cGhPSjJFZjNwMVN2UEF0NGJhR0toY1BZei9seVloM3l6V1VncU52UjFZYjMz?=
 =?utf-8?B?L3ZCclljd1ljamRYaWdUQUVPN1h4NnhPbTlmQ0VMb1drTmI3bUhYY01pckFG?=
 =?utf-8?B?YWJSRFNBOExMc0JMUlRGL0x5R0RISzFuQWxVWmpEbm4zcjA5b1RaYzEzSjNs?=
 =?utf-8?B?Sks0VjZ0cTFRUkNpOTBhMGkrVnVUbGRieWRjdU9BcTVIdDVHZnYwTHJyMk5N?=
 =?utf-8?B?QzVHbUtxakJ2QWZvdHVBWFNVaWNueXZ6eFJKYmhLOUNEL1dFWmszNllIU25s?=
 =?utf-8?B?M21sWmliMDJWTlZLa0p0czhFN0NyTkJzMXB6K25DWXJEeE1xdDExdzNJemoy?=
 =?utf-8?B?ZllBZFpFTktBZUdiZDFuWDlPTzBuNHYvNmFPaStJcjVUUWFNdm10ejZxU1Bn?=
 =?utf-8?B?RytHV0FEQUozZFFSZjdsRkdoUkFjMFp3M2cxZU9ibmFza3gzN09tYWVidmk0?=
 =?utf-8?B?K2RYaS9FeGI0S0w4WWl1REwzVjdiS1o3VWV2RUxMU09SM0c4dS9BNGJLdHhp?=
 =?utf-8?B?Z1BPcTNxWENOVzlsYnNKK0tad1RHVlJQRS83Q3JoTnRjOTZNODNmOVhucnY3?=
 =?utf-8?B?RUhFSzBzKzlyU0xsaDhXeE9NUTQ0TjRXZnJzRHR6TEFHN2EwVmxLRTV1a1FZ?=
 =?utf-8?B?MDdNanFud0MreTZvQnlIQW9VSWpOcFBFV0d0THRhREI4WTRYWThkcWMvT0Jo?=
 =?utf-8?B?T2VrMzYweVRQNDd1Um5RNEJENUJ3aTlFbmFLN0J5RTZOWmJYNnNDV2E0bWlE?=
 =?utf-8?B?SmNHVkFMb29HVWRKc3RrNnlHNzEvdmFwbGNFNzM5WWxrNnZDUUp1UVVHaVdN?=
 =?utf-8?B?bDJvYW4vNXgveTVwNzU5ZmIyYVhvSXVOV1lneVFRY21tZ0lucW1mOU5XbGRO?=
 =?utf-8?B?L0pZdFd1ZnFFRDlLVi95NTlXQzJaM3VBV2RXaDJRa3RBWElDLzdiUmRKMmJp?=
 =?utf-8?B?ZEo2Y09FZ3RXd2o4UkFLbkRGQWhiY05iZWhUVXNlVFhFYzVjaitOZG9VeWY4?=
 =?utf-8?B?OVMzSmVXSjV5TjhzeUZzUTNOT1NSSFZ5WEs0cGtqd095VzJDQnN5Y0twc3py?=
 =?utf-8?B?aEZmckFjaWhmYjRLVmdPWUx5MzJkdDR2WUtabVRYN2tSRmxrUDZ2Q1laWGJH?=
 =?utf-8?B?VE1zRS9WVXFqY3V6NTdYaDF1UUhIWmREdkFZVjRJVGtIZXFjZTlhS2xLNUJ2?=
 =?utf-8?B?MFpLQjdrcDZ3MzhhbnRuMDE3TFNUQ2R4MXp5ajkwNnpVaXdHc096MDhLdVQ2?=
 =?utf-8?B?SzIvdzh2T1BsaVVYSnR2dFJYUW5nNmtQaERZSDNGNjQ3MHk3S3NRTi84Z0or?=
 =?utf-8?Q?iCz5uLjjbYzqneoE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff45b904-4041-4666-b72e-08de4ed41bc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:36:44.0543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UThSQW29LxS0wQxA8J2RKlGoJWb1Y6ZSGEbt7Tv+9WOmv1zem9MrBlQ/HdiDptrAgcZcJZ55vvakafxP0q45IwgL/PlCG9WtGiqfG9c2aco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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



On 1/8/2026 6:35 AM, Rodrigo Vivi wrote:
> On Wed, Jan 07, 2026 at 05:13:42PM -0800, Daniele Ceraolo Spurio wrote:
>> On newer platforms GSC FW is only required for content protection
>> features, so the core driver features work perfectly fine without it
>> (and we did in fact not enable it to start with on PTL). Therefore, we
>> can selectively enable the GSC only if the FW is found on disk, without
>> failing if it is not found.
>>
>> Note that this means that the FW can now be enabled (i.e., we're looking
>> for it) but not available (i.e., we haven't found it), so checks on FW
>> support should use the latter state to decide whether to go on or not.
>>
>> As part of the rework, the message for FW not found has been cleaned up
>> to be more readable.
>>
>> While at it, drop the comment about xe_uc_fw_init() since the code has
>> been reworked and the statement no longer applies.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
>>   drivers/gpu/drm/xe/xe_gsc.c              | 13 +++++++------
>>   drivers/gpu/drm/xe/xe_uc_fw.c            | 10 +++++++---
>>   3 files changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> index 07acae121aa7..ed1f65f5ef4d 100644
>> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> @@ -39,7 +39,7 @@ static bool intel_hdcp_gsc_check_status(struct drm_device *drm)
>>   	struct xe_gt *gt = tile->media_gt;
>>   	struct xe_gsc *gsc = &gt->uc.gsc;
>>   
>> -	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
>> +	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
>>   		drm_dbg_kms(&xe->drm,
> should this be changed to a warn or info?

I'm not super familiar with the display side of things, but AFAIK this 
gets called when UMD checks the HDCP status, so IMO better to keep it to 
debug level, similar to what we do for messages in ioctl-related code.

>
>>   			    "GSC Components not ready for HDCP2.x\n");
>>   		return false;
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index a3157b0fe791..8ad27c884f68 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -414,15 +414,16 @@ int xe_gsc_init(struct xe_gsc *gsc)
>>   	}
>>   
>>   	/*
>> -	 * Some platforms can have GuC but not GSC. That would cause
>> -	 * xe_uc_fw_init(gsc) to return a "not supported" failure code and abort
>> -	 * all firmware loading. So check for GSC being enabled before
>> -	 * propagating the failure back up. That way the higher level will keep
>> -	 * going and load GuC as appropriate.
>> +	 * Starting from BMG the GSC is no longer needed for MC6 entry, so the
>> +	 * only missing features if the FW is lacking would be the content
>> +	 * protection ones. This is acceptable, si we allow the driver load to
>> +	 * continue if the GSC FW is missing.
>>   	 */
>>   	ret = xe_uc_fw_init(&gsc->fw);
>>   	if (!xe_uc_fw_is_enabled(&gsc->fw))
>>   		return 0;
>> +	else if (gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE && !xe_uc_fw_is_available(&gsc->fw))
>> +		return 0;
>>   	else if (ret)
>>   		goto out;
>>   
>> @@ -614,7 +615,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>>   
>>   	drm_printf(p, "\tfound security version %u\n", gsc->security_version);
>>   
>> -	if (!xe_uc_fw_is_enabled(&gsc->fw))
>> +	if (!xe_uc_fw_is_available(&gsc->fw))
>>   		return;
>>   
>>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 50458d3bdc7d..b1a9ef3f6195 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -741,7 +741,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>>   		return 0;
>>   	}
>>   
>> -	err = request_firmware(&fw, uc_fw->path, dev);
>> +	err = firmware_request_nowarn(&fw, uc_fw->path, dev);
>>   	if (err)
>>   		goto fail;
>>   
>> @@ -770,8 +770,12 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>>   			       XE_UC_FIRMWARE_MISSING :
>>   			       XE_UC_FIRMWARE_ERROR);
>>   
>> -	xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
>> -		     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
>> +	if (err == -ENOENT)
>> +		xe_gt_info(gt, "%s firmware %s not found\n",
>> +			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>> +	else
>> +		xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
> shouldn't this be an warn or error?

The lack of FW is now a valid case for GSC on PTL, so I think it is 
better to avoid throwing an error for it. Note that there are errors for 
both GuC and HuC being printed at other levels of the stack.

Daniele

>
>> +			     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
>>   	xe_gt_info(gt, "%s firmware(s) can be downloaded from %s\n",
>>   		   xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
>>   
>> -- 
>> 2.43.0
>>

