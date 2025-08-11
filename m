Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB7BCA0EC4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 20:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A1510E537;
	Mon, 11 Aug 2025 20:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hwpz/rKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E7310E530
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 20:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754942748; x=1786478748;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YW28Q1uK4y8rKBcnX4sPiyf4+lvFMq36xOs9Cc955eo=;
 b=Hwpz/rKuR5lCaDnsq7zvv/FPfMw/RG7k9A9vJSGzMLtSdg43nfWT1At9
 iUqTT98n2LA4Y3QdQ0/pGb90ZdS3ucWPhtU8xB8hKy0Vhkq4420L18iSW
 1+TyVqxCuCVfkdmg1s/08F1s4Y15afBbjHyFBgowSuYefOkNK6BvvzugB
 kNinuIRlXdb2KUh850EDf7HGUsOFg1K/g+2mTKdW8PI59nkYL2n/a7Y8Y
 CN4ZVVcMbEijYMFgwf/mZxoRa/kTncN0Hy0ndJnEgzy7lFG1WqPXCsYEj
 ikFVHQ+jOikYVdeMuVo818j3YznOVBodblLYGrhNSV4Bu2/RZDZ/189hd g==;
X-CSE-ConnectionGUID: kAW4YyZDTKifpvL5yA6AFg==
X-CSE-MsgGUID: gjzcNehLTMaJNPKNmJTRTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67474840"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67474840"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 13:05:47 -0700
X-CSE-ConnectionGUID: QCQ030wyRBCDQUmZNROTsA==
X-CSE-MsgGUID: KCQgrN+kRtGwBwU6Bq38CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="196848776"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 13:05:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 13:05:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 13:05:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 13:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuZxa3YsJsZLikiQrql7IeBmLoPlPNWONWaiOnbtm/EsXdIjDKh/Q7I4z9FIbrCSqVKr/tzv2O0MCu90ZzR6vzoa0hNXxoRfvCRoiy/V4ZC6xvvKzbme1eEPCAyPH/jU/RSEzAo8lcSG/LYD2Fu3/9vlxa6s3iLINWy1dYwWotSwJFYSRETVLzkcSmvj09VKPc3nfDk6WKyUKDQWeFVelVcLkDFv+/wEIHzHNL49LlruBdZcEmyY560g+vV98SUWIRTvxtlmmUTrVBrZ1CP47vH+TrQz/7HoWkxxvD4WHpchyymnSJYBTCJeWw8QbIavUFga/wj2fAGNa2m/pVMWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pro4BbQT858kVcUybMdW1Jmz6mstQJOoii6OUhyJNE=;
 b=tl5WIpd+X1qfrX0w/UkzeK2DsMhMJ67WB5SgEmOy9w5uu2K/X0urFAAA8mQps4YU9b9vwL1CS/IOpHF3DB7Jrhwb7gWgl+K6a5bVMM/slV9t32xrBucGjElcs4g6OpMCtgQ2QagUbtI0AKyU6MxQJn1rTl+AJNpLdO9srC3asIMYGpKCRm7gU93HatRMkM178mdO580QSvRQvv+QGeIU7DfgVmlKdJkZ8frdGhu1aa0cfoI4nFaF3NEvdl1YXpFv15vptvuLQUJqdUi6CsHdrT5Jjh3G5vK8H4byAwaf1Z8imf5iyCOly5MjD9GV0KxENEwEl5iYXqGgf6zWkbcQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 20:05:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 20:05:40 +0000
Date: Mon, 11 Aug 2025 13:05:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH v2] drm/xe: GPU frequency tracing support
Message-ID: <aJpNESoUTIyAcQ05@lstrano-desk.jf.intel.com>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811083414.3863103-1-s.sebinraj@intel.com>
X-ClientProxiedBy: SJ0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 55520d07-29a0-4063-7e3c-08ddd912721b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blhqZ3JaRTQ4UUMzQURENVBzZkJTb250SkZsNjZzUWFoMkJnNTgvYWZpQ1Vp?=
 =?utf-8?B?TzZOdmROSW16ajRaZ3NUUFJlckswWEJMWUdDUUVqZlBWdmhVc1dMSG53VnZh?=
 =?utf-8?B?QW5HdUxlNFdTaFVkUDBmZThlaHVhSlZ5TEVHOTQ5M2VnanlXdEdnRFpGaFdk?=
 =?utf-8?B?MUd3THIzZFVkSHFGdUZ5eVhseGdkUE5KcUxqQ3FGcmpSRThVSFNlS3AxVmpR?=
 =?utf-8?B?WERaamFubkRvaktybUE3dGhRanZFZDJLMjJMKzUzcjJqbXBqK0xTd042RnlZ?=
 =?utf-8?B?SVErVmxRRHBBVGVZYzJ6R1l0RnBhczBxZmx6MHI4QkFjdmRiV1BzU2hZUmFw?=
 =?utf-8?B?cWFwT2p2anNjZzJyZGlFT0pOemdCVzNuVkFPOE9pa3NLZE01MTFUSG5xaWc5?=
 =?utf-8?B?Sjh0WnV6L2hmUXBnQ2dZRTcrQk8wNy84UVlEUWU4SFFmbG5vZkJUd1hkcjRK?=
 =?utf-8?B?OUgwa2dTOHlYUzJpWjVhTjF2OWZqVzRvR1dGeGk1clFuR01MRC9iV2tsU24x?=
 =?utf-8?B?RFoyc0dRcXB6Ung0QXVCdzRiTWN4a3RUSmRXY24zUEx3ZTlZempXY0VaRjBM?=
 =?utf-8?B?QytTQmVpUWQraW5taTRnR0VFT0F6Vm82RnVUOG5vemRiZGJTbyttUVY2Z3Rz?=
 =?utf-8?B?Q1J3TG1VSTZTZWx6TUNzVmw1cEkzYjA0UzJXRWh5dFg3Uk5lVDk0bHpEYjlB?=
 =?utf-8?B?KzQvdVhhNi9WVXo2clQrR1NDTnA2aEhjWW01bSt4SE41dnNZOHFXalRJZDZ5?=
 =?utf-8?B?VnNVTHFGVEk1U2tROUxYN0FZMWJCRzhSL05YMGpsd09vMW1CbFJkTHRlejRS?=
 =?utf-8?B?ZVRCMXR6MFVnZUZjZFZHVkhZdExuSlFRQVJXcG55REpZMEJwWVZCcWdBTHM0?=
 =?utf-8?B?OUQxNzBPRVA3VDZRbTBTK2grUWxtRm4vdk5jNGlEMVgwcVRmaFdPd2RJa1JK?=
 =?utf-8?B?SHpDWHRzVEdHbUFmdko0L0dHa2RFR1dvWWsxNlE1NmNvOHY5WXhkYng0Y1Zy?=
 =?utf-8?B?WWJZcS9SNjFBU2x3Mmh0SmcxS2R3Z2M5MXl3WnlzbUZOaFRKQnlWNThQc3hZ?=
 =?utf-8?B?eVNIdmNEcHpYeWg3aHZEdlk4WFZCQVpmSmZxUHBKam4wMU82OXgvcTQzemtI?=
 =?utf-8?B?L2NEZDAyOWt3RXhMV3dsWjVaUWpyc3NUSG9RZFFoSHFqRTZKYlA2RU9lNE5W?=
 =?utf-8?B?aUE3eUdQYU1oN3JoRE4zVlhVVit0SEdyNVlOek5kYjBiMXNyTWJTUERBN1dD?=
 =?utf-8?B?d1dhdndGK1ZVY0sveSsyR2dhSXlCeHlBT0JVakhXWlNvMTdnM3kyMENGc2ZY?=
 =?utf-8?B?MXhpc0lxcE91UlRQVEI1a1R0MW5CUFVLNktVNGpnNStCZXJ3b2dWL3ZwOHdi?=
 =?utf-8?B?VGVhUkl0ejlucXVkRDI3RkQ5UnRMUWJXT0cxYUM1UDh0TjNIc0FkMGo4SHU0?=
 =?utf-8?B?WWlSWE5DZEc2TTIxL210OXJneittd3JpY2hWcHF4Y1R3dXN3b2o1VXRYWXcy?=
 =?utf-8?B?azlIS3o2S2ZjOGpXYnR1UWs1QjRtM0ZCSktIcXNFRFZHbEVhbHB3TXZUMTQz?=
 =?utf-8?B?YXhnV3hQOFBrcHpaay8randEVDBsVTRzVy9sV1E3THVHRGQ5VWMzV0ZOQlFZ?=
 =?utf-8?B?Y3k5SCs1Y2hUS0QxS1hZL1NsR0tUZHFLbWlKaHlSaGU1NlBGWUwyS1k4d3ov?=
 =?utf-8?B?bUI4NWtzVFRVakluUEVwS2lidnNHUTFpOEtpRXo2cjV3d085UktiNWtEMUV1?=
 =?utf-8?B?c3AxZ3NQbnFKT1A1QjJCT3BXK0d5T1hQV3pacmNXaUpuK0VSaU1TQ1FodnJ5?=
 =?utf-8?B?Y3dITCtRRlRtQ1BMNmtqUWNLaGRHUDVMbUpVMXNuaVpSRkhPS25GUjFkbXVn?=
 =?utf-8?B?RU1vSGoxbWRkcW5UcTFWS2hyRGN1NGdhL01uYnhDWGFWZVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZzOGRoTVVlQmhuM1lvTEZ1RFY5K2diZFVSR3VvYzRvL1VtdHNlTEV4QWpk?=
 =?utf-8?B?NUJmdDgvWml6QmIzNXUzdVZCQTFtaTFwQUNOQVZFTGI3dzA4YkM2VjJUbUNB?=
 =?utf-8?B?NWVMbXhBWk5INkkrTThZMDZVVHA1U0ZFT3dBVnNnWFp1RHpHSnFPUXlQbjZK?=
 =?utf-8?B?Mm9tMEFUU2xjWFNqdW5OQjhnakw2OThBdDFwemtOTmY4R3ArelRMYWhLT1Nt?=
 =?utf-8?B?WVRHb08zMElqdFFTL0tTRkcvcmlnYndIb0FqQkR5UnVlbFovREdRdWFEZW5I?=
 =?utf-8?B?MVdZT1pTTDlsWFdjN04vSjNlQjFTTCtoYzN4bGZvR084NGhnb3dENGlsaG9P?=
 =?utf-8?B?dTJmbS9DS3J0UTB6RXN4RGF4UnF1M1FnZkZXdTE4L0dRajE1S0x3cmIzcWw5?=
 =?utf-8?B?YmpYbkhBMFBTK1diUHFQTDY2SytKUEdkbmZTaGVzbjVWSDFKcjNRMFArVVhr?=
 =?utf-8?B?YjJJVVpkclQzOWl5SjY2Rno1Yjk2ZnRSSkZoMGh0MEJBQjJBZHBiRXZmL21x?=
 =?utf-8?B?RjI0UFMyYkJKRFRjYmFsOVlMUnBndUprVkgrWG8zeit5NUsvNU1XYkszMUdM?=
 =?utf-8?B?S2tkMTFFWFQ0bklkRno1dmNKMm54OUFjQ2JtL28xbW9KOEt6ZzJzUlJ5NVlE?=
 =?utf-8?B?WVZBWTkzUUQ5TkFKTEtWU05UQlppbmxTdkoycEV5TFNFZitSNlVqWjNEQ0Qr?=
 =?utf-8?B?eGxyY1EyTlNnNWpVSEpubmIzQXI0cXdpZEZqMXA1b2pZUmRjaXcvZktwcHFE?=
 =?utf-8?B?NzYxdG9XN2hGakVxamZIbktTL0dtak9kY0l6VVUrT3J2Sm15b0xUbzFhZGlr?=
 =?utf-8?B?QnBGTTJ6U3NyOVZtK3Z6QWZ0bGNTWGFOQWtTN3NYaXlDWklNMmppTWNabHZZ?=
 =?utf-8?B?eTl0VmZHUW1jaEtMVDR3d1pyblZheVJJOUFXSm9SMTh5RWpxVnlIRHg4eDRF?=
 =?utf-8?B?SUFRM1I1eFlzZVFqNWJmcTJCRlhDUllhZExHS1U2a3lIcUFIdEpMNUVLWUFV?=
 =?utf-8?B?akxtT01aZzl2NFo2N3I1bmNyaXVFaFhiQTJOOVd4TnFpM2hsSllSejM3Ulhi?=
 =?utf-8?B?eHhFMjhsdFdXWUFkWDJvTEpoc3ErYy9vejBhV2kwSS9ZcExRNFVFeVArTjVh?=
 =?utf-8?B?dWxhKytRUGJTVHdGYkZpVTU5Z05OYnFKbFBySjArNFBpeHJhQ21DTE9neXIy?=
 =?utf-8?B?TzFBeHY0dVlCMTI1cExZNlJRTVNEemY2RHg3MVN5RFM1YURhMmI3QjYxL3Mv?=
 =?utf-8?B?djVTTmhzeUYwaEtmNkVLV2RKZUFBSnlSTWZNY2JKcTZvb2ZOYlcwYlVVRFho?=
 =?utf-8?B?aFgxU3pTMm5qRzFzMUpVek41UHZ2cnl5bk8rdVRGb3NueWo0K3VMRXNTQm80?=
 =?utf-8?B?WFVoR0hpWlhpbW9LWU42MzFuc0xKSkwycWtNZkhtbWZkUXdPNXlVUzEydU1D?=
 =?utf-8?B?aDJENm52MndIWmxPRlZjalJEV05RWjUzbnJ6TW5jNFBIVzhhRk9TWk1VTWFl?=
 =?utf-8?B?OFBjTzM4emhSZU5mczRNUm5LQVdUSmRIbEhwelprZnlHNjNFMkpIRU9BbE80?=
 =?utf-8?B?RXlSQklFbDk3S1AyWmR5dHVwK3ptdW44U25SNUIvRDByRWZrSndkcEIzOHda?=
 =?utf-8?B?U1Z6K0pybVZGWUd4UWRMSmNkb1ZOb2JJR1JhNGF2VjZKdUpCdVdxWnl3Q1Uv?=
 =?utf-8?B?dzhEYUJUNUtJMUowZ3NmK0RxeXNBRWV6TGVnRVFFcGNqTnB5ZE9hMDIyUXVJ?=
 =?utf-8?B?blhmZ25IekNQQm81ckRod2VUUHhwRGV3UE04ZkZkTGJ1RlIrZEFFU0dTSXZa?=
 =?utf-8?B?YnZJK1NpVXZpSlZscjAwK2xkNkRCNTVFa3RmaVIrWmVtOWorbUgvU05NNXZY?=
 =?utf-8?B?NCtSSkdCTm5RSGFpcVVhTnRQd28rd1dwZ1V1aVhUN0VrOEV4aGx5dEx2WjBw?=
 =?utf-8?B?bi9nZ0o0L3VaNDN3eDBaQ2JYRUZWUE9QcnF5d00rNHBqcVlpcnB4V1grOCto?=
 =?utf-8?B?NTZlOVR1TG9sVGdCOXEvN2JtTnVPZ3pibW92WVB0MXY4NGk2dnVibVJrYjRW?=
 =?utf-8?B?STAyNzQxWVZObWFzT3QwWXh4TnNlQXlabWU2aUV5eS9XWjUrKy8zbUQrTGpy?=
 =?utf-8?B?TmxrVHRJWWRyUndPZzdLOUVjNnhZb0ZJSlBSdDJTcFVNUWtWTEhYMzJ4VDJ5?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55520d07-29a0-4063-7e3c-08ddd912721b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:05:40.5971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5CKnshXlTBQMRgDUWrznRkxHHtxtHzEUl28AVc7VIlpsbmW6pbBpb/3pTmzLS2KpVNO9hEFlv6aycOzzkTS/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
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

On Mon, Aug 11, 2025 at 02:04:14PM +0530, S Sebinraj wrote:
> A periodic GPU frequency monitoring and tracing program for the
> Xe driver. The implementation provides periodic sampling of
> GPU frequency through the Linux ftrace infrastructure.
> 
> Key features:
> - Periodic GPU frequency sampling with configurable intervals
> - Immediate frequency change reporting via tracepoints
> - Integration with Linux ftrace subsystem under 'power' events
> - Per-GT (Graphics Technology) monitoring support
> - Dedicated workqueue for non-blocking frequency sampling
> - Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
> - The monitoring interval can be configured at runtime via the sysfs
>   (default 5sec).
> 
> The sysfs entry is at:
> /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> 
> The tracepoint is exposed at:
> /sys/kernel/debug/tracing/events/power/gpu_frequency
> 
> Format: {unsigned int state, unsigned int gpu_id}
> - state: GPU frequency in KHz
> - gpu_id: GPU clock domain identifier
> 
> This enables userspace tools and system monitoring applications to track
> GPU frequency changes for power management analysis, performance tuning,
> and debugging purposes.
> 

Change logs are helpful during reviews. I also prefer replies to review
comments to ensure we are aligned on all points, even if the reply is as
simple as “+1.”

> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig                  |  22 ++
>  drivers/gpu/drm/xe/Makefile                 |   3 +
>  drivers/gpu/drm/xe/xe_device.c              |   7 +
>  drivers/gpu/drm/xe/xe_device_types.h        |   4 +
>  drivers/gpu/drm/xe/xe_gpufreqtracer.c       | 292 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gpufreqtracer.h       |  30 ++
>  drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h |  48 ++++
>  drivers/gpu/drm/xe/xe_module.c              |  12 +
>  drivers/gpu/drm/xe/xe_module.h              |   3 +
>  9 files changed, 421 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 714d5702dfd7..d9d07ec69875 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
>  
>  	  Use "!*" to block the probe of the driver for all known devices.
>  
> +config DRM_XE_GPUFREQTRACER
> +	bool "Enable XE GPU frequency tracing"
> +	depends on DRM_XE && FTRACE
> +	default n
> +	help
> +	  Enable GPU frequency tracing support for Intel XE driver.
> +	  This adds an ftrace tracepoint that reports GPU frequency changes
> +	  at periodic boundaries (default 5 secs, configurable via the
> +	  gpufreq_monitoring_interval_ms module parameter) and
> +	  on direct frequency change events.
> +
> +	  The monitoring interval can be configured at runtime via the sysfs module parameter:
> +	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> +
> +	  The tracepoint will be available at:
> +	  /sys/kernel/debug/tracing/events/power/gpu_frequency
> +
> +	  Format: {unsigned int state, unsigned int gpu_id}
> +	  Where state is the frequency in KHz and gpu_id is the GPU clock domain.
> +
> +	  If unsure, say N.
> +
>  menu "drm/Xe Debugging"
>  depends on DRM_XE
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757..61d46cc4dc25 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_service.o
>  
> +# GPU frequency tracer
> +xe-$(CONFIG_DRM_XE_GPUFREQTRACER) += xe_gpufreqtracer.o
> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f..88198ceb519b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
> +#include "xe_gpufreqtracer.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> @@ -896,6 +897,12 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUFREQTRACER)
> +	err = xe_gpufreqtracer_init(xe);
> +	if (err)
> +		return err;
> +#endif

If I wasn’t clear, you don’t need this if IS_ENABLED — the header file
already includes this and calls a stubbed-out version that does nothing
if CONFIG_DRM_XE_GPUFREQTRACER is unset.

> +
>  	err = xe_oa_init(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f..0634dbbbdc3f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,7 @@ struct dram_info;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
>  struct xe_ggtt;
> +struct xe_gpufreqtracer_data;
>  struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
> @@ -529,6 +530,9 @@ struct xe_device {
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> +	/** @gpufreqtracer_data: GPU frequency tracer data */
> +	struct xe_gpufreqtracer_data *gpufreqtracer_data;
> +
>  	/** @pxp: Encapsulate Protected Xe Path support */
>  	struct xe_pxp *pxp;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
> new file mode 100644
> index 000000000000..07eedfb79e93
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gpufreqtracer.h"
> +
> +#include <linux/workqueue.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/moduleparam.h>
> +#include <linux/types.h>
> +#include <linux/container_of.h>
> +#include <linux/gfp.h>
> +#include <linux/atomic.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_types.h"
> +#include "xe_guc_pc.h"
> +#include "xe_module.h"
> +
> +/* GPU frequency monitoring interval constants (in milliseconds) */
> +#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
> +#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
> +#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
> +
> +#define CREATE_TRACE_POINTS
> +#include "xe_gpufreqtracer_trace.h"
> +
> +/**
> + * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
> + * @gt: Reference to the GT
> + * @delayed_work: Delayed work for periodic monitoring
> + * @last_frequency: Last reported frequency to avoid duplicate reports
> + * @monitoring_active: Whether monitoring is currently active
> + */
> +struct xe_gpufreqtracer_gt_data {
> +	struct xe_gt *gt;
> +	struct delayed_work delayed_work;
> +	atomic_t last_frequency;
> +	atomic_t monitoring_active;
> +};
> +
> +/**
> + * struct xe_gpufreqtracer_data - Per-device frequency tracer data
> + * @xe: Reference to the XE device
> + * @gt_data: Array of per-GT monitoring data
> + */
> +struct xe_gpufreqtracer_data {
> +	struct xe_device *xe;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +};
> +
> +
> +/**
> + * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency.
> + * @work: Pointer to the delayed_work_struct representing the scheduled work.
> + *
> + * This function is executed in a workqueue context to periodically sample
> + * the GPU frequency and perform any necessary tracing or logging operations.
> + * It reschedules itself for the next sampling interval.
> + */
> +static void xe_gpufreqtracer_sample_work(struct work_struct *work)
> +{
> +	struct xe_gpufreqtracer_gt_data *gt_data =
> +		container_of(work, struct xe_gpufreqtracer_gt_data, delayed_work.work);
> +	struct xe_gt *gt = gt_data->gt;
> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> +	u32 current_freq, last_freq;
> +
> +	if (!atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, exiting",
> +			 gt->info.id);
> +		return;
> +	}
> +
> +	current_freq = xe_guc_pc_get_act_freq(pc) * 1000; /* Convert MHz to KHz */
> +	last_freq = atomic_read(&gt_data->last_frequency);

I don't think last_frequency needs to be atomic, as it is only modified
during initialization or by this worker. This worker executes serially
and fully owns this data, correct?
 
> +
> +	/* Only report if frequency has changed or this is the first sample */
> +	if (current_freq != last_freq) {
> +		drm_dbg(&gt_to_xe(gt)->drm, "GT%u frequency changed, tracing %u KHz",
> +			gt->info.id, current_freq);
> +		trace_gpu_frequency(current_freq, gt->info.id);
> +		atomic_set(&gt_data->last_frequency, current_freq);
> +	}
> +
> +	/* Reschedule for the next sampling interval if monitoring is still active */
> +	if (atomic_read(&gt_data->monitoring_active)) {

I don't think you need this if statement, as you already bail out early
above if this is clear. In the worst case, if this bit flips while
executing, the delayed worker would just run again and bail.

Nits aside, looks much in this version.

Matt

> +		schedule_delayed_work(&gt_data->delayed_work,
> +				      msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_start_monitoring - Start periodic frequency monitoring
> + * @gt: The GT instance
> + *
> + * Starts periodic sampling of GPU frequency for the specified GT using the global
> + * monitoring interval from module parameters.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +
> +	if (!tracer_data) {
> +		drm_warn(&gt_to_xe(gt)->drm, "no tracer data for GT%u, not supported", gt->info.id);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> +		drm_err(&gt_to_xe(gt)->drm, "invalid GT ID %u, max supported is %u",
> +			gt->info.id, gt_to_xe(gt)->info.gt_count - 1);
> +		return -EINVAL;
> +	}
> +
> +	gt_data = &tracer_data->gt_data[gt->info.id];
> +
> +	if (atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring already active for GT%u", gt->info.id);
> +		return -EALREADY;
> +	}
> +
> +	atomic_set(&gt_data->monitoring_active, 1);
> +	atomic_set(&gt_data->last_frequency, 0);
> +
> +	/* Start the delayed work using global interval */
> +	schedule_delayed_work(&gt_data->delayed_work,
> +			      msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> +
> +	drm_dbg(&gt_to_xe(gt)->drm, "monitoring started for GT%u with interval %u ms",
> +		 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gpufreqtracer_stop_monitoring - Stop periodic frequency monitoring
> + * @gt: The GT instance
> + *
> + * Stops periodic sampling of GPU frequency for the specified GT.
> + */
> +static void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +
> +	if (!tracer_data || gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> +		drm_err(&gt_to_xe(gt)->drm, "invalid tracer data or GT ID %u for stop request",
> +			gt->info.id);
> +		return;
> +	}
> +
> +	gt_data = &tracer_data->gt_data[gt->info.id];
> +
> +	if (!atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, nothing to stop",
> +			 gt->info.id);
> +		return;
> +	}
> +
> +	atomic_set(&gt_data->monitoring_active, 0);
> +
> +	cancel_delayed_work_sync(&gt_data->delayed_work);
> +}
> +
> +/**
> + * xe_gpufreqtracer_validate_params - Validate GPU frequency monitoring parameters
> + *
> + * Validates and corrects the GPU frequency monitoring interval parameter.
> + * If the parameter is out of range, it will be reset to the default value.
> + */
> +static void xe_gpufreqtracer_validate_params(void)
> +{
> +	if (xe_modparam.gpufreq_monitoring_interval_ms < XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS ||
> +	    xe_modparam.gpufreq_monitoring_interval_ms > XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS) {
> +		pr_warn("xe: gpufreq_monitoring_interval_ms %u out of range [%u, %u], using default %u ms\n",
> +			xe_modparam.gpufreq_monitoring_interval_ms,
> +			XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS,
> +			XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS,
> +			XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS);
> +		xe_modparam.gpufreq_monitoring_interval_ms = XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS;
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_cleanup_action - DRM managed cleanup action
> + * @drm: DRM device
> + * @ptr: Pointer to xe_device
> + *
> + * Cleanup function called automatically by DRM managed resource system.
> + */
> +static void xe_gpufreqtracer_cleanup_action(struct drm_device *drm, void *ptr)
> +{
> +	struct xe_device *xe = ptr;
> +	struct xe_gpufreqtracer_data *tracer_data = xe->gpufreqtracer_data;
> +	struct xe_gt *gt;
> +	u8 tile_id;
> +
> +	if (!tracer_data) {
> +		drm_warn(drm, "no tracer data found, nothing to cleanup");
> +		return;
> +	}
> +
> +	/* Stop all monitoring */
> +	for_each_gt(gt, xe, tile_id) {
> +		drm_dbg(drm, "stopping monitoring for GT%u", gt->info.id);
> +		xe_gpufreqtracer_stop_monitoring(gt);
> +	}
> +
> +	/* Memory is automatically freed by drmm - just clear the pointer */
> +	xe->gpufreqtracer_data = NULL;
> +}
> +
> +/**
> + * xe_gpufreqtracer_init - Initialize GPU frequency tracer for a device
> + * @xe: The XE device
> + *
> + * Sets up the frequency tracer infrastructure for all GTs in the device.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_gpufreqtracer_init(struct xe_device *xe)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data;
> +	struct xe_gt *gt;
> +	u8 tile_id;
> +	int ret = 0;
> +
> +	/* Validate module parameters first */
> +	xe_gpufreqtracer_validate_params();
> +
> +	tracer_data = drmm_kzalloc(&xe->drm, sizeof(*tracer_data), GFP_KERNEL);
> +	if (!tracer_data)
> +		return -ENOMEM;
> +
> +	tracer_data->xe = xe;
> +
> +	/* Allocate GT data array based on actual GT count */
> +	tracer_data->gt_data = drmm_kcalloc(&xe->drm, xe->info.gt_count,
> +				       sizeof(*tracer_data->gt_data),
> +				       GFP_KERNEL);
> +	if (!tracer_data->gt_data) {
> +		ret = -ENOMEM;
> +		goto err_free_tracer;
> +	}
> +
> +	/* Initialize per-GT data */
> +	for_each_gt(gt, xe, tile_id) {
> +		struct xe_gpufreqtracer_gt_data *gt_data =
> +			&tracer_data->gt_data[gt->info.id];
> +
> +		drm_dbg(&xe->drm, "initializing GT%u (tile %u)", gt->info.id, tile_id);
> +
> +		gt_data->gt = gt;
> +		atomic_set(&gt_data->monitoring_active, 0);
> +		atomic_set(&gt_data->last_frequency, 0);
> +
> +		INIT_DELAYED_WORK(&gt_data->delayed_work, xe_gpufreqtracer_sample_work);
> +
> +		drm_dbg(&xe->drm, "GT%u initialized with global interval=%u ms",
> +			 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> +	}
> +
> +	xe->gpufreqtracer_data = tracer_data;
> +
> +	/* Start periodic monitoring on all GTs using global module parameter */
> +	for_each_gt(gt, xe, tile_id) {
> +		ret = xe_gpufreqtracer_start_monitoring(gt);
> +		if (ret) {
> +			drm_err(&xe->drm, "xe_gpufreqtracer: failed to start monitoring for GT%u, err=%d\n",
> +				gt->info.id, ret);
> +		}
> +	}
> +
> +	/* Register cleanup action for proper work cancellation */
> +	ret = drmm_add_action(&xe->drm, xe_gpufreqtracer_cleanup_action, xe);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +
> +err_free_tracer:
> +	drm_err(&xe->drm, "initialization failed, freeing tracer data");
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.h b/drivers/gpu/drm/xe/xe_gpufreqtracer.h
> new file mode 100644
> index 000000000000..561abe27b6e2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GPUFREQTRACER_H_
> +#define _XE_GPUFREQTRACER_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +struct xe_gt;
> +
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +
> +/*
> + * Initialize the GPU frequency tracer for a device
> + */
> +int xe_gpufreqtracer_init(struct xe_device *xe);
> +
> +#else /* CONFIG_DRM_XE_GPUFREQTRACER */
> +
> +static inline int xe_gpufreqtracer_init(struct xe_device *xe)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_DRM_XE_GPUFREQTRACER */
> +
> +#endif /* _XE_GPUFREQTRACER_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h b/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> new file mode 100644
> index 000000000000..5664db62e3fb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +
> +#if !defined(_XE_GPUFREQTRACER_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _XE_GPUFREQTRACER_TRACE_H
> +
> +#include <linux/tracepoint.h>
> +
> +/*
> + * Tracepoint for GPU frequency changes
> + * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
> + *
> + * location: /d/events/power/gpu_frequency
> + * format: {unsigned int state, unsigned int gpu_id}
> + * where state holds the frequency(in Khz) and the gpu_id holds the GPU clock domain.
> + */
> +
> +TRACE_EVENT(gpu_frequency,
> +	TP_PROTO(unsigned int state, unsigned int gpu_id),
> +
> +	TP_ARGS(state, gpu_id),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned int, state)
> +		__field(unsigned int, gpu_id)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->state = state;
> +		__entry->gpu_id = gpu_id;
> +	),
> +
> +	TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
> +);
> +
> +#endif /* _XE_GPUFREQTRACER_TRACE_H */
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH .
> +#define TRACE_INCLUDE_FILE xe_gpufreqtracer_trace
> +#include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d08338fc3bc1..f5d4f8bca61f 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -31,6 +31,7 @@
>  #define DEFAULT_MAX_VFS_STR		"unlimited"
>  #define DEFAULT_WEDGED_MODE		1
>  #define DEFAULT_SVM_NOTIFIER_SIZE	512
> +#define DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS	5000
>  
>  struct xe_modparam xe_modparam = {
>  	.probe_display =	DEFAULT_PROBE_DISPLAY,
> @@ -41,6 +42,9 @@ struct xe_modparam xe_modparam = {
>  #endif
>  	.wedged_mode =		DEFAULT_WEDGED_MODE,
>  	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	.gpufreq_monitoring_interval_ms = DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS,
> +#endif
>  	/* the rest are 0 by default */
>  };
>  
> @@ -93,6 +97,14 @@ MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
>  		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +module_param_named(gpufreq_monitoring_interval_ms,
> +		   xe_modparam.gpufreq_monitoring_interval_ms, uint, 0644);
> +MODULE_PARM_DESC(gpufreq_monitoring_interval_ms,
> +		 "GPU frequency monitoring interval in milliseconds (100-10000, default: "
> +		 __stringify(DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS) ")");
> +#endif
> +
>  static int xe_check_nomodeset(void)
>  {
>  	if (drm_firmware_drivers_only())
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..fd60de38d24d 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -23,6 +23,9 @@ struct xe_modparam {
>  #endif
>  	int wedged_mode;
>  	u32 svm_notifier_size;
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	u32 gpufreq_monitoring_interval_ms;
> +#endif
>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.34.1
> 
