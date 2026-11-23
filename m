Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7268606A6A3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lgQ3zlgf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BhV0Sc+3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ACF10E0C3;
	Mon, 23 Nov 2026 09:49:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3140D10E0C3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795427379; x=1826963379;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9TdGe73zKVsVLo4tcYbQSedaw5zq4Wc8lDGxI79qsmQ=;
 b=lgQ3zlgfWAL2zLIlMLSqxVznBiIyR2IpGMVj3/aWhS2FYfp/xxfcujWk
 eiR4M8ApoR/AQ+d7KHpHqsGYYEdTmilW3Ik1D/rIXUG2pL/WJEyI9R2hL
 L5nP+fMh64yBeMr+jjfIp4kU1vftUCHUfdjCJR04R2eitIFB4DDAT82tu
 wKGHsSELAjdtcUNbLkN9PZc2a0vcMPuK9cMVoqTX9rzXNflX31L8ADvEl
 mbHo0nLtbAiZtUPZEdwl32ChtuP/FHYxJpaud/s4GmQSGVPsXoQPVw4FG
 ZGPkMnUhseRSkbggTHVDWZ/TMHAUFkO9hmReOPYLxjNJyMlgRr5C5Tgvc g==;
X-CSE-ConnectionGUID: M1O3bjlARWOpJJ/foRc25Q==
X-CSE-MsgGUID: vvFm0gISRemuQ2MVD2u7Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4271456"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4271456"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:49:38 -0800
X-CSE-ConnectionGUID: fcclVySvT660IWFunzLBOg==
X-CSE-MsgGUID: 7UTADwWFRVawy1SRtzEn8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11039314"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:49:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:49:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:49:37 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:49:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1JEMbAZgpTQd1DtN4JsNYf39s8yqCCvy/rB1ZsODtCzqZFuo6pSiNpG1iudKX1MuQ7zXF11atkli3AyuDpjo6xq0hpoI8wWUrQ+CPd/mJnYD4yCXSvzHDUzKXFCKyvcnUnRnu/LQ2c0Hh7WHiAZpFH+1t83LN2mp3zKRywOF0rzY3ZUkdYzwCyUe2ruifPG/c2UqlT3vO22agLixfCHuzFC6HUN4tkgPirkbQqEXM/3WlQG5E7FwLHMtNsKiq0DHf3DADMFJF4oi68oDH9tjsOQST9KOoa/SMx3aPDcHAvR5ZYrk5DmMkasVJA4m3HaP6nzgiv3e7SJX68Efvw+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krqmy4F32YR9plAS8cc+eKQM1xijlAPr/9Qf2c41qhc=;
 b=TCNoZtG4QC1IkPD4LR8Rn3YUrqPDILCMSK+yqPuEPBjOcRf4kZy1ZRf5xOnuau9utLa7DdKCGd18QFkoHNuu/hgd0KlyCG/cz0/cjj1JUb3ncL3um3l55maeiR/WRzKomQkdhGRzsRcxNp5YCyd8LWd7knhGWhyee6F5LeL/cRjD8p0ulu7Cz7TljK+09/a5MVxoqpB/11AxqRPcJKlgb+WIUTxm62BoBUZiPeM/fmT1GCT+hJV9KWVphV4iAJXN91Qker8b6FMSAEQQV5Sq4KgagonronFfoxRcj0Ok6wvwzLbD/0Bh0J2wQdTg5I8dEVxD6SraWFpMEScFejM16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krqmy4F32YR9plAS8cc+eKQM1xijlAPr/9Qf2c41qhc=;
 b=BhV0Sc+3VstlkMMjaQV192siCWH+4r079HlsemQ1UYx/fn8glMuzEj+JVawxoFqezaiHQfJir170YIwCvQ3GkGiChLK7kyxtHXCbwOnQ2Ke7tPxsoZmoYDLgASjr8DJXJLiNSMVQN4nsufswtb+g1eKKMTBrLDILtNb9AvwH3jg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by BY1PR11MB7982.namprd11.prod.outlook.com
 (2603:10b6:a03:530::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 09:49:34 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:49:34 +0000
Message-ID: <36c174dc-7653-476f-8dab-e0e905b2d594@intel.com>
Date: Mon, 23 Nov 2026 15:19:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20261119104029.3066660-1-karthik.poosa@intel.com>
 <0c4c526e-e181-4702-bf14-2794c191fa9d@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <0c4c526e-e181-4702-bf14-2794c191fa9d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb90043-e089-4eb9-8f11-08df49471417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|4143699003|261022105027099003|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261026140227099003|261028144727099003|261026121527099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: X+zvC1d6xCs46IIMXGSIiIZrtx6DMkoI1jpQeCUBpKlR33106p+wDFLtWuwT+BAUOsTXWKXzx17iUYXM8KWPFC7uGrMogxrty13FkVAqF97WRaAoY6XXtkw1lp7xwiO5NHKq8qhIu2fpjl91qHczZfTv3Lve2wKBc3WXWEcd/kd4+cwZx8S2rNNQ/9grRqE3tPxsgacitL3YbZHYHlPpLY8CeHmgl0yvFHKWZNZR5gxaVf2/87KIPuOX6AjOrv7cf0YqHNEtj3LWAPYJpepLreVUVeN3RQW+0vuY8OiUi7wiVlE5kNowHHCBbA/d/DqJ6YRBvnDkHOG42sj3cvUE7xpUiIgCxutFu5da0OsBrtDRTjPkT4l34HDtpgJ1POLiKpVk3XKXjTV9pkidIMtlt3GTtspcASX00qzGuTOTNYQ4iwXD8++YUoO6gFRLlvgSXMfcGpuzV5N0ypRQLtgVQ2WUuHG/Wf3DBEcLdj358q+xTs3PSQ6cejslU+rNfWXbE90h1Ja0oBeq9+i6Qz3g6Fak0HFtDwdittyezPeZb7FjoZjd3x7vxD1YM9M1XY3AplfAq0MPY0oF+Z1BneQ1EMx9qgcqDWVGyRGxeKaIVf1aM83Oq5k4oxBWowQyQ7Qz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FT1PR11MB960200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(4143699003)(261022105027099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHRmK3cvQmM2bTVvOUx3dEhjaVF1c00zcTdqWktINHV1MCtZbE1USTk5M3ZG?=
 =?utf-8?B?Nkt5MG5FdnQyeFI0S3IwZWo2RUg5QWhHdDdkVDVJZnlqdFl4dnVoZFdtbTYz?=
 =?utf-8?B?Ym9WWjdiZTNGT0xBQjY0bGhESzF5N3pVZmR6R0FRaE9wc296Q2pjT0FIYXFp?=
 =?utf-8?B?elFlSFJuQVBtQjVIbVIxVDM1Q1N1ZThxeFR3TFl6UU01ZVFPR2NZWFNSWEl4?=
 =?utf-8?B?TzB3ODl5MzhaZXVmTU9QTElZK21XeXV6ZFgwU0VZR1AyNHg1aDRUSVJRcEl2?=
 =?utf-8?B?bjNmd3k0MTRrcEtrdkJqTUFyTXlpMkQrQmtGWkgxNGxXdEZtK0M1OTZYQjNP?=
 =?utf-8?B?ZUdmaFd4UDd5bDFJeDgzOGhnTzB5RUNjeEJEdHR1QUFoRUd5UDBDaHAyQ0o5?=
 =?utf-8?B?LzVXbUczWmx3TStHdEJOdlFodkhwR3NhLzQ4WGpWeXRvUWxCZDRIM2pWYnN2?=
 =?utf-8?B?OU1uY0NlZWZNL21RK1RneG5nWTgxM3A0ZEZiL1Biem1LL295aFJWU0wvYm96?=
 =?utf-8?B?YUhXcjFTTTVEdStKS1RNUko5Z3M1R2FwRkZPd1V4a3ZWcXBvUE1Xc3dsa1Jr?=
 =?utf-8?B?WEZKd3hLa3lBekVYaCtyazNzZ253T3hsdzJPTENMMjU2N2h0akhRWkRsQTc1?=
 =?utf-8?B?alhlQnJPQXhBUEF5QkpuWG1yczRqVmpZZ1NoYjBxTXFUKzNQRFlvZFZocDBO?=
 =?utf-8?B?QTVvTmRwQyszbUV2RG1mcHR5L3pJQ2lNY24za0djU0pQRTRnK2xmckcwcnR3?=
 =?utf-8?B?eHlsamUzcExJSGUyNS8zMS9MdkZxVGlUNWJaWEx6a0dWWmd2aEswMXhrcDdq?=
 =?utf-8?B?UjFpdk8yNURxVjdjdkNkRW9GTEZDYTVtWlM0eG9ibDhTRnY2RUtnZVc4T3BF?=
 =?utf-8?B?S2xmRjk4L1JVcFB3WTE2WnA1UlpSQlZsTWJvd1hiN21LQkdObE5FZTd0bFV3?=
 =?utf-8?B?Y0lZOGt0TlQvNllTcnR4T2gra05SeHBvUnN6dmNmcTF6ajYvazBWSCtTdm9P?=
 =?utf-8?B?RnlQTXRnMFpEeExRSWlLSnFFVE44S0JTYzJjNmd2V25kazZEWG5FQjVWLys5?=
 =?utf-8?B?S1pLVTg1UUlEUDhvRVBYRmZIWFFlVWJrVUNvemt3ekFkVTNJL0VZN1hKWVFu?=
 =?utf-8?B?SG9tMUJ1YzFCMVE3QjdFWU1wdUhvUnBWdGdmdUJ6RE4ybXRLRVJKd3lqclVq?=
 =?utf-8?B?cWxjU05Hd2tJemphRFFRcmlWa0RaaWkvbXVEZmdTN00wWVVRNUE1THpETW01?=
 =?utf-8?B?cFhjMzB0M2c5aEFheG1qUnV4VzVJbDlVaU1aVDAwbzYzTmJ6MEpERjNmUFFG?=
 =?utf-8?B?Y00zaXdEVXZFWDNwV1dFMHBwMUtBYkxPbHhvTXVmdzdpY0xpTnNVUDNld3FO?=
 =?utf-8?B?dWIwWGZCK3NWcXUxcThqbHlCWklZRmtiSTZBWkVLYmlRd3N1QVZtYWt1QWhM?=
 =?utf-8?B?dkl6OXhrb3prVkFrdTNQdmlEamdhSTdqWnVFUTJzcWlBSHZmYzF0M2NEZGNp?=
 =?utf-8?B?R0VDdkJ1RGpxSDk5TkpoZDJjZkxvU0x2TFI3aE9tVjRHSlBTQ0ZHdWU1YmJX?=
 =?utf-8?B?bk43NHRNeStzZWtHdVYvRHJYUld3UXJ5RHQ0UWlpam84czlVRTlTY3VSeWl0?=
 =?utf-8?B?V3RxanFlNEpRODlSNlRubWQzUzR6OVdHNDMxaGFrSDJiQlhVa0RBa2c2QUpZ?=
 =?utf-8?B?bXNhK1FycXpqRGNmcGNOVWk0Rmt4cjZCai9XUFZUbkdPTTI0Y1VLc0wxNU9h?=
 =?utf-8?B?dWxYNzI4VnFZcTFXRGlBZ1NXZjJzbzlqMDFIVG81Ym1tV3ZSaFlDa0hMaHkz?=
 =?utf-8?B?cHFKR3lCdEpsSjNGU2U1cWtrNndpeVVaK1dmRFQrUUVqQTBqMTF1Nytaa2Rq?=
 =?utf-8?B?T2xIRll6RFdudFNuZWVuMHlMSUx0UVcxemJoTE5hNjhiSFdaTXVTSDR2Mncy?=
 =?utf-8?B?WUxjMjd4a3RlZ2N0MXRZdHdoelQ4K25pRDJSOU9jMEhSVWhxVHJHT0x5bDFk?=
 =?utf-8?B?NVRQMWRINDZDRVhuNHFsckhUUnI0bU8vNlo5Z3oveitWRUozODljZEtSSmhq?=
 =?utf-8?B?Z3k4Sk1Vc3VqYjl6d09kcldqUVlTNEJZVzJQQnhGZmZ0WHFYT1hqcmZKRGpM?=
 =?utf-8?B?dHVhNUt1b01oS1JMcFZBeUlydDlwamFCRnR4eEwvQmV2SFhBbStvZDRqdEFM?=
 =?utf-8?B?TXRoTFBPazgvSTlPUmM1ZlRrS3NLeXdzK2ZaWTdwWFBGRFJMY3g4VlpWRHNG?=
 =?utf-8?B?VUpTb0lrK09QM2tvS2c3Nm9tOU9uRHNvSU9kbzg2UVZWN2wyUHUxVHc1MXZP?=
 =?utf-8?B?Qmg5bXBta0JqNjFwZ2p5M1RXK0RyYWtMdktsQzRYQ1d2U1o1ZkJLUT09?=
X-Exchange-RoutingPolicyChecked: P1p8N0j0gSU2TUwj0hMq1qdUpLE6NlPprIa4GOy+GKiyIhxUn9aFYTxR6H811nE33FQuHoWWKRLPSQ6feHQlo1h/gFKtsukwkpJcenI52Nn3GZQibFrspf42IaTjjWKvZRabR7TtFAo0zLHEKGOR8J3b6rAbo+uusA2WSoz18JCdmfO5kEKUMXaCKte5249ms27wmxoZAi3QqZd5qouX7hRabuevis37encWo0CCvDDTC6EbIcoDmgqO98j6qa/ccpxGfnqAy06Mg8MAFihf2X3iCVDyr73BmsJhbG4w3cAsV1A+LLTMXYCx+RU8pbBxqyzaVR31k9bQCIRBXCZOMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb90043-e089-4eb9-8f11-08df49471417
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:49:34.1832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /l8xjIw/eYRJeHA8iqId0vip+CJgiYEvaLlhpt+q/3E2oueP43drKsDvo7gB4EFtJZozhnCIh9oxFBXD3gdyyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 21-11-2026 18:53, Mallesh, Koujalagi wrote:
>
> On 19-11-2026 04:10 pm, Karthik Poosa wrote:
>> Add a read-only power<i>_cap_max attribute for the card and package
>> channels. It reports the PL2 (burst) power limit that firmware sets at
>> boot, which is the highest value userspace can write to power<i>_cap.
>> The attribute is present only on platforms using mailbox power limits
>> where PL2 is enabled at boot.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 11 +++++++--
>>   2 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 0da739d9a816..097902fd8346 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -296,6 +296,30 @@ Description:    RW. Package burst (PL2) power 
>> limit in microwatts.
>>             Only supported for particular Intel Xe graphics platforms.
>>   +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_max
>> +Date:        November 2026
>> +KernelVersion:    7.4
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:    RO. Card default burst (PL2) power limit in microwatts.
>> +
>> +        This is the firmware-provided default limit and the maximum
>> +        value accepted for power1_cap.
>> +
>> +        Only supported for particular Intel Xe graphics platforms where
>> +        PL2 is enabled.
>> +
>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap_max
>> +Date:        November 2026
>> +KernelVersion:    7.4
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:    RO. Package default burst (PL2) power limit in 
>> microwatts.
>> +
>> +        This is the firmware-provided default limit and the maximum
>> +        value accepted for power2_cap.
>> +
>> +        Only supported for particular Intel Xe graphics platforms where
>> +        PL2 is enabled.
>> +
>>   What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_interval
>>   Date:        May 2025
>>   KernelVersion:    6.15
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 515b288f18e5..023a317a443e 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -865,8 +865,9 @@ static const struct hwmon_channel_info 
>> hwmon_temp_info = {
>>   static const struct hwmon_channel_info * const hwmon_info[] = {
>>       &hwmon_temp_info,
>>       HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>> HWMON_P_LABEL | HWMON_P_CRIT |
>> -               HWMON_P_CAP,
>> -               HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | 
>> HWMON_P_CAP),
>> +               HWMON_P_CAP | HWMON_P_CAP_MAX,
>> +               HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | 
>> HWMON_P_CAP |
>> +               HWMON_P_CAP_MAX),
>>       HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | 
>> HWMON_C_LABEL),
>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, 
>> HWMON_I_INPUT | HWMON_I_LABEL),
>>       HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, 
>> HWMON_E_INPUT | HWMON_E_LABEL),
>> @@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon 
>> *hwmon, u32 attr, int channel)
>>       struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>         switch (attr) {
>> +    case hwmon_power_cap_max:
>> +        return hwmon->pl2_on_boot[channel] ? 0444 : 0;
>>       case hwmon_power_max:
>>       case hwmon_power_cap:
>>           if (hwmon->xe->info.has_mbx_power_limits) {
>> @@ -1486,6 +1489,10 @@ static int
>>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, 
>> long *val)
>>   {
>>       switch (attr) {
>> +    case hwmon_power_cap_max:
>> +        *val = mul_u32_u32(REG_FIELD_GET(PWR_LIM_VAL, 
>> hwmon->pl2_on_boot[channel]),
>> +                   SF_POWER) >> hwmon->scl_shift_power;
>
> At line: 
> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/gpu/drm/xe/xe_hwmon.c#L1501
> What happen when pl2 is nonzero and scl_shift_power is not 
> initialized. it will show 8x high value. right?

you are right, we can move the assignment of hwmon->scl_shift_power(), 
before reading the power limits as below

@@ -1824,6 +1824,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon 
*hwmon)
         struct xe_reg pkg_power_sku_unit;

         if (hwmon->xe->info.has_mbx_power_limits) {
+               /* Mailbox units are fixed; set them even if the limit 
reads below fail. */
+               hwmon->scl_shift_power = PWR_UNIT;
+               hwmon->scl_shift_energy = ENERGY_UNIT;
+               hwmon->scl_shift_time = TIME_UNIT;
+
                 /* Check if GPU firmware support mailbox power limits 
commands. */
                 if (xe_hwmon_pcode_read_power_limit(hwmon, 
PL1_HWMON_ATTR, CHANNEL_CARD,
&hwmon->pl1_on_boot[CHANNEL_CARD]) |

>
>
> Thanks,
> -/Mallesh
>
>> +        return 0;
>>       case hwmon_power_max:
>>       case hwmon_power_cap:
>>           return xe_hwmon_power_max_read(hwmon, attr, channel, val);
