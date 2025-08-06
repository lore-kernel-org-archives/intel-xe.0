Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494DDC87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 05:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB5410E39D;
	Wed,  6 Aug 2025 05:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EM/p+IUH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2C910E39D
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 05:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754458345; x=1785994345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ckw9RfYdy/yIPNCQR+8IQimZWP7NHdTzhaH3TiLmsLw=;
 b=EM/p+IUHJc/10tAMFu6HZm8OaA8kIpkCq/9LsIkdhWM3g+SQ7QvivlD8
 58qpasUI+oojIwkwZaUr+M2EF0kwDuyiRs0HvBrV2dWSeddBAyIOhgUjl
 82/HQbvETrnxwCFMutG8yUKfMd5sFvvYYOnewIrgTtfBPDSn95jUbbFyX
 IvyJYqPgpXlbpM2jZoGZDjTKAUFINLBm7WCO4UG2xJWLMdDlmlh1qvU9y
 AuVR1Wo74xdBMaQXo1PW5gUZUeYb/D5QlU6x++Ma5NBArZg0/xzndlnN9
 /nzjI7twwqycbaP6ag3xgvWe0kUnKq0p1FM640X1eN6cTAGkeemBoLqYV A==;
X-CSE-ConnectionGUID: bRsfdQXUTVeAPBxR8DeL6g==
X-CSE-MsgGUID: 1B7CJ/BYQMK2YNpYg2j7vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74224760"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="74224760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 22:32:25 -0700
X-CSE-ConnectionGUID: OexcoZXMThCRi7WPAQvbEw==
X-CSE-MsgGUID: 5y2KS1F2T0moP6SO7gC67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="188351923"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 22:32:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 22:32:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 22:32:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 22:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiEWUKddNf2X/uCQSFBq79zWzvRrHl3VWW7siqmFnWla71NAsJKjRdRVRYR0kc6vRWxKSgwbxCqRq+3FoxMnqlg0vo6LTh701zpWYijbIqYuAZ1X/vpXnZV5Ewp1X4Wc71AassA0UiFYzmeedMuAvtYu8XIDjVFHvGTTWxhXM3FThPHWEPfYHDNcwv6lk2uL0srvQcDSSlpj1mM2lWYnZXyoAxNXEFGgIR/qSYaUy8AruPQlcQZfmjG2+hs5uCHng/HWsYH4PFV1cRUQRwCKhczRB0lL6T/atzze74UPSlSMoZDarBf9yIlfGj3T3s1zG//VV3+dS53r629TVYT52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuArvy7d61q+TnsKnlPeUtSiXD4Q7r8omkXYeyKmMLo=;
 b=kmR7mMBeb8TMf5xasgybEEDboqijxBBpT9KLLfFk2xaEqg0Fgd+OIBXne5wpuBrxbP4hEs+mbyRYWE02evWqPuyrQP+fC1g53iKME1666y7nNpquz7mqls8ABiFrUTODvm/ZQuCfejp42KESOMod3cqZxzlRP9m4sjkS3N8uOOQHLV3XSCHt2TFcN3OBTJb/sbh8rs2SUHrgktzi9E0cx/XZLchhiBwMiFBXislDxwuMcNejJ7+49wlc4r4q+PTwmJNkxMNDucrBilTGXDECiybjkPRFvx6eSocrdEY/kfeROIPDXukR/30EUZavAAYtv64ToSwf7Y4J3quwMpoPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB5111.namprd11.prod.outlook.com
 (2603:10b6:510:3c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 05:32:19 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 05:32:19 +0000
Message-ID: <05fcc0ad-4f0b-4486-a840-3ce6e01f2f2d@intel.com>
Date: Wed, 6 Aug 2025 11:02:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/25] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-24-himal.prasad.ghimiray@intel.com>
 <aJLU39dKLNb48T7A@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aJLU39dKLNb48T7A@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fd3f3b-4a46-4356-90b6-08ddd4aa9c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzBmSHRvZUtSUWxvOHYxQWFJOThCNmNuSXQ5ZW5mNTBqLzhxRTNQVjIwU2U5?=
 =?utf-8?B?eFpHbGJERGsyWDFnVEQ0TDN6NmpUMjV0T1czYSt0Qlh2Nm5YMkRoWFVMUGJH?=
 =?utf-8?B?MWNyTkNwa2NGenF4d3JuVlFudXlCTFVyZ1NnTE1hYTNvRWV3SzVoMnBGK2tE?=
 =?utf-8?B?YlB5dXB5S0lEUU5pRW5iZHhFK3Q3L0U2ZmtUQ3VBdjVrcjhrajBHeEs5aGha?=
 =?utf-8?B?UFBEay8zZ2V1UHhqUXM1UXpXNzNMSERLY1NOc0JzOVlqeVI2eXdISVp3d0dT?=
 =?utf-8?B?STNSdHU5cEdNZGFxenZrQzVVZ1oyeG1LR3V6SGU3c3NIZW4wQ0M3aUFZdHM5?=
 =?utf-8?B?YzFCRzRwUjNxbktFNUtiUEtuT0ZBU1pmazZKUU5COWRML3lNYmh3OWtqb0dI?=
 =?utf-8?B?N1dUK1lHT2xPNkhBNitEc3NSUndVSTJmUHBiVVZXZWZQblFLanFFTW16OFhX?=
 =?utf-8?B?cE5Ec0JSV0FPeE9GcFU1VzRJUzJIMTJTbnBEWEFjMlpoNjBMM2VqM0krb2x4?=
 =?utf-8?B?TjE1b3NHbUZya1RIWEdEcFoyaUNuZlZ4eGhmckxvNjFmK3BLaHNTcEFUKzVM?=
 =?utf-8?B?ZWtRQ1RRWHZQOVRUOGZxeC96THhNdEs1Tldlb3NyYmNjTURLSHQzcW1la2ZD?=
 =?utf-8?B?ZFRQWWhoQVZET3JhdDI5KzQvMkZFUUVpOCtKbTEvb3Qzbk1xSHFsRzhXZXdr?=
 =?utf-8?B?ZjRrRG8wbHBORkxhSGdkYWtKSjJGbjI3TlJ0K296WllMajJuU0JhMTZPZFNo?=
 =?utf-8?B?QW5iMThWMlBMRWpGMGd0SjJWUzJGNkNOeHJjN1NKTjVlVnAya1dlRGdZTXRV?=
 =?utf-8?B?bk5EUG43YUVZN21RalFEVVRTVEM0Q2VPbTFTWW1PYnlqeC9yVW9PbVV1dC9m?=
 =?utf-8?B?d1Fxems1d0lnSnpQYkhqMkJuQkMxM3FxV2x0S3ZGRE1WKzJ5Y3YvUDBxZTlr?=
 =?utf-8?B?SkpNZGxhMHhoejIrOWdpV1lrZzlxQ2tORU10YWFDMjhoQVpVVUsrQlF1VHRZ?=
 =?utf-8?B?bXlVZXYydnhVbVQrRlUvOUVTWXZOQlhCQjBBVjlVM1VSWVpyYWV3MG1DdWdm?=
 =?utf-8?B?S1NESk9NNWlhMWk0MTFkcGpUZ1YxeVlrQVE5TWZES1V6MEZhTUhGZ0MxQnNz?=
 =?utf-8?B?UVFXL1g3aDJ6RStwTkluUSsyWnlJbTFRbG9wU25tK00yMThwTkhTNTUvWVp0?=
 =?utf-8?B?OXRXNU1DV0hiL1RqUXZncW1uRDY3OTNsQi81b2UxM2o3cUdvWTR6TlJUVUlp?=
 =?utf-8?B?M1Y2MGdlalVVNWNORnNSV1JrMktIcys1dWxFWVQrVzh4SlJpMVdNMVhSQ3VE?=
 =?utf-8?B?b2tKUGQxeGtzTk15eGkyOGtsc01XSzAwM1lrcHZJNlFvenFUSEZ1M0xyb0ty?=
 =?utf-8?B?M2xsbFhTOXlURTlsS0NIQ2NhQXZxUnQ4L3pCN3NlbWJCM1RpWXVsOXd0VVBv?=
 =?utf-8?B?Ulg2c0VsQTBNQVBlMXdQV1VOam9abzNudGV6MjNoYmxoWWRuV1AwOWpIY3J4?=
 =?utf-8?B?OElGb2FxQ016UVZPNmFUVW5Qb3RxY3JNNVUyNGpQVzk5YU9PZGNOKzNVMVpq?=
 =?utf-8?B?TGdhR2RVd3JVY1JIdnZYb1pJZ3QzOWYySWZUeDFlQllTZEdueEhkUENwN1lR?=
 =?utf-8?B?Sm5UeTUwSWdjdzBEOFRQb1RISXBRaXk0YlltUDdHZExWS0FPdC8zMG5IY2lT?=
 =?utf-8?B?YisrRkVweGdMY0FlUk5US3hFaVNtZ05ZM2M0R2c4d1hnY1orQWFkMmFDU1Ju?=
 =?utf-8?B?a3o5ejQzK2RUdWFCRWtleXBORFozYXdFbzlZRXROVHJEd1VleWYzVUs4ckpy?=
 =?utf-8?Q?K4nhn+FX6Tdgxd5H5Uxb/2zEmjxjs9PZMuvf8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUxpcmk0WUNPakYzMDAzckQwa2IxYXREUTdKSW4vWTJlOXlURExnQTB6eGQr?=
 =?utf-8?B?enR3eEpTcG9SeWZaMWl0YU9kTTVjQ01lcDdvb3N5d3ZDR3M0ajRSdmFQbHVz?=
 =?utf-8?B?TGxKRmRRM1JWMzc5MnlPb29RdURtL0hrUCtJUm1jZ21HTGJQNXBGREZCRURs?=
 =?utf-8?B?bFNZSkpwdE85Z3lQQzFYOTJ1VUs2SERxNEJkR3o5NSsrRnFTVkFzTlBsSmV3?=
 =?utf-8?B?TjgxTUh0R3h6K2NGZUJLdERNNUJ4aVhxUHFkTlAwN0trY3Z4T2hHL1dlRGZ2?=
 =?utf-8?B?RTQyZ0pqYUhpTUNzSkZ5bDRRQ0kvRFgwL0NmQ1AwWVRPYXZiT0tXT1NqY1pt?=
 =?utf-8?B?QzlEK2w0RDJwbXBEc2hrZ1k0dGpMaHl0WWg3azlwMmdEQzh2VmFXTEx0V2pl?=
 =?utf-8?B?SlU2OGxGM2VteCt6b2dIQ0pyZkp3VzVGUXNPUFJuZlBiUW5ESzIrWTlHa2RG?=
 =?utf-8?B?a25uQ1RmUU9XTkpxbjVrejFaZ00vTi9jeDVvYTIwNk93VlFXbXhneDMyOVBM?=
 =?utf-8?B?UGp0amdwbWMrWFd2dGdYaXZ2aU45ZnNaSWttYUVFcmdJSGp2VzJlQ1Q0NUhp?=
 =?utf-8?B?ZktoYnE4L0tZOWhBdGJRVEZJdjRUcWdBZ3pGM3lrOXgvRWVMYTlJZm1Sb0JV?=
 =?utf-8?B?bTU3RXBSSVlVakgzMGEwb2JNSnVQRWEzWXI3M3pqYXkraVhrcUp6ZFRDUWRK?=
 =?utf-8?B?a25kcVNTMmFJUFNDbE1VVGRZdjErMUpBRGdOT0x4ckdHTEdGZ09Ed1VGUFJN?=
 =?utf-8?B?MituQ2xiaVRCSURQVTJTQ09Ua200MGNrcmtxTXlLemVHUDZYeDNkTXJZSkx4?=
 =?utf-8?B?Q3VOU0ZvYWxic0N3cGwyL0ZVZnhXbU5VSG9SY1VjakVyRldGbjRKd2ZYN0h2?=
 =?utf-8?B?RGxjUkFIVysvZ1hOK3Jpd3MrYlZiRmp2VXhzQy9iOGM1ZG9LS2dYMmpBMEtx?=
 =?utf-8?B?REZtTUVKRUVmRmpSYzJBTDNLUGJzcXByT3FScURXNEk3alVPY2pjaERYYjBx?=
 =?utf-8?B?VUVQem1RdUVDWFRpV1BZanE2dW42enI2V1BvcU1Jc2VjeXpzSi9tcVNNQ1NM?=
 =?utf-8?B?WjFoL3Mya0VZYVlRWEFtbk5iNzRyQjVBUm9LZ0hoZ2p1WGN4TGNuOFN2NFFR?=
 =?utf-8?B?SndlbGdibHI2TTVrcldlVlZvMHhlZkQ2aXY0bHVzL2pPaktDYWNxSHUxc21D?=
 =?utf-8?B?Vm15TC8vaTRQVUdjeHhNcUtUWW56OXJCbUJlZ0hSdWQ1WjFJNWdkdWJ2SHZE?=
 =?utf-8?B?VVdyS2xycTFEd0Vzam1qdkR3dlNnYUdkMjBIdEVCelorZzQxQXdTWkdqRW9v?=
 =?utf-8?B?WGd0WFUyRnAvOW42N3FjaUlBVTdOQmozR3FVOEh1SFpOSS8xRVViMUJSQXhv?=
 =?utf-8?B?YlpzNXlIQUJIMXZZTXF3bnRXelRJTk5LanlRYk1oV1VON1FQdW4rMWlBaVZl?=
 =?utf-8?B?THdOTEZGMk9zY01YSzduMm83MDZwaWx2S0YvMHVVUU1OYW1pU1dvMml0ek54?=
 =?utf-8?B?cWsvT2JFdHh4NlhBY0hQS1pzNXllaGQrRDV1a0lkK2dBUHovODNtTjZ0V01P?=
 =?utf-8?B?cEVpbkx4N1ltVjN2K1JPQldFUUE4UFVKcW50TWF0dHByYmRNSmpZeGxkQWJO?=
 =?utf-8?B?SzJEa3JzbklrUk85VnNQK1VIVEhGdzhvRDRjUDEwWWo4bkFVaENqUjUvNG90?=
 =?utf-8?B?Y2NmMU5Sc3RoOWFGL3FmdURNcWJOR0lVM2krMFpLSkZjSFQvYTcxTnh5cWhM?=
 =?utf-8?B?MW9FenBEVW9JWEhDV2xqN3ZDZkZ2TExtczBSa1Btd3QwT1VmRmpoMWRzT0c0?=
 =?utf-8?B?MFV6d1k2ZXFHa2VOeFVxdVI3Y050b0lCeHJ3MUdQTlZXSDJtNzFFTWN2SDFv?=
 =?utf-8?B?a2tkdE1pZUJSME9KNEJkNlpnY2IyOTBjMUxlcE9UN3gzS3hKNUovM3pKQmNQ?=
 =?utf-8?B?bXI3ekZESG0vMnNwQ0JsNFhaeUJEU0FZVE1LbDBGL1RnRmJHQldMbWJmc2h5?=
 =?utf-8?B?OHZxWlRQTEZ2SFN4QWRPZ1BaSlJFUzF4L2hqaEw2VHdMc2FtWEYxbW5hL2JU?=
 =?utf-8?B?T3pmajQwYkRmM3hQZldla1ZQbkNTbkFSL1h1MlZDQXFYK0d5UndUeUgxaHRS?=
 =?utf-8?B?ZWhRU1JjdXJLd3kxR1RzSS9nQXR5TmFDSDFod2lBTytIK0thMTBVMDljQmNw?=
 =?utf-8?Q?zyZxWrzjyG217SHF39/ZSF0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fd3f3b-4a46-4356-90b6-08ddd4aa9c94
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 05:32:19.6402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NThYxB3zCag6j8gJqzJlurleQ7xZRTnTYh6ajXMI9yxHVM/HkZdsoctBpPbeMhdkYUnIROSGkjj27BD9OFcwH2QT+c16xPwqEhUHE89IQ40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
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



On 06-08-2025 09:36, Matthew Brost wrote:
> On Wed, Jul 30, 2025 at 06:30:48PM +0530, Himal Prasad Ghimiray wrote:
>> Restore default memory attributes for VMAs during garbage collection
>> if they were modified by madvise. Reuse existing VMA if fully overlapping;
>> otherwise, allocate a new mirror VMA.
>>
>> v2 (Matthew Brost)
>> - Add helper for vma split
>> - Add retry to get updated vma
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 114 +++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_vm.c  | 155 ++++++++++++++++++++++++++----------
>>   drivers/gpu/drm/xe/xe_vm.h  |   2 +
>>   3 files changed, 206 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index aef76e08b460..9b3a3f61758c 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -253,9 +253,55 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>>   	return 0;
>>   }
>>   
>> +static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
>> +{
>> +	struct xe_vma *vma;
>> +	struct xe_vma_mem_attr default_attr = {
>> +		.preferred_loc = {
>> +			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
>> +			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
>> +		},
>> +		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
>> +	};
>> +	int err = 0;
>> +
>> +	vma = xe_vm_find_vma_by_addr(vm, range_start);
>> +	if (!vma)
>> +		return -EINVAL;
>> +
>> +	if (xe_vma_has_default_mem_attrs(vma))
>> +		return 0;
>> +
>> +	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
>> +	       xe_vma_start(vma), xe_vma_end(vma));
>> +
>> +	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
>> +		default_attr.pat_index = vma->attr.default_pat_index;
>> +		default_attr.default_pat_index  = vma->attr.default_pat_index;
>> +		vma->attr = default_attr;
>> +	} else {
>> +		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
>> +		       range_start, range_end);
>> +		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
>> +		if (err) {
>> +			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
>> +			xe_vm_kill(vm, true);
>> +			return err;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * On call from xe_svm_handle_pagefault original VMA might be changed
>> +	 * signal this to lookup for VMA again.
>> +	 */
>> +	return -EAGAIN;
>> +}
>> +
>>   static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   {
>>   	struct xe_svm_range *range;
>> +	u64 range_start;
>> +	u64 range_end;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>> @@ -271,6 +317,9 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   		if (!range)
>>   			break;
>>   
>> +		range_start = xe_svm_range_start(range);
>> +		range_end = xe_svm_range_end(range);
>> +
>>   		list_del(&range->garbage_collector_link);
>>   		spin_unlock(&vm->svm.garbage_collector.lock);
>>   
>> @@ -283,6 +332,10 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   			return err;
>>   		}
>>   
>> +		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
>> +		if (err)
>> +			return err;
> 
> You don't want to return on -EAGAIN here, rather collect it, continue
> and return -EAGAIN once the garbage collector list is empty. No need to
> contiously lookup the VMA in xe_svm_handle_pagefault (in next rev
> __xe_svm_handle_pagefault), this only need be done once.

True. makes sense.
> 
>> +
>>   		spin_lock(&vm->svm.garbage_collector.lock);
>>   	}
>>   	spin_unlock(&vm->svm.garbage_collector.lock);
>> @@ -793,40 +846,59 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			    struct xe_gt *gt, u64 fault_addr,
>>   			    bool atomic)
>>   {
>> -	int need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>> -
>> -	if (need_vram < 0)
>> -		return need_vram;
>> -
>> -	struct drm_gpusvm_ctx ctx = {
>> -		.read_only = xe_vma_read_only(vma),
>> -		.devmem_possible = IS_DGFX(vm->xe) &&
>> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>> -		.check_pages_threshold = IS_DGFX(vm->xe) &&
>> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
>> -		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>> -		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>> -			vm->xe->atomic_svm_timeslice_ms : 0,
>> -	};
>> +	struct drm_gpusvm_ctx ctx = { };
>> +	struct drm_pagemap *dpagemap;
>>   	struct xe_svm_range *range;
>>   	struct dma_fence *fence;
>> -	struct drm_pagemap *dpagemap;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> -	int migrate_try_count = ctx.devmem_only ? 3 : 1;
>> +	bool vma_updated = false;
>> +	int need_vram;
>> +	int migrate_try_count;
>>   	ktime_t end = 0;
>>   	int err;
>>   
>> -	lockdep_assert_held_write(&vm->lock);
>> +find_vma:
>> +	if (vma_updated) {
>> +		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
>> +		if (!vma)
>> +			return -EINVAL;
>> +	}
>> +
>>   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>> +	vma_updated = false;
>> +
>> +	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>> +	if (need_vram < 0)
>> +		return need_vram;
> 
> This is a bit ugly. I think if you have __xe_svm_handle_pagefault and
> xe_svm_handle_pagefault as here [1] this can be handled cleaner (i.e.
> still a static setup of drm_gpusvm_ctx).
> 
> If xe_svm_garbage_collector returns an in __xe_svm_handle_pagefault kick
> it up to xe_svm_handle_pagefault, you catch -EAGAIN there, relookup the
> VMA and call __xe_svm_handle_pagefault again. I think that would look
> quite a bit better.

Agreed. Will update in next version.

Thanks>
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/666222/?series=149550&rev=5#comment_1222471
> 
>> +
>> +	ctx.read_only = xe_vma_read_only(vma);
>> +	ctx.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>> +	ctx.check_pages_threshold = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>> +				    SZ_64K : 0;
>> +	ctx.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>> +	ctx.timeslice_ms = atomic && IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>> +			   vm->xe->atomic_svm_timeslice_ms : 0;
>>   
>> +	migrate_try_count = ctx.devmem_only ? 3 : 1;
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>>   
>>   retry:
>>   	/* Always process UNMAPs first so view SVM ranges is current */
>>   	err = xe_svm_garbage_collector(vm);
>> -	if (err)
>> -		return err;
>> +	if (err) {
>> +		if (err == -EAGAIN) {
>> +			/*
>> +			 * VMA might have changed due to garbage
>> +			 * collection; retry lookup
>> +			 */
>> +			vma_updated = true;
>> +			goto find_vma;
>> +		} else {
>> +			return err;
>> +		}
>> +	}
>>   
>>   	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 5ee38e9cf6c6..e77c04f92d0b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4263,36 +4263,24 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
>>   	}
>>   }
>>   
>> -/**
>> - * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>> - * @vm: Pointer to the xe_vm structure
>> - * @start: Starting input address
>> - * @range: Size of the input range
>> - *
>> - * This function splits existing vma to create new vma for user provided input range
>> - *
>> - *  Return: 0 if success
>> - */
>> -int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +static int xe_vm_alloc_vma(struct xe_vm *vm, struct drm_gpuva_op_map *map_req)
>>   {
>> -	struct drm_gpuva_op_map map_req = {
>> -		.va.addr = start,
>> -		.va.range = range,
>> -		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
>> -	};
>> -
>>   	struct xe_vma_ops vops;
>>   	struct drm_gpuva_ops *ops = NULL;
>>   	struct drm_gpuva_op *__op;
>>   	bool is_cpu_addr_mirror = false;
>>   	bool remap_op = false;
>> +	bool is_madvise = (map_req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
>>   	struct xe_vma_mem_attr tmp_attr;
>> +	u16 default_pat;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>> -	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>> -	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
>> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
>> +	       map_req->va.addr, map_req->va.range);
>> +
>> +	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
>>   	if (IS_ERR(ops))
>>   		return PTR_ERR(ops);
>>   
>> @@ -4303,33 +4291,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   
>>   	drm_gpuva_for_each_op(__op, ops) {
>>   		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +		struct xe_vma *vma = NULL;
>>   
>> -		if (__op->op == DRM_GPUVA_OP_REMAP) {
>> -			xe_assert(vm->xe, !remap_op);
>> -			remap_op = true;
>> +		if (!is_madvise) {
>> +			if (__op->op == DRM_GPUVA_OP_UNMAP) {
>> +				vma = gpuva_to_vma(op->base.unmap.va);
>> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
>> +				default_pat = vma->attr.default_pat_index;
>> +			}
>>   
>> -			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
>> -				is_cpu_addr_mirror = true;
>> -			else
>> -				is_cpu_addr_mirror = false;
>> -		}
>> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
>> +				default_pat = vma->attr.default_pat_index;
>> +			}
>>   
>> -		if (__op->op == DRM_GPUVA_OP_MAP) {
>> -			xe_assert(vm->xe, remap_op);
>> -			remap_op = false;
>> +			if (__op->op == DRM_GPUVA_OP_MAP) {
>> +				op->map.is_cpu_addr_mirror = true;
>> +				op->map.pat_index = default_pat;
>> +			}
>> +		} else {
>> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
>> +				xe_assert(vm->xe, !remap_op);
>> +				remap_op = true;
>>   
>> -			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
>> -			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
>> -			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
>> -			 */
>> -			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
>> -		}
>> +				if (xe_vma_is_cpu_addr_mirror(vma))
>> +					is_cpu_addr_mirror = true;
>> +				else
>> +					is_cpu_addr_mirror = false;
>> +			}
>>   
>> +			if (__op->op == DRM_GPUVA_OP_MAP) {
>> +				xe_assert(vm->xe, remap_op);
>> +				remap_op = false;
>> +				/*
>> +				 * In case of madvise ops DRM_GPUVA_OP_MAP is
>> +				 * always after DRM_GPUVA_OP_REMAP, so ensure
>> +				 * we assign op->map.is_cpu_addr_mirror true
>> +				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
>> +				 */
>> +				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
>> +			}
>> +		}
>>   		print_op(vm->xe, __op);
>>   	}
>>   
>>   	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>> -	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>> +
>> +	if (is_madvise)
>> +		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>> +
>>   	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>>   	if (err)
>>   		goto unwind_ops;
>> @@ -4341,15 +4352,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   		struct xe_vma *vma;
>>   
>>   		if (__op->op == DRM_GPUVA_OP_UNMAP) {
>> -			/* There should be no unmap */
>> -			XE_WARN_ON("UNEXPECTED UNMAP");
>> -			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
>> +			vma = gpuva_to_vma(op->base.unmap.va);
>> +			/* There should be no unmap for madvise */
>> +			if (is_madvise)
>> +				XE_WARN_ON("UNEXPECTED UNMAP");
>> +
>> +			xe_vma_destroy(vma, NULL);
>>   		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>>   			vma = gpuva_to_vma(op->base.remap.unmap->va);
>> -			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
>> -			 * to newly MAP created vma.
>> +			/* In case of madvise ops Store attributes for REMAP UNMAPPED
>> +			 * VMA, so they can be assigned to newly MAP created vma.
>>   			 */
>> -			tmp_attr = vma->attr;
>> +			if (is_madvise)
>> +				tmp_attr = vma->attr;
>> +
>>   			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>>   		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>>   			vma = op->map.vma;
>> @@ -4357,7 +4373,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   			 * Therefore temp_attr will always have sane values, making it safe to
>>   			 * copy them to new vma.
>>   			 */
>> -			vma->attr = tmp_attr;
>> +			if (is_madvise)
>> +				vma->attr = tmp_attr;
>>   		}
>>   	}
>>   
>> @@ -4371,3 +4388,53 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   	drm_gpuva_ops_free(&vm->gpuvm, ops);
>>   	return err;
>>   }
>> +
>> +/**
>> + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Starting input address
>> + * @range: Size of the input range
>> + *
>> + * This function splits existing vma to create new vma for user provided input range
>> + *
>> + * Return: 0 if success
>> + */
>> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +{
>> +	struct drm_gpuva_op_map map_req = {
>> +		.va.addr = start,
>> +		.va.range = range,
>> +		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
>> +	};
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>> +
>> +	return xe_vm_alloc_vma(vm, &map_req);
>> +}
>> +
>> +/**
>> + * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Starting input address
>> + * @range: Size of the input range
>> + *
>> + * This function splits/merges existing vma to create new vma for user provided input range
>> + *
>> + * Return: 0 if success
>> + */
>> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +{
>> +	struct drm_gpuva_op_map map_req = {
>> +		.va.addr = start,
>> +		.va.range = range,
>> +	};
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
>> +	       start, range);
>> +
>> +	return xe_vm_alloc_vma(vm, &map_req);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index f735d994806d..6538cddf158b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -177,6 +177,8 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
>>   
>>   int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>>   
>> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>> +
>>   /**
>>    * to_userptr_vma() - Return a pointer to an embedding userptr vma
>>    * @vma: Pointer to the embedded struct xe_vma
>> -- 
>> 2.34.1
>>

