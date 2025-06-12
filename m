Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1ACC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CA610E77E;
	Thu, 12 Jun 2025 10:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZBCBZYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F0510E77E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749724485; x=1781260485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SB8zcF07d2ZM/QOE9JpOjrhbDLT7z+zHUs93kgrrLCg=;
 b=DZBCBZYPP5JVFW/FOIKUNT4nCoyqNp6lAF3GbSRU3Fn3Qrjz3xLnTKVI
 BrLBN2TeJrEdW0Ia3lFVmmjkbIg4746KqXE3cO7GmwlPYtIyEU/YpwQBO
 r2WVFklEMEqZ9N2j6A7YUgXtmsoqYJdEZYstJJWb5ARQ5EOZ2D8HFlZbD
 +dtL1ayUBExb7nOreXud3jkpyjhG+fVABraHLHdGfL2MwKb6TOFbEMv74
 jeukEtesBSnQjBTnPbGW0bNBpDPHElwbllI/2YiQQctlIPhkonUZuhM9+
 scj4p+JBL5z31UG+76sVwxhnWMk30I3OV0yXHQ4F4RUdVyVbS/ENUcaUz g==;
X-CSE-ConnectionGUID: wwfr6lAWRSCmOf3HHicgfg==
X-CSE-MsgGUID: rCrNKAWDRlG1KGfaKVFHmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="52037939"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="52037939"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:34:44 -0700
X-CSE-ConnectionGUID: jMLJEa5rTGOxMbxK/gmvww==
X-CSE-MsgGUID: PZvSGatqRe+BomGyU5rU5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147323907"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:34:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:34:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 03:34:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2h5YumhKz2SrubYx5WlGswNK/kkX1O++dj7PnLXlZajrIKrgW5Um81QDqX9uJy4CG/1zsLOmKkY+EjBhxBG/9j7IDkfItfRjf0R62MrTEtcdapcRcL7o6nfvK2UyutVSoV3cocgRkHT+TT1Q+R1WdnnclM4k9xt0EOSVspvsKSmyAEzKSdMiNWMStRY52APklBO74AEvLApX/CnjT6aBl8k3x8pIgPc52IOVZJZB9Z04zGVmX7wvX0v/BQoLei+SbRLJi9s14WY7hBmjzgrMvyrklL38jA2LKAGY/B7fvYhau2CDPrnTDA/iETeAVf8dWZdW1ITJ0zmxiR38WM+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz7AhB1Y/nN6C2Hz3KJro3wGOc8CuP4DHHLIkLger8Y=;
 b=tdECvh1f6IT9ZJk/Vsm4mEnW4is8GAFMtgHuKrdlUTGuOgELJEEV3ab1dYvHD4pCyMZmiay35Qt144xsd5FefAzS0tdXKX5+KGG3VoN6tWv2CyQpEbjaV5b6j11hhlQgebXnIGsD1qt7mNFPpNvimI02u+dvgolo+MCrXM/HI1T4OJmw7mIGkBiZdc0e5ZUYDFr5TRsq9eWxap3pehyPvXZ6Bwvva4Mw99eTsYsaJK3XGeMTfc46sNeaqGO6Aybrnszgt0BExYnWatndl5Gf1XVJy515r3MXY4Z7ObTr8SPbCeYUuGsRMETBvZq08gPmeSKJDHmMZC2bLpcp45kLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH0PR11MB5013.namprd11.prod.outlook.com (2603:10b6:510:30::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Thu, 12 Jun 2025 10:34:26 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Thu, 12 Jun 2025
 10:34:26 +0000
Message-ID: <212e1dfa-26fa-40dc-8e23-c0e7f9d2f21c@intel.com>
Date: Thu, 12 Jun 2025 16:04:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Fix xe_hwmon_power_max_write
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250609061345.3084177-1-karthik.poosa@intel.com>
 <d2462fa9-96a5-418b-8030-275f22523cb8@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <d2462fa9-96a5-418b-8030-275f22523cb8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|PH0PR11MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: b75947fd-b402-4f3f-7c2a-08dda99cb441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2hZMk5oSk1iM1d5ZnlOWVZDbE9nWFlBUVlURXZETC9CYkRtWHd0TDNocGJ2?=
 =?utf-8?B?R1RUM3hRN2Yrd1l0RmtrWFE4NFp1cldwNXAwR2tQbVRRYjBtcTlody9NQlB1?=
 =?utf-8?B?OS9TYTg1ZldzWjN1dThrUHc0M2MrOFYwNHQvYytlaXgwMStUV0lyZ1V0d2kx?=
 =?utf-8?B?MmFrR25Hdk5wTDVIQ1p6NGxROXhxTk5Xa3NRc284UmZJTXlNZG9ySEpqSGk3?=
 =?utf-8?B?L1JmU2NWZDVHZlQ4enNicGJpUm03Q3VERGhUYXl4U0dSVzgvWkM1bk84a1or?=
 =?utf-8?B?dkxoMHhNaUx3SDFhbG81NUFwQW1ya1RkeHpuQkd3emlnc2Z1ZDVCV3VGTzd6?=
 =?utf-8?B?SEdGNjBjeDBaWWs0TkJQTDRNWjViOW1COHN6aUtlc3lSekpKbmk5WExxb0lt?=
 =?utf-8?B?QXVGdENkbnNQMHhZdnRiemtxYlhGaXIwRHhiS2Z6S05NenhiUjdBK1FaSWs0?=
 =?utf-8?B?My9LMkZUc2xDdHEwenBKakhXZ2EwVFRTcGQ1Sis4WnArUWVLbUFTL21xajJB?=
 =?utf-8?B?Tks5c0x2aGFPMjJuR0poNmpHOGRsTDFzU1FqTEYyUEtUWWpVRDk3V0JlZ3NR?=
 =?utf-8?B?R0dIeFhSU08zQmhIMTRHc0NDeWxMWlBaYjdhZ09mOTFEL2Z4N2NUQ3FyY1Rh?=
 =?utf-8?B?UVZyNEZqYXY1c2tlUFpnY29aYnVrNFBsY0x2Y2NQN29oM3N3UGhxRnZMeS9Q?=
 =?utf-8?B?UEZHRnB2d1FxVDJNNHh3VUJ3NEFEUUtldlZJK2xldXV4VGt6Q3UwQnA1aER1?=
 =?utf-8?B?a1VYUDZFUmJ6WUxXbmN6a2IrNHZxVFRvZmtsQVV2am9vZWJ2RGthbUdEQ1ZN?=
 =?utf-8?B?VzJqZXlmVittZGZLS3JVWHhKaGdyTnY0M25zT1JkQ25DZjFLSUJDanVPb0w0?=
 =?utf-8?B?dG4rL2pURkdkcUVHQzdHYVhCTGRpTlY5WVA1Mi9zclgrMzQvSnN0L2hqSXli?=
 =?utf-8?B?RmQyTjBMSmpqS3NPK25VZWhaZjJUUkJiWkF1MG9OMDY0VUNmaGhwa0tNUTBv?=
 =?utf-8?B?bWhxZW9yeVhSQmR2Um12dEZlTjVKSStSM05jalVwM3FHaXNDNk9iUG81enIr?=
 =?utf-8?B?V0pMeXRZZk90NDI3Y242YlhHRW5Ra3RDM1FYNDNGUGhVWjd5K3VwLzd4S0x5?=
 =?utf-8?B?K3hGZHBueFV0MC9tRUNYcFhESUIzLzkyT1dKMWpXSzJzdVBnRjV2L2phT2s2?=
 =?utf-8?B?cis1S25qd040eUh4ZnJvejFIeC9LSnNpcWhCcmp6anFITE1FOWVBc2pDdGx0?=
 =?utf-8?B?UXJPZGJVNVFKWmN4VjZ2c2ErYnA3RnFaVWd3RTRVUWFZTUY5RVRlUmdVakpT?=
 =?utf-8?B?T3lncThBQmtUUWFrcUZZY0ZyYkZHRGlKY1NJS2tXWjFFRUxJY0V1bUpSYXlm?=
 =?utf-8?B?aWtaMFQ3dUZocXNicGNHQ2VwTzRRaWhjM3EwblJFbXRTbVAwODNpdU44OXJG?=
 =?utf-8?B?UVNFQnEydUw1TzNOVElHdzJTRWhmNDJMN1FuMGR3YXczbVBZN3dKTUovU3Vx?=
 =?utf-8?B?R2tEbW5vUitaVFdYMlFzdVg0d0NsUml2YVFpa2pkQ0QzU29nL0VYOGdSUkdK?=
 =?utf-8?B?OHc2Q2tvT0tUWXNKZ3B2c1RvVkQwbHBHdExLQ1YwdHlldi9jYWtsRExuZFQv?=
 =?utf-8?B?ZnJFWHJiK3ZNaVBGVmp3a1IrMWVSdFNMcC9zSEswMloxRW9EejRrWDRiSGc0?=
 =?utf-8?B?WWc1VGlCWTR3SEtKMm10Y1czN0ZOY1l1T2dNR09FRFlIdWtMUzlBd2tIVHdW?=
 =?utf-8?B?d2JyU0pIQmZMRHNJY091Y1FwZDdEVWVJM1J1MWxSYTI3SWhVMjVLVE1jMlV5?=
 =?utf-8?B?TWtvV2xPUzkvS2k2dFkvNFVIVXowa3ZYTlBlYXpQbXl4aGZUM2ZjZW9NT1k0?=
 =?utf-8?B?dmVZZ3dNUTNUS3ZmZGZnQnJ4WmY3QWRNWUpUbk5mQTZhL0pTWlVmV3JHVDg1?=
 =?utf-8?Q?26cNQENhZSM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm5nbzZia3o5ek43ZWg5VnFoSEtSTks3UHNsWVQ2SnJ0c2VnZkEzSnpoZDZE?=
 =?utf-8?B?ODhmZHNvYTQvaEVVNE9KTndKNDF0TURxVXhiZ29adWpXRnRkajBmOVBrWjNV?=
 =?utf-8?B?ZTNjU2JKYnovQzNiNHh0QTVvQVJJSFNjRC9wbXBzM0drQ2RwYzdjSU9RMm1n?=
 =?utf-8?B?Ky9Rd2gvZFhmMkwrTWtXbUp3bXlkT3VEaFhpRU52UnppaFBmOWtQYW14T09K?=
 =?utf-8?B?TEhpYnc0Tk5IcnJUZ3BBOUd4MHhRanYvSTBFQ25zcUtQdEs5Q2hPTEhzSVF1?=
 =?utf-8?B?WmdFQkN2MzBlZWJKNUltSkt6WHJGc1BNMkJxNVI4VzRpdTBWMUJUaFYydDdX?=
 =?utf-8?B?eVdOOCtleUE3WnI2T3F3R2dzTGJxMW5GQ3NPQW9DVUJyVUs4SGxPLzBTb2Zi?=
 =?utf-8?B?U3FTRTA0NURaYTlOa3pkNG5nM0Q3bkdPTTc2S1QrNVlIcTJ5RTk5SFZyZXU3?=
 =?utf-8?B?bGhUOFAzdXhKVFpUeHdiOG93VDd6M3Fkc2VVUmVPUklHRUhLcjBldXFWU0lq?=
 =?utf-8?B?NmZHT3JaOFpqWW1pRzUxNkMxOE9xaDRFTWx0eWFxYXdkWEtiT2RmVUNxRnB6?=
 =?utf-8?B?UGhFSEp6b0FZcUJCQ01LYU45eUhQdDZQZWZkaWcwYVBwWlFoSzAyU0NLMTA1?=
 =?utf-8?B?enhtZGpkTGNMdXNDVWRyTHpOSGVJOCtXVUNwbkJLQzdPcVFDYWJuUjBzaXlW?=
 =?utf-8?B?NEMzUFFCMjU0VkF0WXh1M21GdWtzUEVjRS9iK1hmL3lRcWFiLzQ0d3JuZWsx?=
 =?utf-8?B?Qm1NL0ZNclcyTFVWdDhqY2JBQUp4TnNWVzZnbHFLdllwRGpUc3cwUTIyQ1pG?=
 =?utf-8?B?N3pja25ybVlMUDZwcGY1di9ZemtoTG1NSjljcUExZ1VRdGpSQ0thditRbFlR?=
 =?utf-8?B?K3VjdmExd2ZGd0F2eGNhRVo3UmRWK0Y5d0lFdjdTWTd4dzRGQ3NacDhDYUY0?=
 =?utf-8?B?WmpDVVRUWHlWWHF6bkdacUREV3RBODA1b1BiNXJpcUZyUXlSYVhLeTdMcks1?=
 =?utf-8?B?TXBBY1NDdE94NzJsOC91ejNFN2Q3L1B2eW5LdU1ZVndkNndwZ0ZGTHVYV21L?=
 =?utf-8?B?bWtkZUE3eFNha2VrWTJ6TjlXMFlqNXoyTnhpUDhXZlpjSWc5OUZzQkEwcktR?=
 =?utf-8?B?VW5Yd1Zaa3c0VlVHVXE4Nmk2WTBxdUNLcmVQajZEeXVTcFlvQ0YrT1VQajVU?=
 =?utf-8?B?MUgzbFpsK0d5OFVnYUJabmxQbzRhVHp5cWJuQVBuaWUrTjQyejZCMWZVdDlM?=
 =?utf-8?B?ZVp3WEZ6Qm1YY05HbkhxSGdwclZDYlJVYU10bTZQejFnd0hRUUp6TUFTQk5y?=
 =?utf-8?B?U3RkZEtickJOZmdML3dQY1NIbjB2NmlOdE01Q1d2Sm1KTGpYK0xKcG9TQTY0?=
 =?utf-8?B?aWdsR05EU3pvdXlNazFrVzR3Y1VpdWw0dTRwcFJvMC9zSENPL2l0Z3NNeFMx?=
 =?utf-8?B?VnhJWHc1a2VrYXRYSWNHc0picmZIMkFPeWhLYThKWGZzODRMbzRNRjF6ZlVl?=
 =?utf-8?B?SGsrRjliOXd0TlJxVzhGQ2gzSXZGSS9LdUprZGwycGdLV2N2cVVFdlFZSFVU?=
 =?utf-8?B?NndpdUl4UnRSbDVJTDNIN3JkSlRKM0FPQWlYQ20raldxVXpNSEdvWUFyWTlz?=
 =?utf-8?B?RkZ5bm5ySDRJeWhlYWR2VnR5Q20rZ2gzUmNaOFZtR2NrZHl5OW44ZnVwc1Jx?=
 =?utf-8?B?R3ZnN0UxSTR2czJQS0duUlJZRlJleVlJcldQejJXN1J0dFA2YkxsSHRiTnVV?=
 =?utf-8?B?ek1LaE4xVkFEUnJVMkNOUXNDNDRWWUpHMnZYN2FDN2l5WFlFeSsrcGRjVy9q?=
 =?utf-8?B?Q2pUWkxoSkpaa1BsSDc0NmJxV0FtRHBKUmlrNXpLb2pWczBLd0o5V1RNZW5U?=
 =?utf-8?B?V3pxTlpTUUNTWmNtS29qT3l6VTBEcEt5R2R3ZzNrU240K2g4Z1RmZEhkR3oz?=
 =?utf-8?B?WjRqcU1VSEFkRkFIdmxONFUrWm41MjV2dmt3ZVY0UmZESFZ0R0pydUV1WGJK?=
 =?utf-8?B?VkN3TEIzbmNjYkljWTMrOGtIOUgyOFdSNmNWY05lS2NaWWxaLzRyM1VMVjJ0?=
 =?utf-8?B?aSs3enQ1QWE4eHIvb0laY3RqSnVTckV4UEsvY0g2cFVZVXlxeTBERnNpV0Z4?=
 =?utf-8?B?NWZ6dlVtV1ZGVGRENWlDRFpjV1dyclFnOWJTTXZuZklnb2dRbVJ5WnhZRTYw?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b75947fd-b402-4f3f-7c2a-08dda99cb441
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 10:34:26.4253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0Tv/eFbN2przck/NXKcHAbN7zfnN046RKPA8rTPCVlQZSv9vSNgCi2o2xn64zB+VxA9Nd4dKrTSPlRyVjIAqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5013
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


On 12-06-2025 15:16, Riana Tauro wrote:
>
>
> On 6/9/2025 11:43 AM, Karthik Poosa wrote:
>> Prevent the power limit time interval from being overwritten with 0.
>> This issue was due to a missing read and modify of current power limit,
>> before setting a requested mailbox power limit, which is added in this
>> patch.
>
> Maybe prevent other bits from being overwritten or add a rmw version 
> for pcode mailbox
>
> Got confused because of power limit interval being mentioned

I shall rephrase this.

>
>>
>> v2:
>>   - Improve commit message. (Anshuman)
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power 
>> limits though mailbox")
>> ---
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h | 1 +
>>   drivers/gpu/drm/xe/xe_hwmon.c            | 7 +++++--
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> index 5394a1373a6b..ef2bf984723f 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -40,6 +40,7 @@
>>   #define PCU_CR_PACKAGE_RAPL_LIMIT XE_REG(MCHBAR_MIRROR_BASE_SNB + 
>> 0x59a0)
>>   #define   PWR_LIM_VAL                REG_GENMASK(14, 0)
>>   #define   PWR_LIM_EN                REG_BIT(15)
>> +#define   PWR_LIM                REG_GENMASK(15, 0)
>>   #define   PWR_LIM_TIME                REG_GENMASK(23, 17)
>>   #define   PWR_LIM_TIME_X            REG_GENMASK(23, 22)
>>   #define   PWR_LIM_TIME_Y            REG_GENMASK(21, 17)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 0d32e977537c..abb5c3693437 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -377,11 +377,14 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, u32 attr, int channe
>>         reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>>   -    if (hwmon->xe->info.has_mbx_power_limits)
>> +    if (hwmon->xe->info.has_mbx_power_limits) {
>> +        xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &max);
>> +        reg_val = (max & ~PWR_LIM) | reg_val;
> If you re-use this in the future, maybe add a different helper function.
> Looks good for now
>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>
>
>>           ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, 
>> channel, reg_val);
>> -    else
>> +    } else {
>>           reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | 
>> PWR_LIM_VAL,
>>                       reg_val);
>> +    }
>>   unlock:
>>       mutex_unlock(&hwmon->hwmon_lock);
>>       return ret;
>
