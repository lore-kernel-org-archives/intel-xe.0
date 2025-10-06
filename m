Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA0CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AD010E0A8;
	Mon,  6 Oct 2025 15:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5QQ76F6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F45110E0A8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759764193; x=1791300193;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q929nWdRvw1EEA7jrfkTOwKb+oE69pnnH1GHGfwFsYA=;
 b=G5QQ76F6ziBr+W3rf7xmwOSoW3hVJvcoHxHtWnd8jVYeaap622JnrnOV
 NBSzNRGFI4VatK7w4X6oK379uZXJ9cvYHqjImgC2T/4xlsgdcAB1ya94F
 gvJcGbBInyELni63Fj08mFt1BpgU8FLIWm1Z00hUnpa2JjO3/IehwupZv
 spFr1XZzABuh4so3ZLG8rELh3fsWonJOR+pF1Df7mJqqLIfrvjjgrQgOX
 biPQnUdF3J49OMlSF4i3Otc9SQ5+kX+Cu0mvDHgoLWJNrSPvNLOAAi3y+
 UAL188DYx1blFmmKsfNrDNIrOY5tYNvaHk0aPZIicurarwIfxcogicvcz Q==;
X-CSE-ConnectionGUID: H3gOcqBySQODofOQHrow9w==
X-CSE-MsgGUID: ti8YCg3lRvu4Dk7t2k74gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="73292783"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="73292783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:23:01 -0700
X-CSE-ConnectionGUID: sq9d5mTrRciJ7brAs/UKEg==
X-CSE-MsgGUID: R13xbYmRSaq4sevxaoUAbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179840546"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:23:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 08:23:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 08:23:00 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 08:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCoVGTAZewkfhklE+jV8SrAl22hyVStP0r03yAklO21hffxp/527QNjoWC94oTmV3LgexshWfJ1DmuNEvM1ImIqCNgB5R/pY+2fXVN/Rr8bxYYPcyOpCOqTXyzboNY0rgPGwk+vvDcaCcUoFWMPBiM3Vz6YPZvItbB4jvcF0nH9b6gZ/EJf0QbMsBoRKAhm/lI6IlDQOW/byHLaw7wWgfS2g0eI4UcdtvI98ZFm3fthxTkdm++G+QS4BZuOkxXVuDf0dX9Tx+P/52RUIJfWd9t4RNv4JPh57FMFZkVjet2PvfdEyfj3IH4LuGxe5hMQ7tlxw9ZDqjql0/Wewgu3G/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHNCOmWIgFEg53cZL2nKTuEx1gn5qc1QYieVCPlRhJQ=;
 b=GoxZ/nifPYWLf8XLkHcVlHbUrdFoAWnZF/JOCBU7OEQxlvr/5hN6fH2WNLgUxYquX0vewm/aMcdyjZmX1ZeBzu/DcOyc9G55QW7jbStoHw2Vu2TTXI/ePpTrbVfJAdPrLi0qqgzg05UnUbHMMendYMXnyZYjWCwSuYKwzkH05U7Cf3pdDXQ57dvH3KEpZzrNjR8AsBH/C4hJ8sHgWF08HtIFbyy3QfoKEkFK11mi2UsgnkYVdQrPLIQNU9O4BTPN0VtQ8GH8g/4HuAaBQ6lQm2/8Su8u525R82RW2kDS74LXDyzU8CQsmy/L+olH3W82B9m8PmKd6RQlfp9dZbF/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 15:22:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 15:22:58 +0000
Message-ID: <f3f7807e-7968-4a7b-81a2-034786d59c97@intel.com>
Date: Mon, 6 Oct 2025 17:22:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/30] drm/xe: Move queue init before LRC creation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-24-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251006111038.2234860-24-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb313c5-77a4-4593-a4da-08de04ec3b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TiswYVVqY2srSDN4ek8wUUFIWFN1M2pCbDRNVUNWR3ZYT08vRGV0M0ZNdmU3?=
 =?utf-8?B?Qkk0M0MzZDZXUDVTUEttd3ZvYXVWMlkwdW0wTjVNYVlSaVdJMGN6SHQrM1N6?=
 =?utf-8?B?M1VENXJNTHRYZ1QvOEpSR0J6M3Fwb05zbnRhcEtGZVcySFFKN1pCb1FoR1BP?=
 =?utf-8?B?ZXhEVngvYmNnWHFwY0xzWGhMOXhKOHh1aVhrMzRvSWkzK25ocWZScis4Vi85?=
 =?utf-8?B?LzA2WitwREw1M3lhWHFHN0ZaZ0hNd09BL1NOaVZTNjVzTDFCQlVTK0c5MlZB?=
 =?utf-8?B?NXBxa0lUWnU2RFNjNk51dTF2UnZIQkQ4UEp5dEE1RjJiQzJMQjJHSUZXQ1Zj?=
 =?utf-8?B?Z3QyRVdHcUY1alk5NkVzWHpWRVJxWW9KblR3blJERHI3RjljSGlyVGphbEk3?=
 =?utf-8?B?cGxJOEhNRkVmLzBKeUdhSnBvY2YzVytza0cwTytObnRvYnp2U1ozbDhLY0hB?=
 =?utf-8?B?aCtGMGlzdjIvalpaU1J3R0kwOFJtMGV4d2NjQ0d6b2doOGJjVTdSbFhUWXhU?=
 =?utf-8?B?UnhidmlZelBCUDFsWGZ2czdhZjRIRWVvWkQ0eFhQZzZ4ZVhIMnN1di9iRFIv?=
 =?utf-8?B?Q0VXbTl4dUtKb09LR3pkV0REbWRSVmRFTkhtNDdUVWx1TGFVc3U3RVlWS1RZ?=
 =?utf-8?B?c0xKWjRFOGpQakZ5M0pqN3F2bUw1ZURIQjRPSUUzRGZCQWVLYVVtckYxR2o2?=
 =?utf-8?B?cVE4cERFVzNSOTdxcGJMdTVhWTNYTkltRlFrLzNmWTFwbzl2akQyck4rQW05?=
 =?utf-8?B?MG9aL0V1VEpnTlRST3VLaFZYbkRsVTFEeHVnQXZwcXBOaWh6dys5OGoyY2pa?=
 =?utf-8?B?V0RCeDRjTFZ4VGc3Um5ibGFEc3JybzNLV3BFUHdtNmhNaTdaNktPRnlrRjFT?=
 =?utf-8?B?eldHaVNRYWZhcGVuVEVrRVhZWm1wVXVaay96N3RMQzRvRzJJT0syQVBhYVpk?=
 =?utf-8?B?UG9yVFdhanc1aXpyT0IyeE5zQzF6RHJkVVp0L3krdW13K2FIZzFWdzQrM3lN?=
 =?utf-8?B?WW0wN0YwRy9VcXNNQW14TVVTL0NnRUhpaGxkNHY3ZHFTVm1WaitlQUtlZnZJ?=
 =?utf-8?B?WmliVGY3U29ReVo5WjdCSVd5VTVXTmp1dklmdDBFRzNzaEJDVGUxQ0pGK3Ny?=
 =?utf-8?B?eE4yMk11emhEQ2JDVTQ3NnJ2L0pWVWRtTzJJdnJRSi9GOURwYU50aEhhN2M0?=
 =?utf-8?B?ZkY3SllGeEFHQkluOENrempRYVlDNUJ3NTg4dkkrSm42L3Z4TEVZQllMV2I4?=
 =?utf-8?B?bERBWFZxR2RTT2d6amFrVUUvZmhkQVo4NzB6ZkZSS01sNzhBL1FzUzZSLzJq?=
 =?utf-8?B?Z3ltQU42NDdzQU1yc2ZZbEZ5dGxGWTRqeWtrRlZoMzd0MVNuOWxRRERBSmZK?=
 =?utf-8?B?cVNHZXB5RjErL1pqMitpWXd5VWZ6RXh4dEN5TTg0Z20wL3hDZHltRDZnNyto?=
 =?utf-8?B?Um11bC90bHdGclhQbGJUQmlDK0JMZHZPSGFrVzQ3dko4NTltU1BhdXVvdmhq?=
 =?utf-8?B?NWxZeFpjVjVvWHR6ZXFOZzFST0RlNExTOVNpQ1c3NW5MMjBIU3c1Yk00eXJs?=
 =?utf-8?B?UzN3bXJXRHV6UnptN0tZMnV2TEFZcE9wQnFhRUF0YSs2STJpTHNES0NCRjBG?=
 =?utf-8?B?Y3VvRWVpV1B1NE1OWXFNZDJEU3RYS21waFVvQ25Sb2lUb2ZiUG5Fa3kyQ2ZR?=
 =?utf-8?B?aWZaRDlpQlRhcDNsY1pURHB0QXpkMVZhbmhHbjlSR2ppUTdTa0VpWUltUzdk?=
 =?utf-8?B?bWV3RkN3UGZKZjVvVGxMelpISUxCYUtRMGs1ZERwMFFJY0I5aHlxajhTUEdq?=
 =?utf-8?B?Sm1YQzBrVXJnaDdqSm9TQmpjc1ZwbjhBRnc0eEtUazFUSktoQndldVFCNHJa?=
 =?utf-8?B?Ukh0QnZqbzJnWFBRNHhoek1ib2hYc1RSd1BpbnVoM2lXWnd5SzEyMzkwUm9Q?=
 =?utf-8?Q?qApsY2LUoaW7du/BbWMV56crnlx6P+4m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri9BMVFtMGVFMzUzQlRCdWVBalpqZWJuZmxtVW5hL25LcXkwbWdpTmJWb0VR?=
 =?utf-8?B?UjBFVGtsL3lmR01DeTg0SFh5dDNZWEEvd2c0Y3UrY0xoR2g1cGxaeGRiWEpq?=
 =?utf-8?B?OUI1YXpIRElNS3F1UkNTWkhoYUtBREJQTlVSQzJSUTlacnMrMEFwYitweUtE?=
 =?utf-8?B?ZjBUUWJIU2syNGpEa2ZDWklaRXdzcENlL3hzc0FPcGNBdVB5THQ1UWpvcWQy?=
 =?utf-8?B?Qy9yc0IwUEFDR1AzMVhHQUQxbTRhcmNwNXNIWGV3V2lyNWlKZUdCMG1oek03?=
 =?utf-8?B?MXR4ZVNMemVWRXJ5RXV6T2hSSE5LUzVnaWUrYXZ5TVdEZDlqaTgzUGJYcWxo?=
 =?utf-8?B?amNKM0FqTGxOUTR4YjFINmtrY3dhdUhTakwzdXhqQTV1Uk4xenJmUC9wSFFs?=
 =?utf-8?B?YWljM3FPcDBzUjMydWYvaEJFRWZzbWY2eFBDSjkzdmNXV1k1UHdVOTN4VFVP?=
 =?utf-8?B?SjVITlJBUlQ3UlE0Z0hHNFJGYmtGdW55aWExSjYxV1NpbzhVWUcxK1Y0K0ov?=
 =?utf-8?B?c09nQWREbHRwNzFXOWUxeEh1TzNlK3FOZHdOSFhPSWJERG82MGJ1YXh5bG1H?=
 =?utf-8?B?WHhjc2hjN01seGRaMHhORDRjUzY1L253cEVCTURFRERibFZwdndjeUNCUUJa?=
 =?utf-8?B?WVc1eTdtOEIyTGhZVkRObGlkZGN2d2QrWEJza2F0czBSdGRCbE1mZ1ZCbENP?=
 =?utf-8?B?R3FXMTBwQjNYblM5RXpYSFEzb0JtUVhCbW9MeE0rZDhVeWRGZmQxcWNURDdS?=
 =?utf-8?B?ZkVIQytmY3duMXp1R0RFeXNRVkJrZDFrcDdDaEFrYUNXWTF5aElwUDI3SXRh?=
 =?utf-8?B?Q0UwMjJ3WkMvSTJ2aEdPV1JpZDVEZnlLYytFMDAwbTVnalpjdnBBc0YyNTd2?=
 =?utf-8?B?cnlGbWQ1blkwOFp1c0NIaWIweHF1MTF5VzMzVmRGVGJXbDF5Q1B4elhoR3BH?=
 =?utf-8?B?aG4xZDRwVkpVSzlQa3pOOHNBNXNlL2dmWFE2K0JHaGZPcERZRUplNXArT3Nu?=
 =?utf-8?B?YlU2dUtjWEc2QUVNUkx4bUNPaXdmUm55RTdSVnBwZkZrYW1zVm53M05YSVVs?=
 =?utf-8?B?ZGpuczJRK3didkJ6cm11bkNFLzl5SEk0eFgreHBWRGNOek1XR0MxUGVKK0Fn?=
 =?utf-8?B?V1F5N0VobXpxNXhFdHR6RGpoTVhZM1lWWmxwN2c1WXBhNG5mdlZ5OUhucFVG?=
 =?utf-8?B?bkJmRVhKYzlLY0hrWWd5aWRkeEx0OTdzTXlxVWRFanp5RUFxNmhyVWwwa05v?=
 =?utf-8?B?SjNKaFRmaFIwclFXZ0h1QjhnNXQvR2s5OEtXaG5hcUZrT0hSOEFGcDZKbWx5?=
 =?utf-8?B?dElGUVluS0JINGRDM0wwRXhiemNkdzhmQUxEU0txbWk2NTNhOThTYkxTakR4?=
 =?utf-8?B?OGExWTBxQVlVTGdhWHhuQTc2bkV3QkJOb3NHMU4yOGp3NzJEMnFFdTlrQ0JU?=
 =?utf-8?B?OTdEdUpjSFJIV0cyT00yck1USTBMdzQ0L0h2dVZhN0FKcnJJdFRlUWkxUzYz?=
 =?utf-8?B?OWZXQWlmbFRmUmVxU2xUQUVxQ0l5QUhqODBlMjZSRlJPblF5d2JBY1V1R3Ay?=
 =?utf-8?B?bFpFSnYwMVJuaGhTektQNFNzSTVkeGtkbGRrcjFMZHplaE45OUFmVVMrV0la?=
 =?utf-8?B?Vmh2aFdQWklJTjFycUFBaGlBeGJOeUdPUWpyS2FyQmk2UkJNcU1IUHppbnBX?=
 =?utf-8?B?Rm05SFVWQWgvaGE5d0hxTEVuL0YrMnBBdHNSOXZZWWtKNll0MUZOUTE2b2RX?=
 =?utf-8?B?dkpLam5xS0NlNlFBU2pJN01WaUlrQTQ5ZkdiQXVmSDExekRWeTA1YkpLenJ3?=
 =?utf-8?B?Z0pDZytWL0ZMSEtwUFJCZUFxcWUxQ3dEaTZuQTJvbVRIUlBjUFJsdklVMnNH?=
 =?utf-8?B?ajdpUG9jS2ZNVWR4S2JFMmFKdUZpSjZwcGZwK0lwVWJ5WkNUb0k4d1hYOFdH?=
 =?utf-8?B?NzRNUW1BclAxY2R5K3BPc1FJUXpLcXVvMkUrK1hWT01hajZibko2RndZdmk1?=
 =?utf-8?B?RDJwZ1UveFR2Q1VNL3N2M3JTLzRXQTZLTDVRZXVFNTJOWnlvckx3aHY3YSs5?=
 =?utf-8?B?YzRjYmUrc1JmZnpNbEZrUlZKbDhzUjNFV2EvQkZ0Ny9lSkNPTEVPL05lSTRq?=
 =?utf-8?B?SU5UTmRmeDVqbS9GTEc3NHZGZFNva2Z0RG5ELzlVQkNUbDB3SUVPR0c2OS9Y?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb313c5-77a4-4593-a4da-08de04ec3b0c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 15:22:58.5038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhu5f/NXXuCEAPr/61sfxTZ9iRmb5cdnzT0KBu9I2P2+QdIzZazo3u9hNPAV5ECNPTvVFirnonq67dNlAcph8V4QmTQAvomooOCoiRwyiYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
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



On 10/6/2025 1:10 PM, Matthew Brost wrote:
> A queue must be in the submission backend's tracking state before the
> LRC is created to avoid a race condition where the LRC's GGTT addresses
> are not properly fixed up during VF post-migration recovery.
> 
> Move the queue initialization—which adds the queue to the submission
> backend's tracking state—before LRC creation.
> 
> v2:
>  - Wait on VF GGTT fixes before creating LRC (testing)
> v5:
>  - Adjust comment in code (Tomasz)
>  - Reduce race window
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c        | 45 ++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.h               | 10 +++++
>  7 files changed, 92 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7621089a47fe..90cbc95f8e2e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -15,6 +15,7 @@
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
> @@ -205,17 +206,34 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>  		flags |= XE_LRC_CREATE_USER_CTX;
>  
> +	err = q->ops->init(q);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * This must occur after q->ops->init to avoid race conditions during VF
> +	 * post-migration recovery, as the fixups for the LRC GGTT addresses
> +	 * depend on the queue being present in the backend tracking structure.
> +	 *
> +	 * In addition to above, we must wait on inflight GGTT changes to avoid
> +	 * writing out stale values here. Such wait provides a solid solution
> +	 * (without a race) only if the function can detect migration instantly
> +	 * from the moment vCPU resumes execution.
> +	 */
>  	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> -		if (IS_ERR(q->lrc[i])) {
> -			err = PTR_ERR(q->lrc[i]);
> +		struct xe_lrc *lrc;
> +
> +		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> +		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
> +				    q->msix_vec, flags);
> +		if (IS_ERR(lrc)) {
> +			err = PTR_ERR(lrc);
>  			goto err_lrc;
>  		}
> -	}
>  
> -	err = q->ops->init(q);
> -	if (err)
> -		goto err_lrc;
> +		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> +		WRITE_ONCE(q->lrc[i], lrc);
> +	}
>  
>  	return 0;
>  
> @@ -1121,9 +1139,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>  	int err = 0;
>  
>  	for (i = 0; i < q->width; ++i) {
> -		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
> -		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> -		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
> +		struct xe_lrc *lrc;
> +
> +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> +		lrc = READ_ONCE(q->lrc[i]);
> +		if (!lrc)
> +			continue;
> +
> +		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> +		xe_lrc_update_hwctx_regs_with_address(lrc);
> +		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>  		if (err)
>  			break;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index f83d421ac9d3..769d05517f93 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  	const struct drm_sched_init_args args = {
>  		.ops = &drm_sched_ops,
>  		.num_rqs = 1,
> -		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> +		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
>  		.hang_limit = XE_SCHED_HANG_LIMIT,
>  		.timeout = XE_SCHED_JOB_TIMEOUT,
>  		.name = q->hwe->name,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 8074ffb924ce..bf1806e90370 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -487,6 +487,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>  				 shift, config->ggtt_base);
>  		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>  	}
> +
> +	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> +	smp_wmb();	/* Ensure above write visible before wake */
> +	wake_up_all(&gt->sriov.vf.migration.wq);
> +
>  out:
>  	if (recovery)
>  		mutex_unlock(&ggtt->lock);
> @@ -745,7 +750,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  	    !gt->sriov.vf.migration.recovery_teardown) {
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> -		smp_wmb();	/* Ensure above write visable before wake */
> +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> +		smp_wmb();	/* Ensure above writes visable before wake */
>  
>  		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>  
> @@ -1264,6 +1270,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>  	gt->sriov.vf.migration.scratch = buf;
>  	spin_lock_init(&gt->sriov.vf.migration.lock);
>  	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> +	init_waitqueue_head(&gt->sriov.vf.migration.wq);
>  
>  	return 0;
>  }
> @@ -1312,3 +1319,33 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
>  
>  	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>  }
> +
> +static bool vf_valid_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (xe_memirq_guc_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> +	    READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> + * @gt: the &xe_gt
> + */
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
> +	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> +					       vf_valid_ggtt(gt),
> +					       HZ * 5);
> +	XE_WARN_ON(!ret);

use gt-oriented warn:

	xe_gt_WARN_ON(gt, !ret);

> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 8c9679414565..63102029d624 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -38,4 +38,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>  
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index c1bd6fdd9ab1..f0bc45a782a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/rwsem.h>
>  #include <linux/types.h>
> +#include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include "xe_uc_fw_types.h"
>  
> @@ -50,6 +51,8 @@ struct xe_gt_sriov_vf_migration {
>  	struct work_struct worker;
>  	/** @lock: Protects recovery_queued, teardown */
>  	spinlock_t lock;
> +	/** @wq: wait queue for migration fixes */
> +	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
>  	/** @recovery_teardown: VF post migration recovery is being torn down */
> @@ -58,6 +61,8 @@ struct xe_gt_sriov_vf_migration {
>  	bool recovery_queued;
>  	/** @recovery_inprogress: VF post migration recovery in progress */
>  	bool recovery_inprogress;
> +	/** @ggtt_need_fixes: VF GGTT needs fixes */
> +	bool ggtt_need_fixes;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9dbdb0b54c8b..48d5133e76a6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1663,7 +1663,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> +			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 21a3daab0154..c4a33b135101 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -76,6 +76,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
>  	kref_put(&lrc->refcount, xe_lrc_destroy);
>  }
>  
> +/**
> + * xe_lrc_ring_size() - Xe LRC ring size
> + *
> + * Return: Size of LRC size
> + */
> +static inline size_t xe_lrc_ring_size(void)
> +{
> +	return SZ_16K;
> +}
> +
>  size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc);

