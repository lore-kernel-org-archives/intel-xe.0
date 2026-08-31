Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58FFC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A158610E25B;
	Mon, 31 Aug 2026 06:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNMw9mu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ABD10E25B
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159175; x=1819695175;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L/AYz3yKaRvNUFXHwKVuX31YfwZABWHO07LIlDdwJtc=;
 b=SNMw9mu4mIVqxvt5izOL7EfRB3zSE7/m9UvrrtL3b0C35hPBPwiEJPTy
 eqUV6lEBx+GSETPFZRcNSO3lN3hhijboiGFocYot+J6NbfohMai6Ol+se
 LZwc9djOSy5DickjTHqX4VE+9G14yt1xU55JZXzMh0AkuVZJ9eAPw1elb
 6QV+cSwL4KHLbPQtNM116L0KGfk6IWo8Z/+ZcnOOBSq4VOpqqDUFewMPs
 W51gCoU0w8ZZYso52E6dL6YlPeIclfR8O4PGrYjQ//tjMuYfh7c57ni3D
 4z21bAH2EwhPyKAey9+unTMhiEmthADewVpSGSacVHr6VtJD1hXuE3RJ/ A==;
X-CSE-ConnectionGUID: vJphEtjJT3iJlm8S/UV/cQ==
X-CSE-MsgGUID: eoEpaRkYRriQ7Qs3QMQZDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88319795"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88319795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:52:54 -0700
X-CSE-ConnectionGUID: vuZeZocWSkut7HK8XvsC2Q==
X-CSE-MsgGUID: BCV90aPbQI2OS+ri0CXT1g==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:52:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:52:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 23:52:53 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:52:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMAH+bY+3+HY31C1YR/5lOqU6YEHKdmguvsoHTWdvG4Q1Z6IYbIgyRV1jNbw8RKbx5Ch9f60t1sHOlZ6LRcPnlJVCoIcHD8sdW5dYl70G2xTx4SBSouZwac/Y6atLnJTLKAwrY0Poxm6m23p14amEYpdBnSeIM/Dm2a2j51nx2AJMmjoVTmZKnz11jSoiMnfbDWBMnHBu/vrHBQWJ5GKmUqPp1EzpZI6RdIpTMPlpVRneHBYyjSXVY0Ls+n4RFSvhpTN3eHSYt0M9DKu3qA9Q+jYkxXcqT4Bg1XHlNqnVRuXVD3U92XzsA9TGcBE/leZAVJ9mKHyG6WZauClBlcFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKQSCxwaVUzQwaPryGuoDHUu43oJlbf9JN/3pVbjHyk=;
 b=rE0NBOEWwio65t52IFb8sgJVdAtnU1dcPZihhk//9npEBYmOF2gi6zFFvsPP03ndnz88rAIcpEpN0LIFOvz2jFK3JDyrbWGNCddAbtn/pTz/yiiwgq6dis1YqLiTWThzrnN0SKLgjEGEh1h0zVU6xHr+aLmtLxlBPBanRUqmk3tM5TWJZonn04QCDVxESkBNVsGBAy4wHYgdnXfViFABYOLmUKsUkeZ31Bdh5zFJ71oKROJMiRVUTq8paFRVU7kiakPLXk9rXLjSvGIw3b34YPixIkoxTDsNSYN7XoVzjdnpyAEx0X1C3LDgOngaQzzBJ+/abuGkCXXmZx0s+wflEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB6076.namprd11.prod.outlook.com
 (2603:10b6:208:3d4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:52:51 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:52:51 +0000
Message-ID: <a6294cba-aea3-4952-83a9-14b7b8fe4323@intel.com>
Date: Mon, 31 Aug 2026 12:22:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V19 04/15] drm/xe: Handle NULL resource and allow purging
 of VRAM pages
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-21-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260831064942.315720-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: f1319f79-e38f-4eae-a8e8-08df072c794e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: dOqmD+mQCc6KGOd/+37e2xNVtoxW8bFqgo8xTw7kkcZuzcTlpxWaZ99iirA1Uu27BzrIOx3Of4zhw2VDffu6Gu17LnHAOgQv9ae0+y07n1fZG5/yLMzQ4pSGNhlg7V/Stc0gLSnGue8cLxJJAGqTO2FeZHyySELUI2l28Bq4UloD8li/W3dF/vkdpwpAF6aqu5ChARaf/x+ixG+ykdLHCVq6HgOpA2Hf2mBiaDYerg360YsIrNbgol7darTxOYFJzJ69lUhtcjpJ5ZwYkBO2XHRUlhCxpqQFdOc4GsV0aWZSmLuNatmBQXwe6GPcZw6kSPFI/G9GdSRgx6YAT+IlR37caN1IKKAXec5Pa38eL0imGYw1ZPPwWn2CY6ZTh0zmyAD5xytWcqSCBbWqp+04IeWY6yOHWT5GD/NGvlvONYQ9D9Pdvp8VF1NC6jgYRhp2CZgofyG1P6BbVcd8JzwXKulz4LXimFUHikFsC54NVknkg3at4nogZUdVA2vK0/rmNrwPomGDS92kwVhLgJQeabUmSEqBjyj/zYkb4w9yEquWDwkrXCldA48SXM29DWAwpoWqqsecynpi+r7z/DWZaXM//v7PfieDvReWSJ7vghUVQcFftRvEytu9nEBBulP1yeels2iVjfJv6vgvpEI6duZG7vKReasaPEQTG0aEs30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUlGNXdrajhBNXJncFh5K1MzU0xHMlBJaEhTNmEza3pGTTNxVmp1RDJ1SWFa?=
 =?utf-8?B?QmEwaExVaTNKbTZmb05PQW4vODV5Q1M0TngrdDh3OGtsVWVrR2IyTWNDd0Vq?=
 =?utf-8?B?ZDEvOElsQUtBRGFpK29aR2owN2l6SWE2NEJtSFRxbktJUFNSRXVtUHJrRElE?=
 =?utf-8?B?blFzOVpkY1oyR0c4Sjl4MXJxTDVpeFVWZXNPLzA2bnJNMVZYNnNiY1JDSFgx?=
 =?utf-8?B?c2JsSmJsRjcraVhFVzkwaTc1WXlhSnpjSERlOTR6bHo3ZTV6MUZQdEVvRGht?=
 =?utf-8?B?UExjUVcxTHBOWlVJOWlzc1VhV3dGRDBDZWpiMmlxWVlQbFdLb1kzZWViZmZJ?=
 =?utf-8?B?Zlo2TG45b2xpRmRNNXZIRU0xeENVMWNhUUdOT2QxUGt4Y1JOUlpBWm0rbGlN?=
 =?utf-8?B?NEpVMlhlU21QcGpnY0hMYXkxZHFiNHRkQVdFaWNTUWcvbXBFK0pSazI0WkJl?=
 =?utf-8?B?VHZTRy9WWUoyQzF6cDNaOGdPd2wwTFlQWFNUTGcrelRkQjVYc3RpN1NlbGVG?=
 =?utf-8?B?cEJiQm1ROGV0WERtSEdrOWlSeHF6RFdMalQrRThPUXhrZjJmQWI4UU1lV1o1?=
 =?utf-8?B?M25TZWx5bExyUGlmdFd2WXo2Um5XcjRnVTBMcXI5eTZVWTlQVW13NHllckhC?=
 =?utf-8?B?K3FseFhnSnIzVU81ZWJEUnl6ZGw3dVRVME1EbTNUSFExWU1kbDdsUGhxNlRp?=
 =?utf-8?B?bkRaRi81QXFZNlVveEpHOEEzaE1NYy9kb3hGeDNuRlJmdG4zZGdzNk4rNHhR?=
 =?utf-8?B?cjRuM0Z1b09KZVlXUzF3M2JHN3RlZkorVmpNOGE1TTVmVEIyRWlnaWlTWklq?=
 =?utf-8?B?emsvNGFBUTM0RTZpSTkvZUZjbTNZdmNTdHFkck41OVZsUHlHUStRWTh0TUdT?=
 =?utf-8?B?eWd5cFZmY0hFUUJrcy93UC9JWXFMVFhMNXBKeWpFMEY2TXI5V2VjOWhiQXkz?=
 =?utf-8?B?SWxBVzF4d0pKb0tnYStUQWVEOXNKako3cUpxSmZNK3d6TjlVeTM4dzl6Qlds?=
 =?utf-8?B?bi9ac3dHbkpoKzhNUkxZK1NNakg1OUVVTEhYcFJRQlVFa2crYXJ2RmkyZUZv?=
 =?utf-8?B?dmtOTk5mWXBnS1RpZ21VTWt6RHlNKy9QRzVlZWM0bmVGYUlLYk9LZGNkNUVz?=
 =?utf-8?B?eVNnejdNVEovNXQ0eHJlQ05hcm1oWW4yNUk5L1hyOGR0QUx3UUdKc2toVVJh?=
 =?utf-8?B?MXpOT3lLWExBODdBU0hSRGNyMjJla2pBcVNjaXF1RlBhVFlXWmtiWmpydFRS?=
 =?utf-8?B?QnQwMFB3dW8ySThCa091RjQvMVczeGZ4blloZEhpTThUNFo1emVDL1prV2FW?=
 =?utf-8?B?cGVWSjBjNkxsVzZRTTJTZVZVZk5EbnQ4ZVI0L1N4WlZMcTlYaDg3Rk9XOG1j?=
 =?utf-8?B?d20wUWZmM0JwRzQ3QXpvY0FPT2FyazQzL25CMVlOTUhaQ1dEcEhKdVFOY1dz?=
 =?utf-8?B?RUtnNEdTNXNrYTU5RXFTcXJmbEYwZDlqcS9xdUorbHN6Y1FiTjJWdWdMdFdz?=
 =?utf-8?B?T0RvMm0xcHlGNncrMTJOeXUxOENmV1lJNkFMeUIyVWNreUFPMHcrS0IxcUVz?=
 =?utf-8?B?TGlIYlIrV3FHSFRNOUd6TFVESjhvTytrSlpFenBwVlBWVlBHc2xBVDlpeWgw?=
 =?utf-8?B?MlA4azZDSS9nd3VIcjMrSHhtTGR2bDFXZFZUV3Y1SG4wY2ZlUTJualNiK0J2?=
 =?utf-8?B?SjhsZGY0SzAvdnVDbnpLZEVMaGtWQnNnc2hVemhrU0F1MEpJaUFHU2NZanpJ?=
 =?utf-8?B?YS9uQXJaOTNSZ2NJUFRTU01MWmlWTDByZXg2ZUhlZGxMc2tsa1V1S1FGZEUy?=
 =?utf-8?B?Qm0xcFdIUVo4bVNGVHpzeGZXT1lsVTZ4OFNNSDdsZmRWMkhlVDdwUy9zY1NM?=
 =?utf-8?B?eXplRk0rTE9ISmpIYjVFSmN5QzFHRVRwNm93R3U2TStrVGJsVXJGbUxjQWls?=
 =?utf-8?B?aHNoMmRSanNZdmZRMzBuaEtUMVBhUXFaRjQzS2NZcVhTR1BsNE9ZdisyZ3Nz?=
 =?utf-8?B?NXZPbG05K2NkR3pCaE45TnhhRVlJSWdidzBtbGZ4dzFMaGkzRGplV01uMUY3?=
 =?utf-8?B?bnFUMjZJN2hoQ2sxWVB2YVQxd2I3UWVhNFZORUpUanI4QkhjODk3TUZjM3dV?=
 =?utf-8?B?Q1pFblp2ZnRoNGtMLzdLaUJDelBqM2NTdzB4bHh4UmJjWVZnYndOK1VDL0d0?=
 =?utf-8?B?a1ZRbWVNYzNpVGx2d2pmeHIvamEvdWNZNVhaMkp6MXlRTDdPbC9yNSs1Nmk4?=
 =?utf-8?B?MFJiQ0NCYUgweDBxK21idWtRQ01JcWE1bTdSdjNCcnRnU0pMdTdLU09NMW5D?=
 =?utf-8?B?ZGJFeEZwdy9CeGcwdk1FYURMM1RMTXpTUnNJL1RYYU4zdHluR2l3aTBPdjV2?=
 =?utf-8?Q?AFiXroUOpoYyiXio=3D?=
X-Exchange-RoutingPolicyChecked: kEjURn7uWZkgK8jBUt6ck7JIQYTJvljx4j8x/I679ImT6TcK4wv8OIvERkuEZ9i4Llbmi4KwFNNUBcUU1KUzQnMYXPdS8VLX1kTcjLz5G9ImXbFtdgVUfm0OHDSGxQQA1c8+dYqPikfX0PlyTdXefn2j4EAzNbUvevPhAO/927DqiW/VCmhuD1jjqvmc1HqN+u+HJLr//ryhMqazhSzBLwjxcEZbQYV8/3vo5Y+5iNE9N4GTeo0KXI9apwlYUBVNv3GMTvjvOkD2oPOtenWYuTt4c6oHtCESYJJ312TEWtreaeHoy2uTHSVhqzp8ondbcBuaAMIAObh31hSfx4k4Kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1319f79-e38f-4eae-a8e8-08df072c794e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:52:50.8002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfb2YhUGtSkgNQX+rX3BR+QSbCu5ZZP71lnzbP9k7WGFV8Y/i1uA84/FRiLJIrXDB0bA+tGlG5SDY3BWqASSk5G2C3ZjAMwRgrTI2kpWiFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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



On 31-08-2026 12:19, Tejas Upadhyay wrote:
> Add NULL checks for the buffer object's resource pointer in
> xe_bo_is_vram() and xe_bo_is_stolen() to prevent potential NULL
> pointer dereferences when checking memory location during page
> offlining.
> 
> Additionally, remove the `!ttm_bo->ttm` check from
> xe_ttm_bo_purge(). This restriction is stripped away to
> explicitly allow the driver to purge VRAM pages during the
> memory page offline sequence.
> 
> v2(Sashiko):
> - Split export and this patch also Check NULL res in
>    xe_bo_is_vram() and xe_bo_is_stolen()
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8f93e09e51bb..d30a8411d2a3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -104,13 +104,16 @@ static bool resource_is_vram(struct ttm_resource *res)
>   
>   bool xe_bo_is_vram(struct xe_bo *bo)
>   {
> -	return resource_is_vram(bo->ttm.resource) ||
> -		resource_is_stolen_vram(xe_bo_device(bo), bo->ttm.resource);
> +	struct ttm_resource *res = bo->ttm.resource;
> +
> +	return  res && (resource_is_vram(res) || resource_is_stolen_vram(xe_bo_device(bo), res));
>   }
>   
>   bool xe_bo_is_stolen(struct xe_bo *bo)
>   {
> -	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
> +	struct ttm_resource *res = bo->ttm.resource;
> +
> +	return res && res->mem_type == XE_PL_STOLEN;
>   }
>   
>   /**
> @@ -929,9 +932,6 @@ int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *
>   
>   	xe_bo_assert_held(bo);
>   
> -	if (!ttm_bo->ttm)
> -		return 0;
> -
>   	if (!xe_bo_madv_is_dontneed(bo))
>   		return 0;
>   

