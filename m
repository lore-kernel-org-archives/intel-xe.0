Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0F3C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 08:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FEB10E2EA;
	Mon, 16 Jun 2025 08:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTExBoNS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0B410E2EA
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750064237; x=1781600237;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2OL9rqxGyZL+EFhknrbParr3vi7BoLT4h0yZGOkDH+o=;
 b=eTExBoNSoJ5U5uvSeLA/7tjtMkE+66yLrAFIDqRg75iX1yTXRPpFooxS
 79dWBcBmR01LSMLz6DgQPNw8HcYnQhvmjcdktxF4JP9O68vh45oNIiwxv
 DD1M9NcmIQ1sBcCUqfUezwvVk20cmnb+lDZSC+s8vtfMRIQ/Zizz3/jnv
 FaNus8Dbl+sKvDdou6GaLVOMtoH72mdWizwvgqBCGW+QtM4yYdJ5ruo05
 lT0fVEeQMWYA7Wk9nthNjCWuyAu5H7K/xO7/1J4WqiuuPqM9BN/01TueK
 MA/9Ey32Pg2CSWk4+3ynculxE2yvLyckPvQQPEpjb7QOqBGkVAdBv74MQ Q==;
X-CSE-ConnectionGUID: UEsem39RQoGyvegLbpdFzg==
X-CSE-MsgGUID: 2NeixOlDSPGoT9SrtgavLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62473349"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="62473349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:57:04 -0700
X-CSE-ConnectionGUID: FePycC1wT76lMjwe560Ymw==
X-CSE-MsgGUID: F1KAekGiTYG/QJMwGNDGgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153711611"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:56:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:56:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 01:56:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+vTcbEHjhyQsLRHbaSsv1m5rQKJfJzjFGawz5pPkmsLZkRx01RzdgXwK/Qr8bcK11A44kxduCGQrnnXI9reqxepQYF5sHzMiVEVWSH6c59dCmVSxzuIZYCcTM44L/AOO+RDtaJ8w28NKPCwFDLqueQ/HKpEGOz7LfCLYygiufCSA6miQwV1Ka/T4SCregiEnyOn8MvoDH2DXwmrCXhq3jYhLa2YujSfX7QV1icO5IhfZdPfPH/OdDCQ55oyLJmzywckvn9Uk96fMnusjP4fsC7quu1pEGNmoks43XxbdwBpHUaLzidaoRZgKu+nHnJ8mDmhPgCWSgTYCkBUTyEZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iq7WA+1ibgMunoN0HHkT6QnjZzm4iCr3C0SkfxzHOTU=;
 b=LHHbcI0O9pRGPhfOmm+moEMgUp9S33RQwp/wtLwacWNAPp9eckPQRHHBz6hNVAUiT3gJC9jNfy05lWG5Ll9mkH4Bnx9MQDUcbaQe4zxeDlLtYrLc5iPtzd/MZL+srSG6wgx3hTd90bb56ztl+n4gN4OJZIeQKeHe4kczlJvOx+DTVXlp36alCrE/fE2jbajgcpVVZD7hWdPuVaGuKXlSyh+w6eJQ7NrLTk58o3nnXjxK/Zj3DV8l7yFw9ZX5klSSq+eySjdRKlFkMajEdVpfS0W4CmsKBj1k/CaGmey4xwUDc0qc8zrNWeglsfD3VPM2Jb0vQBHGM+AB0HoFz4YWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 08:56:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 08:56:52 +0000
Date: Mon, 16 Jun 2025 01:58:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Thread prefetch of SVM ranges
Message-ID: <aE/cr2Eb/KJUIXnE@lstrano-desk.jf.intel.com>
References: <20250616064712.2060879-1-matthew.brost@intel.com>
 <b1620d738130de216644d09722735607f0b1e35c.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1620d738130de216644d09722735607f0b1e35c.camel@linux.intel.com>
X-ClientProxiedBy: ROAP284CA0185.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:43::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: ec29a43f-301e-4573-cb9e-08ddacb3bca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjRmSW04UGJBSWdISHZHVnRpZmJuTGFWNHpmeXNwVmFTWFZBSU44SVBkM1g1?=
 =?utf-8?B?N29McHZ3ajBPS1ovTXBaY1czaWxQWU5waDlzZk52VElXU0lUS0c4bFZGR2l4?=
 =?utf-8?B?alVIMng1MzdmVHc2UDBhRk5hME5lOUhUaktPU3NZWDgxM0VWTS9GV3BXcDB6?=
 =?utf-8?B?VUpsMlhBamFFUEgxcTdabWdzSWJHOU5QVkZnT2hoYU0wdU0vSEprczFoVjVz?=
 =?utf-8?B?Wlk0VVpQa3loWTB6cWt1K0pKWlZOckJXR3VpK2VEMVkwZzFxOGMvdDg4RzNy?=
 =?utf-8?B?L214THc3blhWR3J1cmtIbm5TczV1STdOTms2TkFnZ0Vsa2FCQVhwa0dXNFZh?=
 =?utf-8?B?WUdjWTFMeTJOZmZkSmxqUWVUblRkT1BQMFo2eDZDMUN4dENid1pWUE5MVWhL?=
 =?utf-8?B?TllYcExCN1NYQXVnUnJSVURzOWMvbDd5LzV0VFQyNXVDVDJvMUZGQjIwMHdG?=
 =?utf-8?B?eUVteUdKTXV2dDFuZUR3M011UWN2Q0llWTRRQ0M4SW12R3RKVCtQa3EySW1J?=
 =?utf-8?B?Y3IwbWthUmJzZlJyK2N1YW1mdVBMcEhPeVpxcjFsRjY5TWQwNXpuK0RVTjJk?=
 =?utf-8?B?V1p3dGd5YXUzbTZZSTJUSjhqdnBDTmtzUTl5c2ZoUDd6L3BiVmVybkxiUWFE?=
 =?utf-8?B?QW1ibDRnV2hZbEsrYWZPbGpVSEN6U211UUp6VVFHdGpIbDQyd0d0aUxvK215?=
 =?utf-8?B?RGZmcmZzOHZEUWVhaFRXQnU2M3Jjd3AxOWVhdVQ4dXd4RkRiSS8yOVRRb3Zt?=
 =?utf-8?B?dnVGSkhwbkxkaFM4M0g2c282VTVRR2t1aEMrNWFva2p1eFhiblMzQ1p3c1dw?=
 =?utf-8?B?c3NmRHJvcENSa0NvMXU5WHI1ai93U0t0dWU2Q2lKZXl3dDJiUFJGSXhadGZV?=
 =?utf-8?B?UDhLR2FwVWJCRUJwWUJSeHZKNW13VDgybXo2TVN3dWxpMU5HUlhmajdML3lm?=
 =?utf-8?B?YmNmdzFLNS9UOXpRaXN0bzFVczl1akI4bldnYUJkYWIrcGlSbWlHcnJFaGM4?=
 =?utf-8?B?RlZZVWpkQ3czUnI0WEwwempDNEVPNDM5Z3VoUmQwODR2NEh5dDBicHlVOEMy?=
 =?utf-8?B?aFh3SDNZTVIzcFpaYWdUVnVTQVVZTzh5VW1zK0NiQ3lwQXZERDltWGhXL1FC?=
 =?utf-8?B?UGFES3pKZ2xjQldvL1N3WHJLVjVwT0lmOHVpdTROQ013OUJvR3hwV0Qyem9U?=
 =?utf-8?B?aFMxbVkxYmpOb3hqbU1BME1US1FwMFpyTUoyenJCY2hSUmNuMFVqOFUzV0Ri?=
 =?utf-8?B?dEpFQXg3NHJURzBTSEhwbU5iTUdYdm9rUUp3U1BiUzJlbUZxczNWTkQ5N1g5?=
 =?utf-8?B?MzNCYkF5STlSZkcrc1lWNmV0dml1bCtoZDNMZkRTRWZLOU42ZDV2bldBdU4z?=
 =?utf-8?B?MVdvc1VhRTg4Wmw2RVA5NThGTGcyUE90bStzTEN3Mzdzd2lNVi9USStOa0M3?=
 =?utf-8?B?OGdoVWVuQ0hSODBiWGRnVGxTS1U3aFNqMHZlQ3hhdnFWME9mZGNEbVU0dFE3?=
 =?utf-8?B?WmZ4QWl1UW1SbDVpakxScU9iWmtGcHJ1dXR1bDNLTlQ0UXdzNktJZHNNd0RL?=
 =?utf-8?B?QjdnSEM1dUxzUGIvVUFodzN6MWJpSWR4QkN2bUtGVXIvaWluYVhtU0tlQUJk?=
 =?utf-8?B?RGxIK2c5UEFRaTRsOVBvUEdabVRhYll3ZDdQRlZRMS85emZua0FTbWZ2MEZ1?=
 =?utf-8?B?bUxaajMvLzNjT2RmWXZrQjBPanIwQ00xZXowRDR5cVZxRjgxT3Z1Z0F0b3g4?=
 =?utf-8?B?MmRCRzJvSE9BMklPS3ZzYjBhalVTc0cwVG05TURvdy9sRVRMajlTK01qMk9v?=
 =?utf-8?B?WWxLVFZlUnVuNXFncWpwL29rT2tEQ2hicHY5d3pqeXRBb0NBMk5YWlU1cGJz?=
 =?utf-8?B?b0svcXl3VHd1UmV5cnFqTGtqT0pybzBrQUZ5ZExBVEVhOWQ3VTg2VmYrWVVU?=
 =?utf-8?Q?ub3qgxB/VYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M05GQTZtSWw2cDYydGdtaU42NisxcUIxWXA2NmZoRFUxSjUyaTZ1MVVKRDZr?=
 =?utf-8?B?NXdtd1JGb0F3cnhlMmdMYVY3RlhUalZmdTBBMGRGRkpZa3hwb0xzWVplRVlQ?=
 =?utf-8?B?ZkxaUzVneUdYVUEvejI4Uk4zQ3JicC96di9QOXQrcyt5alNIUDZzRGprVXpV?=
 =?utf-8?B?Q3JWRFRoWXZabFZUVHJ6MmlLMUtKSFB3RHFySFRiSTltVitYUFArUHJsWXow?=
 =?utf-8?B?TDF5eHRkSS9lR3hkUUVvMG1oV0pBODhOM1B6TVk3T3VJOEVQQVk2Y1FDNHdz?=
 =?utf-8?B?Vkhwbzd5MDJQM1pqeVplalFJNjdOcGpmK015MlIzMUswRjZPZlN6bUMyZXIr?=
 =?utf-8?B?S0NBWFo0NSsrN1RMaXpBOHFCNTNwdmlyb3Rzb0Npd0pmZ1paKzhkRFQ4b3VW?=
 =?utf-8?B?MGszd2tWR0IzQzVWaHhyRjB0cXQrYXRtOHIzQ2tmNFhvMXE2T0RGaGNrMXNQ?=
 =?utf-8?B?Zks3NktDK2lEUUd5czZyMm1VZTlENE9ZT3FwNTV2dmdlT2RWN20yUzkwbTFk?=
 =?utf-8?B?MXcrQkFOWVlkMkM1S0hVNHl4VTVnOU4wRG1iNm1BWDR1UWNmditoTW8zaXpY?=
 =?utf-8?B?NXgyV0thQmhwVFlNVEJ5UGNKcFp1b3JxUUk2cm5yWWdYQlZJUjAvUkdyck9I?=
 =?utf-8?B?KzBDajd4TDJPM1NPU1kwSk1WLzBvajRGK2JVNEhKQmNEY25HNkc4YnBwa2x2?=
 =?utf-8?B?T3VHcGFEd1RaMEtTTU82WVF0Z0t4NDlpMHpSRzVVOUxld1Y1WmNKSmNuYzZE?=
 =?utf-8?B?MWNNc3FlTDBselNzby9XY0g2SzN3UWdPNkFudjkrU2NxTitKSW50NG1sR2ZU?=
 =?utf-8?B?anY1QmNYNDVTNGFSdDB4K29kVU5LS2Z6dVZZSXZuc2loZk8yQ3AzVXFxVmZK?=
 =?utf-8?B?MU5rb0J6dVR0Y0RkSGl6dU00cmN6OEtSeFFVanZDZmNnR3B1bm9wSXdYaDFs?=
 =?utf-8?B?Mm5pOW1TQ21kcU9TYlRscVFmSEdqVmVLNEExd0lvZ2JtT1NqSnltK2wxeCtV?=
 =?utf-8?B?bHBtVHRZQXdndWpWeks3NWVlV1dXMFJpc1ROZ2c2NVBGODlqa1loYzFKQnBC?=
 =?utf-8?B?bmh1N3lUK0RGTnNVRVVneWdSSFk5UFFqbFptWnJTcDREOW9xMStkck8remFM?=
 =?utf-8?B?Z3BkOUFacm1vWCtENDhLa3pPTWVmeXhaVlR3V2R2QjVUYUs4T0V2Q0c3bmhq?=
 =?utf-8?B?WG5NanFBT09Gb2JkbEVrWmZrMDU4UWorTnBmSS9HZ3drSkVrbkxwMncxdzFF?=
 =?utf-8?B?cWQxVXoza1BLZUtyRzVzdldtSW4zSGZWeUhBNDNTeTd6N0NHSFZtcmszTjFr?=
 =?utf-8?B?dURxaDErTzJpNlhPalkwYlF4OWV3d1R3aVluWllnelZyNkxQenVVN3NuS3BJ?=
 =?utf-8?B?NWF4UGJGUmx4ZVN5TTFZQWduaXJ6akkvbElyNnYwajY5ZGJyb1R0Nks2algy?=
 =?utf-8?B?RGtadnpsUXhONnArWjEzUzl2TTNMUDIvSmlROUsrd1pySkJUMjRwSVlDWjNK?=
 =?utf-8?B?UG0wN1hLUWNYV0tET0hWRXpHVGQzMHc0TTR3eHlIenFWc28vNE0vc2p4eWE2?=
 =?utf-8?B?WXhGUDI5dGJWUzlNdHBCT3czMUlRUVA3M2h1RWlMVFVCcFczeGF0a3JrdXNY?=
 =?utf-8?B?OHNsSkVqN1I2aGJhWnlnL0dtWHhCdE5hT2ZXdkFvL3Bya3NjakZhZ2IvNHF1?=
 =?utf-8?B?T3dRV3hhYlNKajJteFhpaTk1UkhNcDdwTGFubGlTOTY1SzlTNk5Vb2xHN3p5?=
 =?utf-8?B?cnZKUHlHRFR5a2ZWdDZUK1lyWW5NaHdkelJrVFBsN3p1NXYwWmswMlk1WlVu?=
 =?utf-8?B?bnNsR25Vc3JhWlNxbWlNcE9qa2RWRFpaMkJSMUVtdTdObS9hOFN3TGhtV0N3?=
 =?utf-8?B?NzBvQnVPR004TDhzYVEyekplaE1RVnVmQlBpN3lEYkZTMGI3eU9nNjZLZ3lH?=
 =?utf-8?B?cVFhK1VKckEyRkhRa0grTTRib3FKc1FRVXRDbzExUTM4dFBBYVlJTXhqUVF5?=
 =?utf-8?B?OHkwdG9waEhNaG9Rckt5N3dmeWpPdXZFYkRjUUc1bU00bjB5U1NNSUVvMnRy?=
 =?utf-8?B?dUR2L0lUVmFGQ2p2MnR1UlEyN1hwV3lFYjU1ZzNsZkxJVzYwVGN1MDg4akNE?=
 =?utf-8?B?Mzd3YTNIbFpTQWxoOURQMElGOCtlaDI1R3FwKytjeVIvZVp0MVN0VkJCTVd0?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec29a43f-301e-4573-cb9e-08ddacb3bca1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:56:52.2728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpGSUaL0fWPCFaC+4xJgI6V1NT8cYTkODuAtJaGUXaS8E+xAZ+jMX4mX3MvY5+GDhwvzrnqqffeSJw44QORPsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
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

On Mon, Jun 16, 2025 at 10:28:16AM +0200, Thomas Hellström wrote:
> On Sun, 2025-06-15 at 23:47 -0700, Matthew Brost wrote:
> > The migrate_vma_* functions are very CPU-intensive; as a result,
> > prefetching SVM ranges is limited by CPU performance rather than
> > paging
> > copy engine bandwidth. To accelerate SVM range prefetching, the step
> > that calls migrate_vma_* is now threaded. This uses a dedicated
> > workqueue, as the page fault workqueue cannot be shared without
> > risking
> > deadlocks—due to the prefetch IOCTL holding the VM lock in write mode
> > while work items in the page fault workqueue also require the VM
> > lock.
> > 
> > The prefetch workqueue is currently allocated in GT, similar to the
> > page
> > fault workqueue. While this is likely not the ideal location for
> > either,
> > refactoring will be deferred to a later patch.
> > 
> > Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> > 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> > this patch on drm-tip. Enabling high SLPC further increases
> > throughput
> > to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s.
> > Both
> > of these optimizations are upcoming.
> > 
> > v2:
> >  - Use dedicated prefetch workqueue
> >  - Pick dedicated prefetch thread count based on profiling
> >  - Skip threaded prefetch for only 1 range or if prefetching to SRAM
> >  - Fully tested
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Hi,
> Is this really the right place to do optimizations like this?
> 

Yes, for now.

> The migration takes place in xe_svm_alloc_vram() and is being moved to
> drm_pagemap_populate_mm(). If those functions are considered to be slow
> then they should be optimized, rather than calling them multiple times
> in parallel from an outer layer? 
>

Shared code with an already-parallel fault handler... Prefetch is just
adding parallelism too.

> Before doing something like this I think we need to consider
> 
> 1) Why are the migrate functions so cpu consuming? Do we have a
> performance profile for it?

Yes, I have profiled this. On BMG, a 2MB migrate takes approximately
300µs of CPU overhead in the migrate_vma_* functions, while a copy job
takes around 130µs. The copy must complete between setup and finalize,
which serializes this flow.

Thus, as of now, the only way to saturate the copy engine is to use
threads so that CPU cycles can overlap.

Have you caught up on Nvidia's series [1] and what Francois is working
on? I'd guess we'll go from ~300µs to ~7µs once that lands.

I don't know why the migrate_vma_* functions take so long—the core MM
code is tough to read. I suppose I could hack it to find out.

[1] https://lore.kernel.org/linux-mm/20250306044239.3874247-1-balbirs@nvidia.com/ 

> 2) Do we actually *want* to use 5 CPU cores for this?

Yes, I profiled this with a test issuing 64MB prefetches—5 threads was
ideal. I have a comment in the code about this. Once [1] lands, we’ll
likely only need 2 threads on BMG. That would probably get us to a bus
8× faster than BMG; for 16×, we might need more threads. But I think
we’ll always want at least 2, as there will always be some CPU overhead
that limits copy bandwidth due to serialization.

> 3) Isn't a single CPU write-combined non-temporal CPU memcopy enough to
> saturate the system->VRAM bandwith?
> 

I'm not entirely following (see above), but almost certainly not.

Maat

> Thanks,
> Thomas
> 
> 
> 
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  31 ++++++-
> >  drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
> >  drivers/gpu/drm/xe/xe_vm.c           | 128 +++++++++++++++++++++----
> > --
> >  3 files changed, 135 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index e2d975b2fddb..941cca3371f2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -400,6 +400,8 @@ static void pagefault_fini(void *arg)
> >  
> >  	destroy_workqueue(gt->usm.acc_wq);
> >  	destroy_workqueue(gt->usm.pf_wq);
> > +	if (gt->usm.prefetch_wq)
> > +		destroy_workqueue(gt->usm.prefetch_wq);
> >  }
> >  
> >  static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue
> > *pf_queue)
> > @@ -438,10 +440,24 @@ static int xe_alloc_pf_queue(struct xe_gt *gt,
> > struct pf_queue *pf_queue)
> >  	return 0;
> >  }
> >  
> > +static int prefetch_thread_count(struct xe_device *xe)
> > +{
> > +	if (!IS_DGFX(xe))
> > +		return 0;
> > +
> > +	/*
> > +	 * Based on profiling large aligned 2M prefetches, this is
> > the optimial
> > +	 * number of threads on BMG (only platform currently
> > supported). This
> > +	 * should be tuned for each supported platform and can
> > change on per
> > +	 * platform basis as optimizations land (e.g., large device
> > pages).
> > +	 */
> > +	return 5;
> > +}
> > +
> >  int xe_gt_pagefault_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > -	int i, ret = 0;
> > +	int i, count, ret = 0;
> >  
> >  	if (!xe->info.has_usm)
> >  		return 0;
> > @@ -462,10 +478,23 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
> >  	if (!gt->usm.pf_wq)
> >  		return -ENOMEM;
> >  
> > +	count = prefetch_thread_count(xe);
> > +	if (count) {
> > +		gt->usm.prefetch_wq =
> > alloc_workqueue("xe_gt_prefetch_work_queue",
> > +						      WQ_UNBOUND |
> > WQ_HIGHPRI,
> > +						      count);
> > +		if (!gt->usm.prefetch_wq) {
> > +			destroy_workqueue(gt->usm.pf_wq);
> > +			return -ENOMEM;
> > +		}
> > +	}
> > +
> >  	gt->usm.acc_wq =
> > alloc_workqueue("xe_gt_access_counter_work_queue",
> >  					 WQ_UNBOUND | WQ_HIGHPRI,
> >  					 NUM_ACC_QUEUE);
> >  	if (!gt->usm.acc_wq) {
> > +		if (gt->usm.prefetch_wq)
> > +			destroy_workqueue(gt->usm.prefetch_wq);
> >  		destroy_workqueue(gt->usm.pf_wq);
> >  		return -ENOMEM;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 7def0959da35..d9ba4921b8ce 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -239,6 +239,8 @@ struct xe_gt {
> >  		u16 reserved_bcs_instance;
> >  		/** @usm.pf_wq: page fault work queue, unbound, high
> > priority */
> >  		struct workqueue_struct *pf_wq;
> > +		/** @usm.prefetch_wq: prefetch work queue, unbound,
> > high priority */
> > +		struct workqueue_struct *prefetch_wq;
> >  		/** @usm.acc_wq: access counter work queue, unbound,
> > high priority */
> >  		struct workqueue_struct *acc_wq;
> >  		/**
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 6ef8c4dab647..1ae8e03aead6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2885,52 +2885,130 @@ static int check_ufence(struct xe_vma *vma)
> >  	return 0;
> >  }
> >  
> > -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > +struct prefetch_thread {
> > +	struct work_struct work;
> > +	struct drm_gpusvm_ctx *ctx;
> > +	struct xe_vma *vma;
> > +	struct xe_svm_range *svm_range;
> > +	struct xe_tile *tile;
> > +	u32 region;
> > +	int err;
> > +};
> > +
> > +static void prefetch_work_func(struct work_struct *w)
> >  {
> > -	bool devmem_possible = IS_DGFX(vm->xe) &&
> > IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > -	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > +	struct prefetch_thread *thread =
> > +		container_of(w, struct prefetch_thread, work);
> > +	struct xe_vma *vma = thread->vma;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_svm_range *svm_range = thread->svm_range;
> > +	u32 region = thread->region;
> > +	struct xe_tile *tile = thread->tile;
> >  	int err = 0;
> >  
> > -	struct xe_svm_range *svm_range;
> > +	if (!region) {
> > +		xe_svm_range_migrate_to_smem(vm, svm_range);
> > +	} else if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > vma, region)) {
> > +		err = xe_svm_alloc_vram(vm, tile, svm_range, thread-
> > >ctx);
> > +		if (err) {
> > +			drm_dbg(&vm->xe->drm,
> > +				"VRAM allocation failed, retry from
> > userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > +			thread->err = -ENODATA;
> > +			return;
> > +		}
> > +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE
> > MIGRATED TO VRAM");
> > +	}
> > +
> > +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> > +	if (err) {
> > +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u,
> > gpusvm=%p, errno=%pe\n",
> > +			vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -
> > EPERM)
> > +			err = -ENODATA;
> > +		thread->err = err;
> > +		return;
> > +	}
> > +
> > +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES
> > DONE");
> > +}
> > +
> > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > +{
> > +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > +	u32 j, region = op->prefetch_range.region;
> >  	struct drm_gpusvm_ctx ctx = {};
> > -	struct xe_tile *tile;
> > +	struct prefetch_thread stack_thread;
> > +	struct xe_svm_range *svm_range;
> > +	struct xarray prefetches;
> > +	bool sram = region_to_mem_type[region] == XE_PL_TT;
> > +	struct xe_tile *tile = sram ? xe_device_get_root_tile(vm-
> > >xe) :
> > +		&vm->xe->tiles[region_to_mem_type[region] -
> > XE_PL_VRAM0];
> >  	unsigned long i;
> > -	u32 region;
> > +	bool devmem_possible = IS_DGFX(vm->xe) &&
> > +		IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > +	bool skip_threads = op->prefetch_range.ranges_count == 1 ||
> > sram;
> > +	struct prefetch_thread *thread = skip_threads ?
> > &stack_thread : NULL;
> > +	int err = 0;
> >  
> >  	if (!xe_vma_is_cpu_addr_mirror(vma))
> >  		return 0;
> >  
> > -	region = op->prefetch_range.region;
> > +	if (!skip_threads)
> > +		xa_init_flags(&prefetches, XA_FLAGS_ALLOC);
> >  
> >  	ctx.read_only = xe_vma_read_only(vma);
> >  	ctx.devmem_possible = devmem_possible;
> >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> >  
> > -	/* TODO: Threading the migration */
> >  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > -		if (!region)
> > -			xe_svm_range_migrate_to_smem(vm, svm_range);
> > +		if (!skip_threads) {
> > +			thread = kmalloc(sizeof(*thread),
> > GFP_KERNEL);
> > +			if (!thread)
> > +				goto wait_threads;
> >  
> > -		if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > vma, region)) {
> > -			tile = &vm->xe-
> > >tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> > -			err = xe_svm_alloc_vram(vm, tile, svm_range,
> > &ctx);
> > +			err = xa_alloc(&prefetches, &j, thread,
> > xa_limit_32b,
> > +				       GFP_KERNEL);
> >  			if (err) {
> > -				drm_dbg(&vm->xe->drm, "VRAM
> > allocation failed, retry from userspace, asid=%u, gpusvm=%p,
> > errno=%pe\n",
> > -					vm->usm.asid, &vm-
> > >svm.gpusvm, ERR_PTR(err));
> > -				return -ENODATA;
> > +				kfree(thread);
> > +				goto wait_threads;
> >  			}
> > -			xe_svm_range_debug(svm_range, "PREFETCH -
> > RANGE MIGRATED TO VRAM");
> >  		}
> >  
> > -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> > -		if (err) {
> > -			drm_dbg(&vm->xe->drm, "Get pages failed,
> > asid=%u, gpusvm=%p, errno=%pe\n",
> > -				vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > -			if (err == -EOPNOTSUPP || err == -EFAULT ||
> > err == -EPERM)
> > -				err = -ENODATA;
> > -			return err;
> > +		INIT_WORK(&thread->work, prefetch_work_func);
> > +		thread->ctx = &ctx;
> > +		thread->vma = vma;
> > +		thread->svm_range = svm_range;
> > +		thread->tile = tile;
> > +		thread->region = region;
> > +		thread->err = 0;
> > +
> > +		if (skip_threads) {
> > +			prefetch_work_func(&thread->work);
> > +			if (thread->err)
> > +				return thread->err;
> > +		} else {
> > +			/*
> > +			 * Prefetch uses a dedicated workqueue, as
> > the page
> > +			 * fault workqueue cannot be shared without
> > risking
> > +			 * deadlocks—due to holding the VM lock in
> > write mode
> > +			 * here while work items in the page fault
> > workqueue
> > +			 * also require the VM lock.
> > +			 */
> > +			queue_work(tile->primary_gt-
> > >usm.prefetch_wq,
> > +				   &thread->work);
> > +		}
> > +	}
> > +
> > +wait_threads:
> > +	if (!skip_threads) {
> > +		xa_for_each(&prefetches, i, thread) {
> > +			flush_work(&thread->work);
> > +			if (thread->err && (!err || err == -
> > ENODATA))
> > +				err = thread->err;
> > +			kfree(thread);
> >  		}
> > -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET
> > PAGES DONE");
> > +		xa_destroy(&prefetches);
> >  	}
> >  
> >  	return err;
> 
