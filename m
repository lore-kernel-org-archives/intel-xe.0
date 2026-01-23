Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E991D7788E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 17:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD9010E2D5;
	Fri, 23 Jan 2026 17:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MExuR1cr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74E010E2D5
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769188381; x=1800724381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=abk/+BZ80fXZXeIGLwn2ndr2xTnD3ZD/+jNOR+LbM3w=;
 b=MExuR1cr+0sAAmxrF4v+vGZRuqIFF25BEgzRSTv9hFljmH1cWK9jneGj
 fKD0gMv6wPEyjM43XQNfJCGbqd7h/GedDfcymF5+SQqm8AqvGwxc3WPxJ
 vv23l4mnS+fb6Nbl6TDfZKcUhCt5BP3W49K82E2q7awYCuOdqCWTl8lEP
 +2gjf4W7Zb5KnezynNkUiPEhA0u+voRuoDFkAY/Ki6H9RiJzMdsU4s0K0
 GdYWu6za3dhnjRWxkQPREX22DWKVH+tyX0HmANPcpgt/BzzU+/1iQsh/K
 ySgEAASTJ0bikTLrXobSdCFJtAvfQ7dJdjtbbHUE0BOectO/Ife9/rXy1 w==;
X-CSE-ConnectionGUID: 1o3vY/fESw+9CUkiKTKMbQ==
X-CSE-MsgGUID: oslBpjANS2eB8ZdAiGJo1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70532730"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70532730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:13:01 -0800
X-CSE-ConnectionGUID: OfidDll1Q9+70VqJXqSLog==
X-CSE-MsgGUID: VYEcXVywT36xHD3XQNEhvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="230032090"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:13:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:13:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 09:13:00 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:13:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkXebCAyfsuL2W+oAyQAhF+4Yjnf3u3mw2lj2UmQ6cY9JRMb6j6KIA5wnx0PIX6oelBbb4ynbsM39mqzXgHxmRbIZUuhlxnksDVrB/eF3hfbX8ga93cakPGp9AC63IxoSa8rpjEmL5D8N/z9OvUEQoKZ1mipm5dejvpF4oLb/YpSZcv+d+1DyazcnD3yDtSCqAkuLG3AjLEm/TFrKM1qqZguoA6r0arCRrtT/npn4xdPtiTOMNgJciKkAmQWpv0IzXJaZosyOoHJXu299WwxojPjbhii8vpyAt5ENxNPIXgNU7839FN5yW7Wi+JP5jXB2p3V8Np7HDpojVkKQ3IFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2BJHSc6X38wNHQAZUCGZ534nYwz4mO5ga/w5t7F1SY=;
 b=q7mQpdSBFAQ3Gm+9kAt0o8JxCNfWLT/K4b9hdGQ4YRylC/9iiWMOohSBOFoM8vWthVsRSOD4SDCr8CA0wgxFHFKF8o6OHk6fISyT1195D4s0raJAcuQo9uoHvR7LUiuvJHsnN8ICz09yjhMxJ7GGl7BxAmI8AadrtAgeOVJ+TR72AOMOEZXmQYwYjJo8J3sMS1LL6IEusAdLwADfw3PkD5PLN72Qk21Ib9FbWpD1x+SJoR7Y827E6IbBo1luUBgiaZwVrNVvkXC9Xgw+vm9nUR1DuXSK4NAePypyxXlIDgGcHtOWZtlJwo8eTHqVpJvrXlyDXDWCw3gx41yEZcE4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 17:12:56 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:12:56 +0000
Message-ID: <73520ae2-967e-453a-a7ec-dfa0b2d6a080@intel.com>
Date: Fri, 23 Jan 2026 22:42:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260116103451.304716-4-sk.anirban@intel.com>
 <20260116103451.304716-6-sk.anirban@intel.com>
 <5d9b546a-421d-4006-98ea-a2e930f935fe@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <5d9b546a-421d-4006-98ea-a2e930f935fe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0224.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::16) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f0d83d-3efd-4b52-f649-08de5aa2a6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ampPYXFrWjExTzdNWU5waWxheUtXRlhnblhQTzZmUGRNZ0pIL0w3TkRwdGRh?=
 =?utf-8?B?WmcvQnh5SVkvRFNKeHVDV3A1RUh0UGErTWVyR2krZVhXU2d2YXNuZmFJZlBk?=
 =?utf-8?B?SWhwbnU1K09lNFY2NWRoYXNjNE9aSDFDdm1sQVdFVDVIL3lpU1J6MUtSSzli?=
 =?utf-8?B?NUttTVR2QWxBcTh5b01iejI2R2tYM0loUXBPajV5YWtqc0xZR2pxL1c3ejVB?=
 =?utf-8?B?K1BGZUdzVGY0SzRPSzBrMWovWDNLZDBycFRGbmJxQXczVWFYbmJsSmpQcCtY?=
 =?utf-8?B?SFFGRWZybEJTNUpIbnFjaW1JMm45elFWb2c0WUhTZHN4WXE4RHl0S2p0b25X?=
 =?utf-8?B?NnNlMFIwQ05SUW4yTmtBVE1nM09xN0hRVVBMWDNDZXI3MzlpRGRNU0E0VXRW?=
 =?utf-8?B?eGNIeDhNME8rbjV5aGlwc1g1RWR1Tk41dFB2bU94RnBTeGgvRGo0OFlyUGR1?=
 =?utf-8?B?WmZqT2VPcGlvNVAzZ2VxYW0vWjZwRWVtK3BubC95UXdqdUlpeC9Pb1REMEdR?=
 =?utf-8?B?KzZSaHAxc3E5Q0VRVGdSS2JIVDRaR0FYb3RFMU5VWDhja01IaVZxZ2F0dWRn?=
 =?utf-8?B?NlJVeEQ4K05nYjliUFZuUkUySk9vRERNanF6RlJzdGl6RXRTNWNWRndVNU8r?=
 =?utf-8?B?WW53TFRKNGlCWkdDM1hRemlhUkV0WHZ0aU9lUGVGZHpFa0hhbmdJRTUxaHdM?=
 =?utf-8?B?U0hxRUN5TUM0YiszNUVpRVdVM2JXVHl5cUVTQTN6N3ZRVGgrM2U0dTE2SzE1?=
 =?utf-8?B?N1hsV1lRcVJZeXNsdmxuQ3I0Y0V3d1hnaWFVVDdpTEg4azBaUWV0Y29xRGxj?=
 =?utf-8?B?bXNjVE56bXlEblhWMHplakdOb1BLNTFvT0JrbDdlZmpuSHY4MzBVSnZCbWRO?=
 =?utf-8?B?Yy9sNmxZeUtMa1pCdU40TVc3dzJRNXowYitEa2JBY3hiazdkZjcxSGVoY2cx?=
 =?utf-8?B?QUpYcmhNc2hQRjRGdVRSSjIxV3UycXVDQXZQR2UzSXcrbmZVbmdBYzNoclNZ?=
 =?utf-8?B?dkV3bkFVTFVMaTVyWGt1NFRRSVZYcDRRUFZWT0VWVjMyKy94UVZZS3ptaEkz?=
 =?utf-8?B?RndaSEI5OTFPRTdGbG5oR1lRME1ZQTRWSWxGdWdkSkFBSSttanh0V2dqajJo?=
 =?utf-8?B?cVZtR0xObjJIVHREbUxIbmlIamsrd2xnN3dKOW9VQ1o0TXFYVVhKK2owWHFP?=
 =?utf-8?B?ZklaZUY0M2V1MldEN1A2eHRkb0poeVdoZmIrUnBOQzR6K1psZUNqTmU3Z2FX?=
 =?utf-8?B?UjAyQ2FvN3hrdzVzMm1wN0YvaUYreVYwb3lFWVZkdHgybjhlN1JkZHNROHJ3?=
 =?utf-8?B?M05SM2lvbE1PV3cwS1dCcHFkNEkxZ0tMbkZCOTRkS1pFNVA1UFkvMGVXaUhG?=
 =?utf-8?B?NDdqbCtISHRacHVXWDYwUzloM1NKOVdYNEFVd0k4UG45aUxOdlc2My9LRkhT?=
 =?utf-8?B?SzJHZnZFR2QybTl2eXNWVktjSlRJeFZCWTVQaFRZcDIxWkJ3Y1Fnb3dqUzhM?=
 =?utf-8?B?RlVaUjJtOC9uNCtTdC8yT0VFb2VvcEh3TWkwUXlWL2VGNUZMYXlXRVJBRktE?=
 =?utf-8?B?QVFQc2h3eHVTOGltMTZxTHBYRXB3YWxVM0VBdG5PdGpWb0xKa3h3elRyTGFO?=
 =?utf-8?B?VS9KMXFqN3Vqb3hiQlU3aTBxeEhmS01zQ05VSUVIL3Q4ZXFaSG1xbFQ1VFVX?=
 =?utf-8?B?aU5iQzR6QndPek0xYS9tMUNLcjVzQUl5ZzlkM0FjSzhjUGtaaEFUVFFkU0kx?=
 =?utf-8?B?NTRnN2lLdGNxV0k2bUJ3amJrK2VQWFBIdS9vaW1lamU1OXhzSGRHUDQrNFBx?=
 =?utf-8?B?aXB6d3ZGci9CcGJ5TEVPUkE2a1JRdElDZzdrandsU2poak1VK1Jad3NpKzNI?=
 =?utf-8?B?SnNLVjgvQ0xxV3hJa0tZRUd5Q2FBQ3d4QkZZWFVOTnVPdWxmblN3bUZBT0Ry?=
 =?utf-8?B?cVdSUTdyZDlURjhGRndFNGhDbFpkN2JQYi9YbzR1QlcvamRIQnh3MWZISVIv?=
 =?utf-8?B?M1dxWlRMNHFsc0pEeHAvcFpnWHdwNlhNSjkvaVpObHBNRU1YZzY5MzlqMWNP?=
 =?utf-8?B?VlNReWVGbmQreTNwak84SkxwdDhsYXFQSjlRbXB0SVpDYzI3ci8zNEczQVFS?=
 =?utf-8?Q?CuZU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFVoQWxxRFhaWmRYdHZpSjBMcTZjeTdpZGRoSGlvRmVMamllYWVtUUJiamw2?=
 =?utf-8?B?c1VRcHQ3MEdkd3lnRmYyZGQzR05YdUpQV3JBakRrV05tREExcGhJMUZIcnRQ?=
 =?utf-8?B?TWVXbVlleGJteHJGTU5NaDBUdnNPMzdHMFBnVVBjY0JvcGVQZ1lTNmg3R05h?=
 =?utf-8?B?WXhudVFoWUwwWElaQkNSQjd1VGZKNnlpUmMzQm5RcTJORFgxanBiRkVQS1lm?=
 =?utf-8?B?TkVHV3pIQStlTWg0cDdWR3c3YlZlWExIVS9QcDFNU1RsYkRuTUJJRG9qanZz?=
 =?utf-8?B?R0FMVDJjb09taUVXTVVldjZjWUQ1TVMvSXBSeUphWkcvTWdCbmhYd3FkaVkr?=
 =?utf-8?B?Q0NzUnNuUDRNWVZENEMzQXZrU1hadDRSZGpBQ3Z4cGhGSkY2L3JlbVVIUDEx?=
 =?utf-8?B?T1JOQU5abWJZTHJuMkhmNGVkOWRISGkxZWRwTS9ubWhEOUZBbjBUK05QbTZ0?=
 =?utf-8?B?TFR2Q2dhUmNscCtUak1RcW9KMFRwMjdFT2NjVkQvS2QxMy9Xd2Z6S0NUanFO?=
 =?utf-8?B?SzMwa0dFMnhYQ3lWNXVjY2pqVnkvM1BTNW9sZ2Uvc1k2S1E1Q2szRE1NZkdJ?=
 =?utf-8?B?WE43dFJlV2kvb3ZDWStlZDNoQXRObW00ajErU0cxMnd5VUV4ZitwaUlDMzJF?=
 =?utf-8?B?dWU5TVJjdlpmUUp2N3NHcnFzNmdtUHozdFhicDVHUlVrek4vSnRHUW4wVnph?=
 =?utf-8?B?Q2xpUlZtVVg0aEU4WFUxYmlyZGttM2h4RnVQRXRNODF4NDFlOWliSHkwOGNN?=
 =?utf-8?B?VGhIK0RLdW9sb3JuTlNTcHBWVXJiZFoyeENsUGJqdGVHZi93ZzNDU2s5NGYv?=
 =?utf-8?B?N0tWTUI5TVFvL3RDcjNEVzRta3kycXJIblkwOXNxZ0hHQ2tpR0xyT3MzVnF1?=
 =?utf-8?B?NUhlcW83aWV2dlRvVTBiZzdyZmV4ZWNpOXorbDk5NTRSVHVnaVdUTU81WjI4?=
 =?utf-8?B?Z0Nab1FiMjlBZ0JFdmNGZ2pOZEtUZndlcmIxRXlzRUNpbmNFMkNNRWpjc25l?=
 =?utf-8?B?TUFFc2hqRU5kdGpFem9UTFpCU2huOEF3S1dxbE10U0ZSQndKWGk3RFo0WmdK?=
 =?utf-8?B?UHR5ZzByZG5RMlQvMWM2UXE3WU5zK2t1TGxIeUt1SWZHYjJkZjY5c3Q0UjJZ?=
 =?utf-8?B?bUxUby91VnRRYVNKcWJvbERFU2JHcW5IdkZ5dFBFZEZoUXJPZDhtVW5LaEhE?=
 =?utf-8?B?dkxPekRmU09TZVRjOC94Sy9QZlZobDFmczlvS2I5UkIyUENtOXdSZGdPd3dk?=
 =?utf-8?B?dVk2SDZ5QllTRFZtMG05T3FuYXhyQ1MrQlE1ZGVpdGhVRTJrVGxzZmJoQmhz?=
 =?utf-8?B?dFQzQ0hweUxDYXkrbnNoYkpYejlEWEtLVFE2UVFMU3N4aU00UHhSTkU4Nncy?=
 =?utf-8?B?L0RRVUtYcFFWNXRIU0hSbDNhT3VlN2VZUGZVeklkazVwZG9HOHJnSW51cVZk?=
 =?utf-8?B?aFYweXQ1eVlaV0s0aEVwUE9zQ3VPM1pCZVlPUVdzTkFRVGoyZURrQXVXRUpk?=
 =?utf-8?B?OEFWUldURnYrS3Byem43T2VVOGlOcjM2TUlJNFUwQXFuMCtzZU1ldUo1ckc0?=
 =?utf-8?B?L0pseXE1eDZNcHFVSURiVm13Y3RSTXdJWHRrcUhOSEdzMWpkbjEyUWRHTndJ?=
 =?utf-8?B?bk90WE11N1VZT0QvK1Qwd3AvQk5KZHhFUkY1OHcyRS9NRG5FNjNTUURZZ3Z3?=
 =?utf-8?B?dGE4WTlWTm1SbjRhRGE5MHh6clQwK2xveEt3dldJYjZ2T2lxc1JheEdwY0JH?=
 =?utf-8?B?cFdzekRJbTdxSjh5ZjhyZUxXeHhaVzNQc2szWHZzWXJWOVV2Q0lsNTQyOXZF?=
 =?utf-8?B?VlJyWlVOeElTcThmazllU3V3Nk9QbGFHbUxmeWRWZHZ0S1hDbGFESlZFTWU4?=
 =?utf-8?B?clczM1NGSFpVZzZwd3JvK2RMbEhyc3VxRElkbmVTb0xDalNZZi93WjFmSkNV?=
 =?utf-8?B?STgvODAyeCttb2JiZG8vTWhzSGNkNXBhU2tmRjJMblhkMmFQUUR0eG96L1BE?=
 =?utf-8?B?bFF1cHVwRlYvcHlqZWRJVG5xNTgwdVAwZ1RhTmpDTWlrNHRERG53WEw2bXFz?=
 =?utf-8?B?N3AwSjRmdUJUYlB6b2lTblJEc1c2YVQ3aVQ5cTIrVElkdnRDc2krQnFXSUlT?=
 =?utf-8?B?ZTBxazQ2ZGVGUjhWZk5pVFRPMzJYbjJDbnVYV0hLcE8yM3hzTVZ4K2xEbm9U?=
 =?utf-8?B?ZTA3dE0yRUQza0VWT0F4aUE1SGlZSHdvcWdGWERCc3ZpVlk1K0RsWkxiSTJt?=
 =?utf-8?B?Z3dQMS9KcU01bU1OUDQxMjVKQ04vUWFSY3h2bU5oSytlbnU1Slp1WmhUSTV1?=
 =?utf-8?B?OTllWVV5RDVZaFB0M1d3OEZoaUtFZW02eWpvcG52NDF2UVhuN2xRZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f0d83d-3efd-4b52-f649-08de5aa2a6c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:12:56.6002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGG5rd/9I8ipUXTU2rmVczjoJm02CeDXFO1e4wsKu4l5FafYJcXO25EfIhqyhnuuplVPUn/HH4apEoMnDe3qJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

Hi,

On 23-01-2026 03:12 am, Daniele Ceraolo Spurio wrote:
>
>
> On 1/16/2026 2:34 AM, Sk Anirban wrote:
>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>> idle flow and verifying SRAM handling completion. Without this, reset
>> can be issued while SRAM handler is copying WOPCM to SRAM,
>> causing GuC HW to get stuck.
>>
>> v2: Modify error message (Badal)
>>      Rename reg bit name (Daniele)
>>      Update WA skip condition (Daniele)
>>      Update SRAM handling logic (Daniele)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
>>   drivers/gpu/drm/xe/xe_guc.c           | 30 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
>>   3 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 87984713dd12..c9cb02f32f5a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -40,6 +40,9 @@
>>   #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>   +#define GUC_HASH_BOOT_CHECK            XE_REG(0xc010)
>> +#define   GUC_BOOT_UKERNEL_VALID        REG_BIT(31)
>> +
>>   #define GUC_HEADER_INFO                XE_REG(0xc014)
>>     #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>> @@ -83,7 +86,12 @@
>>   #define   GUC_WOPCM_OFFSET_MASK            REG_GENMASK(31, 
>> GUC_WOPCM_OFFSET_SHIFT)
>>   #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>   #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>> +
>> +#define GUC_SRAM_STATUS                XE_REG(0xc398)
>> +#define   GUC_SRAM_HANDLING_MASK        REG_GENMASK(8, 7)
>> +
>>   #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>> +#define   GUC_IDLE_FLOW_DISABLE            REG_BIT(31)
>>   #define GUC_PMTIMESTAMP_LO            XE_REG(0xc3e8)
>>   #define GUC_PMTIMESTAMP_HI            XE_REG(0xc3ec)
>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 44360437beeb..42658a409556 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -900,6 +900,33 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>       return xe_guc_submit_enable(guc);
>>   }
>>   +/*
>> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only 
>> reset by ensuring
>> + * SRAM save/restore operations are complete before reset.
>> + */
>> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    u32 boot_hash_chk, guc_status, sram_status;
>> +    int ret;
>> +
>> +    guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>> +    if (guc_status & GS_MIA_IN_RESET)
>> +        return;
>> +
>> +    boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
>> +    if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
>> +        return;
>> +
>> +    xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, 
>> GUC_IDLE_FLOW_DISABLE);
>> +
>
> The WA says that we also need to wait for the status to be "ready" 
> after setting GUC_IDLE_FLOW_DISABLE.
>
> Daniele
>
As discussed, a GuC reset can occur without firmware interaction, and 
during RC6 exit the GuC load status may transition, meaning it will not 
always be INTEL_GUC_LOAD_STATUS_READY.

So we’re checking GS_MIA_IN_RESET instead. I just want to confirm that 
this is enough to ensure FW is present before applying the WA.

Thanks,

Anirban

>> +    ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, 
>> GUC_SRAM_HANDLING_MASK,
>> +                 0, 5000, &sram_status, false);
>> +    if (ret)
>> +        xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 
>> 0x%x)\n",
>> +               sram_status);
>> +}
>> +
>>   int xe_guc_reset(struct xe_guc *guc)
>>   {
>>       struct xe_gt *gt = guc_to_gt(guc);
>> @@ -909,6 +936,9 @@ int xe_guc_reset(struct xe_guc *guc)
>>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>   +    if (XE_GT_WA(gt, 14025883347))
>> +        guc_prevent_fw_dma_failure_on_reset(guc);
>> +
>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>           return xe_gt_sriov_vf_bootstrap(gt);
>>   diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -73,3 +73,12 @@
>>   15015404425_disable    PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>   16026007364    MEDIA_VERSION(3000)
>>   14020316580    MEDIA_VERSION(1301)
>> +
>> +14025883347    MEDIA_VERSION(1301)
>> +        MEDIA_VERSION(2000)
>> +        MEDIA_VERSION(3000)
>> +        MEDIA_VERSION(3002)
>> +        MEDIA_VERSION(3500)
>> +        MEDIA_VERSION(3503)
>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>> +        GRAPHICS_VERSION_RANGE(3003, 3005)
>
