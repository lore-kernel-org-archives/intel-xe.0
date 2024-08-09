Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80423C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 22:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4023A10EA0E;
	Fri,  9 Aug 2024 22:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zi6RsAbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCF710EA0B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 22:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723242240; x=1754778240;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UMQzkyWW/R1DT6W9QSkROKjkiU83ymTlO1VhiDFHpCc=;
 b=Zi6RsAboF0DwyngD0ETTXfbhxbPcg53N+WGhZ0xCKokqA95Eui/x74wd
 x6QGi8Tx8tkA64CZYN82EoVDZyyFXzkFoxz58zrdlXkn1ba46MElwrFl2
 s68xkLXvO7waddmvgDDebef6kKl5g8ipZxSq/X4eb80bH09RfgHZIPbK7
 yQ2i86mOKGqBWIYL4LInNTMBTY9/0h5PFak1fYwN3nfzC3kmQf+2Br7Ir
 FCHU/js1MVlZ1POHIQxfAeOzukZTwbTAF87Db0T1Pj4ydupUHYNtPjLbI
 FrDtrL+c0OucCdzLEjls4MWli9BdUCiZZboEETbnSeAfySL/dFk1CK91X Q==;
X-CSE-ConnectionGUID: rhNQkBBNQiWv5KksWWrSdA==
X-CSE-MsgGUID: 7mpoVudiR/uR5/O9yOgZmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32826175"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32826175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 15:24:00 -0700
X-CSE-ConnectionGUID: ceFvFfpbSwWSgXTqGyhOZg==
X-CSE-MsgGUID: g20M2LeoRf+ZOELksM4SaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="95216028"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 15:23:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 15:23:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 15:23:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 15:23:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 15:23:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jO/hCFCkfMOI80urDlRxNh5uLysBoTmeZzLbGfwpdbe8pXJgwIDMPa9RD+XSGLq3X7f1swl48W9d2kgo0Rt3bHVZsAWe6ndaChvdAd8atxUOhaMtnnuQ950Bd7FJ961AMrJ28yhUJJ3RhFKFWPzppw9JZpp28gvMNJGM4aCi9NVCVkwJ+1IOf383ZvmX1vw8ztcJPJikph4VNGv705pCrmQUXT28CDGG1bszcHre+HjMEauFS+bYfAxqTjdVeA3j0CbATowbu8V4qpiEQb5PViK6SjJgJOhvHrt4jSIt8DTzt3uA+LTrsqS2Vo0gzM6A9UBRicb3tcTsly2owiXI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNjyvMrs2r89QBJLmOQaobYHRVWSjGrbNvTAzzi9HdA=;
 b=KzX6gjyZ2GY8FwWMmOZrVDnY1A55vG7q+ZrbH2y9ok5PwgOb4zjLimPaHmqEogvn+Ws21zcW4FtPGQZl9u9Dbf92/QbdtdRiv4Da1TwJh1duMYJsdJtUKJrExjrkgq1gbV+egFmBBx0SrCpD3yHz3QxgPZ0Rykczy+5omBRTwsQdGWGyv8jHCS+6Ujrze3OclXBqh3ELTjeMeaW/jujEtAEw0lPVDdQ0rQvinFWpkkt6bRgxx267oxp9ZqNbND6G7cDJt/aXxY6zpGfqYE4uT+hWFAV/jpIDmjDOzfP2eWPzvEDmTewOrB4W7Ar5dF5TVWce7ZGiQHtgmcpQC4SQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Fri, 9 Aug
 2024 22:23:54 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 22:23:54 +0000
Message-ID: <ef360a74-72c3-42a9-9553-76f2d165613e@intel.com>
Date: Sat, 10 Aug 2024 00:23:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: Parameterize ccs and bo data clear in
 xe_migrate_clear()
To: <intel-xe@lists.freedesktop.org>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Akshata
 Jahagirdar <akshata.jahagirdar@intel.com>
References: <20240809220347.25330-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240809220347.25330-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f63e84a-0277-4281-10df-08dcb8c1f432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2NhTDRRa01nRnVIcG1MQ0tPS2dVYnpNU21CSThCNDIxWEhsdFdVeXc2akti?=
 =?utf-8?B?M1EwQmVLNStpbmt5ZzBhYnNRZlJFRFJhMWsySzdVUDNSNHFjWmYzcVNDTHls?=
 =?utf-8?B?TEtyYnQ0anBKbFRsSVRNbGV2bnBWMWo1Ymt1cWRhVUFBbmErUDdBekpqd3JZ?=
 =?utf-8?B?ZjVPUXJWL0ZCUngyeWZLaGRoUkQ5SXM3TjhCc1AyMnI4emd6Sm5VNzV0L2dS?=
 =?utf-8?B?UVpvRlNJN3V3bEJWeFFVWXJmQ0MvM2s4a3FvdndIWFZLOTBNQzd1UmtWaHJG?=
 =?utf-8?B?V280UGFpb1dEMDd0ZjJoRDJoTUtSb1c4UjBaclUvNW1OYkJMTmdOMHpIeWVh?=
 =?utf-8?B?WGpYOHpTMGR3ZENxYXRrWTljdlo3UnJ6cU84cE9jRUJsMjJzaGVQZTMxUmF0?=
 =?utf-8?B?YWRZaWRLeXNqWWI2RDAzNVJKS1lkQkNmMlFOb0pSTU5XUEFWZEVDa2VJTzIx?=
 =?utf-8?B?TmJHLys0cHkxa3ZQMlhZS3FHT1IrYXJMblhpYWFJL00xOXk5VXYydFMrM1N1?=
 =?utf-8?B?MGlVSnhrSitrWlMzUHpKbkt1MFovVUZlbktybzFEMjlFSkFpRXpITW1vNEZS?=
 =?utf-8?B?S0hsQ09JRXY0czJ0aTZTNlllNHNDb0ZwWmFJNHRuQ0p4eExOY3FHTjVlaGlt?=
 =?utf-8?B?U0xWcU10TDYrSS9qS0lzc1l5d1gyM2lIeFVjRDJoOFRDRy9FYmxDKzFwYkcy?=
 =?utf-8?B?T0l2ZWRRaEl0ekNkdVpYOHM0R1RxZFVad2VONUh6MGlnSWdQdjdsWTE4cnAx?=
 =?utf-8?B?L1F2MnBxSmxoK3R5OHB4VjJXZHBkYUYwdDNUZ1NNYkdzZ1pPVjBFbG5jMDB5?=
 =?utf-8?B?NDJncEhhb0VQMmZLYTZNUGNUN0xEZUtHa2VocjBhWmY2cDg1OXhsWktFa2Fp?=
 =?utf-8?B?ZUN5cUNRdXpSUFZmUFdjalhKckk3NUlBZWJNSUdhK0QwbGZjRUM4RVBtZmwy?=
 =?utf-8?B?bmJ3SmtiMVVMK25KYUdiR2VJOHRvdHlKczlsZlYvamZjdFB2eFQrbGNqS085?=
 =?utf-8?B?bEFGc1RqYUN3MW1idjNHTklxVWdrL2s2YjVyd1V5TDh0M3lLS2txMG1vQS9J?=
 =?utf-8?B?NXE5V3g0Z0ttcHVkYWxBWHBGTGpHN0N0WHF2TUxXaEJTa2dIdUdNa1ZFS0hD?=
 =?utf-8?B?Y2s1NC9YVkMxQ3J1K24zbU8ramJWdEdxQkVYeVVndEN4cWwzSVpzTXJybXZo?=
 =?utf-8?B?cWFYSGFQeHF3blpnbUhQWjNiSU5SNURyTVB4R1F6NGVFWGJpeEFoRnVtd1pp?=
 =?utf-8?B?QkNYLy9rU0NralpLYUhLOFNobnQwYnJTWUJQZlUrWWMrelVwci9lMWV6Vmdt?=
 =?utf-8?B?QjM1ZFJVNkRBN0JHQ0VDcXV3RGhSM3RlaE1wc0tkWjEyazA2OXJBb3U2YTJX?=
 =?utf-8?B?RDVhWldSY2sxWnhGZmlaRWpiVWM1NVNWRFQ2cURZMng2YjQxYkJiVThSWjdq?=
 =?utf-8?B?UVhhOXkvU1NRMDB1SXRUem94cC96ZTRkZ2ZySHVQZHdTVTUzV2U2bm1mOVFu?=
 =?utf-8?B?aVNKaUxVeHVmYkZ0bnlCd0twWTUydENKajlGWCtwV2MzY2JxS3FUZERLQzBB?=
 =?utf-8?B?QUtlWnlyY2JFS3I1dDI4aXE5dXNEclVWT2hUd3kzN1pjQ0xRSWdZSHNmNVNt?=
 =?utf-8?B?NjR4MWVLdHFkd1BIN1ZMcHdQcUcyRDlicWRxWnV3cWlCRVNwVXFmcDZqVXRm?=
 =?utf-8?B?YVdiejJwNDdEU01NZGt6eXdVcGNlb1dTTTJpS2Jtdy9MMHVVajdpbVJGTWpR?=
 =?utf-8?Q?Y5MeGzFSubBnib0r3Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dvY3VTa1B4R2NhaUMralA2bXY2dGc1TjdXTS9idlNsOFgzZHdnVTVYOC9r?=
 =?utf-8?B?b1BjeTBBeVBvT09uQjJmbnc1M2ZVYmIrTXJ1ZjZZV0hPRHc0VkN1czdxWG92?=
 =?utf-8?B?aWd5cHprTHAyNnp0QU1YSENWMnNMMXAxRm4yTU1PYnhLeG81STQxRXRWT04r?=
 =?utf-8?B?VjBSWWk3b09ZWkE0aGh6U1RRU1k0VTVkdEd4c1F0dHVQTGJpRmxnamhIQXk4?=
 =?utf-8?B?QVhCVzBEbjFJN2lyM0pOOUdJcHVTYk1YaTF6THJmY1k2elhGVnhTNlV5Z2Mr?=
 =?utf-8?B?MGhDaVhZSmQrS29URDhnSjFsT1JwQjMwWGxOamdTSTZUK3U0MTVnQVUxVjVN?=
 =?utf-8?B?WTlNb1ZuaUhyQ2kxNy9CUHZ4b01MWXExWmZzZDVBSVArSmx4TmxrUVc0VTA1?=
 =?utf-8?B?Nk04ZVpOcFlBSFFKMzd0WWphY2xPUjFQUUxaalpnaDJNd3RWdUc3RHRxS2lC?=
 =?utf-8?B?WTNTRWhsNlpLdDl5VzRaR2RnNGZCd1lzaVpTblE4K1F1ZGhDWnJsclhkU0Vz?=
 =?utf-8?B?RGdiR3JpUzdWWWFWcnJzMTk1alFUamJrVVM3Rk1yR0w4UlpPNFVNM05jU0V6?=
 =?utf-8?B?UVlzME1OeHVJY05UL3FHTFViZTV6UzhMdFlFYVpMZzFiU0V2TWwxMzlybW1y?=
 =?utf-8?B?LzZwSFZZODRkcTEyYVR4Q2RrVWlwd0RIbnhLRzVvU2hyTVhTV0ZDY09qdVNQ?=
 =?utf-8?B?SnNXYWZiV0JVRGh4Y01hYVIvSDUrNURKQmp5dFJyK3U5Z0tUWjRhRzlzbVN1?=
 =?utf-8?B?MHpRZENGTW1ub28vc0ppYzlOYzZTRTMwN0Nsa0cvTXhNU2UrSzUrNGlNcDVh?=
 =?utf-8?B?bFU3MlRvSTRwZ25XRkZuRk1RUGNJWUxOeE9lekN6LzloOW1KdDF2YTFHbXA4?=
 =?utf-8?B?K3IwTGY2cG4wa2NnZVRNKytaTlpjSVR2NEludHpzbk9Oc2xQZDRtMkNYb0ts?=
 =?utf-8?B?REx1SjRBU2xicUN5dDhVRlN4MENjUW0zcCtNcC8rWW1vZTRETWsrOHpoUDZj?=
 =?utf-8?B?enJJT0d1eFZ5WENLclZ3S0N4K0U2TTZaRFFjL2lRRldrVVBlOE9XV1Bvb2lv?=
 =?utf-8?B?ZWxOMmpzNEdXb29sRUxQYmpNQkE2bktCSHNxekFJamFaY3pQWWs0S0Q2Z216?=
 =?utf-8?B?Sk9HdU5IcXVBc2ErRzIzR3RuOXVadTlwODRZelVZWVpOS2hCaWhSWFlZb3lq?=
 =?utf-8?B?OW1DMW8xUmUvcG0vVWZ0RUlMMnY2bWtKY3F4ZXpqTGRyckhudVpPR2NIRlhn?=
 =?utf-8?B?R2VCR0EwWDJlZ2FZa09rcGZQSWtJODFKb3NyWnI0Tk15SEwrVWlEdUJXTE5B?=
 =?utf-8?B?UGxwUFhIUU92QjVQMndHbGhpcnlJTVQ2ME9LZHFzeWZ4aU0zcWxjM0NvUjBC?=
 =?utf-8?B?aUVhSUt5VXNnV3h2ekRSbHpDc2txUVNsYXh0NVJuRFVCNXNWL3hONFcwOG1p?=
 =?utf-8?B?QWRMdjljeDhTRmNyR25Kb1AxMlY2aVhkUm0rK04veUlTbjVkWCt5WkYrYkxa?=
 =?utf-8?B?UVVtSWR0RWZ3REFBOGdKN3FSQU90cUd1RmxPTXNGcWFpMTR5Y0tpUTdtYWJa?=
 =?utf-8?B?U0hDTUswaVhrNU43UzZvYmlMc2w2M1MvMUYzLzUxQ24yTnhFdTVrQU0zMTBD?=
 =?utf-8?B?K0hoaGt3cmpGazVMZk9YOWlPUEM0Y2dpajlkdnhZYkZHMkRFdm5RemdqL3Bi?=
 =?utf-8?B?b3hEMkV1TWROVDRPK3pZWjNCLzRxekcxUi9DWTZKdXZCMGpPR1VYeTB1SVRm?=
 =?utf-8?B?dVZRL1d3TVB3NFVNT0drN2ZJODQ5N1UyajJkRVhuVGgvRC9OdktnTWNFVlR4?=
 =?utf-8?B?Wk40akdNQ2xINW1YUVcyaE13SERWRjlCN21BaWg0SUtkQTM4Njlldlo4VDQw?=
 =?utf-8?B?T3BoaUwrWStuZDBxZmFjRlBzc3VJMTZQeXdoam9sOTRqR2x2NDJWQzk4YmZ2?=
 =?utf-8?B?ZHdkVC9YWm93cGM0YkNUMTV6ZG9vZi94NnF0MWZuSHNTQWMwaXlQRjMzZDZj?=
 =?utf-8?B?dlBqcmluWmxmQ2o4cllyZGZHcHhTQnlXajFjWHErbzc5WUIyYWdxbVltNnor?=
 =?utf-8?B?YWQyM0tLcno0cnVsUUR6OWVrclF4WUhUZzNKRlovRjFnWDFvbGsrcmgrMXMx?=
 =?utf-8?Q?GRwZ8Qx9j/uuDsjPAo+DcrEms?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f63e84a-0277-4281-10df-08dcb8c1f432
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 22:23:54.7555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCdDHHMZfPe7GIMKUZhEBrQoQ1adLuvdfgkJuhYP+Hsws54P0aUVnavoPJguTdIPgu0t/14mUiUDDwnGOpoREA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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

Extracting this from https://patchwork.freedesktop.org/series/136277/ as 
there is a regression in performance number on drm-tip.

I think it will take some time to find out what is going on. This patch 
can be applied independently sending it separately.


Regards,

Nirmoy

On 8/10/2024 12:03 AM, Nirmoy Das wrote:
> Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
> layers can utilize. This patch will be used later on when doing bo data
> clear for igfx as well.
>
> v2: Replace multiple params with flags in xe_migrate_clear (Matt B)
> v3: s/CLEAR_BO_DATA_FLAG_*/XE_MIGRATE_CLEAR_FLAG_* and move to
>      xe_migrate.h. other nits(Matt B)
>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
>   drivers/gpu/drm/xe/tests/xe_migrate.c | 12 ++++++++----
>   drivers/gpu/drm/xe/xe_bo.c            | 12 ++++++++++--
>   drivers/gpu/drm/xe/xe_migrate.c       | 27 +++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_migrate.h       |  7 ++++++-
>   5 files changed, 45 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 1768483da1b7..df9fd907edd4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -36,7 +36,8 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>   
>   	/* Optionally clear bo *and* CCS data in VRAM. */
>   	if (clear) {
> -		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
> +		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
> +					 XE_MIGRATE_CLEAR_FLAG_FULL);
>   		if (IS_ERR(fence)) {
>   			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
>   			return PTR_ERR(fence);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 4344a1724029..47ae9d0b8864 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -105,7 +105,8 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>   	}
>   
>   	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
> -	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
> +	fence = xe_migrate_clear(m, remote, remote->ttm.resource,
> +				 XE_MIGRATE_CLEAR_FLAG_FULL);
>   	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
>   				 "Clearing remote small bo", test)) {
>   		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
> @@ -279,7 +280,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>   	kunit_info(test, "Clearing small buffer object\n");
>   	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
>   	expected = 0;
> -	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
> +	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource,
> +				 XE_MIGRATE_CLEAR_FLAG_FULL);
>   	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
>   		goto out;
>   
> @@ -300,7 +302,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>   	kunit_info(test, "Clearing big buffer object\n");
>   	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
>   	expected = 0;
> -	fence = xe_migrate_clear(m, big, big->ttm.resource);
> +	fence = xe_migrate_clear(m, big, big->ttm.resource,
> +				 XE_MIGRATE_CLEAR_FLAG_FULL);
>   	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
>   		goto out;
>   
> @@ -603,7 +606,8 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
>   
>   	kunit_info(test, "Clear vram buffer object\n");
>   	expected = 0x0000000000000000;
> -	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource);
> +	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource,
> +				 XE_MIGRATE_CLEAR_FLAG_FULL);
>   	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
>   		return;
>   	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3295bc92d7aa..56a089aa3916 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -793,8 +793,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   			}
>   		}
>   	} else {
> -		if (move_lacks_source)
> -			fence = xe_migrate_clear(migrate, bo, new_mem);
> +		if (move_lacks_source) {
> +			u32 flags = 0;
> +
> +			if (mem_type_is_vram(new_mem->mem_type))
> +				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
> +			else if (handle_system_ccs)
> +				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> +
> +			fence = xe_migrate_clear(migrate, bo, new_mem, flags);
> +		}
>   		else
>   			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
>   						new_mem, handle_system_ccs);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6f24aaf58252..a2d0ce3c59bf 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1037,9 +1037,11 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>    * @m: The migration context.
>    * @bo: The buffer object @dst is currently bound to.
>    * @dst: The dst TTM resource to be cleared.
> + * @clear_flags: flags to specify which data to clear: CCS, BO, or both.
>    *
> - * Clear the contents of @dst to zero. On flat CCS devices,
> - * the CCS metadata is cleared to zero as well on VRAM destinations.
> + * Clear the contents of @dst to zero when XE_MIGRATE_CLEAR_FLAG_BO_DATA is set.
> + * On flat CCS devices, the CCS metadata is cleared to zero with XE_MIGRATE_CLEAR_FLAG_CCS_DATA.
> + * Set XE_MIGRATE_CLEAR_FLAG_FULL to clear bo as well as CCS metadata.
>    * TODO: Eliminate the @bo argument.
>    *
>    * Return: Pointer to a dma_fence representing the last clear batch, or
> @@ -1048,18 +1050,27 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>    */
>   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   				   struct xe_bo *bo,
> -				   struct ttm_resource *dst)
> +				   struct ttm_resource *dst,
> +				   u32 clear_flags)
>   {
>   	bool clear_vram = mem_type_is_vram(dst->mem_type);
> +	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
> +	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	struct xe_device *xe = gt_to_xe(gt);
> -	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
> +	bool clear_only_system_ccs = false;
>   	struct dma_fence *fence = NULL;
>   	u64 size = bo->size;
>   	struct xe_res_cursor src_it;
>   	struct ttm_resource *src = dst;
>   	int err;
>   
> +	if (WARN_ON(!clear_bo_data && !clear_ccs))
> +		return NULL;
> +
> +	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> +		clear_only_system_ccs = true;
> +
>   	if (!clear_vram)
>   		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
>   	else
> @@ -1085,7 +1096,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		batch_size = 2 +
>   			pte_update_size(m, pte_flags, src, &src_it,
>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
> +					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
>   					avail_pts);
>   
>   		if (xe_migrate_needs_ccs_emit(xe))
> @@ -1107,13 +1118,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
>   			xe_res_next(&src_it, clear_L0);
>   		else
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
>   				 &src_it, clear_L0, dst);
>   
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
>   
> -		if (!clear_system_ccs)
> +		if (clear_bo_data)
>   			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
>   
>   		if (xe_migrate_needs_ccs_emit(xe)) {
> @@ -1172,7 +1183,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		return ERR_PTR(err);
>   	}
>   
> -	if (clear_system_ccs)
> +	if (clear_ccs)
>   		bo->ccs_cleared = true;
>   
>   	return fence;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 453e0ecf5034..7929cc2425e8 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -102,9 +102,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   				  struct ttm_resource *dst,
>   				  bool copy_only_ccs);
>   
> +#define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> +#define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> +#define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> +					XE_MIGRATE_CLEAR_FLAG_CCS_DATA)
>   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   				   struct xe_bo *bo,
> -				   struct ttm_resource *dst);
> +				   struct ttm_resource *dst,
> +				   u32 clear_flags);
>   
>   struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
>   
