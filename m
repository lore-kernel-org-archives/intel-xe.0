Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C7ACA0EFF
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 10:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4F110EA70;
	Fri, 30 Aug 2024 10:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzuSsoPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ECE10EA70
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 10:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725014961; x=1756550961;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ecEgjN8GlfAWv+H1is7X3ShUqcWBtd/WxlFe382BMWk=;
 b=DzuSsoPXRAEqL5owl8poea6koBW0K7W/WeUVtLVzJ2KjTufZvGfOLVUW
 oK06/WNee1L0TCvRhNTPW5ixsFPyfV1M1kocllypkbDoQcRtWeWtQq9vq
 jNcpXN5szVb3HVN0Fr/5YKkjkAdUZp8XA3QMp2aBuE3yj95WT7CvBaqnb
 1rI+Y5AF9YPSpdH222aQ2KK4p8FvxkqR93pniLN0zmsIHYyxV+n06rXCU
 GEe1Gz6/xn0Id/evRd05tTC5dSePZ3FLDj4uY0MCdyPxuDhUpLzSqV1uu
 6BFqTeFDSbmkh47sH02vIhwF2OYoVQUXnN0RePfncRGCSE/Qa1Y/irIqy g==;
X-CSE-ConnectionGUID: ZkEpn80NRdOipA6tpdyqNg==
X-CSE-MsgGUID: j57LRNJeRmeWmfnZMWb+jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="41132104"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="41132104"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:49:20 -0700
X-CSE-ConnectionGUID: wIgY4BEPTZq7HAfh/mdn7g==
X-CSE-MsgGUID: vz/aLe68QZetN3qZQitpqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68017304"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 03:49:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 03:49:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 03:49:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 03:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G35A7ZUvOvzX8rpg1ISiDaqSdNxitq5rq6sBOTkhbhetdjbB3o0A8G0HMKNaZkkcGOhCCBTH5Nu9vwcu3nNqsfHiecJ6kVex5xLouqHVE72FgBxCgNJ5aYq83x7DRJwSj418Ucx/oZaKmlAxFyw/ykrR/K5/gFiY1clVHe6MMLGyuvQ6IsN2jQBOc2gifl6qFLyTWp3BIiv2aIUl/vRbDcyZzPtazAjx2R65Bhj7rUPCiLhh9sX+lTc5pj53jN9Gs8iLTARArOV0Y3GHcNTtBCsMleoprqUSlPKCXPF7SLtPMj/Zt0rqnEs4vYaj1FKyTXZPuTYNGMVaSHFISWFKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7gypwp3S0BCziq61cb+YCwhjDJMmmfyiwbcEjISmzw=;
 b=OvdFNgk4F6sVCuxD9uo5gYeKtYZ6uaCErX1/LRlFeN60e//dKOFEtQ/WWvFjLUjS4Dkfv9GgvUxYoOohzv4G9BOZQ9OP+gZi2MOHY6vWOi3tT0Bun4pppxBYSa3aryAZWcLkI5kzHrxH3zTU3eRLLPWrzCdfNNmLWanxdKNXglUt2T+Zb2+Dow7XDoyVWUBo9GeX9jg9N/ipcAfE7qCc1nIdbBZkt/0tfSTxxTWy7CEePbNInbWwh9Pbi6V+8yGSb3i0u/8k6uzkEW2NU4DfWvcac0smjmr6N6uRl399leu4A/Hhjx5v1KRSa0hk3hHyj6k8ditmGlm44fyNw5pVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 30 Aug
 2024 10:49:15 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 10:49:14 +0000
Message-ID: <8de6bb16-4ecf-4440-9df1-a2fd35c98a95@intel.com>
Date: Fri, 30 Aug 2024 16:19:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: Drop unnecessary xe_gt.h includes
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240829230307.886233-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240829230307.886233-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: e856dd62-bb94-43d5-d375-08dcc8e16392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVlsODB4VHlsZVRRR3Z2RVhqbW95d1QrQWREdTQ0YjgrS1g5cU1PZFdvNmpt?=
 =?utf-8?B?QlFiS3plWXJzSzlOZXovMXg5RUlpbUVPcEttMnNPaUlSaEc4RWxoZDJQTFVX?=
 =?utf-8?B?Y0IwVkc1OEZPRDRIVWxsWXZ5Y0NZWngxcmJxNGdiMXllakp4RDhrckIwRUhh?=
 =?utf-8?B?a0hJaFAxVHJPSEtONFh0QjRRUzV2WXRhWFU2YStKdUpjdnN6NWsrOEQwZGZy?=
 =?utf-8?B?eFFWTE4xcHVqR2FPV2dJdSt0eno0cEtNNzVTTkg2aUQrT01IUFJUVXlHcXlT?=
 =?utf-8?B?aHJFVDFUZVlJdW15Ny84Y3c5UVRPRWUvWkJRZ0Z3Tk9Rb09HR0tHbzhVZWwz?=
 =?utf-8?B?VXY3R21IbTkrUGpIam5IVGNPbFBsRkxET3hXOHJuc0FJYk5UNGpYUWUvR0V1?=
 =?utf-8?B?d0VSL3IzUHY2ZVpOeTBSR1NnbGJKNVhCVGU1N2ZJTkZvQk9HZE5WMUJtK0Er?=
 =?utf-8?B?S0JkQ1lDMlRJUTFnZzZXYmsvUFd4cHF1NE0zU254WHJOd1FWcUd3NDFsaHJu?=
 =?utf-8?B?ekI4aVR2RXdDUXg4ZXp6OWZLd1JTS1lDZ1dUejdWTmIwNWN6SUtrUUNlc045?=
 =?utf-8?B?bnE4aStOWldwUjJveTBrR0V1Q3BPdjdxUGEyYWdjK2ZLbWFGYU94dGlMamdy?=
 =?utf-8?B?VnJ5QjVvY0xpWTl4RlVLbXNHUmVjVldUclA1NFVCYzQxV04xakZEUVo3NHVq?=
 =?utf-8?B?RExXc3RNeFJjbVpIN0ViSW1haWlVd0p6Q2dNM1RUZDVaMXhJTWlqLzhsKzlk?=
 =?utf-8?B?TVRHa1JwN0J4QmlKSWsyM3daeG90OVhJS2Rhd1lFd2QwVnl5d1NtaXdMMXdw?=
 =?utf-8?B?K3E3TGZDcXFnY255UkRZL05uUnRYem5lN1dpZGZCQXpnUUd1bkpDekVsYlBN?=
 =?utf-8?B?Zkt2d2ZKZXplV1RCRkxWNmRwNHUzWjRWU3ZESzRoRzA4VGR6dXlaek1Dd3BM?=
 =?utf-8?B?bjhmV2xJTXYyWERIaTJZMXp5c1RPQi9CTFlGOFlKR25CK2dNTksvZmlyVWZv?=
 =?utf-8?B?emZCMHRFajJVRndLNnE0K0NkVStHeU1haFlGcStiN1k2WS9ycHZpZGJXdlFq?=
 =?utf-8?B?bHN6MFVLRmZ5Z1VEK240YWdXUmtEOE91YVBSd0tITS9sUEdoSWpRb2pDZkxz?=
 =?utf-8?B?YkJnbU5vRjQ1UEJjMm5oZWpoaCtkVHNwODRuSFVyaVEvSXpxejNkMFNVVDlT?=
 =?utf-8?B?dTdESDh5ZjMvaFVEZ0U5c1ZoZmt2Z2NXN1VtczBDc2t4cG5pMmVZTUtjT1FW?=
 =?utf-8?B?QUVwa2JwaFNTVlZNZW9WK1FkWlpOcVhOc0hCY3JSU0Iyd1lRVjNZRzBZd0Rk?=
 =?utf-8?B?b0Z5WEpBNy9ETWJZdzNsVjQ5eWRYd0Q3SXNQcForMDBnWkEwOERuVHFNbmQ3?=
 =?utf-8?B?Y1R0QitsZkhCc3Z4T21uWTV2RWt2MEtOMFNIcEEwdlQwQVpaam5WT0MxdDdz?=
 =?utf-8?B?endieTdLSFp2K051UEFUdHA2UlVscUNycGd4UzU0M1ZYcTdSNWsyZW40bXlu?=
 =?utf-8?B?UGhGZHpvYkc5SHVXazNDTXNhS3JWbEYvT2FGUzg5Y0tmYTQ4NVRibVB5WjV6?=
 =?utf-8?B?NGd6T3hSUThBelQ3ckQyUUx5SmJkY25zdTJtamhCdWlYWnRGb2hIZkczTU5F?=
 =?utf-8?B?WXM4cUMvczdBMWRQRm5ocnNnSDFwQ3RjRGlSejdrd3NwUDVDOGVJN2I5U0c3?=
 =?utf-8?B?TStPWlZHNStEemVBdzE3dE5VNEp2MERqd0VoUmx2WGd6UkVtNHg3RnBwZ0JX?=
 =?utf-8?B?ZFFMbmlVVjBmbmZsdk5jUitoUEt4WlFQZzI2VzQ2KzJHbWZ4WENoaHNBL1hU?=
 =?utf-8?B?anhTdjUyQTNvMFpqRzBPdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2NjQzJHcUczZ2pmT0tnY3JDcGZobUkzazdXTWpuanllcmVTTHMvaGRCMnYy?=
 =?utf-8?B?bTdOYi8xTmptMWdybU1nbUo5Ni9EckhUSXk3czAwMXhoajZwTFVoTFk1NTdV?=
 =?utf-8?B?UmpTeDVTUTdXcXpoclRCOUxRVlp1TFloRjNOQmdvOFZVdFBqYWtPcnNvTUpM?=
 =?utf-8?B?K1hLK0c2bUphT050YjZrYlFUampxaFNlcXVpMXVvY1d0eSt2bk9lMmFXNlAx?=
 =?utf-8?B?OTlRQnhuMHlkSHZSbXZwQWZza2R5OU1rQkx5azdrK3VqVStiNnNWM1BCNzQr?=
 =?utf-8?B?TUdtVHZPUlpKMjkxdm5mWmpGYjRjQ2N4aVQzUlJXc0kyUkxObVkyejc2SVRt?=
 =?utf-8?B?bWZjRVdMSS9YNDhmL05xZ0ZSNUlXMHlWZVNITEExci9Ea0VrUUhQU3E2WFJV?=
 =?utf-8?B?SWhnUy96RW5CWDZWSXNBV2tvMklEU2NsQmQ5ckxNZWhSc2pTelhpZ0VvWW96?=
 =?utf-8?B?R2RhV3JOcWRrdzR6QkNnQUNEaTE0Y3cyQTEwYzRjZjd3M1lxamFxbS9KWU1O?=
 =?utf-8?B?RTFpaExBN0paeldXc1VqT1V0TGtPcGJ2RTM4Z0Q5eDRFZmJrSVVxeG9yOG9I?=
 =?utf-8?B?czZjVlhzSW5kZ0tDQ3FyMFZuS2JoTWpQa2x1VlI2TUdieXlpaGVScVRvZ0FR?=
 =?utf-8?B?OVN6TG9hcFI5TTdWbVhqMmxGNHpKYmZZdkdtcnhMS3o3OTNnTE9GUmg2K2Nl?=
 =?utf-8?B?cEZFdnNlV05iRjdiSXYya2pZNmx1WlNTenBPK2lLWmh2SWpDNDNOWkZLOFY0?=
 =?utf-8?B?TUgrM2JuU2ppTGFKYWllR3Y2dWYyck9MQ3NVblNQNEhkenNrSkVRR2F4ZlVn?=
 =?utf-8?B?Znd0L0tudERMZWZieHhGTElDTlRlZGxkQjk4UFlQb0F1emFrOElkUkdpcEFs?=
 =?utf-8?B?a20wOG5SMTBlcndlbkQvVk9JV2NVWTBlQzhKQ1NOeENkeWxPdmlhbis5bnlF?=
 =?utf-8?B?eTF6a3NlT2ZxUW9aUW1SZHBrSXRvT2IydEdWYjZGak9WcFpjMW9qLzRsRWhF?=
 =?utf-8?B?TXFJVHc2RnVYWmVQbVIrVWY3SXNVcmlobVBlZTlnUG5lV2MzS1BJSmcvU1J6?=
 =?utf-8?B?Z3RFUXpXTGhzM0RvQ0RXSU8xMGJZY2FFa1AwYWxBUkxabmdrc2ZTRlVPeXhr?=
 =?utf-8?B?U0tTdzRIRXZPL3RNcVdMT1ZBamFhQmhzcHpIQlcveHNZQU11ODVFdys0eDdI?=
 =?utf-8?B?QTFhamVkdVlWOVZaMndHRVkyeHdCMFk3YXB1S0VUaTlTNGkzcVZjeXFPQjM3?=
 =?utf-8?B?Q0tRZTVRRjBlbkd0WUdLUmRURHhUMTNOSzUzNzQwcGFFTzRxeUJQb0R6ZmdH?=
 =?utf-8?B?S0ZiT3JOeGx0M1NrYWRuUUFrUm5iOWMzRTJ1cWVlM0RBMUhHNlpaTW9yMjN5?=
 =?utf-8?B?UVFrRGRKRWE3Y1BLVnFFY1h2MnZlVFBPbU5NV2t0OFdtNlhWM25LZHhDM29h?=
 =?utf-8?B?NnJZZVhrTkpQcjQxWmhDeHBVb1hFb0IvRXVJQ3o3WHpqSGFkMndGVEo5WW1y?=
 =?utf-8?B?YWhaZURXU3VkZWlKcGFGZU9COGJTeDFXTkxNemZIbDF5ZFhDSGEvOWJMdk5l?=
 =?utf-8?B?dmZLN2lRY2hER0FzbnBnRG1tWE9YejJuMnNGSUdrT3IvN3I4ZEcvYXlmOVZ0?=
 =?utf-8?B?bUw4Z3hMOFM0T2d6ZFdUMEY1SGxncEVjYTQ5RVpmdURFZUptZzNvLzN6UHpz?=
 =?utf-8?B?cng5M3RGaS8ySDhTZFgrSExyaGl3bVVOYjhOcUxVMEtzOG5kQWh0d2FUbC9J?=
 =?utf-8?B?dDhkMEthR2VLUUpNSmlwRmIzTktVM0UxQ3R0TmxZM3Y5Uk03SytRemVVUU8r?=
 =?utf-8?B?WHlVNy9XWjR2WnYvcnRMdWhDTmFGTCtXeU54R0Q4UEZheFllUWJiK1dtN1pk?=
 =?utf-8?B?N1VkbTlvTlpueDRISjNHYmhRd1RyQkw2eU5CdXpreEFWdHB5d3RZZnRhbWtq?=
 =?utf-8?B?cHhQZUhYdnhvOVFYeUk2bEdQemNGRVI4ekppdllBMWszQ1lDK0dxRHFJMGdN?=
 =?utf-8?B?OEJGVFFGU2ZjTjFpMlI0MTNqazVUcDBqY0lUc2FsS2dUTFRlY2V1MVNXSXNU?=
 =?utf-8?B?cG5IejFXbHRDenFkNnNPYWpTTVh2Q05xdWhIbE52blY3T2JEeDZKSERydDNU?=
 =?utf-8?B?dGJsUHRTZFFpVTgzWmtVa0JRYW04T2hCZ3M0Nk5IYXM4YWYyMjFkcGFKUFZv?=
 =?utf-8?Q?pwoo+NstE2KZuPG3p3g2R7g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e856dd62-bb94-43d5-d375-08dcc8e16392
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 10:49:14.6342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjQMToeh/5hI7tVS3gceaDG6o1VzdwxdGCSsvWS70kbzNTBJlDMU0KUquT9lCiuWiijmSUrmdkeZPHxf5nm62niQHxMSnBUKRr+GkFP/1Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
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



On 30-08-2024 04:33, Matt Roper wrote:
> None of the Xe display files work directly with the GT or need anything
> from xe_gt.h.  Drop the unnecessary include.
> 

LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/display/intel_fbdev_fb.c | 1 -
>   drivers/gpu/drm/xe/display/xe_dsb_buffer.c  | 1 -
>   drivers/gpu/drm/xe/display/xe_fb_pin.c      | 1 -
>   drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    | 1 -
>   4 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> index cd8948c08661..99499d6c0256 100644
> --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> @@ -8,7 +8,6 @@
>   #include "intel_display_types.h"
>   #include "intel_fbdev_fb.h"
>   #include "xe_bo.h"
> -#include "xe_gt.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_wa.h"
>   
> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> index ccd0d87d438a..f99d901a3214 100644
> --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> @@ -9,7 +9,6 @@
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_device_types.h"
> -#include "xe_gt.h"
>   
>   u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf)
>   {
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d650c5ac41a4..b58fc4ba2aac 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -12,7 +12,6 @@
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_ggtt.h"
> -#include "xe_gt.h"
>   #include "xe_pm.h"
>   
>   static void
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 0af667ebebf9..6619a40aed15 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -16,7 +16,6 @@
>   #include "xe_force_wake.h"
>   #include "xe_gsc_proxy.h"
>   #include "xe_gsc_submit.h"
> -#include "xe_gt.h"
>   #include "xe_map.h"
>   #include "xe_pm.h"
>   #include "xe_uc_fw.h"
