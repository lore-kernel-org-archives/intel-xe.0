Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0E8D12688
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 01:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDFB10E0B9;
	Wed,  3 Dec 2025 01:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJxyGsbp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAA410E0B9
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 01:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764724528; x=1796260528;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TNeT6A9ZEQNl2AbyjB/Gv7Kf8tO9oVKg9p03uNC1J2U=;
 b=dJxyGsbp3zya5cny5IEBe9kq4X3wbqSfgBv89leoezjTwnTG3Uyaq+pz
 wMI+GO7/sqa8vc6AzcvznR41M4704y52NEaIG0DllajqaXkU2yWHCejAG
 0awFld/ISg2pcD/1IZSTawbgELWdNxwbGpIUxf79z5z1khpo3YbwGGezx
 98zfSjTDZ/Vs6/zMiZCK5OGBDxBP7XCAGbDvxs246SJfcKJKsXm7Lr7Li
 P4McoCyTwTaNC1EEIaMDHQVZwiru/P9cdgDI1cy59FNxuVGE0dievdeke
 Fbl6phupcDkAtpsiNG9v2cbqTBF6pvdI4i1dJaF/rIMRLDiS+MSB2Doth w==;
X-CSE-ConnectionGUID: +30GFMa6QpGCoePYBcmz8Q==
X-CSE-MsgGUID: KU0Ifc6aTnWl+t26zJn4SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78176359"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="78176359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 17:15:28 -0800
X-CSE-ConnectionGUID: z8E3K2+HTFG1CduicK5PCg==
X-CSE-MsgGUID: 5zTN2rShTISCEjYCUUFEuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194767640"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 17:15:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 17:15:26 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 17:15:26 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 17:15:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nglhZ7/0IAAqSoHeuk9HbBGvrgNSCeLlnOGk2yasc2woA7yzXUIUqso3yxX07ezmeYKrFlgTiGx56PY76GL96aZSDV8jlrvC2G6FrcNTjLE+lsINziiOcYQhMZwcUmusgAH5j1RMxaPZ7CiK3ph9OVHgH//IuGXHRymzw2ox/iZNgbz7/0Z6HBfMRaU4t6YR/cjYt2CaXHV28LXhFLsHZfHxLzcbu4Y6kmq+2u57HjmDNsxgPWo9HA2yiyHXcBEIG1gcWLBq61uaD0nRuIjrfPAGkGGEL09ZA8whlXkK9o7PA8GxrbJaafXJVf+SqUNL/g3F9WsVz5KkFaMKu83qrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ken57pudsvc+pag6XB27o5yk3nudO1GohDuyMNKBDYg=;
 b=DK3rwddAz4wDWDcUWkwNkSqHsnNbdDFnQks8y8mV4iMJcNf985RTYhv8IrGsKpcTdKw4iAiXYXKHBSFfOyS4gvG1b2Cx5huL8pK7pPrPKp43bjilh6A5RLe1hcCc0avrMDnNc3h8DNdkL3AtNElaad+Tjl96BFzQxvija+y0oviX1u2L7iKK0xpdUC7n9wdYv0AZqleKfMNNKwVN7zmcjCut/5Qgrie9jIvwY2c/oP7u3gm0BpNp9j44dvimmo6u/w0A/LHS8xqjm4kCTneMpEniBfPciwT25cDUVxhLm+492F26bOWusjdC7muNeKmgmmnqGWpYx4qgW6RpcDg7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BL4PR11MB8799.namprd11.prod.outlook.com (2603:10b6:208:5aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 01:15:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 01:15:23 +0000
Message-ID: <38576e5f-277a-41a8-b55e-54633971b902@intel.com>
Date: Tue, 2 Dec 2025 17:15:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/xe/sriov: Initialize scheduler groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-14-daniele.ceraolospurio@intel.com>
 <0254302e-35cf-4721-84d8-d0c95c2e6d62@intel.com>
 <fca9ea53-f64c-43de-8348-a3ba350689c0@intel.com>
 <0d646a89-2a40-4785-8206-499a9a32dcec@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0d646a89-2a40-4785-8206-499a9a32dcec@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BL4PR11MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4162e4-8e42-4604-47bd-08de32096f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3htY3NZR0EvUTNaNDZQdmlCRHptU0NPWFM3Snd3b3pzVVZpRGV2TjF5ZGZO?=
 =?utf-8?B?aENlbGZzclYvem94aXpGSzV3NXExNTJtV1dUSS95UFlaTVFYZmhhM0dpUGFR?=
 =?utf-8?B?bWhlZ3hhZU02clU5TlF0cnFvUENDcEpMWWZwYjhKR095TFBLSGhnRGsrdWhX?=
 =?utf-8?B?czBheFV6VzJ4bFBBMFVlZzVjandOYk1ZZmpxS0FXRGtqVFBnNDdlaGxQd3BV?=
 =?utf-8?B?dmxuNk1meFJvM2U0RjE2ejY5dFdldXZZalBoSzlRM3phWk91SkNNak1RY1Fl?=
 =?utf-8?B?ZUZFWmk0djRyL3EyeEtPeDZ2L1hJZWUvQXVMaDJsWHoxS0swRzJDaGxjK3Z2?=
 =?utf-8?B?dnVUVUlwTGVtS004dnNsRTVuNEFpYjRLZzhnZGVHSjJYemMxV1Nla0loUGFl?=
 =?utf-8?B?akc2RmxySGpmS1JiVzNzelNMVit2U1pLMWFrRGRvUm9LcUVycnl3QkpwTDhh?=
 =?utf-8?B?cHpUd1h3ZHIrZ2FYeTdwZElYWTFLWXZtcXlZcFFzcWNVYWFjQWpzNlY2K2w1?=
 =?utf-8?B?VDdkZzZCRVFxbXlDMThKQWZtd2ZhRTVudVQxUktuUVgySlZIZWJacUZPak9V?=
 =?utf-8?B?TFg5YldqNkVoWEQzSW9oU1R3UjFmbDI5TlIrVFFYUU14N1JxeitZR1pDMkJB?=
 =?utf-8?B?b2dsbVg0RTFjeVlQQlB6NmVuV0dHL2tka0tJVndtVUxuTlQ3enRsMnBJVG5V?=
 =?utf-8?B?dC9kWGFGenJGd01qV1E2UTZYdTZwdDN0TFpnWGtjSE5Ia3VBcTE1Q3FwTXFQ?=
 =?utf-8?B?aGZXRDRWQmw4N1RHOEpEdnVRWGh3eDlqSlZ1NDd2dXRwS2JPZDF4WisvMmIy?=
 =?utf-8?B?bEhpeDhKQTUwWkRxOTVwTVM5STFoc0F0emZSdHhiRXpUQ0tCcXNEQUpPRDcv?=
 =?utf-8?B?SGVNMm9ubVZwY3A2Y3JPOTNhTWlkaER3Z2xzVXVyclBJSDhEeXpCYjdvSU9K?=
 =?utf-8?B?YTJiczJ0ay9XeFpmNzNRYk1leHpvbGd6eWx4OHFiNHRZWUM4elVzaHUwRysr?=
 =?utf-8?B?cnpaSVJRWDM5dC9lMDBPeE1McjJxcE5YS3BFNitaaHB0VGs3a01sci9PMmhH?=
 =?utf-8?B?UklWM2pJcFpLWFZIOVFwaW5yWHVTOTBvK1NrOEo5N3pteGU4V2ZzMUhEeXVI?=
 =?utf-8?B?UUY1ekpZZUx2TnpMRTJKK21DNjRRelo1TzY0TDVZWGw5aE9MWDVFekZ1Rng5?=
 =?utf-8?B?bzhCTVlzcFRzaW9LQitEd1BkNEErQkQwTUNRMXN1TU52cHQ5b3dLQmlXc1ZW?=
 =?utf-8?B?V2NaM1NmM2tTTDlIMi9RZXFsL2pLM2U1dXhzeFAwZ1o5M1A5bGhlbnFDcU1w?=
 =?utf-8?B?a213UjNGd2RSbXNkaVBMYU1uVzlJM1dwdFN4VkdDOVoyTHAvNlA2SEl4cUJL?=
 =?utf-8?B?VGpnNGpIWXRXeDB3QUl1SjRCMUZsSG5GZTU5MGhqTEVic3Y3a29RZXhLRWNZ?=
 =?utf-8?B?UEd1YkZUMmZxUDB4bEg3T2owVEFFQlo1NkdxdmE4YUt1ZWdkWmFmRTVKMHpp?=
 =?utf-8?B?cTYyTFU2M2wrMnFvY0dPWHpSdG1kNnhMdG5TLzByaDIxRjFmQk50b0YzM0VQ?=
 =?utf-8?B?TDMvd0x1REdFNEd5aXRzaENzVzZKTm1oS1JkZTRhQ1B4WVI4cTlqSkFvUlY5?=
 =?utf-8?B?QjlXZmVvemErZXY5R2oybCtWNndtdFJCczlGYll6dXVLTFZPd1ZnN2JTMGVw?=
 =?utf-8?B?M2pMd2hZbFVidHNZMWgxTlVoQ256bG1GUE5UU2ZubmpZTURqdUxaOTFOUjhX?=
 =?utf-8?B?ZS9jZjN4YndPYThTL2ltb3VNSHpKZjFZSm1FRHZ2TmJxV0x5WFhVNzBKMThm?=
 =?utf-8?B?SXhVQ0h2MDRWSTNIR1NTaThYWDYvOVJLZHVOck96V0lhNURHczQrSWNaUW5v?=
 =?utf-8?B?MWp6KzdveEZEVXpTM0xFSU9zbkM3eUVuOVIyVTNPbjJqb1RtaEM2bE1sZnVr?=
 =?utf-8?Q?EBiuAg/0SuRkGaUIZKGraBxsHNRrgZK1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0Q3QU9uR1hYOEp6VytaakJOSmREQ09ic2dJOVQ2WVFjZldqZUkvZlFoTFBj?=
 =?utf-8?B?YllrUFpJRXJmUU5rUk9oaFRFTFprMEJ5ZkJRN0pjQXVsWVJQQncyK216OHlp?=
 =?utf-8?B?N0FSdG9XVlRWWjB1TEV5OE54cnJwb09EbDZJVVA3RkVFQVhvbksxMTBRMUhF?=
 =?utf-8?B?cEowMTcwa1ltTzF2cDd2Y3I0dFF4dkxhVDE2aVpTM0E4Zmg2andPaFpXdGZj?=
 =?utf-8?B?YkZXWjY4eHVtUDJFYnBPYjVqR2U1Y1FrSUZiVGZXTEpoS3ZmaWVKZGhKWDAz?=
 =?utf-8?B?am93Z0R6RlRzL3pvTmdVYXAvL3ZuK3diY29wbDJlZ3hMWFI0Q3Y5UnErRnhs?=
 =?utf-8?B?VmdEU0hYdWVnaHFaNUErY3lxbmx5TkNpRDlDd0NTWC8vdzYvbWhqcHducFVh?=
 =?utf-8?B?ejFyb3VrVVJOWmlTYXRxOFZ2UVhFcElUR0duTHhIL01XaFVuQlNhYjNmVURO?=
 =?utf-8?B?UHRwTVorSDVmMlE1OER6L0kzbE0yUjIweTJ3NnhXNUdBRmMxWFdXZVJDeFhh?=
 =?utf-8?B?VUduM2lwZjhFSm5pbHN0SFdxNU5aR0k4TnVOZ3ZrdUJqUCt5S2cyOEJxeE0w?=
 =?utf-8?B?V3c5RGNBNlhkWWVIeEdFSFUzTVd1c2lUTjBEa29VME1XcXBEZjhQckE1QzM2?=
 =?utf-8?B?MDRuWDZ1Zzl2K3MxUDZYUXUrQzJQdmJJYWhUN2lhZ2NsOFd6UVZQdFdUQ054?=
 =?utf-8?B?R29mWmlQNVQ0SzV0b3NEa2k2dDdwek9FV09tS1cyKysyckRFa1NrZ2hCQ1dD?=
 =?utf-8?B?NGsyS296eStNRHZiVis2VXBlM3B0cmJMWGxXRktKR2NkVFJsMDY0UnVMT3lY?=
 =?utf-8?B?dTBEUWh2ZnkzenFyZUg1a2sycXUrVlJ4cEN5eHR3bXNyME9EUk9zNm0rek9Z?=
 =?utf-8?B?WUpCSTFPK3VmS1dFMTErcUI4UFR1a2RzTFNTY2MvSnIwcFhTMmIvSTIxN2Rx?=
 =?utf-8?B?WE1Ga2lCV3ViWUYvbnlPbzdQR2xXZ3RzWExrUDlZWlRiZ3dJWXovOGF6SDN5?=
 =?utf-8?B?ZmdmNVJUYmViNXpjN0w2bUtpSHRnK2tLVUlqNlBDVno5WlhtVDRVNGRFaEo0?=
 =?utf-8?B?dmRBa05TcVZBaStqc002bHpscjRSVUxvSGU2dzQ2ZXNXSkxQRWYrUHR0ZjZs?=
 =?utf-8?B?bXc0THd2YkpXaGQ5QUV0STN4NlVIejBFUkxwYU91MUNXUmFla2F1NFFBd05V?=
 =?utf-8?B?b0d3U3NlUHdsNlNXaVNyMGY2SnRrRTVtV0pvYm1YSmRnTjc2MHlsc3VyMVZQ?=
 =?utf-8?B?S2E3OW9oYkVqSmRGQmpDcDRtYWM5YnBTeWZicVU3eTBLWU9JMjdLbGpIZ3lB?=
 =?utf-8?B?cjY1dFhJSkc4VTJqMUFTUDNuTkIzbGZGK3dEbVFJMW8wNmJJTHZFUVpjM1dG?=
 =?utf-8?B?QkQzZXFGMHpXaFYzOVgzclI0UWFTMWgwc252dGhrUk1FSmRCVG95KzgwTy91?=
 =?utf-8?B?dGNVbVR6aFQyV2tQdWU5OW9IOUcvWk01NExxSWdKVlRCeis1WXgwTGE5OGFP?=
 =?utf-8?B?QnpPQ0Z3TW4yUFRJeGJ6bEVuaHIyVVlqaEM2SE9raWJheDZzNTJWTmdHNFFt?=
 =?utf-8?B?aTFpZWNobjFPMWszaVQ2ay9MamRXNmNrY04zZTRybnBsOUlFUVRFb1RGaHc1?=
 =?utf-8?B?Ui9rOXR3Y3RZMTFPLzR4bFlGWFZud1BmL1FPSXhXVjMraTF6ZER4RzJqZWdJ?=
 =?utf-8?B?UVFhRzRPd3NBT1NQVWxMV0tjY3ZtVXlSeWJBeW1Kek1EQ1Y4cGYzeDZBVkpT?=
 =?utf-8?B?d0xrdEx4a2pZWU14K1IxYTlZeHlNSU4xc2k3Wmp5SXBHSmpoYWtuSTAwZW0x?=
 =?utf-8?B?TGMvdWNYTm02UUk5QWdlQ0NiWm12R3AyVVR3NFRmZnpoNytFMWRxMHk0WG5j?=
 =?utf-8?B?OEsvc2x2MkcyZkVVRms3VE1jYXFlSTB3cWErVzEwbGtyYi85WjhQdlp2SDRi?=
 =?utf-8?B?TzMwYWRrZmdxMnRCdU9HNFFqTVhYZmlSVHRGRXJ1L1pXZVpySlVzUkVyWWVZ?=
 =?utf-8?B?SGtydFN2ajRWSW1BeG16Y1Zuam9lMEtacWR2cGhHWU5xbzUzY2pyL1p0N1Jn?=
 =?utf-8?B?WGFPVmdjWXhOaHAwRE5yL1lKZ3dKL3VDa2JsdCtqZEV6dTYyV0hNMzhxc2RL?=
 =?utf-8?B?WWVSRG5iYk5DM21zMldMUlRMTEZBZG8yQTJVL2FPM0tFVHVndVhPSiszd1Aw?=
 =?utf-8?Q?WbQeLT7sFzs5WWX0v88j+/4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4162e4-8e42-4604-47bd-08de32096f3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 01:15:23.8018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yyGK2scv6fI98Fk6f+FfSDfwpZrp5s/AxDBgC+2igBmLr9Urf4MRZKIQuk0X33oF0xYYa49ljasAeOmCR2EPeUH+Q1jkF5bvAqwiCb2H3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8799
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

<snip>

>>>> +static int pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
>>>> +{
>>>> +    u8 slice_to_group[MAX_MEDIA_SLICES];
>>>> +    struct xe_hw_engine *hwe = NULL;
>>> do we need to initialize this here?
>>> it will be initialized by for_each_hw_engine, no?
>>>
>>>> +    enum xe_hw_engine_id id;
>>>> +    u32 vcs_mask = VCS_MASK(gt);
>>>> +    u32 vecs_mask = VECS_MASK(gt);
>>>> +    u32 gsc_mask = GSCCS_MASK(gt);
>>> we try to define vars in rev-xmas-tree order
>>>
>>>> +    u32 *values;
>>>> +    u8 slice;
>>>> +    u8 groups;
>>> I guess for those two generic counters we don't need to use explicitly sized int
>>>
>>>> +
>>>> +    xe_gt_assert(gt, xe_gt_is_media_type(gt));
>>>> +
>>>> +    /* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
>>>> +    for (slice = 0, groups = 0;
>>>> +         gsc_mask || vcs_mask || vecs_mask;
>>>> +         slice++, gsc_mask = 0, vcs_mask >>= 2, vecs_mask >>= 1) {
>>>> +        if (unlikely(slice >= MAX_MEDIA_SLICES)) {
>>> maybe this 'for' loop should be just for 'slice = [0, MAX)'
>>>
>>>> +            xe_gt_sriov_err(gt, "Too many media slices (%u) during EGS setup\n",
>>>> +                    slice);
>>> then after this loop we can have asserts that no engine instances are left behind
>>>
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>> +        if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>>>> +            slice_to_group[slice] = groups++;
>>>> +    }
>>> like this:
>>>
>>>      for (slice = 0; slice < MAX_MEDIA_SLICES; slice++ ) {
>>>
>>>          if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>>>              slice_to_group[slice] = groups++;
>>>
>>>          vcs_mask >>= 2;
>>>          vecs_mask >>= 1;
>>>          gsc_mask >>= 1;
>>>      }
>>>
>>>      xe_gt_assert(gt, !vcs_mask)
>>>      xe_gt_assert(gt, !vecs_mask)
>>>      xe_gt_assert(gt, !gsc_mask)
>> sure, will change
>>
>>>> +
>>>> +    /* We need at least 2 slices to split them up */
>>> shouldn't we also check that each group has both VCS and VECS?
>> It's not really necessary, having a group that only has a VCS or a VECS is a valid scenario. For example, the main use-case we have right now (remote desktop) only cares about VCS, so not having a VECS in a group wouldn't impact it.
>>
>>>> +    if (groups < 2) {
>>>> +        *masks = NULL;
>>>> +        *num_masks = 0;
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * The GuC expects and array with GUC_MAX_ENGINE_CLASSES entries for
>>> typo: an array ?
>> yup
>>
>>>> +     * each group.
>>>> +     */
>>>> +    values = drmm_kzalloc(&gt_to_xe(gt)->drm,
>>>> +                  GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
>>>> +                  GFP_KERNEL);
>>>> +    if (!values)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    for_each_hw_engine(hwe, gt, id) {
>>>> +        u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>> +        u8 entry;
>>>> +
>>>> +        switch (hwe->class) {
>>>> +        case XE_ENGINE_CLASS_VIDEO_DECODE:
>>>> +            slice = hwe->instance / 2;
>>> hmm, this seems to duplicate previous loop where we had:
>>>
>>>              vcs_mask >>= 2;
>>>
>>> maybe these two loops can be combined?
>> The issue is that there is an allocation in the middle, which is required in the second loop and sized based on the results of the first loop. I could always allocate enough memory for all the possible groups (i.e. MAX_MEDIA_SLICES), no matter how many there actually are, but I'm not sure if that is better than the double loop. I'm ok with switching if you think that's a better solution.
> if you can try, then yes please, but if that's too much - we can rework this later if needed

I tried this and it ends up a bit ugly, because in the first loop we 
have physical instances masks, while in the second loop we need masks of 
logical instances. To convert from one to the other we need to split up 
the physical mask, get the hwe structures for each engine and then get 
the logical values from there. I ended up with 3 nested loops, which IMO 
makes things much less readable. I'll stick with the current version for 
now and we can rework later as you mentioned if needed.

Daniele

>
>>>> +            break;
>>>> +        case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>>>> +            slice = hwe->instance;
>>>> +            break;
>>>> +        case XE_ENGINE_CLASS_OTHER:
>>>> +            slice = 0;
>>>> +            break;
>>>> +        default:
>>>> +            xe_gt_sriov_err(gt, "unknown media gt class %u (%s) during EGS setup\n",
>>>> +                    hwe->class, hwe->name);
>>> this also seems like an attempt to catch our coding error,
>>> so plain assert should be sufficient
>> ok
>>
>>>> +            drmm_kfree(&gt_to_xe(gt)->drm, values);
>>> do we need to bother with this kfree ?
>>> it's managed allocation and any error from here will lead to abort the probe anyway
>> will drop
>>
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>> +        entry = (slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES) + guc_class;
>>> redundant ( )
>>>
>>>> +        values[entry] |= BIT(hwe->logical_instance);
>>>> +    }
>>>> +
>>>> +    *masks = values;
>>>> +    *num_masks = GUC_MAX_ENGINE_CLASSES * groups;
>>>> +
>>>> +    return 0;
>>>> +}

