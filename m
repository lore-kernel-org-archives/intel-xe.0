Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC3CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 05:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A435A10EAFC;
	Fri, 17 Oct 2025 05:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC/NGARS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF14710EAFC
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 05:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760679931; x=1792215931;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CZ3wLYKYKDSRAdVBOVtqYvUr+J6aF32xn11iqr6bN2A=;
 b=aC/NGARSfHkz9y7OsOksn+/t+XpHDenNcnlLOccNxqm7d0BFKHX4fnX+
 UpPcMu1FIhvTOF2TvBSO3O2ddNairAP4btzVX95Tzy86KG9HuoHkIkM6l
 F1FOsrmc2bQ4hSBj1q9r5lqFHssB6CO5wzJK0yYXtWIXolq/2hw5aA6Tt
 heJmsXoz/RxabMOK8p+cZOjnTZ2ZgnM2J8mNwIDR+iWN8jej4acCMjOil
 Yh3vjFdqq2NCduTcqCEGZ8OVhYPMJXwOVqxSmZeaPtwA3n+1dRkjpY9Fc
 N8FggXb67RZqJOcovWlCSrmizyKVQMdEgXzwgc+aro+0/+J8f3EJn1T/B Q==;
X-CSE-ConnectionGUID: 0D8UvNWfRtCInNWqjThipA==
X-CSE-MsgGUID: wp+LXJrgRH6Ov831ykcHww==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50451902"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="50451902"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 22:45:31 -0700
X-CSE-ConnectionGUID: L/HGCdopQHioYVk9J+kGYQ==
X-CSE-MsgGUID: aAwbQahnRWaH8IMIKKs1eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183055529"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 22:45:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 22:45:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 22:45:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 22:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QM+Bvm4S4zwYKv4GErwUfwunrMqSkyM7b5dk1lYe7slVf5JDBpuu+x47pl/K/o8vXX9RiBQPyeEPgxjHLwa4wvLv3I9YH5zKwT4giqV7VF7YpBxbwBX73nZxzI4XuwxRpaMzgRAe2Dx/+6s0bikPBTqewqBCAJ0gknI8UjU6gpb/V5Wk3qGLaOHKVtWPaGMbOQr8xMLu0/eCD7BgGjhbMw/hCeAseZZgJNhfSVMEWXjLMgX+CDVBqj110NVnI1EusLEFfU8hlvfJcoyDW3i6dZVRtPjyYcDhodYsS1FSkUALBg1nPsrIxLoPGb0VaZn73H9WWLLPBEPjKlG3e8NmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkisZHfqqb7be6zjydRusn3Q+Xk4vMbweg32jZP5ZIw=;
 b=PQrfaC9UZke/R7RKGaIJtTzuOKDcjfogzdsxfxuizlY+dXseFzyRplSXLxdAcD3CGFiP0udydjvFmY1ngGOx6gys68V7LXFXYfR9qSwG5ufJzdEb4+9IuUisGG/UokQQvYR/H3ZXxDgazSLpws89PIwSPL6HOGsQRMu3XrBYyGRGmsbJvs0h2IubyZOJIbkGbX0YKgrc/oXPCPABHhZUNIYYHAp2+9TLxp7r1vpZn39+VoKwc+E5in/fHZC8IP473+ciG6665r10a03sWIPbeR8PRJH/S2yuygTJGQfniVk/PodORGXAnadRu2f2/T+UVKoJu/3RaqI8JFPcsJuqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 05:45:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 05:45:21 +0000
Date: Thu, 16 Oct 2025 22:45:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v1] drm/xe/guc: Change outstanding assertion to error
Message-ID: <aPHX728qFlSgfvsf@lstrano-desk.jf.intel.com>
References: <20251017004654.1490644-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017004654.1490644-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: d886055b-521e-4692-873d-08de0d405c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGVMbzlmazAyd2x6ZEFZMC8zcGRpcFhiSzVJODU5Uk5TWTJDZDVCdm8rKytH?=
 =?utf-8?B?NE5HakJkc2s2SEtmQ20wck8vM3dmQ2VoejR3QmpUbG5XUmFKcS9OQStEUFo5?=
 =?utf-8?B?eTFsWEcrR1NLTW54ZVBwaXNwUjg1ZzcyY3dRV0dOb0YvcGh4ZlR0SnNCVnZ5?=
 =?utf-8?B?M3pwcWFrQjdXd2dQNVYzM05HeVVnZW02UTNPM1RTU05FSWhlM1d0cXVKWG5Z?=
 =?utf-8?B?ZnNtU1puMlJCNXp0QnY3RHFZM3g0Vk9pVWg5NzBydEJiMnhUSGZZU0IxOEYr?=
 =?utf-8?B?cnRINWJuekNlM04vTmQxOG4xMVFpVmJNT1hPRThidnVkcCtXeklKNlZPUWI5?=
 =?utf-8?B?cjQwRGIwUGhXbS9rU1pockk3TVhFakJFeG9tdDlQQThPMU1zSUhvRlBHcytp?=
 =?utf-8?B?Slg3eC9ucldraFZWTS9yVFlnT1YrcnV3bVBXdGpUR3pPQ3A2ek5zVE1IUXQx?=
 =?utf-8?B?b0Z1ZlQ1Q05QdHpIR3BpOXRsSGc5ME1oeStKTDRmZ1Y4cUVqY0x2NDVQSmxq?=
 =?utf-8?B?Q0Y0QXVQMWgzeDNzMG9iY2xCa1ZuSlRCekFxaDlGM2xLYkphb2hIWFdsdEZL?=
 =?utf-8?B?eWRkNFJvTm12Z3lDQk53bEJNVi9MZTVTU1I0eU11bG84NlY5YUU0SDMyOWNK?=
 =?utf-8?B?SVNJMmMwdmozQldOUDl0OFVQRXpMZU51SWxDSGpNcVZtUmNXcVcyWWFpUU81?=
 =?utf-8?B?RkFYd0tuN0xvZFFNektXQlZCalFLM0wyeFc2eE0wUWtWVS9zS2VyejRtYUcz?=
 =?utf-8?B?YStjK2RUL0MyNk1HMTRhYnNnaHh4MEJBcjBtSjVVVFhpN0lyMktRdGFQMzFC?=
 =?utf-8?B?c2l4ZFlPSlZrSlFwOWd3Z2lrNytGeXk5blFCcXRIMXY5bHpTQnFxRjgzK1RG?=
 =?utf-8?B?RDJwMGVXenlxTXA0TTFNZWFSWVVwYVJpbk9FNVE1dVI1SnZ5dFUzU0pHU2pG?=
 =?utf-8?B?TjJTNEVsR2RYWFRCdGkvSkJrdFBCdHkwVlBWZitGNFlubGFrdjJ3Q2h2aGps?=
 =?utf-8?B?VEFvZTZBdURhSy9DZ0xhMlZMdzN5c0Z4bUx3NElkOTlPU0VNaUxXb3ZtMVRk?=
 =?utf-8?B?dVlWd2dnZ1B2RE9Jc1JRQWk1MUhlWHlwZ0NwU1MrRENwMlRxZjRDb0JPSGQ1?=
 =?utf-8?B?OUg2SnRRVTJQeEt0YWhjcjJoQWdxTHBFbzVVR01DWkRTY1dWMFFudUF5amZC?=
 =?utf-8?B?NlBRbkFDWkNwT08zdXZ4REVmeERTYyswRzNWcEpvRWtlYUlKWEh3K0owanI1?=
 =?utf-8?B?Wm55U0Rja2tTaWhlQmNJSHp2UHFKWUpScmpMUGh2bWdTczlxa2VNWUt1NkVt?=
 =?utf-8?B?Rk0xd0pGSzVyZVFndmxXTVJ6SEg3a3ZEODNhUDFOcU5MU3FCR09LN1JSeUNY?=
 =?utf-8?B?ZEtFZE03SEZxODJXOWxTRmFtcHc2MGRMdVFuMUxqUzJOOEVUYjRPeW5VeGgz?=
 =?utf-8?B?bEV5VnlLdGJZN0xPQUc4b08rb2pEWE55NTAzRkZDOCtzdXBMcTBLTFVsa3ZL?=
 =?utf-8?B?a1FvMmNKS2x4VE5BTDJCa0xyRW0rd0gvWGU5U3M0SVh6ODY3eCtjRmFRcmxP?=
 =?utf-8?B?bnVJRGVBNFRlRUlkRGFqaG9zejZ2STVLYkpsRjhyNVRxS0V6K205L2V3VWo0?=
 =?utf-8?B?MFV0aSs2Tmg2RlpiTXNOQll3T1VJN3VESFhtTkZVTCtiOUZqOVBYOUFTeDFv?=
 =?utf-8?B?NzRvQTBEWjlEZnFVL1k1TlZJOW51N0VkY3FrbzlFVlBJOEJ4WnY0a09GWGQz?=
 =?utf-8?B?amlsR25QV0IydkVOZ21XRkRIMW5uRE1Na3VzZStXSTdLRFJCc0p5eUVieG5I?=
 =?utf-8?B?cFQ5VWJoSlBaUVlrTU9lRHdMbUN0VG5rR0Q4SG5nVlczN2xKci9hWGkxOHJY?=
 =?utf-8?B?dFhFc09OOExjY0t1Z1p6WGV6ZzlxdjI3L1JZN0hKOGJtemc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S055aGhwSjhpZjFidXVpYjE1cjBGTVBXSm9UZUhsRURiYkRzUHl5d3ptOUpv?=
 =?utf-8?B?ajdROXYwKzZiaGpaNDlMYzJVVXF6SDVXZnoxeHp2NXZUWGxwbjNEVW8xVHYr?=
 =?utf-8?B?RS80TERZN3RtdUhBaEtkbGo0dUNla3RMejFCQXRzRThxdUdtalQyOHljL3dp?=
 =?utf-8?B?RFJqR0VOb2pUOVIvNko1b2ZJaDZXTWZLUVZGdXpnckF4NG9zWjF1ZHNZTlU0?=
 =?utf-8?B?WGtmVTJNcXZ4YU43NGJzdXRZQnBOMFBvYzJDMkRqVkJmUEJmQy9JcmxoWnll?=
 =?utf-8?B?QWw1dWhQZlFUMkNqVzMvdUhaWVM0NHpQeGhZaUlUb0hXc2FZSmIxQVRwcWhD?=
 =?utf-8?B?YWVpNG5rdkVYNFR5RmVVdjBCcVRBV0svRk9uVzRXU1hEcWZWcFlIRmIxWWxz?=
 =?utf-8?B?Y0E0OFNGNkJzZkFhUGtNNHhQUGEwczc3cUtYU2ZOVFYwTTRheXFLMm80VXZC?=
 =?utf-8?B?Z1JuZkZBcmNoT3AxQS8rWkN3d2dYWHdvMXZaRlB6Mkl0TGExNUN1TkdoNExl?=
 =?utf-8?B?Q1VBcFFYTW45ZnBWeFF6RW1CUjQzak5yOUFRaWdQWnNWNFkvNFN5WlpiVWxq?=
 =?utf-8?B?ZEJBRDltSGhlam4wRktYcDVtNDF6dmFUL1IzNWpUSzdqUkhLUENJRVZZckhD?=
 =?utf-8?B?dEJCU0VXOWNKdVNpNTVidVRZSUxPOXQyejgvL0lGMVFwQTZUTU9Yck85eVRQ?=
 =?utf-8?B?dFNIZC90T1dwMmd1TWN5WXVuS3lZblpxbzdPVUZPYU04aWlMZEpRNFpnT2JM?=
 =?utf-8?B?QU1Ba1RueW51M0JYTm9saFo1THBWbE51ZnBzemdNWXF4NkxsNXFjZUEwNlM5?=
 =?utf-8?B?V0RXRkxzWmN3eFdDaWVMNzY1Y3pwTzNYdndNMUNqak1jdXVjdU80SklzZTgv?=
 =?utf-8?B?RVV2djlGOFFBQWw1VlJDMHNJaHRXTHYzZXVpWFJ6NzIvNThvT0NUc3RJdW1l?=
 =?utf-8?B?OGovaUhDbFBJYVNxOGVXaGwweWdqUnkxeUllSkM5Yk5xVTNKODBQeWZXZWhY?=
 =?utf-8?B?T2FZSkZiTi9EWXhBR2Z5bGhQY3pZZ1VlVEZIU3poZVJYeXo1RThnbzU2eTNM?=
 =?utf-8?B?YjdOUlEvcXFwSmlvYWcxblJGVDBZaXBudlJXVVFOMzI2NEwxRkxIYlBtd25E?=
 =?utf-8?B?N0xXSTgweXpWUGFPMnhBVFR4cjh3d09lbjVoMmt0ejhhSVoraXNIeHFUZ2lB?=
 =?utf-8?B?M1F2a3hiREJWTzB5S1JrNEpIYld5T3JrcUFqWlpCSVlJa2swUkdxUzNZcEdi?=
 =?utf-8?B?aEwvc0lCdnlyck5rWnI5NFNadzZadHhrTlZFRkFJVzlmTEo0V1VIc1E1VTNI?=
 =?utf-8?B?WkZEOW5SUE5nN01XWEFSUXN2SnpDbmx5RjRhSyt2WVpxOHZ2RWlyb0M3YS9R?=
 =?utf-8?B?ZFM5TWJNSzRSWnRNNnJ6aEtBWkVRN1R1U1hLQUQ0MlZkODNqT2tSY1ppUW12?=
 =?utf-8?B?aVRUZ1poMDNZaXJmbld0NTFuK2JGM0NLRXJsak9YTU1DcHRLS1MyVGJJdXZG?=
 =?utf-8?B?NjVxQmhhSEF5S2RHTEREbW1CcjNNZjZBbUxTcXdodnF3VG41bFRENVFiQjRP?=
 =?utf-8?B?MmlIZGF6VEprSkd1c2xrbmhUTDcrTmEyUHIxWWtTUjlOYjcrWGF1elJCM05Q?=
 =?utf-8?B?WEY1V1U2ZFh0REJoZVRQZWhXQjNBYlRzVk1VQXJYNGdtc0E0Y3BCb2hjWm0z?=
 =?utf-8?B?VEl1RWdIMzllTHNXQWp5OWw4L2dBc2g5eTQ3dUZOWG9mRHBzRGcwVGtqY1lC?=
 =?utf-8?B?TFVxczNwVUlLRmJDUUg3UHEyek5sNnc0anh3cGwxb1BmcU8raG1Hd3I4eFZB?=
 =?utf-8?B?OG1NNVpOc0hraVBzVnM3Ymh4c1l1UXRaWmMwbEtqb3JoMlIzTkVWRlNLRHFT?=
 =?utf-8?B?TGszZFdNSmZpMTB6L2lNWnZJK3VKRDc2NU04T0NscDFIZFpTSkhPbnltVElW?=
 =?utf-8?B?OGU2dFkzL1d4b1J1YldyNWVWbG1iS0R4RUNVbHhyNzRJOWUrd3pvVllnU0hE?=
 =?utf-8?B?SnpZY0R0WGNVY0h3ZWNDaHJySVBPVm9uanN0SEIrMVg5TklSeU00Z0NJdUhX?=
 =?utf-8?B?b05aVVhpSjJVVk5Kdk82NWVFcytFaVhERk5acDRwbkZtbjBweElTTkhqblc3?=
 =?utf-8?B?cExZQjI5Wlh3Q1M2NXlBeTAvNmdnQWY2dXhoMWkzZHlnclVpMC9JdXFRcTlx?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d886055b-521e-4692-873d-08de0d405c9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:45:21.9097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMfgtRymNRQAQ5JamJ5vMFTGnuP9h1Og4VIlFGzngsnNaTyiuKm9YoHzbh/u6FjmsZcPLEdNjqW/El9Ua/cNow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

On Thu, Oct 16, 2025 at 08:46:54PM -0400, Zhanjun Dong wrote:
> GuC CT layer will check GuC to host outstanding counter when changing
> state, trigger assertion if the counter is not 0. However, the failed
> assertion is expected on fault injection test, change it to error to

Is this expected, though? I know I added this assert to only allow
transitions of the GuC with G2H outstanding if moving to
XE_GUC_CT_STATE_STOPPED.

For example, this is a valid state transition when starting a GT reset
or migrating a VF.

It is not a valid state transition say on a normal driver load which
this assert would catch.

I see this error occurs during a device probe failure. In my opinion, we
should ensure a proper state transition from running → stopped →
disabled to preserve the intent of this assert.

> make it works with CI system.
> 

I'm also concerned about converting the assert—which includes a stack
trace—into just a debug message. If this issue occurs again, we might
not have enough information to properly debug it.

Matt

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 18f6327bf552..85416db1563c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -436,8 +436,9 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
>  	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>  	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
>  
> -	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
> -		     state == XE_GUC_CT_STATE_STOPPED);
> +	if (ct->g2h_outstanding != 0 && state != XE_GUC_CT_STATE_STOPPED)
> +		xe_gt_err(ct_to_gt(ct), "Unexpected outsanding counter:%d on switch state:%d\n",
> +			  ct->g2h_outstanding, state);
>  
>  	if (ct->g2h_outstanding)
>  		xe_pm_runtime_put(ct_to_xe(ct));
> -- 
> 2.34.1
> 
