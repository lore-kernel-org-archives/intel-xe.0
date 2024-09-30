Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA458CF6491
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 07:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6064B10E3A3;
	Mon, 30 Sep 2024 07:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3Lge80N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4716A10E3A3
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727680903; x=1759216903;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s7kEBwCo7wmhBLQfreaJ5WgoZsZWzeQsr0Df2WajapY=;
 b=Z3Lge80Nw6AxFEyKiNxhVqqDoxa0qZ4XZVHRnv7238f5qKuVG5vUNHha
 Wn6pniZdsW1X41iYI9r/yHZcXWCQithNqAA7e2bVBGLThAX9MzaFbr2S1
 ESS0E4iZzWEa0fgYHgNM5dLUd6dfUAg6saiLO2mVgUbCYyozuQN3EruoZ
 d8ZKLlpJh42PZNMXi4pGe2gvmPA1vmMzNC1uk+BOzHLZXtILWKWrEtFRl
 7BHr6+ETy0TAletoQ3zY1Njy46vZdLzp+ygzX8jHznbI2bf7ydKPwpNLU
 vOB2BIGcR9uaPMoZhYYYGM8AsmEGZUcC4nAMA4o967RcUcy66Dlm11QXt Q==;
X-CSE-ConnectionGUID: ph7A54vXQMWPGXPeOzr6Pg==
X-CSE-MsgGUID: FDoQjlF8TlWTWr3bGI7hIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="49275337"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="49275337"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:21:43 -0700
X-CSE-ConnectionGUID: COQyiDPnTzarrnFPcUVB9Q==
X-CSE-MsgGUID: u/sj0afgRjemjfu0mBiNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73076858"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 00:21:42 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 00:21:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 00:21:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 00:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jav8g/Z9uAgtLGz0pr8W7jSV8ur4iLo/h04OIjuiZNBgl9TNXxGfOM4nIqMpkpdHUgt0CCBXnANTwdPJfMQY9T69XG+FhUtHKRgfoXQ3NATSlaR4SGY6I9fSa6F/y4241TsCOi6doQkJVM8grXqpuMARvXCx9hhU+/Ai2w6it9aCwhwAGbSfEP7K6SpHp7VWJXeMir5YmVIKcliVwBj9FqSuh3Ka97LoFTLLELweIyoh1SJyU1CL8eNit3M2y31ByNKcByrcthrsQA3TeVq2fNuEhzg0ntx3LuiKn5wAGdANDRshcvoWS8mQb+miHq/ygySsyp7rVHO7JNCiLWdUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tXOC8S38BjDt1FpzzZGAycGK1SqlwUW4JfbgkBQC80=;
 b=EeUC4UwQfXxColR7dh4c39IDCgPCPyqOJzR5FRhRtKVaCm188yHtQy+m2+jtNWsDF2sdvzNNQRTPlIPSK/jaVFmwgtNWCas9epHf5jPr4YwcAMPZafMJNukJ8FQq6pI5kJKSDwdB4KBl4KhVF1Kxcch9rlA0tYlG3CyYcyuA5jP1W8Rkqt6paVyc/Y4CIKw3QbDHabf6YvY2eLWgUVM8NXNOZBbQLcdLKsFfqrvTtuaAeimv52egJKeUGNM+/Y5xAqA5a50EzzP2Eq8yfLK0Ug+j/UqmmQnU93TJ3W5ohWi55XBbMxbw+gTht/LA8Z/YEBydmM71VVvucEw//1oq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 07:21:34 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 07:21:34 +0000
Message-ID: <609359e0-8b88-4ec7-9cea-33faf2625918@intel.com>
Date: Mon, 30 Sep 2024 12:51:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check return values of functions in
 xe_gt_shutdown()
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <apoorva.singh@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240926110026.407383-1-apoorva.singh@intel.com>
 <51d67f36-5acd-493f-b81e-5381af3884a5@linux.intel.com>
 <9744a79e-17cc-4830-ac48-0b783d99ed8f@intel.com>
Content-Language: en-US
In-Reply-To: <9744a79e-17cc-4830-ac48-0b783d99ed8f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 45650e7b-a939-45e6-0b91-08dce1208367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b281YmI0QVlRZlRxSWNnbGhWbndCaGozWTBiN2N2UWNPUlY5RHNpeXdkbmpK?=
 =?utf-8?B?UGFpemJQbnpTdGNlbmMrbFliU2FObWVNMnZpNkhTblAybU1XSXlkWGZUNjk3?=
 =?utf-8?B?NXYzaUQzaGh0R3BPMUc4ZUtFd3k0ZzBkeW5TSEhsWDdJcjVWb1JmTTQrMzlr?=
 =?utf-8?B?NmVSVE5EV0RxeHd0RGlldEFDRFVKQ3BOdG5hZ3NOdlp6UDhLOTNjLys1aVF0?=
 =?utf-8?B?QlZhSkFid2F2WjRPeEtESEx6UGxiczNGR0FnZVA1M0lkSFA1Y0NLS3E4Ykd3?=
 =?utf-8?B?b1NFK3l0S04xVmdJVWtENTEyc1NJNjZodXFDYzNTZjJ6dFNmL3l4MHdidjdO?=
 =?utf-8?B?OEMxaW5TT0UvNUZacFlrc1dJMUoyV3ZTalZqMlFaYXJkRjViQVlWU2ZYNmhj?=
 =?utf-8?B?azBZZmV5UTlDYWc5aUdVek5YNlFJc1NseVRwNUNVSkRPam1oK3o3VXRWUTd4?=
 =?utf-8?B?aGo0eGE3N2FvS0VOWUhpZkh5bVp4NXUramdoWCtQdmRCd05LeVZFV1RhakRs?=
 =?utf-8?B?aktxU2dIc3oyR25DTWdlanlRU1FGWDBlV1dUWS9kSWFVM0cyczFlaUNOMXVy?=
 =?utf-8?B?bHFTRW1zNHhoakd6MFFGV0hHZnJ2QUp2ek9kQ2pDVVlHY1hxS0pvZzlpVDdp?=
 =?utf-8?B?a3J2dlJOMmhEWTQ5Sjlaa2QwT05GcWJtNkU0OFYybmdVTmlDYXAyQ294cUpQ?=
 =?utf-8?B?QzRWREUxYTV3QlBZWUltdU5PdCtYNHhVZ3pOdVk1NzEyZHJJZkZ1MXgxRU54?=
 =?utf-8?B?bE5pNkdXVmtCUW5ZalZsd0pXNG1TeHh1K1NxUmdPdWFsSEs2cXE3amc5dndh?=
 =?utf-8?B?THp1TFJHTm9MWTgydzFNeHgrRlNBa3JBamVlSkUxWHhWaXM5SitoeC80Y2tI?=
 =?utf-8?B?TGg2Vlo1dko0TjEzZTZOTXJtSnIzeFpKN3BoQSsrVllGNmhEdVN4RlM2R05Q?=
 =?utf-8?B?WTZYcHRObitUWUFabEpLd1d6cm9SMU8vQlMrWVBCNEsxUnhRYWFESEtmaERk?=
 =?utf-8?B?U3dnQ3R2TEcyQjdoNWFDMFU2OTFQcUFwSFJuM0dVc0dCalk0em9lbGlJeHd4?=
 =?utf-8?B?MjhpRTlmaDVXQVNFTlBxTU1aUWFzc3FWbHR5VGNjL0cyWGh4Z09JSUkrbWRI?=
 =?utf-8?B?MmVHeEpwUHczMEQ1M0VoME8vQlJHMGRvN2dpNEJrbGY4L3BTcUpwK0VNTitZ?=
 =?utf-8?B?YktTYlFFcnJWWWlSdFBlU0RhaStRZGlIa2Z1WFBsS1ArRDQ5QkhUSnJTbVZV?=
 =?utf-8?B?dXZ6TENqYytJR3FxdThScXdINWk0VWd1ZFM0V21PdjRlQ3NQcVVvMmMyakRN?=
 =?utf-8?B?WGZTK1M3NnJVUEFyMnY0K1JmN3B1MllTOVNXb2xxZ2pCWE1vajk4YWpkWlpj?=
 =?utf-8?B?NExaeXNDRTNDUTR6YjMrR1JYcDJ1elQxOXltSWRwSzhrSmFwUFVRVUNsTG1x?=
 =?utf-8?B?bmNRdlpMWXpXTHJPZjJueFArc3VFdlpVOVpKZlVxOGdQa3hobHJwSmFOdW1V?=
 =?utf-8?B?T2pKWHY2MTg0R000KzhUM3FhRk5aY1JuOENDYmEwNEJobnlHQkRSTDhLYWp5?=
 =?utf-8?B?eC9Manhsa2JobktQMDV0NUdocEkwaGVua2J4VVNuTXdFREZZTUYyaCtDU2J0?=
 =?utf-8?B?UFQ0ZjhnMHRaaWZSaDQycUxMVnVmTUpya0FOZ1ZSd2FXcmNnNnZZSHdNSVVD?=
 =?utf-8?B?by9CRitLWkJBQmQ1KzFVaCtEQ0FCNmlxbGJVbTQ4TlhOWWYrdjJrWWxYMG5t?=
 =?utf-8?B?WGdFOGdGMzFUOWF1VkVuSGF0VS9RbGdjRzc2VXFuVHROemRWL0ttQmxxWTJG?=
 =?utf-8?Q?gkgPrfq+Hlw2WLcxaiO9JBheDTV6jlwyra6rE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkY0TFBUZGlNMmxVajRQdExUb0VBaHlRVHF3NHRObHZvcnIrdnJDVE84eGg5?=
 =?utf-8?B?bnlMaFQ3RVVWYzNZdmJuSm12U0tMMU8rQnJacmF0ZUZVU1ZtYTJnQXdBeDVU?=
 =?utf-8?B?S3NRMTlvaGZKY0t0TWVWOHAxMlpySFZXSWFkN1JPMzlLemxwUXA2VjF4cDdQ?=
 =?utf-8?B?Q2xnU3dDZ216MFgrQldWdHM4OFZsMEwvSEJEVHdtaVpaTDFQYXExNDFiUENh?=
 =?utf-8?B?U29DYWlsTHhSLzM0amZVZ1RRZk00Rjh4WElldkVOMzZvQThRNFhHUnJwb3ds?=
 =?utf-8?B?MW4wc0RPQmcwdHFXVjA3a0p1VmdkNWRvcWxpNmlaTUtnRkxjdUlPR0NXVGpQ?=
 =?utf-8?B?ZHV4ZHRDOGdaR0JQemlVZWQzaEVjOU9PTTBQd0g1Z1U5V3BZbzYxdHJkY0VR?=
 =?utf-8?B?Qnp0SnRETm1aR0FEUGd4R0R5WjQ5c01wZEtiS016TXFMUGpBM2JoeDJ4Mk5T?=
 =?utf-8?B?aERXcUpqeWRxQkZRVjZwZ1JHem1wRFBuQ01XUGRWbndTQVJJWDdRNktONkVU?=
 =?utf-8?B?blZTWUphSitieVNiRlAwTnBpc2hHd29rSmZzSGNTOFRHemxLczVyNVRTRDNG?=
 =?utf-8?B?ekJHd0s3bjNXMG5TTDRPOXVOaW1waDd4SFR2QURKdE9oOEllazVLajNWaUM3?=
 =?utf-8?B?QjlxTEpVK1k5SUZBVFRMT1RXUWJnOFhmL0hpNjVlcFpwK2RONU5CK080Uk5z?=
 =?utf-8?B?TnRjcVhSNE9BVjlZL2I1UWJVWjMyMVdiRmVFTFJQWjcxQ2gvbFM4YTJLeHFH?=
 =?utf-8?B?N3c2TDk3WEY1K01MaEFUZEhIZjBUSEI3TkIrWUE1cThOV1pxb0xaWEJZRkZK?=
 =?utf-8?B?bFJhejMrbnMyOXRnM3YyYUtDSEJGc3o1T2ZsTjJtT25iVmorbzFKNDUwMGRL?=
 =?utf-8?B?eitma2lLY3RHcm1Rck9HK0ZTTGY2N21lZE1pSWdWdFpHYW11TFRUR2svdEwz?=
 =?utf-8?B?MERKUWlqcG9QekFNejk5Ni9lamdNMm9DOVVvY1I4VTNPUWViazU1bkZzRWtj?=
 =?utf-8?B?SllDbWhHMFFGSTJ5Q29JUVcrdjJLVjFzVWFvK1BVVWNtMkFyNE96bVFUNmVH?=
 =?utf-8?B?ckZxRjRCYVZueGRWYVByQ3VpZityVzRzMWFqSVU4VzVRUEZsbXF1a25PcmIy?=
 =?utf-8?B?cFYzdjNCeFhReGp2QWx0OUhpYXMzT3J6OVpyRnJ0QlY5T2ZnRzNQUFVkRmow?=
 =?utf-8?B?MlUyRU9aeG9rMTdGdVBTNnlaVzhmVlR1VkxSbEdHRHFUNi9PR0xxanFrelh3?=
 =?utf-8?B?MjZlVzlHOEVRTXFZY3FiNWxoSVhtbW5LM3NidDhxc2haaS9wVWJnZUNBL0FN?=
 =?utf-8?B?N1ZpM3FmZzF0dTE1YWdkaTRaaVRDVmJPVVlPb0dYWk5NcTJ1V3FRQjNnR1BM?=
 =?utf-8?B?T2tudDRSUmFYSUJmdmNjazIwSXo4QS8yR2Yxelg0WmUzcHh2V1JnaWVNY2tw?=
 =?utf-8?B?Y3MwRVMvYTRKM25DVXhobVRGTzRNVkVTc3dycHVxb0hycy9jRGVJOEpJNFJz?=
 =?utf-8?B?emZoU0FMR3JITzRRSXZ4N2kvK1grZkdvU1B1L2U0cE01MkYxU2NyM3RTT0Yy?=
 =?utf-8?B?aEZKaXhhUTBQSHR4UTEyWDYwUUF2WEdoWHZCbldVNTRvNEQ5OFlYeVlvV0RF?=
 =?utf-8?B?TzhLazByQktXcEVHdis5WnhXNmF1ZnBFR0p0c1JEZnJmVTc1bEIwcDFtekFH?=
 =?utf-8?B?cE9HeUQrZDFNVG5EWERvTnNlM0hvaWNaQzViclMrRDRVM3l2a3AyUEY4blJX?=
 =?utf-8?B?L2JBZlFEd2dZUjFIRWVSa3NuRlRtSTN0VWIwT1gzdW5haHhwc0tkeXNSdHJ4?=
 =?utf-8?B?RUhSY2lhSVpqMHYyYzUrTkI3dVN6VCt3bitVblBxQTRLaXBrNkdmb0hQS0Jp?=
 =?utf-8?B?MklMbWhDdjgzQzJoUW43ODRuV1haMTErRlpsU1hKYzZrckRYTzhmL1VLdEFt?=
 =?utf-8?B?cEFVWFR5ak9xVmJ1dFhNRkZsV2pTS1h3akJkd3cxTjFLd2w0Yko4akJyWkF1?=
 =?utf-8?B?V2Q5Z3hWc29zM0xiWUhjWWRaU0l4YTlkUXZIYjUrVWU5THlETXNrbk9Edng2?=
 =?utf-8?B?YmxHeUVIdm5GblpVM1o4RnhkZkZ0c0V6YmJYUjF3Y0FSS3ZmbDBRaTNPcjV5?=
 =?utf-8?B?YVVwWUFCeC9yNnVZLzJhLzYwSmdzTWhYUnFWWUlOd3FJaHBSdEZQVDhmbm9O?=
 =?utf-8?Q?dJxMN6Uwa/xT3gZiUGL21NI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45650e7b-a939-45e6-0b91-08dce1208367
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:21:34.2269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3ng3uPLCrTQ6jGD0EcrqUJ5+imceRyg3DS/N3aU8qpvWk3fxYsOlfSn3ilWyS5hSScipv+saW5m4iVatega8HzqcpNifpfEcuabdTSUFUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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



On 26-09-2024 16:49, Ghimiray, Himal Prasad wrote:
> 
> 
> On 26-09-2024 16:41, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2024-09-26 kl. 13:00, skrev apoorva.singh@intel.com:
>>> From: Apoorva Singh <apoorva.singh@intel.com>
>>>
>>> Check the return values of the functions xe_force_wake_get()
>>> and xe_force_wake_put() to prevent mistakenly treating them as
>>> void returns.
>>>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
>>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 274737417b0f..317640554310 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -890,9 +890,12 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>   void xe_gt_shutdown(struct xe_gt *gt)
>>>   {
>>> -    xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> +    int err;

Nit. Add blank line before merge.

>>> +    err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> +    xe_gt_WARN(gt, err, "Acknowledgment for domain awake timedout");
>>>       do_gt_reset(gt);
>>> -    xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> +    err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> +    xe_gt_WARN(gt, err, "Acknowledgment for domain sleep timedout");
>>>   }
>>
>> There's absolutely nothing we can do with xe_force_wake_put, the only 
>> thing you can do here is:
>>
>> int ret = xe_force_wake_get(..);
>> do_gt_reset;
>> if (!ret)
>> xe_force_wake_put
> 
> This is wrong in current scenario. force_wake_get() fails but it still 
> increases refcount. So xe_force_wake_put needs to be called here to 
> decrease the refcount. I am already working on solving the problem in 
> entire driver.
> 
> https://lore.kernel.org/intel-xe/20240924121641.1045763-1- 
> himal.prasad.ghimiray@intel.com/T/#t
> 
>>
>> Also no point in complaining, the hardware may already be hosed. :)
>>
>> I believe that xe_force_wake_put should return void, there's nothing 
>> we can do except log the error here.
> 
> Agreed. Above series covers same too.
> 
>>
>> Cheers,
>> Maarten
> 

