Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6E4C369D3
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 17:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FE810E21D;
	Wed, 23 Apr 2025 17:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnhtAxW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEE510E21D
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745430088; x=1776966088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7iGRjtQrY+qzePnrgc8dke0Ac4xZ8tuueLjzopLwqUo=;
 b=nnhtAxW37hNy7ZjZ8LYimJf6t2tF0qtI6MpgGdHu7a7xh2DyHPUmnlSR
 y939X6q1+zGzPDSOcEO5evyIGJl4LHDfEQxyxhUAJfTpFAibrkUlrNZeB
 goNKMOlmQtR6QHh/LiDRtzByDMc215TMJrqX0URi/TzRV3No0Fp/9bKkn
 DdOYykonrMslFH6KGDxeVuLkpwo+/3vhkBIU9WKyHcyDE9sNqZGWjElc/
 J5UvW5DB3+1V+twtW4wqMsc4xorDBuVXpcOEzoh+DnOBaalDL4lJA/gRU
 vLSQaVce7GU7vsdgAEChktIkaGZFe1D14XOTelUpvcLEAd1P+SF7Jp8qW w==;
X-CSE-ConnectionGUID: PDsP5E+ASGuWlfGURrkwlA==
X-CSE-MsgGUID: Sdyz4YQDTYiorQpWgBu9IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57231030"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="57231030"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:41:28 -0700
X-CSE-ConnectionGUID: AvB648+4RxC0dcmAV53UDQ==
X-CSE-MsgGUID: G0kkIAaiRsGJq1Zgv8/xJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137465008"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:41:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 10:41:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 10:41:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 10:41:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2bm27mu8aS/50d4GELSpz5Qx0gZ6+h4vN48JdYgxccs7EGWYfYdVdysg0sq9sg7hkoFfBIZrm/C8ToHxfcuSKZNTKZ7TIqSZJcqWTvdckh6Go/b2E+QCoKK8c0JAXaXXV1dAqGfvwpuR94IAwD9GKYiLURIfVlE/UgRTQ0ybEbOJ9rcbwMmGguQkEvMCBGFzYXdr9Bsckv5T64Db7Dx+9x4cfTNGey6D1LDxTebQvXkHLC4BOoaOoxOsOFKuDz78rwIL8PviDXTl5gnkCu4sEhQ1Gw5d+QcwEtm9aklnDeQIb4qWNOIR0Fsyv3ID2F8YkVNjoNjAxjtrz4bTGjZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8g4w77TtFjTLfKe1uWBoA3WDSde1ZG7GG4sYZrEDEQ=;
 b=Qzy7dzCWeHYrLo514Z2+Pnz8VFqaxxYD4dx0CAGj9aWy84mPE5TOL00yYd3TrAldOLmJqgV4F8EDZPuLU6ukc2dhGBYwZ6hjjVdWTUjXKcN8LAwny9VjtLxPfcPs83EUTBSe1YellS2fzGNuRsne4EnkLWtHUlIm7BtCcvQGRqBrGAZH/kEumRv2sZttgLOV7rGLkbU40VZbap6PVRMyOluZlyK514CAyjC5PDeV7NDR+32vXwGO2/hYq7hqaTRiSBJcOlM0gK9A3unbbE6YhGQq9tI9BMczIp7GogsR/t20dCKnp132hcfcn6PftMpcMDAeFCjRel4QqsENNSMI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Wed, 23 Apr
 2025 17:40:42 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8655.038; Wed, 23 Apr 2025
 17:40:42 +0000
Message-ID: <c1e50213-81a5-43b2-8f07-a4020b54baa2@intel.com>
Date: Wed, 23 Apr 2025 10:40:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Fix guc_info debugfs for VFs
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
 <20250408213146.793855-4-daniele.ceraolospurio@intel.com>
 <0bbda486-8b53-47ac-96bf-e11648891e32@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0bbda486-8b53-47ac-96bf-e11648891e32@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 5390ef17-8b76-4add-1647-08dd828df7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFE1UWRjRGhsc0d6V3Bha3B3Qk9BamM1NDZzRXlZcXNNZU9sNVJFUXZEVGt0?=
 =?utf-8?B?L2hqemRGcmNKS1RNRFNLZkkyMFRKVnlkRnB3bjg4ZzFERExoRy9lSVMvZEpy?=
 =?utf-8?B?YTR3TGNCYkltdmNMQnk4bVJaaE9RMFVQRWlaa1BLdlo2QUM2SXRsMWRwYzds?=
 =?utf-8?B?aFV1YWVIcFA3OXQwUXh4d2NFTDVnWW9tWkd1T0JwaGszRHNidEV6YVVqWW1M?=
 =?utf-8?B?bnl2ZUQwdjc4UG0yQlF1Y2hZa3VaME0zMGhDbDNIaEdDdGtqUkt3WFlybm90?=
 =?utf-8?B?dXI3VTYxN0p3ZlFKeU9jNUxTRHVEb1A4ZUFNY0hzUk5oV3JaNXloMmNDMjQv?=
 =?utf-8?B?QmhjRGVpK2FrZWJqMTdCZ3JVaWtvVHIzNFY1aDFwb2p5Nlg1NFhhNGpzMmp2?=
 =?utf-8?B?dXRieEFOWVllSWVJYTVKSmcvMjR6dC9NZnptNXpWSng0T1h5SlhQUEJDck5H?=
 =?utf-8?B?cEhCcmlBcGp2Sks1b3o3Wjh1MEVvM2U2N2NRUmorSnVuakdmR1hBOHliVGpw?=
 =?utf-8?B?N1BwdVAzOWlONkFQZ1BqcTg3dlVaZkFveEJyYW4venh6bHVnRndocnAxSmlM?=
 =?utf-8?B?bm5nSzlHNkNXNHFNMUp3MkkvOXpkUmIrUlZFNmRtYVV4c0pFVUN6S0Y0a3BP?=
 =?utf-8?B?eTVUaEN2VkNrMFhlbDdheXdmZEwwT294Z1oySXdsVVAvYnQ4dkNFdnk3dWE2?=
 =?utf-8?B?S1VWT0w0TTlyU3NHbHc1TDVMNjhhdkVOTXVGQXQyYzc2a1hoUm13RHVoWkM5?=
 =?utf-8?B?bldYQjFsd2JoTm1rYUhkekJERlJyejg3aURpOXhUWHJnbXVjUUdMaEo2ZXVy?=
 =?utf-8?B?RWx2bWpxYndNNml6VWJYbDF1R1l4OHN6NzlGak9QdjdoVUtWdEN6ZU8ySXBw?=
 =?utf-8?B?TmJpM09FcWlaUzdxSFc3OXd3NDFaYk91aEFGOGx0U0RmOTZ4b0hnaGdINmpv?=
 =?utf-8?B?UFRVWXlCR3JTV2ZTZ3Q3ZTgxM00rdHBTNktaeVlTRkxHVHJscFZVWVByK0cv?=
 =?utf-8?B?MzZmVE9XRlZkdnBRZzJPT0NuMWh6cW1GVHJacWVhd3V4ZStpN0Q2MEplOUpW?=
 =?utf-8?B?TURYdlhOTGJCVE1YblFXN2tEdmtvU0toczFiUitvSFlCMThqd2tXdDZheDJT?=
 =?utf-8?B?aUJ0b2Fkc0J6UDNuZ1c3Y1BJV21ralR1OElFeE1FZlMvanlEV3NVeGNMaURs?=
 =?utf-8?B?cTZSQ0JtU1ptSnNZcDhNTlpJMFNkdzBSeStNT1pjeVRiNmxkZVkvaWJBQ3Zz?=
 =?utf-8?B?SmlOSDFtcmhpUGdyQi9KRW5aWHp2VXM0a0FZRE5Ib010dFRBSktYVlhFd2F5?=
 =?utf-8?B?WnZQUllNV25PQVZ3aUV2ZEJ3TWMrclFtYjlsZWgydW9POEx5YTZ1bnRQQUp5?=
 =?utf-8?B?SDl4NEZEZy9HMEFWem5VQU5vaHdFK1BhSkFDZzFNZWdBUGJMRUhsN00yTThv?=
 =?utf-8?B?SVM4RVdIdUI0Q3V2YUtvVjQvVmVaeVEyUjhja1NUWU9CdENqRjFSd2d3aDha?=
 =?utf-8?B?TWZQMVlZSDBlSFV6dk5kTmdUUkY1eklkMHBVclRGUmwyUHA3MERtQUJSU2dL?=
 =?utf-8?B?eERkK0lrT1p2bHU3aDNkeWoxbFcvQmNmdkZDVnA1eG8yWk5yQUZrV2NzM3ZO?=
 =?utf-8?B?SXdwZ0FWV05icERwd3RKZEZ1TG54dXROdmF5VFFJdmwzeTJ1bmZUS2VVRG8v?=
 =?utf-8?B?NUF6ekxKQTZhR0YxVTIxdzJYQlJXQkE4MWhzdUp4bDREdk9RSkV6WWNESGNm?=
 =?utf-8?B?bTZnTlJjZk1nSE5QOW1xK3d5OGpRbFRaTXY5VkJ3WnZ6VmJRL0pCeldsaVh6?=
 =?utf-8?B?bUZWem1WdnM4SHo3VitlU1YvSCtiSm9HZmlmeXR0cG9hTTNPOXNRYmFnRXl3?=
 =?utf-8?B?cWhlY3R4WmFEcWRBMXNJc05URzJ3Ty9hRmZnYmtPRnMzYXBhVm1DUW9IenJt?=
 =?utf-8?Q?czqyNSzHbwQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0ZkcW5oUFNmTkhSaVVjQTVRTlR2TFpHMmlSeFF3ZDMyd0ZMK20yNUxnUzky?=
 =?utf-8?B?bG9zSURqNmpqajkvUnRpVHhxOGliRXVvYlVzYjZVYktYeGdGN3BYSzNpY25o?=
 =?utf-8?B?d0FSd00xMUF6NUxkcStsZzI1YTE3RlU1dUhaMTg1N3lwZTFxMk9ZZ0tXYnM3?=
 =?utf-8?B?TXJCSG9sRWxMeFlhTmhoc1lZZWg5ajRaVGUxZjROamtpcFVQeDlrRVBMVTgw?=
 =?utf-8?B?ajltTE1pZUJNVTlxczBLaFdlazlOQmZ0Z1JxR1FibDVTRzlucjhINDVFVTJ3?=
 =?utf-8?B?Y1NrWnpKY05wRU1wRm81QzFXL2FPUy9ac09CL2dXbU93VExvQzA5eFNMM2pT?=
 =?utf-8?B?Y2JheXBNZko1ejlybElyQnhSdmpGalNydWx4czNVelRHbUJoU0tVWlQvVElB?=
 =?utf-8?B?ckJjM05ZWFJOaXZaSGl2MlhzaW5pMDdTMWNKQ1dvbWxQVy8vSkl5MUlnV0pl?=
 =?utf-8?B?MHVkaEdTMVY1V0d5WFYrdnNwTWhZSGtUT2YyL3FCcEl6b1o4RmN5bDJuVk9j?=
 =?utf-8?B?YWpqR2ZSK05iZ29UQVJBWjBKdFNlSHhpZ1l2RC9Fak9tajA1TjF5dDN4SS9m?=
 =?utf-8?B?alpZRmVMOXdtandNM2dHeElHd0dHTzNXYUpjYWFkTEJRdGI4NEljYWJkRUVq?=
 =?utf-8?B?NUVPMDRWQk9DNmFTTCszWVM4WVBvRnJEMWF2eStCb0hzS24wb2NCa1VOS0ph?=
 =?utf-8?B?T3RNQllXTGRBNXN6Wjg5bEE1cFprdmxjU3JENXN5dFdqQ0hIOEQ0TE5saWk5?=
 =?utf-8?B?bkFrRkV2YjljV2pQRzg5ZmRpcTU2REpKbVc5Y3ZJVGw2ZkRLQ3UwNEhCankv?=
 =?utf-8?B?aDZ0eXI0SFlzaUc1QWs0eUpIY0tSVmJGcXcwWFg1NmVVNEQxVUU0TFRjS1NI?=
 =?utf-8?B?MHEySHl3K1RzM3F6SytTc0NZVlBNbWFnYmQxMnlFZHcxbjkzTHY4RldTUHls?=
 =?utf-8?B?RHRUbDgyZGdMTmFRWnpvRCtUNS83d3htK2RIaEh2c05xMGhkZTIwSlNmVVB0?=
 =?utf-8?B?cUJmb3g2VENCWHJ4cXhuYkpUZ21POWpPRFZWZXNzQmliT05ISCtPYitUT0dM?=
 =?utf-8?B?cXlrUkt2cnFFcWVpY2lIdHR1VzdURDBHdUloZkdsVk82SzVBM1E1NGtiTk5F?=
 =?utf-8?B?dDB2c3ZCZGVOUWRTeEhLRThKdHVIc3N6c0ZnVVpqcyt3UVlOYTB4anBnSitn?=
 =?utf-8?B?V1U4MkR2TjlMZGZ4enBPWXJ2REFQSGE0OGw1MTRvYjJvNzQvamRqc0JkZDJl?=
 =?utf-8?B?VStvaElKTzlXM2ZOVDNPL2FzRERMQ3V5YTB3TThKckNZV0x5ZHI4bUUrN3RV?=
 =?utf-8?B?WWthTTNucUFTeWk0UnhWSldmV0JDRTY3QzVvaWplaFR5amZBWUhMZFBtZDJI?=
 =?utf-8?B?L3ZwOXBHT1RmYkU1dkFWSTdJQ1gyRlZ1clZ5aXBxbWtTZjRiTE5FZ1A5Rmp5?=
 =?utf-8?B?K21kZEtrYXVNVzkyeE82aWdpZXlxRWMwcWdzTklKQW8rbi9md1I3TGpBdDc5?=
 =?utf-8?B?elhvbVBuTERoTGV4VENuRGdiZVUxWUw2dW5SdHBxM1g0T0JSZVh4SjdmR0h2?=
 =?utf-8?B?TW9QcFlrb2FDTFhsclFvYTJVQTcybWxDMjVlM2l1amRTNjRrbHVqM0lvRVg5?=
 =?utf-8?B?blVqM1JWV0lrOTRTcERrNlQ4TnFSa0RtT24yNzN1SmVoWkp5cFdVYWNtQ0o0?=
 =?utf-8?B?OXRBNlFwQzRMeTRBUkp1ckhjYThhRkphU2ZQZUw5c0M1ajRDOTgzejVQQ1FJ?=
 =?utf-8?B?SDBJSzVHc3dKNysyQkVBMUYwdkZGWHhkRWF3Q2daL1NqVFQ4RVdUb1pYS0Rm?=
 =?utf-8?B?S1lTRmM4blJVcVA0OFZ5dnRSZm1uR3Q2dXpDWkk5Z1E4Y3JSQnFvbFZsUXN2?=
 =?utf-8?B?UlR3T2hwSGdiVTh2RzNzMGFGZ0FzV2hzUm1vVDA2ZVBrNU0zWnhRTDZaRisy?=
 =?utf-8?B?Mm9SbE9FYkcwZGdiZDRlRUhVVWhTbCtkSjV6M1ZzeVRJeDVMMXFob1hMK2hU?=
 =?utf-8?B?S001OVBFNGZvWGpTb1llRFhEdldnRENRRm9DNFNkWHZMM0hIKzB6STBET3ZZ?=
 =?utf-8?B?Z1VRTExVWGxGQStIUCtZVmVGcTNzUnMzeUNNbDNtK2VFM2NWRllTWkdUbVdp?=
 =?utf-8?B?M0NFRVJTSEhmU3FqaldidnNnM2FnajN0KzBaeWo1NHNuNFE3NEtqSExhUGZO?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5390ef17-8b76-4add-1647-08dd828df7f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 17:40:41.9829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHAc7U8TAh6M8HjD8hfXxI+ae7/AM9N7R6IzRdnKVHhJYyAeqtk6mVmCTbkXkJRDF8ARmrw3mEWsJ6C9UBEQeGe0yG9/d2x1MqbnW/tsO/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
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



On 4/23/2025 3:37 AM, Laguna, Lukasz wrote:
>
> On 4/8/2025 23:31, Daniele Ceraolo Spurio wrote:
>> The guc_info debugfs attempta to read a bunch of registers that the VFs
>
> typo: attempta/attempt
>
>> doesn't have access to, so fix it by skipping the reads.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>
> Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

Thanks. I've re-sent this patch for CI individually since it can be 
merged without the other 2.

Daniele

>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 44 +++++++++++++++++++------------------
>>   1 file changed, 23 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 38866135c019..17932006619a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1509,30 +1509,32 @@ void xe_guc_print_info(struct xe_guc *guc, 
>> struct drm_printer *p)
>>         xe_uc_fw_print(&guc->fw, p);
>>   -    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> -    if (!fw_ref)
>> -        return;
>> +    if (!IS_SRIOV_VF(gt_to_xe(gt))) {
>> +        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +        if (!fw_ref)
>> +            return;
>> +
>> +        status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>> +
>> +        drm_printf(p, "\nGuC status 0x%08x:\n", status);
>> +        drm_printf(p, "\tBootrom status = 0x%x\n",
>> +               REG_FIELD_GET(GS_BOOTROM_MASK, status));
>> +        drm_printf(p, "\tuKernel status = 0x%x\n",
>> +               REG_FIELD_GET(GS_UKERNEL_MASK, status));
>> +        drm_printf(p, "\tMIA Core status = 0x%x\n",
>> +               REG_FIELD_GET(GS_MIA_MASK, status));
>> +        drm_printf(p, "\tLog level = %d\n",
>> +               xe_guc_log_get_level(&guc->log));
>> +
>> +        drm_puts(p, "\nScratch registers:\n");
>> +        for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
>> +            drm_printf(p, "\t%2d: \t0x%x\n",
>> +                   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
>> +        }
>>   -    status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>> -
>> -    drm_printf(p, "\nGuC status 0x%08x:\n", status);
>> -    drm_printf(p, "\tBootrom status = 0x%x\n",
>> -           REG_FIELD_GET(GS_BOOTROM_MASK, status));
>> -    drm_printf(p, "\tuKernel status = 0x%x\n",
>> -           REG_FIELD_GET(GS_UKERNEL_MASK, status));
>> -    drm_printf(p, "\tMIA Core status = 0x%x\n",
>> -           REG_FIELD_GET(GS_MIA_MASK, status));
>> -    drm_printf(p, "\tLog level = %d\n",
>> -           xe_guc_log_get_level(&guc->log));
>> -
>> -    drm_puts(p, "\nScratch registers:\n");
>> -    for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
>> -        drm_printf(p, "\t%2d: \t0x%x\n",
>> -               i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       }
>>   -    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -
>>       drm_puts(p, "\n");
>>       xe_guc_ct_print(&guc->ct, p, false);

