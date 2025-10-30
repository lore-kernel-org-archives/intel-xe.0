Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E30CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 16:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C09A10E9FE;
	Thu, 30 Oct 2025 16:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZri2u6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E29E10E9FC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761841297; x=1793377297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aY1cQLBnPFJ8UxUX9+mj5stBVCwD5xDY9CM3IQxYztg=;
 b=aZri2u6Next0XndWu+u/1QiXhpQaBBbWDKg/UvGP04G+zv9i9QBTXSND
 r9JSTVnemdk70dvYfhaR0hi1ybWug8qFKPcfeJd30D4J2A9k+WrqeFvZn
 Qhn0hFXx7+ETm80kyAqk2CKjNOsiedO4D1oP02x099DjREFiQKGympWuU
 dIjLRrEJc+16Og6MBymmLzqvtcvxDSWCzvp552ENa6KPJl6c8BDet4dw8
 X8SgOP70zVJGPIuknwM0rsAUu9zN3aLquVFE050xnNu31CGq5+wATEpH0
 DwD7VF0FTZejl19tG6ppkZ9cYnawnXbLLcs3Ob7p8FGbLyYcM0rPJkskE w==;
X-CSE-ConnectionGUID: Zn+Oh0F0QM6viqKOhrV01A==
X-CSE-MsgGUID: X9qokfLVQjuuAOl56O4t2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64139694"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64139694"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:21:36 -0700
X-CSE-ConnectionGUID: hk2tBffQRAS6SAuG3wTHXA==
X-CSE-MsgGUID: 58sTjtyHTk6Zzg+UUANJbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186732538"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:21:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 09:21:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 09:21:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 09:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEVHcMuy74DqTuUxGHwCdLTjicOReG1oYW41cSIbS6cVksoPfTpNawOimn91Erztgpv724sQITNF5Zc/23c+5x9McF3o3QJtGHhHKsd0uVwY4yrpqtE2t1m43uYu7yKyjar+i7uwXVyjaJsmL8vXQ8507tM1RmpRUctlTilvBR9IYlC9Ap34MwfPVM5Tnzp+C0Zq6qZGsfAfAXRlkYH8JhY7J88E+Pq/tUu51Q21Vd5Zy6i08HTLW8Pd6ZjdyEedeC4eEwLrpc53bH4u6MAj7qgRNfEavg94ajt6rWVeVvqqAdEuQq1JD6vrfqDVw6MuyA8oQbhMccOsAPKPGRxhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIH1V5wKai3bMHDtOlzPQk4IKJhUJf9/xX3PqlpVSG8=;
 b=NCRFg4eYxrBAy3uNLqB8Cbols9d5NlyaO8CJlUO0v361ZZYbZLyI+mYaSnZYy5jzA4mp/GoXoUx+OCeIF2BLvZG1qfvvvIBitVxc8sbspahAASb2RP5/tDpHYvewQ3ELcdTl3qtMnw7DSUPbLjT8tjrK4MkcMSEBdmTm8VPp09SG6u3B1BgUghuAr/byRdEYYVPcA+z+H6bXt7nf3ZvHCh1mTl8xLYwEDx2fjna8c2terwz20EtMX0IPHsgV8cp2uoGa2KcrzaOPBv9bMMETwofsb9feo1qOTsPQcy4DPd54TSU8Ub4UAlYXhuhQussAiplOuuVN7atq0VbVblvVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 30 Oct
 2025 16:21:32 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 16:21:32 +0000
Message-ID: <d0d92e0d-c02c-4a52-81b7-24179175fd5f@intel.com>
Date: Thu, 30 Oct 2025 09:21:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_guc: Dynamically decide g2g buffer owner
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <matthew.d.roper@intel.com>, <michal.wajdeczko@intel.com>
References: <20251028160028.69264-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251028160028.69264-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA3PR11MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: fb221ceb-a5df-420c-3773-08de17d0639c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUVIT1VEamErTGU4OFIreUJqcnZiZ3AvSlowQ3k0WWNwYzdWS2p4R1l2eThq?=
 =?utf-8?B?c0xiWlM0emFPbnl4elFmaC8wUjNHKzVqQ0dDdE5xTUlWVkQ3eGdqRzlMSGtW?=
 =?utf-8?B?cWNBZk1ZQWtRTHMybjhINFNwYVl4cHVlSU5HTVdjVi80QkFUSDdoNzNENytv?=
 =?utf-8?B?NnV3VEw3ZTRxUFBaSHYxdlRxdlNoYXRHYkt4RWE2U00rZUh4ZVdUanYxK2tZ?=
 =?utf-8?B?YVpnaWhoeEdCZVNoOEZKODlncVAvbk04cytndXN1aUg3amI4blpScDh5MFl2?=
 =?utf-8?B?YXBHMzdmbzRGK2tzMWdyOWpNTHR3S0M3K3Q1blZrcE5tb2d3UG1rT2VGTlo1?=
 =?utf-8?B?MFVBUnB4K3V2Q3NHUjNMbExIc1laMWw0WXFjSlo2NktBZFJkMjJzRlJ2bXgx?=
 =?utf-8?B?S1FsWHJndjY0Z2ZpVHZPRENtQzk1QzlNSTJqVkkxRnVWUzErV0ZWU2dsQWhQ?=
 =?utf-8?B?bUkwemRDY1ZKYmx1S0FZdXdzV2praGtMYUFxMjRJeXV4blZ0NWdQWFJUcUpv?=
 =?utf-8?B?SXNyZmpSRElWSnE5WlhSMW5pTk5WUXYrK3NLVTJyUVdhb0lzNHZpSXJwNjFw?=
 =?utf-8?B?V2kvVExIc0dFMkRGRUFLVWozeExCTkg0cG41SHE0dlVPaGl3QmhZd0g3VXBj?=
 =?utf-8?B?UWVUeU9WV2pGRFRRbXFmRFpuNGhRYS83UTVHcDd1YmRJZGJGL2pxenkzNlEw?=
 =?utf-8?B?NUVSdzVqbHdiYlZiR2lZM1MxL0pKVWJxdW5aYjh4cXFvbTR6ZTZTTGRCVzEr?=
 =?utf-8?B?K24vVW1wcUtJZVJJT1RuYXYzcXZPUENLenR1b2wrNk9CMXZvWm05TnhmRjAy?=
 =?utf-8?B?UnpJdTBEVkR6TjlYNXlMUmhpdjJuN0JRdjlNNWlWWlllUmVvRTExdm83NjVI?=
 =?utf-8?B?NmFtamE5dWdtcDRaWU9ibE9OWE5ZOXdtSENBa3lXemZROXRkTUg0ZWVocG1S?=
 =?utf-8?B?bFMvc3RSUVc1RUQ5d1FnTjlZL3hRSFhuNHQ1V1V5VnJlcVdIYytJcmhjd3VZ?=
 =?utf-8?B?eTJ6eExSWUxEUHB1Vko3QlYxeHJnZHN1VUpEMTdpeXFqKytHeTBocS94bHk4?=
 =?utf-8?B?TWgvcTVQTTh2U0tEcEc4U3RFbGNMZVpyeS8rblBjamNJSmRlZmtOMkRkd1BE?=
 =?utf-8?B?cHJsZ3NSREZ3WHRQenlrcDFEckhpdWxoclhIUGRNeU1VR294V3lNRVBsTEEy?=
 =?utf-8?B?Uk84aTVlUXdsN3JrWjMyZDFwVG80K3pCeUdIbjh4Q3A5Y1dXVnJkZzlrUE84?=
 =?utf-8?B?ZWx6eTBqeGpCTXVLdHBmNEVEZlNxbGtpWEYvNEkyMk5Ub2R6dzRVOVFOWjNs?=
 =?utf-8?B?WDh4STBTbE5rc1VZR2d6d09TWnc2THhuMDFkek5NZkNJMW5QWWE5aCtlRU9X?=
 =?utf-8?B?UjcrL1dTYjNzNjZMaVNndDBuTmpQWVRXUEVHeXJBTjdnNzl2ZXh2NmdjdVNY?=
 =?utf-8?B?RHhBM3V5VXl3bzd3dk9lTnlBbzBsazFra0I2LzE4L28yZ2tKRDAwbUFBUnlB?=
 =?utf-8?B?RWZOU1l6bVNuRHVvU2tQSG1lWGxjTEVMKzBIUk9pYWpMVy9BS21zbGcxOGFC?=
 =?utf-8?B?c0VTR2g3RE9DYXZVckRoTlgzOHlnanJVT0VtcUJtdEU2VkEvbjFTaEptQkEz?=
 =?utf-8?B?QjJSTlk3SE9RMTkrZ2dxcU1TcGYvOEVnWG9tcWRRcU1tSk82UmNpRkpuNTNl?=
 =?utf-8?B?VW9RTDExUlA0UFJ2ditzSEFkSFhpV0QxWm9NNktubzlnRThuTXZqaGNyeEpO?=
 =?utf-8?B?bktrMWpVcGl0ak9lU2xBUElZRmtBT0VRcEhEeElJdi9IV1o2SGtLYUJMcUcw?=
 =?utf-8?B?Sk1nZmVPcE9jWWJVdENhYmJQdUR2OHhtUk9Ib1o0ekpoM2daWWRJQUlQMHkr?=
 =?utf-8?B?ZWJyUE5zNFh4QmdwUjVOdmJQUElTeVBiYndPVDBNWCtXbEsvV0JwV25QOHE4?=
 =?utf-8?Q?2XVf9NOL2Dv0jFL9ztxYjPwt3fjsuV+A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1pvQzZIVC9wYUk5cm15ZHU5NUNhTjB3MUQ4VHZaV09DdUZYaGRBcE5BR1RD?=
 =?utf-8?B?Nm1odktxeG50MFhzYmI0czJ5YStCVEdmRUY3NlF0N1o5ZGtYaitwYWVYVS9P?=
 =?utf-8?B?RjdxUVpBazQ3eWJMZjBKMGNTY2p0Q2lNM0pWWkR6V0xJR3hFT3dLSHNELzRt?=
 =?utf-8?B?UVZ6ZGVDQ040bEc0ZERJV2s2dFQ3S21KaUV4M3Jkc2RXejZjL0xDZzJybGJW?=
 =?utf-8?B?UnBwazdrQ3dGMno4Sk13Z3VGbUJUc0NyeUxCcWxJSkJ5cDhBKysvOXpVSk9y?=
 =?utf-8?B?YnNoQkIveC8xVzB0c2wrWkhOZldoZklXdXhrc3dMTEN2eE91b3kzYllTNkZr?=
 =?utf-8?B?dDJuRSs1eTJnMnhnNTFndm5qV1RWdUJMMHRtUWlBQW5XY1EvVXdkV01yNHJQ?=
 =?utf-8?B?SlN2aEZ5VGdUZUkxSXhXNDVpZkRoWm9TcDlSVE5BVlRGNW1mMTdIK2kwM2d3?=
 =?utf-8?B?enY2YVRIMVkzZldGSThPMEd2bk1xaHlFZjQ4eTdudldFSHREUDlzbE1uSEJ6?=
 =?utf-8?B?emxtRllqdWZPZysrWjJDR3lKZXNaSk9ybXpoZ3MzU1VvZVVEMVFxd3BnemFr?=
 =?utf-8?B?b05yMTdQenhuZSt4TlViT2x4Qy8zUm9ldjVKUHljOHA3Y2E4TUZiQVF3L2NJ?=
 =?utf-8?B?Y0h5VDJMdURRYnNsbFNzTUNxN3FPbUFWUExyRTFxK0ZwZE1KblphdUI2MUNm?=
 =?utf-8?B?b0pKcE11cW9JbkVaSEp6OU9CUXQ3bS9GRGdOemluRS9pdnBDZmdPKzlrWFJo?=
 =?utf-8?B?dDIxZjljbm5WMG1GRDVOcnBSczNRK05BYzVyc1FrK2FHbzk5UXJuMTJsSUJs?=
 =?utf-8?B?US9XYnRwQmp5R1RFazMzM2sxU3BsMjVzeE9maG5vTUt3SVBiUlNtNkFkOHUr?=
 =?utf-8?B?SXdkOWErNkszWGpxRVlXaWN4aUhISzkrdmVhaEdueG1xcERGdzlGTjByK2Y2?=
 =?utf-8?B?THJjendmd2tFSVA0cEljaGFNUEpoZDRBeFVIM1ArZ3RsS0lncDRQVlc0RTdr?=
 =?utf-8?B?N1QwczRNTmY0cXlpNVpjSGJXaEU1d2hvZVlGaGVTNVdSbC9WeFF6STVMamx1?=
 =?utf-8?B?K3lHcWo1RTlKK0lqdUZaY3lVdGYxTElIZmRQbHNUZUQxbmxna0NMMW9EcmFB?=
 =?utf-8?B?czZwa0owaVU3UU94anJVUUw1WUxteEVYY20ra05TVXBXc3RXK3I1c1dnSmc1?=
 =?utf-8?B?ZVJKR0FIM1FwODI3Z3JxZG5nMWZqS0xTeGhOOXVpaElOd0FreEdRd1VZNWV3?=
 =?utf-8?B?ZkQ2Qm0wVUZEaHNjODNyK09JajAyRnVjdWsvb3pVeGdXK2NOOXRidTdhM2Ju?=
 =?utf-8?B?Z1dOaldCYVVNazltdThaQldZOVJ5V2Z1OTBKS0tTM1ZjREdxdHdTQnZoQnMv?=
 =?utf-8?B?MEdPeGxxRFpNbjRrVThVNURVbk9tY0Z0aUlJUzVWWDFHZEF6SmtFem9NaWlC?=
 =?utf-8?B?aC9Ob0VIWjBLdFpReFVod09SNGttblBaUWhuUXdBblVmQlFNR1pzMTZVWlU4?=
 =?utf-8?B?TXhWVVhBa1dsMnZzR3QxdStOMk0yL0tRUytoMUpNZFJsTzJ5Q1Q4cWJUSktO?=
 =?utf-8?B?M3ZmaGJiUTllSmgrZDJPcC9DVmFMNjk2c3pBT3VQamhPOEJHTEQyMm9LWDNj?=
 =?utf-8?B?N3lFaTNodWZCSytSWjdGZEFJMkFVV2FrQkowbnI4OVV2RDhzWHAyQ3ZqcjJE?=
 =?utf-8?B?WW1CZ1hXdXpmWHR3TnNIQVloaE5BdklpSHhJRlQzM2FyMTlHVU5YUVZHc0Nu?=
 =?utf-8?B?azdxaEdIb0NEajZzL3dKKzNxTkFPeXBwaWlUUlhONEdLU2dZeW1pV1lNaUJp?=
 =?utf-8?B?UlZTb0hRQzBNb2RKZDFvOHlOb3RYWklJYWtqSURFOTMyY2xKUi9ma21NWFI5?=
 =?utf-8?B?RXhvOHYyU29MR3dmeDdTYTB3NktWRi9jemRESGwwZkgzVWJaMXJtbUxMWDZV?=
 =?utf-8?B?ZzN6M0UzdkpYcjJaMmM0WnJpdER5ZUd5Y3BrVnM0a2NDbExuYzlHRkZzRnll?=
 =?utf-8?B?b092OVZFNGRPNG4rcW0wNGs4bzEzVHpTWC90ZHp2ZVAvRFovVlBvOXhib2xP?=
 =?utf-8?B?bStUUXI1R1ZvdnpkRXRXbDdZUTU0VlVWb1F1TW9FVm9XRGI3T3hpTnIvZEVv?=
 =?utf-8?B?T2FhQzJ2Z1B0anprNFVtTHdBdFNKdm9NdW54TnhJZnZpbmxhenp5SXQxRGI5?=
 =?utf-8?Q?ZEOcHNMhsXT81BTWGxN54As=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb221ceb-a5df-420c-3773-08de17d0639c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 16:21:32.6420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IccBwJmS49eS/5kUxdyJgR7kntxUq4jZSTQYeOKlixA79dZXaf+ajCSrhObhJ5e6y4O0pYbucK934z9LoBQnBV68absif1AXHMBohWZZRa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9256
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



On 10/28/2025 9:00 AM, Jonathan Cavitt wrote:
> On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
> Hardware-wise there's always at least one tile, and every tilie has a
> primary GT.  If something went wrong during init of tile or GT and we
> couldn't create/initialize the structures, then we already aborted the
> device probe immediately and we'll never get further on to places in the
> code that would be chasing a NULL pointer.
>
> However, there's currently ongoing work to allow the primary GT to be
> disabled via configfs for debugging purposes.  Once that lands, it will
> be possible for this query to return a NULL pointer.  This can cause
> problems in guc_g2g_alloc, as this process currently relies on the
> primary GT always being present.
>
> Instead of making the primary GT the g2g buffer owner, make the first
> GuC passed to guc_g2g_alloc the g2g buffer owner.  This requires keeping
> track of the g2g buffer owner in the xe device so each GuC can know if
> it's the owner or not during initialization.

I think we could still use a note here to mention that the kunit will 
always run with GT0 enabled and therefore we can directly use the root 
GT there.

>
> v2:
> - Update the kunit tests to clear and reset the g2g_owner variable as
>    needed (Daniele)
>
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 2 ++
>   drivers/gpu/drm/xe/xe_device_types.h       | 4 ++++
>   drivers/gpu/drm/xe/xe_guc.c                | 9 ++++++---
>   3 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> index 3b213fcae916..6446232422e2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -358,6 +358,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
>   	root_gt = xe_device_get_gt(xe, 0);
>   	root_gt->uc.guc.g2g.bo = bo;
>   	root_gt->uc.guc.g2g.owned = true;
> +	xe->g2g_owner = &root_gt->uc.guc;
>   	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
>   
>   	for_each_gt(gt, xe, i) {
> @@ -447,6 +448,7 @@ static void g2g_free(struct kunit *test, struct xe_device *xe)
>   
>   		gt->uc.guc.g2g.bo = NULL;
>   	}
> +	xe->g2g_owner = NULL;
>   }
>   
>   static void g2g_stop(struct kunit *test, struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index af0ce275b032..91ec9a295226 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -38,6 +38,7 @@ struct dram_info;
>   struct intel_display;
>   struct intel_dg_nvm_dev;
>   struct xe_ggtt;
> +struct xe_guc;
>   struct xe_i2c;
>   struct xe_pat_ops;
>   struct xe_pxp;
> @@ -628,6 +629,9 @@ struct xe_device {
>   	atomic_t g2g_test_count;
>   #endif
>   
> +	/** @g2g_owner: Pointer to the GuC that is the owner of the g2g buffer */
> +	struct xe_guc *g2g_owner;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e..a3a0961456d0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -468,9 +468,8 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>   	if (guc->g2g.bo)
>   		return 0;
>   
> -	if (gt->info.id != 0) {
> -		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> -		struct xe_guc *root_guc = &root_gt->uc.guc;
> +	if (xe->g2g_owner) {
> +		struct xe_guc *root_guc = xe->g2g_owner;
>   		struct xe_bo *bo;
>   
>   		bo = xe_bo_get(root_guc->g2g.bo);

I think the name "root_guc" here might be a bit confusing if this can be 
a different GuC based on setup. Instead of renaming, IMO we can just 
drop the local root_guc variable and have:

         bo = xe_bo_get(xe->g2g_owner->g2g.bo);

With those nits addressed:
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Note that the G2G test is not running in CI, so please make sure to run 
it locally and confirm there are no regressions before merging this patch.

Daniele

> @@ -495,6 +494,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>   	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>   	guc->g2g.bo = bo;
>   	guc->g2g.owned = true;
> +	xe->g2g_owner = guc;
>   
>   	return 0;
>   }
> @@ -507,6 +507,9 @@ static void guc_g2g_fini(struct xe_guc *guc)
>   	/* Unpinning the owned object is handled by generic shutdown */
>   	if (!guc->g2g.owned)
>   		xe_bo_put(guc->g2g.bo);
> +	/* g2g owner is no longer valid.  Mark as NULL in xe device */
> +	else
> +		guc_to_xe(guc)->g2g_owner = NULL;
>   
>   	guc->g2g.bo = NULL;
>   }

