Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29FED116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 23:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F6C10E4BE;
	Mon,  1 Dec 2025 23:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6FmK35M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AC910E4BE
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 23:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764630038; x=1796166038;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+nUV6WS/56Ls4cYQz42GCla2fBQHgaNieNXULGokUMQ=;
 b=D6FmK35M53BdJ1hd+RHk/eLb2bLUxcucQKuM+lliUEe5ZyCc2qI/p8KT
 cnn4LP6lI8DpexxSKDHSKJDPnlQfmDrv0u7AI2d6g972xzaWvRH0ZwSTR
 j90lgh6UTdAMqtU/H9cLhQg0sKZGSK2+O7OAUHraKiOJwmWZU8WORfVSc
 LrwMXLYyXZMRwlI2eh7zNf3zo19CqjmW5kmnUb2r3g8hG9pWdW0lae1hv
 EEBVPxYEGDD9tvyCg4lJsDyi40SvkFuhLTYYon8c/UdcvBrHhK0Yd0vYf
 bPb/QHlsBbEb/wdHXRKdJuAbyZ8rbOaS4emVt1+pK0bOjAqZQ8rPdrty0 A==;
X-CSE-ConnectionGUID: uhNaDDZpTt+5HaPP5mgl6A==
X-CSE-MsgGUID: +RIgP8d+Qnml5UzZYYK86g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70200433"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70200433"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:00:37 -0800
X-CSE-ConnectionGUID: dxsUvT1lSUaNGanY7dP6Mg==
X-CSE-MsgGUID: FBPd4COkQBOudno4MuifWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="225174984"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:00:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:00:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 15:00:36 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:00:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFrwvAGo+1glAakC1Ow++G0z2AtUDJinO8Crx3O1QrTHHoSNZ2mJzUprz9GPhQEMGba9ZSaMvrz7Rc882WO7talavo9g7P/t1P/8/9akx3Kf9JsPFHluF3t2EsJF2jFLtMzgdgynDLtINr4ulnm/8tdFZOi4UsHIebUgiIyjzQy9zY1fiS27wFT0KZN++aWv/rowGQTpnSL8aa+AJWVjlaHOc6Oq1oeJAcj7BYYF79+CBQnpGIbSj/6hUhXtyMljMzhGlazuvaYMGV8NKYSa7A2ZlZYZSSazX80MW0v8/PqPOi51opvkc+uUEnq2CoqJbyaTjuV2f3SQR7MFAe19eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ2ee8NyOwKAZ1Hd052OqHoulHXCotoZdAUwzGAorh4=;
 b=cgKRIL5z1bOPb3Juo94KDlhbDdd6oQ8hhXGYqU2I9+NNJrsY8I1yAPb40+KYJ9nBcp+Bf8kOzWB5gBH5Iz7TfMhbXcmznICWl1xIUazjv3ymBRjrqSDyWCFrAKyZxRdbsMsOPTX5G+VWoe0UDEex2ptY0OGW6YwtkntrjELC7/fEqCvQ1VaFLlg4I6aKlid7C/b1IWtgz2zqIR9I4BJ3Ly+iVF+0OjFhI5ZfMXxr8ZgQkuw8FIpYBym6Pz/wu0Uui5QekZTpWtILW1yNljU5bYcyBwURx2avvq6hjwNB34weQ2hk7uRZA+Hb1WSCR9kHsfpR9B0gYcY+QyXqHLtoKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Mon, 1 Dec
 2025 23:00:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:00:34 +0000
Message-ID: <2e47727b-93ac-495d-a1d3-6e9a780e4665@intel.com>
Date: Mon, 1 Dec 2025 15:00:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/guc: Recommend GuC v70.54.0 for BMG, PTL
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251125014134.2075988-10-julia.filipchuk@intel.com>
 <20251125014134.2075988-15-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251125014134.2075988-15-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: ca34d979-491b-43bf-0e42-08de312d6f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGlSK2VGazVmYU4zakF4WlpNRC9LSE5RcUY2Umd6ZTExVHpydS9Zc2ZUN0FC?=
 =?utf-8?B?YkhDUW54S3RpZlNWSXNaNWN0UldZS2JJeENXdnV3NExBdkh6TVhFNlZtYUtU?=
 =?utf-8?B?TTI0WXNKWWcvaHRqQWJxcVpRUktmQmVJU2ZocnFBV3g3a2Y5MElEN04xQ2p2?=
 =?utf-8?B?T2dzaUl2RHR4TWd2eTBqa2t3SHZkRHdwVzVJcEJBUm1SeGdIS25VTlRKOFNa?=
 =?utf-8?B?eStiaWZnK0dBWDczL1VkaVEwdUx2NGlqOWhxcWlyV0llQzBiYUw0SDI1eHVI?=
 =?utf-8?B?ZVo3UHVZNE4zSElaWDVub3krN0VsVUdrQnYwblZ0a0V6SUtNV2s4ejJGY3dw?=
 =?utf-8?B?blIyekxFYUpwbW1yUDVVQytwREdjV0k1Y2hRakd1YyszS3gvZFNtUlpnaWxm?=
 =?utf-8?B?Q3Q0aG0rTXJHbG9YVTNUTitCcGVnVFQ3RHpSMk5vOFc3UlpsMU5VWm1DcFJu?=
 =?utf-8?B?Vk5NSncyeFNBT012cHJsZzlGcitONG96QllUZW5jZEs4OFZZM1d3MTRWNzEw?=
 =?utf-8?B?MjRGTkhaTjljd0cvSXdMSGxJS2VBK0RhMlNUT0t4cExEZEpFVEZmY2xJQ1RK?=
 =?utf-8?B?ODhxMVZEV1loenZGUnhuUHdlckZXb0RPTzdjeHhvS3VlUDdDMlJKcU5iNnFN?=
 =?utf-8?B?Z0JyUEhTVXBVZFBMRHlvU1FrSUVGbzJwVWE4ZWRXeno0NDNzdkQwZ2MrLzBn?=
 =?utf-8?B?VHRhVloxY0pBbjQyK3FpUlFzVlhpSFhFUXQ5MHBKdFBjem90WmtvS2I0eTlX?=
 =?utf-8?B?NWtsblppeU1MejZUMUhicGJvOUdDcmJGWDhvQ3diWWRJUTlCL2MyS3NBMEdP?=
 =?utf-8?B?dnVJQXhncWpWeUEvb0k1N2ZYdWJ1anJYdGVaTWdPNkcrbm41YTVKbklNODlW?=
 =?utf-8?B?RlRkemxMUWVudXIwM20rUVlDcnIvMkU1bzZOQWVzbjFBa01iV0hGakxMbUJM?=
 =?utf-8?B?UUltZU14ZFdHY0pBMk5JVk9aZXZFVEJGWndPTDV4cGtjWXdqT3I3UDBDWURr?=
 =?utf-8?B?Q3FiQjRjc2p3dTF6eWlBeE5NcXNZUTM1UzhCYTRFVlJzVkR1Rzk0aUZ4U1FZ?=
 =?utf-8?B?NEg2VGRUUlVqSk9HMlBIMjZIcndOOUpFUUc2T3MvcjBFNEllanVXT3QySEln?=
 =?utf-8?B?NW5wdERUOWlHNXhzRnExdzVXdDR2OGVFWUZFVnRZUFJLVDYzbE9VT3FMUWxE?=
 =?utf-8?B?Sm1leHVRbWV0bnQ1NzdNRXlpQWoyUkVodjRqbXRReUp1WnBuOXE5SGJNUFNK?=
 =?utf-8?B?MFpGL2FqOEpjdDVPUkp2bWFKa1NEUkhBZVVpM3AzbXYyWnBBOG5SU3lFOEls?=
 =?utf-8?B?dWhQS0ZnMUoxTzZUZUt3QmIrNGhZbGVINTdzYXdyNGFnMnZMVnNXQldZZHRl?=
 =?utf-8?B?aEVsWS9MUXVRTTdTMjB1TVFjRGhLMjB5WnRwT1JVQlo3WGd6R2hLYSt4ME9s?=
 =?utf-8?B?SzJ1bWZCTzAvL0x5dXNxenR5b2lWQWNuK3k5VllKVTR6d0xkek5DcW5CQU41?=
 =?utf-8?B?QTlWbVVJL2pzZ2ZweFBybjdTNFQvdGVkRUdzRkNORmV6dUl5WWdNUU1PM2Z3?=
 =?utf-8?B?anU0OUMxZnh3MzRMUW1LM3ZIVUVITk9MVjVGU3BOektMU3ZmcjhNbVdMK1NR?=
 =?utf-8?B?L09ZdkZuaGo2YkhldGF4dC9jTjFrT2FIYWlSbGwxN3RtejRIN2lvZStETWZD?=
 =?utf-8?B?M001RFZIZnBna1dqS3crM1BaUXhvc0NWWW0wZ0xORGZkc28vMXJaVzk4MGJT?=
 =?utf-8?B?OERXbHlvVmViT1NNU2wwdWcrMUhuVEI5akFVdld5QWdBcitnNDZkT0ZWTjcx?=
 =?utf-8?B?OUt4eGtFL2NiQ1pRaFRYN2RwVVVjNHdzbHlPUmJDdUUxaHI3SnZXZnV0TXNU?=
 =?utf-8?B?UGFTaysyNHNzc2lzaGFnOGcyNTI4MFZ4S3gvR215K2FsS0M5aFZBOW1ObGpK?=
 =?utf-8?Q?efjXwWw06hGqv0MmOjx6rivOg+mV8W6P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am5temdxT2JEUEdTV1VSNFhkcEtLMlh4cVlvR1ZVNzhpZ3NrYkFDUGdEeDV0?=
 =?utf-8?B?R0RuaUlQTDZ6RXhmTTZXNjVPODI1U1VrSkJXM09uTVI4WFoxTjgwTnpRekRr?=
 =?utf-8?B?ME1oSTdaYzc4R290aWxVd3NQTlhySjhQRmVoVUVXb0RuUDl5TzVKZTk0bXN3?=
 =?utf-8?B?K3p4SjhZLzZablEzU0lMb05DVTJvWXpCWmpmcFJVSjJwdi96Q3lQWXpyZldp?=
 =?utf-8?B?OVExOGZpR1dtaGVTVzN6WUUrYkNzMHZXbWViVEdJWTJXSVluS2FQUkNNVkQ2?=
 =?utf-8?B?Z2drVUlxc3pEQjljZTYzdTQwY0VwQzR6R0ZNNUkvMitLdkRrcCtIVnpvZXFp?=
 =?utf-8?B?RVMrcC9uVnpWcStmWUZvM3lYb2ptYWdIa3k2OEFsTlVQa0l1ZWxzNHJZVGY1?=
 =?utf-8?B?dk9qWlRvTVhuRDNRSTM3ZXZhL29XbDI4MTlDRUhjZTV1d3dSQ1ZsakxCVEl6?=
 =?utf-8?B?b2FRUDRVeGdwVE1wYm12Sy95QWFDTUlOZ3BrUzdMYjJlTE43dDZOZ2UwK1hD?=
 =?utf-8?B?TThLNGEwY2lYalRVYy9vZnNmV21zaTYvRWFtVy9GRUNrUUM1VGdLS2xnSTZI?=
 =?utf-8?B?QlNVbVNWTmZ1a0kwdm40MjV6RVB5dVRTVlkrdXZxckFtclQvNkprRmFtdk5F?=
 =?utf-8?B?MFQzRE8wcFFZUXVEaW5MaTNpT2lZZ016RDlVN3AxbVdDWENsTHBERm8zSHc2?=
 =?utf-8?B?U3hka25yWCt1c1hJSVo5N2dROEFTWkY3SGlvaEhxZmJIQmlMM1dncVZhUGRE?=
 =?utf-8?B?ZUxBZEVRTEYzbDhNb1VIQTF6cExyc3pRenBNTFJvK3p1bnF4K3phSy9vNS9l?=
 =?utf-8?B?OTRkZWd5NFV2ODN4dHRRY3huSm03ZjBwWGczeHNuSlByZTRZWUFTQk5LUEUv?=
 =?utf-8?B?TkUyQWR1OHlNM3hKSXdOSmVjN29reHRDUDBQMUd4bzBEZm8zOG8ybDdMUUZa?=
 =?utf-8?B?SldXZm9DZzczUDNEMWtlZEhCSjlWb0paRTRtNHVEaFlJNWMrd2tGZ2ZwOHJB?=
 =?utf-8?B?N0JiUTN1MTRGb2NZWVYwZXdtZGU0Rlk5bU5kaHliTHYwTStlT2g0cnFWT0lo?=
 =?utf-8?B?UzA3NFlMcENMTFgvWTZPOElzVUF1RzZaSnBDeFF2ZEE5NitieUdCSncrdFlN?=
 =?utf-8?B?SVNxNG1kWVdzVUNOSkN4N3Q4REFnQWJWV3N5ZVN3SHYvU21sOFFiYjBoQXFy?=
 =?utf-8?B?ZHJEaGc1WkpzWGJOVGN1OG9YQXp4OGM3L3N1Nm9xcWZha1dzTktZUWV6cXN1?=
 =?utf-8?B?R1pOamNKYXVyaXkwSFNSZ1lTeVhWUGF0cXpXaGJOYTJUMm1ZNytHUC94cElQ?=
 =?utf-8?B?NUVJWWRtRFRYMk5rbThIcnp0YVhBNHg0QnFldTJaMGFxNkZDRkFycisvTkNn?=
 =?utf-8?B?bVFsRFZLNi91U3JlKzdMcVpFOTBFOTliUUhuRlZrSkRSN09GWTRielZWdFFI?=
 =?utf-8?B?M24xRm1MT2N0WXhySGVaSGRVUDdIZk1oYVhKV2dNeXJBLzA5YVZpWXQ5UEVG?=
 =?utf-8?B?SVg5MWNYYlBDdzRNK1RSMnFVcWtzNXpnNFhPaVZ4bDJDYnp4ZFRQZk1DRjFj?=
 =?utf-8?B?eHh2aGc2YWhTVDBLVWNPTFp3YWZhRVFEMVVLSUJQWlg5a01kd2JaY0M2OE1C?=
 =?utf-8?B?RDM0b2dqUGRZSUhXQU9QN2lKOTNUOXRuQ2lqL0svQjJNRG12cnM2R21aN2kr?=
 =?utf-8?B?M1UyMktQcGRZTWpNbDgxTWhRQzBuUUgxV2I3NXhwc0ZoaEtvZTF0cUlBOVdx?=
 =?utf-8?B?aHVGNUo3ZEVDOHE4c2hoeVZ4UXJmRXJzQlhUbEsvK2Z5Y1ZxN2MycHlJMDMr?=
 =?utf-8?B?RUViRU14dDhST3B2Yjk3ZWFUWUpwcWwvUjR0YXNIZllyUnRRUEJUZmJ1cXRs?=
 =?utf-8?B?dGkrSzNKdmtqRlFFeWFUVHFQcVppdnJkUXBXVkkxV2dDWHZ3akIzOFlDd3RE?=
 =?utf-8?B?TXlvT2JRNGx1VUpZYjFETEZYbDJyK2REdnIvMUxVN0ZnSm9OZ1NWYld3RlR3?=
 =?utf-8?B?cHBWQ3h0UHZ0TElrM093L2EwMzZxWFFmZjhLVktwdWNKamdkRUoyVzV5SktE?=
 =?utf-8?B?U2ZnTnp6L2xIU2o2eFRHYm1CbUpEVHdFeXFsQk8wb3lCSDJRT2NEdyszbHY3?=
 =?utf-8?B?dkdZWFphczVGRGkwd1VYVEUwdXJmSmdtek1MMHFPdTFxMndsWEpKenN1a2to?=
 =?utf-8?Q?fVZAeMwPrX2nSjF9QaLSlMY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca34d979-491b-43bf-0e42-08de312d6f2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:00:34.2952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B04A+dJMz9y1bUElyTFPzcn+UlARUWl/J7OkioWWtyZWFXkYlXE+5aTrHm4T/4CrKPyF3I9yytkx+OyFogCbQtBlgrELFzuVaa5J1N+6ElE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
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



On 11/24/2025 5:41 PM, Julia Filipchuk wrote:
> UAPI compatibility version 1.27.0
>
> Update recommended GuC version for BMG, PTL.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 810709f106e7..dcb4a32e7a64 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,8 +115,8 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> -	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
> -	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
> +	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
> +	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
>   	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
>   	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\

