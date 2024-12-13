Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1A3E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 19:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCE610E14A;
	Fri, 13 Dec 2024 19:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWh0OkM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1451110E14A
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Dec 2024 19:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734118022; x=1765654022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YpdxKy8JQa905DYWhHw3Y3Sgvyr+V47VVZi21pnVRmM=;
 b=DWh0OkM6KsSbtP8OTmdOukmGRCFap4wbE2gG7gSiKwg0T4+kI9f4ksQv
 rC2I5NWvtLFLibYXOZICx9ytOvjcAHYF033PJwWIMVWpLijiKiJWxlKm2
 9tLYLUGOkzYyuB0Uoem5VLFzjFiKhINnFqoxWZphi6UoBt8ZXABzKxx8c
 fjBpLe6Zjrl277bqsp1gB7GY17wPG5MMNvNX95S41Fon93XOYg7oGHA1H
 XxkAckrL8Ewas5giVm/x/pC26MF//lTPnIp6J8QjXx+yyvHietGhexEp3
 fdSFg0ev+ETiOrQldoIa73hGIW2pcfMdizYctp/bENH7qVQRbrtd/RwL/ g==;
X-CSE-ConnectionGUID: /oEnZUJZQcaMT1DF5ayKnQ==
X-CSE-MsgGUID: O4DDVMmBTM6Ou2DFDfMjoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34482566"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34482566"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 11:27:02 -0800
X-CSE-ConnectionGUID: wzMKopu8RsuMEAGfOE3A3w==
X-CSE-MsgGUID: VCNAjyxlSTOL98jYw7Xpzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96487045"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 11:27:02 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 11:27:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 11:27:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 11:26:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRgZ7hwQcl7tHsixF3mViTDcFrdkSyLOc1xcTTF74LmBY2so63hsA7C0VurjXpRKakFBfOsjXmnu42/Dag6Pp9mBpSAmCVF4dcohST17QCmAROszaLdYLdCUwaAI399YeoQkVFkuYru5mpvBPSublTJYUPg/ps4ToMlpn2u3QdME28gYw3j8ZABqIfnL0W/WGEwEimZltVMRdseE38H1POnKVtgSsnEOckjhqWY+3+GodbQanDE2sTyZF5BQGSWl+tg9sU9NAySWblBRkSL3T34iRIElr6LaUBRXtAHiZnA9ZqJeWsom0Gnk0V39kXluzb/ZWoabvHu7oR74Uo/7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpdxKy8JQa905DYWhHw3Y3Sgvyr+V47VVZi21pnVRmM=;
 b=kb0jOJpSksmOqHniYKLXG0Ro+2ZVkZuvbi65Jtf7aqrwy3o7ug8avPcZx14VWJ5WCHBjZJAN3+9q2PuZ12GTsAKf+GuXn1k12aGQxVW8KvA+a0F84JLWFWQcMD9MFootpXkUcICSYN6iAkhf6jsyC/vQDDvOIDxnef1IOE/vLvfEK5gPirhrFkrhqItpMWFA/bWKOVzmTT4aWVgVJNOfFdUXp+MwAiuDXKQeVIRzcinuhNedwmRI1BX69GJZZjVtR5oEMUN480QE1yPy62tSM23OZTpzv+0n+EK2j/JFj03BzirxOb9kLTjDchPyarGVUAEZO1KjJv+vbsevzY2d/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS7PR11MB6151.namprd11.prod.outlook.com (2603:10b6:8:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 19:26:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 19:26:57 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Revert some changes that break a mesa debug tool
Thread-Topic: [PATCH] drm/xe: Revert some changes that break a mesa debug tool
Thread-Index: AQHbTYR54naDHFJjSkmV5LTUIX2+arLkjuYA
Date: Fri, 13 Dec 2024 19:26:57 +0000
Message-ID: <8fa47b562f86a647d36a143a1daf139c59b3e390.camel@intel.com>
References: <20241213172833.1733376-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241213172833.1733376-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS7PR11MB6151:EE_
x-ms-office365-filtering-correlation-id: e504cbcd-1562-4e5e-3488-08dd1bac1c0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RXRZQlNqU3h1Q1lFTHNIR0xaMnB5bUhCUGpPSnVZQXZWejNGaGRSZk5zWXlQ?=
 =?utf-8?B?WGZiVThKREZ5Q0pPV3ZXVHhsUXBrVjJGT2dyM2MveDVXWlVnL3hFSm9CVzAx?=
 =?utf-8?B?UzgyRTFjWnFNL21NWmRLakJWTm5jeUd5NG5yaGl6VE0yZlcrZ2pUZmx4VWgr?=
 =?utf-8?B?d1ZtQTVhNzBLcHMrWXh5cnhGQUxvRlYyZkRYMzNhUG9oeXNTZ1d2UmQ1NVlz?=
 =?utf-8?B?YnJ2dWNTci95MmRNNUpvVlJjZEwrUTRSVlZwZS92TFQ1d3FWM0FWcXNsZ1M5?=
 =?utf-8?B?SFlja1VSSmtUQzNOcFh3TmFsWjN3ZmVnZTl2VU5CODRDeDdSWWxiZGR0UEFz?=
 =?utf-8?B?c3lsdmJDekN2aXBrODVLVFpYSGxUMTJ6cU9pWXdGRHNKVm5NMFZxWEErNExh?=
 =?utf-8?B?aFZWM3J5NWhRbzY1YVpZYzdJdlVRTEd1Mlg3TDV1Y2hIejBjelRJS2RpOUlh?=
 =?utf-8?B?SzhYZDJ2NnR6M0wzYzFqN29wU2gwS20yaEdmSlhuSk9TKzhMcHFhVUEvTkc0?=
 =?utf-8?B?dnpuYVdTdXJ4bzRaOFFGYnNXVlpQT3ZXVEY3QnIzU2lMUkEvb2V2SVhrSUZo?=
 =?utf-8?B?R3p6UDhJY3JVeEZkeHRtTzVsSVQ0ZWN4T0ZvSytHVzR4ZVZTQ2xwdE1OTThm?=
 =?utf-8?B?eWFTZjFDS3p0cElPbFVhWXBKTFZkWDZHVFQwN3k5WFVVNEdJVzh3amRWVnZM?=
 =?utf-8?B?UERSNS9LamZHRCswSGNQYVEzYWJ1aE5OUHJJbXQ0d25BMFhKTTliTlMrN1hF?=
 =?utf-8?B?K1pqUnBmblVZTFhSTFBUZjM3TmREVUJXckNRcHJWcnhSa2NCRXJxc2tqMWlS?=
 =?utf-8?B?UjZPbjA4OTJnbWVyTkI3MEFJbFJ5ZHYzYXRwVEhTZDlISjNGM0Jxd2VkUmIy?=
 =?utf-8?B?YWoxMUhxdWNmcDF6RVZWM3F6Zk9HQzdUbXVBbnl4Snk3dEoxK09VeXo1cXFK?=
 =?utf-8?B?TStiM21ndnpnS0cvdzBvMGdzU2x0ZWp3NG5QZzhVaDFaTHYrdlg2R0w2RnVh?=
 =?utf-8?B?bXkwZkEzNENxZG5EUTJRL1UzYm82WCt3SWdmSEJLMlViNEh1UUthdVpaM0ND?=
 =?utf-8?B?enJIczVyS0lhMFFYdUhjeFBvSmRoRlUvVWd2VjhLcUZhMzdVcVNmV2MyTEFp?=
 =?utf-8?B?U09VeWRnT3BHMnI5dFJBZkNXc28rT2lqNTB5aFR4UjR3cmQyZkhqTHczZUM5?=
 =?utf-8?B?a0xYRnF2SFEyalNkM2xuY0JLRG5UWHVyayt2cHQ4YTlIZG9oMGVBT2FLT0da?=
 =?utf-8?B?Y1VCcXBHQ25NN3VYelQ2dzVRNUVKS0trZzY4Q3BCY2d4WG5STzZ4ZWJDM0tX?=
 =?utf-8?B?T3g2emFOQi8yQjgwMlc2NUJaK0F2Y1ppd2FNSTJNeTNVbENlWlYzVFpBSG9E?=
 =?utf-8?B?cTVZbjBhaDViZTNuTEtsWDhYZWErcEtCdzQxWHlmL2JWSkh4cnozaGwrc3dh?=
 =?utf-8?B?SXNZTERrMm1IMzFudmx5SS9abHZpL2FUTkYvTUZ6R0VFSmdORk9xbEhzbktP?=
 =?utf-8?B?R1NlcFFxOFpHZnFqSU1DL2poVWNPakoxOUNmL0EvM29pc25zZ0F3ODhBL2oy?=
 =?utf-8?B?T2VzUWQrYSs3bm9LSm9MbVYyMXB5a0Y4aUp3VTFESnp6MzN2Tmd0a0YyaVFs?=
 =?utf-8?B?Z1A5OThHWjJKNXAyVkhIRkFyQXJocWhmOUtBUGtTRkVWTEpzQVgvK20xNTZI?=
 =?utf-8?B?Tk9YemVSaE5odnY4Z0tUTWhKR2hSczROcmtYQkR3c1UxQVJiS2laYmJnMnFL?=
 =?utf-8?B?bW1rQTFJa3FmNG1mN2xXa29YRENQenB6RmQyemRPR21FS3hiK0wzRVJlU3FY?=
 =?utf-8?B?bmxoMHpaZStMQ1hveWVpZFFnSU5ERjlYbmN1NWJHSFFUMHljWWt3RzZlSDg5?=
 =?utf-8?B?THNPSE83TElUZXhVbVJMaW9YbUhTQTBOVXgxejVHS3BYNFZSekZudUtTL1lR?=
 =?utf-8?Q?BYvdpi3kiHrHhKwnYHzSFKD7tW9LrHf6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTl0MVIwUlgwaHd2SElaRGE0S3hxWmV5M1VCb1hwaCtGWmRsMVdWbm9nVGdB?=
 =?utf-8?B?bU9lVDh6YVVYVjgyOWpJOU51OFBJUU5RZ24wOWgyUnhwd29BdnpkVitnZnR3?=
 =?utf-8?B?cG1kK2w4RENvb0E1Q3gzanp0QmNpd0F3ZGVFb1N4SlE0MnNHd2JmYk5CRDVZ?=
 =?utf-8?B?UmoyMzZkMWtGVDZGdFdwbWpPcXlraUtoMFdsejgrQlgycVdwdWFCd3FiS0Mv?=
 =?utf-8?B?SVg4SHRJbXNOVW9lNEl4OVF5T3FoZGNUNndWV2ZlbXErTE5WaVNqOEowY2lx?=
 =?utf-8?B?Nk1BUGczbkdiZytCRFRSSDR4dXhFZDNHdzhsWDh1NW9uYXVWZzhNbTRaWUtH?=
 =?utf-8?B?a05yd0FSTFM4TU5wbUdLNlF0Ukt6aXNSeko5ejFZb0FoZ0xxdGxhOEFoMUsz?=
 =?utf-8?B?dk95aDNyYUNaRG5qLzNIRXcxdFlZWXRMemVobGg2a1pWTm9ROU5lNUFKVEl6?=
 =?utf-8?B?VENZaWtaOTNKQ0dIc0RRZkQ4MUlMVW5JNm9oeXpLSmwzbzFCbWoyREptVlVz?=
 =?utf-8?B?T0NqOXZBdWI3cHpRMldEd1RtaVQzT1NSUHA0ME9iZEtZMG9EMW16djhJUU5L?=
 =?utf-8?B?RWJLdkhmMTRzQXh6aW9Ma1RjdzZzK2FFV2FWd2F5T0Izc1JzQmNibHcwN0Zu?=
 =?utf-8?B?VHFCL0tFRnRqSDEvTUY2cEV6bkpFdTJHWGNyb1FqZ3JjdkV2NnVLUDRwNG5i?=
 =?utf-8?B?c1oyMHF3bXBsMk16am00SHJiSWdqNTliNFpuM2VCNjJQa3llbWlpWW5QSkVo?=
 =?utf-8?B?QkZ3T2YzM3dpaTBzL0Q4dVdpV2hVbWRrUUhQM2JpU2lFbU9kVUxCZzVvZlZN?=
 =?utf-8?B?aUhiai95Y1lWbkwvdGRHcG1GQWVYRzd5bVBkTVVFOU1pVE5PVDNsR2pWSW16?=
 =?utf-8?B?ZmxpUkdySGhXdEZCbkI5YzNiUS91Z3pRbWxMWVA2Y3FPeE0zSU0yQ2MvUXF5?=
 =?utf-8?B?KzhEaTduWmg5dG1yRUVyV0RCZm5wWi80YXhtLzU2MGRGY1lRVmZ2cDV2RVFD?=
 =?utf-8?B?dy90aXU4ZHpnMXNpazVYaHRTM0s2bWJCNGpCalo3QlNrc0pTS3pLcG1LUUxF?=
 =?utf-8?B?OHp0NzNZVWVkVS9DMkxOT09hNFpwSW9FdnJXck9TMEpEaTVKQXR3dGZ3Q3RI?=
 =?utf-8?B?QVZsUmNpZUtjbnhKTUVzSitpdFBsZDNXR3pjeGloS0V6b1Z1eFlSellqeUJy?=
 =?utf-8?B?Z1I0TmxFVHNoYzkxTFdBT2hTZ1d3cjZ2UExqYTIzUnEvN0JFSHUwOWhBOUVx?=
 =?utf-8?B?d2gzQnZvY3MxR0ZkQ0ZrTlVmTzZHVGU0UTBPOXR3b2d4Vm5aQ0wyeDJIWUwz?=
 =?utf-8?B?bUo4elVhams5eEZHRVZWR1c0Y1NtaVdrZEZWUFo0T0JlcS9tVW4zZW8xOW0z?=
 =?utf-8?B?aEpmWWlzdGZIc3MzWkFiNnMrWUR3V1NLdWtUNzR6bzVUNTBENHdZRVQ3Yyt4?=
 =?utf-8?B?QzBIeXNBbzZBSmZVaVU4VHhCR0srNU1WcnBZZTRxa1BsYkNhVU9DWUhuTUJj?=
 =?utf-8?B?UDE1SUdsWnN5c05XeWFyQ1RGMGc2UGJ4S3hDQlAvWjNqRnJ6b2hJS0NjZS94?=
 =?utf-8?B?ZW5MckZLTHVPMkhkSGNrekMyZ2dvZDZUamdGaGhqbk45UUtCRThnenlZSU5T?=
 =?utf-8?B?MGN2SDVSVjB5ejF4N2Z6R0ptek9UYzFSUmV2RVR2dmtVOXVackhEdHFkZ3pU?=
 =?utf-8?B?RTRUL2lWUjNFdEdmZ3E0SFFEWVd5YmhsUWk5eVRrOXFxMS9vL2IyamlXU0VL?=
 =?utf-8?B?QUlsN2lLOTdvR1ZuaEw4aVBaWXNDK09VSlcrOHhKRW15R2xlLzBIajZmcm1w?=
 =?utf-8?B?ei80cWxNTEFrZG1FdFdFSVpFdFBHZXRTVE9HVEFqZmQrektWblEvNXM4TWVH?=
 =?utf-8?B?aHAxWERNSVVNd010cGhFMGlmSVFOYUZrUkdISW4xb1RqWFZ1WGl4aXlhYlph?=
 =?utf-8?B?eGoxVmgrcHpFRWp0TXRidENGSHFsVFhKd1ZicjhhR3k1R0cydGsrZmpCc0ZU?=
 =?utf-8?B?TnRlR0lWTkdrQUJRRmp3MTFVTzlTT2pLRkxHdFdRUHJKRzdnTVBRbi92SDRk?=
 =?utf-8?B?YVVVeFFUaWFiZkpOMENLU21MNUNhbzhIbVdvb0dLN2M3aCtoUU1lcURoUjMv?=
 =?utf-8?B?ZTl3N0gyYVZGaFkwZSs2aFZUczFzeDRUSEVzZVVsZy9nZldnUHpSY2JRbUdk?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47FAD861D3EF404192EBF38CD1614084@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e504cbcd-1562-4e5e-3488-08dd1bac1c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 19:26:57.4982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WpJTr4RbQU0BaBsM898Fr9QlWagvUXvTR6cilN7Iw1QRpsbtufJfcw60LBVYewmUyegQTNHqy+aGrIzlgG1J0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6151
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDA5OjI4IC0wODAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gVGhlcmUgaXMgYSBtZXNhIGRlYnVnIHRvb2wgZm9yIGRlY29kaW5nIGRldmNv
cmVkdW1wIGZpbGVzLiBSZWNlbnQNCj4gY2hhbmdlcyB0byBpbXByb3ZlIHRoZSBkZXZjb3JlZHVt
cCBvdXRwdXQgYnJva2UgdGhhdCB0b29sLiBTbyByZXZlcnQNCj4gdGhlIGNoYW5nZXMgdW50aWwg
dGhlIHRvb2wgY2FuIGJlIGV4dGVuZGVkIHRvIHN1cHBvcnQgdGhlIG5ldyBmaWVsZHMuDQoNCk1l
c2EgcGFyc2VyIGlmIGZpeGVkIHdpdGggdGhpcyBwYXRjaCwgdGhhbmsgeW91Lg0KDQpSZXZpZXdl
ZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5j
b20+DQo+IEZpeGVzOiBjMjhmZDZjMzU4ZGIgKCJkcm0veGUvZGV2Y29yZWR1bXA6IEltcHJvdmUg
c2VjdGlvbiBoZWFkaW5ncyBhbmQgYWRkIHRpbGUgaW5mbyIpDQo+IEZpeGVzOiBlYzE0NTVjZTdl
MzUgKCJkcm0veGUvZGV2Y29yZWR1bXA6IEFkZCBBU0NJSTg1IGR1bXAgaGVscGVyIGZ1bmN0aW9u
IikNCj4gQ2M6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IENj
OiBKdWxpYSBGaWxpcGNodWsgPGp1bGlhLmZpbGlwY2h1a0BpbnRlbC5jb20+DQo+IENjOiBMdWNh
cyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gQ2M6ICJUaG9tYXMgSGVs
bHN0csO2bSIgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogUm9kcmln
byBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1w
LmMgfCAxNSArKysrKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmNvcmVkdW1wLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0K
PiBpbmRleCA3MTYzNmU4MGI3MWQuLjY5ODAzMDRjODkwMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmNvcmVkdW1wLmMNCj4gQEAgLTExOSw3ICsxMTksMTEgQEAgc3RhdGljIHNzaXplX3Qg
X194ZV9kZXZjb3JlZHVtcF9yZWFkKGNoYXIgKmJ1ZmZlciwgc2l6ZV90IGNvdW50LA0KPiAgCWRy
bV9wdXRzKCZwLCAiXG4qKioqIEd1QyBDVCAqKioqXG4iKTsNCj4gIAl4ZV9ndWNfY3Rfc25hcHNo
b3RfcHJpbnQoc3MtPmd1Yy5jdCwgJnApOw0KPiAgDQo+IC0JZHJtX3B1dHMoJnAsICJcbioqKiog
Q29udGV4dHMgKioqKlxuIik7DQo+ICsJLyoNCj4gKwkgKiBEb24ndCBhZGQgYSBuZXcgc2VjdGlv
biBoZWFkZXIgaGVyZSBiZWNhdXNlIHRoZSBtZXNhIGRlYnVnIGRlY29kZXINCj4gKwkgKiB0b29s
IGV4cGVjdHMgdGhlIGNvbnRleHQgaW5mb3JtYXRpb24gdG8gYmUgaW4gdGhlICdHdUMgQ1QnIHNl
Y3Rpb24uDQo+ICsJICovDQo+ICsJLyogZHJtX3B1dHMoJnAsICJcbioqKiogQ29udGV4dHMgKioq
KlxuIik7ICovDQo+ICAJeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfcHJpbnQoc3MtPmdlLCAm
cCk7DQo+ICANCj4gIAlkcm1fcHV0cygmcCwgIlxuKioqKiBKb2IgKioqKlxuIik7DQo+IEBAIC00
MTYsNiArNDIwLDE1IEBAIHZvaWQgeGVfcHJpbnRfYmxvYl9hc2NpaTg1KHN0cnVjdCBkcm1fcHJp
bnRlciAqcCwgY29uc3QgY2hhciAqcHJlZml4LA0KPiAgCWNoYXIgYnVmZltBU0NJSTg1X0JVRlNa
XSwgKmxpbmVfYnVmZjsNCj4gIAlzaXplX3QgbGluZV9wb3MgPSAwOw0KPiAgDQo+ICsJLyoNCj4g
KwkgKiBTcGxpdHRpbmcgYmxvYnMgYWNyb3NzIG11bHRpcGxlIGxpbmVzIGlzIG5vdCBjb21wYXRp
YmxlIHdpdGggdGhlIG1lc2ENCj4gKwkgKiBkZWJ1ZyBkZWNvZGVyIHRvb2wuIE5vdGUgdGhhdCBl
dmVuIGRyb3BwaW5nIHRoZSBleHBsaWNpdCAnXG4nIGJlbG93DQo+ICsJICogZG9lc24ndCBoZWxw
IGJlY2F1c2UgdGhlIEd1QyBsb2cgaXMgc28gYmlnIHNvbWUgdW5kZXJseWluZyBpbXBsZW1lbnRh
dGlvbg0KPiArCSAqIHN0aWxsIHNwbGl0cyB0aGUgbGluZXMgYXQgNTEySyBjaGFyYWN0ZXJzLiBT
byBqdXN0IGJhaWwgY29tcGxldGVseSBmb3INCj4gKwkgKiB0aGUgbW9tZW50Lg0KPiArCSAqLw0K
PiArCXJldHVybjsNCj4gKw0KPiAgI2RlZmluZSBETUVTR19NQVhfTElORV9MRU4JODAwDQo+ICAj
ZGVmaW5lIE1JTl9TUEFDRQkJKEFTQ0lJODVfQlVGU1ogKyAyKQkJLyogODUgKyAiXG5cMCIgKi8N
Cj4gIA0KDQo=
